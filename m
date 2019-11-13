Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFABFAFBC
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Nov 2019 12:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbfKMLcU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 13 Nov 2019 06:32:20 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:43004 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727726AbfKMLcU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 13 Nov 2019 06:32:20 -0500
Received: by mail-wr1-f51.google.com with SMTP id a15so1933581wrf.9
        for <linux-fbdev@vger.kernel.org>; Wed, 13 Nov 2019 03:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=sS3GaEsmYVTT8e7e9aE8xCn5QY0c0oDK5wXddhigAzo=;
        b=CYO8M14unOarpyCMrij5/QgQvuSQhghb6lNIxYwEhmTJDfQAfPVC9+D7zTsLxANKmS
         XOhtiJRx+PgD9O/gBnG++DQiXFXLxHrROmodJu9nwj/KRsEGGR/sftjKT7S2uSI+5VLl
         yZe9beW3UNVHVWEbNmNwB8mDKLDxLgYDXytky5cZjStLFR3FjqTa61F3vDNXnNvvHzYe
         76Mtd4Rb98ulGoJENiFUg2nXaB9MM4MH+IALrHn9VUFjNIr1cubho30W9ayKiPYXDCGo
         CssQBKMiFAx8N4DrCpDWlqKhpuZNe4KLEWF3QmcEx3zZjaQK6pN0pOBJYFnXcN7QiGiW
         QAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=sS3GaEsmYVTT8e7e9aE8xCn5QY0c0oDK5wXddhigAzo=;
        b=eed3LOkCYOxsO7wCFNizk+UiQhrV4dRldfWkyOJXd1r++6HyEtOB7/utdgBpDHHrf/
         nCikV1hFGrsH0i2N91kg+4RBUTgdtAVs0LyPGm5UxriAeFSulrNpU50NuBa9lULbE2Z2
         IKtn2RJpjHb1NUadz2wMBwagssDa2scVCmXpwBrgI8bISidOsm7A8Hic4nXBzwU3cQ4P
         wyMosekTfS8eTVmXeK+xZa5Bl+iLXO7Dy49O4WGKLfEI12dOgXYR0DlPwJz13exnse3Y
         cCtfKmuJeA2Ce8RRi8i2wE6veMrTmE7csNxXt4xgIok1K8XXWi2I11gLCcUkF3UBZ9Xm
         p9hQ==
X-Gm-Message-State: APjAAAX/jFZy909KQt/vrmEICoynucED7MBdy2YDG57mR4Q9rgV7+ZGa
        vLhokY4WKyOt771iJ3Ivw8Vfjw==
X-Google-Smtp-Source: APXvYqznHxf9lTwtcWainnqvBciljEaqd825jlA+LPO+60naLZWLA4kld7qN7etRMPJUI7I//NyhTw==
X-Received: by 2002:adf:e94e:: with SMTP id m14mr2414909wrn.233.1573644738184;
        Wed, 13 Nov 2019 03:32:18 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id o10sm2519246wrq.92.2019.11.13.03.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 03:32:17 -0800 (PST)
Date:   Wed, 13 Nov 2019 11:32:06 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] backlight: qcom-wled: fix spelling mistake
 "trigged" -> "triggered"
Message-ID: <20191113113206.GB3285@dell>
References: <20191112093025.98638-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191112093025.98638-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 12 Nov 2019, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/video/backlight/qcom-wled.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
