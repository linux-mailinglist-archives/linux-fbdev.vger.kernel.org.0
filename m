Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE871B0FDB
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 Apr 2020 17:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgDTPVU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 Apr 2020 11:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbgDTPVU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 Apr 2020 11:21:20 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEA9C061A41
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Apr 2020 08:21:19 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id h2so11509444wmb.4
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Apr 2020 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=G/xNrmOfxlip1kYuKwMzJ0K+Zw7TpTWKwNC8FLYeOVE=;
        b=scR/lsr/ImzL3Xwqj5p4gcDJy46jbSvEA+k6tsVX8NbGfGf7kL1pwUz5qgUfnMOmK4
         sVlmO/s7PPlbf045xBeI1d/TB9SeihN6OvnYW0eiNx3MGrmW9uumiPeDiX6+6UUpteu1
         XEO/hQIdGxWtJj0d6atjm/Hkys8CjOMLEh0PCdoz2UjdPdUJUdwngqqFLLw1KC68Frxo
         LlY8SA26MGHXf/KuAj7nnNMtCBoaeEKmOSswZoSHWS4TJzKnGh2E1h4tHo5lwsLl9Smg
         ojJk8H0rzWjHcg61LBoGR5ubxZUn+3WUhLcU+JUSZAUK37ej3wOTunBF0T/dEsPJZ+AI
         evkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=G/xNrmOfxlip1kYuKwMzJ0K+Zw7TpTWKwNC8FLYeOVE=;
        b=gHF38LTxMD8rnMg7BEYj3gGyKEsGJIQ1LKWruOXnjZ86Ldnvi8tJk/B/7S77ysVpsy
         4LcSDiqEBsHwt2gc2NkybUK4q6QXfHUYteaoQgPJdA5zVmS+DMwK24NUrGVW3GiXiFD5
         q/9R9DLPA+mE4oVpErSdPdYVSf256EaK+i1BdKoaEVi1/oeVwW9X2veuKJ5fSqCXoO5F
         S3x64Z0QLNOdISMdmp8y9QAptqYBw/lSpx7NUN4Nv9mUe9BdoX5bSoGAwkEedOP+obF7
         DeICe1Vb+QIhrlZWk7b28ehUTJdvyR4wIJLZ6/A2PUqZCymWmA+SusBkV0IgKB23b+U9
         WlHQ==
X-Gm-Message-State: AGi0PuYjkxLPNq2rbr9hdfbSPdiPOyZWSGtDdw0KsNzWBt7yFDBPG2Fq
        5iQ04LuaPq470XXF3WrpRztuIA==
X-Google-Smtp-Source: APiQypK1bWqXkN8H3kmS+x+OEHJtMNHLIBzrzFR184iWS16f3+5krcSMVxzHcjyGzFeVUFyZmgYmzA==
X-Received: by 2002:a1c:96c6:: with SMTP id y189mr19216914wmd.106.1587396076953;
        Mon, 20 Apr 2020 08:21:16 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id e21sm1684652wrc.1.2020.04.20.08.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 08:21:16 -0700 (PDT)
Date:   Mon, 20 Apr 2020 16:21:14 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        lee.jones@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, kgunda@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] backlight: qcom-wled: remove 'wled4_string_cfg' and
 'wled3_string_cfg'
Message-ID: <20200420152114.b7licril3r6itd45@holly.lan>
References: <20200417092335.14163-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200417092335.14163-1-yanaijie@huawei.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Apr 17, 2020 at 05:23:35PM +0800, Jason Yan wrote:
> Fix the following gcc warning:
> 
> drivers/video/backlight/qcom-wled.c:939:34: warning: ‘wled4_string_cfg’
> defined but not used [-Wunused-const-variable=]
>  static const struct wled_var_cfg wled4_string_cfg = {
>                                   ^~~~~~~~~~~~~~~~
> drivers/video/backlight/qcom-wled.c:935:34: warning: ‘wled3_string_cfg’
> defined but not used [-Wunused-const-variable=]
>  static const struct wled_var_cfg wled3_string_cfg = {
>                                   ^~~~~~~~~~~~~~~~
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/qcom-wled.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 3d276b30a78c..df53fbd5cd03 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -932,14 +932,6 @@ static const struct wled_var_cfg wled4_string_i_limit_cfg = {
>  	.size = ARRAY_SIZE(wled4_string_i_limit_values),
>  };
>  
> -static const struct wled_var_cfg wled3_string_cfg = {
> -	.size = 8,
> -};
> -
> -static const struct wled_var_cfg wled4_string_cfg = {
> -	.size = 16,
> -};
> -
>  static u32 wled_values(const struct wled_var_cfg *cfg, u32 idx)
>  {
>  	if (idx >= cfg->size)
> -- 
> 2.21.1
> 
