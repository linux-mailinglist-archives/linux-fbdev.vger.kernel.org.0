Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D824CA5204
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Sep 2019 10:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729849AbfIBIkf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Sep 2019 04:40:35 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55009 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730728AbfIBIk2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Sep 2019 04:40:28 -0400
Received: by mail-wm1-f66.google.com with SMTP id k2so12117322wmj.4
        for <linux-fbdev@vger.kernel.org>; Mon, 02 Sep 2019 01:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=xl3Ai/AmJFR6ZhTztzr3SBL0HsX+mzfXY2ojYs65AK8=;
        b=GjeWNFh0qzJtRNv2HvHvICds/YkS4LdvROFX4CYEyI+4pLuL3eNmjv3XCtsie8gXNe
         UptA6Vkinbxf2B4m2QNS2dJHMEtorZsE7he4AlyM6kxnQkbxQ1f7tXSrgZUlCujENiiQ
         KbDmM6mjgN1X8aIchZswmgojxyWJM8ZqFivrjFpBFHNiFl0ZK7dp2qGlBzByaJTsVy2O
         z02Ylk8HPjyWcmTuIKetoNU+djS6Hrh5wyc9L0icwNq/d6/cUgz5YMLD9DL24TFF7m0f
         G4YU3dPXlkUJVnHG/Nn0VffzjL7K/0IPs2J4ObsxpAclJ2CtmHwogXVcuk3OqX95oeqZ
         P57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=xl3Ai/AmJFR6ZhTztzr3SBL0HsX+mzfXY2ojYs65AK8=;
        b=c8PTvnxCixzj+C8rs928VFfkkxeaYJNf0629EGTrMPQjheHpARZIgBlSGaf5cIIV3V
         bA62Bgpbl1fRrzbQiWbHp6w0hsHMoQhZgut1p1PpKkMH+QAs44D14woC+vjctiId2+q3
         8ucIh/aUju0GqL2hgsnanlWpgXERr0OCe63xD8PWOTETXvra81/6pIbFd+4OiM7DHN3E
         2yEmCVJ/s6aD7kefVCfSA31SKdBSi7RSRIC3iHyordPlo4tDA5qj9zVnx9CvSkQVQzs+
         Pr2Td6ju94wpobCVzvr8POKeXsThnAJsWvr8CU5MjF3shXtyj0i1MBB6plnPUd10fvgN
         uOQA==
X-Gm-Message-State: APjAAAX6ZbE7jyf336aSjUv2td8co9CF8KHkhal38Toy4itpfegIWO9v
        Wo1GmzsIaOwn9fOY5KitVzhEfw==
X-Google-Smtp-Source: APXvYqxQxojiBDTKZPusJic1q3Feb7uYrPchzyphP+/xVK/9HREqN30l5NNGO3CqPCl1x/VhD0itdQ==
X-Received: by 2002:a1c:a383:: with SMTP id m125mr34928752wme.57.1567413626783;
        Mon, 02 Sep 2019 01:40:26 -0700 (PDT)
Received: from dell ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id v186sm32753984wmb.5.2019.09.02.01.40.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 01:40:26 -0700 (PDT)
Date:   Mon, 2 Sep 2019 09:40:24 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Alexander Shiyan <shc_work@mail.ru>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] video: backlight: Drop default m for
 {LCD,BACKLIGHT_CLASS_DEVICE}
Message-ID: <20190902084024.GR4804@dell>
References: <20190813115853.30329-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190813115853.30329-1-geert@linux-m68k.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 13 Aug 2019, Geert Uytterhoeven wrote:

> When running "make oldconfig" on a .config where
> CONFIG_BACKLIGHT_LCD_SUPPORT is not set, two new config options
> ("Lowlevel LCD controls" and "Lowlevel Backlight controls") appear, both
> defaulting to "m".
> 
> Drop the "default m", as options should default to disabled, and because
> several driver config options already select LCD_CLASS_DEVICE or
> BACKLIGHT_CLASS_DEVICE when needed.
> 
> Fixes: 8c5dc8d9f19c7992 ("video: backlight: Remove useless BACKLIGHT_LCD_SUPPORT kernel symbol")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/video/backlight/Kconfig | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
