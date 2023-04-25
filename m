Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA6F96EE3EF
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Apr 2023 16:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234040AbjDYO24 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 25 Apr 2023 10:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233600AbjDYO2x (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 25 Apr 2023 10:28:53 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2FFAF0C
        for <linux-fbdev@vger.kernel.org>; Tue, 25 Apr 2023 07:28:51 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 854021FDA9;
        Tue, 25 Apr 2023 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1682432930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O+prle1b5f4r4XO9JWqYB++7CsiAryAHuerd/T6JVVI=;
        b=iAqAOr7FGTvk2REe4oGo2F1ICiDc+Sq2RWlyR3vggWIvndJM5z8j3cWGBBqivKGLa9qUOw
        or41QHgS4TPmOh7xxOHTFsRiR1qJnQu5WjycHqG8+YHPtM7r9WTYQmwBSfKSJBUQx8PvTI
        zFzsLi/RbwDjH0bRsQ70u0i7lWYQhuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1682432930;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O+prle1b5f4r4XO9JWqYB++7CsiAryAHuerd/T6JVVI=;
        b=IvYdpDJ7GzhZ17QqMCScidtaWZD1XDc9WRF5DY7PG3oonZuI+LqwgYyVDLC2/fIidkkGX3
        49jsjcxeMThgMyBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33CD113920;
        Tue, 25 Apr 2023 14:28:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 4PmrC6LjR2ReOgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 25 Apr 2023 14:28:50 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com,
        deller@gmx.de, geert@linux-m68k.org, sudipm.mukherjee@gmail.com,
        teddy.wang@siliconmotion.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/6] fbdev: Move CFB read and write code into helper functions
Date:   Tue, 25 Apr 2023 16:28:45 +0200
Message-Id: <20230425142846.730-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425142846.730-1-tzimmermann@suse.de>
References: <20230425142846.730-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Move the existing CFB read and write code for I/O memory into
the new helpers fb_cfb_read() and fb_cfb_write(). Make them the
default fp_ops. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/Makefile      |   2 +-
 drivers/video/fbdev/core/fb_cfb_fops.c | 126 +++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c       | 113 +---------------------
 include/linux/fb.h                     |  10 ++
 4 files changed, 139 insertions(+), 112 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_cfb_fops.c

diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index 08fabce76b74..cb7534a80305 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -2,7 +2,7 @@
 obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
 obj-$(CONFIG_FB)                  += fb.o
 fb-y                              := fbmem.o fbmon.o fbcmap.o fbsysfs.o \
-                                     modedb.o fbcvt.o fb_cmdline.o
+                                     modedb.o fbcvt.o fb_cmdline.o fb_cfb_fops.o
 fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
 
 ifeq ($(CONFIG_FRAMEBUFFER_CONSOLE),y)
