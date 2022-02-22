Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF114BF307
	for <lists+linux-fbdev@lfdr.de>; Tue, 22 Feb 2022 09:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiBVIBl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 22 Feb 2022 03:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiBVIBj (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 22 Feb 2022 03:01:39 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD4B148921;
        Tue, 22 Feb 2022 00:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645516865;
        bh=Wbkwg6IDeSigfLVXP44w+U6JsS8t374MsL2Uv1lERNM=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=jJ8agmZRWaSWMbzTiNL8UEB9YSkBvS0meQFiTDtdClaMh1jRW7CSQxXwv5IanTDOT
         FRpKcavULXTiThiqxwIwyCfB7RRDiIgKUol7byb71+tJat6s8xwCRDKrKoXouXovdP
         Eh8KLVN1f32FsjtzpXedVLeTuN4Q+FfHHGSFsyZ8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.171.113]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QWG-1nI0GG3dtw-004Qsi; Tue, 22
 Feb 2022 09:01:04 +0100
Message-ID: <ed931578-c79e-0161-24d5-ab9c302350e6@gmx.de>
Date:   Tue, 22 Feb 2022 09:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] video: fbdev: via: check the return value of kstrdup()
Content-Language: en-US
To:     xkernel.wang@foxmail.com, FlorianSchandinat@gmx.de
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <tencent_AD2E09472E455F78B792E6BF114813B35206@qq.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <tencent_AD2E09472E455F78B792E6BF114813B35206@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wJCFas3iTYDKRy/G4Q+YVsZlHbHu1InHntEr+HGd7csopCqt0gk
 Het9BIY3anRiLBr624c2IjMYYMJUZjywh4jthMas2Q5s9EzZrm0uPIK2/Sp4E726khTTnCa
 eFCCrIIx+PBTlYHRg7ZQHQL9MMDXukUq6XPQkTyiP1xIYMfIkSZIyKsrzM+wGS0GIurVap1
 S3Pxl3XB6t4hE8/KJLZog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZEU8riefV3U=:fv8lZBcdcNQE++XqHrpoeK
 asv+D/k7hSJ6Yxz9If35D9hoWXtsF5LOd+Lap02rV+c4i9owlERKYMdR1dAU+uqyIg1Lf+R15
 QMhdk3wm9Xwcvznm7LaJAyNq02RFRw1qtBXhhzMKrDnlxQhNlBliexXYRCVGp7VlH2pkf6dB5
 A+G56SCsqfccbO5RHGCljqnJ76hsZoUjwCDBJtiLL3fG/olJzyoRCnfdcYJQ4ys5Ovdmc99J4
 hZjx5XyLp6liVSKXw1mUpgQ3GntX2/3F0FTgzH7wDO1OmtYZT1EI2CN2O25vWtv18oGKZg65z
 u9tz/Vz8um/SjqhUkERjsP3fcx3Pxga36b6xn794KyPjUSYPfJA1ZcSwkktgjZe/22EpUxfgP
 toHXdmqnxIjLzP7v4KtLtf/mjEumec+YWoEgCS3Xexrfx9LoX3xUUvEr58Au5sV6SgSlMScWr
 047rEP6QElE9gGSHO7BX1Yc3tel8dv/zaEjn6BtYuskL4bTBoOAGeoNIUhyv2GXpiIHFk3Wi4
 Hbb3ra2hZfYoYLmGfY1uwX2nRsClBkgPtV6wlDY1kRPDKsUHGjWyfSp0yBj+WMOEvBre6i3zM
 tXUaNNnxP0YP86BVW5sOLcc2xuUBcyTdJHZeQv7Cuztp6Rp94zzngS5Ami9xCWjJcZosRyFfz
 teODOvf8Ml68vt2SpnpxnPXo520Qw+ZvKOWXsmv+ykWpyW+IzWatrY4Ld92zi2ObT93gxKOL0
 tEeZw/ceJ7YHj0Xzu9XtGO46NoljWyupSZsu9LEPAQ1AwQUPeq2+jckSIWanRrcCKjdeHDWHm
 plY4gLH+KnJlioYXiUIZsVz1QkWfhRagmtvXEnjGJkIDgOFKN6vIrfv0KiJTpusogKgPU+Mxt
 O+LmZwBs3RMx63lxoOWv8eRovtr3S0YDY//QYVKuXhfvLr9PiYNHemE6ZZYK8ecNGyHvJx7yD
 psSu+OE3d6wsAna8JHSD6JMx5tUdtE1aK2FqMCTqflaq+A47H24I95zDrGgFae1JNm4zxawZL
 S5IcalwVIRU6A9ojq6aIHjBWRIslshfdnawHPtKX7CMDjSNpeDPYOMzhfFgcP7Fp3kHw5OIud
 f8TUg6ngHvCz6g=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 2/21/22 11:37, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
>
> kstrdup() is a memory allocation function which can return NULL when
> some internal memory errors happen. It is better to check the return
> value of it to catch the error in time during the setup of viafb.
>
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>

applied to fbdev for-next tree.
Thanks!
Helge

> ---
>  drivers/video/fbdev/via/viafbdev.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/vi=
a/viafbdev.c
> index 22deb34..2d67c92 100644
> --- a/drivers/video/fbdev/via/viafbdev.c
> +++ b/drivers/video/fbdev/via/viafbdev.c
> @@ -1939,8 +1939,12 @@ static int __init viafb_setup(void)
>
>  		if (!strncmp(this_opt, "viafb_mode1=3D", 12)) {
>  			viafb_mode1 =3D kstrdup(this_opt + 12, GFP_KERNEL);
> +			if (!viafb_mode1)
> +				return -ENOMEM;
>  		} else if (!strncmp(this_opt, "viafb_mode=3D", 11)) {
>  			viafb_mode =3D kstrdup(this_opt + 11, GFP_KERNEL);
> +			if (!viafb_mode)
> +				return -ENOMEM;
>  		} else if (!strncmp(this_opt, "viafb_bpp1=3D", 11)) {
>  			if (kstrtouint(this_opt + 11, 0, &viafb_bpp1) < 0)
>  				return -EINVAL;
> @@ -1969,6 +1973,8 @@ static int __init viafb_setup(void)
>  				return -EINVAL;
>  		} else if (!strncmp(this_opt, "viafb_active_dev=3D", 17)) {
>  			viafb_active_dev =3D kstrdup(this_opt + 17, GFP_KERNEL);
> +			if (!viafb_active_dev)
> +				return -ENOMEM;
>  		} else if (!strncmp(this_opt,
>  			"viafb_display_hardware_layout=3D", 30)) {
>  			if (kstrtoint(this_opt + 30, 0,
> @@ -1995,8 +2001,12 @@ static int __init viafb_setup(void)
>  				return -EINVAL;
>  		} else if (!strncmp(this_opt, "viafb_lcd_port=3D", 15)) {
>  			viafb_lcd_port =3D kstrdup(this_opt + 15, GFP_KERNEL);
> +			if (!viafb_lcd_port)
> +				return -ENOMEM;
>  		} else if (!strncmp(this_opt, "viafb_dvi_port=3D", 15)) {
>  			viafb_dvi_port =3D kstrdup(this_opt + 15, GFP_KERNEL);
> +			if (!viafb_dvi_port)
> +				return -ENOMEM;
>  		}
>  	}
>  	return 0;

