Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D35170FDBC
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 May 2023 20:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbjEXSU2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 May 2023 14:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjEXSU2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 May 2023 14:20:28 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED92DE7;
        Wed, 24 May 2023 11:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684952412; i=deller@gmx.de;
        bh=WG+hAFG6SEqXxehKbXada6K5tJh0Wir0acFKWq+QDkw=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=c8kE61iUyxR982QVAOXYSZ1lUUPesqKNJ9fBPljDhDpd/P8qCc/m1jJfP5dBqt56l
         pvd2dkey9aAmeTeihGFkzp1JwmuG49t/Otd6hc3ALQWni0f/kHHSmwyES6n+74UkEz
         EcPaiBg6xYgr+Smti1OVgceXGk0XtegRcvIhf8JglUyI4Fq6aJxvhWFyNe+xnP7679
         KRYkV0bE6AW/zr4mYK7oKh9ak0X/P9RDxpiXOBp4EnLaAZo5k+tQv04LSAAMLoxQmE
         N2htGNHM3BFJL8MOIN4XMmTdcSxCjXP4lUANhQ4vCMgtaJCKZ7RnpzJ5cMdeYfINbV
         g1fQljGwM0vGg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.145.4]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wuk-1q5ALI2lQS-005akz; Wed, 24
 May 2023 20:20:12 +0200
Message-ID: <7e5643de-5d64-272e-cb36-bbe1e5c187ec@gmx.de>
Date:   Wed, 24 May 2023 20:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/4] fbdev: imsttfb: Fix error handling in init_imstt()
Content-Language: en-US
To:     Markus Elfring <Markus.Elfring@web.de>,
        kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Javier Martinez Canillas <javierm@redhat.com>,
        =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Zheng Wang <zyytlz.wz@163.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr,
        1395428693sheep@gmail.com, alex000young@gmail.com,
        hackerzheng666@gmail.com
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
 <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
 <c551c670-7458-ed50-eb2f-5a2b7ba421a8@web.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <c551c670-7458-ed50-eb2f-5a2b7ba421a8@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:25L6+tdLvR4JdvEn3uP+W2huNpRBdOtgMf3hNVOXNlS8iHzDWLl
 dwlVc8x1mOgG/YP+IbLRva/kxwk8YRsFr0g+oGyEbvW/2mlu/c7HFLAb+YCEwYNhqWkRJOf
 A+aOPeqcWy613Hk2U4Ophw9PQAQJgIzfv2cVEE3YteWoKLY2MUhamhxzmaIMmrizmCZ/8uw
 KX121419r/X+/eMQ/L9+g==
UI-OutboundReport: notjunk:1;M01:P0:LIBBXwL4Mpc=;wGLcB2nki+J2zLaqM56D3MfI3ik
 4WuVQeBGN+TpSXMsre4dHsLrKrQj3c0wtcHsO8e2jA1Sl7lOv5kdctLwlM15e4r6dhGmxr4dM
 VgrjoUiMwNFwEbEo2fEXVyxo5NPgNfO9W7momdfWv28jZ3DLTTJQ2XKqiXvEKrmAM5xRRHxLC
 Pe0vFK1fa994OKWM2Y7HP+kOJb65040qmo1kYxatIaVOA2RoE5+JYGKIt7Ehgf/2sbGKIUpfl
 DadgCyqv7R9ic1xHp604qKx0m2e3In6FGGtPpGoYRZjGWN+CKSgFlGjECBqlbUnurbAy10jVs
 mmG4jJ6L0Eaz91eeSW1HhankzDQNzj6/Dvl1reneMGBcs9Eg9uBUlOcT6O5p1LHKmJCL3Sbwt
 tjfOvWfGqrnm58+bKVk/amzeqoDpwawoAulJ6UAfJyEefuJSWXjlPJVoNsPyNl3OPFighbewL
 JY3pirmnAQV99MDTIhmHmIiQsMgEZcIxVtD5iP4DKCYItaGans6gkTsU0pRVobODzgCxmVB1K
 eKxqeBXdaMPLipOvx42QgrWmeGupp72V+nouU7lQaGcdto9CQHM8TKuGNpPvvLCdKkwteSDzd
 ey+kI6Fm1r3TixAJ5eSg37GmwZ3P6YhEstrCGNTGlu/IJwxqZAiG9nlCKCbtYe2MChdyGeBaG
 GaEwDtyLRdP4pB0iMN49gbaHmnvBc0CTkp2Nz96Fx9ML63IVrTYIXR2aBqBxd9trjTKsV7Z+n
 EVFPmLlglWuztNxm2s1E64Ao8dBPxupQ8mtoNLLgmJZXdkNgzaqYrPsCtsacqGR0sx2TFAIaR
 KlPkK0VeQpFM8RSxDZj/WMW41rSPjzXQV+6VR9+/X4Z5NSRX/+VDhqIPyWCVi7d0NJ/dthRGH
 4LcXZGZJ8nNW/qMI6c9X7Kkq/6m2KD2U2ms1R8/T7AR1CyclMmOh289BKOciFPsZe7kqT+KAk
 6HvK+SuJCIH9ofv+JVrv7wlwE+Y=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 5/23/23 19:38, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 23 May 2023 14:32:39 +0200
