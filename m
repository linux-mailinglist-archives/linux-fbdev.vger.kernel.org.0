Return-Path: <linux-fbdev+bounces-1995-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 856A08A50AE
	for <lists+linux-fbdev@lfdr.de>; Mon, 15 Apr 2024 15:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B715A1C20BEA
	for <lists+linux-fbdev@lfdr.de>; Mon, 15 Apr 2024 13:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F195B83CD1;
	Mon, 15 Apr 2024 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7nr8UoE"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7994883CC8
	for <linux-fbdev@vger.kernel.org>; Mon, 15 Apr 2024 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185692; cv=none; b=JgOimOhc+wXt/a4EH8TUdG5RT2Xr0Ezw6C+SCd2qlYQt30d8emFmy4KC5nf9xsgIUO5TStTZUqlomiYWgxw4UCdfRyjrtc78SlvTL5ABSmzd0sprOYMbYedOKv0wKXqbX2SSl3NSF/i9DuFAz26Nd1fMpYH0ejkIeVAyQx/wcEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185692; c=relaxed/simple;
	bh=59f281dHkUN3AP2oLzzLuo3JgEJxzPeKM9+dan+z5jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oICoSoCOS8VtsNxA7OulDi5VBewRXXGtqblCVs91y/rGl2iJHBWkMLZHdXzJ3uKTNOPrfT+OGSJz2rSjrqWIahBey5Rs+UJ0B+Jq1H0zsoiFXDlBTFYxVdWDXvLeRva9oxi1x8vabvxj/BZLzaNjBsXafDenxzw5dbNhQcbrGsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X7nr8UoE; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d8b2389e73so35256871fa.3
        for <linux-fbdev@vger.kernel.org>; Mon, 15 Apr 2024 05:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185690; x=1713790490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=59f281dHkUN3AP2oLzzLuo3JgEJxzPeKM9+dan+z5jg=;
        b=X7nr8UoEfEg3Qg4YFYijfa51ZKZyUZOAjv94DkMctu8hYaeaweV7/Lv5gNgSV/p16t
         0pNFvWxvNoXnmrhouw+FXs9M7vmvSxLxagt9OED/OWJ20Gp1LoRIASHC/9ytLNVbgGgI
         7B1JW8Zt37oUwt0dvo0DL8rHisVVIuYCX4lMgsvr64URauVYUGDGWdwYsKm1RF+ZPVuv
         W4OWBXImeYPeYb7MGhBMcxyuQ7x6zeS/zbxriMyra9Vj0aeJIHv9xy+dlVv4IMUosBkA
         5ozpTGuwPzqeF59NNLzdWnMFu970nrX69FndoCgOm7irJnOcbc9KQZ9PizCt0HRM3C8X
         yGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185690; x=1713790490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59f281dHkUN3AP2oLzzLuo3JgEJxzPeKM9+dan+z5jg=;
        b=Ax7ao+Am+zeli3O3oXj0ndUwjn2PPFqLLBNIRklV4aEDMKyaFvgJIvd6V5a9QJtybO
         2AoDTOpXx1LqFwXNfRQDADAGJ6aEgSseX/5Tdv5jIXhnDvDMsnz9D+jm7vthLQPdW9X9
         EqRll04udWryw8ZKLkurtHHHk1sydAdHfhfODUwGXTFap6LtfblCeCPnhXu7GmHCAAF6
         /0rB37UfsHppravqSxXGJfFxrGynx3ANZ3aZ23D1U4TGgyJ0FoQyZjdRl4rnhVcE+Aqq
         0Kpdmbw1mZdsZLHt2kqCTBgP9tA8VBr8k8ejCtKoHPx1vBrxzWaYozeeZnnmMCWqQh15
         82zw==
X-Forwarded-Encrypted: i=1; AJvYcCWNCQRJod7UIhQcTT6+g5A4dS98o6R0USdQW8XhIchsNh0rgaP/LK3gk3Xb7V5AhKeqzCl984fZNRGwIw9eeJeK7S1yYLjg+k6vLAk=
X-Gm-Message-State: AOJu0YxFx10vRoiztI95zV0p9jJeVyvLHB5hC1MwdZBqjRhzLSWxUH7w
	n14TWlbXXBCucLJiieJtAuBPrDQ63Qi9dVl3zcEoLFmDcxBTtEiHrJHNwGaVrIs=
X-Google-Smtp-Source: AGHT+IFrtoNRAy8uJsV4JsI0aS0ZrMcXBvUk3IjrcXoc1WAmiqGm9I5p36WylWsaC96BOzcw3ftNXA==
X-Received: by 2002:a2e:97c5:0:b0:2d8:abb1:b311 with SMTP id m5-20020a2e97c5000000b002d8abb1b311mr5397736ljj.44.1713185689650;
        Mon, 15 Apr 2024 05:54:49 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c19c600b004187ccbca8dsm941622wmq.42.2024.04.15.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:54:49 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:54:47 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 12/18] backlight: otm3225a: Constify lcd_ops
Message-ID: <20240415125447.GL222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-12-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-12-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:10PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

