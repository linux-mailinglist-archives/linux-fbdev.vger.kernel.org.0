Return-Path: <linux-fbdev+bounces-7921-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U1tuFuncUWrjJgMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7921-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2026 08:04:25 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7CD7407EE
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2026 08:04:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=goldelico.com header.s=strato-dkim-0002 header.b=bSEIuX13;
	dkim=pass header.d=goldelico.com header.s=strato-dkim-0003 header.b=FcC6IWfP;
	dmarc=pass (policy=quarantine) header.from=goldelico.com;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7921-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7921-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DDE63055D3D
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2026 06:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE8432FA18;
	Sat, 11 Jul 2026 06:02:49 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de [85.215.255.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E913431B83B;
	Sat, 11 Jul 2026 06:02:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783749769; cv=pass; b=fzPQFEXGKsihmS5Yql3T5ci0T1VEnY0YZDGSUT1Y+x5xOhWxpf4HZ4I6WvcsW2dn96ZHtocmjBtsaJmNJQjLain2ODnNST1VhOQvS529CVfExwtm8Kn72pJF4e78lZkxjwLj6cdTvwjzVzMEKlPNDMGwLe+BDzDM/Ak7NAm0+gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783749769; c=relaxed/simple;
	bh=Ez6a2tlwx9Srr4TDQPwKhoL/dkxkQlFUtUtecoyPFbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jucct7K9D9Pm8NRm44vn6yykZz4A587a8d1inNaL8ffpZwLdG6xy3CCtWh6grhonE7w9iIKb6t+1xLfOhVa0DoXK7wV7GOoZKSXmZW6kDOK9VX8b94/tsHp9zuR2VV/RyZSFy0rPej5alLenFC+6adTKXttUJtDC9qtZQgvqaQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=bSEIuX13; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=FcC6IWfP; arc=pass smtp.client-ip=85.215.255.120
ARC-Seal: i=1; a=rsa-sha256; t=1783749736; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OPe/j2k2jWH4cAU6GP66U8XFCtxb4Y/owuIlLEQ1WOVZ7/a1+EyHlmYTxEsX93Vckg
    YksXJxSUFK4N56Ol3EeYYom7QYELdI8eRzzSmGOWYKA4AOBWmtFfTMxjUVdOWoZZV9Gy
    zoZG2/b39GgeqTUxVhsTLRwgkDfLZdBeTBIm2Tko6ce2UHvIQZzYZuINJgSVfqiIq5jX
    Qz1naDDUFTC76tFZV8l7oE21cAIQou9FlP4oioGp4n1/mNzmbUaYrgQtU7HX7nj8+dep
    s+vUmKt4xh3Kaxdz3nwCVd8NLqKlJbuXevsP09XDh0V5CNgSfAYmWU5vjUyl44uS3V4C
    glEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749736;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=E8jCDGxFCZCvaxcS2Psadz3lVnIPsSjTP8SdZWEFY3o=;
    b=GzNBhnIuSWQP5HA0tgU9LmvIa6xW0t69LjSFZJSMJDZXNXoaFp2IHcqATQvZnL5UJP
    GpVDc0tlj2HjEFVz/VvLJoh7q4KvfKOXPzqF5fOl6THSKwAARnt+UEzaJ1q5Iz0r4KZ9
    7D32+y4JztNrGHqODg0Et61yyrnnmJMGOWxCFnHArZzHjogGN8xQzU6PEqwsmYe4HR5B
    VjxozmxsBwh9uZSNc7u2MjES/gioYgRi11F2v2sl4MhBkHR9ytLVInSANsnubQRvk8DT
    JPg9wQqvbt4486QfPa+YKVetO0udj/FKBMsdMZeyiQfcgsHAyl64rRQFXMhBc9knSqbQ
    6X/w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749736;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=E8jCDGxFCZCvaxcS2Psadz3lVnIPsSjTP8SdZWEFY3o=;
    b=bSEIuX13cFGeoDxHmGlpREmKzlrkSDTC6RxM5qWfTKqXb5BY/34Nff9VqsmfqcvOFf
    v4JtxswUCojY1iArIkmsmzupPksVDSWu6O/V85kvf/ffpDe+0bYA/fWte7ZEufoF0+rY
    BBCDMbdu9isYxeHMwv2V+WeiHQIkN0/PJDFjijmOuqqHlC+DwQVl3ssDw+STMsQP1Ys/
    fzvCjU3J2YQoAjnlzZNqw6HyrYjUNOb3kv4onWMXs/eU0n84mcHwb24RGEddx4r7uYQZ
    lockG54Qt1xEfUmcAJYLsVmOjcS4yrb2+pwQRHbaCYYPJLjtoGUSKw4WoSwxu47+jHlC
    SO2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783749736;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=E8jCDGxFCZCvaxcS2Psadz3lVnIPsSjTP8SdZWEFY3o=;
    b=FcC6IWfP0TTCCH9BvVqmVo68V1h+An5Q4quALN+HCARu2x7tn5kfeAKJK+S5BJbifF
    3qsD1zmLZujyE/v6fUBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrT35oLmciNszeF4HOToVDOd6S1gdjuILE2MKVd"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426B62EGhs
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Jul 2026 08:02:14 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Grond <grond66@riseup.net>,
	Stefan Leichter <sle85276@gmx.de>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Grazvydas Ignotas <notasas@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andreas Kemnade <andreas@kemnade.info>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sen Wang <sen@ti.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Niranjan H Y <niranjan.hy@ti.com>
Cc: letux-kernel@openphoenux.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	kernel@pyra-handheld.com,
	mfd@lists.linux.dev
Subject: [PATCH 07/16] ASoC: dt-bindings: add TI PCM1773
Date: Sat, 11 Jul 2026 08:01:54 +0200
Message-ID: <a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[goldelico.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[goldelico.com:s=strato-dkim-0002,goldelico.com:s=strato-dkim-0003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:grond66@riseup.net,m:sle85276@gmx.de,m:hns@goldelico.com,m:notasas@gmail.com,m:tony@atomide.com,m:enelsonmoore@gmail.com,m:jarkko.nikula@bitmer.com,m:s.hauer@pengutronix.de,m:andreas@kemnade.info,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:rogerq@kernel.org,m:linux@armlinux.org.uk,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:perex@perex.cz,m:tiwai@suse.com,m:sen@ti.com,m:rf@opensource.cirrus.com,m:arnd@arndb.de,m:srinivas.kandagatla@oss.qualcomm.com,m:kuninori.morimoto.gx@renesas.com,m:ckeepax@opensource.cirrus.com,m:niranjan.hy@ti.com,m:letux-kernel@openphoenux.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:kernel@pyra-handheld.com,m:mfd@l
 ists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[riseup.net,gmx.de,goldelico.com,gmail.com,atomide.com,bitmer.com,pengutronix.de,kemnade.info,kernel.org,iki.fi,baylibre.com,armlinux.org.uk,perex.cz,suse.com,ti.com,opensource.cirrus.com,arndb.de,oss.qualcomm.com,renesas.com];
	FORGED_SENDER(0.00)[hns@goldelico.com,linux-fbdev@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[41];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-7921-lists,linux-fbdev=lfdr.de];
	DKIM_TRACE(0.00)[goldelico.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hns@goldelico.com,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,openpandora.org:email,goldelico.com:from_mime,goldelico.com:email,goldelico.com:mid,goldelico.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD7CD7407EE

PCM1771/3 is a simple audio codec that can be enabled through an
enable-gpio.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../devicetree/bindings/sound/pcm1773.yaml    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/pcm1773.yaml

diff --git a/Documentation/devicetree/bindings/sound/pcm1773.yaml b/Documentation/devicetree/bindings/sound/pcm1773.yaml
new file mode 100644
index 0000000000000..f3e640705bf70
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/pcm1773.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/sound/pcm1773.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments pcm1773 audio codec
+
+maintainers:
+  - to-be-defined@openpandora.org
+
+description: |+
+  PCM1771 is a simple audio codec that can be enabled
+  through a gpio.
+
+properties:
+  compatible:
+    const: ti,pcm1773
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-codec {
+      compatible = "ti,pcm1773";
+      enable-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+    };
+
+...
-- 
2.50.1 (Apple Git-155)


