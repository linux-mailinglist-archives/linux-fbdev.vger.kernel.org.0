Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52CD01462E9
	for <lists+linux-fbdev@lfdr.de>; Thu, 23 Jan 2020 08:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgAWHxe (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 23 Jan 2020 02:53:34 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54906 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgAWHxe (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 23 Jan 2020 02:53:34 -0500
Received: by mail-wm1-f67.google.com with SMTP id b19so1460714wmj.4
        for <linux-fbdev@vger.kernel.org>; Wed, 22 Jan 2020 23:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=LkS/V988Ti/1GfKcQfeUkMBm9SsC4LVrMiS9Hhq0LuA=;
        b=Jwrbc4bf/9zfn+7g7L6Mdt6K1JnykaDSeM1CbIruN3JXLZdou2iBHVAZn0K2Rywx3u
         j2keMcRx9RG6t90wQAYQ7g3NnKMOQS1GZfR5r/CKi9hJyXJONTeAvnmTI2UuS2IEvrms
         8p6oUdFLySKJewP3QtHK73gAZo6G83s8DHqx1UtZITLksupSHVgqBBvE+ydGJUtAIkTs
         VnHbh3HI7mIXTrfeBLCP3FsDadqwpFP1ndooqP0tZyoOReFQTiRhtsNeXsjEe/TpQAuK
         kRPrsj7rOxZ0t8HxZZaYRVPb7I9V280AEXOARLuvhXUCaOY1IVzf4Aw075bcorF/HbAF
         Yi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=LkS/V988Ti/1GfKcQfeUkMBm9SsC4LVrMiS9Hhq0LuA=;
        b=uUJiVBsSZknazP3Zg06uNqx4PY54ljgnU/mfbONyW5W9AoUmFUZzsMJjIs5jZyjb9d
         mIxHqDmdq7lI4t0zPPngdJtc+U9sL6U2B8qvAF7/5QDO84JOdAdZT9fpuYeAcBHyCePz
         uOuOVhD1QXgdE3i4r3Ed0NTq4C2SEF9V+EJTY3DjAizkF8BGPdTHVdQE7+zCP+Jn8Evv
         9fzggD8696v3q78NvbhqnqpepjRV3XxdtlZzizoTauxHRfzd2oAMRMcCL0VFtkyJncdO
         4d24Oe/kpGy95qyLLeFkB64ViBHyOHINLbRTgw7kpzX09twSRhXKwma7Crf1UKNMJlfD
         tPkA==
X-Gm-Message-State: APjAAAWj6dWFtPb+ekJRVP40g1RHQGHkHjpYbzgE7WtukVnw+UtjRGNE
        lqQoVrxs8/U8sMbQb28pbcoBLA==
X-Google-Smtp-Source: APXvYqzGzPSg/J8qJs1czckc4vtx2G3GfA0fJSoq5iEDFGfxcQef6z7Qhnri8k6z2Zv7KcKTZZf2Gg==
X-Received: by 2002:a7b:cd1a:: with SMTP id f26mr2619310wmj.164.1579766012421;
        Wed, 22 Jan 2020 23:53:32 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id z25sm1749383wmf.14.2020.01.22.23.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 23:53:31 -0800 (PST)
Date:   Thu, 23 Jan 2020 07:53:45 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Chen Zhou <chenzhou10@huawei.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, kgunda@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v2] backlight: qcom-wled: fix unsigned comparison
 to zero
Message-ID: <20200123075345.GO15507@dell>
References: <20200122013240.132861-1-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200122013240.132861-1-chenzhou10@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, 22 Jan 2020, Chen Zhou wrote:

> Fixes coccicheck warning:
> ./drivers/video/backlight/qcom-wled.c:1104:5-15:
> 	WARNING: Unsigned expression compared with zero: string_len > 0
> 
> The unsigned variable string_len is assigned a return value from the call
> to of_property_count_elems_of_size(), which may return negative error code.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> changes in v2:
> - fix commit message description.
> 
> ---
>  drivers/video/backlight/qcom-wled.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
