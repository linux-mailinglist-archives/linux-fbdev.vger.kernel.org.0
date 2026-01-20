Return-Path: <linux-fbdev+bounces-5843-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFA4D3C3CA
	for <lists+linux-fbdev@lfdr.de>; Tue, 20 Jan 2026 10:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ADAB66662A8
	for <lists+linux-fbdev@lfdr.de>; Tue, 20 Jan 2026 09:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39283BFE29;
	Tue, 20 Jan 2026 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2OB6gJfW"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7E03A0B13
	for <linux-fbdev@vger.kernel.org>; Tue, 20 Jan 2026 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900446; cv=none; b=p0NROzBIQmoPrFodWfczAtGIABBRdyXYcUVhJ1jMadFJrbB9otTybrJ8oF/bCBlNYfRrrAoyQaGy1hUI9wEyEG7hXeIJWXCjK+DnxYH1XztwH+pK4715nBhqorsvdGjB3MMaIKUA3IBzSx9eUkz0V2Ch2kmfSZJduSv6dWzzADc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900446; c=relaxed/simple;
	bh=BOcEU+q35KhvWdmSrrYUMtrvm59wGTaqhvSabE8ehNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dj3UGSr8IoSIJC+m0sdSY83ewepn+ojvy0tcvSEdqGe/Vjdh3UK6W4Yx7tCRnRZEmK+IPHtJKWDMelABejozT9nePsGEzQh8+WblVvsYBQJsR936A9+UEyjUj0Uu4HXkuJgPZqeNnEfju1p0RMqQVs+FVQdN58l7sb+zBo6d03w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2OB6gJfW; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 28FC4C214EA;
	Tue, 20 Jan 2026 09:13:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32C4B606AB;
	Tue, 20 Jan 2026 09:14:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 424DE10B6B32C;
	Tue, 20 Jan 2026 10:13:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768900441; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=AEyibXM1X/4xUK9h1x7As2jj6DIYHxerG8iFPiVejEQ=;
	b=2OB6gJfW18Lv8CNzRs6zVwVr9O1MEQSLLGN1jo3gj4Quv9joeNjU5XWGtmyfCPQXojjdn0
	XGx+RjgH4mV6dhtwCgzFKr3DbxELZspQT/hQhH+ZP4cmqihXEDeE7SYwkNftL6GFZmU1Xx
	D0CPZXhNjtTBrlFlPAOZMX0GTZmGQlDB0ixt/gRdKSbLQ+XKjZQXjXhvBKWqK8brqInHOu
	bz84chp95lT/fn/FAUllRTF9Y1alU+QZooRwXMh7t7mfr+C7s6icnrHwHdF9wkKogaKpHW
	We8IR3JSqhJvCDxifa4J9t1Wpb3zG9g69Bdn/WWQPjmJlXol3xDeR4D6PKWYlg==
Message-ID: <37093fdf-cc26-4bb6-b506-3e959aac8b1e@bootlin.com>
Date: Tue, 20 Jan 2026 10:13:59 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] mfd: cgbc: Add support for backlight
To: petri.karhula@novatron.fi, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20251205-cgbc-backlight-v6-0-e4175b0bf406@novatron.fi>
 <20251205-cgbc-backlight-v6-2-e4175b0bf406@novatron.fi>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20251205-cgbc-backlight-v6-2-e4175b0bf406@novatron.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/5/25 1:19 PM, Petri Karhula via B4 Relay wrote:
> From: Petri Karhula <petri.karhula@novatron.fi>
> 
> The Board Controller has control for display backlight.
> Add backlight cell for the cgbc-backlight driver which
> adds support for backlight brightness control.
> 
Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>

Best Regards,
Thomas

