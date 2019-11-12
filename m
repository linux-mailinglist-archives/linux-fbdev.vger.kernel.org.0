Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F105F9163
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Nov 2019 15:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfKLOEg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 12 Nov 2019 09:04:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:43964 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727324AbfKLOEg (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 12 Nov 2019 09:04:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 9A06BB2DB;
        Tue, 12 Nov 2019 14:04:35 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
        b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
        sam@ravnborg.org, emil.velikov@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 5/5] fbdev: Unexport unlink_framebuffer()
Date:   Tue, 12 Nov 2019 15:04:31 +0100
Message-Id: <20191112140431.7895-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191112140431.7895-1-tzimmermann@suse.de>
References: <20191112140431.7895-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

There are no external callers of unlink_framebuffer() left. Make the
function an internal interface.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbmem.c | 3 +--
 include/linux/fb.h               | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 95c32952fa8a..86b06a599f96 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1673,7 +1673,7 @@ static void unbind_console(struct fb_info *fb_info)
 	console_unlock();
 }
 
-void unlink_framebuffer(struct fb_info *fb_info)
+static void unlink_framebuffer(struct fb_info *fb_info)
 {
 	int i;
 
@@ -1692,7 +1692,6 @@ void unlink_framebuffer(struct fb_info *fb_info)
 
 	fb_info->dev = NULL;
 }
-EXPORT_SYMBOL(unlink_framebuffer);
 
 static void do_unregister_framebuffer(struct fb_info *fb_info)
 {
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 41e0069eca0a..a6ad528990de 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -606,7 +606,6 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 /* drivers/video/fbmem.c */
 extern int register_framebuffer(struct fb_info *fb_info);
 extern void unregister_framebuffer(struct fb_info *fb_info);
-extern void unlink_framebuffer(struct fb_info *fb_info);
 extern int remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 					       const char *name);
 extern int remove_conflicting_framebuffers(struct apertures_struct *a,
-- 
2.23.0

