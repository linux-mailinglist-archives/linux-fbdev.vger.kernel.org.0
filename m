Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E10C28DB90
	for <lists+linux-fbdev@lfdr.de>; Wed, 14 Oct 2020 10:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgJNIaZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 14 Oct 2020 04:30:25 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:54778 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725985AbgJNIaY (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 14 Oct 2020 04:30:24 -0400
X-Greylist: delayed 452 seconds by postgrey-1.27 at vger.kernel.org; Wed, 14 Oct 2020 04:29:21 EDT
Received: from localhost.localdomain (unknown [124.16.141.241])
        by APP-05 (Coremail) with SMTP id zQCowAC3l7QTtYZf9qNwAg--.49721S2;
        Wed, 14 Oct 2020 16:21:41 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     b.zolnierkie@samsung.com, jani.nikula@intel.com,
        daniel.vetter@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] au1100fb: Remove NULL pointer check before clk_enable/disable
Date:   Wed, 14 Oct 2020 08:21:37 +0000
Message-Id: <20201014082137.23320-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAC3l7QTtYZf9qNwAg--.49721S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw17AFyfXFW5Kr13Aw1xuFg_yoWktFgEvF
        4IvrZ3Wr1UZr1Fgr1UJryqkryYkFsFvrnFgrn2qr95Kry7XryrurW0vr1fu398Xws7CFZ8
        JF9Fgr45Ar4fCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbFAYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I
        3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
        WUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
        wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
        k0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
        Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8pnQUUUUUU==
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQMJA102ZolebAAAs2
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Because clk_enable, clk_disable, clk_prepare, and clk_unprepare already
checked NULL clock parameter, so the additional checks are unnecessary,
just remove them.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/video/fbdev/au1100fb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 37a6512feda0..3659dfbb81c1 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -560,8 +560,7 @@ int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 	/* Blank the LCD */
 	au1100fb_fb_blank(VESA_POWERDOWN, &fbdev->info);
 
-	if (fbdev->lcdclk)
-		clk_disable(fbdev->lcdclk);
+	clk_disable(fbdev->lcdclk);
 
 	memcpy(&fbregs, fbdev->regs, sizeof(struct au1100fb_regs));
 
@@ -577,8 +576,7 @@ int au1100fb_drv_resume(struct platform_device *dev)
 
 	memcpy(fbdev->regs, &fbregs, sizeof(struct au1100fb_regs));
 
-	if (fbdev->lcdclk)
-		clk_enable(fbdev->lcdclk);
+	clk_enable(fbdev->lcdclk);
 
 	/* Unblank the LCD */
 	au1100fb_fb_blank(VESA_NO_BLANKING, &fbdev->info);
-- 
2.17.1

