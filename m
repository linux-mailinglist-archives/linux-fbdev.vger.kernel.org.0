Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADC7AF9FA
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Sep 2019 12:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfIKKI6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 11 Sep 2019 06:08:58 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45856 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbfIKKI5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 11 Sep 2019 06:08:57 -0400
Received: by mail-wr1-f65.google.com with SMTP id l16so23742248wrv.12
        for <linux-fbdev@vger.kernel.org>; Wed, 11 Sep 2019 03:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VDs4QBH4rsd9WApRFewbfBpAla/8JjMokOT6RslkOmM=;
        b=NHM6VwFJgk9JP6K9tIa+qvaxn5+Ogzc7cDz8+F43SM8S6lFWNT0g/1L9XZBSVwaola
         kZatLw3ohMiWvKK1iMWcap3jFwco0hBhy93RhTuCBarNbZP5Zi66A2/LNsXnwDrKyuPO
         cWfXRoIHoq9VEqG/3oP4hGClbNkeNBPXy3Q7YepKlI2br1az4hA5lc1Qjt5yrgzKTsEo
         CA3paIui1sOrvQKRKI8XBt4tGDOfdrw/DWSsAFggd6V/zfcMbx7N1jRIcp/dU2unHVdM
         aDQ0BivD+hvha25GecLASN4k9C8wMNJdyuwmnls6pmJu2H5brulQUp5+CdOPOYcnBFE+
         2lBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VDs4QBH4rsd9WApRFewbfBpAla/8JjMokOT6RslkOmM=;
        b=bCoX+2mD95P/TM7T5d3kYXNkgV19vELy2XyhGnuSF6ulFAbryTq2qJ0m96uxwzx3Z1
         FIdFdKepN5qCLPpY55ue1GOHOif9woZhklUDRcOJkAr2MXd7IpF4GbTHw65tXVvsE8cC
         mi6HG+AktbWkWvE5JflRcVQ7j4lqf8lUrfByH0FsaNmPHhvcebVGNMIkutvvqF4s/wlb
         OgQJmte1nDTmCrICjR34bJPB05saVLGWy1pKC1CGyOQfaOyN7+puirM3pT3+hye2OX2n
         QeBJVo8BpWsv/vMdeX+hP4giqlSQdIcM5CmnLEfAHZWKvRx5pLeKZpdPenqrHEgGCwvA
         5Xeg==
X-Gm-Message-State: APjAAAUMNNa8Uc9m44XYGCnU++l1fv6oRfieUWdRve4HEcxIzuO0IFU4
        fi2T95Uh/N84tx49bpoQnrstCw==
X-Google-Smtp-Source: APXvYqwwO7ms6cDK74/Pkx8Q/GbwMaXoYLDIpo3xME5YnvIM2YoARQAWfaF+MWOS/r+pfR+2cwba4A==
X-Received: by 2002:adf:8444:: with SMTP id 62mr23305991wrf.202.1568196533899;
        Wed, 11 Sep 2019 03:08:53 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id z189sm3551152wmc.25.2019.09.11.03.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 03:08:53 -0700 (PDT)
Date:   Wed, 11 Sep 2019 11:08:51 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
Message-ID: <20190911100851.f4rnldghtmly26oo@holly.lan>
References: <20190910212909.18095-1-andreas@kemnade.info>
 <20190910212909.18095-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910212909.18095-2-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Sep 10, 2019 at 11:29:08PM +0200, Andreas Kemnade wrote:
> add enable-gpios to describe HWEN pin
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
> changes in v2: add example
>  .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> index dc129d9a329e..1fa83feffe16 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> @@ -29,6 +29,10 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  enable-gpios:
> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -92,6 +96,7 @@ examples:
>      i2c {
>          #address-cells = <1>;
>          #size-cells = <0>;
> +        enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
>  
>          led-controller@38 {
>                  compatible = "ti,lm3630a";
> -- 
> 2.20.1
> 
