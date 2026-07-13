Return-Path: <linux-fbdev+bounces-7961-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vWEmO7ijVGqPogMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7961-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jul 2026 10:37:12 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 571CA748C90
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jul 2026 10:37:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=goldelico.com header.s=strato-dkim-0002 header.b=Vwx2oTP7;
	dkim=pass header.d=goldelico.com header.s=strato-dkim-0003 header.b=qtblV6pg;
	dmarc=pass (policy=quarantine) header.from=goldelico.com;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7961-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7961-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8301B30871E3
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jul 2026 08:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1B43AFCE5;
	Mon, 13 Jul 2026 08:28:28 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05FC3AE1BD;
	Mon, 13 Jul 2026 08:28:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931308; cv=pass; b=nE+0jFLqzD3NDW6lveGc1GuwoM/XoMLengRuZGvnm1qS++HVsJeztMgNeXCwRCXlRNRHoUa7CyZZFSeuOXmt7JigOzrp7zIq/4HKsR84jT2E0xQHzJvbwzOmb2AEycnFbnholSeEo8qm5mR0w07Vy5svVeV6R/1IU4/YNOa/s5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931308; c=relaxed/simple;
	bh=hU0sagAME1G1zZIH0RQbZV4EmEHwkgt1Op5N1vS/zfo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EXLFEQzYUtvXH5d4CEAF1x6vD010Xuzej7vUDkIuLnKdtYFyH/FPtbstNJhUnohjJyEf59Dj/TcRFuCtG3Onq1rcdjFY6KbxoQsivMs/XYoYlKg8y5GAi+1lix1JD6GuqSSDhYI8ajZ6NS2WGI8xdF6SoPRpc7mZYubjYxzuvN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=Vwx2oTP7; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=qtblV6pg; arc=pass smtp.client-ip=85.215.255.100
