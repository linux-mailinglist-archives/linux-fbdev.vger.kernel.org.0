Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED8021B875
	for <lists+linux-fbdev@lfdr.de>; Fri, 10 Jul 2020 16:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728526AbgGJOYA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 10 Jul 2020 10:24:00 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55152 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728516AbgGJOX5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 10 Jul 2020 10:23:57 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200710142354euoutp01c0e043b9b32f3351e04afc9ebe788b2f~gajLqIJcn3218432184euoutp01Z
        for <linux-fbdev@vger.kernel.org>; Fri, 10 Jul 2020 14:23:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200710142354euoutp01c0e043b9b32f3351e04afc9ebe788b2f~gajLqIJcn3218432184euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594391035;
        bh=k6kKp5Q44utOhq6BdHSSWTCNyx+Oy/mLFO4L6jIZR4E=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=FWkXxVAEaWyVMmJKgl2ZFI0GwpDBIxzQ+pkEMw7kHlvtTVrTgdfDw25YyoKQSzDol
         IjabuHTphc4EiyVu4lnfSe3t5Q1vD47IBeS6RuMMsnPYUrS/bN9yI3IsQf48HzqzWs
         17MQwkRRnYPlrN1ZWMfArXDaQVm89d3HDrY7Fnng=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200710142354eucas1p2d950849266e3b1f7ac3b551c09a2e080~gajLIul0n0954709547eucas1p2C;
        Fri, 10 Jul 2020 14:23:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 0B.DE.06318.AF9780F5; Fri, 10
        Jul 2020 15:23:54 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200710142354eucas1p2b4509184e94ba8c55ae66f9c5ba1f380~gajK0iyi80953909539eucas1p2C;
        Fri, 10 Jul 2020 14:23:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200710142354eusmtrp2490b1926c917b6fc0a43c700af7399be~gajKztZRi1267512675eusmtrp20;
        Fri, 10 Jul 2020 14:23:54 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-3f-5f0879fac43b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 85.71.06017.9F9780F5; Fri, 10
        Jul 2020 15:23:53 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200710142353eusmtip1e6c80cfac1c21c3ab467fab46d269dda~gajJ_ecqM0341503415eusmtip1Q;
        Fri, 10 Jul 2020 14:23:53 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] omapfb: fix multiple reference count leaks due to
 pm_runtime_get_sync
To:     Aditya Pakki <pakki001@umn.edu>
Cc:     kjlu@umn.edu, wu000273@umn.edu,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Enrico Weigelt <info@metux.net>,
        "Andrew F. Davis" <afd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        YueHaibing <yuehaibing@huawei.com>, linux-omap@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Message-ID: <474b3931-4638-0eab-de96-2038a8e3ac7d@samsung.com>
