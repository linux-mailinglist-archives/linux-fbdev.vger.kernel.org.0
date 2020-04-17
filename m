Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1611ADF6E
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Apr 2020 16:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730778AbgDQOHn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 17 Apr 2020 10:07:43 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58050 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbgDQOHm (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 17 Apr 2020 10:07:42 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200417140741euoutp02a0536f94bb54c4ed7b137bd2e651bc30~GoJCOfUAo1553115531euoutp02c
        for <linux-fbdev@vger.kernel.org>; Fri, 17 Apr 2020 14:07:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200417140741euoutp02a0536f94bb54c4ed7b137bd2e651bc30~GoJCOfUAo1553115531euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587132461;
        bh=yR9hR5vQ0LDWuGEhoKezMZgX8wQ2PeA8KJDI5IkBWeE=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=eNk4Hd38JRXaSSZFmhW0d0I2gW5iqO70idhCMRm/0aG1MCW7p4OYiagl3NOVeeJ91
         IOz+X6DjNtYmE2v91F3fI7C+o2YbCZg1As68tUfSX/d5rk7u2gx8lJR7+yuLOh8HUw
         KW5kNNlxYm5UvJAchb6d8dU8ozRZVLQVw//qvbz4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200417140741eucas1p29ac4939d87b682f0b651db1a1e32a744~GoJCHp5Yh1167511675eucas1p23;
        Fri, 17 Apr 2020 14:07:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 94.4C.61286.D28B99E5; Fri, 17
        Apr 2020 15:07:41 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200417140740eucas1p1832e7b5904351587318f69d882019dc8~GoJBz8qku1656016560eucas1p17;
        Fri, 17 Apr 2020 14:07:40 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200417140740eusmtrp1b4178f4c82a8df31ddc8c10feb8b7dba~GoJBzFfvZ2210922109eusmtrp1G;
        Fri, 17 Apr 2020 14:07:40 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-12-5e99b82db724
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 8B.B2.08375.C28B99E5; Fri, 17
        Apr 2020 15:07:40 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200417140740eusmtip1a662ad4351a869b937e7b55ffc8a8c63~GoJBkZ92l0872208722eusmtip1V;
        Fri, 17 Apr 2020 14:07:40 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v1 4/5] video: ssd1307fb: Convert to atomic PWM API
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        xllacyx@gmail.com
Message-ID: <2157cc9f-5e84-8ca5-fd67-70240eb238d4@samsung.com>
Date:   Fri, 17 Apr 2020 16:07:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200324170532.44384-4-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djPc7q6O2bGGSzZx2/R2zSdyeLK1/ds
        Fif6PrBaLFu2ltWBxWPnrLvsHvNOBnrc7z7O5PF5k1wASxSXTUpqTmZZapG+XQJXxsTp7gWz
        hCrm3Z7A1MB4jq+LkZNDQsBE4tDNhYxdjFwcQgIrGCW6XnxngnC+MErcP98IlfnMKPGofzo7
        TMv1w7+ZIRLLGSUuLnsOVfWWUWL/v3NsIFVsAlYSE9tXMYLYwgLuEldPnwTrFhEwl1g3aRFY
        DbNAqMSGhvdgcV4BO4lNK/+A2SwCqhI3V81hBrFFBSIkPj04zApRIyhxcuYTli5GDg5OoJlb
        XulDjBGXuPVkPhOELS+x/e0csOMkBPrZJY4dvs4KcbWLRPfWS1AfCEu8Or4FypaROD25hwWi
        YR2jxN+OF1Dd2xkllk/+xwZRZS1x59wvNpDNzAKaEut36UOEHSW+n+plBwlLCPBJ3HgrCHEE
        n8SkbdOZIcK8Eh1tQhDVahIblm1gg1nbtXMl8wRGpVlIPpuF5J1ZSN6ZhbB3ASPLKkbx1NLi
        3PTUYsO81HK94sTc4tK8dL3k/NxNjMDEcvrf8U87GL9eSjrEKMDBqMTDa9AzM06INbGsuDL3
        EKMEB7OSCO9BN6AQb0piZVVqUX58UWlOavEhRmkOFiVxXuNFL2OFBNITS1KzU1MLUotgskwc
        nFINjDu+2RfdnBQQ7dJSp1xc8un9Dd4JBzwWNSyOlF/c1MTSc6NpumH0NMk3UcGVd5fe/fls
        6ZanvT88JrpvLC+9tcnmUsUXZmn/uHlFk09aJdg17Ft9LGXn8Q+zUmfpnrruPuPYkZa6ncyC
        IX0F5wxWcn2QYmdKKQ3+anr1cvaV1o9rxXxe/jrFeECJpTgj0VCLuag4EQBY117bKAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xu7o6O2bGGTzabmHR2zSdyeLK1/ds
        Fif6PrBaLFu2ltWBxWPnrLvsHvNOBnrc7z7O5PF5k1wAS5SeTVF+aUmqQkZ+cYmtUrShhZGe
        oaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexsTp7gWzhCrm3Z7A1MB4jq+LkZNDQsBE
        4vrh38xdjFwcQgJLGSV6j11h72LkAErISBxfXwZRIyzx51oXG4gtJPCaUeJCjxmIzSZgJTGx
        fRUjiC0s4C5x9fRJdhBbRMBcYt2kRWD1zAKhEvdvr2OCmH+dUeL31c1gDbwCdhKbVv4Ba2AR
        UJW4uWoOM4gtKhAhcXjHLKgaQYmTM5+wgNzDCbRgyyt9iJnqEn/mXWKGsMUlbj2ZzwRhy0ts
        fzuHeQKj0Cwk3bOQtMxC0jILScsCRpZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgVG07djP
        zTsYL20MPsQowMGoxMNr0DMzTog1say4MvcQowQHs5II70E3oBBvSmJlVWpRfnxRaU5q8SFG
        U6DfJjJLiSbnAyM8ryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QD
        o8ipHreeVSEiH45s7tnoUVG3+cGUe4kBpiLhJydp6938KPm7KGjWbZvqO5M85/uIrY/Xvzz/
        ++rTcmYtX+brFbW+OBrM8m5y5m6zcxLL9Uv0N5yasVLgXbxRV926vyy96iuTfy54UvHmlVZ3
        Uoefi4zIpf64bX94Nm1NZTByufFkVsG/c2oOb5RYijMSDbWYi4oTAdPvRLi4AgAA
