Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6700CF709F
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 Nov 2019 10:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfKKJZx (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 11 Nov 2019 04:25:53 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55317 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbfKKJZx (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 11 Nov 2019 04:25:53 -0500
Received: by mail-wm1-f65.google.com with SMTP id b11so12442542wmb.5
        for <linux-fbdev@vger.kernel.org>; Mon, 11 Nov 2019 01:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=OhCha09COfgKPtZLiOdmeCfAFANdSRBnfQoI436vAFc=;
        b=kZPZiQyy9gd/WCmfdT0wc6TN4JLHAvMXmaxLilUQegA2YhfTRSZrmqW7TKLSuPyMDn
         +x8tdXkQ7PW4Br2k0sinujFdrQ7SCrG+PpDq/RZ542MrG9L57mfRQnYkxFm0lbRJ30VI
         uFRc/EUwu7WA2upRC0lelKTE0WBo2EFku5QrFMhqrmseZP5tpMzx71G7sBUu/Tuep6fL
         XLjOFAKVzoLmN+LRE6grlpQ68CMD7HFDTvnFkdZsoY2GQE1KHAzDacRGr3QY2x1ALXNm
         tJH6MLLOlVJgyyU+bOjZ4u35qcxklOqbZnAyB4jRfJdcQJVleJPk6/IahsD0Mt7FdA23
         u+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=OhCha09COfgKPtZLiOdmeCfAFANdSRBnfQoI436vAFc=;
        b=euLgz6vfR/apHwaHVruL00HYHmsLtryx0dE2CQWBOkfM7pSGRinUs8rUzre/tOk8Sf
         wVe48VkmrkDzdQKOEqq0oAjdfTinCsKAzW2wWIyddXciXbB9tkNBRkB93tMmMIjQ4sOo
         DvZGmBHyx/pWcnTepOVJyoNs4waeHRbvBuXAUpbI49SVve1lxGVf4Ii6tQeRBxN5uysn
         /C147nY5bwt6PI1XFCXoqp6gsjAgQGKB/O6DO3SyJzEi7JVV1ynEiiEI5evIdJeJeoDl
         7wyd3TeSi9enddMfYUXcVNOr/S19kBU4jpUPdV9TSfY/Yfp47MOETPd/muCJ3nMLb9U/
         3XQA==
X-Gm-Message-State: APjAAAVyjeDfSgqUpEQNQ6p/WQ3pwz0sbtwcKFRyCOGzE4nEXEemyfUB
        6aCFqmGVZb2AkP1awE6Cf3j4Yl4vQsA=
X-Google-Smtp-Source: APXvYqx9qAByoszcpaFD12J1nUjhRfEepvndPETih1nX2g0RiujoIcYX0NEsOgXnWOvGeTz1TgEM2w==
X-Received: by 2002:a1c:6146:: with SMTP id v67mr19985324wmb.102.1573464351581;
        Mon, 11 Nov 2019 01:25:51 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id a5sm15368078wrv.56.2019.11.11.01.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:25:51 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:25:43 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V10 8/8] backlight: qcom-wled: Add auto string detection
 logic
Message-ID: <20191111092543.GV18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-9-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1572589624-6095-9-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 01 Nov 2019, Kiran Gunda wrote:

> The auto string detection algorithm checks if the current WLED
> sink configuration is valid. It tries enabling every sink and
> checks if the OVP fault is observed. Based on this information
> it detects and enables the valid sink configuration.
> Auto calibration will be triggered when the OVP fault interrupts
> are seen frequently thereby it tries to fix the sink configuration.
> 
> The auto-detection also kicks in when the connected LED string
> of the display-backlight malfunctions (because of damage) and
> requires the damaged string to be turned off to prevent the
> complete panel and/or board from being damaged.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 400 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 394 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
