Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2F544E730
	for <lists+linux-fbdev@lfdr.de>; Fri, 12 Nov 2021 14:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbhKLNWV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 12 Nov 2021 08:22:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232760AbhKLNWU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 12 Nov 2021 08:22:20 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE80C061767
        for <linux-fbdev@vger.kernel.org>; Fri, 12 Nov 2021 05:19:30 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso9815671wml.1
        for <linux-fbdev@vger.kernel.org>; Fri, 12 Nov 2021 05:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1eaJViV6yW2w/7feIrBH34EYgKSWZrLiHMX+rKu9+Ec=;
        b=JPsAx3UoeFB+Q+s++U4FCu9KL6kCzcAnqEpWrv7us5Q47qsbYMibg+3wsg3saypWim
         Z1o6kg+CKkjkt+e13H9Z+KCcUatH5Ps8kLtjxM6L/aFOWaHUxsJbGOe8wE55cQU0pwIl
         0QHqmb3CVT1SxOJ2PbV8+qc3h4Pj/uWNGFmO6vHR6/xjoVJ0GhZa7+q9IXOr5aJflESk
         KVJXQP27EhfQGYIB2oNfvQo214Hi0kPolGTDCay/fBgoeaY07j0X5QoAUcqA/upPxgY/
         fbL70uvsybKZeUMWVsQXSxN2w5VN2XiiS5DcA5cWoRXZ/OoCe6n+G3lYI7CWaEW/+yif
         Z2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1eaJViV6yW2w/7feIrBH34EYgKSWZrLiHMX+rKu9+Ec=;
        b=WtLA0WGl2ku2v+S196mbLk47XAQwhCoWNePx/4k049j3MxEje7+1m4Lg5FPFSWqSZC
         AHGpukPGjB1FqXzoATJBnQpxtxoEkxsu4oMwxaxVIDul+LNu7KQKTGQ94/f4fiRwOTQW
         6i9MMsEr9iUEQClr4t3WBYqwzb98OAjLJGRy0xUt5LUazjI12XyPyerTGzO1qmqpJdxx
         7tF/FDAMMQ46m3ToHeRm2UMM54HdvNPkb4YdFc5puTbeMlY5sH5Y5Jz8L68T+09Dio1W
         g9iKMwQFgl9ISSnlvFWiGGfkK/XtC8o7VnrZ18eBFxkCokXfd8Yj+sKjxfSfn3HZdFFk
         7RZA==
X-Gm-Message-State: AOAM533r2BUDeh8kuhgBxEMjvq6zJfdGensnk+bjBLo99XzPSXErozvV
        L6T7yR4QPNTjjmdx68qF+RGFhg==
X-Google-Smtp-Source: ABdhPJy8PaKQk1FMOFQ+Jw0w8lm3dSgQdxGTQKA3ULTMRo8aBRFcqJUNv4Q/Nt8CFeZvX5gA0SUbZw==
X-Received: by 2002:a1c:1fd6:: with SMTP id f205mr34655741wmf.98.1636723168587;
        Fri, 12 Nov 2021 05:19:28 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id f3sm11409384wmb.12.2021.11.12.05.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:19:27 -0800 (PST)
Date:   Fri, 12 Nov 2021 13:19:25 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
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
Message-ID: <20211112131925.fqallv3z73ehc6y3@maple.lan>
References: <20211112002706.453289-1-marijn.suijten@somainline.org>
 <20211112002706.453289-5-marijn.suijten@somainline.org>
 <20211112120839.i6g747vewg6bkyk7@maple.lan>
 <20211112123501.pz5e6g7gavlinung@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112123501.pz5e6g7gavlinung@SoMainline.org>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Nov 12, 2021 at 01:35:01PM +0100, Marijn Suijten wrote:
> On 2021-11-12 12:08:39, Daniel Thompson wrote:
> > On Fri, Nov 12, 2021 at 01:26:57AM +0100, Marijn Suijten wrote:
> > > +		if (string_len > 0) {
> > > +			dev_warn(dev, "qcom,num-strings and qcom,enabled-strings are ambiguous\n");
> > 
> > The warning should also be below the error message on the next if statement.
> 
> Agreed.
> 
> > This warning occurs even when there is no ambiguity.
> > 
> > This could be:
> > 
> > 	if (string_len > 0 && val != string_len)
> > 
> > Combined these changes allows us to give a much more helpful and assertive
> > warning message:
> > 
> > qcom,num-strings mis-matches and will partially override
> > qcom,enabled-strings (remove qcom,num-strings?)
> 
> I want to let the user know it's set regardless of whether they're
> equivalent; no need to set both.
> 
> How about:
> 
>     Only one of qcom,num-strings or qcom,enabled-strings should be set
> 
> That should be more descriptive?  Otherwise, let me know if you really
> want to allow users to (unnecessarily) set both - or if it can / should
> be caught in DT validation instead.

Yes. I can live with that text. Let's use that.

Maybe I wouldn't if there gazilions of existing DTs with both
properties but IIRC the number is likely to be small or zero
(although we couldn't be 100% sure which).


Daniel.
