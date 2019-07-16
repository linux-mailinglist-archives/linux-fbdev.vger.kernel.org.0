Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15A3369FC4
	for <lists+linux-fbdev@lfdr.de>; Tue, 16 Jul 2019 02:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732468AbfGPAZH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 15 Jul 2019 20:25:07 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:45279 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731009AbfGPAZH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 15 Jul 2019 20:25:07 -0400
Received: (qmail 25524 invoked by uid 5089); 16 Jul 2019 00:25:04 -0000
Received: by simscan 1.2.0 ppid: 25479, pid: 25480, t: 0.0496s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL:  $rbltext
Received: from unknown (HELO preid-c7.electromag.com.au) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 16 Jul 2019 00:25:04 -0000
Received: by preid-c7.electromag.com.au (Postfix, from userid 1000)
        id ED7D7200A3961; Tue, 16 Jul 2019 08:24:59 +0800 (AWST)
From:   Phil Reid <preid@electromag.com.au>
To:     gregkh@linuxfoundation.org, bhanusreemahesh@gmail.com,
        leobras.c@gmail.com, nsaenzjulienne@suse.de,
        nishadkamdar@gmail.com, preid@electromag.com.au,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH v2 2/2] Staging: fbtft: Fix reset assertion when using gpio descriptor
Date:   Tue, 16 Jul 2019 08:24:37 +0800
Message-Id: <1563236677-5045-3-git-send-email-preid@electromag.com.au>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1563236677-5045-1-git-send-email-preid@electromag.com.au>
References: <1563236677-5045-1-git-send-email-preid@electromag.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Typically gpiod_set_value calls would assert the reset line and
then release it using the symantics of:
	gpiod_set_value(par->gpio.reset, 0);
	... delay
	gpiod_set_value(par->gpio.reset, 1);
And the gpio binding would specify the polarity.

Prior to conversion to gpiod calls the polarity in the DT
was ignored and assumed to be active low. Fix it so that
DT polarity is respected.

Fixes: c440eee1a7a1 ("Staging: fbtft: Switch to the gpio descriptor interface")
Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Tested-by: Jan Sebastian Götte <linux@jaseg.net>
Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/staging/fbtft/fbtft-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 44b8074..bc75025 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -231,9 +231,9 @@ static void fbtft_reset(struct fbtft_par *par)
 	if (!par->gpio.reset)
 		return;
 	fbtft_par_dbg(DEBUG_RESET, par, "%s()\n", __func__);
-	gpiod_set_value_cansleep(par->gpio.reset, 0);
-	usleep_range(20, 40);
 	gpiod_set_value_cansleep(par->gpio.reset, 1);
+	usleep_range(20, 40);
+	gpiod_set_value_cansleep(par->gpio.reset, 0);
 	msleep(120);
 }
 
-- 
1.8.3.1

