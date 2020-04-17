Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7DA1ADF77
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Apr 2020 16:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730818AbgDQOIF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 17 Apr 2020 10:08:05 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58169 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730929AbgDQOIC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 17 Apr 2020 10:08:02 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200417140800euoutp02907ec7dce04e835201544377ec894fb6~GoJT2PIQ31573015730euoutp02S
        for <linux-fbdev@vger.kernel.org>; Fri, 17 Apr 2020 14:08:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200417140800euoutp02907ec7dce04e835201544377ec894fb6~GoJT2PIQ31573015730euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587132480;
        bh=77Mwf962+FuZGbL9oamghlTb033AywNJjiaPVhTzWic=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=E1TjHNIw+jJZCIUz2uGRg1D5QWWYeAqkyUMsg00jRbwnFXvNM3mzbWy4hwzaLI+v1
         TieuQ7xD5uAK3V3QKH1gHTBeEuGY27ZpDLfZRzaIv4l3QxG1zo4k/Z1qTGeIX97I6z
         ot2aZWa2sTEqsTeI97PLv49Q7g4yn6eNafiERCxU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200417140800eucas1p2b199351b6cd88d4814f3aead42121a54~GoJTovjoC1773817738eucas1p2B;
        Fri, 17 Apr 2020 14:08:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id EE.EF.60679.F38B99E5; Fri, 17
        Apr 2020 15:08:00 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200417140759eucas1p1f228ea1b09d74f433be9bf16a21d6cc6~GoJTT_XRc1490114901eucas1p18;
        Fri, 17 Apr 2020 14:07:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200417140759eusmtrp1c6bb1a6f007ff77c6d34622d82eb1849~GoJTTWlMG2228222282eusmtrp1o;
        Fri, 17 Apr 2020 14:07:59 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-e6-5e99b83fcaf6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 23.E0.07950.F38B99E5; Fri, 17
        Apr 2020 15:07:59 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200417140759eusmtip2f1dffef3698a116be9860a2923925a33~GoJS1F7e92969929699eusmtip2b;
        Fri, 17 Apr 2020 14:07:59 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: imxfb: ensure balanced regulator usage
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org
Message-ID: <1dcf1273-ae01-02c6-d9a4-5eef744ab764@samsung.com>
Date:   Fri, 17 Apr 2020 16:07:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200323211626.24812-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjlt3u3XUfTn9PyS0NhUVKUziy4momC2PqnF4GhaV3zouKTXbUM
        JFNKXZIvTFyhouZjxNRl85EIzmo+QIM0wowKBU3wrYTaNK9Xyf/Od75zON+BjyIUXWJnKjYx
        hdUkMvFKiYw0fVwbOh3QXh6hMtUgemR1XkL/Gr1C60s7SNo48UVM9z1bENPa9UaCtrYZSXq6
        1Yn+VlSCAmzUHbrvUrVRnydR/3hqEanf1D5Ut8y1i9QFVpV62eh6VRoq84ti42PTWI2n/x1Z
        zKphTZTcje9bs9aJTJQn1yIbCvBZePe4DmmRjFLgBgQd+SsSYVhBMGttEgnDMoKWxkrJnqW6
        M08sLOoRLI+M7qpmEZiat6S8SoJ9oShHj3jsgC/B1JSB1CKKcsTBsGg4zOsJ3CSChuViktfI
        sT8MvN4S85jEx2BptXSHP4hvwtLPXrGgsYf+8skd3gYHQdZ8DsFjAjvB2GSlSMBukP32BcEH
        AB6QwqOaOSScHQRT7eOkgB1gxtIqFfARGCzJJwWDAYE1d3rX3YagvmRzt/R5GB9al/AVCHwC
        mjo9BToQWhatBE8DtoWvs/bCEbZQbCrbpeWQ+0QhqI9Dc12zZC9W29FIFCKlbl813b46un11
        dP9zqxCpR05sKpcQzXJnEtl7HhyTwKUmRnvcTUowou2fGty0rLSjzr+RZoQppDwgV+WXRyjE
        TBqXnmBGQBFKR3lP8DYlj2LSH7CapNua1HiWMyMXilQ6yb2rf4crcDSTwsaxbDKr2duKKBvn
        THTZxz0su/hPeqS5AqQ9Yf6hCx80w96GQP0k437uZUG8xq7aweHWxlFlSAbX53VjpktsUQR+
        9h4bThkMZC6YeukN3+cZhgmLrq2prkLmU1413BPJpl73u6b65HZq0qzq93Ve0vcs1MYVHpp6
        lRz83iWkoGym0NWO67vYHT4fsqYkuRjG6ySh4Zh/cB4aZk8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xe7r2O2bGGTydom1x5et7NouHV/0t
        Vk3dyWKx6fE1VosTfR9YLbp+rWS2+Lt9E4vFiy3iFrcnTmZ04PTYOesuu8emVZ1sHve7jzN5
        bF5S77Hx3Q4mj/6/Bh6fN8kFsEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZ
        Kunb2aSk5mSWpRbp2yXoZXxd95OpYJ9Axd+mX8wNjJ28XYycHBICJhKLdnWygthCAksZJfom
        x3UxcgDFZSSOry+DKBGW+HOti62LkQuo5DWjRMf/pewgCTYBK4mJ7asYQWxhAU+J58/XsYD0
        igi4SXxcJwlSzyywnkli8qm3jBDzpzNKXH2RAmLzCthJnFrzH2wvi4CqxKevU1lAbFGBCInD
        O2YxQtQISpyc+QQszingItH0vp0ZxGYWUJf4M+8SlC0ucevJfCYIW16ieets5gmMQrOQtM9C
        0jILScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBEbktmM/t+xg7HoXfIhRgINR
        iYfXoGdmnBBrYllxZe4hRgkOZiUR3oNuQCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OByaL
        vJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjDFHFavlWTIt80oK
        En83HmuOvVcrt5X7PoN95BXDf7xtD9OX5zcI5D2+lNQj+cn70oGPHLo36u4Fbz+6za284f5a
        sys8YcYB7awR/WdOpbZfODLXMV4rJyc3dk2Im/xj3vr1vS6nXkidz39+w+Tl1ReLC4211le2
        RzVsW9SYkzzxmEHM7gP7lViKMxINtZiLihMBU6EHit4CAAA=
