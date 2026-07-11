Return-Path: <linux-fbdev+bounces-7927-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eeOBIC3dUWr4JgMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7927-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2026 08:05:33 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C249274081E
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2026 08:05:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=goldelico.com header.s=strato-dkim-0002 header.b=Zhji+Fru;
	dkim=pass header.d=goldelico.com header.s=strato-dkim-0003 header.b=zCuCf5AQ;
	dmarc=pass (policy=quarantine) header.from=goldelico.com;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7927-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7927-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FB66302A51F
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2026 06:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2FC31F9A2;
	Sat, 11 Jul 2026 06:05:14 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de [85.215.255.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053441FD4;
	Sat, 11 Jul 2026 06:05:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783749914; cv=pass; b=r2uEwUKfmMeEnG9hMFPhtldlX0+O66XGXWlqTs70IG2MPFHveHFlkCoWtpG7mEf32Cb1soC8eQzIAZsFuk2GyP7vlSHI2GNvu5sV+V5X+hb4iVagWEaYjNG/Cg5njKhdFnNpKkOaM8cgMsbzqfjH06zFqSfJ5NmMa9dFfeWIoIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783749914; c=relaxed/simple;
	bh=b2sPNADKqMR8qPuqcfZOFA0BbJgzfbHwOjO3i2WEGf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oejEYMKxp/OVnkWmhhL6YXIpR9Mh85ei72F4DlPDI0ghZMpP+tRPBOsNWNBwh1NPSCM2FkLRV9lp3VmhOkXvaVqOWRRIx2WqFO5GlKav0f94vzpz131FR0zcWHcmksFsSZpn9nHKTBVCg2epdTPPg9t5sC7Q1gcfvOcBPFH5dvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=Zhji+Fru; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=zCuCf5AQ; arc=pass smtp.client-ip=85.215.255.120
ARC-Seal: i=1; a=rsa-sha256; t=1783749744; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=PR1nHFc/QTqY+8hJVt2n1XSc8RSndpL3dJcVeJbTVYupGbSxEx8+IdKq0jW851lDMy
    Fb1OL1qYyjm0rry27iYDx9oVVr8WJnH+FGZOEfp10EKfLPK08+y2D7arl+tOfsWuyiHM
    MuKxA1uEbFgRTmC+NKcZiX9ujqAzDf633fe9IbE8lAJnk8oyn2NCUP5L65LcSHBFb7tp
    LTIzJ3aMk84+yc2Qsiw6ll+fFzZiXGjyv3Fv4Fxri4VduNcOI9pUX4soGBjusB8E3jLF
    BjlczD38d/LpCsHCoAOa9i3Kx3birvPMIFhJu3zTukod8E0rasrztihvczZIJskOec1B
    j4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749744;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=hz7dWutT/qhmVRNalsYplqBc+0PlAjZb59MfOBNTMdM=;
    b=B55AYc3/CiWoSmm0ewOMOylZKiox5tJZ8moAzxu1QA1GxA3jlJL7N4AeHBmi+WEUfv
    0G03dm8zIi43QpfwfO4q1XBsT9NNYsYFTwkKNjp8QFaN3XDdyYO0TUmj33vvPzwmlx0e
    RHuwcAEQVIW43CZ7v1Ctdo+IbGaFDH1ff+5ibVwjjh0DEINqNw+hvrk7OUyUw0qgIiGR
    4bc6h9D4teQ5MMIudFPdAgJAiuYHb3Tgob5Okp1FmgN/XFizAiCA3lonc583jKPssjwk
    /eyvrQlsIxw0EWMJTS5mNMj4r0ts/V+EdreNDaffHhsVQQNVenJBF1KDwuA5IRAXdMbU
    NVgg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749744;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=hz7dWutT/qhmVRNalsYplqBc+0PlAjZb59MfOBNTMdM=;
    b=Zhji+FruYjtrExERO7SrSZF2ktV6BXHMG6nFLQw6JxfER1ygmuRuKHQ8W4GWjh8vrU
    sZLSgQy7qmu4CU3KTW2L/JgZ1+wzgoI8W3r8xSqIkKZK31vghaSHjMRWAP86FcUopR3r
    uptdedwaZu9HcOgEgoYTUxQny1XML+MsoOkX69rG6xD6O1a1ZMibAdn8alk/PypHD9AD
    gJqcbXhcnoAUkI/ifROQtV/IMzkebsvdvuFGP0vn9B3ywlkeLtwfe69zqlKa3CG1qaWb
    oG3g5Dgss/7Lxsu2iJIzU4y96cCXnYeZhtOwqWMZA6ckg6FWxrnSaGvlBgOVCPvWyVJV
    +zZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783749744;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=hz7dWutT/qhmVRNalsYplqBc+0PlAjZb59MfOBNTMdM=;
    b=zCuCf5AQ74RZRR3454ckpV2ZuySuLSyvn2wqrvlKki4HgJirIrNwTdc7KDvLkpElY7
    T1I+KXo3MgT3AXba0YDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrT35oLmciNszeF4HOToVDOd6S1gdjuILE2MKVd"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426B62MGhy
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Jul 2026 08:02:22 +0200 (CEST)
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
Subject: [PATCH 13/16] arm: dts: omap3pandora: create new DT node for the sound card
Date: Sat, 11 Jul 2026 08:02:00 +0200
Message-ID: <e21be70f6ac6691c4a42808693215ed2f58eace2.1783749722.git.hns@goldelico.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-7927-lists,linux-fbdev=lfdr.de];
	DKIM_TRACE(0.00)[goldelico.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hns@goldelico.com,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,riseup.net:email,gmx.de:email,goldelico.com:from_mime,goldelico.com:email,goldelico.com:mid,goldelico.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C249274081E

From: Stefan Leichter <sle85276@gmx.de>

This means that the sound card driver (snd-soc-omap3pandora) will get
loaded by default.

To make this work, we also add dac pcm1773-codec and widgets and
routing as needed.

Signed-off-by: Stefan Leichter <sle85276@gmx.de>
Signed-off-by: Grond <grond66@riseup.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../dts/ti/omap/omap3-pandora-common.dtsi     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
index de9860526b323..13821d926afb0 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
@@ -47,6 +47,45 @@ dac: pcm1773-codec {
 		vcc-supply = <&vsim>;
 		enable-gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>; /* GPIO 118 */
 		status = "okay";
+		#sound-dai-cells = <0>;
+	};
+
+	twl_audio_clk: twl-audio-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12288000>;
+		clock-output-names = "clk256fs";
+	};
+
+	sound: sound {
+		compatible = "openpandora,omap3pandora-sound";
+		status = "okay";
+
+		label = "OpenPandora";
+
+		amp-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		amp-supply = <&regen>;
+
+		widgets =
+			"Line", "Line Out",
+			"Line", "Line In",
+			"Headphone", "Headphone Jack",
+			"Microphone", "Mic (internal)",
+			"Microphone", "Mic (external)";
+
+		routing =
+			"PCM1773 DAC", "APLL Enable",
+			"Headphone Amplifier", "PCM1773 DAC",
+			"Line Out", "PCM1773 DAC",
+			"Headphone Jack", "Headphone Amplifier",
+			"AUXL", "Line In",
+			"AUXR", "Line In",
+			"MAINMIC", "Mic (internal)",
+			"Mic (internal)", "Mic Bias 1",
+			"SUBMIC", "Mic (external)",
+			"Mic (external)", "Mic Bias 2";
+
+		sound-dai = <&mcbsp2>, <&dac>;
 	};
 
 	gpio-leds {
@@ -724,6 +763,9 @@ &mcbsp1 {
 /* audio DAC */
 &mcbsp2 {
 	status = "okay";
+	#sound-dai-cells = <0>;
+	clocks = <&mcbsp2_fck>, <&mcbsp2_ick>;
+	clock-names = "fck", "ick";
 };
 
 /* bluetooth */
-- 
2.50.1 (Apple Git-155)


