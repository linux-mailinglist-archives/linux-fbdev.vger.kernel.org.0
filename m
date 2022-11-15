Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED707629169
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Nov 2022 06:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbiKOFOt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 15 Nov 2022 00:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbiKOFOr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 15 Nov 2022 00:14:47 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 927B0B7F3
        for <linux-fbdev@vger.kernel.org>; Mon, 14 Nov 2022 21:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1668489263; bh=KgFk/xXs4wooAEyWU7hH+aiykcaLtIFzqeYTFoU05b4=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=m52tl1kxeY5lP1+N0D6tyTho9y7kDlzquF0VeYJJV196gjPK4cHPinvUPjeMcz8EX
         BAxBb4eMzlmbQ7549PosLGM4yuS2HzL1BLiomGSo1rb2zA//yotK+8uhOO3ohCOerh
         x4pgbB5j2hQqOmJb43Z0Ki2kYLKBG+icyEK22rjfyvAMLzPESzIAM/mVqblgAh5WNT
         IoZ13mZjl5hOkisKGkWZa695XsqEkiKtjZH6xHS51mJhI7Bg+P4qtN+foPcA/3VMqv
         0yiJJYNv+t+/1LzKJZUTTPw+4CqzKSEj0vJntS+Gp9sGnh8Wpq1ESTkwapGNhEAKcq
         fc54FPOd+1w3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.131.87]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2V0H-1p6GyO0e5P-013xDp; Tue, 15
 Nov 2022 06:14:23 +0100
Message-ID: <156a9800-b40a-8e83-86d2-27f9e2e67523@gmx.de>
Date:   Tue, 15 Nov 2022 06:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH -next] fbdev: via: Fix section mismatch warning in
 via_core_init()
Content-Language: en-US
To:     Shang XiaoJing <shangxiaojing@huawei.com>,
        FlorianSchandinat@gmx.de, corbet@lwn.net, sfr@canb.auug.org.au,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20221115025306.2602-1-shangxiaojing@huawei.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20221115025306.2602-1-shangxiaojing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2GI0pUjGVfeNJMftirPyw63oERa8sZtIkkkl/tGYhpaiBnakcu/
 59jwTOFWcKpe/3Sh2k+OWuX9l4Jhxkjwv+DsdUJLSIAUKvuWgWoGlv0EqL0hy91TtYBLqTG
 qv1Z2Vx1PoPImc8UX8lbGsJW54vV7/S/CvfR3Cy8OodhDP5tJClWf5EZn70TUD7SQ07Z1q/
 wL+ZEXhpXOJwTUQjsVvWg==
UI-OutboundReport: notjunk:1;M01:P0:LPqbOtCf4oQ=;hC4FE2548REoYJRfGLKEV8uSaBD
 UlIJ7OTHg7XOyWIPC5lZIHj2HI26E32iO3QhgkwHdgsueZP/IDnKJ9a3QDA20Timqd0QIHrpe
 mOINAwuo61p63ozX6X3L6cwbt3BUDbKdTGdWSTeUM7glwFPbf86MJHHWO9DXGMvOaNQ0fdBSy
 aUM3fYiU00BySxohXNz0tBYYA5fPCEp+H3CcAznBxTzs7OHWAWpdqUgilRC8PnO8Zns1GRZWV
 W6wT8nnUFk8BclpMKocwEaGliUhBKFKxdzLBmSMRef0Wf+PzY07ak0ey1Iv0EW6Y/gWMzS5A+
 7aGG/5uxwjr3/HIDqT9FjwK3jS4cxc+dwPl9HuAaRRTHI5e374ePvuBZmOOkJ2VDofs7oqyMr
 Asu5ORJ+IVrMWu1xORDTjlIjtamF94VoLpLe/okrmTtkUG6x0gsCwrsZhwNmxQDG+LQFjql1Z
 M+CI2H8hhHuh1upTVYnkXFWMySFzSLE4VwGLFr9qI3XoPp3Zua+xndV7msbHUeqhg6FpSRKg5
 cuzgc4HNk5Q6rT6Mng0Xs2xeHUpPSMjdN1/i6Z8tdKEyNgstzEbODRjCNzcVu+onXJFu+3auB
 QUObK5ZL6/DdPJsO+C3hqs+RboemqMPNaoPDOvVFmMmazZcgBsdlrAP75vqDi1Y7Acyo9g6WX
 FmF8/L00lbJ5zGKbbd64D3m2nfmFQXi4H5jtyV/ZpFAF01S2vM6QZ2fT/mgI1qtFRgb/8s/eM
 kNyoZDt5hPcawTzfk8fEUVBshCrDPqHwNW8NB4Ce4eB7Ji2xbxmjA42pSR5N2AH3tEaJyBU6S
 XEld0BcNyRPlbw6oTcvGxUzoYwKMmbnfEt2dFdmikwYeNeQFU829rN6GqORJV/gue+uK4qlhp
 6b1Qbyqb5ffFLHxBTKLp9IsgSBTI2FTYBEqc46Ds6XG0w2mZ7Hfrq2myWVIokUrJOBkiFB4g6
 +jpXyBvQvzJ1a0uw5DBFfyTylt8=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 11/15/22 03:53, Shang XiaoJing wrote:
> Due to viafb_exit() with "__exit" tag, it should not be called by the
> __init function via_core_init().

I wonder if you can't instead of this and your previous patch (ab885d8c7e1=
5)
turn the i2c and gpio drivers to proper platform drivers, e.g.
adding to bottom of via/via_i2c.c:
module_platform_driver(&via_i2c_driver)
instead of viafb_i2c_init() and viafb_i2c_exit().

Shouldn't they then automatically be loaded/unloaded?

Helge

> WARNING: modpost: drivers/video/fbdev/via/viafb.o: section mismatch in
> reference: init_module (section: .init.text) -> viafb_exit (section:
> .exit.text)
>
> Fixes: ab885d8c7e15 ("fbdev: via: Fix error in via_core_init()")
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> ---
>   drivers/video/fbdev/via/via-core.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/via/via-core.c b/drivers/video/fbdev/vi=
a/via-core.c
> index b2e3b5df38cd..b8cd04defc5e 100644
> --- a/drivers/video/fbdev/via/via-core.c
> +++ b/drivers/video/fbdev/via/via-core.c
> @@ -734,7 +734,6 @@ static int __init via_core_init(void)
>   	if (ret) {
>   		viafb_gpio_exit();
>   		viafb_i2c_exit();
> -		viafb_exit();
>   		return ret;
>   	}
>

