Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2F7F5F5E7
	for <lists+linux-fbdev@lfdr.de>; Thu,  4 Jul 2019 11:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfGDJqI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 4 Jul 2019 05:46:08 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:49842 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727433AbfGDJqH (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 4 Jul 2019 05:46:07 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 89A0C282A6D9B3730D51;
        Thu,  4 Jul 2019 17:46:03 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Thu, 4 Jul 2019 17:45:57 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-fbdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <dri-devel@lists.freedesktop.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] video: fbdev: imxfb: fix a typo in imxfb_probe()
Date:   Thu, 4 Jul 2019 09:52:25 +0000
Message-ID: <20190704095225.143177-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fix the return value check which testing the wrong variable
in imxfb_probe().

Fixes: 739a6439c2bf ("video: fbdev: imxfb: fix sparse warnings about using incorrect types")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/video/fbdev/imxfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 8d1053e9ef9f..b3286d1fa543 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -976,7 +976,7 @@ static int imxfb_probe(struct platform_device *pdev)
 	fbi->map_size = PAGE_ALIGN(info->fix.smem_len);
 	info->screen_buffer = dma_alloc_wc(&pdev->dev, fbi->map_size,
 					   &fbi->map_dma, GFP_KERNEL);
-	if (!info->screen_base) {
+	if (!info->screen_buffer) {
 		dev_err(&pdev->dev, "Failed to allocate video RAM: %d\n", ret);
 		ret = -ENOMEM;
 		goto failed_map;



