Return-Path: <linux-fbdev+bounces-7642-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 52IIL3VUMmrOygUAu9opvQ
	(envelope-from <linux-fbdev+bounces-7642-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 17 Jun 2026 10:01:57 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BC76975E9
	for <lists+linux-fbdev@lfdr.de>; Wed, 17 Jun 2026 10:01:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UQK9yjFt;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7642-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7642-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B1FE300D374
	for <lists+linux-fbdev@lfdr.de>; Wed, 17 Jun 2026 08:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCD23D5676;
	Wed, 17 Jun 2026 08:01:02 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4103CF21C
	for <linux-fbdev@vger.kernel.org>; Wed, 17 Jun 2026 08:00:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683261; cv=none; b=ZERDlGU040Z9wI1Lym0cAUFXeG+Sxj/kHdAJ/f2Rh53nDVPRJ9o72s5SA5g285Bl+yp8JuZHipuVNSFF75OfXGoEiix53h8UjVcC/WF4CKn1mEz00SHqWHrQS510jcQkhsrTqwfS2FST4DpD2EXdkFizILN0BDHibrXfjXWRGik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683261; c=relaxed/simple;
	bh=EErEa+xTvRrMlTfCICTBeucwWtahnLN9Dg/ExT+D1y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITFJ73jSEP3xNuPVHr+ZrNatWI3JEkllqPBkSm7IQOWRzeZSvUfuiM/HeQg4vztyZ1dWQWunPb/GAhv1aLI6uIrokSTsnmC3RCEze0clFF+h5YQnpvvWdOY8ZhpuTDBRbTCU1bui4/6B99pQDm3q+r8aTks9/YtiWk/lNUguZkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQK9yjFt; arc=none smtp.client-ip=209.85.218.43
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bec429c2bb1so784992466b.1
        for <linux-fbdev@vger.kernel.org>; Wed, 17 Jun 2026 01:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683251; x=1782288051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zcYkBqsgtm7crDvyj+FVJGVI8rwwbt6ayEuo6Ql52s=;
        b=UQK9yjFt9W/l/gnodv7PROtIDTvHGJKgOXovy2Cy15yiDA6YO2lmeVtIL5lGz2h26j
         YkGPTwFA9NeYqU5TWWS/8iTmZ4WbCSWWTeEvYBAYRG2OPh7yuvtEJ7A7vLobt+LoDttI
         6MQbCmriupTGKgkRvOkvCz2DF0K/SKHRCmaL1WjkKUj1kklGXeS6SQUys5S0/ZUS0Nou
         kbFpIHQsdMiV6qfUitY9/cBvIVLVRKnNWLr6mCjYa4sTDcjT7f8Rk8G+zhb1P0YlqbSD
         peIct/+llBU1722YeW+RecV7siZ25vV0kaV3nRWXrg8NQGC7wom+cow1IYLOhAPNNQ9V
         frLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683251; x=1782288051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0zcYkBqsgtm7crDvyj+FVJGVI8rwwbt6ayEuo6Ql52s=;
        b=DqwXJjisuCK6a3qAk+qgsy596x5mPpl84Mw48gQV/7qU8xH5euViGQCrNXg5pt5LYw
         94Jub3CYtXu625gyVYogimO/9494oZimgSiOoB+u2Z5vIyV/THnvPNsK6iGnGYylDc/l
         /vlrlacahkyfsQNPkBSRsQRrXhepJZKZ+WvMXdqK3PQZCWCQHPEFS2kRuxFV9QS8RfRr
         jGplKHRyiZNKjxDmYrW+6u2veOAv61ohqiTuQWhXjJJUB3W1GKMXoEanSjosdf7zPIj8
         K47gTqFAi/Y9L7bYMc2ZiHayCTqGm2NDmLWnbuFuUH/BEjTpNdFF28rPNTBvMYLLT9/v
         o0xw==
X-Forwarded-Encrypted: i=1; AFNElJ9oWuUwvuePUyAbtiF1OulB6zVGaJulfrEyFZcip3k5zWtISsGkjbK8wFIvDrdSDmy77cVrneL9scFfMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm6+L4rwzIC9Di2SkXgFFGQr/HdI4iDG42T3cIDrlOvPTNsN2P
	4RKk6tpJtlXpeTutClxkvqd9Zb14SymmjDvnKUm9D6OIh5PoCwEOCXLOHVBF5vGW
X-Gm-Gg: Acq92OHgrDr12b0JaSZVUQNYTDJG9UDDcE5A61DM1ccPaVCrNyoQiWdO7stXvx7ZES6
	3b4soY/coMYYlgjXSLzh3fTGSXqNC3xSC/RyhLu2cA4WyKKtnKtUksw+xycYvraRj3jDvctC+zM
	3kP/oT3TDG+Q+kq6WedbliWvO61ogR7B2IWqHckWaHPIOxhcLmHCDg7IxvqY53iFFHrywMb2yK3
	lHBXynFzh9quG5a2E2rin0o8rxgQEHccVHVCrB0lfAyQemxHfFJnOLE9/Pa+XRlxfVEHyhM3N07
	oofaoRSgYu179XP7nM/xNT06DzC63JFPBExe8FPxi2J6R9AAFsuvyXj4UMDMjgP4qF10BTiP+9E
	u8uJYOkmcW0r0JFfd1Tgj+RuMpO/1GCU2ZBrxF8HK+rs6cVL50LK/sdAS7f8veW7oi8DKG0hyP9
	SNdg==
X-Received: by 2002:a17:906:9fca:b0:c03:b8c6:cc27 with SMTP id a640c23a62f3a-c05a6bded8bmr163827566b.24.1781683249238;
        Wed, 17 Jun 2026 01:00:49 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 05/14] iio: light: lm3533-als: Remove redundant pdata helpers
