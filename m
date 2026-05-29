Return-Path: <linux-fbdev+bounces-7417-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKlbLs5iGWrDvwgAu9opvQ
	(envelope-from <linux-fbdev+bounces-7417-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 May 2026 11:56:30 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85C600515
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 May 2026 11:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0118230BA81F
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 May 2026 09:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846F33C1989;
	Fri, 29 May 2026 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="l2x5qOnh"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F573BD225
	for <linux-fbdev@vger.kernel.org>; Fri, 29 May 2026 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048274; cv=none; b=VRTTW8oj3aAoopAEp9CExIVOPiwram0bolVEozYQkylXdGcO2TGBGx1V9K3yVeOZPVqrCZzqEYrfrbjlaMqydf3rxRPIVJV0flHrp0qQPoSNmOK3b2QtUunnukJO5nXbau6IGFQURxsJm5zz5HXGzYviFtRGA9UZsT4xeOG73dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048274; c=relaxed/simple;
	bh=ZfaOPPNYNFKKgWBQ0CjGxfImqDjPcW4gKYAlO7OIXQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhnyiVrxFtwuEI2YGaZsMTLZbue1aDRODa2QjIbkyFxtYeEAGDyqJ1YA0uP/drzhxOLVtf1DT1NsfwtRNzF9u0J3Vz0UZ0iaeI2/1U5XZpTY/NglcMJ4v1rzE5qbMX9zE2M20TQ7ccZ6E/VcIIRa/Dpxx5nmkDa6/WzyfMgbMiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=l2x5qOnh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eec22fab7so821329f8f.3
        for <linux-fbdev@vger.kernel.org>; Fri, 29 May 2026 02:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780048270; x=1780653070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qf1xsznGow3Mq8kqI6r2C6YXYEYFaDdBn6M5Ic+GMxw=;
        b=l2x5qOnhQAeQWbCt0fRrLXN5kKMUm2CiyrjUh/s2Fj8zHvf2xij7eSMCUhxE3lQDEd
         qIGJUaAzDLsNapuDn0LXCbJJYcNv64DsJ7db394VhYzB2B0eqV/GgDg74iineSIgwDEp
         Y/iKr4C0+HYEblMJxqm9qVgJMo2V5u3J/UVVrzdvF6sqeImXcrrcSgbhDvGQhvKL2wXJ
         z/cBT/TMUy37AKq9QwM5ucGgZmguqgt0Gs26bRyEGBovXnXu1VyuVhOWxzfCAry4ejMf
         0Jw/ymcCd9bViXEbuRshUd2rQeM5aDi7+Ej96/n8vWfoIHisfgedD2Yejcr/RggzWX4i
         lu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048270; x=1780653070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qf1xsznGow3Mq8kqI6r2C6YXYEYFaDdBn6M5Ic+GMxw=;
        b=LodsvkAfPtsRO73zgC3SP2ffY4FNjhFxBSyDAS5pkwS6iVKveIVZEW6lmtk1wAd6yY
         CXqBClPpxtLizv44cJLDHLOhslFx0K2zNJ/Q4ftPdB4nME1o/7nGGDp/yd/S1p3zh/wy
         J5VF6G3ui2IzPyGBmzkAjcYfRCUQr7UbYI70ILRjNUk81SV7NPqjvOj23mYCRtHjZsGD
         Eah/FVzILPrA98RFxVc77chOAu1JKNyjYsDbRoNnTO8hFOY2lfQ6kg1G8FmA4c+pKbEz
         9ehnZqfDnvF1gNoQREwYA5aWEJpnvfFMC+ZtI2dJp8EdhtMtsZVOGAK+ChEg0G5hIUgM
         nYqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0HX5sA5qtvSPt5Al6QHmsCFZ+7+OrCos6IdUc89a506Wk3HX4Zr8FitQe6Hrype+HomZaMWBh0RFqZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQXUBX55K8ttm+leEIth+PsEkCWay30SO3y8peAIcVMbrAmggG
	E11cWwVW86JlrJ1F3mHt8WF8p3EaC6HriQcU/lBuIU5PXRl2ucZZON5X/VCxBezLQWw=
X-Gm-Gg: Acq92OHiZpg8J63my9G4110T2RcmNUl8R1zShPwjB4q5fft5rhwQb/PtnSeESdLeIyo
	LW4cq7FSEtnLX+Gb0vQjd6BU0ndWgNgW7hYiIomZ8vOl+IqDqXVh1ZUJF3V+mvH+YGOiq9Ut+zD
	JGXBzIhWwamm7Mn6AjgV9f2Y5LiHM5c3vbAxv+SR3XFpFU6yQZYaW90UvlhvnjgpwHvCcB9iFnm
	UuIe3Pmyv16nHRq7MF8SfgKMr6+5gZ9DZczH5pul7v99RA5SPHYl+z05zDr085IozESJKaAjHI8
	ts6pLSLQgCMSyfEDcWO85UZmBvpxrVYZAB7tYp8GzOKoA3TB5wKGNf3VVKVKJl7OHn6L43KRK9O
	AEAsP9QOmVqH/kw4l1ckLmtF85QH0rQojMnlMkRw27JsctjRq44Y5ZvSLtS1VwPF2g7Sp9HjGX6
	+J+yxMxvnaKISTukFzq2Uj0eOBXZfRqzhqdAkvTguZM71Ae4hEigHTBOkyUJdo+Iq2szHjgMTtD
	n7uhsK4OIFZuw/R/ndWEQvGclvct0HAtxua5ZTT6oU2qqSUVdbkhQTPZfnu81ajyxVEsJ0Vr8pw
	RRWAcJlig/vHioqKb1Q=
X-Received: by 2002:a05:600c:12d1:b0:48a:5970:1fe1 with SMTP id 5b1f17b1804b1-4909c091fd2mr22900055e9.4.1780048269850;
        Fri, 29 May 2026 02:51:09 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3563cb9sm2337806f8f.29.2026.05.29.02.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:51:08 -0700 (PDT)
Date: Fri, 29 May 2026 10:51:06 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: leds: Document TI LM3533 LED
 controller
Message-ID: <ahlhinOh3NxB7FY_@aspen.lan>
References: <20260528135123.103745-1-clamor95@gmail.com>
 <20260528135123.103745-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528135123.103745-2-clamor95@gmail.com>
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7417-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,devicetree.org:url,aspen.lan:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0E85C600515
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 04:51:18PM +0300, Svyatoslav Ryhel wrote:
> Document the LM3533 - a complete power source for backlight, keypad and
> indicator LEDs in smartphone handsets. The high-voltage inductive boost
> converter provides the power for two series LED strings display backlight
> and keypad functions.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../leds/backlight/ti,lm3533-backlight.yaml   |  68 +++++++
>  .../bindings/leds/ti,lm3533-leds.yaml         |  66 +++++++
>  .../devicetree/bindings/leds/ti,lm3533.yaml   | 170 ++++++++++++++++++
>  3 files changed, 304 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
> new file mode 100644
> index 000000000000..866b0fb8ed04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/ti,lm3533-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LM3533 high voltage series LED strings
> +
> +description:
> +  This is part of the TI LM3533 MFD device. It represents two high voltage series
> +  LED strings for display backlight controlled by the TI LM3533.
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/leds/backlight/common.yaml#
> +
> +properties:
> +  compatible:
> +    const: ti,lm3533-backlight
> +
> +  reg:
> +    description: Control bank selection (0 = bank A, 1 = bank B).
> +    maximum: 1
>    <snip>
> +  ti,pwm-config-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Control Bank PWM Configuration Register mask that allows to configure
> +      PWM input in Zones 0-4
> +      BIT(0) - PWM Input is enabled
> +      BIT(1) - PWM Input is enabled in Zone 0
> +      BIT(2) - PWM Input is enabled in Zone 1
> +      BIT(3) - PWM Input is enabled in Zone 2
> +      BIT(4) - PWM Input is enabled in Zone 3
> +      BIT(5) - PWM Input is enabled in Zone 4

This is optional and the drive implements a default (zero) that is not
documented here.

Is zero a sane default from a DT binding point of view?


Daniel.

