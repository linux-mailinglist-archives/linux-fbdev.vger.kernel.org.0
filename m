Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC8F9660657
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Jan 2023 19:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbjAFS1Y (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 6 Jan 2023 13:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbjAFS1X (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 6 Jan 2023 13:27:23 -0500
X-Greylist: delayed 2512 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 06 Jan 2023 10:27:21 PST
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com (mailrelay3-1.pub.mailoutpod2-cph3.one.com [46.30.211.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77DF78A7A
        for <linux-fbdev@vger.kernel.org>; Fri,  6 Jan 2023 10:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=6QdIVHUIxY3riu8WNeI8Qtp4pkrdBvAzRwqu/PCAFGU=;
        b=yr96O8zHMLzRmFQMRd4SUJl0do+s1hYzEGmfkvh0ku+qeXpE27MkdzGvB+GJycTZIu00SilEKlUKg
         ZSvmHLoaUNy+sQhO+0ngEE+IBbQv+kvqBPr0RT7AlW1odVyI5pQIu5IuNfBio+Jb+yWiq2aIF8htZ+
         KmPOto5POPqVXO6aZl5vmAM1s8MGzW6Wx+GO3rSt/T3kmVwaaV/tjk8pgvAZhGLH4ULPxvLgac0LKu
         f/m/ZwmaVaPX8Y+mPsHL6iTJY4JpthEE6cRMUFW5CJ418HXm/ffVLwJA7TE5tQI4LieYGydxfk2X1O
         7ecSaLDoTCFq+9ZCcqJtEqSVJr2x+HA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=6QdIVHUIxY3riu8WNeI8Qtp4pkrdBvAzRwqu/PCAFGU=;
        b=cU17wfqUmdKxgvCBUHUA1ulduzLjNdkasBS4b/MUGXLGG5/3PkSrCGtgB2+fpQGmNC+Yd5pzDzUQ4
         P+Z4AcSCA==
X-HalOne-ID: 9b58e155-8def-11ed-931a-ede074c87fad
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay3 (Halon) with ESMTPSA
        id 9b58e155-8def-11ed-931a-ede074c87fad;
        Fri, 06 Jan 2023 18:26:17 +0000 (UTC)
Date:   Fri, 6 Jan 2023 19:26:16 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
        Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RESEND 3/4] backlight: ipaq_micro: Use backlight helper
Message-ID: <Y7hnyCOlWuJf+obV@ravnborg.org>
References: <20230106164856.1453819-4-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106164856.1453819-4-steve@sk2.org>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLACK autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Jan 06, 2023 at 05:48:54PM +0100, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/backlight/ipaq_micro_bl.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/ipaq_micro_bl.c b/drivers/video/backlight/ipaq_micro_bl.c
> index 85b16cc82878..f595b8c8cbb2 100644
> --- a/drivers/video/backlight/ipaq_micro_bl.c
> +++ b/drivers/video/backlight/ipaq_micro_bl.c
> @@ -16,17 +16,12 @@
>  static int micro_bl_update_status(struct backlight_device *bd)
>  {
>  	struct ipaq_micro *micro = dev_get_drvdata(&bd->dev);
> -	int intensity = bd->props.brightness;
> +	int intensity = backlight_get_brightness(bd);
>  	struct ipaq_micro_msg msg = {
>  		.id = MSG_BACKLIGHT,
>  		.tx_len = 3,
>  	};
>  
> -	if (bd->props.power != FB_BLANK_UNBLANK)
> -		intensity = 0;
> -	if (bd->props.state & (BL_CORE_FBBLANK | BL_CORE_SUSPENDED))
> -		intensity = 0;
> -
>  	/*
>  	 * Message format:
>  	 * Byte 0: backlight instance (usually 1)
> -- 
> 2.30.2
