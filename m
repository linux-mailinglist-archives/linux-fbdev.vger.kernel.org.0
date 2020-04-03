Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9AD19CE8E
	for <lists+linux-fbdev@lfdr.de>; Fri,  3 Apr 2020 04:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389857AbgDCCRt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 2 Apr 2020 22:17:49 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:12609 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389171AbgDCCRt (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 2 Apr 2020 22:17:49 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 57552E9F6934C14C73BC;
        Fri,  3 Apr 2020 10:17:42 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Apr 2020
 10:17:32 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <b.zolnierkie@samsung.com>, <dri-devel@lists.freedesktop.org>,
        <linux-fbdev@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] video: fbdev: matroxfb: remove dead code and set but not used variable
Date:   Fri, 3 Apr 2020 10:16:09 +0800
Message-ID: <20200403021609.20968-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fix the following gcc warning:

drivers/video/fbdev/matrox/g450_pll.c:336:15: warning: variable
‘pixel_vco’ set but not used [-Wunused-but-set-variable]
  unsigned int pixel_vco;
               ^~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/video/fbdev/matrox/g450_pll.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/video/fbdev/matrox/g450_pll.c b/drivers/video/fbdev/matrox/g450_pll.c
index c15f8a57498e..ff8e321a22ce 100644
--- a/drivers/video/fbdev/matrox/g450_pll.c
+++ b/drivers/video/fbdev/matrox/g450_pll.c
@@ -333,11 +333,9 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
 			 unsigned int *deltaarray)
 {
 	unsigned int mnpcount;
-	unsigned int pixel_vco;
 	const struct matrox_pll_limits* pi;
 	struct matrox_pll_cache* ci;
 
-	pixel_vco = 0;
 	switch (pll) {
 		case M_PIXEL_PLL_A:
 		case M_PIXEL_PLL_B:
@@ -420,7 +418,6 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
 				
 				mnp = matroxfb_DAC_in(minfo, M1064_XPIXPLLCM) << 16;
 				mnp |= matroxfb_DAC_in(minfo, M1064_XPIXPLLCN) << 8;
-				pixel_vco = g450_mnp2vco(minfo, mnp);
 				matroxfb_DAC_unlock_irqrestore(flags);
 			}
 			pi = &minfo->limits.video;
@@ -441,25 +438,6 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
 			unsigned int delta;
 
 			vco = g450_mnp2vco(minfo, mnp);
-#if 0			
-			if (pll == M_VIDEO_PLL) {
-				unsigned int big, small;
-
-				if (vco < pixel_vco) {
-					small = vco;
-					big = pixel_vco;
-				} else {
-					small = pixel_vco;
-					big = vco;
-				}
-				while (big > small) {
-					big >>= 1;
-				}
-				if (big == small) {
-					continue;
-				}
-			}
-#endif			
 			delta = pll_freq_delta(fout, g450_vco2f(mnp, vco));
 			for (idx = mnpcount; idx > 0; idx--) {
 				/* == is important; due to nextpll algorithm we get
-- 
2.17.2