>
> The return value was overlooked from a call of
> the function =E2=80=9Cfb_alloc_cmap=E2=80=9D.
>
> * Thus use a corresponding error check.
>
> * Add two jump targets so that a bit of exception handling
>    can be better reused at the end of this function.
>
>
> Reported-by: Helge Deller <deller@gmx.de>
> Link: https://lore.kernel.org/dri-devel/069f2f78-01f3-9476-d860-2b695c12=
2649@gmx.de/
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Fixes: c75f5a550610 ("fbdev: imsttfb: Fix use after free bug in imsttfb_=
probe")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/video/fbdev/imsttfb.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb=
.c
> index 975dd682fae4..d3532def4707 100644
> --- a/drivers/video/fbdev/imsttfb.c
> +++ b/drivers/video/fbdev/imsttfb.c
> @@ -1351,6 +1351,7 @@ static int init_imstt(struct fb_info *info)
>   {
>   	struct imstt_par *par =3D info->par;
>   	__u32 i, tmp, *ip, *end;
> +	int ret;
>
>   	tmp =3D read_reg_le32(par->dc_regs, PRC);
>   	if (par->ramdac =3D=3D IBM)
> @@ -1419,8 +1420,7 @@ static int init_imstt(struct fb_info *info)
>   	if ((info->var.xres * info->var.yres) * (info->var.bits_per_pixel >> =
3) > info->fix.smem_len
>   	    || !(compute_imstt_regvals(par, info->var.xres, info->var.yres)))=
 {
>   		printk("imsttfb: %ux%ux%u not supported\n", info->var.xres, info->va=
r.yres, info->var.bits_per_pixel);
> -		framebuffer_release(info);
> -		return -ENODEV;
> +		goto e_nodev;
>   	}
>
>   	sprintf(info->fix.id, "IMS TT (%s)", par->ramdac =3D=3D IBM ? "IBM" :=
 "TVP");
> @@ -1452,17 +1452,25 @@ static int init_imstt(struct fb_info *info)
>   	              FBINFO_HWACCEL_FILLRECT |
>   	              FBINFO_HWACCEL_YPAN;
>
> -	fb_alloc_cmap(&info->cmap, 0, 0);
> +	ret =3D fb_alloc_cmap(&info->cmap, 0, 0);
> +	if (ret)
> +		goto release_framebuffer;
>
>   	if (register_framebuffer(info) < 0) {
> -		framebuffer_release(info);
> -		return -ENODEV;
> +		fb_dealloc_cmap(&info->cmap);
> +		goto e_nodev;
>   	}
>
>   	tmp =3D (read_reg_le32(par->dc_regs, SSTATUS) & 0x0f00) >> 8;
>   	fb_info(info, "%s frame buffer; %uMB vram; chip version %u\n",
>   		info->fix.id, info->fix.smem_len >> 20, tmp);
>   	return 0;
> +
> +e_nodev:
> +	ret =3D -ENODEV;

I think the return value isn't checked at all, so you could
simply return below "-ENODEV" for all cases (instead of "return ret").
Then you don't need the e_nodev label and can simplify the flow.

Helge


> +release_framebuffer:
> +	framebuffer_release(info);
> +	return ret;
>   }
>
>   static int imsttfb_probe(struct pci_dev *pdev, const struct pci_device=
_id *ent)
> --
> 2.40.1
>

