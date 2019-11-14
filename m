Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 339E7FC68E
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 Nov 2019 13:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfKNMvM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 14 Nov 2019 07:51:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:60174 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726330AbfKNMvM (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 14 Nov 2019 07:51:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 10E55AC90;
        Thu, 14 Nov 2019 12:51:09 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
        b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
        sam@ravnborg.org, emil.velikov@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 2/3] drm/fb-helper: Remove drm_fb_helper_unlink_fbi()
Date:   Thu, 14 Nov 2019 13:51:05 +0100
Message-Id: <20191114125106.28347-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114125106.28347-1-tzimmermann@suse.de>
References: <20191114125106.28347-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

There are no callers of drm_fb_helper_unlink_fbi() left. Remove the
function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_fb_helper.c | 16 +---------------
 include/drm/drm_fb_helper.h     |  6 ------
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 1038a2f0639e..eb97f34a15ea 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -563,8 +563,7 @@ EXPORT_SYMBOL(drm_fb_helper_unregister_fbi);
  * drm_fb_helper_fini - finialize a &struct drm_fb_helper
  * @fb_helper: driver-allocated fbdev helper, can be NULL
  *
- * This cleans up all remaining resources associated with @fb_helper. Must be
- * called after drm_fb_helper_unlink_fbi() was called.
+ * This cleans up all remaining resources associated with @fb_helper.
  */
 void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 {
@@ -604,19 +603,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 }
 EXPORT_SYMBOL(drm_fb_helper_fini);
 
-/**
- * drm_fb_helper_unlink_fbi - wrapper around unlink_framebuffer
- * @fb_helper: driver-allocated fbdev helper, can be NULL
- *
- * A wrapper around unlink_framebuffer implemented by fbdev core
- */
-void drm_fb_helper_unlink_fbi(struct drm_fb_helper *fb_helper)
-{
-	if (fb_helper && fb_helper->fbdev)
-		unlink_framebuffer(fb_helper->fbdev);
-}
-EXPORT_SYMBOL(drm_fb_helper_unlink_fbi);
-
 static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
 {
 	struct drm_device *dev = fb_helper->dev;
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index e3a75ff07390..1c2e0c3cf857 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -231,8 +231,6 @@ void drm_fb_helper_fill_info(struct fb_info *info,
 			     struct drm_fb_helper *fb_helper,
 			     struct drm_fb_helper_surface_size *sizes);
 
-void drm_fb_helper_unlink_fbi(struct drm_fb_helper *fb_helper);
-
 void drm_fb_helper_deferred_io(struct fb_info *info,
 			       struct list_head *pagelist);
 
@@ -356,10 +354,6 @@ static inline int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 	return 0;
 }
 
-static inline void drm_fb_helper_unlink_fbi(struct drm_fb_helper *fb_helper)
-{
-}
-
 static inline void drm_fb_helper_deferred_io(struct fb_info *info,
 					     struct list_head *pagelist)
 {
-- 
2.23.0