ARC-Seal: i=1; a=rsa-sha256; t=1783931231; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Oka9nCCkM+WZsnC/UNUFXjjaf3XwBpi/Oav9a/hVi0pB8MRxssrukHul6GEWznHmPM
    ESuqm0fBKdqPFempxtFxM3J6oqurPdAN0xkNajC7tnfKB87JmOP28ytTzrT4rCcb5E0Y
    lDLmYq4epC7eTkSONqsvQ5ts/WdO8PD/lU1dGrx0TIBFfd2qN11ISGgOTmta0ies3oyf
    GIrudUva1NnndTVf+19+KN4zAEDD1b6IeoB0FgLhmqcoZlXh/+2YLgDnZGtFEhb3yq5c
    tYKdnPJRPylyoLu2ajTe3eXlYbR8QLF7Jqt5uPEu56g4QQyvBK+vTKJ7NbDoPFU7+nI0
    cuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783931231;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Ib9mcRTAy1oPoZKxfhyC8Zte5eIn/Pz6JIUrDWg1aW4=;
    b=D6jlrtCzML6mCSrVPwQjtXWqErpA5Jd47PDLQF00O/HrZwutL85UKj2K29XaNYs0SP
    2YlkrJYN3XuQAw2iHRbBog4RFUlgpRAvlG65hkDFQ0JQdyQO2bUASmVz7ElyHlkbo8I8
    dyXLYMVWohedYQGdxl9dgW4KDO6XIL8B62v5vlpu5uoxOgXiwPdkrMTG/VMRwAPB/tnj
    NW4kK83Nl4UPPYHxhuG8NS+PFAaqhOrc4qbLNIRwLVLuEwygsEWF5d15vJDjtHPDAyax
    0YiD376xYpuCZ/Xv1MOpoa8t7UTiEBRUtCMNkfSOZMktFizmgZZC4NdBvxzKi/854QqO
    HjXw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783931231;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Ib9mcRTAy1oPoZKxfhyC8Zte5eIn/Pz6JIUrDWg1aW4=;
    b=Vwx2oTP7GlXOMiikEv8RAjkcfTCZdI39w67GqKlHM4pRVbZNnftH6RbItr/nTaWaOy
    p8RMzS7WI6acw58Z9T4pO+HtcqBvmtikn6DKE2F1nEip8hRo3bg8mAlJ9TfhbCQfAAUb
    Og9gqA/oIzReRDaji0ii19RwxjkcRK315ISN3lwarVZcICTb2GwMCh8LJdh0wGFHR+oJ
    6Ea0cs4mdlIAd0kTfdeRvSk/ZaoFjq+ldOba9I6iqqlHJH/qJLRsGXiAy7TqE2drO2YO
    MmQyQyW/iYaIvHj7NRmgqO1dpB0rNEbwFT9Kut812dd+pRcGbgy3Mhe3APaC613UpzBK
    fP/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783931231;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Ib9mcRTAy1oPoZKxfhyC8Zte5eIn/Pz6JIUrDWg1aW4=;
    b=qtblV6pgFh3CET9boKnJ88eVlzy7oA3DhyC0d8mqPA3sunBkBdF/us2HHoQf+7FQSw
    SdfBRHhUlBUtefoh7pBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQi5pZlciNgDl2kEp5oHJ2/c57N2Mc49IfXTKd"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426D8RAMvQ
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Mon, 13 Jul 2026 10:27:10 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH 07/16] ASoC: dt-bindings: add TI PCM1773
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20260713-abiding-jumping-ape-7ce8ff@quoll>
Date: Mon, 13 Jul 2026 10:27:00 +0200
Cc: linux-fbdev@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Niranjan H Y <niranjan.hy@ti.com>,
 Sen Wang <sen@ti.com>,
 Rob Herring <robh@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>,
 Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 linux-omap@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>,
 Grazvydas Ignotas <notasas@gmail.com>,
 devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 mfd@lists.linux.dev,
 linux-sound@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org,
 kernel@pyra-handheld.com,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E7BB0C31-9C19-4A9F-BBD9-746B94177B07@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com>
 <20260713-abiding-jumping-ape-7ce8ff@quoll>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[goldelico.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[goldelico.com:s=strato-dkim-0002,goldelico.com:s=strato-dkim-0003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7961-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hns@goldelico.com,linux-fbdev@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_RECIPIENTS(0.00)[m:linux-fbdev@vger.kernel.org,m:kuninori.morimoto.gx@renesas.com,m:tony@atomide.com,m:dri-devel@lists.freedesktop.org,m:lgirdwood@gmail.com,m:niranjan.hy@ti.com,m:sen@ti.com,m:robh@kernel.org,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:deller@gmx.de,m:lee@kernel.org,m:linux@armlinux.org.uk,m:linux-omap@vger.kernel.org,m:danielt@kernel.org,m:notasas@gmail.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:ckeepax@opensource.cirrus.com,m:arnd@arndb.de,m:s.hauer@pengutronix.de,m:mfd@lists.linux.dev,m:linux-sound@vger.kernel.org,m:rf@opensource.cirrus.com,m:broonie@kernel.org,m:tiwai@suse.com,m:perex@perex.cz,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:rogerq@kernel.org,m:jingoohan1@gmail.com,m:linux-kernel@vger.kernel.org,m:kernel@pyra-handheld.com,m:jarkko.nikula@bitmer.com,m:enelsonmoore@gmail.com,m:letux-kernel@openphoenux.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,renesas.com,atomide.com,lists.freedesktop.org,gmail.com,ti.com,kernel.org,iki.fi,baylibre.com,gmx.de,armlinux.org.uk,opensource.cirrus.com,arndb.de,pengutronix.de,lists.linux.dev,suse.com,perex.cz,oss.qualcomm.com,lists.infradead.org,pyra-handheld.com,bitmer.com,openphoenux.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hns@goldelico.com,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[goldelico.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goldelico.com:from_mime,goldelico.com:email,goldelico.com:mid,goldelico.com:dkim,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 571CA748C90

Hi Krzysztof,

Thank you for the feedback.

> Am 13.07.2026 um 09:38 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>=20
> On Sat, Jul 11, 2026 at 08:01:54AM +0200, H. Nikolaus Schaller wrote:
>> PCM1771/3 is a simple audio codec that can be enabled through an
>> enable-gpio.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> .../devicetree/bindings/sound/pcm1773.yaml    | 32 =
+++++++++++++++++++
>> 1 file changed, 32 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/sound/pcm1773.yaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/sound/pcm1773.yaml =
b/Documentation/devicetree/bindings/sound/pcm1773.yaml
>> new file mode 100644
>> index 0000000000000..f3e640705bf70
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/pcm1773.yaml
>> @@ -0,0 +1,32 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bindings/sound/pcm1773.yaml#
>=20
> You need to use latest existing bindings as starting point and test =
your
> code.

Resulting code from compiler was runtime tested.

Actually, we used the latest bindings of some other audio dac as a =
starting point.
However, we introduced errors into the finally submitted file.
We will verify and test the schema next time.

Regarding the checks: both the rob herring bot and the sashiko bot also =
reported several issues directly to us,
so we are already aware of some other remaining errors.

We are currently working on a v2 to clean everything up.

Thanks and BR,
Nikolaus=

