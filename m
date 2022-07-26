Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E23A580C2E
	for <lists+linux-fbdev@lfdr.de>; Tue, 26 Jul 2022 09:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbiGZHJ6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 26 Jul 2022 03:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbiGZHJ5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 26 Jul 2022 03:09:57 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24EA2A73E
        for <linux-fbdev@vger.kernel.org>; Tue, 26 Jul 2022 00:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1658819365;
        bh=gdxOehXwuSg4pCVehp+QwKsM0aJzwnn7dgKqTwk/4ws=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=VY6bNecK37WGq9eX4kk5Y7Q3a67aVruXvVJZb7KCwfsWPY58233OyvorT2saAdNjv
         P/tKrY8EtSls9wZxk0JT5mZM8fV/xBl8QEZnXobuEZSiUFvedZoZi/mX+sXgLipjRl
         O69DTJsKHhYL9xsbk1v/xNiWyLGGXv7I46blbCWE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.186.181]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXQF-1nwmZ800Hf-00JZRo; Tue, 26
 Jul 2022 09:09:25 +0200
Message-ID: <785ec56d-d2fc-a9d8-a1b8-5fd04ed7a449@gmx.de>
Date:   Tue, 26 Jul 2022 09:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] video: fb: imxfb: Drop platform data support
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org
References: <20220723175720.76933-1-u.kleine-koenig@pengutronix.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220723175720.76933-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O6yXiikxK8VAzmEnn8Fl6FuXPJdILWOjYdRFJhYO+Rcbyj3l7Xh
 MJqxTxaVWXrEJRO8nAquv1lc3QWe2EhFojCaJy2Ybm2N79GQQU5PTNQVkuyEUM5dJDLiE07
 TpLg4klVHMori/tIVGs/EJr4M1JAUv3eSbXd1GtR0s12mcXKWVTVbCvvEIiYF3xIgUyX7Ug
 Cu19x1Bna28KVelV99OlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xx8SgCD0kIs=:0pkhfL4wJmpvtUzlu6FUjn
 g8ZTgrSephypgrWnpBQf8vGPYiDli/E0mVov2L9RacCEIprI1aGU9QdUIazdia83rWwd2XZxU
 b+zRA8Ptcnss2dV5bcU6IrGUr3VAYcVPMEMkl5o/6Ygf9AV9cRRnpV8FI/Dp+5ZHlVB43xox/
 j370px7iE9BjMPzD+zXrpt50XjoLgEhl5v7Lo4xEs6BUARuQ7kX9bRCXbFZ8xKZmp7nhNSL8r
 9Rwqy/prlkXNoqeLq0+V69RTclZ2Qe1WGNxes+UinB745AibPT/cE0/SZsbaxc6AzLCrhqauc
 iUTjpN2QNL4CwhiSmY1x3YwqofXXE7tutqCpXIUQX4MB69pAyc4UQ5ej7l7bnNJwUmc/6wEYY
 E+FTyqGLha5yL9Cqc8GljQtkM2zz07pTrssBTsamc4PQua90L/JT/Av42LZS0rfYxOm12zUHw
 kRJabtZe4R2APjgoa3428LXJVDrk8IeuNtIEP1H8dHkK9rC6/9oech8NTv22wASQcuG9p0Icf
 l7kTb8KW+82RzzRIQFwzSnhj0mE3cAWv6ZbzJ3o9CMiXRDEzGIekft40Bo7tI/qIhWKaFXzjJ
 3JxKytZydyl+A7+mmiaSLBo3IK3IPR/rEV2miIEo1D83Tc5ez5VHxP/RZAMG/ro9PEj2GH0Dz
 IQIf7MiuV9uBzzWoGleMsSX8OYScfcmCCgN+xWSvNRUeHV/TT8h7rfoH0nnvE3QPqvhCVDmfr
 OvRiXz4CDUgZtVdiuPn0o6V7qZhfyF+S7U+4FC9SAY5igMR7JsQc6M2SeTw3fBug/03r9hrUm
 HhjZSgFIbuRHD/Q6qLW429CQ7xtu9ARzDXcC/jPBJWuI2SrQg3dxy514qhb68qTCbaNb/h3gW
 JVipttDmxW2ScUynPnTMHthLMp7viOC0UFBIYicGkPaIiRTa/XCT+1kPeahVpSM3m2j3B1iQn
 ZWNh01ZBCEvEft8XeYlSrDfGo62EbAKwsqngv/H9h99CGQoAbqP49jPDVbnKTH0mb4rE4tcnT
 1DNPCmt3OQWoH2G8sfFSYD4kXjCTe8bXyMH4FI7QOM1bG2ij0j55SPwC+KC6XReDVm610ZkQ2
 OXHuC+eYkQ7iNjUHTvMwgsvVKE8SV+5J45QuM6koLRdlmMiqHph0ATqHg==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 7/23/22 19:57, Uwe Kleine-K=C3=B6nig wrote:
