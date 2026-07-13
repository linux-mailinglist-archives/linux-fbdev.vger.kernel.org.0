Return-Path: <linux-fbdev+bounces-7956-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pCjKKsWVVGqPnwMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7956-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jul 2026 09:37:41 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2AA7483D5
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jul 2026 09:37:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a9ED+X0p;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7956-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7956-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F71C300CD95
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jul 2026 07:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC46390217;
	Mon, 13 Jul 2026 07:37:22 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7258F36E47E;
	Mon, 13 Jul 2026 07:37:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928242; cv=none; b=bcb2CVBMLzRrJIn+ek83Ssu2YOtYswX9XyCvMzDlbzHAFzQ/9fQltb7Tvx1ZcU0Cqxra+kbTmgE1iYaNJjIom82PsXZw60ylQBZSAUcrl2v6w2+KTE9XvJyQH6Lk6srJbMklMeD1JeqdMdGm/qybnV15+YzDrMqr2KZ/dhoEZWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928242; c=relaxed/simple;
	bh=vuW3SGFT+7irUo4qhzqZsZpdfRHgkctW1G0g6KpOQHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aupjCU1q44Gwufo8BXBefHvQZISY3wlWW4i/VnCa3GECJAQDi8JxW1n+LI07ijaDgKPuHe+7VeHFGhB/AJ1SnStXFvYGrqqAAKD2cvd/CqE/CcZaskXKTFXDIgAifUg2rj6QHSDbjHEF7JGUzTbY49iFhcd865yeqA5BgYBHZFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9ED+X0p; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911211F000E9;
	Mon, 13 Jul 2026 07:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928241;
	bh=bXtL5B/kMgo1NqZesSdNIhW8VtCuGlKis5NQ4H+8wlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a9ED+X0pGKORIj5E3nHBhn1CQn/NYxn2XZyYw2PnqzKaM2pKEWCvAY0hXmxywc3j3
	 wcVq9XeI2KpOtGvUqwVX9LIZt3K/cVcp575L+r0mwL6t93EK86GLDBKxPrZkDmb+Sf
	 g5U3P24lOZITYFSXnVRm/cJDZrKH/LsHxMfoHMFSugfparM4iDZenc/9jKKoURWZKc
	 PsIMSIxXdrIg9O04WwLCz8T1Ku8KVPtnL1rj7/Ye5Wy02nIxDgQAe4CgiRy2IVRkVM
	 eDFScpoPzPRpm3PFGDxfyT5d2ni+xfg9NsL8kKAC3gM2VALfmN4OZDtViK9NKu6bat
	 RR5iM3HvYieMw==
Date: Mon, 13 Jul 2026 09:37:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Grond <grond66@riseup.net>, Stefan Leichter <sle85276@gmx.de>, 
	Grazvydas Ignotas <notasas@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andreas Kemnade <andreas@kemnade.info>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Sen Wang <sen@ti.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Niranjan H Y <niranjan.hy@ti.com>, letux-kernel@openphoenux.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, kernel@pyra-handheld.com, 
	mfd@lists.linux.dev
Subject: Re: [PATCH 09/16] ASoC: dt-bindings: add OpenPandora Sound Card
Message-ID: <20260713-infallible-capable-dormouse-aaaebe@quoll>
References: <cover.1783749722.git.hns@goldelico.com>
 <7989e699de400c0fe3f0cb7af77a54077784df78.1783749722.git.hns@goldelico.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7989e699de400c0fe3f0cb7af77a54077784df78.1783749722.git.hns@goldelico.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hns@goldelico.com,m:grond66@riseup.net,m:sle85276@gmx.de,m:notasas@gmail.com,m:tony@atomide.com,m:enelsonmoore@gmail.com,m:jarkko.nikula@bitmer.com,m:s.hauer@pengutronix.de,m:andreas@kemnade.info,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:rogerq@kernel.org,m:linux@armlinux.org.uk,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:perex@perex.cz,m:tiwai@suse.com,m:sen@ti.com,m:rf@opensource.cirrus.com,m:arnd@arndb.de,m:srinivas.kandagatla@oss.qualcomm.com,m:kuninori.morimoto.gx@renesas.com,m:ckeepax@opensource.cirrus.com,m:niranjan.hy@ti.com,m:letux-kernel@openphoenux.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:kernel@pyra-handheld.com,m:mfd@l
 ists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7956-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[riseup.net,gmx.de,gmail.com,atomide.com,bitmer.com,pengutronix.de,kemnade.info,kernel.org,iki.fi,baylibre.com,armlinux.org.uk,perex.cz,suse.com,ti.com,opensource.cirrus.com,arndb.de,oss.qualcomm.com,renesas.com,openphoenux.org,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,pyra-handheld.com,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E2AA7483D5

On Sat, Jul 11, 2026 at 08:01:56AM +0200, H. Nikolaus Schaller wrote:
> The OpenPandora audio subsystem describes the routing links between the
> OMAP3 McBSP interface, the external PCM1773 DAC, and the TWL4030 audio
> codec, alongside amplifiers and power supplies.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../sound/openpandora,omap3pandora-sound.yaml | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml b/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml
> new file mode 100644
> index 0000000000000..d3c747e5c58d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org
> +$schema: http://devicetree.org

This wasn't ever tested. Why?

Best regards,
Krzysztof


