Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1596FF802
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 May 2023 19:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238554AbjEKREc (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 11 May 2023 13:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238853AbjEKREY (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 11 May 2023 13:04:24 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A6F869A;
        Thu, 11 May 2023 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1683824604; i=deller@gmx.de;
        bh=7I9Jkkt/NmTQ9fRkJEgnoFvGjrbuva3u2fJtZdk8Bxw=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=ALzCbmtWN2xEOqU55rIotE6XGC3duk2BaJ1exKCD3m2323OpGFMOEuNu7jSJznOXf
         4jIMUYCQWzTYfathZNy9R3WR8l81KsItrhQVjqzcwgyEkn6W/Qc4wrwmKWQZBUXDnf
         zM90xkR5niOEzZ8D9gu3aBQdR/493U/dwdxevQsxCps+s11oWZ2ntWhjvxzA4008SJ
         SIMuXqehbGJsdEQHFrHreULM3L1vrqcke68gC47vb7r5bIazQ7xHOA61B+1yHr/Yqt
         TeWMLLHqNZL13tLSpR/iASgkfmgQj7DFR4Dl28KX2gzLbKATyL3dhvcCSS7G0sE8bB
         5a7L5Xp6lLPZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.146.253]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvcG-1pk2fM0hNo-00UtD8; Thu, 11
 May 2023 19:03:24 +0200
Message-ID: <e7067cfb-9279-7811-03a0-aa7807423f07@gmx.de>
Date:   Thu, 11 May 2023 19:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] video: imsttfb: Fix use after free bug in
 imsttfb_probe due to lack of error-handling of init_imstt
Content-Language: en-US
To:     Zheng Wang <zyytlz.wz@163.com>
Cc:     javierm@redhat.com, tzimmermann@suse.de,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, hackerzheng666@gmail.com,
        1395428693sheep@gmail.com, alex000young@gmail.com
References: <20230427030841.2384157-1-zyytlz.wz@163.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20230427030841.2384157-1-zyytlz.wz@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k+taHfTALszqr4Kw7n1Z8Vy6ExMuab4R2Bp9DOHOdiJMSnlKQ8j
 Ar/ZTg85twVxmjOGGjOsP6skjdTeTThiOVJvaw28G/rZoangacNc5ArR3u+MXErbfqVH/rp
 XccIOPKeRbocGf6A4x75fAus7eGziCrKUYFTmJoXnX6vHR6S9+OnkeCsK/vPDb4AQ1oQ2WW
 3QLTma1L0iTTxb9xq568w==
UI-OutboundReport: notjunk:1;M01:P0:ly589kscYps=;kx/4L3VmFDejlgGqJDg9SyD8iFF
 bbvaW+A38KNF4+z69frWEoc3cGiS1zKIyC2GSjm9c26OGjuohOrUHy1Vwc2/lV9yDzMPu3YU5
 tE2agaIUHo/WMopFWKz92h7e4ylrcsvlSEXjHNVxlO+gMo1R0vTYuR6FCtEFwYiyDXxeslCbw
 sjn1U41t+KBDuNPjhX0qFwcKPD9XuicbYpJBLOtvdzonnJhT6GfIp3hfcW2QZAzfpzsv3kY8G
 0OLUfbAr+1EuFwxJ/ypz9EhbJPpH9NHgvVDb/SL0IMdyCUe2xBLAHUXbPryU0z7NFh31b4vgV
 cRI9z7+elQZAlaRPBXnXbDF8z5W/JUd93M2dhekjpHmJxMq1X4e6ga/Fry22PjnQ7WjHh+utg
 zXw22wWsbVIGx5U+vPBqJiE7OpeaQoC5Oqbftasos9ElOjktkbtRgtQxw1e+QYap3yYX4L4qw
 UUymW5W9Klalj4E1q6MgLrFlBj6vzD6hHimiYJUzSqolc57dXTCkYkkNZS4me5DxWKdzBnsGJ
 xNltQrpkH/S1Wu9b2O/KW2usqDUb5Cowb2h3fe85QazaoVDui1n447gul93rjRaqTOH28HMOC
 9SKTeDw4BQv+VNllSl2LMUuJhL+ytl44jDfHMWM3+Sd4JCs28cb4DsDpn5mIQJmRGJwlq2rk/
 wnw3+eF4y0+y/epPcg8qnkEiCWguzOH1M91DFaUoD13tDK4DtDswsgldRwdEjlek6Bzgkfebb
 4aWKFNX/V6kwlX4NuZ2tGcxZD6l1HSsx0UB6n9q5H2KOBDivYsiWZmr2HLwgYQ32Q6VF4VChj
 vOZxribwsRqK6lTPWievdpinNLZiilQuWA83yKyyhBBvHxnXZYS/3EXSGjrlmnFcE6VsUmlJi
 RQX0B4CreUCcPWffx47Q8RmYFpKdNGQCj0Veje+j1M+f+Rew9Nua8sf860YunKQJ4vFiUMHkZ
 dkTPq0om+Css7JMQH0FE3+ub2g8=
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 4/27/23 05:08, Zheng Wang wrote:
> A use-after-free bug may occur if init_imstt invokes framebuffer_release
> and free the info ptr. The caller, imsttfb_probe didn't notice that and
> still keep the ptr as private data in pdev.
>
> If we remove the driver which will call imsttfb_remove to make cleanup,
> UAF happens.
>
> Fix it by return error code if bad case happens in init_imstt.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>

