Return-Path: <linux-fbdev+bounces-7997-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sONqKeQ+V2o1IAEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7997-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Jul 2026 10:03:48 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB0075BB37
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Jul 2026 10:03:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kemnade.info header.s=20220719 header.b="HST9/G8Z";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7997-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7997-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=kemnade.info;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC457302E78B
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Jul 2026 08:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DDD37B010;
	Wed, 15 Jul 2026 08:00:05 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983BD3B7769;
	Wed, 15 Jul 2026 08:00:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102404; cv=none; b=UINlpNNwmj9AcD4Pc2OslyKoIrZJ0RUpjcQkDL6BfBBNdy9bOEfqSmd8r+ADHIGePPcGSf7KSG/cDT2LJGm1nTqjQDuxz7viO1Fy8O9EdZG919+AEYaInOzPJU2O4ZB847TZ6gdP5Hlx0KMVvuRgHrngzRcH0/Q5wwJOzC/aby8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102404; c=relaxed/simple;
	bh=HSrqo3rPcHBi8CgB9LxOsFM4lZo+LcatZQj6Ixlc4p4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sGK0UYB6cpaRFAdi9+p5hz55wIDxZSma/2pXSQFI1C+LbUaqtN+tXrdhv/oKNw7tniM61ztiCVin7tNMaxFou0CcN3KsihIaPaigCLFg+Yv5JIllxMe91WB9MipIamyRKAZrUGHPq/nIEcOrSls9dm7fMm8wKqFKQI+T7MgkSz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=HST9/G8Z; arc=none smtp.client-ip=178.238.236.174
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=N3CkAi0NhBu7kRLp3iC2P9Ehn1eHefsaOWNM8LYTF4k=; t=1784102402; x=1785312002; 
	b=HST9/G8Z+JPHih65JxX5X3Ki3eX9Cc5olT6uLNJWZIGQj4oR7YWI97EaeqPGG02p0hIuJJ7Qliz
	aARvUH2AqRhhKyN+g2Di/RqqESQUsd7K46blbgpQF8Kc2p4xyV+KDVo3imiz19aQ+HetpwQbFJ9U1
	oT4KJ9UC9fboEVFuY96adEuY4032knMEcZ+5l+rgap0mzb0aOh1573g47/j/+8SrqA83ttkDyQTgR
	pAe8RYIo38kjBSJpjEpqtHRogtx5O5Tbo3dxD3e4jb9CSxrnOcyRaONQfJFoyO+XKV6NjFMUyTzDu
	q7BkZXi9f1Is6Lt3WlaJDe3B32FdDUCSeIZQ==;
Date: Tue, 14 Jul 2026 20:36:04 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Grond <grond66@riseup.net>, Stefan Leichter <sle85276@gmx.de>, Grazvydas
 Ignotas <notasas@gmail.com>, Tony Lindgren <tony@atomide.com>, Ethan
 Nelson-Moore <enelsonmoore@gmail.com>, Jarkko Nikula
 <jarkko.nikula@bitmer.com>, Sascha Hauer <s.hauer@pengutronix.de>, Lee
 Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Daniel Thompson
 <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Sen Wang <sen@ti.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, Srinivas
 Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Niranjan H Y <niranjan.hy@ti.com>,
 letux-kernel@openphoenux.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 kernel@pyra-handheld.com, mfd@lists.linux.dev
Subject: Re: [PATCH 06/16] ASoC: twl4030-codec: Allow setting APLL rate
 through the .set_sysclk() interface
Message-ID: <20260714203549.4b070f72@kemnade.info>
In-Reply-To: <7ea589f951baf1e217c7169ae21c0bf510672ecf.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
	<7ea589f951baf1e217c7169ae21c0bf510672ecf.1783749722.git.hns@goldelico.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kemnade.info,none];
	R_DKIM_ALLOW(-0.20)[kemnade.info:s=20220719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7997-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hns@goldelico.com,m:grond66@riseup.net,m:sle85276@gmx.de,m:notasas@gmail.com,m:tony@atomide.com,m:enelsonmoore@gmail.com,m:jarkko.nikula@bitmer.com,m:s.hauer@pengutronix.de,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:rogerq@kernel.org,m:linux@armlinux.org.uk,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:perex@perex.cz,m:tiwai@suse.com,m:sen@ti.com,m:rf@opensource.cirrus.com,m:arnd@arndb.de,m:srinivas.kandagatla@oss.qualcomm.com,m:kuninori.morimoto.gx@renesas.com,m:ckeepax@opensource.cirrus.com,m:niranjan.hy@ti.com,m:letux-kernel@openphoenux.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:kernel@pyra-handheld.com,m:mfd@lists.linux.dev,m:krzk@k
 ernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andreas@kemnade.info,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kemnade.info:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[riseup.net,gmx.de,gmail.com,atomide.com,bitmer.com,pengutronix.de,kernel.org,iki.fi,baylibre.com,armlinux.org.uk,perex.cz,suse.com,ti.com,opensource.cirrus.com,arndb.de,oss.qualcomm.com,renesas.com,openphoenux.org,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,pyra-handheld.com,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goldelico.com:email,riseup.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kemnade.info:from_mime,kemnade.info:dkim,kemnade.info:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDB0075BB37

On Sat, 11 Jul 2026 08:01:53 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> From: Grond <grond66@riseup.net>
> 
> On the Pandora, the APLL is actually what drives all of the audio
> clocks on the board. Since the TWL4030 is only used for capture, we
> need some way of setting the correct rate for playback streams, since
> they will not go through the TWL4030's .hw_params() code path (which
> is normally how APLL rate is set).
> 
> Signed-off-by: Grond <grond66@riseup.net>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

As a general comment: might we model this as clock provider (and maybe
that enables the usage of a generic audio-graph-card)?

Regards,
Andreas


