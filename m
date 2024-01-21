Return-Path: <linux-fbdev+bounces-668-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27876835625
	for <lists+linux-fbdev@lfdr.de>; Sun, 21 Jan 2024 15:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80925B227EA
	for <lists+linux-fbdev@lfdr.de>; Sun, 21 Jan 2024 14:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA52374E9;
	Sun, 21 Jan 2024 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GIGAdFls"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE2C3716C
	for <linux-fbdev@vger.kernel.org>; Sun, 21 Jan 2024 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705847853; cv=none; b=Z4y8+1tEmhh21U6eWl8I9SHSOp22gdXnF0xclBjw6VSQjrf9E00KZcSxy8Cb0ndtMZ8olkw9x0u0/ibhJpA7GK4CfBp4tE/vhTtmCmcOnpoEOgOYRCNeZCqQci4eQuhQ83/nvrGW4McC+G781L2f2XkUp3ejH40yW0/uH7JY9GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705847853; c=relaxed/simple;
	bh=CDApNaplKZ25oamiktN0S+Ji5xLI1g1rccClqr4J0Bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moQDnqDOde8UEnJBQDgoIED3ruV85XUVgFRBmScHxeiRJ3eB/d/7o20eS34fyhMIsY8YK53XG1iZR3MntVl3Qc7YrF0hVtNiCdeNfyBFh4pvZWUbtvlmSr10muz9+9jPbA2LP30gKbKBUEXYsOYyYdg5BPpqqfUl4Y6eoRaeaxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GIGAdFls; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5ffb07bdce2so8411337b3.2
        for <linux-fbdev@vger.kernel.org>; Sun, 21 Jan 2024 06:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705847851; x=1706452651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDApNaplKZ25oamiktN0S+Ji5xLI1g1rccClqr4J0Bg=;
        b=GIGAdFlsQvuNAbSdqWd65BGms10IGTh9g5WzevbH1z/Ywthj76JDxb4eDTCbEI6EyG
         2z4aotFWLNhfVKDjqrQz4CWOB8POqUeMRm/opVsTO38vZZRIVE2U3vPf3Ks48F2z2mPm
         1y4dfHh+/oYtepjQLx/OyYq8TWQGlPvyDz1hTe7LgzpitP+z27QT72oSBYw7Rhgf7rf+
         TtKFnqpHul5icNjgZatJYF0qTKLZCIgC6mLBjPdYBZhe8bugEsHybDnGd/70p+cADoXL
         gPRIu5n/HKSnKDqng0getzO23N9ysHYXdWuj+Znvb8nMO0UUnvTmqBVgzHHQs5donIUF
         PlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705847851; x=1706452651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDApNaplKZ25oamiktN0S+Ji5xLI1g1rccClqr4J0Bg=;
        b=wahCyryC8XHMRdh4pv68K9g9mBpe02bA08ys/tGGEjHUsToHZHW0yBhzG3kNXNHiOQ
         AGyXlJv5KjetnLC/9Hu0RXrj+yAIqbC1mBqHA61HHuz3pcM1ADYR539CfbPdUPt2MIQb
         yniW563oaOo3mOuhBZfnjoj21yyzKVH++MTZoZzqjzoneSlOifuBhtd+j6KeJnvrsd+v
         vVnpoaLCLUFqwcBDeFulVXeXDq+o9WX4C5Losq/Ti6rrGvTeNTY3WKAE5EBM0xCboXhS
         NUN+1DMCZ0msclYCRV6k1YWL5soKdCMjI7VgJSewpEIGCOwaUdxWDa/hGmokl4ypo0t7
         gfCw==
X-Gm-Message-State: AOJu0YxB7YJ21PyduhH9wE24o2qN7FtSIdLmw2FL2sK0YLpxdIEjX53a
	Ic4KLakmko6MGNJhpJ6Q+rn+ATtGroCJqB5G1XgIrIYwczAgaQgx0dzONAQC7QwV79Nie8dLNnF
	wGd+MuwTSm+/NpVOLZtXomHl0i81Ql0IskJKPtw==
X-Google-Smtp-Source: AGHT+IEsDujy+qqr3r2XFC+/gU5C2SO5cQeDz63EZves/xdhXK8OzrJSa1DJzBv9cLts87tjJ1jzxqWX5kxbmIDL1RI=
X-Received: by 2002:a81:7b06:0:b0:5ff:9b70:226c with SMTP id
 w6-20020a817b06000000b005ff9b70226cmr2450527ywc.53.1705847850626; Sun, 21 Jan
 2024 06:37:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr> <20240120-ktd2801-v3-3-fe2cbafffb21@skole.hr>
In-Reply-To: <20240120-ktd2801-v3-3-fe2cbafffb21@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Jan 2024 15:37:19 +0100
Message-ID: <CACRpkdbC0hwAZ47Q-iQUkVB4H+EZFO_nENNB2hRNRWQoNHrECA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] backlight: Add Kinetic KTD2801 backlight support
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Helge Deller <deller@gmx.de>, Karel Balej <balejk@matfyz.cz>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 20, 2024 at 10:27=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovi=
c@skole.hr> wrote:

> KTD2801 is a LED backlight driver IC found in samsung,coreprimevelte.
> The brightness can be set using PWM or the ExpressWire protocol. Add
> support for the KTD2801.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Very slim after abstracting out the library and the library
has the change I requested so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