applied.
Thanks!
Helge

> ---
> v2:
> - add return error code in another location.
> ---
>   drivers/video/fbdev/imsttfb.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb=
.c
> index bea45647184e..975dd682fae4 100644
> --- a/drivers/video/fbdev/imsttfb.c
> +++ b/drivers/video/fbdev/imsttfb.c
> @@ -1347,7 +1347,7 @@ static const struct fb_ops imsttfb_ops =3D {
>   	.fb_ioctl 	=3D imsttfb_ioctl,
>   };
>
> -static void init_imstt(struct fb_info *info)
> +static int init_imstt(struct fb_info *info)
>   {
>   	struct imstt_par *par =3D info->par;
>   	__u32 i, tmp, *ip, *end;
> @@ -1420,7 +1420,7 @@ static void init_imstt(struct fb_info *info)
>   	    || !(compute_imstt_regvals(par, info->var.xres, info->var.yres)))=
 {
>   		printk("imsttfb: %ux%ux%u not supported\n", info->var.xres, info->va=
r.yres, info->var.bits_per_pixel);
>   		framebuffer_release(info);
> -		return;
> +		return -ENODEV;
>   	}
>
>   	sprintf(info->fix.id, "IMS TT (%s)", par->ramdac =3D=3D IBM ? "IBM" :=
 "TVP");
> @@ -1456,12 +1456,13 @@ static void init_imstt(struct fb_info *info)
>
>   	if (register_framebuffer(info) < 0) {
>   		framebuffer_release(info);
> -		return;
> +		return -ENODEV;
>   	}
>
>   	tmp =3D (read_reg_le32(par->dc_regs, SSTATUS) & 0x0f00) >> 8;
>   	fb_info(info, "%s frame buffer; %uMB vram; chip version %u\n",
>   		info->fix.id, info->fix.smem_len >> 20, tmp);
> +	return 0;
>   }
>
>   static int imsttfb_probe(struct pci_dev *pdev, const struct pci_device=
_id *ent)
> @@ -1529,10 +1530,10 @@ static int imsttfb_probe(struct pci_dev *pdev, c=
onst struct pci_device_id *ent)
>   	if (!par->cmap_regs)
>   		goto error;
>   	info->pseudo_palette =3D par->palette;
> -	init_imstt(info);
> -
> -	pci_set_drvdata(pdev, info);
> -	return 0;
> +	ret =3D init_imstt(info);
> +	if (!ret)
> +		pci_set_drvdata(pdev, info);
> +	return ret;
>
>   error:
>   	if (par->dc_regs)

