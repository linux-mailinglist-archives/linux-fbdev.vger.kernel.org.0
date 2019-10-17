Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7B31DAE13
	for <lists+linux-fbdev@lfdr.de>; Thu, 17 Oct 2019 15:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731276AbfJQNSH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 17 Oct 2019 09:18:07 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46301 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394448AbfJQNSH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 17 Oct 2019 09:18:07 -0400
Received: by mail-wr1-f68.google.com with SMTP id o18so2288833wrv.13
        for <linux-fbdev@vger.kernel.org>; Thu, 17 Oct 2019 06:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cnpSCcayXdtfAHtCUFMXrFZL6KEYCeuqv7WiBW7eAsk=;
        b=R8MAXqGEPp4uF8Ou/83nAFN3Z+rasG/Zv/HjWepBgZNdfqXiwwQ5UQDGiqbcO28QYk
         8qlUZSuXj7HloTdE2+peaEoQo2qddUW4CMJGYiqM7Ue5jlt33HrXfrHDAuwkPcZ0Qb/u
         1ixypQtbH1IGYkIJN16QxC/Eh8XFjnJ4WcPCJhD/fS4b31i5W0WGtSQhl4Q7uJ59+/s3
         3QtvjmbG/1QDu/pBg7LIX+CSdYjbCaqWIAwF3DNww9C3tblosaj/nGtxT3fL1tdbOHTP
         Y87kVKjXEF7l/qZsJKTIF+56bewNUaqAvCam4ita0nZ5KwXOm4P4pcPNZZCAJnQI7Eiw
         HOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cnpSCcayXdtfAHtCUFMXrFZL6KEYCeuqv7WiBW7eAsk=;
        b=mglUDqG8te2LwJIe6ezbQG/ZzlIk6z8jUDi/7IBu61mGHagrjbWpzAvYF71WvNlWwy
         s1xozUgbzqcmyf4jHgRgxdYaQDxs9TAg4mB+KGb+g0eUv8DmFn4AVEjRtLDu/KQ2DCe2
         wv3EORwui1RUHGflBILq3EPCTUP/hN2SJWGtbgAlzAK19hIWeand7GJWlcTX6yn8RXuS
         RFAiCQahropjhqi91e0HBGAADJnGGOqcxVmErQEg5g7sDhhxxQFJx5EiPlByMHpdxb5/
         gxTUS2EUpxGLrsBxYMf6FB7Cc6AFU91Vy4EzFisp3rE+D9qVoZk1Fb2kbFOMJ0n3tmHl
         wXxw==
X-Gm-Message-State: APjAAAUKvUmcRn+DUCQEi8MtVA1lczdpZ9biSgsgJaJrggN+/X+DXm5v
        CAwznDWpIZ6MD7wpEvhIHdBJOQ==
X-Google-Smtp-Source: APXvYqzax72zGGa/8GfFC/1gUgf3ogq64ZV1WMrPeMkHHIDDZZ+s8cVAxrVHqoWuoadFrZkVC0N7aw==
X-Received: by 2002:a5d:65c1:: with SMTP id e1mr3027610wrw.364.1571318284604;
        Thu, 17 Oct 2019 06:18:04 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id r7sm2121756wrt.28.2019.10.17.06.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 06:18:03 -0700 (PDT)
Date:   Thu, 17 Oct 2019 14:18:02 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
Message-ID: <20191017131802.defwuzrgq4ai4mud@holly.lan>
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <20191017114727.fy5tg2kgi6mr2sei@holly.lan>
 <20191017121945.cmcvaffmbd7zydrm@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191017121945.cmcvaffmbd7zydrm@pengutronix.de>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Oct 17, 2019 at 02:19:45PM +0200, Uwe Kleine-K�nig wrote:
> On Thu, Oct 17, 2019 at 12:47:27PM +0100, Daniel Thompson wrote:
> > On Thu, Oct 17, 2019 at 10:10:59AM +0200, Uwe Kleine-K�nig wrote:
> > > A previous change in the pwm core (namely 01ccf903edd6 ("pwm: Let
> > > pwm_get_state() return the last implemented state")) changed the
> > > semantic of pwm_get_state() and disclosed an (as it seems) common
> > > problem in lowlevel PWM drivers. By not relying on the period and duty
> > > cycle being retrievable from a disabled PWM this type of problem is
> > > worked around.
> > > 
> > > Apart from this issue only calling the pwm_get_state/pwm_apply_state
> > > combo once is also more effective.
> > 
> > I'm only interested in the second paragraph here.
> > 
> > There seems to be a reasonable consensus that the i.MX27 and cros-ec
> > PWM drivers should be fixed for the benefit of other PWM clients.
> > So we make this change because it makes the pwm-bl better... not to
> > work around bugs ;-).
> 
> That's fine, still I think it's fair to explain the motivation of
> creating this patch.

Maybe.

Whether this patch is a workaround or simply an improvement to pwm-bl
does need to be clear since it affects whether Lee steers it towards
v5.4-rcX or linux-next .


Daniel.
