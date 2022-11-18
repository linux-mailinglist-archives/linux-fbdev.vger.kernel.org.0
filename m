Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C3B62FA75
	for <lists+linux-fbdev@lfdr.de>; Fri, 18 Nov 2022 17:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241618AbiKRQjc (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 18 Nov 2022 11:39:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235242AbiKRQja (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 18 Nov 2022 11:39:30 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513EF6B3AF;
        Fri, 18 Nov 2022 08:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1668789550; bh=a0vbrUlvLVO+t2uJ+7f9BfxYCaU70DpA3blyiDSkkAA=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=eBCtZbZDBGbgDrXs2XaINW82Mx6TQSDwWjHGlJ+pQBGK5xDJzwSRCku514TVXKIdu
         DSmR3A1jNzcx5788fk9MLK54O6yCqquwQ9BvpM0uThyql+fi9agT/HPET5WM8vPwyq
         IRRNmf18oisi/KseiB+rboseDItXLxuypRd1+6dqnTKspsNip9wfl8Lp1oIgHr3Ax/
         HkBeacoJR7RNuMcWrprAslB8/x3WQoPW0Zi6EF5c++T1431gOnLpppccH9fLfcClSH
         yUqEfGJe0WBxkyt+sqGS1p5cpXP3ALoqcgXBBlrVhcKo/Se6UkZOVuFhU9SgSHsGqJ
         QvNPAvN5PV8Yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.164.156]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8ob6-1oyhKt2dUc-015oBz; Fri, 18
 Nov 2022 17:39:09 +0100
Message-ID: <7fcf8e63-7b17-2817-db57-e046f9e2601f@gmx.de>
Date:   Fri, 18 Nov 2022 17:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] fbdev: da8xx-fb: add missing regulator_disable() in
 fb_probe
Content-Language: en-US
To:     Dongliang Mu <dzm91@hust.edu.cn>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20221118141431.3005015-1-dzm91@hust.edu.cn>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20221118141431.3005015-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jqH1y703bQ6BAQ5V8xbTE+CDBa/IxHYCML1hy9S0oTMebLknPcF
 4ORBaAxOn//KRENmPkoqTtBCS5XHGpH74atGx0CH4eZEy0xjG1cjzpLHhJohT21Nu/66zBE
 nUi+oYe2HR2LFW+5+wN2ZVTHgZCnpGZgK6tzE6XvZ7kKRPzv8NWZnHuf7Vj2QxZq8zYMgv6
 +09dvVIfn2ldW7BVd7qXQ==
UI-OutboundReport: notjunk:1;M01:P0:8AqydaM4K6c=;zd58ZkKkuT5wsAKJtmkeedjRRT0
 L8NhWxJxYlBoolLo9tySS8S+Qh6+iMKPcnt69zKQ47SyTNYvKhI8grCpAURpidQyFqd81P3uf
 JBEXiXAU7Q5gCQwF0scz/X9hiLgbQ/JLNdw3K/49sQDScV5Wi2jQh0FpT9zLyxIeJoFKkePj9
 +upbFVUl/yCaV/dLWiCYMSwOk9PCFEoTyRv/LA1W02mRfLWYQhuS4f49BtClqsoXW6v/2qQXX
 Z8k02VcqyvTBC+I8OvVRc7QUG0hfK2JOGwYmmn3XqrK9jYYhCaOLCq0E5KKuW6dPrNVMXiZwQ
 Ot7XtGnD/lrr0B0HPdjuOOfgMSr/71wH00oAF/l8lzp8kD0/lHlsTT7LcS7CkWuOTLA7WNjKd
 //hZDcquEwJMHYSVgzFXn11ho4pHo/LdXMtjrJpjxuWeFHVNdaX+43eysv6CrvNL4WR7pFKfN
 a7CBT8tl8XaZCD/Ul5hHWJgyHIb+wkhAd4seJQBB87MYIrPBGnG/PUISBSVLK5GYs1RysiswK
 82TEizi5oDplNDfC+gAB70MUVUdYRBpPljtnQBmPh5geKhEOqR8d7N04KH0MSyDYtsqmSuNtT
 vAVnE40yWiL9J0Ak4BR97wiPQxjGfTFj1R8k+PuiI5eIC1ICbD2U8qKLylX1u7bHVJwYY//77
 +E/ePRm2zeY0LO/yMzX/PKpPsuinKNKDJE6Df0gyWYEdaDzibrANZGOXBGSNvJlCvh0mOfLZt
 YT06J8bRFBK2pKLrUbb9aBLZcWiAjX/gAzkP51MbCF7VQZXJXT2hWvWQh+5m+1a66SF4xkWD1
 7K/Wvpn1iqjn6szymYptMPK6skaNuzA15Jso7ih0CfcHktZK2RYoiHFZBTzipLc6p4xvQ63eG
 X3gF0uBZI370bR9rLhYEtSNtO6FSExRrVzD3BtjqvnOoVnnuWvnAbp4bfthfRZVjd2Lbow497
 nHHHi4ERZCN6kjs8qveaIaYdA18=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 11/18/22 15:14, Dongliang Mu wrote:
> The error handling code in fb_probe misses regulator_disable if
> regulator_enable is called successfully. The previous commit only
> adds regulator_disable in the .remove(), forgetting the error
> handling code in the .probe.
>
> Fix this by adding a new error label to call regulator_disable.
>
> Fixes: 611097d5daea("fbdev: da8xx: add support for a regulator")
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/da8xx-fb.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-=
fb.c
> index 11922b009ed7..cd07e401b326 100644
> --- a/drivers/video/fbdev/da8xx-fb.c
> +++ b/drivers/video/fbdev/da8xx-fb.c
> @@ -1431,7 +1431,7 @@ static int fb_probe(struct platform_device *device=
)
>   		dev_err(&device->dev,
>   			"GLCD: kmalloc for frame buffer failed\n");
>   		ret =3D -EINVAL;
> -		goto err_release_fb;
> +		goto err_disable_reg;
>   	}
>
>   	da8xx_fb_info->screen_base =3D (char __iomem *) par->vram_virt;
> @@ -1475,7 +1475,7 @@ static int fb_probe(struct platform_device *device=
)
>
>   	ret =3D fb_alloc_cmap(&da8xx_fb_info->cmap, PALETTE_SIZE, 0);
>   	if (ret)
> -		goto err_release_fb;
> +		goto err_disable_reg;
>   	da8xx_fb_info->cmap.len =3D par->palette_sz;
>
>   	/* initialize var_screeninfo */
> @@ -1529,6 +1529,9 @@ static int fb_probe(struct platform_device *device=
)
>   err_dealloc_cmap:
>   	fb_dealloc_cmap(&da8xx_fb_info->cmap);
>
> +err_disable_reg:
> +	if (par->lcd_supply)
> +		regulator_disable(par->lcd_supply);
>   err_release_fb:
>   	framebuffer_release(da8xx_fb_info);
>

