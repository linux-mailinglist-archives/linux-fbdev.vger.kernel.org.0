Return-Path: <linux-fbdev+bounces-7471-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLtEOjOmHWr5cgkAu9opvQ
	(envelope-from <linux-fbdev+bounces-7471-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 01 Jun 2026 17:33:07 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C27621CED
	for <lists+linux-fbdev@lfdr.de>; Mon, 01 Jun 2026 17:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2D9D30E32F7
	for <lists+linux-fbdev@lfdr.de>; Mon,  1 Jun 2026 15:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A033DDDA2;
	Mon,  1 Jun 2026 15:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez3BPqnQ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D8C3DD875
	for <linux-fbdev@vger.kernel.org>; Mon,  1 Jun 2026 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327169; cv=none; b=GPWVX+3VqZJhp1wIDGFS/g4/gEHHM77Di9pn3VGtddmW2QvEKfXmb9R83dBFC1isTvnm6rr3FJPEKLitw6z6VanShABA3VZEUuGu2tifmoAZFizjUx1R8tEKoHPtkDcblg02/SM8gUdgQr7T4m6WV7e6/iWeg7f53y3tpLQTNig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327169; c=relaxed/simple;
	bh=S8Y/SLmqiOO5N/roCezf9U+wAzAxng5Uw10f73gGxPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqSi7zjJBStW/EbKT8AJwWWE3PgDO1v3ZBAlaLrOoXNpV7hGDi8W9dsHXS1eug9pfzeNM3r2q1kl2tplMqIUoZI/bBUoU3I1QkiR7fL2ADKu0A59C/McNatBEkYCOZD3e28bIljTH0D1kem3Lbk5m1H9lOjt8Bm7vVgN5T6PaQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez3BPqnQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45eedc94d37so2038913f8f.3
        for <linux-fbdev@vger.kernel.org>; Mon, 01 Jun 2026 08:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327151; x=1780931951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMbWeeGe7TfgpPAVjQgWggP+Fym0ITJZjA/DygAtKOs=;
        b=ez3BPqnQg6HprkBZSv6xqhsXTAShRms5YEHj4EaMCgbYcbWvGXfZUTUmqmUQte3P4b
         nPA8+O1jPMuHQp/QQm9dUIyUORq45UXNKBxrkJ6My5DWTT8x7wg9GCZwml6Qdy4bpBE0
         YMgRlxbmfH38ctG9mgfNrYKTSeKOFwqjfON8ih0tbbrT6RsysRZkkEHGEfQ5rCPaAvKq
         eI0JJRWbFRv/dOAYZxVVQXwuF3SvUZ+yv4IgvjQjFo+AGstLGO5ZNfNnbNwMdJcnv8fY
         FCjQbKE9j1PAzBSKMlrrj/GXDW8onJB1MT7O2keqxEBh7r7RCI3tzHSxKrb+hD2eQKfS
         OWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327151; x=1780931951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nMbWeeGe7TfgpPAVjQgWggP+Fym0ITJZjA/DygAtKOs=;
        b=lTbZNv/cNNve7ZnpzNNiVYUdysCMPz3GZ7HynwnW074MMvTgb2r2pYufiPZXKa6Q9Z
         h06auJbpOpxFit+PzLedyeX1uqsF9G8m8YG2QEb9ez16KFHa4M9RJ6BmPEemjHzpccWr
         Txfx1hvybqpSsz/orzkU4Td3o5LKDwKuGg7KMYFAbZ9A9uFkrmLGKhSROC4AQfSasJpL
         Kr7R2JV5l1r7qO1o9fGg1noOlx/S8aoDrSYJDxzNTi7aE3dwD8Eciazzo9jbmi32Oivo
         ETg9udIGp3/pJhflEdDb23wwyKrgPwYRdfQbbos/Y797dPeo1A5bRbKnmwj/0jBAktU7
         yjyA==
X-Forwarded-Encrypted: i=1; AFNElJ+IqrJVkIYugcCMSuPAw+Zb/90ethkDrY7YjvFTgLyjczQcMd5fLtU1gJXw80TyG6/tydY4YkSB80RrCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOAvuGgcgX8rOltn4P1vRcZsPAcBxMhfp6TftCLSjT2TQ9sBFM
	cn+1VrMhHi8cz2nvKW2O7tsLuA9K5RpNfuB5NFw69/hwXqC9DVoXaBhp
X-Gm-Gg: Acq92OFpSBITPfCpUxK2k50ZQaQ8YlMQlJBg7ux40eybVOqCTGmadpxTKZGkldciRro
	Nabnu9zc2FpIk3Ksxj6g8TDbj+481No2ivmdS2+r22mIDYC2H+iAno5EKlny75FKX8cNWT4IoSR
	7GsyhlSmAEHApiDm8g48NioUYxFvdLBb031P5xytabfu9de5sKD67Rg2sto/toJUxX7WRJi7c7E
	CimC/E2ipUPXyvoWyHpfZwCbKqJFMRcfZUN3+HNmwC1xQlFjWUKk5fxrDRb7RRMmGm0+mgITDQo
	1tYjQa4NFNdwh1fZToPsr5N0tkDxwj9jmZZiwv6z8YzGZgC/DncUmwXLwgD2+6llTQcCdm16V2l
	ac2RfxiLu2CqaPUKAip3hZrjet6hRX0bZP8VTv/CVD3Ceu7D4AyK8DfqskPamCByk8L8bxVVpUK
	ymOy6YHmZLVduyAjrW8XMpui8=
X-Received: by 2002:adf:f190:0:b0:44f:9b70:2996 with SMTP id ffacd0b85a97d-45ef6b4f4f5mr15476481f8f.21.1780327151236;
        Mon, 01 Jun 2026 08:19:11 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:10 -0700 (PDT)
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
Subject: [PATCH v3 09/11] video: backlight: lm3533_bl: Set initial mapping mode from DT
Date: Mon,  1 Jun 2026 18:18:29 +0300
Message-ID: <20260601151831.76350-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260601151831.76350-1-clamor95@gmail.com>
References: <20260601151831.76350-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7471-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 56C27621CED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support to obtain the initial mapping mode from DT instead of leaving
it unconfigured.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/lm3533_bl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 36e6f027613a..f0d88b7bc229 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -34,6 +34,7 @@ struct lm3533_bl {
 
 	u32 max_current;
 	u32 pwm;
+	bool linear;
 };
 
 
@@ -247,8 +248,15 @@ static struct attribute_group lm3533_bl_attribute_group = {
 
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
+	int id = lm3533_bl_get_ctrlbank_id(bl);
 	int ret;
 
+	ret = regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+				 CTRLBANK_AB_BCONF_MODE(id),
+				 bl->linear ? CTRLBANK_AB_BCONF_MODE(id) : 0);
+	if (ret)
+		return ret;
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -299,6 +307,9 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	device_property_read_u32(&pdev->dev, "default-brightness",
 				 &props.brightness);
 
+	bl->linear = device_property_read_bool(&pdev->dev,
+					       "ti,linear-mapping-mode");
+
 	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
 					    bl, &lm3533_bl_ops, &props);
 	if (IS_ERR(bd)) {
-- 
2.51.0


