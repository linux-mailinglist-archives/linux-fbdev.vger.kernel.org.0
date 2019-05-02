Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE44116E0
	for <lists+linux-fbdev@lfdr.de>; Thu,  2 May 2019 12:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfEBKHz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 2 May 2019 06:07:55 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38651 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfEBKHy (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 2 May 2019 06:07:54 -0400
Received: by mail-wr1-f67.google.com with SMTP id k16so2497352wrn.5
        for <linux-fbdev@vger.kernel.org>; Thu, 02 May 2019 03:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ln8lwyZu4d/pYnNZvNPmH5kvFZK/dwi+Vdw+/DDqqUM=;
        b=SjF5Jc829R673WB+uMlg9Gl5Kqt2vyeeJMJN6YGyamTtIwyOVO6IFzWM4hxrLbiiaU
         HWU5wXARUjWgTD6Mp0hN5OOGjzWJ7Cb9+BsPQsZSzKg59KQAehyH5sGvnnufdtHKHoqe
         4/H7avUgSyUolKRLZ1aGByHldQSrQYqpDU5hmbu57Vb8oP7ZBY//cpsldNrd+ru+y6gT
         DBD31XtjGaoeHMjwgHNaJFz1bBLhWk0I7UwPfKkeSXTUxXi41t7OPdenwX/GlUgdbxF/
         n9feAgCpyWmfwV9UMZFZ36sBpGV9V8//grybcYgOOene6239oM4lbuhfzND4hLgyw/J2
         93rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ln8lwyZu4d/pYnNZvNPmH5kvFZK/dwi+Vdw+/DDqqUM=;
        b=mKxk7z1YkAP2U7o0AwxXKersil8esY+psagAW486PnKfY+oDoL3XsK3PByzH3jHyHZ
         5vyiCFoW/O0fAD+1JUXqiYbcRZksfGj8ZfnA0ZBfU1gF0AR7BWqDWPcproU27ZYtfSar
         Sw3Y8Do2ulG1yFPqdjaHGfDVPDBVIHnn0/eDJpD4tq0foQ9UvCRjBRhrGknm+PDaN5Fw
         dP11TJprT31Dy3HIKShbTV9Taey+uTa3Y0Qq+FW3JNR9Mr6a/bi38XRZ2MfE7IkBwgTi
         pJVTt/1uM1i24n0OFpr+vFdfeKixRVdR4cd6oPIzzWj2HAyipSnV7tpcex64xloFpNkB
         vOyA==
X-Gm-Message-State: APjAAAXmESe+O9C6e6Zivbpta6sQyJR/U21t2wrco2EdPraWSbHJ9I3q
        dxfpWb3lnA8CBwbxWfsIiBZU+w==
X-Google-Smtp-Source: APXvYqxCUpDRSYjyDsro/neuM3zU2yetyNE7BWDvtaVkr0uL7P4Jw8IIuS/ufxGiG+KidXro3bPrPQ==
X-Received: by 2002:adf:dd86:: with SMTP id x6mr2038651wrl.308.1556791673662;
        Thu, 02 May 2019 03:07:53 -0700 (PDT)
Received: from holly.lan (static-84-9-17-116.vodafonexdsl.co.uk. [84.9.17.116])
        by smtp.googlemail.com with ESMTPSA id f1sm11063325wrc.93.2019.05.02.03.07.52
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 03:07:52 -0700 (PDT)
Subject: Re: [PATCH v6 1/3] backlight: lm3630a: return 0 on success in
 update_status functions
To:     Brian Masney <masneyb@onstation.org>, lee.jones@linaro.org,
        jingoohan1@gmail.com, robh+dt@kernel.org
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dmurphy@ti.com, jonathan@marek.ca,
        Daniel Thompson <daniel@redfelineninja.org.uk>
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-2-masneyb@onstation.org>
From:   Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <864c1ddc-1008-0041-1559-e491ca0186ef@linaro.org>
Date:   Thu, 2 May 2019 11:07:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424092505.6578-2-masneyb@onstation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 24/04/2019 10:25, Brian Masney wrote:
> lm3630a_bank_a_update_status() and lm3630a_bank_b_update_status()
> both return the brightness value if the brightness was successfully
> updated. Writing to these attributes via sysfs would cause a 'Bad
> address' error to be returned. These functions should return 0 on
> success, so let's change it to correct that error.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Fixes: 28e64a68a2ef ("backlight: lm3630: apply chip revision")
> Acked-by: Pavel Machek <pavel@ucw.cz>

Hi Brian, sorry for the delay. For some reason your mails are being 
dumped before they reach me so I only discovered these patches when I 
paid proper attention to the replies and fetched them from patchwork.

Hi Lee, is the same thing happening for you? ;-)

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> No changes since v2 when this patch was originally introduced.
> 
>   drivers/video/backlight/lm3630a_bl.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index 2030a6b77a09..ef2553f452ca 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -201,7 +201,7 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
>   				      LM3630A_LEDA_ENABLE, LM3630A_LEDA_ENABLE);
>   	if (ret < 0)
>   		goto out_i2c_err;
> -	return bl->props.brightness;
> +	return 0;
>   
>   out_i2c_err:
>   	dev_err(pchip->dev, "i2c failed to access\n");
> @@ -278,7 +278,7 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
>   				      LM3630A_LEDB_ENABLE, LM3630A_LEDB_ENABLE);
>   	if (ret < 0)
>   		goto out_i2c_err;
> -	return bl->props.brightness;
> +	return 0;
>   
>   out_i2c_err:
>   	dev_err(pchip->dev, "i2c failed to access REG_CTRL\n");
> 

