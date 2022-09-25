Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2F345E9240
	for <lists+linux-fbdev@lfdr.de>; Sun, 25 Sep 2022 13:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbiIYLCU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 25 Sep 2022 07:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiIYLCT (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 25 Sep 2022 07:02:19 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C583137C
        for <linux-fbdev@vger.kernel.org>; Sun, 25 Sep 2022 04:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664103707;
        bh=3/L/kvYjUQkVAHcXRmdZEPsCObB5P2626OR5kyTqh30=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=LiLDgL6kD3JS2UQzpVzZar1Lstdfc8Th0lfLTV/H8qsBbcTOSHGwQYWfcSFPXc7xI
         eg+kpqTZt1uyGMeGxOEPWWM72Hc3MZ1f/R/9bj5ReliiN3ZnvwMhjNPJofSyfyD1uf
         wDqxnUWzpIaeK23cfX5OCO+gAzGseUraZl1Yc2HE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QWG-1oXzXX2lE0-004Sh8; Sun, 25
 Sep 2022 13:01:47 +0200
Message-ID: <670566ca-0817-3b5c-c571-b4f81ce50b08@gmx.de>
Date:   Sun, 25 Sep 2022 13:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH -next] video: fbdev: imxfb: Remove redundant dev_err call
To:     Shang XiaoJing <shangxiaojing@huawei.com>, s.hauer@pengutronix.de,
        kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com,
        linux-imx@nxp.com, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20220923102007.19870-1-shangxiaojing@huawei.com>
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220923102007.19870-1-shangxiaojing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nUhuDGeQC22fSnZFVChdxRDon8my8O0Ltbj+hI/GyFFQwXLFe/T
 IvG7asVkU2ypEiaRXrvTC5gQB036/EcKDk8pCXyOXEFvyGw/wG5CzUpPb6uDcILqHvYLRw0
 CmDfIp7efJVoqy1YPLM0xRKqTUBOI6lforQ1x4Rm8cETT+YTrvjtsusFz8GBaoXzOXejjRl
 NjuMw7kWlbghxPstzcivg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LfnCDeGYQqM=:oiWzlDHJmiMAKtt4uGUDw/
 hsxDNeT/IdCh4e3GF2SVk/P6+H45A3Cl4cI9tMNpJxFz+j0TFwmsxx/7zNkbKh52Lr5ehnBd1
 +zhlSuqdaDeHpbbnWvYhPMSSdGCnD7+ugNfMtMREgq0bdaw1/8N30ID1PjhqZxDmTc19dZWrm
 THQCdRDY4vbN6FI4MiWAu6gNShSqNFCY50UdJTb6byHLd4IlpAzL+xXQZOYQ5jqBAsSheHmcs
 YKHfxVTfcs2dtB9o7K7S/l26k7AHrbhbbqqMldmt7I/worBjWJ78DaEIgpnNfPLBZ8WEEPMRl
 fuI8u6xT3XTUrS35HKfX/d+lVT+66dueoToY1ylO/PcFQODnbEwauIejBFWBl7u0bEbXOCGZB
 +2dXvqYIXha28qYll/M12DYJ0GcPQKF7iSb+rzuWVU3aEocXM9Af0PrnRyhY6/z3k/ffxztaR
 NXymkX52aewTUC08w1pFovldrAbHJ7BgXvpmgUWj/Ut9/n6Y6LBwcu8WUeS2mW+V7LpBkEOMW
 bbrE7gSlK9WhnYElidqhFPuZn0Xkd9XFjtbKIFWea9hFmLRRmTI2Vcy4eJUvOEmZr/97fLWi8
 hTF+SEqfXmCVw2x9XfBXAgalIYS+OCorlFaP9bAtyhr+Jfog5ZgpXNyBfoL1npMM4Tm5Ge+tv
 ygrp85GGslV4cAYtq2krmBq06XMvcMJwn93meWE5vMWJoQ5Z+TM+NVZayg60R8Q4i2CfzHv4/
 hfs075AuVfECODl+4KeHKB/iZSgIoc/obs/839uzIC6HXcmrJtfCiaBEITwBLSVsaBy2DVH98
 hh5wPLQvr0mDDm5k5Ue98Mk4KxbPZOsG4cGTfcdTu/ubfJkRh1e9zA51Q0rs683jUOeQ9CnNL
 ewen23JpdvI/6XlcAnMWM7NqIS+IRsfJCmUGEva9OrHklBhiDcjiigkjiiAC6kb2LAjC8RQ6Z
 94fcUSMb6M94ShEcp8E410Y3m51P1SchODrUOa6qchW91RMxbgNwjAw8dHAzx6cpyP39hZgpd
 xdockjmwc16aDBNOiXzY6w7QTsDOwJ9a0Ix7RyqEzo01vHTiKi46RcVM3BoKXR/1tkU6LtJJs
 XQKBkxgmW9on4T0bthXECeEcI1yfimvIxPC2IRHxA8mhDgg+6+h8bt0Jb95HVrBgH4kxPd4jA
 VvELjOkuFRMev+r2a8xo6mPFB6
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 9/23/22 12:20, Shang XiaoJing wrote:
> devm_ioremap_resource() prints error message in itself. Remove the
> dev_err call to avoid redundant error message.
>
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>

applied.

Thanks,
Helge

> ---
>   drivers/video/fbdev/imxfb.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
> index 94f3bc637fc8..51fde1b2a793 100644
> --- a/drivers/video/fbdev/imxfb.c
> +++ b/drivers/video/fbdev/imxfb.c
> @@ -972,7 +972,6 @@ static int imxfb_probe(struct platform_device *pdev)
>
>   	fbi->regs =3D devm_ioremap_resource(&pdev->dev, res);
>   	if (IS_ERR(fbi->regs)) {
> -		dev_err(&pdev->dev, "Cannot map frame buffer registers\n");
>   		ret =3D PTR_ERR(fbi->regs);
>   		goto failed_ioremap;
>   	}

