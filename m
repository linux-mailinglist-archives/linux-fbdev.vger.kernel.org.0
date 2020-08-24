Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E254D250C0A
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Aug 2020 01:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgHXXE3 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Aug 2020 19:04:29 -0400
Received: from sonic305-31.consmr.mail.bf2.yahoo.com ([74.6.133.230]:44121
        "EHLO sonic305-31.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727997AbgHXXE3 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Aug 2020 19:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1598310268; bh=ecwGMGIu/CEPIOX80g8ywqUnb1xK0MPbBbcDj6fDce0=; h=To:From:Cc:Subject:Date:References:From:Subject; b=LgyGTQwn05Ie71ebubvRa5X4143rQ7pBiKZPclwqwH7I8h/vyCV3yrKb4t/TGaRfLbjiWwMm62bUFDO4YSnjv5cZQRIq/HoOQY8IppKYoYXoDp0V6Pb9ZiIKNH8FgFr4HF8MPP2tHB88cCxjJ+UpDacZifUHHiyHwqokIZYFk22k4/fGmI3cVEph+PqkeWlegHxAs3OIbJhX+x3yenT1/c5Njv0O982eqKeDyDbBElpMyQdpW1ZyKYi4sYcQ0qdU0iAL3rFol0n/J+Bx5AcIwuICg6C3JztuaP8RvV09sMoNIKc5+kLjSXyswCyowkjJwsWOExG2/eWxSLwTEU72+g==
X-YMail-OSG: PcXmIx0VM1ksFWSh4ny4_Hdaewwt5TNaUqVTnPvgo1UqaldHXMxgxf8iLCG0XIX
 aIdzD7Ho93RfBgAzS0aFZZuQ2BK2Lwekx9Z9Dbgdj6Lgn5INZ1LiKoO8o_P2.sI_KF.KYw_l2vNS
 FxFUIA.NJC8ml74GBIbc9BxBITUd.vBdIRJioaSSEadil1m1_dWxw7VGrC7CGfPiUjxYWPWtkUuo
 eLL_S6BWag_q7.tcl9nbwCWZe0kvVNWyD7ZB.cjDLL3XEpZtsvKEo_60GuCHxJ5E8vlMyeQp27RW
 vKymX4jaXaKr1tWEfnxVKd24BsUKkc6VXzAdy4CsG1afZTgfGFlchkEgIqphqi7OK6BvFdmFTamD
 0unQHkpKlR1fR9cHOX.SLB8FMwoIQZHkMyz4KmVKlJ82I3LAM0XgqikSZ_S8DOBEBqTjVXQFEnRI
 5AwOjMPM5hW0NWZOzk8i75JlU7qMaTPaPRB.WTIhOs5FjBm2OWfRCW0rkn_lAI6jJMX9uUsvES36
 .TUJRLjum9Jc27_E5SxLi33E7oPvwWM.TVnjZJG2Gfq0USUyzZeEgnAvbo8gXFlk90SO923SJXgM
 O5z65wfGgO16iBoNbnKo0eYCOQGNzHUFKfnqVyMvmVtjp72qFItkF9_XguFDYZPHWjUBWhmBPXo_
 bc6MRzHGpdWEBAElf5Cr7YBlJs7dKrm52oVKoGwZDQA_TqDyBcwfp2gAquGM1jLTEhcG_pxrtNEu
 dQ5jLTMH4GNlmAOJT.wyNoy8SW5hxosh8PxpXcb.FS71Hg2Nqn0aAUq_imTRUvSY8cZyYTPCm0iP
 Na7qWiRDAeh7Bzd61o_oQE0H8Ynl8NvF2a9SnHZFxhph87CJF0lAJh3z9lxWpybAiwqwPjJaALv3
 oS3pBen61FVdP2tO1YgZBElXGa19Wy3NNNvWShlOaEf.uBklc5gWN278JI4oF2vF1v69XZUjcAxk
 wOX.T30c7hWQO96dlFKToqZFKXvgqd8keoaxwoRAjeoncudePiFpSMuWoUU4eoWOGiGkC9RRWyde
 rIyqd1XikUQ2x5BgBo3poWZMegRYhIbFeLibKvu_FuiR6z_yDMxbu4OBu9zYyjrmgw9vl3JafM6J
 ysyJx6_jKRUPl5PvetaL6jHTPn21rNlQ76ND35uYjwuMdvHgAb24Bz8p.vT.yd5V1Vq70E_wCyxi
 tO5_QtRYok200kgVuYwG4LVa3sXc2BOmbC5y6jkfokvnrxPHBFHHNYgb2W9sZZy0Lw6knOMraehH
 lD7.K4Ua.QoHKV4J4i.ch1M6bcD9gHs41hb61ARA1vRYXAWBQXxZZcS3AonC_hcuQ51JQZbyZ.aF
 jmlVj8sXIsE76DxL9p480E2lje576gk6xDKkaNV9tUekQ6wCq7gwUeSDr2c2ffq8wy9arRn3pegp
 3nFfpt6TK1VVlRsmFTPo3aFSCqE.RfeztDvDs_tD_iKqdkugZwlwjTK5hryukZd_RmfiBRVJeqko
 NhTudWTn2TbxHS0LKdLP1i.bT8yRB0HoaNpmWeqjaLn2C2W4zPBgSsNvcuKtjLGzHXW3OU4Wq
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.bf2.yahoo.com with HTTP; Mon, 24 Aug 2020 23:04:28 +0000
Received: by smtp410.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 88b388f97aeaa05fe15c079342340778;
          Mon, 24 Aug 2020 23:02:27 +0000 (UTC)
To:     kernel-janitors@vger.kernel.org
From:   Timo Aranjo <timo.aranjo@aol.com>
Cc:     sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
        gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org
Subject: [PATCH] Staging: sm750fb: Fixed a coding style issue
Message-ID: <1b596369-7c83-73ff-fd4e-ed0d7a714219@aol.com>
Date:   Mon, 24 Aug 2020 18:02:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
References: <1b596369-7c83-73ff-fd4e-ed0d7a714219.ref@aol.com>
X-Mailer: WebService/1.1.16455 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol Apache-HttpAsyncClient/4.1.4 (Java/11.0.7)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

 From 56c5eed5b0a3d299530264509a6a81594c4fb791 Mon Sep 17 00:00:00 2001
From: "Timo A. Aranjo" <timo.aranjo@aol.com>
Date: Mon, 24 Aug 2020 17:24:16 -0500
Subject: [PATCH] Staging: sm750fb: Fixed a coding style issue

I added a new-line because checkpatch gave a warning about there not being
a new line after declarations.

Signed-off-by: Timo Alejandro Aranjo <timo.aranjo@aol.com>
---
  drivers/staging/sm750fb/sm750.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/staging/sm750fb/sm750.c 
b/drivers/staging/sm750fb/sm750.c
index 84fb585a5739..3da87387867e 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -411,6 +411,7 @@ static int __maybe_unused lynxfb_suspend(struct 
device *dev)
  {
  	struct fb_info *info;
  	struct sm750_dev *sm750_dev;
+
  	sm750_dev = dev_get_drvdata(dev);

  	console_lock();
-- 
2.25.1

