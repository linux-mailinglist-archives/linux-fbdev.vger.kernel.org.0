Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2089210D3FE
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 11:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbfK2KaL (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 05:30:11 -0500
Received: from mga14.intel.com ([192.55.52.115]:40601 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbfK2KaL (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 05:30:11 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:30:11 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; 
   d="scan'208";a="212283011"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:30:07 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
        ville.syrjala@linux.intel.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 02/14] drm/fb-helper: don't preserve fb_ops across deferred IO use
Date:   Fri, 29 Nov 2019 12:29:32 +0200
Message-Id: <1eae0b23d4724d5702b886b6a061ec8219eb9284.1575022735.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Deferred IO now preserves the fb_ops.

v2: Remove the no-op vfree, drop a local var  (Noralf)

Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 0c088ea70ad0..1751bb9ee8d8 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1954,7 +1954,6 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
 static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
 {
 	struct fb_info *fbi = fb_helper->fbdev;
-	struct fb_ops *fbops = NULL;
 	void *shadow = NULL;
 
 	if (!fb_helper->dev)
@@ -1963,15 +1962,11 @@ static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
 	if (fbi && fbi->fbdefio) {
 		fb_deferred_io_cleanup(fbi);
 		shadow = fbi->screen_buffer;
-		fbops = fbi->fbops;
 	}
 
 	drm_fb_helper_fini(fb_helper);
 
-	if (shadow) {
-		vfree(shadow);
-		kfree(fbops);
-	}
+	vfree(shadow);
 
 	drm_client_framebuffer_delete(fb_helper->buffer);
 }
@@ -2062,24 +2057,10 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
 
 	if (drm_fbdev_use_shadow_fb(fb_helper)) {
-		struct fb_ops *fbops;
-		void *shadow;
-
-		/*
-		 * fb_deferred_io_cleanup() clears &fbops->fb_mmap so a per
-		 * instance version is necessary.
-		 */
-		fbops = kzalloc(sizeof(*fbops), GFP_KERNEL);
-		shadow = vzalloc(fbi->screen_size);
-		if (!fbops || !shadow) {
-			kfree(fbops);
-			vfree(shadow);
+		fbi->screen_buffer = vzalloc(fbi->screen_size);
+		if (!fbi->screen_buffer)
 			return -ENOMEM;
-		}
 
-		*fbops = *fbi->fbops;
-		fbi->fbops = fbops;
-		fbi->screen_buffer = shadow;
 		fbi->fbdefio = &drm_fbdev_defio;
 
 		fb_deferred_io_init(fbi);
-- 
2.20.1

