Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E24316187
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 May 2019 11:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfEGJxQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 May 2019 05:53:16 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39199 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfEGJxL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 May 2019 05:53:11 -0400
Received: by mail-wr1-f68.google.com with SMTP id v10so9119899wrt.6
        for <linux-fbdev@vger.kernel.org>; Tue, 07 May 2019 02:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=tcxS/2hWpXskjofGSRtseVQHc72BiZ0p45vo0Vdka28=;
        b=jQqWVK1unu7T2kZOE+gg87wq3FaLBBLlf79ijlqE53cIvYRlBTOVpLHtKmzgG75Uaz
         qUGpykrKD76+xOMdprElOVqPIa03BD97ytwIq+mwM+TGIkPSdwAwZ1uahhv//mR+X23W
         Kn5toaEsASuWW9khg23mJ3aXmivkbYcSxPH49QsSeNjur0i3t72nwda3GHlL2N+/9Yyo
         A/dxuHpJ/VAh9F5sxGxlLyMKoFOpfJTgnYenmbAw4NQeGwteCCBUiLdJSt2WeDZMeT+7
         sI35QOEHso5oe2aQHXF/3m9iCI4corsq29MMd0hNv4SHtAUwaNo9TFi4uSNjOd5xdvG+
         qj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=tcxS/2hWpXskjofGSRtseVQHc72BiZ0p45vo0Vdka28=;
        b=Ctiu447+O6/BDsTMbksuY041XvG7W7x2Xfci7p12GdJ5OaQcz5IEz5x0/UkUu1G1Cb
         ptrUg5xm1DeLEZIbhk1uyeNsGmAeI/nc/IkVx3ftHXk4tOEgfsGNsoQiba4N8cEhKC25
         wRlHbNY4I5uMehMLHN3jhmQL0QESDf405zf7Sh3i8TGnPUiOnOSQKfjiXxAobXS7a8uN
         JitHVhFx9sO1djAd+splmaLzJP9hzEAPxuCipRhGaK77NTtfFe2kF9qk7QdrhH1R8U1+
         iaKgSZA8GSNgZaeq2S9rTIgtHSw23+M0dXySKsvsYWK7z1sYi6ZY0KBuwQMmcuLuFtbp
         olzw==
X-Gm-Message-State: APjAAAV7WBUYptV/Wahx8DwXAWU7X1Y55KB8+MRnc2lz7aIVEcN8oHYL
        OAbcMXLYsKa5EdUFqio+4j3YTQ==
X-Google-Smtp-Source: APXvYqwo3mM58fkGHxIdzaZEGdBCoVtchbx0EHRZjuaTTSmrlX26j60GrA4koYEVJwZOeYXfzyNWBg==
X-Received: by 2002:adf:f7d0:: with SMTP id a16mr21241175wrq.211.1557222789633;
        Tue, 07 May 2019 02:53:09 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id p67sm11911297wmp.22.2019.05.07.02.53.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2019 02:53:09 -0700 (PDT)
Date:   Tue, 7 May 2019 10:53:07 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Brian Masney <masneyb@onstation.org>, jingoohan1@gmail.com,
        robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dmurphy@ti.com, jonathan@marek.ca,
        Daniel Thompson <daniel@redfelineninja.org.uk>
Subject: Re: [PATCH v6 1/3] backlight: lm3630a: return 0 on success in
 update_status functions
Message-ID: <20190507095307.GE4529@dell>
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-2-masneyb@onstation.org>
 <864c1ddc-1008-0041-1559-e491ca0186ef@linaro.org>
 <20190502104239.GA24563@basecamp>
 <20190502104644.e3eth2cdebuz2mpk@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190502104644.e3eth2cdebuz2mpk@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 02 May 2019, Daniel Thompson wrote:

> On Thu, May 02, 2019 at 06:42:39AM -0400, Brian Masney wrote:
> > On Thu, May 02, 2019 at 11:07:51AM +0100, Daniel Thompson wrote:
> > > On 24/04/2019 10:25, Brian Masney wrote:
> > > > lm3630a_bank_a_update_status() and lm3630a_bank_b_update_status()
> > > > both return the brightness value if the brightness was successfully
> > > > updated. Writing to these attributes via sysfs would cause a 'Bad
> > > > address' error to be returned. These functions should return 0 on
> > > > success, so let's change it to correct that error.
> > > > 
> > > > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > > > Fixes: 28e64a68a2ef ("backlight: lm3630: apply chip revision")
> > > > Acked-by: Pavel Machek <pavel@ucw.cz>
> > > 
> > > Hi Brian, sorry for the delay. For some reason your mails are being dumped
> > > before they reach me so I only discovered these patches when I paid proper
> > > attention to the replies and fetched them from patchwork.
> > > 
> > > Hi Lee, is the same thing happening for you? ;-)
> > 
> > Huh, that's odd. I haven't ran into that issue when working with people
> > from Linaro in other subsystems.
> > 
> > As a sanity check, I used 'git send-email' to send this patch to
> > check-auth@verifier.port25.com and it verified that I still have SPF,
> > DKIM, reverse DNS, etc. all setup properly on this domain.
> > 
> > hotmail.com addresses are the only ones I've had issues with in the
> > past, but I doubt you're forwarding your email there. :)
> 
> No... and strangely enough your recent e-mail sailed through just fine.
> Let's wait and see what is happening for Lee (which I suspect may not be
> until well into next week).

Just catching up now.  On first pass - only ~800 mails to go!

Looks like I do have Brian's mails though.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
