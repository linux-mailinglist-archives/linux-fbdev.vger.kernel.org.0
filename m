Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4969110B354
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Nov 2019 17:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfK0Qc4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Nov 2019 11:32:56 -0500
Received: from mga17.intel.com ([192.55.52.151]:34004 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfK0Qcz (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Nov 2019 11:32:55 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:32:55 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; 
   d="scan'208";a="383550458"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:32:52 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     ville.syrjala@linux.intel.com, intel-gfx@lists.freedesktop.org,
        jani.nikula@intel.com,
        Steve Glendinning <steve.glendinning@shawell.net>
Subject: [PATCH 03/13] video: smscufx: don't restore fb_mmap after deferred IO cleanup
Date:   Wed, 27 Nov 2019 18:31:59 +0200
Message-Id: <5c25b31242a3ae2326ccf163e5be5ae401b04b49.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Deferred IO now preserves the fb_ops.

Cc: Steve Glendinning <steve.glendinning@shawell.net>
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/video/fbdev/smscufx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 0e0f5bbfc5ef..e362d7da87fc 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -1170,7 +1170,6 @@ static int ufx_ops_release(struct fb_info *info, int user)
 		fb_deferred_io_cleanup(info);
 		kfree(info->fbdefio);
 		info->fbdefio = NULL;
-		info->fbops->fb_mmap = ufx_ops_mmap;
 	}
 
 	pr_debug("released /dev/fb%d user=%d count=%d",
-- 
2.20.1

