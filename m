Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77FAE174826
	for <lists+linux-fbdev@lfdr.de>; Sat, 29 Feb 2020 17:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbgB2Qv2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 29 Feb 2020 11:51:28 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:45764 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbgB2Qv2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 29 Feb 2020 11:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=M55xHiuKM6NwUL052iG1u1EYNvjqQr0NA95pijWF9HA=; b=vbLbaJbHyqa8FqHfuQpLdQ7or
        Is8bVM37RR9mEaVZqfVnXSpz9ZQpYj2DFT/w7nbciCqHtv3I2jT5JcCJDqUUZl/Vr1aITeoj9Q7xI
        Y+KlqQbeO1XMSbpGryaPEIR0TIxLdrN+Lu5rI6oum33bBWkcaXmi35UYnePXTOAHYrE6I4QIr9WGh
        wNRoHoj3Vce/FKeisVgAR2zNlIlr5W9vv6D9QZv5OEMb20b+IyY2tkBkBqBnenBI4JLYB3AymEmsh
        w42yrfT92pyjcGclP8y1xY8V2bLO8h2kHqBL56VBO09qDATMTogVU5nlxIGubWzUOCqxbgfOxOICJ
        IaY9GClTQ==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:54436)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1j85Km-0002a1-8M; Sat, 29 Feb 2020 16:51:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1j85Kk-00037g-LR; Sat, 29 Feb 2020 16:51:22 +0000
Date:   Sat, 29 Feb 2020 16:51:22 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM/fbdev: sa11x0: Switch to use GPIO descriptors
Message-ID: <20200229165122.GC25745@shell.armlinux.org.uk>
References: <20200229163441.90639-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200229163441.90639-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sat, Feb 29, 2020 at 05:34:41PM +0100, Linus Walleij wrote:
> This converts the SA11x0 frame buffer driver to use
> GPIO descriptors. Get the GPIO optional and register
> a look-up table specifically for the Shannon machine.

I don't think this GPIO should be named "enable" - while the placement
may be correct for Shannon, it's not true for all the other platforms
that twiddle enable GPIOs for the LCD.  Shannon's LCD enable control
is specific to Shannon and nothing else.

> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/mach-sa1100/shannon.c |  9 +++++++++
>  drivers/video/fbdev/sa1100fb.c | 20 +++++++++-----------
>  drivers/video/fbdev/sa1100fb.h |  3 +++
>  3 files changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/mach-sa1100/shannon.c b/arch/arm/mach-sa1100/shannon.c
> index 5bc82e2671c6..f1f825ed0b3a 100644
> --- a/arch/arm/mach-sa1100/shannon.c
> +++ b/arch/arm/mach-sa1100/shannon.c
> @@ -104,6 +104,14 @@ static struct fixed_voltage_config shannon_cf_vcc_pdata __initdata = {
>  	.enabled_at_boot = 1,
>  };
>  
> +static struct gpiod_lookup_table shannon_display_gpio_table = {
> +	.dev_id = "sa11x0-fb",
> +	.table = {
> +		GPIO_LOOKUP("gpio", 22, "enable", GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};
> +
>  static void __init shannon_init(void)
>  {
>  	sa11x0_register_fixed_regulator(0, &shannon_cf_vcc_pdata,
> @@ -113,6 +121,7 @@ static void __init shannon_init(void)
>  	sa11x0_register_pcmcia(0, &shannon_pcmcia0_gpio_table);
>  	sa11x0_register_pcmcia(1, &shannon_pcmcia1_gpio_table);
>  	sa11x0_ppc_configure_mcp();
> +	gpiod_add_lookup_table(&shannon_display_gpio_table);
>  	sa11x0_register_lcd(&shannon_lcd_info);
>  	sa11x0_register_mtd(&shannon_flash_data, &shannon_flash_resource, 1);
>  	sa11x0_register_mcp(&shannon_mcp_data);
> diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
> index 5bb653db0cec..cdea3b31a54f 100644
> --- a/drivers/video/fbdev/sa1100fb.c
> +++ b/drivers/video/fbdev/sa1100fb.c
> @@ -173,7 +173,7 @@
>  #include <linux/init.h>
>  #include <linux/ioport.h>
>  #include <linux/cpufreq.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/mutex.h>
> @@ -799,8 +799,8 @@ static void sa1100fb_enable_controller(struct sa1100fb_info *fbi)
>  	writel_relaxed(fbi->dbar2, fbi->base + DBAR2);
>  	writel_relaxed(fbi->reg_lccr0 | LCCR0_LEN, fbi->base + LCCR0);
>  
> -	if (machine_is_shannon())
> -		gpio_set_value(SHANNON_GPIO_DISP_EN, 1);
> +	if (fbi->enable)
> +		gpiod_set_value(fbi->enable, 1);
>  
>  	dev_dbg(fbi->dev, "DBAR1: 0x%08x\n", readl_relaxed(fbi->base + DBAR1));
>  	dev_dbg(fbi->dev, "DBAR2: 0x%08x\n", readl_relaxed(fbi->base + DBAR2));
> @@ -817,8 +817,8 @@ static void sa1100fb_disable_controller(struct sa1100fb_info *fbi)
>  
>  	dev_dbg(fbi->dev, "Disabling LCD controller\n");
>  
> -	if (machine_is_shannon())
> -		gpio_set_value(SHANNON_GPIO_DISP_EN, 0);
> +	if (fbi->enable)
> +		gpiod_set_value(fbi->enable, 0);
>  
>  	set_current_state(TASK_UNINTERRUPTIBLE);
>  	add_wait_queue(&fbi->ctrlr_wait, &wait);
> @@ -1173,12 +1173,10 @@ static int sa1100fb_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	if (machine_is_shannon()) {
> -		ret = devm_gpio_request_one(&pdev->dev, SHANNON_GPIO_DISP_EN,
> -			GPIOF_OUT_INIT_LOW, "display enable");
> -		if (ret)
> -			return ret;
> -	}
> +	fbi->enable = gpiod_get_optional(&pdev->dev, "enable",
> +					 GPIOD_OUT_LOW);
> +	if (IS_ERR(fbi->enable))
> +		return PTR_ERR(fbi->enable);
>  
>  	/* Initialize video memory */
>  	ret = sa1100fb_map_video_memory(fbi);
> diff --git a/drivers/video/fbdev/sa1100fb.h b/drivers/video/fbdev/sa1100fb.h
> index d0aa33b0b88a..9711bbcd6e99 100644
> --- a/drivers/video/fbdev/sa1100fb.h
> +++ b/drivers/video/fbdev/sa1100fb.h
> @@ -10,6 +10,8 @@
>   * for more details.
>   */
>  
> +struct gpio_desc;
> +
>  #define LCCR0           0x0000          /* LCD Control Reg. 0 */
>  #define LCSR            0x0004          /* LCD Status Reg. */
>  #define DBAR1           0x0010          /* LCD DMA Base Address Reg. channel 1 */
> @@ -33,6 +35,7 @@ struct sa1100fb_info {
>  	struct device		*dev;
>  	const struct sa1100fb_rgb *rgb[NR_RGB];
>  	void __iomem		*base;
> +	struct gpio_desc	*enable;
>  
>  	/*
>  	 * These are the addresses we mapped
> -- 
> 2.24.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
