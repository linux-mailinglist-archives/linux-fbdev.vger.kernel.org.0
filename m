Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB441053C0
	for <lists+linux-fbdev@lfdr.de>; Thu, 21 Nov 2019 15:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfKUOCW (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 21 Nov 2019 09:02:22 -0500
Received: from mga06.intel.com ([134.134.136.31]:48378 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbfKUOCW (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 21 Nov 2019 09:02:22 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Nov 2019 06:02:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,226,1571727600"; 
   d="scan'208";a="407199809"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 21 Nov 2019 06:02:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B6B8E299; Thu, 21 Nov 2019 16:02:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] fbtft: Fix the initialization from property algorithm
Date:   Thu, 21 Nov 2019 16:02:07 +0200
Message-Id: <20191121140207.65089-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

When converting to device property API the commit
8b2d3aeeb7ec ("fbtft: Make use of device property API")
mistakenly placed the reading of the first value inside the loop,
that jumps over value after initialization sequence or sleep commands.

Move the above mentioned reading outside of the loop to restore
correct behaviour.

Besides that, we are using pre-increment operation which may lead to
out of the boundary access at the end of sequence. Thus, allocate buffer
with an additional element at the end to prevent out of the boundary
access.

Fixes: 8b2d3aeeb7ec ("fbtft: Make use of device property API")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/fbtft-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index e87d839d86ac..4fcc82b7de1b 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -913,7 +913,7 @@ static int fbtft_init_display_from_property(struct fbtft_par *par)
 	if (count == 0)
 		return -EINVAL;
 
-	values = kmalloc_array(count, sizeof(*values), GFP_KERNEL);
+	values = kmalloc_array(count + 1, sizeof(*values), GFP_KERNEL);
 	if (!values)
 		return -ENOMEM;
 
@@ -926,9 +926,9 @@ static int fbtft_init_display_from_property(struct fbtft_par *par)
 		gpiod_set_value(par->gpio.cs, 0);  /* Activate chip */
 
 	index = -1;
-	while (index < count) {
-		val = values[++index];
+	val = values[++index];
 
+	while (index < count) {
 		if (val & FBTFT_OF_INIT_CMD) {
 			val &= 0xFFFF;
 			i = 0;
-- 
2.24.0

