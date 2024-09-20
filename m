Return-Path: <linux-fbdev+bounces-3066-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D05597D93C
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Sep 2024 19:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FBAF1C21F0F
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Sep 2024 17:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DB818594A;
	Fri, 20 Sep 2024 17:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V/Y9T08c"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E3185B62
	for <linux-fbdev@vger.kernel.org>; Fri, 20 Sep 2024 17:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726853619; cv=none; b=NQL56otzb2kq9KnldSv1E+MOBod+oqS+e/OsJMRphnfzJeJ5QBq/Q1Fyr3xMLnbCOhICgBm0Dfdq0vdDqOph2KlJzSXQy2u4ykaqmvlzHcuZWGTvAYpIZFXE7eLajIK+EY+0OqeaW9w8D2E5vr2/hjZhT/jW5d7d0s+hrO+K6ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726853619; c=relaxed/simple;
	bh=/nFr02cbGV/HLOGxoDoh9Czsnmb68Qnp31k+zurckyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mnK99PVN/O+xc7u7VwLd0xq01g9ljZjLIfIb0e1re0pAdtCsoGI4Nq2/1IG0KAGo/3qCFsdaDhRh7FpdrCQXD/roSB1ZJT2qofSpMoLmJg84+zx1K4BGWxBX+dMfSzv7UAFtEkGgcUO5xU/6XfYjxHsZT4jYGmP+j4yvwxlAvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V/Y9T08c; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374bfc395a5so1527039f8f.0
        for <linux-fbdev@vger.kernel.org>; Fri, 20 Sep 2024 10:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726853613; x=1727458413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSBDfGgGhj+08Owjp2Odr5TMI3MgMjV/fjeXUka0zuE=;
        b=V/Y9T08cPMhc00DoLn/dKVageTNNl5YUn6nn/5E3QnAwt1rhp6KF9S4Y+Gz2wt5C4J
         TJG1/4mvb6mYrlVSW+PImgsglqoW8n8D3Wz9U96gm3wVAfuI2G9gCGi8Pym7ZYwp4GCf
         qKbZ8x4zMANbpYaxqFp2epn4fX1a9KZer5qDSvKhzf4TDAmvQNI+2Ho23MtGtKAjECUN
         bKYy/JL69W0EDrYttLMoyV8/oXubs+j8AQg9wh20hfCZmDwldlFFmxjvLOTUzeV8e2AT
         3TkGxXxT08JzWemxFr6wNUSpJCtLn48iFCjVHHxbBwh5LOlUzZNpj0dvhfgdK0Sl5CU6
         Uq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726853613; x=1727458413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSBDfGgGhj+08Owjp2Odr5TMI3MgMjV/fjeXUka0zuE=;
        b=peorKxQi3SIj/H4JxWcxZstHE2rj4l2kwxQGlszR1nM/4MeavmNzFyOXFpPEm6zklc
         Lg9OnvQM/I0ZvxL5Q90HCu2U/M/GakmAjCe9nt/+Uln3SQm5mCs1TCr+lnQxVvWVCzmf
         VL82s1TU29WCxdLDLLux3jcp9QFB75+uSpisiGMheNlvhLDV4h79IT9JaQVQXJ7iZ3+7
         zugZK1aa5yiEporgHQTBo1HncpHDwKjONOwz2O9qMbTU24Hp1/AF9C1FntTtDYfUTrz2
         4fQ1XuWpmydnvZBV+QboaY/T1jv7v4+Z8RVe1f/n5xDpkRMo0P0uLR43YR73uyt/+yoW
         sMFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+dE00EPY92m8dPeXSYWDBMVY3AvyQpDq6tthtKEcA+bABfPUyGZGD+jQjthxVIH9OBu+D0TwJeIGAkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhuezVUH5ZlExW4++WDyDq2ZUPkVFSau39veuNTGA4gLSr+QdG
	8oWE6E3YuBOpy2rTCHmzS6Hx1Ljvy9SdB7gpeNFo7hsQsQrmK8E+f49XfLXp19eIZJSdHMtX3+O
	3
X-Google-Smtp-Source: AGHT+IEWJF7FaPV8re36im0SAhtG4KrdMIbPZb2C+YE25bNWaplfwW1nUF4CAWxtbaKW1RxFFftQEQ==
X-Received: by 2002:a5d:6b47:0:b0:374:c157:a84a with SMTP id ffacd0b85a97d-37a414f4899mr2358317f8f.16.1726853613391;
        Fri, 20 Sep 2024 10:33:33 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780e029sm18111177f8f.116.2024.09.20.10.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 10:33:32 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Date: Fri, 20 Sep 2024 17:33:28 +0000
Subject: [PATCH v2 08/10] iio: adc: ad7606: Fix typo in the driver name
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-ad7606_add_iio_backend_support-v2-8-0e78782ae7d0@baylibre.com>
References: <20240920-ad7606_add_iio_backend_support-v2-0-0e78782ae7d0@baylibre.com>
In-Reply-To: <20240920-ad7606_add_iio_backend_support-v2-0-0e78782ae7d0@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Michal Marek <mmarek@suse.com>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 aardelean@baylibre.com, dlechner@baylibre.com, 
 Guillaume Stols <gstols@baylibre.com>, jstephan@baylibre.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726853604; l=850;
 i=gstols@baylibre.com; s=20240417; h=from:subject:message-id;
 bh=/nFr02cbGV/HLOGxoDoh9Czsnmb68Qnp31k+zurckyM=;
 b=pNTsUJlZfFEP/HO0ji9WkgAo+v4qOc4w20bUCtoLmxrAZu6+aGumyRnqR5haGad0FgtIzazpL
 3Kis6U4Z6eJBUUizWeNa3B/95tWRh354UGbF1pqBN+QQ7zvLmdoRwDV
X-Developer-Key: i=gstols@baylibre.com; a=ed25519;
 pk=XvMm5WHuV67sGYOJZqIYzXndbaJOlNd8Q6li6vnb4Cs=

The parallel driver's name is ad7606_par and not ad7606_parallel.

Fixes: 0046a46a8f93 ("staging/ad7606: Actually build the interface modules")

Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
 drivers/iio/adc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 97ece1a4b7e3..4ab1a3092d88 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -229,7 +229,7 @@ config AD7606_IFACE_PARALLEL
 	  ad7605-4, ad7606, ad7606-6, ad7606-4 analog to digital converters (ADC).
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called ad7606_parallel.
+	  module will be called ad7606_par.
 
 config AD7606_IFACE_SPI
 	tristate "Analog Devices AD7606 ADC driver with spi interface support"

-- 
2.34.1


