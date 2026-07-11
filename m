Return-Path: <linux-fbdev+bounces-7933-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yBa/BC/zUWoRKwMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7933-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2026 09:39:27 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8F4740C0E
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2026 09:39:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mfw1unyu;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7933-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7933-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D1EB3015A5D
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2026 07:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1695D37A83F;
	Sat, 11 Jul 2026 07:39:24 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12263603C9;
	Sat, 11 Jul 2026 07:39:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755564; cv=none; b=figbmxlYmNac40EIKmFKzzolAa0HU2nsyiQGJXhSpl3mcJHF6BBZXZRBdFF40od0F+gCheeNWzp/XxE/BU375UCtFxcYxPpZr65PYIMh16tyCdEvUeLohGfsNNkVVPGlVrmyznv1nCz2xgJbfx02M4sK0VoSDg7SgFVgTVeROtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755564; c=relaxed/simple;
	bh=EwEusek1czoOpXHbaygqhpMtyKAbqtWqGBgOiD2R2ME=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ufH57enqNjMmhf+uXbYftrSubVQbJvc2ZbMFSzJbsMLdQsiZ7uApTi9ZLOxhoZ3VrXoT3WNflPlHsuNyT6rH/x++Br7H9EXCWyph7NsPPv8iUnCFmNLs3trzkTJjgNJG3r8MU1x4g4sVbDnU0209f/IGjwolQfezXLltS7cFPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfw1unyu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308CA1F000E9;
	Sat, 11 Jul 2026 07:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783755562;
	bh=TYtjAVPyiyVCs7rEX4PjUS/qYasF91VWIyzMuMsClWc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=mfw1unyuyde0ALrJe/zfiLZV52Hf0qQbPaw+v/si5t6SCNDG+XDDrpRyzh4VfeRR3
	 PFkxRkHui1szF8apGh0eXyqKpWrtX/+h1xHkgpNha6Kqe7VfPJSgswBIGohK1t/Qy1
	 XS56RLqs4XmG1GENPccTJVaXXqajFIYGcKDpoWsztu37CxAw5raopZPOBSKu62msBm
	 J008e0O1weHW8gBfv8rQZGmkqETkt3qs9p6Zo7zgVwMnknuTCOgFM/6YIgHR4iIxBB
	 gJyJBaIhWl0aipIst8kQhZGIP7a+JrSt7nLr2rGd4O9EEcOXj+DhDcBWZto7L/DHKg
	 l9GYOiIPrY96w==
Date: Sat, 11 Jul 2026 02:39:21 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-omap@vger.kernel.org, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, kernel@pyra-handheld.com, 
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org, 
 Jaroslav Kysela <perex@perex.cz>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Stefan Leichter <sle85276@gmx.de>, Arnd Bergmann <arnd@arndb.de>, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Niranjan H Y <niranjan.hy@ti.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, 
 Grazvydas Ignotas <notasas@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, letux-kernel@openphoenux.org, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
 dri-devel@lists.freedesktop.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Kevin Hilman <khilman@baylibre.com>, Sen Wang <sen@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Helge Deller <deller@gmx.de>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Grond <grond66@riseup.net>, Conor Dooley <conor+dt@kernel.org>, 
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 devicetree@vger.kernel.org, mfd@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <7989e699de400c0fe3f0cb7af77a54077784df78.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <7989e699de400c0fe3f0cb7af77a54077784df78.1783749722.git.hns@goldelico.com>
Message-Id: <178375556058.2516925.10169600172051423562.robh@kernel.org>
Subject: Re: [PATCH 09/16] ASoC: dt-bindings: add OpenPandora Sound Card
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7933-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-omap@vger.kernel.org,m:rf@opensource.cirrus.com,m:ckeepax@opensource.cirrus.com,m:kernel@pyra-handheld.com,m:lee@kernel.org,m:linux-fbdev@vger.kernel.org,m:perex@perex.cz,m:rogerq@kernel.org,m:tony@atomide.com,m:krzk+dt@kernel.org,m:sle85276@gmx.de,m:arnd@arndb.de,m:linux-kernel@vger.kernel.org,m:broonie@kernel.org,m:tiwai@suse.com,m:niranjan.hy@ti.com,m:linux@armlinux.org.uk,m:jarkko.nikula@bitmer.com,m:notasas@gmail.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:letux-kernel@openphoenux.org,m:aaro.koskinen@iki.fi,m:enelsonmoore@gmail.com,m:dri-devel@lists.freedesktop.org,m:kuninori.morimoto.gx@renesas.com,m:khilman@baylibre.com,m:sen@ti.com,m:s.hauer@pengutronix.de,m:deller@gmx.de,m:andreas@kemnade.info,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:grond66@riseup.net,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:devicetree@vger.kernel.org,m:mfd@lists.linux.dev,m:hns@goldelico.com,m:k
 rzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,opensource.cirrus.com,pyra-handheld.com,kernel.org,perex.cz,atomide.com,gmx.de,arndb.de,suse.com,ti.com,armlinux.org.uk,bitmer.com,gmail.com,oss.qualcomm.com,lists.infradead.org,openphoenux.org,iki.fi,lists.freedesktop.org,renesas.com,baylibre.com,pengutronix.de,kemnade.info,riseup.net,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,goldelico.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C8F4740C0E


On Sat, 11 Jul 2026 08:01:56 +0200, H. Nikolaus Schaller wrote:
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

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml:10:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
./Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml:13:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
./Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml:18:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
./Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml:56:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
./Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml:62:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 66, in main
    ret |= check_doc(f)
           ~~~~~~~~~^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 29, in check_doc
    for error in sorted(dtsch.iter_errors(), key=lambda e: e.linecol):
                 ~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 167, in iter_errors
    self.validator = self.DtValidator(registry.contents(meta_schema_id), registry=registry)
                                      ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 488, in contents
    return self[uri].contents
           ~~~~^^^^^
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 338, in __getitem__
    raise exceptions.NoSuchResource(ref=uri) from None
referencing.exceptions.NoSuchResource: 'http://devicetree.org'
Lexical error: Documentation/devicetree/bindings/sound/pcm1773.example.dts:20.37-52 Unexpected 'GPIO_ACTIVE_LOW'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/sound/pcm1773.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1705: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/7989e699de400c0fe3f0cb7af77a54077784df78.1783749722.git.hns@goldelico.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


