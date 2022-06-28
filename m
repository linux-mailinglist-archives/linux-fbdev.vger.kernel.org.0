Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D031A55D4B0
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Jun 2022 15:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243564AbiF1CVT (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 27 Jun 2022 22:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243582AbiF1CUl (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 27 Jun 2022 22:20:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5980F24BE1;
        Mon, 27 Jun 2022 19:20:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 04C62B81C00;
        Tue, 28 Jun 2022 02:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90E2C34115;
        Tue, 28 Jun 2022 02:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656382814;
        bh=E5NbZEQRq3XuusaBccycvE/L7K9nPCPxZRO2UdOKn1E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dyMgKr8Z8In06RfEHWNkTssjbG3OEPErAOGBJCsQuRyolvfubGeHrukI0m5RqXcJm
         s+mXPEmW80+u5kh+KsX1036ndBJbQ7ZTAspi/zpRgSz58T7p0V/Zy9DUVxS5cV0pjy
         QjaNe+MqIUJ8Dzlzp5ZXAUq9T/5wF8WYpqTb+rjSO4MGA8ZzUU3L/spDMTNGVEwllY
         d5ehV2IN1iyLsELYgmlfRU7/Fq0QEfx4xb/Q6cscmxM5ZpTfx+ZBPhVqv9sLJDX7GR
         jFfnoHR4szVEPWiMuYW7Bwl1xdy8S2DtouzcMqy8b/5bLaCmcamuR+DsIrJSN7d6vT
         i5wUG0QRApIAQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yihao Han <hanyihao@vivo.com>, Hans de Goede <hdegoede@redhat.com>,
        Helge Deller <deller@gmx.de>, Sasha Levin <sashal@kernel.org>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.18 34/53] video: fbdev: simplefb: Check before clk_put() not needed
Date:   Mon, 27 Jun 2022 22:18:20 -0400
Message-Id: <20220628021839.594423-34-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628021839.594423-1-sashal@kernel.org>
References: <20220628021839.594423-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Yihao Han <hanyihao@vivo.com>

[ Upstream commit 5491424d17bdeb7b7852a59367858251783f8398 ]

clk_put() already checks the clk ptr using !clk and IS_ERR()
so there is no need to check it again before calling it.

Signed-off-by: Yihao Han <hanyihao@vivo.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/simplefb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 2c198561c338..f96ce8801be4 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -237,8 +237,7 @@ static int simplefb_clocks_get(struct simplefb_par *par,
 		if (IS_ERR(clock)) {
 			if (PTR_ERR(clock) == -EPROBE_DEFER) {
 				while (--i >= 0) {
-					if (par->clks[i])
-						clk_put(par->clks[i]);
+					clk_put(par->clks[i]);
 				}
 				kfree(par->clks);
 				return -EPROBE_DEFER;
-- 
2.35.1