X-CMS-MailID: 20200417140740eucas1p1832e7b5904351587318f69d882019dc8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200324170539eucas1p12a3a4f7cd0d8cbd86f40d70a65ab0df5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324170539eucas1p12a3a4f7cd0d8cbd86f40d70a65ab0df5
References: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
        <CGME20200324170539eucas1p12a3a4f7cd0d8cbd86f40d70a65ab0df5@eucas1p1.samsung.com>
        <20200324170532.44384-4-andriy.shevchenko@linux.intel.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


[ added dri-devel ML to Cc: ]

On 3/24/20 6:05 PM, Andy Shevchenko wrote:
> Use the atomic API wherever appropriate and get rid of pwm_apply_args()
> call (the reference period and polarity are now explicitly set when
> calling pwm_apply_state()).
> 
> We also make use of the pwm_set_relative_duty_cycle() helper to ease
> relative to absolute duty_cycle conversion.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch queued for v5.8, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/ssd1307fb.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> index 7a6a44a0b7a6..6e543396002a 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -79,7 +79,6 @@ struct ssd1307fb_par {
>  	u32 prechargep1;
>  	u32 prechargep2;
>  	struct pwm_device *pwm;
> -	u32 pwm_period;
>  	struct gpio_desc *reset;
>  	struct regulator *vbat_reg;
>  	u32 vcomh;
> @@ -297,9 +296,9 @@ static void ssd1307fb_deferred_io(struct fb_info *info,
>  
>  static int ssd1307fb_init(struct ssd1307fb_par *par)
>  {
> +	struct pwm_state pwmstate;
>  	int ret;
>  	u32 precharge, dclk, com_invdir, compins;
> -	struct pwm_args pargs;
>  
>  	if (par->device_info->need_pwm) {
>  		par->pwm = pwm_get(&par->client->dev, NULL);
> @@ -308,21 +307,15 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
>  			return PTR_ERR(par->pwm);
>  		}
>  
> -		/*
> -		 * FIXME: pwm_apply_args() should be removed when switching to
> -		 * the atomic PWM API.
> -		 */
> -		pwm_apply_args(par->pwm);
> +		pwm_init_state(par->pwm, &pwmstate);
> +		pwm_set_relative_duty_cycle(&pwmstate, 50, 100);
> +		pwm_apply_state(par->pwm, &pwmstate);
>  
> -		pwm_get_args(par->pwm, &pargs);
> -
> -		par->pwm_period = pargs.period;
>  		/* Enable the PWM */
> -		pwm_config(par->pwm, par->pwm_period / 2, par->pwm_period);
>  		pwm_enable(par->pwm);
>  
>  		dev_dbg(&par->client->dev, "Using PWM%d with a %dns period.\n",
> -			par->pwm->pwm, par->pwm_period);
> +			par->pwm->pwm, pwm_get_period(par->pwm));
>  	}
>  
>  	/* Set initial contrast */
> 
