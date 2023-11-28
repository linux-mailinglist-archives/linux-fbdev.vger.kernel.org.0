Return-Path: <linux-fbdev+bounces-254-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18087FC10E
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Nov 2023 19:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD8A41C2095A
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Nov 2023 18:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107F237D0A;
	Tue, 28 Nov 2023 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Thc7w8Ax"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228ADAB
	for <linux-fbdev@vger.kernel.org>; Tue, 28 Nov 2023 10:10:13 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-67a38e506c4so15738676d6.3
        for <linux-fbdev@vger.kernel.org>; Tue, 28 Nov 2023 10:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701195012; x=1701799812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f2GMrLcGcuPvxGptutNWB7kt5k9GOKF04a50so4967s=;
        b=Thc7w8AxMhkvw1AgQt2C6X/i5Fxlz7UPepSBc5NHpyXfhDLfoxuO/MLLXXI0Vl61qt
         gsoxwR1PNM5WFUv1PV3ViisDy65V5Uv889ktHMQu5B0WuwWNYeMa7ehNoXzDPB3B1x6v
         VjuTFtMDzXVVqIxJosMtvgq/CFJ2UjblHTqZJ1FtJLUCZ+TDrHHdoLMM8R8mIlEbykOV
         Va0Evs3OODqMGj8IByH0YLHqHCob3VkfNusz0M7ho3vfDtj/l08lwJy0PJigqRvqhcQS
         3YcmG70SJP0iL25XTZ9wjJBufB5Mv8nfgV/1ux/EiKe/gc/c9FtCZadNnym8OwhgV8fW
         mDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701195012; x=1701799812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2GMrLcGcuPvxGptutNWB7kt5k9GOKF04a50so4967s=;
        b=DiG4WYQNZjKCRQaGLTx1qqdCmi5tN/AdEDkOKes19O2HOb8OZgJpzk5Y7C+qqC0Hx1
         2avzlZn7w6PahPTIP03BUhPZyl4ESltO2smgnNuBXpFky1arbkqatB4hQ1uaeZbCq/BJ
         Qu27QI96OSp6ININEdA/xBNyNml75vbYh8Yvc3SZrkSS2U9NJ7HNbnTUzwAFLdv3H0/f
         9GOoeD9DW9H3KrqPSOTmNTpCMgET1SaQMCXXvmpQPPPI1wJvOWTf24M09RgE9HWCbsiK
         OMV30KDJCkybgz7jyND6YeEe701l0Smi70OdApBRQflIWvnT+pzRi1oRmqmclE6RVJYs
         uU8A==
X-Gm-Message-State: AOJu0YykPER4A6xscqaZnhPjp4xXw34PYGGAQrR7MYwZizY/l/0gqF4O
	hS+B7i1DXJDc4b2OuGMmISL0jQ==
X-Google-Smtp-Source: AGHT+IEcJ1uAsb80kR1B3aJuT1IUjjgas87J8p1OJjPxsDlwIaK05wTXQ3zKeNcgXFK4baOeAFiQ6A==
X-Received: by 2002:a0c:ec4d:0:b0:67a:3efd:d6f6 with SMTP id n13-20020a0cec4d000000b0067a3efdd6f6mr8466084qvq.50.1701195012288;
        Tue, 28 Nov 2023 10:10:12 -0800 (PST)
Received: from aspen.lan ([209.120.180.235])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621421af00b0067a4452d459sm2164807qvc.116.2023.11.28.10.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 10:10:11 -0800 (PST)
Date: Tue, 28 Nov 2023 13:10:07 -0500
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: mp3309c: fix uninitialized local variable
Message-ID: <20231128181007.GA4431@aspen.lan>
References: <20231128150839.2605003-1-f.suligoi@asem.it>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128150839.2605003-1-f.suligoi@asem.it>

On Tue, Nov 28, 2023 at 04:08:39PM +0100, Flavio Suligoi wrote:
> In the function "pm3309c_parse_dt_node", when the dimming analog control
> mode (by I2C messages) is enabled, the local variable "prop_levels" is
> tested without any initialization, as indicated by the following smatch
> warning (thanks to Dan Carpenter for the report):

Good to see credit for the reporter but please use a "Reported-by:" tag
for that. There should probably be a "Fixed:" tag too.


> drivers/video/backlight/mp3309c.c:279 pm3309c_parse_dt_node() error: uninitialized symbol 'prop_levels'.
>
> To avoid any problem in case of undefined behavior, we need to initialize
> it to "NULL".
> For consistency, I also initialize the other similar variable
> "prop_pwms" in the same way.

I don't love redundant initializations... but I can live with it ;-) .


Daniel.

