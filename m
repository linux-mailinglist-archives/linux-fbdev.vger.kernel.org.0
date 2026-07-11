Return-Path: <linux-fbdev+bounces-7934-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mG2cEFjzUWoeKwMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7934-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2026 09:40:08 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F31740C2D
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2026 09:40:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DAEUkMAp;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7934-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7934-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 087F63030B10
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2026 07:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB19937B407;
	Sat, 11 Jul 2026 07:39:24 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC19837475C;
	Sat, 11 Jul 2026 07:39:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755564; cv=none; b=bRjDmWYgtUEGs+ejvsXj/9QplBvNaZOMnENg0p73Pc1659bU24vn7t0nV2MRctaKIXy90XBzkGc/qi4IftyfUy1fO1lZ8EFcsPLv6yi3j7j8jg/Slvda+Xg0OHyAgAb/FbAniLNhmaszDSkwfVMPE/TWopiz4uxpLnU63BL7FfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755564; c=relaxed/simple;
	bh=YCYEWqMTFfeXF1HRMWj57Z2nVa42zZN1nrHic65Chm8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=E20QL94LlwAZpq+g7GpcUBVjeEKs7RWNyOSdbWtl1LO70ZKYsMHOWXs6i21RZR/ILJUrB2oahVC3nv9tm1sqEYqZ7qdwaSIQAFGzxdFn9dF/zdlMKVRxCmTKgfQJAoO75l2iBQ6RGVaciBeNq7EKeA7i9y4oENSzlYlch35lnrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAEUkMAp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1282A1F00A3A;
	Sat, 11 Jul 2026 07:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783755563;
	bh=iV5e6pRe5bHAjJTm6bWvI5nFVRDfFXzcLJLu3ZoiTio=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=DAEUkMAp2/M99hv5JAlJsvDDrRXFNP24LsCgoiohXjn6HURC+eEyNFPG3FEN/jdVJ
	 2cSYPMD16xyDYscq6hOUYQlWdHu6y3h038V5Lj8mRNWepM3vXLdf5Vbtvy9KQL8rI0
	 ri7EEkjZ3FD4ynF+vqFPeP0W+dXdS3tVli8dAI5NRmFfgrORV707PHCGOjv1Wq7HGY
	 WFXhJw+XW/+5tWrlblqFRBElP9YXVIyudq6eBpJlLxc7iN0/kasokANd4XFzJxonr5
	 PdfDjpcrTiOct/J2T0GdHzUV7ysbR0xPdOhpeE4J/a9rs8coZBjiVRAMLJ71QwQuH4
	 rvprBma6OslAA==
Date: Sat, 11 Jul 2026 02:39:22 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Stefan Leichter <sle85276@gmx.de>, Daniel Thompson <danielt@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, 
 Lee Jones <lee@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-omap@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sound@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Niranjan H Y <niranjan.hy@ti.com>, 
 Grazvydas Ignotas <notasas@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Roger Quadros <rogerq@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, dri-devel@lists.freedesktop.org, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Helge Deller <deller@gmx.de>, 
 Grond <grond66@riseup.net>, linux-fbdev@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Kevin Hilman <khilman@baylibre.com>, Sen Wang <sen@ti.com>, 
 kernel@pyra-handheld.com, Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 letux-kernel@openphoenux.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com>
Message-Id: <178375556139.2516965.6236993416627662539.robh@kernel.org>
Subject: Re: [PATCH 07/16] ASoC: dt-bindings: add TI PCM1773
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7934-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sle85276@gmx.de,m:danielt@kernel.org,m:arnd@arndb.de,m:srinivas.kandagatla@oss.qualcomm.com,m:ckeepax@opensource.cirrus.com,m:linux-kernel@vger.kernel.org,m:tony@atomide.com,m:lee@kernel.org,m:andreas@kemnade.info,m:enelsonmoore@gmail.com,m:linux-omap@vger.kernel.org,m:mfd@lists.linux.dev,m:linux-sound@vger.kernel.org,m:broonie@kernel.org,m:tiwai@suse.com,m:s.hauer@pengutronix.de,m:niranjan.hy@ti.com,m:notasas@gmail.com,m:conor+dt@kernel.org,m:jarkko.nikula@bitmer.com,m:jingoohan1@gmail.com,m:linux@armlinux.org.uk,m:rogerq@kernel.org,m:perex@perex.cz,m:dri-devel@lists.freedesktop.org,m:aaro.koskinen@iki.fi,m:lgirdwood@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:deller@gmx.de,m:grond66@riseup.net,m:linux-fbdev@vger.kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:khilman@baylibre.com,m:sen@ti.com,m:kernel@pyra-handheld.com,m:rf@opensource.cirrus.com,m:kuninori.morimoto.gx@renesas.com,m:letux-kernel@openphoenux.org,m:hns@goldelico.com,m:c
 onor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,arndb.de,oss.qualcomm.com,opensource.cirrus.com,vger.kernel.org,atomide.com,kemnade.info,gmail.com,lists.linux.dev,suse.com,pengutronix.de,ti.com,bitmer.com,armlinux.org.uk,perex.cz,lists.freedesktop.org,iki.fi,lists.infradead.org,riseup.net,baylibre.com,pyra-handheld.com,renesas.com,openphoenux.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,goldelico.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97F31740C2D


On Sat, 11 Jul 2026 08:01:54 +0200, H. Nikolaus Schaller wrote:
> PCM1771/3 is a simple audio codec that can be enabled through an
> enable-gpio.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../devicetree/bindings/sound/pcm1773.yaml    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/pcm1773.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


