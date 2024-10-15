Return-Path: <linux-fbdev+bounces-3289-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CAC99EE6F
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Oct 2024 15:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F24B71C22328
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Oct 2024 13:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBC01D9580;
	Tue, 15 Oct 2024 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Tg5f/99k"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368A51C07D1
	for <linux-fbdev@vger.kernel.org>; Tue, 15 Oct 2024 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729000605; cv=none; b=mpyJTXcecCQbHvOf7dnsYnEU37feHlFfUMDLFImFK45BaPbPjOnrfYBI9KhzMpxAWcMihdDxs4A5YbDIzbt8s6LlKiWESNvG4nB/bsDX8tYFXqE8Ob2MMDvYoDCYN57qrxTcQqiyfDOCMrl+bvyueR1AVagq8WufM/nnXR/+vUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729000605; c=relaxed/simple;
	bh=uZ2pSOh9N6nTo2PEopWYoEeymPnCeCw1H9WWOEjHy2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c3D3F9B5XUEQlCB0MAyQZqAvVjq+lI+O8WLlkroRGW1KJWBomKAjx6uN94BoWouOyODGvKM9y5DhUUMFsYx4UhQApJw/57VQJHyl8Lzj9ukqX35ia2yTU23jBeixcBtqcp61Mj+PoRAh1v6/6FqctK4BzhpofKSnEpdGnLlQPAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Tg5f/99k; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so138815e9.2
        for <linux-fbdev@vger.kernel.org>; Tue, 15 Oct 2024 06:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729000598; x=1729605398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJkoc7szlimqyMQJgePkSS4lTZknGS38dNO7gXkpUxw=;
        b=Tg5f/99kNkVyXfRHUjF2JhNAV+sfP0rjxu9OjyHaIKCqMNuiobZ8wdeFuh6lJpt7HU
         mozgA3uQrE7nK9Ex7Umw61s6ZRrOAxoOA43/n8TT0LzT9U5JRrC774PWxSBogakOmsgD
         MDYYfX7fitZiI2YsU7P+ZeeeWk0AWpb5g5WpkhtBrPBTZlyHdDvBTnl1+UVMdsdfjP2x
         M9BY8ZUQgPIy9AWksAlnn8nm25TvijcQMWWCpo3oSKe0RIKqfXKrL497QbAKz8hm7ezR
         60XhKTL6KoI0yfAKSH6yCIgam1j1WTfdCQbTUoBAT6yuPiXbivmhSvAlQg8We2Pey1nY
         RWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729000598; x=1729605398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJkoc7szlimqyMQJgePkSS4lTZknGS38dNO7gXkpUxw=;
        b=RaakJtJArXdqEq6nfGEM9NFOmqJg94aEyG7UW2Pw4G1eVd4Gmn+sLNgeiREMb5buJ4
         tjyBQ22bLHztpSlW4L6z8PsYuHqdymIe4xDQOSmNR2ytlMY6XYHwjlGMKlTSdgao4OJv
         IcafqWFv2KqPuYYy/kB92If41Th+qwNSkjp4b94UgjTJertAnazMtgLhuS800YWDXPBc
         4vhsrJYVsCNMi11CMS/5+2yCQiOUZWWWJCNXnMKrrjYm7EVqxUHVhGMmad3rwv6wkk2H
         vdhYplm+Ql9iYriB9vdm7hWtMZ0ndXg7YtwpVCF1XgYo4P0rfi62KuGleRrMOlseibAm
         2QYg==
X-Forwarded-Encrypted: i=1; AJvYcCXe4YKgp+6zjgGS1UaM4eWzBkO1XsEFkscz2kXidyDJ7iG5kTk2WyHRkBM3W4fkjlWhggoMWVqGRUkMKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7oUiaubZEcxJwUTCGEDOugbA1Bq2sHk1gV3k6ozdB4dGDWo9O
	WRsb6yrelDWXaP4/sfSCGeQ5fwuy8NfHahLmqPoEQvzg1eUZnqHz4+qr/tbpt6c=
