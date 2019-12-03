Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8571611028A
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Dec 2019 17:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfLCQj1 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Dec 2019 11:39:27 -0500
Received: from mga02.intel.com ([134.134.136.20]:45621 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727048AbfLCQj1 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 3 Dec 2019 11:39:27 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 08:39:26 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; 
   d="scan'208";a="213469188"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 08:39:23 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 04/12] video: fbdev: uvesafb: modify the static fb_ops directly
Date:   Tue,  3 Dec 2019 18:38:46 +0200
Message-Id: <af63cda5de9fee3acd28e7d264f920338298bc0a.1575390740.git.jani.nikula@intel.com>
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
 drivers/video/fbdev/uvesafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 439565cae7ab..53d08d1b56f5 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1440,7 +1440,7 @@ static void uvesafb_init_info(struct fb_info *info, struct vbe_mode_ib *mode)
 
 	/* Disable blanking if the user requested so. */
 	if (!blank)
-		info->fbops->fb_blank = NULL;
+		uvesafb_ops.fb_blank = NULL;
 
 	/*
 	 * Find out how much IO memory is required for the mode with
@@ -1510,7 +1510,7 @@ static void uvesafb_init_info(struct fb_info *info, struct vbe_mode_ib *mode)
 			(par->ypan ? FBINFO_HWACCEL_YPAN : 0);
 
 	if (!par->ypan)
-		info->fbops->fb_pan_display = NULL;
+		uvesafb_ops.fb_pan_display = NULL;
 }
 
 static void uvesafb_init_mtrr(struct fb_info *info)
-- 
2.20.1

