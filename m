Return-Path: <linux-fbdev+bounces-1093-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8FE8561F2
	for <lists+linux-fbdev@lfdr.de>; Thu, 15 Feb 2024 12:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AE301F26D67
	for <lists+linux-fbdev@lfdr.de>; Thu, 15 Feb 2024 11:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5184C12AAE4;
	Thu, 15 Feb 2024 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kdmfDuII"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D6A12AADB
	for <linux-fbdev@vger.kernel.org>; Thu, 15 Feb 2024 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707997482; cv=none; b=sEEn8EPmMCQcyPXGkGD704DZ8JK+2wKKflCGglkIO+f/omD2X1gaO7x+CAsaRHbHsGCeWwSCFP+bONpywfbxx7FaUFuArYoDAWjrJ7DKv1Li4wla+DI4EBONo+OE+Z/BGqFkT96mmA6vggTj/XGqqU7gQ3s4YU7NPVtHRucclt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707997482; c=relaxed/simple;
	bh=4EXfMA/5RJ5DHbaIGMJZ+ohUmy7XRCcrHj0wk7tuQco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLo8f9LqClM90dukmqgEEUhXJlKedvUtunTGmyTbk/hh5D2FH+LJAVobfw3OZmGusz3scp9zM1sW930B1T1bzbiDthPYQDeltH91ver02JgaAmrMHpFO4bqvavuHspjutSuOv9KDdVM6Qz5PpMM44oyNAHBuTMuIwpUC0FCzP5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kdmfDuII; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5116b540163so1223008e87.1
        for <linux-fbdev@vger.kernel.org>; Thu, 15 Feb 2024 03:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707997478; x=1708602278; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s0Dx5FtY4ggm/AcNbdXVVFP1mItC63qDUNAWfsNzDFY=;
        b=kdmfDuII8ME87+n4zKvi9LNMBGioOXzfzBJV9537N90tvwNiiYQc0H9U1oq8U31XRL
         g/5uDJhj6pzRCtDTUrj+InWjQER1DTuXuLvcwuh5MgliGVhaKsg0ngxa0I2UA/RjarVW
         6emkK1nJyRqlTyHJWzCTEz/7PueX1qQLcpXggsyTIWGM3F8dE9CSyc2FOQJVk486Mc9f
         f8tM6nWeTE8jFGXq4ZdVC5pu80t7KPEIzubel1pMSQbd7pJXbTh1tTU2VppmjjKdXHt8
         wXwpjGm/V9HcKWrLll9EUMWtJXsserjfVBSCkEQ4A9rARfNzPU0upGvsBwQktm9lbjjq
         Y4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707997478; x=1708602278;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0Dx5FtY4ggm/AcNbdXVVFP1mItC63qDUNAWfsNzDFY=;
        b=jW0fPN/8+EhGjHfPMW6yBLuB1y/FFm/dI2nTXOxJTyFNcOFNvhOy3oWyfoAXztpLmO
         Tp4cIEcM99fUB8DxnpAHhk5DiaaEHkz2VMHiWcBYtotafQdwFpszXDEWUfQcnqtl2Gs7
         BrsPlQ22yLaWnP6bCnWoDBewopMhVBSIBjBQ7uVbT/GnfOgKgaDHRIjbMlasHroK+i6M
         a0qrDVEhd00h4Mcwx+ERldRpoEdw9HgalDGutkExtQRnc9m7wjAgInlKWBXy6OgCVX0Z
         hc/OG51oSs8PX9KEZPIP9sW33aKXp9RMrK82B0i7f0qCW5FrvpRccYij1jBABKzEoM8/
         wmHg==
X-Forwarded-Encrypted: i=1; AJvYcCUc5dEOv8OKpaxK0l/1Hgg3GRoTA1UkNYn5b4bqB1qn21KLwk/99VuTgztizqRJ+h3p/uHaXnjccu73Mpi7eU3m92AXS5xZG4XkDmA=
X-Gm-Message-State: AOJu0YyOsnoeWldImnzcW80ip4H/oLTyeS2Oma2r/yNYeGt3Mwl+CuQC
	EQ2PycylwSijIyobxOPHffpA1XIwHkq7w66cPkbD2y2Dds43mYx5fsoow3DQ4rk=
X-Google-Smtp-Source: AGHT+IEu0C6G66d14pfWgMYK2wzM1oPNS0d7EodOMsfiSkKWIbZuEl20a097XvjUuM1uqVFibSZSPQ==
X-Received: by 2002:ac2:58d5:0:b0:511:69bf:d1b0 with SMTP id u21-20020ac258d5000000b0051169bfd1b0mr1243154lfo.51.1707997478365;
        Thu, 15 Feb 2024 03:44:38 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id c8-20020a7bc848000000b00410794ddfc6sm4787174wml.35.2024.02.15.03.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 03:44:38 -0800 (PST)
Date: Thu, 15 Feb 2024 11:44:36 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>, Karel Balej <balejk@matfyz.cz>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: ktd2801: depend on GPIOLIB
Message-ID: <20240215114436.GC9758@aspen.lan>
References: <20240213-ktd2801-deps-v1-1-7feb5385eb9a@skole.hr>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213-ktd2801-deps-v1-1-7feb5385eb9a@skole.hr>

On Tue, Feb 13, 2024 at 07:12:33PM +0100, Duje Mihanović wrote:
> LEDS_EXPRESSWIRE depends on GPIOLIB, and so must anything selecting it:
>
> WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
>   Depends on [n]: NEW_LEDS [=y] && GPIOLIB [=n]
>   Selected by [m]:
>   - BACKLIGHT_KTD2801 [=m] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=m]
>
> Fixes: 66c76c1cd984 ("backlight: Add Kinetic KTD2801 backlight support")
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