Date:   Fri, 10 Jul 2020 16:23:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200614030528.128064-1-pakki001@umn.edu>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTmt3t3791odp3ZThYVk6KCtLLoUiEW/nGh6IEFvcxmXh/kpuz6
        yCDyhcV6akaklpaaz5xMSZ2hZdlMcYaZpVYK2UNrbaYSWq66u0X+953vO9/vfOfwozDlqNSL
        itLFcXqdJlpNyPF7T6asq6eTqJA19sz5jL09k2Sa3jSRTFmbE2d6Ju0Ek1ZoJJi+lEYJ03az
        k2TaLjqkzHNzHsHkFl3CmcKSKcTUmK5ijDG/n2AutKYQzOvJj3jAXDb9sU3KFt4fkbBfrVaS
        bb5RSbKD5ywSduzLMMledtgI1vKqTsK+uJVKsuOmxbvlB+VbwrjoqARO7+t/VB6Za0iXxprV
        J7LP5xLJ6MUiA6IooNfD44xAA5JTSroUQZ/9ATIg2Z9iAsFEyz5RGEfwsNzmEgRDs6mdFIUS
        BA0XLYRY2BAY6mpxoYugN0HmmXKXw4M+DF0d2S5+Hu0NRWm/XBijBzDIrg0RYihof8iocBdo
        nF4GxpkBiYA96f3wbeiRVMAK2h2eXh92WWX0Rqjs6sLEZ1TQP5wvEfESqLPlYUIeoK9TUFQx
        QYipA+HtaD8mYg8YtdSSIl4EvxoEs2CoQjBz9tNfdx2CkivOv+7N8No6TQhJMXolGM2+Ir0V
        njtsuHhHN3hlcxdDuEHWvWuYSCvgbIZS7F4O1XeqiX9jDQ1l2GWkzpm1Ws6sdXJmrZPzf24B
        wsuRiovntREc76fjEn14jZaP10X4HIvRmtCfH9jhtEzWo6afoS2IppB6jqJAQ4UopZoEPknb
        goDC1PMU2zo7jigVYZqkk5w+JkQfH83xLWghhatVCr/bI8FKOkITxx3nuFhO/0+VUDKvZNSZ
        td0Rt+2o910+4F19ZV5j8dDOqh2B67zHvs+NPXTsw8y5cN/0AxUn9N1ahSyxW3fKHr5rsDh0
        pFtpXNq7Vxp+eiz5Qfl4ryk42OOMKnW98coKYskP4577W04Ffa5IcnNGTzpLVd2OOVxN6vvh
        nqx6z/OtxsFnLwMWmJ1BzY82gFWN85GataswPa/5DaNILp19AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsVy+t/xu7o/KzniDR69tLF4f2oiu8W+u/vY
        LVae+MdiceXrezaL5sXr2SxuNu5msjgx7yy7xYm+D6wWl3fNYbOYvaSfxWLx8p+MFps3TWW2
        WD//FptF79FGNos7X5+zOPB7tBx5y+qxeM9LJo93586xe+yfu4bd4373cSaPj2+esHtM+PCW
        zeP4je1MHlcXNrF7fN4kF8AVpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqk
        b2eTkpqTWZZapG+XoJcxu6uFtWCXUsWUntlsDYxXZboYOTkkBEwk9m86xd7FyMUhJLCUUWLv
        299ADgdQQkbi+PoyiBphiT/Xutggal4zSny8sp8ZJMEmYCUxsX0VI4gtLBAjcf70FBYQW0RA
        WWJJ838WkAZmgbvMEic//WKE6O5ilPh0YCEjyAZeATuJttWCIA0sAqoS6//eZgKxRQUiJA7v
        mAU2lFdAUOLkzCdgQzkFzCXWnD8PtphZQF3iz7xLULa4xK0n85kgbHmJ7W/nME9gFJqFpH0W
        kpZZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzDutx37uWUHY9e74EOMAhyM
        Sjy8CxI54oVYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnA
        lJRXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoEx+NyHP3yaElnb
        1vSaRFT0z/mvU7TL5cP0pxt75/h0XOjeZ9XPb7vj1/4jKzJ5Lfekfj2/qi+WbzKvhYT5xExD
        AeVFEzXSHXc8WBTkFfP1s3NfSUwjt4r2t2gFhiZzA5YVlx7MCFi8LjfujOXd9yzMwYc7YzJ/
        c8rPYtK43h/UeSOGM2fJZVElluKMREMt5qLiRACdXOynEQMAAA==
X-CMS-MailID: 20200710142354eucas1p2b4509184e94ba8c55ae66f9c5ba1f380
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200614030543eucas1p11e05674cb3b4f801baaf012f44bbf1ba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200614030543eucas1p11e05674cb3b4f801baaf012f44bbf1ba
References: <CGME20200614030543eucas1p11e05674cb3b4f801baaf012f44bbf1ba@eucas1p1.samsung.com>
        <20200614030528.128064-1-pakki001@umn.edu>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 6/14/20 5:05 AM, Aditya Pakki wrote:
