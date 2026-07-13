Return-Path: <linux-fbdev+bounces-7957-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NDqqBW+XVGr2nwMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7957-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jul 2026 09:44:47 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D048748500
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jul 2026 09:44:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="nHWAWU/T";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7957-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7957-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C4E23044C0A
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jul 2026 07:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FEF438E8C7;
	Mon, 13 Jul 2026 07:38:21 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EA07E0E4;
	Mon, 13 Jul 2026 07:38:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928301; cv=none; b=WgePMb/CHbEeW8+6GPmO9/QXd2qKDtkqAUKPetlcJNBq0+Fn5B/IhNsFvOamvQSsgsT1YtbiON7uLvDa9hegRIddNVfugsdCfuqzTmTKY+JswTWGBM4ENL7OgNEop6FETWD/va5C40g/pS7qqp+bc8m08J2edPOnJprrwyZSptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928301; c=relaxed/simple;
	bh=5Esc0/md1dcYXyPKmZLcixnjBNt2TQg2Nk2m4Ct3EY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eb0wld35zjB65jOnQVDHYsksDwig8aqxCE+nxyT4EqsgqFEywbOHIUJn7sybJUwBvsYEwpzVyFG5HXZLfmtLnEcdbMSrmQZTT4X8SsN8UDEdmuFPisRByzgpwztXmgiJI3kA/DOeNYLo72/bhrNKuX5HYxKyb9y6lQMNIbRzMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHWAWU/T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F012D1F000E9;
	Mon, 13 Jul 2026 07:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928300;
	bh=GOk+q11iQ5FGQBuFxsE6IN4gWGVpyDYBHJev4U8yed0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nHWAWU/T/RjmHrkeBuNNuw4Fm2S1sV9R8mVbQaQHKt5VV9K0aBrVtw6RRNTp1pL5U
	 Zt93F+0hre/OlRuaUiufTQMn2oF8+Vz6u7Q/+vULhZ8g9XuL3EG7eeCJaqNfF8iZ4B
	 aHD61SlT8ANBLuhopVlpXfMxSr5iJ77+tMF6AKKvR7MPOzbWxm/fAi65xuE7v6aEXb
	 ZvU2mgtRzEt1HqR45Os8kHacCV0hSYVOCle4J124zCcgsqK1SVGA86/cmyjphf2dVC
	 RH6Wson/gX8TOm9uMqGT+fo9/3dtti7weq6QO6SLPKX3rZcJ4h8OADMDvD7BUFoXmb
	 QwS8CDtLjZHlw==
Date: Mon, 13 Jul 2026 09:38:16 +0200
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
Subject: Re: [PATCH 07/16] ASoC: dt-bindings: add TI PCM1773
Message-ID: <20260713-abiding-jumping-ape-7ce8ff@quoll>
References: <cover.1783749722.git.hns@goldelico.com>
 <a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-7957-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,goldelico.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D048748500

On Sat, Jul 11, 2026 at 08:01:54AM +0200, H. Nikolaus Schaller wrote:
> PCM1771/3 is a simple audio codec that can be enabled through an
> enable-gpio.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../devicetree/bindings/sound/pcm1773.yaml    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/pcm1773.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/pcm1773.yaml b/Documentation/devicetree/bindings/sound/pcm1773.yaml
> new file mode 100644
> index 0000000000000..f3e640705bf70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/pcm1773.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/sound/pcm1773.yaml#

You need to use latest existing bindings as starting point and test your
code.

Best regards,
Krzysztof


