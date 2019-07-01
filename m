Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13AD91189F
	for <lists+linux-fbdev@lfdr.de>; Thu,  2 May 2019 14:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfEBMBt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 2 May 2019 08:01:49 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56203 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfEBMBt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 2 May 2019 08:01:49 -0400
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <l.stach@pengutronix.de>)
        id 1hMAPK-0007mT-Bl; Thu, 02 May 2019 14:01:46 +0200
Message-ID: <1556798505.2590.7.camel@pengutronix.de>
Subject: Re: [PATCH] backlight: rave-sp: don't touch initial state and
 register with correct device
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        patchwork-lst@pengutronix.de, kernel@pengutronix.de
Date:   Thu, 02 May 2019 14:01:45 +0200
In-Reply-To: <c23ecabd-c2ee-8c23-9ee3-13290bc4da35@linaro.org>
References: <20190429152919.27277-1-l.stach@pengutronix.de>
         <c23ecabd-c2ee-8c23-9ee3-13290bc4da35@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Daniel,

Am Donnerstag, den 02.05.2019, 11:33 +0100 schrieb Daniel Thompson:
> On 29/04/2019 16:29, Lucas Stach wrote:
> > This way the backlight can be referenced through its device node and
> > enabling/disabling can be managed through the panel driver.
> 
> Is it possible to implement something similar to 
> pwm_backlight_initial_power_state() to handle this?

I'm not aware of any protocol to the RAVE-SP that would allow to read
back the backlight state. AFAICS the backlight is implemented as a
unidirectional protocol.

Regards,
Lucas

> backlight drivers already suffer from too much diversity so I prefer 
> things like this to align behaviour with the (fairly heavilyly used) PWM 
> driver if possible.
> 
> 
> Daniel.
> 
> 
> > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >   drivers/video/backlight/rave-sp-backlight.c | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/video/backlight/rave-sp-backlight.c b/drivers/video/backlight/rave-sp-backlight.c
> > index 462f14a1b19d..d296bfcf4396 100644
> > --- a/drivers/video/backlight/rave-sp-backlight.c
> > +++ b/drivers/video/backlight/rave-sp-backlight.c
> > @@ -48,15 +48,13 @@ static int rave_sp_backlight_probe(struct platform_device *pdev)
> > > >   	struct device *dev = &pdev->dev;
> > > >   	struct backlight_device *bd;
> >   
> > > > -	bd = devm_backlight_device_register(dev, pdev->name, dev->parent,
> > > > +	bd = devm_backlight_device_register(dev, pdev->name, dev,
> > > >   					    dev_get_drvdata(dev->parent),
> > > >   					    &rave_sp_backlight_ops,
> > > >   					    &rave_sp_backlight_props);
> > > >   	if (IS_ERR(bd))
> > > >   		return PTR_ERR(bd);
> >   
> > > > -	backlight_update_status(bd);
> > -
> > > >   	return 0;
> >   }
> >   
> > 
> 
> 