> On calling pm_runtime_get_sync() the reference count of the device
> is incremented. In case of failure, decrement the
> reference count before returning the error.
> 
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 7 +++++--
>  drivers/video/fbdev/omap2/omapfb/dss/dsi.c   | 7 +++++--
>  drivers/video/fbdev/omap2/omapfb/dss/dss.c   | 7 +++++--
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c | 5 +++--
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c | 5 +++--
>  drivers/video/fbdev/omap2/omapfb/dss/venc.c  | 7 +++++--
>  6 files changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> index 4a16798b2ecd..e2b572761bf6 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> @@ -520,8 +520,11 @@ int dispc_runtime_get(void)
>  	DSSDBG("dispc_runtime_get\n");
>  
>  	r = pm_runtime_get_sync(&dispc.pdev->dev);
> -	WARN_ON(r < 0);
> -	return r < 0 ? r : 0;
> +	if (WARN_ON(r < 0)) {
> +		pm_runtime_put_sync(&dispc.pdev->dev);
> +		return r;
> +	}
> +	return 0;
>  }
>  EXPORT_SYMBOL(dispc_runtime_get);
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> index d620376216e1..6f9c25fec994 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> @@ -1137,8 +1137,11 @@ static int dsi_runtime_get(struct platform_device *dsidev)
>  	DSSDBG("dsi_runtime_get\n");
>  
>  	r = pm_runtime_get_sync(&dsi->pdev->dev);
> -	WARN_ON(r < 0);
> -	return r < 0 ? r : 0;
> +	if (WARN_ON(r < 0)) {
> +		pm_runtime_put_sync(&dsi->pdev->dev);
> +		return r;
> +	}
> +	return 0;
>  }
>  
>  static void dsi_runtime_put(struct platform_device *dsidev)
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> index 7252d22dd117..3586579c838f 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> @@ -768,8 +768,11 @@ int dss_runtime_get(void)
>  	DSSDBG("dss_runtime_get\n");
>  
>  	r = pm_runtime_get_sync(&dss.pdev->dev);
> -	WARN_ON(r < 0);
> -	return r < 0 ? r : 0;
> +	if (WARN_ON(r < 0)) {
> +		pm_runtime_put_sync(&dss.pdev->dev);
> +		return r;
> +	}
> +	return 0;
>  }
>  
>  void dss_runtime_put(void)
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> index 7060ae56c062..4804aab34298 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> @@ -39,9 +39,10 @@ static int hdmi_runtime_get(void)
>  	DSSDBG("hdmi_runtime_get\n");
>  
>  	r = pm_runtime_get_sync(&hdmi.pdev->dev);
> -	WARN_ON(r < 0);
> -	if (r < 0)
> +	if (WARN_ON(r < 0)) {
> +		pm_runtime_put_sync(&hdmi.pdev->dev);
>  		return r;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> index ac49531e4732..a06b6f1355bd 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> @@ -43,9 +43,10 @@ static int hdmi_runtime_get(void)
>  	DSSDBG("hdmi_runtime_get\n");
>  
>  	r = pm_runtime_get_sync(&hdmi.pdev->dev);
> -	WARN_ON(r < 0);
> -	if (r < 0)
> +	if (WARN_ON(r < 0)) {
> +		pm_runtime_put_sync(&hdmi.pdev->dev);
>  		return r;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> index d5404d56c922..0b0ad20afd63 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> @@ -348,8 +348,11 @@ static int venc_runtime_get(void)
>  	DSSDBG("venc_runtime_get\n");
>  
>  	r = pm_runtime_get_sync(&venc.pdev->dev);
> -	WARN_ON(r < 0);
> -	return r < 0 ? r : 0;
> +	if (WARN_ON(r < 0)) {
> +		pm_runtime_put_sync(&venc.pdev->dev);
> +		return r;
> +	}
> +	return 0;
>  }
>  
>  static void venc_runtime_put(void)
> 