X-Google-Smtp-Source: AGHT+IFwOCTrywXB0QcFfLY+XmaKsVWO+N4uVfWKhbTeRvLtRpMFfy9+T2dkUs0peGyWd4u8tgUFeQ==
X-Received: by 2002:a05:600c:470e:b0:42c:acb0:dda5 with SMTP id 5b1f17b1804b1-4311dea3c39mr140415695e9.1.1729000597711;
        Tue, 15 Oct 2024 06:56:37 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f56f241sm18848295e9.22.2024.10.15.06.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 06:56:37 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Date: Tue, 15 Oct 2024 13:56:19 +0000
Subject: [PATCH v5 6/8] iio: adc: ad7606: Introduce num_adc_channels
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-ad7606_add_iio_backend_support-v5-6-654faf1ae08c@baylibre.com>
References: <20241015-ad7606_add_iio_backend_support-v5-0-654faf1ae08c@baylibre.com>
In-Reply-To: <20241015-ad7606_add_iio_backend_support-v5-0-654faf1ae08c@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 aardelean@baylibre.com, dlechner@baylibre.com, jstephan@baylibre.com, 
 nuno.sa@analog.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Guillaume Stols <gstols@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729000592; l=4668;
 i=gstols@baylibre.com; s=20240417; h=from:subject:message-id;
 bh=uZ2pSOh9N6nTo2PEopWYoEeymPnCeCw1H9WWOEjHy2g=;
 b=pEAYRdFvNOGUcjukNeAiOazcKbbUJKD1EV/IyNMmcyetlet1IX2S25VhmWxsV5eq8ocW407kN
 aDx558QbhtqDpu5sBbH9q0GtaZBFdXv5XxKm9TsM7Nm4BXqcTkXCfmL
X-Developer-Key: i=gstols@baylibre.com; a=ed25519;
 pk=XvMm5WHuV67sGYOJZqIYzXndbaJOlNd8Q6li6vnb4Cs=

This variable determines how many hardware channels has the chip,
oppositely to the num_channels that can contain more channels, e.g a
timestamp channel in our case. Introducing this variable avoids
decreasing the former num_channels variable when reading the ADC's
channels, and clarifies a bit the code.