X-CMS-MailID: 20200417140759eucas1p1f228ea1b09d74f433be9bf16a21d6cc6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200323211646eucas1p270ab02024c326adba5a50b908ef8ba8a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200323211646eucas1p270ab02024c326adba5a50b908ef8ba8a
References: <CGME20200323211646eucas1p270ab02024c326adba5a50b908ef8ba8a@eucas1p2.samsung.com>
        <20200323211626.24812-1-u.kleine-koenig@pengutronix.de>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 3/23/20 10:16 PM, Uwe Kleine-König wrote:
> The fbdev framework doesn't care to call the .set_power callback only on
> changes. So the driver has to care for itself that the regulator doesn't
> get disabled more often than enabled.
> 
> This fixes the regulator warning
> 
> 	unbalanced disables for lcd supply
> 
> which can be triggered by doing
> 
> 	echo 4 > /sys/class/lcd/imxfb-lcd/lcd_power
> 
> twice.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Patch queued for v5.8, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/imxfb.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
> index 370bf2553d43..884b16efa7e8 100644
> --- a/drivers/video/fbdev/imxfb.c
> +++ b/drivers/video/fbdev/imxfb.c
> @@ -172,6 +172,7 @@ struct imxfb_info {
>  	int			num_modes;
>  
>  	struct regulator	*lcd_pwr;
> +	int			lcd_pwr_enabled;
>  };
>  
>  static const struct platform_device_id imxfb_devtype[] = {
> @@ -801,16 +802,30 @@ static int imxfb_lcd_get_power(struct lcd_device *lcddev)
>  	return FB_BLANK_UNBLANK;
>  }
>  
> +static int imxfb_regulator_set(struct imxfb_info *fbi, int enable)
> +{
> +	int ret;
> +
> +	if (enable == fbi->lcd_pwr_enabled)
> +		return 0;
> +
> +	if (enable)
> +		ret = regulator_enable(fbi->lcd_pwr);
> +	else
> +		ret = regulator_disable(fbi->lcd_pwr);
> +
> +	if (ret == 0)
> +		fbi->lcd_pwr_enabled = enable;
> +
> +	return ret;
> +}
> +
>  static int imxfb_lcd_set_power(struct lcd_device *lcddev, int power)
>  {
>  	struct imxfb_info *fbi = dev_get_drvdata(&lcddev->dev);
>  
> -	if (!IS_ERR(fbi->lcd_pwr)) {
> -		if (power == FB_BLANK_UNBLANK)
> -			return regulator_enable(fbi->lcd_pwr);
> -		else
> -			return regulator_disable(fbi->lcd_pwr);
> -	}
> +	if (!IS_ERR(fbi->lcd_pwr))
> +		return imxfb_regulator_set(fbi, power == FB_BLANK_UNBLANK);
>  
>  	return 0;
>  }
> 

