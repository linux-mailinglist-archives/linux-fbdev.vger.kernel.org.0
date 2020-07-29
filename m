Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0AF231F71
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Jul 2020 15:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgG2Nly (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 29 Jul 2020 09:41:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:52518 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgG2Nly (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 29 Jul 2020 09:41:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 0864DAF3B;
        Wed, 29 Jul 2020 13:42:04 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
        kraxel@redhat.com, b.zolnierkie@samsung.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        jani.nikula@intel.com, peda@axentia.se, dan.carpenter@oracle.com,
        natechancellor@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/5] fbdev/core: Export framebuffer read and write code as cfb_ function
Date:   Wed, 29 Jul 2020 15:41:45 +0200
Message-Id: <20200729134148.6855-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729134148.6855-1-tzimmermann@suse.de>
References: <20200729134148.6855-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

DRM fb helpers require read and write functions for framebuffer
memory. Export the existing code from fbdev.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbmem.c | 53 ++++++++++++++++++++++----------
 include/linux/fb.h               |  5 +++
 2 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index dd0ccf35f7b7..b496ff90db3e 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -759,25 +759,18 @@ static struct fb_info *file_fb_info(struct file *file)
 	return info;
 }
 
-static ssize_t
-fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count,
+		    loff_t *ppos)
 {
 	unsigned long p = *ppos;
-	struct fb_info *info = file_fb_info(file);
 	u8 *buffer, *dst;
 	u8 __iomem *src;
 	int c, cnt = 0, err = 0;
 	unsigned long total_size;
 
-	if (!info || ! info->screen_base)
-		return -ENODEV;
-
 	if (info->state != FBINFO_STATE_RUNNING)
 		return -EPERM;
 
-	if (info->fbops->fb_read)
-		return info->fbops->fb_read(info, buf, count, ppos);
-
 	total_size = info->screen_size;
 
 	if (total_size == 0)
@@ -823,16 +816,12 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 
 	return (err) ? err : cnt;
 }
+EXPORT_SYMBOL(fb_cfb_read);
 
 static ssize_t
-fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
+fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 {
-	unsigned long p = *ppos;
 	struct fb_info *info = file_fb_info(file);
-	u8 *buffer, *src;
-	u8 __iomem *dst;
-	int c, cnt = 0, err = 0;
-	unsigned long total_size;
 
 	if (!info || !info->screen_base)
 		return -ENODEV;
@@ -840,8 +829,20 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 	if (info->state != FBINFO_STATE_RUNNING)
 		return -EPERM;
 
-	if (info->fbops->fb_write)
-		return info->fbops->fb_write(info, buf, count, ppos);
+	if (info->fbops->fb_read)
+		return info->fbops->fb_read(info, buf, count, ppos);
+	else
+		return fb_cfb_read(info, buf, count, ppos);
+}
+
+ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
+		     size_t count, loff_t *ppos)
+{
+	unsigned long p = *ppos;
+	u8 *buffer, *src;
+	u8 __iomem *dst;
+	int c, cnt = 0, err = 0;
+	unsigned long total_size;
 
 	total_size = info->screen_size;
 
@@ -895,6 +896,24 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 
 	return (cnt) ? cnt : err;
 }
+EXPORT_SYMBOL(fb_cfb_write);
+
+static ssize_t
+fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
+{
+	struct fb_info *info = file_fb_info(file);
+
+	if (!info || !info->screen_base)
+		return -ENODEV;
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return -EPERM;
+
+	if (info->fbops->fb_write)
+		return info->fbops->fb_write(info, buf, count, ppos);
+	else
+		return fb_cfb_write(info, buf, count, ppos);
+}
 
 int
 fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var)
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 714187bc13ac..12ad83963db5 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -593,6 +593,11 @@ extern int fb_blank(struct fb_info *info, int blank);
 extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
 extern void cfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
 extern void cfb_imageblit(struct fb_info *info, const struct fb_image *image);
+extern ssize_t fb_cfb_read(struct fb_info *info, char __user *buf,
+			   size_t count, loff_t *ppos);
+extern ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
+			    size_t count, loff_t *ppos);
+
 /*
  * Drawing operations where framebuffer is in system RAM
  */
-- 
2.27.0

