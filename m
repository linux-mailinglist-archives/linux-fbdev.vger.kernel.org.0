Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34FD4A5314
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Sep 2019 11:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731309AbfIBJlz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Sep 2019 05:41:55 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46458 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731262AbfIBJly (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Sep 2019 05:41:54 -0400
Received: by mail-wr1-f65.google.com with SMTP id h7so11954817wrt.13
        for <linux-fbdev@vger.kernel.org>; Mon, 02 Sep 2019 02:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ZL2haMI2aTtJurgKOti2qg6P2dpB10rrMYX8xsD2bK8=;
        b=Jp3giVDeY/0YoOVsPWRfoipAvNrzI7SL/np7C/5ElKhomtCfzrE5qjSsgFLnvv+6ZH
         lILykF95Pb4ijIZzZkaRiTqqBEIeFeKsVvMtQvJ6lBPBwxjaQVfXsjEyVLkPFCKXE4B3
         DrWHHs+HbI/F+q3dhSOuFdgQsNXLr0nM2yrOla+U/Aw8bvW0fsrUez9tDU4q4HSs2cB4
         3UtfZt8rdx6Gl4LZk1oY0gUY8s7knHlKkWdn3nwNRkUjShH/h3ie/SGOfYieJgjpA2XY
         2DI18qzAQKD2TsWZW7QDG9lKvubbZH1Kkkp4cH54fJQ0CZG37DAim0aE1ELf7PWuLK4/
         zkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ZL2haMI2aTtJurgKOti2qg6P2dpB10rrMYX8xsD2bK8=;
        b=gzHSLkgSsB/qzUcisKhwAbI2jh3all/VZYLz2F/EexsNpAkYIUgT+hFCbS2pl2YIIQ
         amxsjL7BfTo92qfAmW39EeDiFzbtXtJI6KZvDUSslXPAgtFYimV5/l7Dorcjt+9/wLkp
         jkmdXRICsgoG9n93xmKOfDpPnVdFq3UHTOWwJwyDBSCHsfrohnF/d9bWfG69CDQfkcj5
         83ZN/+gnmVUvfQVx/5db9UVcU0QfaZ5rBy519D4YjjP0H9T1Uc5S3gnfkIRAi6dZn5k3
         QLamRJsGQ1a+1Bk7/Xe34Nlwm97GiJl+oj7pWBOFDJo1rSdD/P5fEP9rpdUMySnzR3AX
         7+YA==
X-Gm-Message-State: APjAAAWoFBvIL8IEI/JYIkyzc+wMnlw2sNuUunUuhBs8fJ03MYUZSVUd
        vdeGRmoNyFvCtNkKX6ZNbEcDMA==
X-Google-Smtp-Source: APXvYqz+ei3zvK9WDCLGPKSb6mZHeIVD4NjOj/SiGtZ3rCzqedIErcw16UBzZxGSMgr8fc4SWNzRbQ==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr14215758wrv.206.1567417312894;
        Mon, 02 Sep 2019 02:41:52 -0700 (PDT)
Received: from dell ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id j26sm4577684wrd.2.2019.09.02.02.41.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 02:41:52 -0700 (PDT)
Date:   Mon, 2 Sep 2019 10:41:50 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: Set scale type for CIE 1931
 curves
Message-ID: <20190902094150.GN32232@dell>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-4-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190709190007.91260-4-mka@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 09 Jul 2019, Matthias Kaehlcke wrote:

> For backlight curves calculated with the CIE 1931 algorithm set
> the brightness scale type to non-linear. This makes the scale type
> available to userspace via the 'scale' sysfs attribute.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> Changes in v3:
> - mark scale as non-linear instead of using the CIE1931 type which
>   has been removed
> - updated commit message
> 
> Changes in v2:
> - added Enric's 'Tested-by' tag
> - added Daniel's 'Acked-by' tag
> ---
>  drivers/video/backlight/pwm_bl.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
