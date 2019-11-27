Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46FE110B350
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Nov 2019 17:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbfK0Qcu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Nov 2019 11:32:50 -0500
Received: from mga06.intel.com ([134.134.136.31]:6369 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfK0Qct (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Nov 2019 11:32:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:32:49 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; 
   d="scan'208";a="211806937"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:32:46 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     ville.syrjala@linux.intel.com, intel-gfx@lists.freedesktop.org,
        jani.nikula@intel.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 02/13] drm/fb-helper: don't preserve fb_ops across deferred IO use
Date:   Wed, 27 Nov 2019 18:31:58 +0200
Message-Id: <e2b1685703878612093a37189d37685303fa15e9.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Deferred IO now preserves the fb_ops.

Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 0c088ea70ad0..a5a2a538d085 100644
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
@@ -2062,23 +2057,14 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
 
 	if (drm_fbdev_use_shadow_fb(fb_helper)) {
-		struct fb_ops *fbops;
 		void *shadow;
 
-		/*
-		 * fb_deferred_io_cleanup() clears &fbops->fb_mmap so a per
-		 * instance version is necessary.
-		 */
-		fbops = kzalloc(sizeof(*fbops), GFP_KERNEL);
 		shadow = vzalloc(fbi->screen_size);
-		if (!fbops || !shadow) {
-			kfree(fbops);
+		if (!shadow) {
 			vfree(shadow);
 			return -ENOMEM;
 		}
 
-		*fbops = *fbi->fbops;
-		fbi->fbops = fbops;
 		fbi->screen_buffer = shadow;
 		fbi->fbdefio = &drm_fbdev_defio;
 
-- 
2.20.1

