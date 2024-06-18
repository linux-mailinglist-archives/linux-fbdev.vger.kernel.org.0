Return-Path: <linux-fbdev+bounces-2566-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CB290D4D6
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jun 2024 16:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FD7F28D80C
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jun 2024 14:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2DE1AB912;
	Tue, 18 Jun 2024 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3d+5culG"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3864D16EB46
	for <linux-fbdev@vger.kernel.org>; Tue, 18 Jun 2024 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718719360; cv=none; b=fZBejQFOid5rIM1tp97/cjCFLriZBjxdchc5szRhTY8lMyUxqXNk5xmJQXe43YvLcZEXwRf/pMEKnEEjXbazTChCpNdEg7gVgZle85GMX7MHr+3GtSVHA0visAyYFxloRYwZf5FuNyseojfTCdCGQKigDjvlNOZ4aTyM5N6dw20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718719360; c=relaxed/simple;
	bh=AeL4Pk19lY57evpSum6bOchrffJafZiZaW5AICh7VeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcWXEVPeKGx0ix4Wv8ZC6GRn0SZhZQyuoO15pBFWoGXc9coCEMJAqtrXVWsTDvYp9CGtPGJS89COiiv1hQfjovMb17uRNvW4A2bww/MfpAGz97Wj5UKDbYtLxbzS0px3csBVsNDiMN0DA5K5mYrV8OkR3WXy7Z7pAIZVKbdmmuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3d+5culG; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c8ddc2b29so5944556e87.3
        for <linux-fbdev@vger.kernel.org>; Tue, 18 Jun 2024 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718719356; x=1719324156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SeP0fiD+XkWTbLmWwucHAiPV/yHkLPDQUL8k4EXkjc=;
        b=3d+5culGlVfvKz6fRwxst8suLhL5+V+rh7bisVfjUh2Rd1KBP74kxaXWvPEYWydgi6
         30hiHcXFgBFPoyK65kb5y0nYsoviaFPs5aDZ7XXFhgBVkFsMlJdXr/b4PpXa0htnmmDF
         FIQOHJNng+W4sZrlmtjB5rzIHVq0GjljaCsQ1PrCWztkpaA44v6+Y4dH5I7V7cefdWYb
         dC5hMyxhqYUarHd7QGiIi5sKOz5pQO3izOtOcP9+OYR2PKS96xzJkRi9qG2Z17QFpS9i
         dQym1nWHGWvTgFBtEmnHjIucu+6DBzund11WhuAl3MsnH0EYKXOmKYAUNhPOy3qlrG8i
         bl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718719356; x=1719324156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SeP0fiD+XkWTbLmWwucHAiPV/yHkLPDQUL8k4EXkjc=;
        b=f9VQcAVKlYDlrD4OzvBEVivg/M1/P7U+FTXzcR2MQMEn0GKSwt4K79VXAdzHMXUGXp
         OMSeV2jJ9uCsxgMyYkQT4uj2AKt4efdfpIBP8cY8nw1P+7KKolV3x/jhFWbyTwY5lS81
         VV3QhPQBJ04ym8EmhnNaQ1R+sNlnADLkIyh+pRu5/DYaayUJhqdS0Qs3NGgkKLNem7F4
         vGTa+kiTzul+Q1Lvq5I45EPlnno5VPzkgI1JeC7ADgcu4amEE5zY7RHbr0HJXc5vk/52
         XMznEcLhYvZewHDmCH1zUZ15TOEmshW/8zZzCAq24DVeubLiZvTFemh7esoTEdmcKguj
         6DyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5mi+/dNtdRhzhja7x2MusNDxxfNgor02XRQKJYtR+44ROofKjhT8hHoksE0FFcNj3cW9Q4JN7iAdYZsm8GqZPsJnKY5hI3r5Sr5Y=
X-Gm-Message-State: AOJu0Yy+HJfEYT1sjcPalfmLscEHH5Yj0AGe3nu63vaUjXPTDKFPMMNc
	1C10jrQ2OH/+l9tUO/f2UUFaenkYYmc6egApRVVgc94AgnyLQjVHc1hL2+9JC40=
X-Google-Smtp-Source: AGHT+IEY5B0LzHI9+FwCWaKQXo1GE1Kli8+qybz/4z9W/1TjwNEVska4Fq3q9/R21mxYrGGIzpCLCg==
X-Received: by 2002:a05:6512:280d:b0:52c:adc4:137c with SMTP id 2adb3069b0e04-52cadc414a1mr10544387e87.20.1718719356086;
        Tue, 18 Jun 2024 07:02:36 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f22absm14412546f8f.79.2024.06.18.07.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 07:02:35 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Date: Tue, 18 Jun 2024 14:02:35 +0000
