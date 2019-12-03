Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE1CB110287
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Dec 2019 17:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfLCQjU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Dec 2019 11:39:20 -0500
Received: from mga03.intel.com ([134.134.136.65]:34162 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbfLCQjU (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 3 Dec 2019 11:39:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 08:39:20 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; 
   d="scan'208";a="201058445"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 08:39:18 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 03/12] video: fbdev: nvidia: modify the static fb_ops directly
Date:   Tue,  3 Dec 2019 18:38:45 +0200
Message-Id: <9639e2305fd4d03311bf909b8914277b221ca582.1575390740.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575390740.git.jani.nikula@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Avoid modifying the fb_ops via info->fbops to let us make the pointer
const in the future.

Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/video/fbdev/nvidia/nvidia.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index fbeeed5afe35..c583c018304d 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -607,6 +607,8 @@ static int nvidiafb_cursor(struct fb_info *info, struct fb_cursor *cursor)
 	return 0;
 }
 
+static struct fb_ops nvidia_fb_ops;
+
 static int nvidiafb_set_par(struct fb_info *info)
 {
 	struct nvidia_par *par = info->par;
@@ -660,19 +662,19 @@ static int nvidiafb_set_par(struct fb_info *info)
 	info->fix.line_length = (info->var.xres_virtual *
 				 info->var.bits_per_pixel) >> 3;
 	if (info->var.accel_flags) {
-		info->fbops->fb_imageblit = nvidiafb_imageblit;
-		info->fbops->fb_fillrect = nvidiafb_fillrect;
-		info->fbops->fb_copyarea = nvidiafb_copyarea;
-		info->fbops->fb_sync = nvidiafb_sync;
+		nvidia_fb_ops.fb_imageblit = nvidiafb_imageblit;
+		nvidia_fb_ops.fb_fillrect = nvidiafb_fillrect;
+		nvidia_fb_ops.fb_copyarea = nvidiafb_copyarea;
+		nvidia_fb_ops.fb_sync = nvidiafb_sync;
 		info->pixmap.scan_align = 4;
 		info->flags &= ~FBINFO_HWACCEL_DISABLED;
 		info->flags |= FBINFO_READS_FAST;
 		NVResetGraphics(info);
 	} else {
-		info->fbops->fb_imageblit = cfb_imageblit;
-		info->fbops->fb_fillrect = cfb_fillrect;
-		info->fbops->fb_copyarea = cfb_copyarea;
-		info->fbops->fb_sync = NULL;
+		nvidia_fb_ops.fb_imageblit = cfb_imageblit;
+		nvidia_fb_ops.fb_fillrect = cfb_fillrect;
+		nvidia_fb_ops.fb_copyarea = cfb_copyarea;
+		nvidia_fb_ops.fb_sync = NULL;
 		info->pixmap.scan_align = 1;
 		info->flags |= FBINFO_HWACCEL_DISABLED;
 		info->flags &= ~FBINFO_READS_FAST;
@@ -1165,7 +1167,7 @@ static int nvidia_set_fbinfo(struct fb_info *info)
 	info->pixmap.flags = FB_PIXMAP_SYSTEM;
 
 	if (!hwcur)
-	    info->fbops->fb_cursor = NULL;
+	    nvidia_fb_ops.fb_cursor = NULL;
 
 	info->var.accel_flags = (!noaccel);
 
-- 
2.20.1

