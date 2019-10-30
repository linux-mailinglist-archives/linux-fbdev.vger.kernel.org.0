Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8ECBE9760
	for <lists+linux-fbdev@lfdr.de>; Wed, 30 Oct 2019 08:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbfJ3Huv (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 30 Oct 2019 03:50:51 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39743 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfJ3Huv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 30 Oct 2019 03:50:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id a11so1113450wra.6
        for <linux-fbdev@vger.kernel.org>; Wed, 30 Oct 2019 00:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=FLPIpnHOBePg/Y6da8w9/WRUoNiVkxQNWcq2DQOe07M=;
        b=XyPVZBz2kVqf6z+1cIyhTkCY9EFXOZzeQZGpHure5f5izzCxjf1ZVQ6kVBYmm9H1+U
         d/t30k/IvFZWYAj66fXjRzzv6d+hZ/7mVXinYxHIyoMrDgHZnV8vHynTWW4njmDFj9a6
         vEs84X07ky4e9x3e9KtjF1LWqsIFnWK6+82TOscZunOTqiGZeOYVRsNxts9VjEQKa+lt
         FhdpBJnumN6gY9IAN4yvMFF80r4RX3gQFjM1jg9NhL2pXmvBoC3b9DJa8zBtK6RPIeAl
         DqxNx0LhriVy4PCV06zjT9oR0h6QR3/Rd7c6ScnJbVfmiu0iLZnoBeXTiIVq1McqfwwE
         Y6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=FLPIpnHOBePg/Y6da8w9/WRUoNiVkxQNWcq2DQOe07M=;
        b=b5wHuBAELlTcIW015Px6HyMszANrn0vBFj2z/PUfWKSNO/cJE6K1AhZ1KvMPAvnlj0
         hyOILzOvBzLn+RKYaUeX4akU0KXeWJs39NG1v67NQe+SfYzdiXlidMMkOx9vjGODYNYD
         WE2Rkoc2dMLdUMGw/FOINQ9eDys0fi2puAisb+wC2QpseuA2qcittyWux5yEtyKkRGP4
         wSNq21kBSPvuIyQCxx811LbKXzfkZLaXFhlXEiFImfOdHtlySODMJ7xzY8Bo9dcI90zk
         grng5IbKFPv/0awcL6Rss2nOE3aQMY7KPUb1II45ViGZdVY7JvGw74pVy9c7eGOTxieG
         1Szw==
X-Gm-Message-State: APjAAAXLiR6OX9i2HCpj5JefWwq6LMYR4vfoHhmQ3BYBhz02c1NAqrei
        wDxlCu7SF+SbYYBPXRcAqbWjFQ==
X-Google-Smtp-Source: APXvYqxqLawwSBkqOwElIXw0EitJZw7c5fIQELur6Ziwo9Eowbi50RtGdHxZjDIulp8GE33dkMbA8A==
X-Received: by 2002:a5d:4808:: with SMTP id l8mr22968551wrq.118.1572421849544;
        Wed, 30 Oct 2019 00:50:49 -0700 (PDT)
Received: from dell ([2.31.163.64])
        by smtp.gmail.com with ESMTPSA id r19sm1929303wrr.47.2019.10.30.00.50.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Oct 2019 00:50:49 -0700 (PDT)
Date:   Wed, 30 Oct 2019 07:50:47 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH next] dt-bindings: backlight: lm3630a: fix missing include
Message-ID: <20191030075047.GC4484@dell>
References: <20191029185350.31155-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029185350.31155-1-andreas@kemnade.info>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 29 Oct 2019, Andreas Kemnade wrote:

> example failed to compile due to undefined GPIO_ACTIVE_HIGH
> fix that by adding the needed #include to the exammple
> 
> Fixes: ae92365cdd75 ("dt-bindings: backlight: lm3630a: Add enable-gpios to describe HWEN pin")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../devicetree/bindings/leds/backlight/lm3630a-backlight.yaml    | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