Subject: [PATCH 3/9] dt-bindings: iio: adc: adi,ad7606: improve
 descriptions
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240618-cleanup-ad7606-v1-3-f1854d5c779d@baylibre.com>
References: <20240618-cleanup-ad7606-v1-0-f1854d5c779d@baylibre.com>
In-Reply-To: <20240618-cleanup-ad7606-v1-0-f1854d5c779d@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Beniamin Bia <beniamin.bia@analog.com>, 
 Stefan Popa <stefan.popa@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Guillaume Stols <gstols@baylibre.com>, jstephan@baylibre.com, 
 dlechner@baylibre.com
X-Mailer: b4 0.14.0

Reword a few descriptions, and normalize the text width to 80 characters.

Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    | 61 ++++++++++++----------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 00fdaed11cbd..80866940123c 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -36,64 +36,71 @@ properties:
   avcc-supply: true
 
   interrupts:
+    description:
+      The BUSY pin falling edge indicates that the conversion is over, and thus
+      new data is available.
     maxItems: 1
 
   adi,conversion-start-gpios:
     description:
-      Must be the device tree identifier of the CONVST pin.
-      This logic input is used to initiate conversions on the analog
-      input channels. As the line is active high, it should be marked
-      GPIO_ACTIVE_HIGH.
+      Must be the device tree identifier of the CONVST pin(s). This logic input
+      is used to initiate conversions on the analog input channels. As the line
+      is active high, it should be marked GPIO_ACTIVE_HIGH.
     maxItems: 1
 
   reset-gpios:
     description:
-      Must be the device tree identifier of the RESET pin. If specified,
-      it will be asserted during driver probe. As the line is active high,
-      it should be marked GPIO_ACTIVE_HIGH.
+      Must be the device tree identifier of the RESET pin. If specified, it will
+      be asserted during driver probe. On the AD7606x, as the line is active
+      high, it should be marked GPIO_ACTIVE_HIGH. On the AD7616, as the line is
+      active low, it should be marked GPIO_ACTIVE_LOW.
     maxItems: 1
 
   standby-gpios:
     description:
-      Must be the device tree identifier of the STBY pin. This pin is used
-      to place the AD7606 into one of two power-down modes, Standby mode or
+      Must be the device tree identifier of the STBY pin. This pin is used to
+      place the AD7606 into one of two power-down modes, Standby mode or
       Shutdown mode. As the line is active low, it should be marked
       GPIO_ACTIVE_LOW.
     maxItems: 1
 
   adi,first-data-gpios:
     description:
-      Must be the device tree identifier of the FRSTDATA pin.
-      The FRSTDATA output indicates when the first channel, V1, is
-      being read back on either the parallel, byte or serial interface.
-      As the line is active high, it should be marked GPIO_ACTIVE_HIGH.
+      Must be the device tree identifier of the FRSTDATA pin. The FRSTDATA
+      output indicates when the first channel, V1, is being read back on either
+      the parallel, byte or serial interface. As the line is active
+      high, it should be marked GPIO_ACTIVE_HIGH.
     maxItems: 1
 
   adi,range-gpios:
     description:
-      Must be the device tree identifier of the RANGE pin. The polarity on
-      this pin determines the input range of the analog input channels. If
-      this pin is tied to a logic high, the analog input range is ±10V for
-      all channels. If this pin is tied to a logic low, the analog input range
+      Must be the device tree identifier of the RANGE pin. The state on this
+      pin determines the input range of the analog input channels. If this pin
+      is tied to a logic high, the analog input range is ±10V for all channels.
+      On the AD760X, if this pin is tied to a logic low, the analog input range
       is ±5V for all channels. As the line is active high, it should be marked
-      GPIO_ACTIVE_HIGH.
+      GPIO_ACTIVE_HIGH. On the AD7616, there are 2 pins, and if the 2 pins are
+      tied to a logic high, software mode is enabled, otherwise one of the 3
+      possible range values is selected.
     maxItems: 1
 
   adi,oversampling-ratio-gpios:
     description:
-      Must be the device tree identifier of the over-sampling
-      mode pins. As the line is active high, it should be marked
-      GPIO_ACTIVE_HIGH.
+      Must be the device tree identifier of the over-sampling mode pins. As the
+      line is active high, it should be marked GPIO_ACTIVE_HIGH. On the AD7606X
+      parts that support it, if all 3 pins are tied to a logic high, software
+      mode is enabled.
     maxItems: 3
 
   adi,sw-mode:
     description:
-      Software mode of operation, so far available only for ad7616 and ad7606b.
-      It is enabled when all three oversampling mode pins are connected to
-      high level. The device is configured by the corresponding registers. If the
-      adi,oversampling-ratio-gpios property is defined, then the driver will set the
-      oversampling gpios to high. Otherwise, it is assumed that the pins are hardwired
-      to VDD.
+      Software mode of operation, so far available only for AD7616 and AD7606b.
+      It is enabled when all three oversampling mode pins are connected to high
+      level for the AD7606B, or all two range selection pins are connected to
+      high level for the AD7616. The device is configured by the corresponding
+      registers. If the adi,oversampling-ratio-gpios property is defined, then
+      the driver will set the oversampling gpios to high. Otherwise, it is
+      assumed that the pins are hardwired to VDD.
     type: boolean
 
 required:

-- 
2.34.1


