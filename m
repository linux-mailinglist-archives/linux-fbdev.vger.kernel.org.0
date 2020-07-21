Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4534F228117
	for <lists+linux-fbdev@lfdr.de>; Tue, 21 Jul 2020 15:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgGUNjF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 21 Jul 2020 09:39:05 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:54822 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727914AbgGUNjF (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 21 Jul 2020 09:39:05 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 231267576B65B20F8B26;
        Tue, 21 Jul 2020 21:38:56 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Jul 2020 21:38:44 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Hulk Robot <hulkci@huawei.com>, Lee Jones <lee.jones@linaro.org>,
        "Daniel Thompson" <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: [PATCH -next] backlight: cr_bllcd: Remove unused variable 'intensity'
Date:   Tue, 21 Jul 2020 21:48:41 +0800
Message-ID: <20200721134841.33893-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Gcc report unused-variable warning as follows:

drivers/video/backlight/cr_bllcd.c:62:6: warning:
 unused variable 'intensity' [-Wunused-variable]
   62 |  int intensity = bd->props.brightness;
      |      ^~~~~~~~~

After commit 24d34617c24f ("backlight: cr_bllcd: Introduce
gpio-backlight semantics"), this variable is never used, this
commit removing it.

Fixes: 24d34617c24f ("backlight: cr_bllcd: Introduce gpio-backlight semantics")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/video/backlight/cr_bllcd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/backlight/cr_bllcd.c b/drivers/video/backlight/cr_bllcd.c
index a24d42e1ea3c..4ad0a72531fe 100644
--- a/drivers/video/backlight/cr_bllcd.c
+++ b/drivers/video/backlight/cr_bllcd.c
@@ -59,7 +59,6 @@ struct cr_panel {
 
 static int cr_backlight_set_intensity(struct backlight_device *bd)
 {
-	int intensity = bd->props.brightness;
 	u32 addr = gpio_bar + CRVML_PANEL_PORT;
 	u32 cur = inl(addr);
 

