Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA58110293
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Dec 2019 17:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfLCQjn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Dec 2019 11:39:43 -0500
Received: from mga18.intel.com ([134.134.136.126]:47559 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbfLCQjn (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 3 Dec 2019 11:39:43 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 08:39:42 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; 
   d="scan'208";a="213485466"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 08:39:40 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 07/12] video: fbdev: intelfb: use const pointer for fb_ops
Date:   Tue,  3 Dec 2019 18:38:49 +0200
Message-Id: <171c573bc2977a6ec374753ac7bb03a3523ca2b7.1575390740.git.jani.nikula@intel.com>
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

Use const for fb_ops to let us make the fbops struct const in the
future.

Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/video/fbdev/intelfb/intelfb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/intelfb/intelfb.h b/drivers/video/fbdev/intelfb/intelfb.h
index b54db05f028d..5de703902a21 100644
--- a/drivers/video/fbdev/intelfb/intelfb.h
+++ b/drivers/video/fbdev/intelfb/intelfb.h
@@ -273,7 +273,7 @@ struct intelfb_vsync {
 
 struct intelfb_info {
 	struct fb_info *info;
-	struct fb_ops  *fbops;
+	const struct fb_ops *fbops;
 	struct pci_dev *pdev;
 
 	struct intelfb_hwstate save_state;
-- 
2.20.1