diff --git a/drivers/video/fbdev/core/fb_cfb_fops.c b/drivers/video/fbdev/core/fb_cfb_fops.c
new file mode 100644
index 000000000000..f6000166eda4
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_cfb_fops.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/fb.h>
+#include <linux/module.h>
+#include <linux/uaccess.h>
+
+ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count, loff_t *ppos)
+{
+	unsigned long p = *ppos;
+	u8 *buffer, *dst;
+	u8 __iomem *src;
+	int c, cnt = 0, err = 0;
+	unsigned long total_size;
+
+	if (!info->screen_base)
+		return -ENODEV;
+
+	total_size = info->screen_size;
+
+	if (total_size == 0)
+		total_size = info->fix.smem_len;
+
+	if (p >= total_size)
+		return 0;
+
+	if (count >= total_size)
+		count = total_size;
+
+	if (count + p > total_size)
+		count = total_size - p;
+
+	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	src = (u8 __iomem *)(info->screen_base + p);
+
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
+	while (count) {
+		c  = (count > PAGE_SIZE) ? PAGE_SIZE : count;
+		dst = buffer;
+		fb_memcpy_fromfb(dst, src, c);
+		dst += c;
+		src += c;
+
+		if (copy_to_user(buf, buffer, c)) {
+			err = -EFAULT;
+			break;
+		}
+		*ppos += c;
+		buf += c;
+		cnt += c;
+		count -= c;
+	}
+
+	kfree(buffer);
+
+	return cnt ? cnt : err;
+}
+EXPORT_SYMBOL(fb_cfb_read);
+
+ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf, size_t count, loff_t *ppos)
+{
+	unsigned long p = *ppos;
+	u8 *buffer, *src;
+	u8 __iomem *dst;
+	int c, cnt = 0, err = 0;
+	unsigned long total_size;
+
+	if (!info->screen_base)
+		return -ENODEV;
+
+	total_size = info->screen_size;
+
+	if (total_size == 0)
+		total_size = info->fix.smem_len;
+
+	if (p > total_size)
+		return -EFBIG;
+
+	if (count > total_size) {
+		err = -EFBIG;
+		count = total_size;
+	}
+
+	if (count + p > total_size) {
+		if (!err)
+			err = -ENOSPC;
+
+		count = total_size - p;
+	}
+
+	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	dst = (u8 __iomem *)(info->screen_base + p);
+
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
+	while (count) {
+		c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
+		src = buffer;
+
+		if (copy_from_user(src, buf, c)) {
+			err = -EFAULT;
+			break;
+		}
+
+		fb_memcpy_tofb(dst, src, c);
+		dst += c;
+		src += c;
+		*ppos += c;
+		buf += c;
+		cnt += c;
+		count -= c;
+	}
+
+	kfree(buffer);
+
+	return (cnt) ? cnt : err;
+}
+EXPORT_SYMBOL(fb_cfb_write);
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index b993bb97058f..be6c75f3dfd0 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -761,12 +761,7 @@ static struct fb_info *file_fb_info(struct file *file)
 static ssize_t
 fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 {
-	unsigned long p = *ppos;
 	struct fb_info *info = file_fb_info(file);
-	u8 *buffer, *dst;
-	u8 __iomem *src;
-	int c, cnt = 0, err = 0;
-	unsigned long total_size;
 
 	if (!info)
 		return -ENODEV;
@@ -777,64 +772,13 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 	if (info->fbops->fb_read)
 		return info->fbops->fb_read(info, buf, count, ppos);
 
-	if (!info->screen_base)
-		return -ENODEV;
-
-	total_size = info->screen_size;
-
-	if (total_size == 0)
-		total_size = info->fix.smem_len;
-
-	if (p >= total_size)
-		return 0;
-
-	if (count >= total_size)
-		count = total_size;
-
-	if (count + p > total_size)
-		count = total_size - p;
-
-	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count,
-			 GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
-	src = (u8 __iomem *) (info->screen_base + p);
-
-	if (info->fbops->fb_sync)
-		info->fbops->fb_sync(info);
-
-	while (count) {
-		c  = (count > PAGE_SIZE) ? PAGE_SIZE : count;
-		dst = buffer;
-		fb_memcpy_fromfb(dst, src, c);
-		dst += c;
-		src += c;
-
-		if (copy_to_user(buf, buffer, c)) {
-			err = -EFAULT;
-			break;
-		}
-		*ppos += c;
-		buf += c;
-		cnt += c;
-		count -= c;
-	}
-
-	kfree(buffer);
-
-	return cnt ? cnt : err;
+	return fb_cfb_read(info, buf, count, ppos);
 }
 
 static ssize_t
 fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 {
-	unsigned long p = *ppos;
 	struct fb_info *info = file_fb_info(file);
-	u8 *buffer, *src;
-	u8 __iomem *dst;
-	int c, cnt = 0, err = 0;
-	unsigned long total_size;
 
 	if (!info)
 		return -ENODEV;
@@ -845,60 +789,7 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 	if (info->fbops->fb_write)
 		return info->fbops->fb_write(info, buf, count, ppos);
 
-	if (!info->screen_base)
-		return -ENODEV;
-
-	total_size = info->screen_size;
-
-	if (total_size == 0)
-		total_size = info->fix.smem_len;
-
-	if (p > total_size)
-		return -EFBIG;
-
-	if (count > total_size) {
-		err = -EFBIG;
-		count = total_size;
-	}
-
-	if (count + p > total_size) {
-		if (!err)
-			err = -ENOSPC;
-
-		count = total_size - p;
-	}
-
-	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count,
-			 GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
-	dst = (u8 __iomem *) (info->screen_base + p);
-
-	if (info->fbops->fb_sync)
-		info->fbops->fb_sync(info);
-
-	while (count) {
-		c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
-		src = buffer;
-
-		if (copy_from_user(src, buf, c)) {
-			err = -EFAULT;
-			break;
-		}
-
-		fb_memcpy_tofb(dst, src, c);
-		dst += c;
-		src += c;
-		*ppos += c;
-		buf += c;
-		cnt += c;
-		count -= c;
-	}
-
-	kfree(buffer);
-
-	return (cnt) ? cnt : err;
+	return fb_cfb_write(info, buf, count, ppos);
 }
 
 int
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 08cb47da71f8..3b1644c79973 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -576,9 +576,19 @@ struct fb_info {
 extern int fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var);
 extern int fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var);
 extern int fb_blank(struct fb_info *info, int blank);
+
+/*
+ * Drawing operations where framebuffer is in video RAM
+ */
+
 extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
 extern void cfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
 extern void cfb_imageblit(struct fb_info *info, const struct fb_image *image);
+extern ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count,
+			   loff_t *ppos);
+extern ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
+			    size_t count, loff_t *ppos);
+
 /*
  * Drawing operations where framebuffer is in system RAM
  */
-- 
2.40.0

