Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B91D69674
	for <lists+linux-fbdev@lfdr.de>; Mon, 15 Jul 2019 17:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731342AbfGOPEi (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 15 Jul 2019 11:04:38 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:51735 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388219AbfGOPEi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 15 Jul 2019 11:04:38 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 9CFC52215D;
        Mon, 15 Jul 2019 11:04:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 Jul 2019 11:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaseg.net; h=
        subject:cc:references:to:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=K
        Z9PB+daxTSyR9v4nu+do4hRHcVulHSAgiwI4gW1jGQ=; b=cL4WJmUyXv90YogVF
        44zVRfGT4FVIO+u0FTVFGgUOvEkb2re/FBCUkLB678L1O9eq5fcIO1hRvMRS/tml
        zUzjF2gK+mwtTxAKx/fNBZVViCczgUQMd0SXEg/MW1yW6K3ZJ++S4Svb3quHjoYs
        gLCze3pC14Va7m0m0+5vhpMv5UbYCYHMu8PCSjkQtyPLqx/GOJXl5NhiQhLS1Nfe
        jF7WouOIEnqsoA7mQX3XDzgnSKi6wPEFf0hwGoy7heFhLjfbDKGGl8zvcvkczVGB
        ZZeJsibUogwZYUueifbODFlglrvw7OySWvHwnn1qrihpEf7NDPuDGqlOjyAbrhS8
        P1gzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=KZ9PB+daxTSyR9v4nu+do4hRHcVulHSAgiwI4gW1j
        GQ=; b=QR91YQNivuHEv4blVuYWxhJEKEgp63ZkR2hZ/b4wbHTRz77piuqxayzY9
        0yzAqCzBK+5t1gWCeTZUkOWl0KOx88k703DZgD8GifVX1XTLPTEI0b+Bt9QoSAeV
        vzAw2dROf+CGWmrinqnuFkM+gXg7Wzbc/+pzHRw+xGWJs0RGwi3p38rOFqNKrpdF
        E5KZ9qwHokRuG0UCDfysSCcKcNBLBnwrF0n12xXS7Mqo5J0wUlTxyAVex+pJkRHi
        UP5bixmY2+SaAGSGlaDJGdzRcx6x4yBXWVYVVUYKDaPKHEcLQ3fbYwHdUND/LfuS
        B/yaGX7BclaXxJosp3T0cW38mqlgw==
X-ME-Sender: <xms:A5YsXcumSh7U4uRVFo0tAjESYohygwphc_GRxKTBjhiJeORu6KEG-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrheekgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    etfedtuddqtdduucdludehmdenucfjughrpefufhfvhffkffgfgggjtgfgsehtkeertddt
    feehnecuhfhrohhmpeflrghnpgfuvggsrghsthhirghnpgfinphtthgvuceolhhinhhugi
    esjhgrshgvghdrnhgvtheqnecukfhppeeitddrjedurdeifedrjeehnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehlihhnuhigsehjrghsvghgrdhnvghtnecuvehluhhsthgvrhfuih
    iivgeptd
X-ME-Proxy: <xmx:A5YsXdtb7GWUrQ7Ql28wjG-hOs4s7Oa7ToTJ0N0t_dbYhVD0LVLBuQ>
    <xmx:A5YsXSzLuBmlNn6ruBCUOfdeEh4yk4rU0NkSRnuWwRjWBG8J-St7bw>
    <xmx:A5YsXTgTx30WQwJRfyvTgXbIjzsOJwrr-xh7f3rn8JROP2cdirOmOg>
    <xmx:BZYsXf0-MlwTjkNqvGvEDV0_xIoCc3hHPpi4LOHCptlLITb-RyRrtw>
Received: from [10.137.0.16] (softbank060071063075.bbtec.net [60.71.63.75])
        by mail.messagingengine.com (Postfix) with ESMTPA id 282458005B;
        Mon, 15 Jul 2019 11:04:32 -0400 (EDT)
Subject: [PATCH] Staging: fbtft: Fix GPIO handling
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Phil Reid <preid@electromag.com.au>,
        dri-devel@lists.freedesktop.org, nishadkamdar@gmail.com,
        bhanusreemahesh@gmail.com, leobras.c@gmail.com,
        gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
        devel@driverdev.osuosl.org
References: <20190715143003.12819-1-nsaenzjulienne@suse.de>
 <7b8242ab-cc0c-d90b-60af-ff1c53789e44@opensynergy.com>
 <5a77c18f-7338-888f-2379-12171b6a545e@jaseg.net>
To:     =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>
From:   =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>
Message-ID: <294c94d2-d2c1-514d-ba6d-c62e98017bc0@jaseg.net>
Date:   Tue, 16 Jul 2019 00:04:30 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5a77c18f-7338-888f-2379-12171b6a545e@jaseg.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Commit c440eee1a7a1 ("Staging: fbtft: Switch to the gpio descriptor
interface") breaks GPIO handling. In several places, checks to only set
a GPIO if it was configured ended up backwards.
I have tested this fix. The fixed driver works with a ili9486
display connected to a raspberry pi via SPI.

Fixes: commit c440eee1a7a1d ("Staging: fbtft: Switch to the gpio descriptor interface")
Tested-by: Jan Sebastian G�tte <linux@jaseg.net>
Signed-off-by: Jan Sebastian G�tte <linux@jaseg.net>
---
 drivers/staging/fbtft/fb_bd663474.c  | 2 +-
 drivers/staging/fbtft/fb_ili9163.c   | 2 +-
 drivers/staging/fbtft/fb_ili9325.c   | 2 +-
 drivers/staging/fbtft/fb_s6d1121.c   | 2 +-
 drivers/staging/fbtft/fb_ssd1289.c   | 2 +-
 drivers/staging/fbtft/fb_ssd1331.c   | 4 ++--
 drivers/staging/fbtft/fb_upd161704.c | 2 +-
 drivers/staging/fbtft/fbtft-bus.c    | 2 +-
 drivers/staging/fbtft/fbtft-core.c   | 4 ++--
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/fbtft/fb_bd663474.c b/drivers/staging/fbtft/fb_bd663474.c
index b6c6d66e4eb1..e2c7646588f8 100644
--- a/drivers/staging/fbtft/fb_bd663474.c
+++ b/drivers/staging/fbtft/fb_bd663474.c
@@ -24,7 +24,7 @@
 
 static int init_display(struct fbtft_par *par)
 {
-	if (!par->gpio.cs)
+	if (par->gpio.cs)
 		gpiod_set_value(par->gpio.cs, 0);  /* Activate chip */
 
 	par->fbtftops.reset(par);
diff --git a/drivers/staging/fbtft/fb_ili9163.c b/drivers/staging/fbtft/fb_ili9163.c
index d609a2b67db9..fd32376700e2 100644
--- a/drivers/staging/fbtft/fb_ili9163.c
+++ b/drivers/staging/fbtft/fb_ili9163.c
@@ -77,7 +77,7 @@ static int init_display(struct fbtft_par *par)
 {
 	par->fbtftops.reset(par);
 
-	if (!par->gpio.cs)
+	if (par->gpio.cs)
 		gpiod_set_value(par->gpio.cs, 0);  /* Activate chip */
 
 	write_reg(par, MIPI_DCS_SOFT_RESET); /* software reset */
diff --git a/drivers/staging/fbtft/fb_ili9325.c b/drivers/staging/fbtft/fb_ili9325.c
index b090e7ab6fdd..85e54a10ed72 100644
--- a/drivers/staging/fbtft/fb_ili9325.c
+++ b/drivers/staging/fbtft/fb_ili9325.c
@@ -85,7 +85,7 @@ static int init_display(struct fbtft_par *par)
 {
 	par->fbtftops.reset(par);
 
-	if (!par->gpio.cs)
+	if (par->gpio.cs)
 		gpiod_set_value(par->gpio.cs, 0);  /* Activate chip */
 
 	bt &= 0x07;
diff --git a/drivers/staging/fbtft/fb_s6d1121.c b/drivers/staging/fbtft/fb_s6d1121.c
index b3d0701880fe..5a129b1352cc 100644
--- a/drivers/staging/fbtft/fb_s6d1121.c
+++ b/drivers/staging/fbtft/fb_s6d1121.c
@@ -29,7 +29,7 @@ static int init_display(struct fbtft_par *par)
 {
 	par->fbtftops.reset(par);
 
-	if (!par->gpio.cs)
+	if (par->gpio.cs)
 		gpiod_set_value(par->gpio.cs, 0);  /* Activate chip */
 
 	/* Initialization sequence from Lib_UTFT */
diff --git a/drivers/staging/fbtft/fb_ssd1289.c b/drivers/staging/fbtft/fb_ssd1289.c
index bbf75f795234..88a5b6925901 100644
--- a/drivers/staging/fbtft/fb_ssd1289.c
+++ b/drivers/staging/fbtft/fb_ssd1289.c
@@ -28,7 +28,7 @@ static int init_display(struct fbtft_par *par)
 {
 	par->fbtftops.reset(par);
 
-	if (!par->gpio.cs)
+	if (par->gpio.cs)
 		gpiod_set_value(par->gpio.cs, 0);  /* Activate chip */
 
 	write_reg(par, 0x00, 0x0001);
diff --git a/drivers/staging/fbtft/fb_ssd1331.c b/drivers/staging/fbtft/fb_ssd1331.c
index 4cfe9f8535d0..37622c9462aa 100644
--- a/drivers/staging/fbtft/fb_ssd1331.c
+++ b/drivers/staging/fbtft/fb_ssd1331.c
@@ -81,7 +81,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	va_start(args, len);
 
 	*buf = (u8)va_arg(args, unsigned int);
-	if (!par->gpio.dc)
+	if (par->gpio.dc)
 		gpiod_set_value(par->gpio.dc, 0);
 	ret = par->fbtftops.write(par, par->buf, sizeof(u8));
 	if (ret < 0) {
@@ -104,7 +104,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 			return;
 		}
 	}
-	if (!par->gpio.dc)
+	if (par->gpio.dc)
 		gpiod_set_value(par->gpio.dc, 1);
 	va_end(args);
 }
diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
index 564a38e34440..c77832ae5e5b 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -26,7 +26,7 @@ static int init_display(struct fbtft_par *par)
 {
 	par->fbtftops.reset(par);
 
-	if (!par->gpio.cs)
+	if (par->gpio.cs)
 		gpiod_set_value(par->gpio.cs, 0);  /* Activate chip */
 
 	/* Initialization sequence from Lib_UTFT */
diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 2ea814d0dca5..63c65dd67b17 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -135,7 +135,7 @@ int fbtft_write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 	remain = len / 2;
 	vmem16 = (u16 *)(par->info->screen_buffer + offset);
 
-	if (!par->gpio.dc)
+	if (par->gpio.dc)
 		gpiod_set_value(par->gpio.dc, 1);
 
 	/* non buffered write */
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index bc750250ccd6..5127de922f6a 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -916,7 +916,7 @@ static int fbtft_init_display_dt(struct fbtft_par *par)
 		return -EINVAL;
 
 	par->fbtftops.reset(par);
-	if (!par->gpio.cs)
+	if (par->gpio.cs)
 		gpiod_set_value(par->gpio.cs, 0);  /* Activate chip */
 
 	while (p) {
@@ -1007,7 +1007,7 @@ int fbtft_init_display(struct fbtft_par *par)
 	}
 
 	par->fbtftops.reset(par);
-	if (!par->gpio.cs)
+	if (par->gpio.cs)
 		gpiod_set_value(par->gpio.cs, 0);  /* Activate chip */
 
 	i = 0;
-- 
2.21.0

