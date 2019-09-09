Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 687B4AD771
	for <lists+linux-fbdev@lfdr.de>; Mon,  9 Sep 2019 12:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390737AbfIIK7s (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 9 Sep 2019 06:59:48 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38621 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390775AbfIIK7r (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 9 Sep 2019 06:59:47 -0400
Received: by mail-wm1-f65.google.com with SMTP id o184so14098194wme.3
        for <linux-fbdev@vger.kernel.org>; Mon, 09 Sep 2019 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cC4g9BRBEaf08E8q7Ceq+EDE6JFex4JwlziqyOjWmy0=;
        b=PVIe3K3q+MLvV9INLxU2fZYlQCC9Jc1EePTFLZast77owUaVemUSI1wYrcz+h1thcT
         /DU/8gPgn0DHHXvoBNfU9oEobDMKs3QGwxbmVTSpJl6oZaSDoJyZpnsiqcT945v+w/fz
         mJDJtD8l/7MHSRYQppq1Jdi+Z4kY06oBD/kg65+/MCD/YmxvzjTJ7gD/H7xy0vmBXiz1
         FP6c9+wIoz5/qyhzC5+uqESbx88b4zOeFtyaNfkWBrnRvGaoNVd01IgGSmUs93HKYmfU
         xbV7YqOoRdRUq9LLJv9mbAvGCpjbkOfC63THV2N7eFR5xusJYYpO+yQpmy5HKDgAakji
         ORYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cC4g9BRBEaf08E8q7Ceq+EDE6JFex4JwlziqyOjWmy0=;
        b=NMVNYomUN2mYIjYpqFm20sVSnDvOWxh/azfAtcVwr8IKr8DVtcDHX/sAbjCOwYT52W
         DP6ykDMoAln+vAFfJqLE/25UUzRdyYTbrTarOppfl0V3CdYMMOq8F9HpofldAAUxUEUg
         cqSIP5RzqLcoUI+P9JDqgKNvQ5mUfgfkaGE3u7i/1BxDwoHKbe+fcga5DcrBqOcBe2pA
         FlmHOYNm8RVjR7am7PyFRjMsd9fK5m/SRawRW8CGePTZHucdOB10FTgEXlfa3f2OGjjG
         Zx9eu8FR+u38heOY0sbTQIZ/IVBJb5fVgT9GD4o5KjsUjf0kRYj8k4rcW580Zfm3/2tG
         Om3Q==
X-Gm-Message-State: APjAAAWtP2D+YB3yNHaL5dNE9OJUseyniUOhqkwZrzL0uLJi51twBaiF
        DUYiSuiBt4pnaUOsx12LKC5aXw==
X-Google-Smtp-Source: APXvYqzyqfA2w/Lqb9/5hfL+KB+09ziudbSV+CalqKx6i1gQ7KLdpqRoeuy4hGtJtvQV1S9tM22+/Q==
X-Received: by 2002:a05:600c:2105:: with SMTP id u5mr155367wml.150.1568026784923;
        Mon, 09 Sep 2019 03:59:44 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id s3sm10943664wmj.48.2019.09.09.03.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 03:59:44 -0700 (PDT)
Date:   Mon, 9 Sep 2019 11:59:42 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 2/2] dt-bindings: backlight: lm3630a: add enable_gpios
Message-ID: <20190909105942.pxwz6rtjg3cxlcnf@holly.lan>
References: <20190908203704.30147-1-andreas@kemnade.info>
 <20190908203704.30147-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190908203704.30147-3-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sun, Sep 08, 2019 at 10:37:04PM +0200, Andreas Kemnade wrote:
> add enable-gpios to describe HWEN pin
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Looks like patches are in the wrong order. Changes to bindings must
appear in patchsets *before* the Linux implementation of the bindings.


> ---
>  .../devicetree/bindings/leds/backlight/lm3630a-backlight.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> index dc129d9a329e..a9656d72b668 100644
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

Please add enable-gpios to one of the examples.


Daniel.
