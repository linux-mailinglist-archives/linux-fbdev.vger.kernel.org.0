Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B92FA191730
	for <lists+linux-fbdev@lfdr.de>; Tue, 24 Mar 2020 18:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbgCXRFh (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 24 Mar 2020 13:05:37 -0400
Received: from mga12.intel.com ([192.55.52.136]:25067 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726962AbgCXRFh (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 24 Mar 2020 13:05:37 -0400
IronPort-SDR: qi4l4QAS3E9zlVUebjvrPzUSZaz7N94SaeJf6UDeI8OGqhbSoJ/HZaMoIoXNhKoBy3kE/H5N0U
 aW218l6OWyIQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2020 10:05:37 -0700
IronPort-SDR: O6nZ9ebeq1oDrK3CmezgbCKcp+WTtPTfcEuj6p3FaZ2zFtHyixvWHMg/QV8xGpl6eHXVZGKPrK
 xcjHK92qBtUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,301,1580803200"; 
   d="scan'208";a="235643659"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 24 Mar 2020 10:05:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7D29D5A3; Tue, 24 Mar 2020 19:05:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, xllacyx@gmail.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/5] video: ssd1307fb: Remove redundant forward declaration
Date:   Tue, 24 Mar 2020 19:05:32 +0200
Message-Id: <20200324170532.44384-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
References: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

There is no need to have forward declaration of struct ssd1307fb_par.
Drop it for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/fbdev/ssd1307fb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 6e543396002a..509cab2c8b6c 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -48,8 +48,6 @@
 static u_int refreshrate = REFRESHRATE;
 module_param(refreshrate, uint, 0);
 
-struct ssd1307fb_par;
-
 struct ssd1307fb_deviceinfo {
 	u32 default_vcomh;
 	u32 default_dclk_div;
-- 
2.25.1

