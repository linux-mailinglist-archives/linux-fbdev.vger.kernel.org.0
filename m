Return-Path: <linux-fbdev+bounces-2650-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838B91DD7E
	for <lists+linux-fbdev@lfdr.de>; Mon,  1 Jul 2024 13:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8499B21EE8
	for <lists+linux-fbdev@lfdr.de>; Mon,  1 Jul 2024 11:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A7E13C679;
	Mon,  1 Jul 2024 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tj/2+Jzt"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9925413AA35
	for <linux-fbdev@vger.kernel.org>; Mon,  1 Jul 2024 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719832029; cv=none; b=n/OXmrLHiCeN1A5gqTXDozGA39SrjjXHylfoKDRI6qLKjZpDa2r/NgiLiTpzf1GNYyCw6/XO7GmBb+BNQvPVtzSv2BD94wLjiR8pDC/Ug3H2q7LYGOE2hNO93a99SjBj6A2Ihlk/HURNut0lSmiPioUwqasY6H02cijE+ZNe3lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719832029; c=relaxed/simple;
	bh=mspCSm1Vdj6ktOD3Y0CZpX7dyAkG6pnZ9CbiAu76viU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubRHKfZrpAyk04K4U0u9KUT9CWaBRV3FIe5npOxR32nC2FgIe+SE/5TI1Qd9e8mbDYqbb5zHnmblMLh7RAkZ0h9DXFDJOAlgTdQR6hdo8Qw4cbTc8bNFJsT9pKc7jpm31QB7U+eWXURhXFO2kQ34iUlHH5HYo8Lgr1xSv+TXCM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tj/2+Jzt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42562fde108so21161615e9.0
        for <linux-fbdev@vger.kernel.org>; Mon, 01 Jul 2024 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719832026; x=1720436826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V41EHoOA8oeYm9MwEGsDwJlgg36OM1Uo8B4nv2YSUdQ=;
        b=tj/2+JztZxaF2CUM+1WplQyZJrroNKXRYmF156H26Yk8isSSJAY4aahO4vQjc5pqyN
         EiH0X1H8XTYjK499DMKYm4OW9Yb9F9kCIGkJd2vJzyvEG77WMeSTJ05XjJmR781v08pt
         P+GsOB5kFbmhU/ZGIIjwB2e+MQ8ak5FVd4bJG5zE4TSiZpL8a7rKRLX8/cAdHja/uE98
         KA8qNrqGM/f4M90zvYe2H1r9ldTjQtYbUHmFA5w2kfc6YuCiSRtU7z9/jvLFWqz2I3FV
         issuzOxTfnZ7AojPn37ODOLGppnne6yTcyqNJpLTR+C5nX1l+V0bYXdv6WXOuOLZdCl3
         4tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719832026; x=1720436826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V41EHoOA8oeYm9MwEGsDwJlgg36OM1Uo8B4nv2YSUdQ=;
        b=c06WmQq0L9N9nXB5ZI/P/Gq2ftamTao3YF3Vjx6TsUdRU5y0sQQ3O8lBlenajZd1dK
         d98bW0n9WnV1b+2ILSeL/5FCqIKPJdc1BPVU/gikynLf41ald29o5ktDmX1c8Ww5sZRo
         NAZFW0PKzIcYxcqwmCrmfKClHMgzjh9pFcntEfM4WsoJ8kI+iksT7IP/cNprETSYVdGr
         2jIVQkSVaWpdWHhWdCkYktiLmI74OnuLxCNL1tfxjbfroltmRZgi27Yx50CA4WvKeJbo
         zw8c96cr8zxex4malQE2fc/ceARRedVpY0Jl6WwaTmBm9aRZpgpAPFdWcy3jc8hyWmJQ
         cBcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAh+rfDbF63tvKSrLAQO7icauV+7rJ2AmxNJwCcWgv+aq4Mcp0bg5KLKVwWTsvSGDVWirGaso8gja6lNvFKE2/kBoTlJl/1vz5Wgg=
X-Gm-Message-State: AOJu0YxT4vZL1mOXUZAF82UXamgllWSoRXDdFamrO9Gwmgdtq7ZbDLeO
	NXaT2ixvwe7waoimsKlYpGyCk6C4IXTkMgEB51A8Woaa7TlAUvRTbwPh0O1muFw=
X-Google-Smtp-Source: AGHT+IFrc5q/iQ835841xqoTCs84v4Tn4y6GVrTE/IwJP2R3sKwPXf4KgBB7h/5TJq9srkNcgP/PCA==
X-Received: by 2002:a05:600c:6a8d:b0:425:77b4:366d with SMTP id 5b1f17b1804b1-4257a02f3f6mr35378515e9.11.1719832025941;
        Mon, 01 Jul 2024 04:07:05 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af5b61bsm149932085e9.17.2024.07.01.04.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 04:07:05 -0700 (PDT)
Date: Mon, 1 Jul 2024 12:07:03 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, sam@ravnborg.org, jingoohan1@gmail.com, deller@gmx.de,
	linus.walleij@linaro.org, f.suligoi@asem.it, ukleinek@kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 00/17] backlight: Introduce power-state constants
Message-ID: <20240701110703.GA15322@aspen.lan>
References: <20240624152033.25016-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624152033.25016-1-tzimmermann@suse.de>

On Mon, Jun 24, 2024 at 05:19:55PM +0200, Thomas Zimmermann wrote:
> The backlight code currently uses fbdev's FB_BLANK_ constants to
> represent power states UNBLANK and POWERDOWN. Introduce dedicated
> backlight constants to remove this dependency on fbdev.
>
> Patch 1 introduces BACKLIGHT_POWER_ON and BACKLIGHT_POWER_OFF, which
> replace constants from fbdev. There's also BACKLIGHT_POWER_REDUCED,
> which is required by a few drivers that appear to use incorrect or
> uncommon blanking semantics.
>
> The rest of the patchset converts backlight drivers. The new
> constants' values are identical to the old ones, so the driver
> conversion can be done one-by-one.
>
> There are many more backlight drivers in other subsystems. These
> can later be converted when the new constants have been merged.
> Once merged, several include statements for <linux/fb.h> can be
> removed (specifically under drivers/platform/x86/).
>
> This patchset is part of a larger effort to implement the backlight
> code without depending on fbdev and ultimatively remove fbdev
> dependencies from the kernel.
>
> v2:
> - rename BL_CORE_ power constants to BACKLIGHT_POWER_ (Sam)
> - fix documentation
>
> Thomas Zimmermann (17):
>   backlight: Add BACKLIGHT_POWER_ constants for power states
>   backlight: aat2870-backlight: Use blacklight power constants
>   backlight: ams369fb06: Use backlight power constants
>   backlight: corgi-lcd: Use backlight power constants
>   backlight: gpio-backlight: Use backlight power constants
>   backlight: ipaq-micro-backlight: Use backlight power constants
>   backlight: journada_bl: Use backlight power constants
>   backlight: kb3886-bl: Use backlight power constants
>   backlight: ktd253-backlight: Use backlight power constants
>   backlight: led-backlight: Use backlight power constants
>   backlight: lm3533-backlight: Use backlight power constants
>   backlight: mp3309c: Use backlight power constants
>   backlight: pandora-backlight: Use backlight power constants
>   backlight: pcf50633-backlight: Use backlight power constants
>   backlight: pwm-backlight: Use backlight power constants
>   backlight: rave-sp-backlight: Use backlight power constants
>   backlight: sky81452-backlight: Use backlight power constants

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

