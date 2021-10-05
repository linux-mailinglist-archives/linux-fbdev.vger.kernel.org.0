Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30BA542225C
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Oct 2021 11:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbhJEJf0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 5 Oct 2021 05:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233574AbhJEJfZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 5 Oct 2021 05:35:25 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A33C061755
        for <linux-fbdev@vger.kernel.org>; Tue,  5 Oct 2021 02:33:34 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id p21so6087154wmq.1
        for <linux-fbdev@vger.kernel.org>; Tue, 05 Oct 2021 02:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=84i4+SzL9tiQo/SOSLeEzwo8g6Lg9b2B2s8GHO0rn9o=;
        b=WaWK+vO3GHH71aqMogJcK7UAKifrVXNE9OzaJrTvObEyqj74YLfbafdzDVMQL0coEu
         CuNwRzCsT1pVdmPLSvb4NBANiT41zxtJI/SZc5EkT941+DLJJyiDYjAU6StNuECZ33K8
         UrZluNpRWi00T6c6c4EaouBbA9mcnyzrkZgctEJrBrB8Nke/hS1CXTY1pSMh7lwQF7p7
         yXXoS1QvI5knJ31FblmsHibRFJO1PkYCaZiAzVVeV9rqDo1asr/fVvHsMuwQczohxNNk
         77assjsCcZsguQ5DbAWzKSTtiYb3ovZVTa34BZSleiF8LlfWIek22ADi0zk9ZvLtaLNn
         cS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=84i4+SzL9tiQo/SOSLeEzwo8g6Lg9b2B2s8GHO0rn9o=;
        b=OX59/0gezFxc08pOpIaRgikSe8hdkehiQLI46K9VzoEhvqFd+xIfRFn9jW+SPmANr7
         PKMEKkvpAdhPjtdfVQtn2FbFTnN8l4VAeLvJzXIHIf1PsBAqCxqWiEEJUu5YPYWeefO6
         x/6umvAtlUKm+XBdfzr3M4Q6AYTagFTfEulUFUbwMgpXKJWiysd8pZqW2RZ0qbVI0nwY
         A/Fn701wkODu4CCqxiaO06ZzuJoZR6gbN9Hq5XvVUe7kkrm8OX9Tgx29leQQcvF236ic
         iWTXcLf81kpz76Z/rdfEedUxLu0F40x2qEi0Zj6XV0UlEUIhBO9EKsWKuVV+ZEk9G7NX
         90Fw==
X-Gm-Message-State: AOAM5336dWqQHjKgV2c9ZXVWvENfGV5dHlaX7F2cLRupxpX8+zvHwc+b
        rDDn0oiGx3Eehf3nndvgxPOc4w==
X-Google-Smtp-Source: ABdhPJw0zjXOLhlcSRooceJ4ayxqpv13Rbw1Of426+AbhSJDGcM2mvcDifH9KLoqa9i1dBz8lo0OzA==
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr2276144wmh.74.1633426413360;
        Tue, 05 Oct 2021 02:33:33 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id r9sm17065679wru.2.2021.10.05.02.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 02:33:32 -0700 (PDT)
Date:   Tue, 5 Oct 2021 10:33:31 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/10] backlight: qcom-wled: Consistently use
 enabled-strings in set_brightness
Message-ID: <20211005093331.4houxsc5b6lfzmbz@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-10-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004192741.621870-10-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Oct 04, 2021 at 09:27:40PM +0200, Marijn Suijten wrote:
> The hardware is capable of controlling any non-contiguous sequence of
> LEDs specified in the DT using qcom,enabled-strings as u32
> array, and this also follows from the DT-bindings documentation.  The
> numbers specified in this array represent indices of the LED strings
> that are to be enabled and disabled.
> 
> Its value is appropriately used to setup and enable string modules, but
> completely disregarded in the set_brightness paths which only iterate
> over the number of strings linearly.
> Take an example where only string 2 is enabled with
> qcom,enabled_strings=<2>: this string is appropriately enabled but
> subsequent brightness changes would have only touched the zero'th
> brightness register because num_strings is 1 here.  This is simply
> addressed by looking up the string for this index in the enabled_strings
> array just like the other codepaths that iterate over num_strings.

This isn't true until patch 10 is applied!

Given both patches fix the same issue in different functions I'd prefer
these to be squashed together (and doubly so because the autodetect code
uses set_brightness() as a helper function).


Daniel.
