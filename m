Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22D7169CAE4
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 Feb 2023 13:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbjBTM0o (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 Feb 2023 07:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232078AbjBTM0j (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 Feb 2023 07:26:39 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B4E1C30E
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Feb 2023 04:25:53 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id j2-20020a05600c1c0200b003e1e754657aso923865wms.2
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Feb 2023 04:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhuNX7zk4hZihBAY5sZG0csyVV6AYylCGdugAnsAC6c=;
        b=bPba3qLwuP3pL5YFqhCwvExtNWIznWHdFR4XAXSWPf0VlwLp3X4gk+vhiYZBF3OCJB
         +4ozenOOlX3dJ/BMfSl1I7nbv+4Wwr8BGYHqFrEq6/zebScqZhGU7To/OG33/EIlPRT7
         M+9e/UeO0I0d2UIeOy+DsB19ih2wSBOe8cRr0z1lTPt5VdBO5JdBzoebAvZnImBSg23A
         yK4OMN0MfJlj0WW4lStMk5mkiowmWQnxJ7CXOZT7yMuChSPRjKzssAqWKgPqqP6loVUg
         zuJEUUlNrRfJDRKiIE8sEXk2EDL6lrTw+gRTiWg1S6zzPItFUW1sJ/tohDunfoSjrsL8
         biaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhuNX7zk4hZihBAY5sZG0csyVV6AYylCGdugAnsAC6c=;
        b=s93D3ZZB593zBQNlQZVT7wj/xu5L/EDn6dSYSwefOYXFplP18Ftj+PtmFF5hz3EoF6
         68FWBkMJ6ZoFdWGq2B4MFnTU/LXXlk0/uXCtYR2xlBcZXV0aT+uj/iqL24JxJHFJjA7n
         +zrS29wbu9A3tAFdTvqLFR/B6ymLhAvsP7cFrGAJJSWsNrsZN51AlNe+pzAE2F1IngDg
         f4UvSRztOiDoAO/rxn9gCi5iKkxqIttKY7cW/xinmJ4Oc+dN+fTqX+fCDixYFHXa8Mc/
         FxvXbVF0iuxCQvv1Cx7z93epP6LanwCiKxWuO1v0QjpLzkFki+SZ1oKvn6+zSNYSYGpv
         Q8fw==
X-Gm-Message-State: AO0yUKW3FNLoFmbkw8BWQZmzyLDSJrGXIlEyjsTlCG3g6RGdZbpcH37i
        IL39sK7GO+16ZYYF6p7WrLH4Zw==
X-Google-Smtp-Source: AK7set8fM14qE0F61S6lht5sfkP3yhezdAmuiQBgst8exmUIwWFYJljR5sQgrg0d08gSACnwp/jIVA==
X-Received: by 2002:a05:600c:1d9c:b0:3df:9858:c032 with SMTP id p28-20020a05600c1d9c00b003df9858c032mr716208wms.7.1676895945499;
        Mon, 20 Feb 2023 04:25:45 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id e16-20020adfe390000000b002c54c8e70b1sm1542169wrm.9.2023.02.20.04.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 04:25:44 -0800 (PST)
Date:   Mon, 20 Feb 2023 12:25:42 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: qcom-wled: Add PMI8950 compatible
Message-ID: <Y/NmxjZgo9V6Enad@aspen.lan>
References: <20221226-msm8953-6-2-wled-v1-1-e318d4c71d05@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221226-msm8953-6-2-wled-v1-1-e318d4c71d05@z3ntu.xyz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Feb 06, 2023 at 08:58:30PM +0100, Luca Weiss wrote:
> PMI8950 contains WLED of version 4. Add support for it to the driver.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> While adding dt-bindings and dts in a previous series I forgot to add the
> compatible to the driver. Fix that now.
> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 527210e85795..5f504883aca5 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1731,6 +1731,7 @@ static int wled_remove(struct platform_device *pdev)
>
>  static const struct of_device_id wled_match_table[] = {
>  	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
> +	{ .compatible = "qcom,pmi8950-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },
>
> ---
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> change-id: 20221226-msm8953-6-2-wled-5f966bfa4db3
>
> Best regards,
> --
> Luca Weiss <luca@z3ntu.xyz>
>