Date: Wed, 17 Jun 2026 11:00:22 +0300
Message-ID: <20260617080031.99156-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617080031.99156-1-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7642-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:clamor95@gmail.com,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61BC76975E9

The lm3533_als_set_input_mode() and lm3533_als_set_resistor() functions
are used only in lm3533_als_setup(). Incorporate their code into
lm3533_als_setup() directly to simplify driver readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/lm3533-als.c | 56 ++++++++++------------------------
 1 file changed, 16 insertions(+), 40 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index a9af8e2b965f..69bac1b202f1 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -708,55 +708,31 @@ static const struct attribute_group lm3533_als_attribute_group = {
 	.attrs = lm3533_als_attributes
 };
 
-static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mode)
+static int lm3533_als_setup(struct lm3533_als *als,
+			    const struct lm3533_als_platform_data *pdata)
 {
+	struct device *dev = &als->pdev->dev;
 	int ret;
 
 	ret = regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
-				 LM3533_ALS_INPUT_MODE_MASK, pwm_mode);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set input mode %d\n",
-								pwm_mode);
-		return ret;
-	}
-
-	return 0;
-}
+				 LM3533_ALS_INPUT_MODE_MASK, pdata->pwm_mode);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
+				     pdata->pwm_mode);
 
-static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
-{
-	int ret;
+	/* Bail out when in PWM-mode */
+	if (pdata->pwm_mode)
+		return 0;
 
-	if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RESISTOR_MAX) {
-		dev_err(&als->pdev->dev, "invalid resistor value\n");
-		return -EINVAL;
-	}
+	if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
+	    pdata->r_select > LM3533_ALS_RESISTOR_MAX)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid resistor value\n");
 
 	ret = regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
-			   val);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set resistor\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static int lm3533_als_setup(struct lm3533_als *als,
-			    const struct lm3533_als_platform_data *pdata)
-{
-	int ret;
-
-	ret = lm3533_als_set_input_mode(als, pdata->pwm_mode);
+			   pdata->r_select);
 	if (ret)
-		return ret;
-
-	/* ALS input is always high impedance in PWM-mode. */
-	if (!pdata->pwm_mode) {
-		ret = lm3533_als_set_resistor(als, pdata->r_select);
-		if (ret)
-			return ret;
-	}
+		return dev_err_probe(dev, ret, "failed to set resistor\n");
 
 	return 0;
 }
-- 
2.53.0


