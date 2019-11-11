Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90E3AF70BA
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 Nov 2019 10:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfKKJau (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 11 Nov 2019 04:30:50 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54375 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbfKKJat (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 11 Nov 2019 04:30:49 -0500
Received: by mail-wm1-f66.google.com with SMTP id z26so12475462wmi.4
        for <linux-fbdev@vger.kernel.org>; Mon, 11 Nov 2019 01:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=j4UsCyQdcZm2KCJe59FDjzH8nfUWhHJFhxVJ6xfimnY=;
        b=R07dOsYYwpCpFqth2eEc/oCIsVGaao+wJn8wLg/tmKa7DWZrLBWvdgQx9iz4t5Bou+
         NyhMN5nHtROIBDBw/J2CRYIOtN+EXzAti6P8xtElGQWvekQHtrzTT1eBZCFSPGwuzGNu
         iJOqNEoouqVKG5syT/aSf4ScmQTaC4Dm/aumuHvIxx8ScQuOYUQPsTQ8ogi05kcJA2nF
         j77KE5TGXxf7iWtwl1Vu/bowSieiJy/4G5x3mTV7Obk6ktIIcic+E42dTW3WxMSJBEB+
         68IyDuWAADrxnS4xxQ7FliuravZHxaMgwkmsk8Ogdrup6ezZyviq0N4hLN6CZ9tChZSi
         Z2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=j4UsCyQdcZm2KCJe59FDjzH8nfUWhHJFhxVJ6xfimnY=;
        b=r4xcq9GbrJVDus0NZn5xZSykDoJFsP8KftkmYmHeV6QUBlSzzlsPDb/mjtEQkDlel6
         no2bMfkGAlkHj4OTP7NFB/f8iQZoz6VUeE/1/c0OLFJhHBcDD0a7z+Iq4IVsuJTDP+/F
         okPreZ6IFAtbdGXoD7dEVc3N9ScOzTdlN9NHKhnH8voyz/dz5KmqEyZO+JWiTKQGxFV4
         r4FHzfTD+u68W5qtQ5fHXN9Zvwh5PuAUx7Y2Ftf72onMDJijfO2iCqM/zoFctgRjBoAZ
         TH7US2YH6DNPEwFkygoqSnbUcUPzwbheka5N7gMkAdXtnkw/fTIEOKIH6EZ/ofG7p5WW
         1K4A==
X-Gm-Message-State: APjAAAXK2ZaIbhFdlp4wmvbAoEamsubTmjknAwFv6uSerMKSvb6Pp+nH
        iAFV02hz1Vha0HwOIsEgWs0/UQ==
X-Google-Smtp-Source: APXvYqz0dNCJqOn51gF9WLKs0blLiqHdYKWXicmqZcGwIqo2oULL5pMRIbpJqhIRh6h98e57UR7klQ==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr18676120wme.118.1573464646982;
        Mon, 11 Nov 2019 01:30:46 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id z14sm13555064wrl.60.2019.11.11.01.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:30:45 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:30:38 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 38/46] video: backlight: tosa: use gpio lookup table
Message-ID: <20191111093038.GA3218@dell>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-38-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191018154201.1276638-38-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 18 Oct 2019, Arnd Bergmann wrote:

> The driver should not require a machine specific header. Change
> it to pass the gpio line through a lookup table, and move the
> timing generator definitions into the drivers itself.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> ---
> I'm not overly confident that I got the correct device names
> for the lookup table, it would be good if someone could
> double-check.
> ---
>  arch/arm/mach-pxa/include/mach/tosa.h | 15 --------------
>  arch/arm/mach-pxa/tosa.c              | 22 +++++++++++++++++++++
>  drivers/video/backlight/tosa_bl.c     | 10 +++++-----
>  drivers/video/backlight/tosa_bl.h     |  8 ++++++++
>  drivers/video/backlight/tosa_lcd.c    | 28 ++++++++++++++++++++-------
>  5 files changed, 56 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/video/backlight/tosa_bl.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
