Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561BE375A85
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 May 2021 20:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhEFS6K (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 6 May 2021 14:58:10 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:51238 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234463AbhEFS6J (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 6 May 2021 14:58:09 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d05 with ME
        id 1Wx72500C21Fzsu03Wx7Vc; Thu, 06 May 2021 20:57:09 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 May 2021 20:57:09 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     s.hauer@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org,
        festevam@gmail.com, linux-imx@nxp.com, j.beisert@pengutronix.de,
        krzysztof.h1@poczta.fm
Cc:     linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] video: fbdev: imxfb: Fix an error message
Date:   Thu,  6 May 2021 20:57:05 +0200
Message-Id: <d7b25026f82659da3c6f7159eea480faa9d738be.1620327302.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

'ret' is known to be 0 here.
No error code is available, so just remove it from the error message.

Fixes: 72330b0eeefc ("i.MX Framebuffer: Use readl/writel instead of direct pointer deref")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/fbdev/imxfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 7f8debd2da06..ad598257ab38 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -992,7 +992,7 @@ static int imxfb_probe(struct platform_device *pdev)
 	info->screen_buffer = dma_alloc_wc(&pdev->dev, fbi->map_size,
 					   &fbi->map_dma, GFP_KERNEL);
 	if (!info->screen_buffer) {
-		dev_err(&pdev->dev, "Failed to allocate video RAM: %d\n", ret);
+		dev_err(&pdev->dev, "Failed to allocate video RAM\n");
 		ret = -ENOMEM;
 		goto failed_map;
 	}
-- 
2.30.2

