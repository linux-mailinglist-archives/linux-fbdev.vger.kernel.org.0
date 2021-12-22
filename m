Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102E547D0C9
	for <lists+linux-fbdev@lfdr.de>; Wed, 22 Dec 2021 12:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244561AbhLVLR6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 22 Dec 2021 06:17:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244545AbhLVLR5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 22 Dec 2021 06:17:57 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD828C061746
        for <linux-fbdev@vger.kernel.org>; Wed, 22 Dec 2021 03:17:56 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id i22so4108958wrb.13
        for <linux-fbdev@vger.kernel.org>; Wed, 22 Dec 2021 03:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Q7HippQlas3qDOGNhPQSLv1qwUHwbA/DJgC1NDChOnw=;
        b=vzGFBuqKFULvj/9Vt4j7lk13/7xw5IjDQ7PZx9aME4tOwVzVX2E5/uTbcWKAYNDST8
         uo/DLkFnqLOXP6vIxq9DNP56NICKdr8RJZI1agmfTu6d0utV67zAG3+7hQAL0TYRx5HH
         b9rh/cVTJXbqWW1f+bl/r9PAc8ARpDtumKv1suaesob04lgEZFg32Lgemy9QNwcBvUbR
         L+PUK2ZjlkDXLIUcSUuiI+3i/0OZTWB02QRcq+QY+NW03/W6TJ1rGLrtebVG+mUkIVxv
         7IUaJ+B2hJIltuhKx2+oiOPz6QdXGgNsVTWqW0ILPI4Lti9fOdcEY80ZBncoL3cMHE1J
         OZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Q7HippQlas3qDOGNhPQSLv1qwUHwbA/DJgC1NDChOnw=;
        b=xSSNF1WP+rv8LUyaZPpupRBVybk2TAGPrIBPv0+EIEeDLNV+yqxV1MJRzIStJyMxmz
         PHNWHNdwTFCwC1xoVY4hEMVMG86aaPuwInaoyCeeGQPNfokEs77iRphL66/RwNNs5M7W
         YulnbFTNy4qcVD9rKwBLHz4OtEDclValbvnW39XIC8qE/mmrQ/0alxXrxwlc8cU4IyNf
         dy7bD3KjZFDqkwNdxtCLJHOOVeJhE9T6AyHD64pofJkZhzvNnCPOAhHhp9PKMBgkAop/
         iV1YViDEuoQz71etc1FkL7B4m/w9DkwNUAFps9WHf6gQrhcrQf8L68Og7hID0+vGfEp9
         zfqg==
X-Gm-Message-State: AOAM5307qjSMTOoqmUsvD4VKfBo46TCrOrk58jQR45hCGUa2J7cqB+D8
        deH6W3WarNiEZOKO8iojtlrOPQ==
X-Google-Smtp-Source: ABdhPJxDiz09y/oHQhq0LvU7qN+3clsuh9GlfdjRUwswgcYZ+3rK2G7Y2z9kq/CqU8sP0QX92Sc3Rg==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr1765868wrt.117.1640171875381;
        Wed, 22 Dec 2021 03:17:55 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id b10sm1634803wrg.19.2021.12.22.03.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 03:17:54 -0800 (PST)
Date:   Wed, 22 Dec 2021 11:17:52 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 6/9] backlight: qcom-wled: Remove unnecessary 4th
 default string in WLED3
Message-ID: <YcMJYD3fM4R1MPZo@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-7-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-7-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> The previous commit improves num_strings parsing to not go over the
> maximum of 3 strings for WLED3 anymore.  Likewise this default index for
> a hypothetical 4th string is invalid and could access registers that are
> not mapped to the desired purpose.
> Removing this value gets rid of undesired confusion and avoids the
> possibility of accessing registers at this offset even if the 4th array
> element is used by accident.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
