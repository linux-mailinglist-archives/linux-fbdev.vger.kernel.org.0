Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC556151E36
	for <lists+linux-fbdev@lfdr.de>; Tue,  4 Feb 2020 17:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbgBDQVU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 4 Feb 2020 11:21:20 -0500
Received: from mga01.intel.com ([192.55.52.88]:54175 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727308AbgBDQVT (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 4 Feb 2020 11:21:19 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Feb 2020 08:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; 
   d="scan'208";a="225552001"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 04 Feb 2020 08:21:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9EC1217C; Tue,  4 Feb 2020 18:21:16 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>, linux-fbdev@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] fbdev: simplefb: Platform data shan't include kernel.h
Date:   Tue,  4 Feb 2020 18:21:14 +0200
Message-Id: <20200204162114.28937-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Replace with appropriate types.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/platform_data/simplefb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platform_data/simplefb.h
index 4f733a411d18..ca8337695c2a 100644
--- a/include/linux/platform_data/simplefb.h
+++ b/include/linux/platform_data/simplefb.h
@@ -10,7 +10,7 @@
 
 #include <drm/drm_fourcc.h>
 #include <linux/fb.h>
-#include <linux/kernel.h>
+#include <linux/types.h>
 
 /* format array, use it to initialize a "struct simplefb_format" array */
 #define SIMPLEFB_FORMATS \
-- 
2.24.1

