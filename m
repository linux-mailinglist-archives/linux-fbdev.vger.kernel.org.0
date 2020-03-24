Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 035AD1912E4
	for <lists+linux-fbdev@lfdr.de>; Tue, 24 Mar 2020 15:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgCXOX4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 24 Mar 2020 10:23:56 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37332 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727501AbgCXOXz (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 24 Mar 2020 10:23:55 -0400
Received: by mail-wr1-f66.google.com with SMTP id w10so21713889wrm.4
        for <linux-fbdev@vger.kernel.org>; Tue, 24 Mar 2020 07:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cKmeib+BmWwd47DgxcgoVOMPKvAp+uPr4gwXndY1O5I=;
        b=Ce3yOBCPqf7VZXVox52EqtYVXwJmCTDBc4rPpj21E1LEXlSyWAWPpoO3IXOyacoBvV
         OPgcpgxn5NjhVaIDt+zAvy5+UtjOV/cQnl0nXkQMvPO7aw7V7L0Nu9pbz1AnO05QY0n4
         BeT08PMENEfpbDVVhnyfCE4hEenLxGYJs78gdR/3IgD9pKkhJaXbj10IpQSdREvsRAhg
         oMO/smrg6JtZ4Shi97Wp1/RP26dRPQVbpY8F4EPEA72GrhFXToBKKdg2B+xQdgGJJ2vZ
         f2OdT6atGc6tDEHNZ3v5g2Os9ohn+lfi1UqtMOP30U5uAMJEClhlBGzyP7GZijgmL5k/
         0qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cKmeib+BmWwd47DgxcgoVOMPKvAp+uPr4gwXndY1O5I=;
        b=beFk8lohY9QzffXbxsPvezorsMt7MRB3NOD0hJJ/lLbqQ9hZmaX3GOSfACaq11oY39
         /Dc7VbwZdzWQhE1ObOeNc7LpJnKnLRiczgRnN/PNkhUxfQagjjTxJfXlZ4CxW19bpLTf
         IxN5eSSSqbpKGKK1+wTE1dZumbx3+S4xCdBRamxtFHfl7KPfBwESJa974sLoMNkwdP7f
         Sr/9CWbigDcbVw4g7NPFh594paJvci9DnOziayGaR9uM+iOuTYGDX/KpnOWW9gnYqQH6
         bKpiUhAFRJfvJhT/s2xQtm11lrgwDMzp1zeB4uGw+0GY/2aZe6YQZmFyuLgdp9VsRVG+
         j4wA==
X-Gm-Message-State: ANhLgQ2n4D8jzeb+ufUPQBvedq46bvoM/k9HXKhhHmCLPuSS9LvyTpA6
        DrTTRPXA8DQIhKdAPywqpHlIZQ==
X-Google-Smtp-Source: ADFU+vvHmRGGnvo0nzP7x/ozCt+1LNA6o+Q2xPy5/8uHRCz+FM1auNFVHF2NF74leUS+Zr/IBljAKw==
X-Received: by 2002:a5d:6044:: with SMTP id j4mr35092009wrt.232.1585059833617;
        Tue, 24 Mar 2020 07:23:53 -0700 (PDT)
Received: from dell ([2.27.35.213])
        by smtp.gmail.com with ESMTPSA id n2sm30986951wro.25.2020.03.24.07.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 07:23:52 -0700 (PDT)
Date:   Tue, 24 Mar 2020 14:24:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Guru Das Srinagesh <gurus@codeaurora.org>,
        linux-pwm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v11 10/12] backlight: pwm_bl: Use 64-bit division function
Message-ID: <20200324142441.GD442973@dell>
References: <cover.1584667964.git.gurus@codeaurora.org>
 <17fc1dcf8b9b392d1e37dc7e3e67409e3c502840.1584667964.git.gurus@codeaurora.org>
 <20200320133123.GD5477@dell>
 <20200324110710.GL5477@dell>
 <20200324125735.2mjuvbxt5bpon2ft@pengutronix.de>
 <20200324130410.dwlg767ku6kwequv@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200324130410.dwlg767ku6kwequv@holly.lan>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 24 Mar 2020, Daniel Thompson wrote:

> On Tue, Mar 24, 2020 at 01:57:35PM +0100, Uwe Kleine-König wrote:
> > Hello Lee,
> > 
> > On Tue, Mar 24, 2020 at 11:07:10AM +0000, Lee Jones wrote:
> > > On Fri, 20 Mar 2020, Lee Jones wrote:
> > > 
> > > > On Thu, 19 Mar 2020, Guru Das Srinagesh wrote:
> > > > 
> > > > > Since the PWM framework is switching struct pwm_state.period's datatype
> > > > > to u64, prepare for this transition by using div_u64 to handle a 64-bit
> > > > > dividend instead of a straight division operation.
> > > > > 
> > > > > Cc: Lee Jones <lee.jones@linaro.org>
> > > > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > > > > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > > > Cc: linux-pwm@vger.kernel.org
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Cc: linux-fbdev@vger.kernel.org
> > > > > 
> > > > > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > > > > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > > > ---
> > > > >  drivers/video/backlight/pwm_bl.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > Can this patch be taken on its own?
> > > 
> > > Hellooooo ...
> > 
> > Conceptually it can. As the last patch depends on this one (and the
> > others) some coordination might be beneficial. But that's up to Thierry
> > to decide how (and if) he want this series to be applied.
> 
> ... and on the backlight side we definitely need to know about the "if"
> otherwise there's no point in taking it.

Right.

I'm happy to wait for Thierry.  Although this isn't the only set he's
currently blocking.  Is he okay?  On holiday perhaps?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
