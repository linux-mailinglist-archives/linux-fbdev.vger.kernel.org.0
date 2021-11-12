Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B65D144E66D
	for <lists+linux-fbdev@lfdr.de>; Fri, 12 Nov 2021 13:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234961AbhKLMh5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 12 Nov 2021 07:37:57 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:45937 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234927AbhKLMh4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 12 Nov 2021 07:37:56 -0500
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 237123F1EA;
        Fri, 12 Nov 2021 13:35:03 +0100 (CET)
Date:   Fri, 12 Nov 2021 13:35:01 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Courtney Cavin <courtney.cavin@sonymobile.com>
Subject: Re: [RESEND PATCH v2 04/13] backlight: qcom-wled: Fix off-by-one
 maximum with default num_strings
Message-ID: <20211112123501.pz5e6g7gavlinung@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>, Bryan Wu <cooloney@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org,
        Courtney Cavin <courtney.cavin@sonymobile.com>
References: <20211112002706.453289-1-marijn.suijten@somainline.org>
 <20211112002706.453289-5-marijn.suijten@somainline.org>
 <20211112120839.i6g747vewg6bkyk7@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112120839.i6g747vewg6bkyk7@maple.lan>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 2021-11-12 12:08:39, Daniel Thompson wrote:
> On Fri, Nov 12, 2021 at 01:26:57AM +0100, Marijn Suijten wrote:
> > When not specifying num-strings in the DT the default is used, but +1 is
> > added to it which turns WLED3 into 4 and WLED4/5 into 5 strings instead
> > of 3 and 4 respectively, causing out-of-bounds reads and register
> > read/writes.  This +1 exists for a deficiency in the DT parsing code,
> > and is simply omitted entirely - solving this oob issue - by parsing the
> > property separately much like qcom,enabled-strings.
> > 
> > This also allows more stringent checks on the maximum value when
> > qcom,enabled-strings is provided in the DT.  Note that num-strings is
> > parsed after enabled-strings to give it final sign-off over the length,
> > which DT currently utilizes to get around an incorrect fixed read of
> > four elements from that array (has been addressed in a prior patch).
> > 
> > Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > ---
> >  drivers/video/backlight/qcom-wled.c | 51 +++++++++++------------------
> >  1 file changed, 19 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > index 977cd75827d7..c5232478a343 100644
> > --- a/drivers/video/backlight/qcom-wled.c
> > +++ b/drivers/video/backlight/qcom-wled.c
> > @@ -1552,6 +1520,25 @@ static int wled_configure(struct wled *wled)
> >  		}
> >  	}
> > 
> > +	rc = of_property_read_u32(dev->of_node, "qcom,num-strings", &val);
> > +	if (!rc) {
> > +		if (val < 1 || val > wled->max_string_count) {
> > +			dev_err(dev, "qcom,num-strings must be between 1 and %d\n",
> > +				wled->max_string_count);
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (string_len > 0) {
> > +			dev_warn(dev, "qcom,num-strings and qcom,enabled-strings are ambiguous\n");
> 
> The warning should also be below the error message on the next if statement.

Agreed.

> This warning occurs even when there is no ambiguity.
> 
> This could be:
> 
> 	if (string_len > 0 && val != string_len)
> 
> Combined these changes allows us to give a much more helpful and assertive
> warning message:
> 
> qcom,num-strings mis-matches and will partially override
> qcom,enabled-strings (remove qcom,num-strings?)

I want to let the user know it's set regardless of whether they're
equivalent; no need to set both.

How about:

    Only one of qcom,num-strings or qcom,enabled-strings should be set

That should be more descriptive?  Otherwise, let me know if you really
want to allow users to (unnecessarily) set both - or if it can / should
be caught in DT validation instead.

- Marijn

> > +			if (val > string_len) {
> > +				dev_err(dev, "qcom,num-strings exceeds qcom,enabled-strings\n");
> > +				return -EINVAL;
> > +			}
> > +		}
> 
> 
> Daniel.
