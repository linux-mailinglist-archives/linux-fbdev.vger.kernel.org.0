Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E62955465
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Jun 2019 18:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfFYQZN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 25 Jun 2019 12:25:13 -0400
Received: from gateway32.websitewelcome.com ([192.185.145.1]:49796 "EHLO
        gateway32.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726740AbfFYQZN (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 25 Jun 2019 12:25:13 -0400
X-Greylist: delayed 1203 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 Jun 2019 12:25:13 EDT
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway32.websitewelcome.com (Postfix) with ESMTP id 5ECA131C7AF6
        for <linux-fbdev@vger.kernel.org>; Tue, 25 Jun 2019 11:01:05 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id fnsXhKmQ8YTGMfnsXhFGnt; Tue, 25 Jun 2019 11:01:05 -0500
X-Authority-Reason: nr=8
Received: from cablelink-187-160-61-213.pcs.intercable.net ([187.160.61.213]:30726 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hfnsW-001MjO-AX; Tue, 25 Jun 2019 11:01:04 -0500
Date:   Tue, 25 Jun 2019 11:01:03 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
Message-ID: <20190625160103.GA13133@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.160.61.213
X-Source-L: No
X-Exim-ID: 1hfnsW-001MjO-AX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-187-160-61-213.pcs.intercable.net (embeddedor) [187.160.61.213]:30726
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch
cases where we are expecting to fall through.

This patch fixes the following warnings:

drivers/video/fbdev/s3c-fb.c: In function ‘s3c_fb_blank’:
drivers/video/fbdev/s3c-fb.c:811:16: warning: this statement may fall through [-Wimplicit-fallthrough=]
   sfb->enabled &= ~(1 << index);
   ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
drivers/video/fbdev/s3c-fb.c:814:2: note: here
  case FB_BLANK_NORMAL:
  ^~~~
  LD [M]  drivers/staging/greybus/gb-light.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.o
drivers/video/fbdev/s3c-fb.c: In function ‘s3c_fb_check_var’:
drivers/video/fbdev/s3c-fb.c:286:22: warning: this statement may fall through [-Wimplicit-fallthrough=]
   var->transp.length = 1;
   ~~~~~~~~~~~~~~~~~~~^~~
drivers/video/fbdev/s3c-fb.c:288:2: note: here
  case 18:
  ^~~~
drivers/video/fbdev/s3c-fb.c:314:22: warning: this statement may fall through [-Wimplicit-fallthrough=]
   var->transp.offset = 24;
   ~~~~~~~~~~~~~~~~~~~^~~~
drivers/video/fbdev/s3c-fb.c:316:2: note: here
  case 24:
  ^~~~

Warning level 3 was used: -Wimplicit-fallthrough=3

Notice that, in this particular case, the code comments are modified
in accordance with what GCC is expecting to find.

This patch is part of the ongoing efforts to enable
-Wimplicit-fallthrough.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/video/fbdev/s3c-fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index 288300035164..f0b0643ab195 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -284,7 +284,7 @@ static int s3c_fb_check_var(struct fb_var_screeninfo *var,
 		/* 666 with one bit alpha/transparency */
 		var->transp.offset	= 18;
 		var->transp.length	= 1;
-		/* drop through */
+		/* fall through */
 	case 18:
 		var->bits_per_pixel	= 32;
 
@@ -312,7 +312,7 @@ static int s3c_fb_check_var(struct fb_var_screeninfo *var,
 	case 25:
 		var->transp.length	= var->bits_per_pixel - 24;
 		var->transp.offset	= 24;
-		/* drop through */
+		/* fall through */
 	case 24:
 		/* our 24bpp is unpacked, so 32bpp */
 		var->bits_per_pixel	= 32;
@@ -809,7 +809,7 @@ static int s3c_fb_blank(int blank_mode, struct fb_info *info)
 	case FB_BLANK_POWERDOWN:
 		wincon &= ~WINCONx_ENWIN;
 		sfb->enabled &= ~(1 << index);
-		/* fall through to FB_BLANK_NORMAL */
+		/* fall through - to FB_BLANK_NORMAL */
 
 	case FB_BLANK_NORMAL:
 		/* disable the DMA and display 0x0 (black) */
-- 
2.21.0

