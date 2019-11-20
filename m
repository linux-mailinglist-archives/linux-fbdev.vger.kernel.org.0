Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89F6910370F
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 Nov 2019 10:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbfKTJ5V (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 20 Nov 2019 04:57:21 -0500
Received: from mga18.intel.com ([134.134.136.126]:27971 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727716AbfKTJ5U (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 20 Nov 2019 04:57:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Nov 2019 01:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; 
   d="scan'208";a="218559863"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 20 Nov 2019 01:57:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 87EDB42; Wed, 20 Nov 2019 11:57:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        linux-fbdev@vger.kernel.org,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        devel@driverdev.osuosl.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/5] fbtft: Describe function parameters in kernel-doc
Date:   Wed, 20 Nov 2019 11:57:13 +0200
Message-Id: <20191120095716.26628-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
References: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Kernel documentation script complains that some of the function parameters
are not described:

drivers/staging/fbtft/fbtft-core.c:543: warning: Function parameter or member 'pdata' not described in 'fbtft_framebuffer_alloc'

Describe function parameters where it's appropriate.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/fbtft-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 61f0286fb157..2122c4407bdb 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -529,6 +529,7 @@ static void fbtft_merge_fbtftops(struct fbtft_ops *dst, struct fbtft_ops *src)
  *
  * @display: pointer to structure describing the display
  * @dev: pointer to the device for this fb, this can be NULL
+ * @pdata: platform data for the display in use
  *
  * Creates a new frame buffer info structure.
  *
-- 
2.24.0

