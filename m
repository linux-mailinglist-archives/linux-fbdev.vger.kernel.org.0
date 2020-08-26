Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FF3252501
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Aug 2020 03:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHZBVd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 25 Aug 2020 21:21:33 -0400
Received: from sonic316-12.consmr.mail.bf2.yahoo.com ([74.6.130.122]:34485
        "EHLO sonic316-12.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726610AbgHZBVd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 25 Aug 2020 21:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1598404892; bh=hvPJp6ctE/5SYCYFIZL9KLCup9r8xj7ZdxzCxEmZiX8=; h=From:To:Cc:Subject:Date:References:From:Subject; b=XAywxWAAwiJGATI6sui9X9kBj+rlfShyigbcIJoaMurmv6oaljLV03MBPdkknVxHX0wx/V3bq1MxI1vhlN3v/mHQmfngeZtvAWaOykRhaCIW1+i8mzfLd2ol9rlcJ2WaWil90wm7PDOCPY1+QMSONna6ohXspg7Lvqb/mA568cDTPiAY/7E2cczQpoBCVMhdEEx0X8Ucyv7gy6SC09Y9F7wbGkQCdU1NsvfE2aKJKg0TUsM4+mjVUI6/Y9ioGG6ebXO2DxRUFYcHVXTP5J/9WYLai/YvZ03ZaXPS3m3TaVCSwlLdJoLF09Wx9VuwZzQwVLh6b4oUjdPTjKJFp6lsOA==
X-YMail-OSG: HMjB91cVM1milBO8qIi7BOBDUAzF5WrF9y2Yow151YcHNZ6f1y1tZYCFv0Y_EnZ
 QLLHuo3_AIOzb_K_WZbb87e5XogpPOBD.hj6wlMt9SQmFjPXaDeEe4wB28aa4obQGbaIxX5s8rSh
 wtoON_m7Jj7ifmg1dsIW.oKaFrKvCXtnW..iFNPxNUMGi1d.xToaCKR_ecuu.sdAff2DLoRrrGT0
 tBRMnqG2CBWXVajenUIjkUf2QbySx8CqARpQEy9Qr1PSL6umj76sXPXK4LoUHt_H6Y9_eKg21bpF
 LAMQELrjXipKtizd_PoapDSWGRk60SwJU7NnE1mMpqqxNDVQ0GuR7y1g_O8hTQoNtfHlD13arIgf
 WBrjCp0qhWsfh6NLlgbMLOTEtcElDsjf2Lx90TaCb8y0JrYCtwhqZiyvMjXeHYoGxbnn.vAJbOsP
 fWGQ9Ss9uiMSRwmaAHsVrhMsECqKLGWTOf.OELTeABqnvCbV23_.2faeKxJsXdCqH_.rnec3Zt.A
 iQSYuhe87L9jj4P4EEuZvGNG3vAZqFnRr1wLZ5mh69afPnaUltULDolK5JSSKTKekra2TnmQ8eSH
 xYH5wo0iw9ckPVArK_uuA58mtgFZEJX5vAdV95lbOC.JVf9.GhA7SWyAMlMvP8QHzeINlNDZ8rMZ
 86RRjqJiA.QlGB9bc0dT_0xviiCI_4_WWhWffsDVvTsQYy9c7Xy8jPlEbr4.WiCtgurVZX1XM9Sc
 3S_gbypgoRDInbz1DfpYNbzmKzkWsRorCA19jnzewbawN2W5IwCdTKa3UmMPVYMyWNbjrjCQYa9x
 mG10Djw9omvkaKeSnRuVIg4KeQDS33b_3aFST3MegR34lXrTlAJSgct6nXJf3eX1g1l3Uq8O9BrH
 H677Zoa.N7_21iRGc5jI_6qt6IcDWRi.jRF_T6W6VAEPjd9XnQn_mHyPW1yG7ByU6WIZrvy3eXCo
 Ax8ozpgEpH3OT28f_8ZAEkLOhxTNFMVRk.3HjbYwZ9L8hb70jwrK_zsz9tw.gr1icvmqMQb_HreT
 TD2dwv1AG_buUx6lfCjCnTGEZlCDz729mRV5c1YSJrFYd9WtgTfVzInNoH314WDADvGvIV0OqADw
 XeJSv4QOuRI7gig2WPVi7QcQSvxzUZs7i8jO69mAXdmzK1IoCsvQTLeez2hILpj71A3Fk9mmxWAM
 m_vRtuweBGQojL7R0FEUHjmnLe6sOkVYY9nGdSKsRy7aRbcmemWkRFKEZc7j95Q5tmKsqIzgYuRu
 sYGc_0CfXjksZP3BGlDFCSugtQ9L9muHTwxMqL9qnwE6RS1sPINnnywQ0cBcRdHmm7ZNMruwqR2W
 Rh9MyI.W5sTDGsocI3w8HVym1avADuWvUOHY9Zt3GHAJWfE3YFjuTW1ZuS6q9dTA6FZM0i6jTZux
 y.9zoPIBz4ggUREB1EB7V943iBFkqXW.9HVCVjYJQ4UnZQZU4zcXVGSzvB9MCW47ur7ALOsC3NNe
 rH9VshuZSZTNrfPe8lOJ44SZ_OTMXXgmFqCXL9L2XCb6w
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.bf2.yahoo.com with HTTP; Wed, 26 Aug 2020 01:21:32 +0000
Received: by smtp409.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 4c062739663d1210c3979176d6dc911c;
          Wed, 26 Aug 2020 01:21:29 +0000 (UTC)
From:   "Timo A. Aranjo" <timo.aranjo@aol.com>
To:     kernel-janitors@vger.kernel.org
Cc:     sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
        gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
        julia.lawall@inria.fr, dan.carpenter@oracle.com,
        "Timo A. Aranjo" <timo.aranjo@aol.com>
Subject: [PATCH] Staging: sm750fb: Fix basic coding style issues
Date:   Tue, 25 Aug 2020 20:21:01 -0500
Message-Id: <20200826012101.12162-1-timo.aranjo@aol.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20200826012101.12162-1-timo.aranjo.ref@aol.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The word "enought" was changed to read as "enough".
In addition to this, there was a missing new-line after varaible
declarations within a function.

Signed-off-by: Timo A. Aranjo <timo.aranjo@aol.com>
---
 drivers/staging/sm750fb/sm750.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 84fb585a5739..029f0d09e966 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -411,6 +411,7 @@ static int __maybe_unused lynxfb_suspend(struct device *dev)
 {
 	struct fb_info *info;
 	struct sm750_dev *sm750_dev;
+
 	sm750_dev = dev_get_drvdata(dev);
 
 	console_lock();
@@ -500,7 +501,7 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 	var->height = var->width = -1;
 	var->accel_flags = 0;/* FB_ACCELF_TEXT; */
 
-	/* check if current fb's video memory big enought to hold the onscreen*/
+	/* check if current fb's video memory big enough to hold the onscreen*/
 	request = var->xres_virtual * (var->bits_per_pixel >> 3);
 	/* defaulty crtc->channel go with par->index */
 
-- 
2.25.1