Reviewed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
 drivers/iio/adc/ad7606.c | 10 +++++++++-
 drivers/iio/adc/ad7606.h |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index 72e0864ba9e4..34d377e9ac79 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -150,6 +150,7 @@ static int ad7606_16bit_chan_scale_setup(struct ad7606_state *st,
 const struct ad7606_chip_info ad7605_4_info = {
 	.channels = ad7605_channels,
 	.name = "ad7605-4",
+	.num_adc_channels = 4,
 	.num_channels = 5,
 	.scale_setup_cb = ad7606_16bit_chan_scale_setup,
 };
@@ -158,6 +159,7 @@ EXPORT_SYMBOL_NS_GPL(ad7605_4_info, IIO_AD7606);
 const struct ad7606_chip_info ad7606_8_info = {
 	.channels = ad7606_channels_16bit,
 	.name = "ad7606-8",
+	.num_adc_channels = 8,
 	.num_channels = 9,
 	.oversampling_avail = ad7606_oversampling_avail,
 	.oversampling_num = ARRAY_SIZE(ad7606_oversampling_avail),
@@ -168,6 +170,7 @@ EXPORT_SYMBOL_NS_GPL(ad7606_8_info, IIO_AD7606);
 const struct ad7606_chip_info ad7606_6_info = {
 	.channels = ad7606_channels_16bit,
 	.name = "ad7606-6",
+	.num_adc_channels = 6,
 	.num_channels = 7,
 	.oversampling_avail = ad7606_oversampling_avail,
 	.oversampling_num = ARRAY_SIZE(ad7606_oversampling_avail),
@@ -178,6 +181,7 @@ EXPORT_SYMBOL_NS_GPL(ad7606_6_info, IIO_AD7606);
 const struct ad7606_chip_info ad7606_4_info = {
 	.channels = ad7606_channels_16bit,
 	.name = "ad7606-4",
+	.num_adc_channels = 4,
 	.num_channels = 5,
 	.oversampling_avail = ad7606_oversampling_avail,
 	.oversampling_num = ARRAY_SIZE(ad7606_oversampling_avail),
@@ -188,6 +192,7 @@ EXPORT_SYMBOL_NS_GPL(ad7606_4_info, IIO_AD7606);
 const struct ad7606_chip_info ad7606b_info = {
 	.channels = ad7606_channels_16bit,
 	.name = "ad7606b",
+	.num_adc_channels = 8,
 	.num_channels = 9,
 	.oversampling_avail = ad7606_oversampling_avail,
 	.oversampling_num = ARRAY_SIZE(ad7606_oversampling_avail),
@@ -198,6 +203,7 @@ EXPORT_SYMBOL_NS_GPL(ad7606b_info, IIO_AD7606);
 const struct ad7606_chip_info ad7606c_16_info = {
 	.channels = ad7606_channels_16bit,
 	.name = "ad7606c16",
+	.num_adc_channels = 8,
 	.num_channels = 9,
 	.oversampling_avail = ad7606_oversampling_avail,
 	.oversampling_num = ARRAY_SIZE(ad7606_oversampling_avail),
@@ -208,6 +214,7 @@ EXPORT_SYMBOL_NS_GPL(ad7606c_16_info, IIO_AD7606);
 const struct ad7606_chip_info ad7606c_18_info = {
 	.channels = ad7606_channels_18bit,
 	.name = "ad7606c18",
+	.num_adc_channels = 8,
 	.num_channels = 9,
 	.oversampling_avail = ad7606_oversampling_avail,
 	.oversampling_num = ARRAY_SIZE(ad7606_oversampling_avail),
@@ -219,6 +226,7 @@ const struct ad7606_chip_info ad7616_info = {
 	.channels = ad7616_channels,
 	.init_delay_ms = 15,
 	.name = "ad7616",
+	.num_adc_channels = 16,
 	.num_channels = 17,
 	.oversampling_avail = ad7616_oversampling_avail,
 	.oversampling_num = ARRAY_SIZE(ad7616_oversampling_avail),
@@ -519,7 +527,7 @@ static int ad7606_set_sampling_freq(struct ad7606_state *st, unsigned long freq)
 
 static int ad7606_read_samples(struct ad7606_state *st)
 {
-	unsigned int num = st->chip_info->num_channels - 1;
+	unsigned int num = st->chip_info->num_adc_channels;
 
 	return st->bops->read_block(st->dev, num, &st->data);
 }
diff --git a/drivers/iio/adc/ad7606.h b/drivers/iio/adc/ad7606.h
index d401d3ab37e0..b26a11b2eba1 100644
--- a/drivers/iio/adc/ad7606.h
+++ b/drivers/iio/adc/ad7606.h
@@ -71,6 +71,7 @@ typedef int (*ad7606_scale_setup_cb_t)(struct ad7606_state *st,
  * @channels:		channel specification
  * @name		device name
  * @num_channels:	number of channels
+ * @num_adc_channels	the number of channels the ADC actually inputs.
  * @scale_setup_cb:	callback to setup the scales for each channel
  * @oversampling_avail	pointer to the array which stores the available
  *			oversampling ratios.
@@ -82,6 +83,7 @@ typedef int (*ad7606_scale_setup_cb_t)(struct ad7606_state *st,
 struct ad7606_chip_info {
 	const struct iio_chan_spec	*channels;
 	const char			*name;
+	unsigned int			num_adc_channels;
 	unsigned int			num_channels;
 	ad7606_scale_setup_cb_t		scale_setup_cb;
 	const unsigned int		*oversampling_avail;

-- 
2.34.1


