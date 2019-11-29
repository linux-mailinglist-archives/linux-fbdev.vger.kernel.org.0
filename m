Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4EDE10D408
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 11:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbfK2Kac (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 05:30:32 -0500
Received: from mga05.intel.com ([192.55.52.43]:30498 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbfK2Kac (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 05:30:32 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:30:31 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; 
   d="scan'208";a="212249328"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:30:28 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
        ville.syrjala@linux.intel.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 05/14] video: fbdev: vesafb: modify the static fb_ops directly
Date:   Fri, 29 Nov 2019 12:29:35 +0200
Message-Id: <9e34c1d9a81690cbd75af7969fc4baf60a64b13f.1575022735.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/video/fbdev/vesafb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index d9c08f6c2155..a1fe24ea869b 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -447,15 +447,15 @@ static int vesafb_probe(struct platform_device *dev)
 	       vesafb_fix.smem_start, info->screen_base,
 	       size_remap/1024, size_total/1024);
 
+	if (!ypan)
+		vesafb_ops.fb_pan_display = NULL;
+
 	info->fbops = &vesafb_ops;
 	info->var = vesafb_defined;
 	info->fix = vesafb_fix;
 	info->flags = FBINFO_FLAG_DEFAULT | FBINFO_MISC_FIRMWARE |
 		(ypan ? FBINFO_HWACCEL_YPAN : 0);
 
-	if (!ypan)
-		info->fbops->fb_pan_display = NULL;
-
 	if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
 		err = -ENOMEM;
 		goto err;
-- 
2.20.1

