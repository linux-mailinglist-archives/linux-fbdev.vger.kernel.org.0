Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0B32A7978
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Sep 2019 05:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbfIDDxw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Sep 2019 23:53:52 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35940 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbfIDDxw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 3 Sep 2019 23:53:52 -0400
Received: by mail-oi1-f196.google.com with SMTP id k20so8288724oih.3
        for <linux-fbdev@vger.kernel.org>; Tue, 03 Sep 2019 20:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1hELw/mZnhRRWFbYJGQfmaEmlzEA69NHvGeKH1N6R60=;
        b=iqdM/8KeRJuuyZ/effs20gF6ShFqEIhVkMnvw87QlRPtdpJXwhfQYcmL6+l2IDM7w0
         n6GtzfphN4CDqJtp+CBT3VM8Gv22sfxS95VRUPkDD/2Ae+HSwIUKIWroKNLZGibTBL2d
         m+RUsnaspczfc6vyCGCrjgXPbT+XDn/1PS9sGNWY13rEKZTpcVTx1P1Wf1FXt/+TfWCa
         BWDc75l+DmFlKLRkSAIFkMpvtuUyuD8LVXOnhEGrjFYLPKGugH8mrxkarU9VpbW6cmgd
         lwXoOEeFm7EYaXzjE3G2G7c4UMZ/cSyYcwoLYkzfRAQztxiotMVT/9bYlCj7+VTtr2Ib
         y2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1hELw/mZnhRRWFbYJGQfmaEmlzEA69NHvGeKH1N6R60=;
        b=KysRI4EqoraxPy9tv93pKp2dak576osc6DoB+5QvAEtolVW096vWwCSN5MgwDjsw17
         2X7NPXPwNbS4855yYOzcLFhe98HwroxFQXlwSjS+v8qFLR7TWHO6y5YZiYEMhXLguKs4
         Iae0nWVXlZCzlVs5n2rxz9the9Ff1u49YmTXsR6HEobyEsoNIu11sRJBu4FVaCIcBf5Z
         3ToaVKmXsJRIvtxmzePPpv2NTxsd4C4nqiA5v/GSkSsnK7RjLyFJsDgnMzkNvPI+VYK9
         L94czqC8/feob+YWE08UgufGi80Wa6zKjxtaMz3TifoQqdCRiK9h0FcAiar4gkKXj7Kr
         1WuA==
X-Gm-Message-State: APjAAAUiLQoeEYJJkhDt10PHGi8pQfH2miU6g59qHEurLQEVpH7mOUok
        VXDfrwWofVbELlSEfFk0HX8lgNPtFiGCM3dKccQ=
X-Google-Smtp-Source: APXvYqywjnQrOYyG/0Vo1URo5XN9A+74iJSQj3enSTQm4NvEFIcxSsO2HPkNjccMdGNejmM2xbL0vdtEDYOH/irtuwU=
X-Received: by 2002:aca:574c:: with SMTP id l73mr1980400oib.47.1567569230893;
 Tue, 03 Sep 2019 20:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190813085855.8302-1-nishkadg.linux@gmail.com>
 <20190813091251.2nyxtivsvp47aahp@holly.lan> <20190903161923.5d2fvrwpvgims4va@holly.lan>
In-Reply-To: <20190903161923.5d2fvrwpvgims4va@holly.lan>
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
Date:   Wed, 4 Sep 2019 09:23:40 +0530
Message-ID: <CAKJjNbCkFA0Bri7q0BaNVzj_03LPwcHutn_+7b5gTTnJnq-tZQ@mail.gmail.com>
Subject: Re: [PATCH] backlight: ipaq_micro: Make structure micro_bl_props constant
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 3 Sep 2019 at 21:49, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>
> On Tue, Aug 13, 2019 at 10:12:51AM +0100, Daniel Thompson wrote:
> > On Tue, Aug 13, 2019 at 02:28:55PM +0530, Nishka Dasgupta wrote:
> > > Static structure micro_bl_props, having type backlight_properties, is
> > > used only once, when it is passed as the last argument to function
> > > devm_backlight_device_register(). devm_backlight_device_register() is
> > > defined with its last parameter being declared constant. Hence make
> > > micro_bl_props itself constant as well.
> > > Issue found with Coccinelle.
> >
> > Did you do any review to see if this pattern occurs in other backlight
> > drivers (it looks to me like the same pattern appears in
> > rave-sp-backlight.c... do the tools bring that one out as well).
>
> Ping?

Sorry, did my reply not go through?
I had said:
No, the Coccinelle script I'm using doesn't flag any other backlight
drivers. It's possible that the script just missed something. Which
structure in rave-sp-backlight.c could potentially be made const?

Thanking you,
Nishka

>
>
> Daniel.
>
>
> > > Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> > > ---
> > >  drivers/video/backlight/ipaq_micro_bl.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/video/backlight/ipaq_micro_bl.c b/drivers/video/backlight/ipaq_micro_bl.c
> > > index 1123f67c12b3..85b16cc82878 100644
> > > --- a/drivers/video/backlight/ipaq_micro_bl.c
> > > +++ b/drivers/video/backlight/ipaq_micro_bl.c
> > > @@ -44,7 +44,7 @@ static const struct backlight_ops micro_bl_ops = {
> > >     .update_status  = micro_bl_update_status,
> > >  };
> > >
> > > -static struct backlight_properties micro_bl_props = {
> > > +static const struct backlight_properties micro_bl_props = {
> > >     .type = BACKLIGHT_RAW,
> > >     .max_brightness = 255,
> > >     .power = FB_BLANK_UNBLANK,
> > > --
> > > 2.19.1
> > >
