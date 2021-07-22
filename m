Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46FE3D22B7
	for <lists+linux-fbdev@lfdr.de>; Thu, 22 Jul 2021 13:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhGVKrx (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 22 Jul 2021 06:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbhGVKrw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 22 Jul 2021 06:47:52 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E5DC061760
        for <linux-fbdev@vger.kernel.org>; Thu, 22 Jul 2021 04:28:27 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id k14-20020a05600c1c8eb02901f13dd1672aso2344673wms.0
        for <linux-fbdev@vger.kernel.org>; Thu, 22 Jul 2021 04:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bXZhoLiSfqrwMz3NLWPlfvpA7MwU1Lp1H8B2cLvofFc=;
        b=WDZ+IWk/aheORiaDlb6sFn4HWaVK7pWr6xNpj31lxRJatjd/tlmyk1P0eCfdNt316z
         Dheci/CR1U1h7CP3edz3ksuRWmQVLausO5VqhOb1ZW6KXXd3FFQk9NRyrGaPjCp8hro/
         kKzWRwKby6qmysptO+k7f5Bbvab+MJnKYDCleW7v2zZyDOiZo9C4f0Tfc2I7minXJ/kQ
         wt3fNDFp0zfHLZVPr7sXgGZ0ZVUqVqaOW0DDvm3E/X68htLUDDm82Mb53vOwvYLyPjI8
         LkYzpJlCHqLLRulp4zGji/hvEXK63mcHP7YsUUcd3aM9zTf0miHgf0iCHBDLqoL/Viss
         +BUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bXZhoLiSfqrwMz3NLWPlfvpA7MwU1Lp1H8B2cLvofFc=;
        b=tF4bxIStyjWad84HuXiEBe776KSBnPm6RDxGPJFJO/EWvhBxBinBkrnmfmX+3/XyxN
         599bnZzvSS4WMrkz4CCJ9nTQclYpycv3sBqN5LuzG0hxRIqs/l2xBMaNqg96MZBx33kZ
         EojXUqatjHpWA4dGLhiCpUOxD2w+uXeAp+HI55+bT0yCM1D/DVeR3BUkhCoMCaOok0BY
         aXc6sjyWTxPwvxC7fF6AlAEVvoH4F7HUBFPCO2c69VnRSppNQZdMsjx2tinUazlO2rX+
         eyzN3UTwliyc2I+GD2DaAoMvEHj9qUigIB3zzQ3gxJDrkKwvZizv2t6PT8X2il3nolae
         G9vA==
X-Gm-Message-State: AOAM5309YX517i9uGdd52lsUH1d04SakT9mXGbaCpQDgKZJjDY4Odd2l
        QW0XLAhAFc0npHQWiPh8ga3aGg==
X-Google-Smtp-Source: ABdhPJxptSqPzuLIbccpswrkBfDPrXsstE/rHRfa20i9dpFWyKCRid0IOiLbLt05gYTjbBHRsQAHBQ==
X-Received: by 2002:a05:600c:204c:: with SMTP id p12mr8563378wmg.167.1626953306447;
        Thu, 22 Jul 2021 04:28:26 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id n23sm24850470wmc.38.2021.07.22.04.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 04:28:26 -0700 (PDT)
Date:   Thu, 22 Jul 2021 12:28:24 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight
 control GPIO is input
Message-ID: <20210722112824.z5s2fst2q3vrblcr@maple.lan>
References: <20210718211415.143709-1-marex@denx.de>
 <20210719112202.4fvmn57ibgy3yesa@maple.lan>
 <bbaad78e-91c7-0787-fa72-b5cfabcc6dbd@denx.de>
 <20210721104914.4difos6w3ysjelnv@maple.lan>
 <fee1ad9e-ae70-1644-5444-6c894473b48e@denx.de>
 <20210721161249.gehnwkscto2hlh7s@maple.lan>
 <298f6a35-2120-60a6-598a-87b141118bfa@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <298f6a35-2120-60a6-598a-87b141118bfa@denx.de>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jul 21, 2021 at 08:46:42PM +0200, Marek Vasut wrote:
> On 7/21/21 6:12 PM, Daniel Thompson wrote:
> > On Wed, Jul 21, 2021 at 05:09:57PM +0200, Marek Vasut wrote:
> > > On 7/21/21 12:49 PM, Daniel Thompson wrote:
> > > > > I'm not sure that's correct, we can simply say that any new uses of the
> > > > > pwm-backlight should specify the initial GPIO configuration, and for the
> > > > > legacy ones, use whatever is in the code now.
> > > > 
> > > > I'm not 100% against the idea... however if we still have to get the
> > > > code to read state from the hardware right for legacy cases that means
> > > > we have to do the same work but with fewer people testing it.
> > > 
> > > We can do something like this:
> > > 
> > > if (of_property_read_bool(np, "enable-active-high"))
> > >    gpiod_direction_output(pb->enable_gpio, 1);
> > > else if (of_property_read_bool(np, "enable-active-low"))
> > >    gpiod_direction_output(pb->enable_gpio, 0);
> > > else {
> > >    WARN_ON_ONCE("Fix your DT"); // or some such notification
> > >    ... legacy code path ...
> > > }
> > > 
> > > Note that I picked the same DT prop names as drivers/gpio/gpiolib-of.c
> > > of_gpio_flags_quirks() uses, because we are headed into similar mess here
> > > I'm afraid.
> > 
> > I don't quite understand what you mean here. We are using gpiolib so
> > for us there is no concept of active-high or active-low. The only
> > concept for us is whether enable_gpio is asserted or not.
> 
> It would look the same -- just substitute in "enable-on-boot" and
> "disable-on-boot" DT property.
> 
> > What the DT property would be describing is purely whether the
> > bootloader left the backlight on or off.
> 
> Rather, it would simply control what is the default state of the backlight
> enable GPIO (enabled/disabled).

What do you mean by default state? The current value of the pin or the
desired state when the probe completes?


> > This sails very close to the
> > edge of what is in-scope for DT (at least it does it we can read
> > the inherited state directly from the hardware).
> 
> The problem with reading it out of hardware is that the hardware might be in
> undefined state and expects Linux to define that state, so that does not
> always work. Hence my initial suggestion to add a DT property to define the
> state up front, instead of using these fragile heuristics.

To achieve a flicker-free boot we must know the initial state of the
backlight (not just the enable pin).


> > What it also means decisions about the DT bindings are more about
> > whether, if the backlight is lit up, the bootloader should also disclose
> > what it thinks it has established as the PWM duty cycle as well.
> 
> Please also consider the case where bootloader configures total minimum of
> the hardware to start Linux as soon as possible, i.e. it puts Linux in DRAM
> and jumps to Linux.

I think I have been. I understood that preventing a flicker when booting
with an unconfigured (and off) backlight[1] was the purpose of your patch!

However that is a relatively easy case when considering flicker-free
handover from bootloader since we don't have to inherit the duty cycle.


[1] I guessed that the difference between your platform and the other
    pwm_bl users is that, for you, an uninitialized PWM looks like a
    100% duty cycle hence you get a full-brightness flicker when we change
    the state of the enable_gpio pin before we have established the
    correct PWM duty cycle. Was I right?


> > Overall I have fairly grave concerns that this simply moves
> > fragility into the bootloader rather then reducing it.
> 
> Wait a minute, I think we disconnected somewhere. I would rather prefer to
> remove the fragility and bootloader dependency altogether, exactly to avoid
> depending on the state the bootloader left the hardware in.

The two fully flicker-free cases we support in pwm_bl are:

1. Backlight off after bootloader has completed. Backlight must be
   off after the probe completes (and never flicker on/off during the
   probe). This allows the display to put a splash image on the screen
   before lighting up the backlight (this avoids a flicker if there are
   a few frames between backlight coming on and the splash image being
   drawn). Naturally this requires help from the display system (and
   that the display system is aware of the backlight to be able to start
   it).

2. Backlight on with a splash image after bootloader has completed.
   Backlight must be on after the probe completes (and never flicker
   off/on during the probe). This also requires that the display system
   can take over the frame buffer without a flicker but that is
   completely independent of backlight.

There is also a simpler case which is not "flicker-free" since the
backlight may change level during the boot and may light up before
there is an image on the screen (although we'd still to minimise
flicker by ensuring there is only one change of backlight state/level
during the probe (something your work will see fixed?):

3. Backlight is on after the probe completes. This is default if
   we don't know the display system will activate the backlight.
   This is an important legacy case since few userspaces know how
   to change the backlight power-state at boot.

One oddity here is that #3 *also* needs to know the state of the
backlight (on/off) to turn the backlight on without flickering
(so it can figure out how to handle power_pwm_on_delay correctly)
even though the final state is unconditionally on. That is the main
reason I proposed an alternative to your patch (since this is
currently broken).

The other oddity is that the difference between #1 and #3 is due to
*software* (which driver ends up responsible for unmuting the display)
meaning that the bootloader/DT has no business discriminating between
these two cases.

Thus pwm_bl.c is based on making #2/#3 (which are similar) the default
and switching to case #1 if there is a display driver to do the unblank
(software) *and* that the backlight is currently off (currently read
from hardware). Note that this is intentionally designed to that
if the logic does go wrong we should get a small bug (a flicker) rather
than a big one (a black screen).

Wow! That is *way* longer than I intended when I started writing it.
Anyhow I suspect any disconnect comes about due to the difference in
backlight state *after* probe being, in part, to software structure
rather than purely a hardware property.


Daniel.