> No source file but the driver itself includes the header containing the
> platform data definition. The last user is gone since commit
> 8485adf17a15 ("ARM: imx: Remove imx device directory").
>
> So we can safely drop platform data support.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

I've applied all 4 patches to the fbdev git tree.

Thanks!
Helge

> ---
>  drivers/video/fbdev/imxfb.c               | 99 ++++++++---------------
>  include/linux/platform_data/video-imxfb.h | 12 ---
>  2 files changed, 34 insertions(+), 77 deletions(-)
>
> diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
> index a2f644c97f28..85a5bf5639d9 100644
> --- a/drivers/video/fbdev/imxfb.c
> +++ b/drivers/video/fbdev/imxfb.c
> @@ -656,7 +656,6 @@ static int imxfb_activate_var(struct fb_var_screenin=
fo *var, struct fb_info *inf
>
>  static int imxfb_init_fbinfo(struct platform_device *pdev)
>  {
> -	struct imx_fb_platform_data *pdata =3D dev_get_platdata(&pdev->dev);
>  	struct fb_info *info =3D platform_get_drvdata(pdev);
>  	struct imxfb_info *fbi =3D info->par;
>  	struct device_node *np;
> @@ -690,25 +689,20 @@ static int imxfb_init_fbinfo(struct platform_devic=
e *pdev)
>  	info->fbops			=3D &imxfb_ops;
>  	info->flags			=3D FBINFO_FLAG_DEFAULT |
>  					  FBINFO_READS_FAST;
> -	if (pdata) {
> -		fbi->lscr1			=3D pdata->lscr1;
> -		fbi->dmacr			=3D pdata->dmacr;
> -		fbi->pwmr			=3D pdata->pwmr;
> -	} else {
> -		np =3D pdev->dev.of_node;
> -		info->var.grayscale =3D of_property_read_bool(np,
> -						"cmap-greyscale");
> -		fbi->cmap_inverse =3D of_property_read_bool(np, "cmap-inverse");
> -		fbi->cmap_static =3D of_property_read_bool(np, "cmap-static");
>
> -		fbi->lscr1 =3D IMXFB_LSCR1_DEFAULT;
> +	np =3D pdev->dev.of_node;
> +	info->var.grayscale =3D of_property_read_bool(np,
> +					"cmap-greyscale");
> +	fbi->cmap_inverse =3D of_property_read_bool(np, "cmap-inverse");
> +	fbi->cmap_static =3D of_property_read_bool(np, "cmap-static");
>
> -		of_property_read_u32(np, "fsl,lpccr", &fbi->pwmr);
> +	fbi->lscr1 =3D IMXFB_LSCR1_DEFAULT;
>
> -		of_property_read_u32(np, "fsl,lscr1", &fbi->lscr1);
> +	of_property_read_u32(np, "fsl,lpccr", &fbi->pwmr);
>
> -		of_property_read_u32(np, "fsl,dmacr", &fbi->dmacr);
> -	}
> +	of_property_read_u32(np, "fsl,lscr1", &fbi->lscr1);
> +
> +	of_property_read_u32(np, "fsl,dmacr", &fbi->dmacr);
>
>  	return 0;
>  }
> @@ -863,10 +857,10 @@ static int imxfb_probe(struct platform_device *pde=
v)
>  	struct imxfb_info *fbi;
>  	struct lcd_device *lcd;
>  	struct fb_info *info;
> -	struct imx_fb_platform_data *pdata;
>  	struct resource *res;
>  	struct imx_fb_videomode *m;
>  	const struct of_device_id *of_id;
> +	struct device_node *display_np;
>  	int ret, i;
>  	int bytes_per_pixel;
>
> @@ -884,8 +878,6 @@ static int imxfb_probe(struct platform_device *pdev)
>  	if (!res)
>  		return -ENODEV;
>
> -	pdata =3D dev_get_platdata(&pdev->dev);
> -
>  	info =3D framebuffer_alloc(sizeof(struct imxfb_info), &pdev->dev);
>  	if (!info)
>  		return -ENOMEM;
> @@ -898,43 +890,34 @@ static int imxfb_probe(struct platform_device *pde=
v)
>  	if (ret < 0)
>  		goto failed_init;
>
> -	if (pdata) {
> -		if (!fb_mode)
> -			fb_mode =3D pdata->mode[0].mode.name;
> -
> -		fbi->mode =3D pdata->mode;
> -		fbi->num_modes =3D pdata->num_modes;
> -	} else {
> -		struct device_node *display_np;
> -		fb_mode =3D NULL;
> -
> -		display_np =3D of_parse_phandle(pdev->dev.of_node, "display", 0);
> -		if (!display_np) {
> -			dev_err(&pdev->dev, "No display defined in devicetree\n");
> -			ret =3D -EINVAL;
> -			goto failed_of_parse;
> -		}
> +	fb_mode =3D NULL;
>
> -		/*
> -		 * imxfb does not support more modes, we choose only the native
> -		 * mode.
> -		 */
> -		fbi->num_modes =3D 1;
> -
> -		fbi->mode =3D devm_kzalloc(&pdev->dev,
> -				sizeof(struct imx_fb_videomode), GFP_KERNEL);
> -		if (!fbi->mode) {
> -			ret =3D -ENOMEM;
> -			of_node_put(display_np);
> -			goto failed_of_parse;
> -		}
> +	display_np =3D of_parse_phandle(pdev->dev.of_node, "display", 0);
> +	if (!display_np) {
> +		dev_err(&pdev->dev, "No display defined in devicetree\n");
> +		ret =3D -EINVAL;
> +		goto failed_of_parse;
> +	}
>
> -		ret =3D imxfb_of_read_mode(&pdev->dev, display_np, fbi->mode);
> +	/*
> +	 * imxfb does not support more modes, we choose only the native
> +	 * mode.
> +	 */
> +	fbi->num_modes =3D 1;
> +
> +	fbi->mode =3D devm_kzalloc(&pdev->dev,
> +			sizeof(struct imx_fb_videomode), GFP_KERNEL);
> +	if (!fbi->mode) {
> +		ret =3D -ENOMEM;
>  		of_node_put(display_np);
> -		if (ret)
> -			goto failed_of_parse;
> +		goto failed_of_parse;
>  	}
>
> +	ret =3D imxfb_of_read_mode(&pdev->dev, display_np, fbi->mode);
> +	of_node_put(display_np);
> +	if (ret)
> +		goto failed_of_parse;
> +
>  	/* Calculate maximum bytes used per pixel. In most cases this should
>  	 * be the same as m->bpp/8 */
>  	m =3D &fbi->mode[0];
> @@ -1001,13 +984,6 @@ static int imxfb_probe(struct platform_device *pde=
v)
>
>  	info->fix.smem_start =3D fbi->map_dma;
>
> -	if (pdata && pdata->init) {
> -		ret =3D pdata->init(fbi->pdev);
> -		if (ret)
> -			goto failed_platform_init;
> -	}
> -
> -
>  	INIT_LIST_HEAD(&info->modelist);
>  	for (i =3D 0; i < fbi->num_modes; i++)
>  		fb_add_videomode(&fbi->mode[i].mode, &info->modelist);
> @@ -1059,9 +1035,6 @@ static int imxfb_probe(struct platform_device *pde=
v)
>  failed_register:
>  	fb_dealloc_cmap(&info->cmap);
>  failed_cmap:
> -	if (pdata && pdata->exit)
> -		pdata->exit(fbi->pdev);
> -failed_platform_init:
>  	dma_free_wc(&pdev->dev, fbi->map_size, info->screen_buffer,
>  		    fbi->map_dma);
>  failed_map:
> @@ -1079,7 +1052,6 @@ static int imxfb_probe(struct platform_device *pde=
v)
>
>  static int imxfb_remove(struct platform_device *pdev)
>  {
> -	struct imx_fb_platform_data *pdata;
>  	struct fb_info *info =3D platform_get_drvdata(pdev);
>  	struct imxfb_info *fbi =3D info->par;
>  	struct resource *res;
> @@ -1092,9 +1064,6 @@ static int imxfb_remove(struct platform_device *pd=
ev)
>
>  	unregister_framebuffer(info);
>  	fb_dealloc_cmap(&info->cmap);
> -	pdata =3D dev_get_platdata(&pdev->dev);
> -	if (pdata && pdata->exit)
> -		pdata->exit(fbi->pdev);
>  	dma_free_wc(&pdev->dev, fbi->map_size, info->screen_buffer,
>  		    fbi->map_dma);
>  	iounmap(fbi->regs);
> diff --git a/include/linux/platform_data/video-imxfb.h b/include/linux/p=
latform_data/video-imxfb.h
> index 02812651af7d..b80a156a6617 100644
> --- a/include/linux/platform_data/video-imxfb.h
> +++ b/include/linux/platform_data/video-imxfb.h
> @@ -55,16 +55,4 @@ struct imx_fb_videomode {
>  	unsigned char	bpp;
>  };
>
> -struct imx_fb_platform_data {
> -	struct imx_fb_videomode *mode;
> -	int		num_modes;
> -
> -	u_int		pwmr;
> -	u_int		lscr1;
> -	u_int		dmacr;
> -
> -	int (*init)(struct platform_device *);
> -	void (*exit)(struct platform_device *);
> -};
> -
>  #endif /* ifndef __MACH_IMXFB_H__ */
>
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56

