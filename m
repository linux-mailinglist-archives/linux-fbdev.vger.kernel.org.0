Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFD2A6DF1
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Sep 2019 18:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbfICQT2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Sep 2019 12:19:28 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40392 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727810AbfICQT1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 3 Sep 2019 12:19:27 -0400
Received: by mail-wm1-f66.google.com with SMTP id t9so125816wmi.5
        for <linux-fbdev@vger.kernel.org>; Tue, 03 Sep 2019 09:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sgA6tCvJaTRg35lxvETEOk42SQwlvhDmgf9L2xbY5u4=;
        b=tLxBO+vZGBMg+VdcasGIrVZS+MBaiDkZCgH8CYS8Vn4yPSdv2G2ASG9PHOinlSjtrC
         9MP7SC4nS9fdtZCAeQoO1gr1HlOyTs87kEObp4+KybmWIQEUwbuJj+wnpdUCjCwrAMNC
         KbkU/ETPNgFX4R+JlPZqBxzwSEQ7C9LB2S+P/JmalJ0UXXiiRYqJks/VegJqesuidOBw
         cqsGOuV4jjv90cPC4g9pCVSyCIps4vDw5RgKPt1eUOJXl4BH7oKPGNL6z5QESlQfWih2
         8INIRFBx8gEvKhFRWOf+grRSCZtLFVusbJmr9tB8JScL01hAHMEICQLAVCirJ/OJuMG4
         vXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sgA6tCvJaTRg35lxvETEOk42SQwlvhDmgf9L2xbY5u4=;
        b=LenrJAT263dmCN5iubM4ufKlXVD4BHeqNL9uYIxLWL8GgEQxDYGQ1RX2ueQuR9ug5v
         uG/wp581z2JI+ihkhmPQ5CczmaEWetrW/OXRffQwuexLHMqWAsGRyYGZQjojRNnQEyNd
         gVdq9SR8dzpPJyg62VPRu/oqGveMAVx7+vICMDAxHX+8a6XYhd3RgQliqjUCr8kjP/zY
         dCFDKm3NTiDueFdRAkDPSsrJbdOMEvutmuYPGKVL3KIgQophblE+a+IucUPvU18kFA1t
         sI2Q3vC5sLdvwoCWYDZhVk5Flqau4ikfgEPCjh3oj7u8NRoJZdYdkWa5tyGdfJYMFthv
         l9ug==
X-Gm-Message-State: APjAAAWbazZc9EivgAxFjCMmzdVOVo65DY/YTqTWt5eg780Jfzjfdhgk
        EWnXdH5Udu1Pp+YHCbJIiPyCwA==
X-Google-Smtp-Source: APXvYqyAzHLUCAmUnjAuDzEzve0pETSkr021EixF0mi07mhQ0Ag3dJ64DWhOZaitzgpCSVqus+IyyA==
X-Received: by 2002:a1c:ef13:: with SMTP id n19mr144292wmh.48.1567527566178;
        Tue, 03 Sep 2019 09:19:26 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id u8sm46851wmj.3.2019.09.03.09.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 09:19:25 -0700 (PDT)
Date:   Tue, 3 Sep 2019 17:19:23 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] backlight: ipaq_micro: Make structure micro_bl_props
 constant
Message-ID: <20190903161923.5d2fvrwpvgims4va@holly.lan>
References: <20190813085855.8302-1-nishkadg.linux@gmail.com>
 <20190813091251.2nyxtivsvp47aahp@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813091251.2nyxtivsvp47aahp@holly.lan>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Aug 13, 2019 at 10:12:51AM +0100, Daniel Thompson wrote:
> On Tue, Aug 13, 2019 at 02:28:55PM +0530, Nishka Dasgupta wrote:
> > Static structure micro_bl_props, having type backlight_properties, is
> > used only once, when it is passed as the last argument to function
> > devm_backlight_device_register(). devm_backlight_device_register() is
> > defined with its last parameter being declared constant. Hence make
> > micro_bl_props itself constant as well.
> > Issue found with Coccinelle.
> 
> Did you do any review to see if this pattern occurs in other backlight
> drivers (it looks to me like the same pattern appears in
> rave-sp-backlight.c... do the tools bring that one out as well).

Ping?


Daniel.


> > Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> > ---
> >  drivers/video/backlight/ipaq_micro_bl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/video/backlight/ipaq_micro_bl.c b/drivers/video/backlight/ipaq_micro_bl.c
> > index 1123f67c12b3..85b16cc82878 100644
> > --- a/drivers/video/backlight/ipaq_micro_bl.c
> > +++ b/drivers/video/backlight/ipaq_micro_bl.c
> > @@ -44,7 +44,7 @@ static const struct backlight_ops micro_bl_ops = {
> >  	.update_status  = micro_bl_update_status,
> >  };
> >  
> > -static struct backlight_properties micro_bl_props = {
> > +static const struct backlight_properties micro_bl_props = {
> >  	.type = BACKLIGHT_RAW,
> >  	.max_brightness = 255,
> >  	.power = FB_BLANK_UNBLANK,
> > -- 
> > 2.19.1
> > 
