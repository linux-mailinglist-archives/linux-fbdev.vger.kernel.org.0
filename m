Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBAD01173E
	for <lists+linux-fbdev@lfdr.de>; Thu,  2 May 2019 12:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfEBKeB (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 2 May 2019 06:34:01 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55839 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfEBKeA (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 2 May 2019 06:34:00 -0400
Received: by mail-wm1-f67.google.com with SMTP id y2so1749364wmi.5
        for <linux-fbdev@vger.kernel.org>; Thu, 02 May 2019 03:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B1jC9QCqUfkDL1SR0ZI20RcPCXgiumxHzfhWMgZGV58=;
        b=rEIboDpeVegqAH1F/tFG7zEcQa9Wi0zeu8rbhUOeBPsAIc4OQJBn+WG/7QUMrmfmUZ
         tqffiH3GJY0urQn6b0YplS4e23b5Cij4AydhI4hh/fcwJ1WYkFOg2pZr4Kr1tHFacg5p
         F+jAsKPFwIElXU/V/jA01QDMjSUDKXBD2ZRwrZJUxkdp0Seu8fgHHS2kzzbO1ueT7sk3
         SoUgiKSjn8fgDXXQh8rVWJHgV/JkT/FFrXWM4zUXydfDjrivM8Ukgt05Sv+qchRQNVug
         2VK79JIETEInn/cdFF2dBv7W6JmC+pctP2xa8QOB8zJpKC4WH4cdHwDXkpG2Tc+JZ3my
         N/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B1jC9QCqUfkDL1SR0ZI20RcPCXgiumxHzfhWMgZGV58=;
        b=WBXIO2N0BGQrHF8lZzA/uIPrY/oaDiBUkRNOGKy2hphVCQs0pMnfFtBDuZ82Rhj/eq
         X6w+T/95aoSpElQLRfzptpdv3DS5ZI1TunzBBixZdZrk7mie6t9bszLiMYx/u9UModh3
         YKBmwPrO+cdxG+7AzswXx9HRdu7Slq5W/H2GN2toBmhcoyqEBRGcFTXXJ4TLsR+LS50q
         3TO3p3Pf+dLuGMMVQ5B0QV0i/2WKYolhxHjMJ5Ytph9wEFwLvmHN6ggMqP2uUOFF1Gd3
         rzRD4PmqM/vBKnGF0U05ZjuNyCXhxANPe1yhOttbBZOak/rsGA0afky2XFAMMKpbVZp3
         xppQ==
X-Gm-Message-State: APjAAAXBs3senPJniPlvQAhFLdg0+LfDba+76DBEedocPIyi1EfnQR0U
        fTfo7+YzMTI9Nxfk//c6O9U8AA==
X-Google-Smtp-Source: APXvYqxU8YkY2OjY8+NsbU0iZusUsjbYPnZHso7AF7gBRcCMyf606BDRfv8SzaXmta8W20LOjHsxLw==
X-Received: by 2002:a7b:c745:: with SMTP id w5mr1726394wmk.89.1556793238968;
        Thu, 02 May 2019 03:33:58 -0700 (PDT)
Received: from holly.lan (static-84-9-17-116.vodafonexdsl.co.uk. [84.9.17.116])
        by smtp.googlemail.com with ESMTPSA id u11sm9574210wrg.35.2019.05.02.03.33.57
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 03:33:57 -0700 (PDT)
Subject: Re: [PATCH] backlight: rave-sp: don't touch initial state and
 register with correct device
To:     Lucas Stach <l.stach@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        patchwork-lst@pengutronix.de, kernel@pengutronix.de
References: <20190429152919.27277-1-l.stach@pengutronix.de>
From:   Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <c23ecabd-c2ee-8c23-9ee3-13290bc4da35@linaro.org>
Date:   Thu, 2 May 2019 11:33:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429152919.27277-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 29/04/2019 16:29, Lucas Stach wrote:
> This way the backlight can be referenced through its device node and
> enabling/disabling can be managed through the panel driver.

Is it possible to implement something similar to 
pwm_backlight_initial_power_state() to handle this?

backlight drivers already suffer from too much diversity so I prefer 
things like this to align behaviour with the (fairly heavilyly used) PWM 
driver if possible.


Daniel.


> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/video/backlight/rave-sp-backlight.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/video/backlight/rave-sp-backlight.c b/drivers/video/backlight/rave-sp-backlight.c
> index 462f14a1b19d..d296bfcf4396 100644
> --- a/drivers/video/backlight/rave-sp-backlight.c
> +++ b/drivers/video/backlight/rave-sp-backlight.c
> @@ -48,15 +48,13 @@ static int rave_sp_backlight_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct backlight_device *bd;
>   
> -	bd = devm_backlight_device_register(dev, pdev->name, dev->parent,
> +	bd = devm_backlight_device_register(dev, pdev->name, dev,
>   					    dev_get_drvdata(dev->parent),
>   					    &rave_sp_backlight_ops,
>   					    &rave_sp_backlight_props);
>   	if (IS_ERR(bd))
>   		return PTR_ERR(bd);
>   
> -	backlight_update_status(bd);
> -
>   	return 0;
>   }
>   
> 

