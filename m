Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA531225BBC
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 Jul 2020 11:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgGTJgB (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 Jul 2020 05:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgGTJgB (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 Jul 2020 05:36:01 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411A3C061794
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Jul 2020 02:36:01 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id t198so13920759oie.7
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Jul 2020 02:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZNxm2z54xhtj6yCPRO7kYC1arlUA7YqvRKAbrJcyWVo=;
        b=KiGF/HsWcmzhjD7saOtN9N9aH75StsVlQ/1S2IA09fhK1R/SZTJmj7RM+DWKlLxYqv
         2/gLh+uyQEIB83t6faaB5dc4ARdpa0P0dUsrPviFw5+kNMvNiQEyT5S1ncWlKBiWHeBy
         ccvgEH+vUe2joF4Nr+HmHmLmuU4jhUIXFwtPlKc0r/Z5ItmKo/W91elVSOoG6CwhxTXV
         nTZuvb7J7zSIYDk7+VybcSsPbLwnkXMq80wExFt671KwzDj3TURBvPxkShK17Nzapygy
         VbArsmLzRZRGDVpszWZn5wqElPngJwW19YwjZ+HHIIAohpUScewhGJPhnG2mEAOsU7vZ
         XDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZNxm2z54xhtj6yCPRO7kYC1arlUA7YqvRKAbrJcyWVo=;
        b=Pp6828+4fqwnyMyvhiZQdpOU0y4AbARfc7cQbYKhxb5FG/6cym+k4+1O43aDaQCbRe
         0Za8+aaRLD/F0or7zPam7lTAJsEfPCseEtVv5WJJde35f5KYVAivek7avs9ftV7Kume4
         xA6mJqrLU/jU1iC6Ypy+QV8sOAneNhd4NvXCxJY3y/u648lCK61r8Bgq+6cdK9dwuOZd
         RSWawt+yZb3P17xDPonTNeqR5YpspEiD8X2wl5ikg5Te6D95QC4XiOHR9s6YNRiZ+aix
         qKqIMMo6ZN7xGstH1o9oZXVPh7JimtpWVzYyLDc5eb9R2mV/EqkyitbDn94juZq+gi3v
         GBEg==
X-Gm-Message-State: AOAM532ffc0RTau7jsVe5KjLsqQF3U9P4byg7PCA0XDK8d1dYlKTR6bU
        XHkj7/vCj46euNZi+sXgVuTonchnfR7sOpW7a6Xk0MXC
X-Google-Smtp-Source: ABdhPJwYawHU9BgFp4Os8MlY50BY20HmfIBRmAYllJxQPF5ceGK/3AOWwRSuWsoqzXUefbv4w7dWQRqrnAh5aUgShSU=
X-Received: by 2002:a54:4e1d:: with SMTP id a29mr15004596oiy.139.1595237760397;
 Mon, 20 Jul 2020 02:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <36f3542011c34c4a9509f00c666a514a@kontron.com>
In-Reply-To: <36f3542011c34c4a9509f00c666a514a@kontron.com>
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date:   Mon, 20 Jul 2020 10:35:24 +0100
Message-ID: <CADVatmOmhA5E6Qi23YtdZjtoS=dKKCk1bujw9dEY-sKrGAt30A@mail.gmail.com>
Subject: Re: SM750 : from which driver should I start to add a new transmitter ?
To:     Gilles Buloz <Gilles.Buloz@kontron.com>
Cc:     "greg@kroah.com" <greg@kroah.com>,
        "teddy.wang@siliconmotion.com" <teddy.wang@siliconmotion.com>,
        LFBDEV <linux-fbdev@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

HI Gilles, (Added fbdev and dri list)

On Mon, Jul 20, 2020 at 10:18 AM Gilles Buloz <Gilles.Buloz@kontron.com> wr=
ote:
>
> Dear developers,
>
>
> My company is manufacturing M2 graphics modules based on SM750. and I nee=
d to add support for an ANX9404 transmitter (for DP). I'm wondering which d=
river you would recommend to start my development :
>
> - your SM750 framebuffer driver is available in the kernel under drivers/=
staging/sm750fb/. It is clean and maintained.

Yes, and I know many companies who are using SM750 uses this driver,
but the fact remains that it can be removed from staging any time as
it can never migrate out of staging,

>
> - I'm currently using another driver from SiliconMotion I got through Inn=
odisk (another modules manufacturer) supporting SM750/SM768 and labelled "S=
iliconMotion GPU DRM Driver". But the code is not very clean and produces l=
ots of warning when building, and seems no more maintained. I even don't ha=
ve the name nor the email of the developer. However it already works fine w=
ith our current HDMI transmitter.
>
>
> Having a look to the sm750fb kernel driver, the TODO file says : "must be=
 ported to the atomic kms framework in the drm subsystem (which will give y=
ou a basic fbdev driver for free)".

Yes.

>
> It seems my current driver is already of this kind (DRM driver using mode=
setting Xorg module). I can send you the source code of this driver as it i=
s open source If you want to see which driver I mean.

Is it the same as the one I have at gitlab
(https://gitlab.com/sudipm/sm750/tree/sm750) ? If it is same then it
will not be accepted in drm subsystem as it needs to be cleaned and I
will need to add "atomic" to it. Well, atomic was the main blocker.
But, if the driver that you have has been already converted to be an
atomic driver then please send it to me and I can clean it up and
submit.



--
Regards
Sudip
