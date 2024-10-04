Return-Path: <linux-fbdev+bounces-3203-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AEE99119E
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Oct 2024 23:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF2C9B222D8
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Oct 2024 21:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D331C878E;
	Fri,  4 Oct 2024 21:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KHbKMBzO"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2391B4F0C
	for <linux-fbdev@vger.kernel.org>; Fri,  4 Oct 2024 21:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728078533; cv=none; b=iBecghfy/ha+NgCeyBdUOW7CsA30iu/Pe/hnJTZ2uBur1vJEIb3ktnzWCTPnjtSEPi60n4b2Uuu70tHnH3o5zfWCWz6lQTtDL91czKG+1VTY2UoV0IqwlfO4zWao/GtlOUX0N0COQsQHmmlLoGjTVbz+XEezmVvJPFBjfi//SDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728078533; c=relaxed/simple;
	bh=dW6NuJWAL0tnqJGgsGPu8j1VoVP4zCeNUzqvDunBNqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FC2N22bH0FIXrO877NVjT1gEkQ6r8Ng1J9WLay+O4TZa7IhScqvsRPYPulybI7/SimDeeNn8IXPbxFyNjurHtVi0SEKy1rzyFmeci9v7dVw59XHhy9mCG9crwRoZUTK8f4jVny94j0Eub+gHKXkS7t8RA0ZDGjtNdVFXmIUDxww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KHbKMBzO; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5398d171fa2so3190284e87.0
        for <linux-fbdev@vger.kernel.org>; Fri, 04 Oct 2024 14:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728078529; x=1728683329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zi1jIhrpiRkiS4x4FePba+v93fkZAzTXFTnvV0Q7SJI=;
        b=KHbKMBzOUkxinDQspNRqlLP9ZOOyfi6oFUC0tlAEzXGYDRRq9n2lJ3pAfBu6DymGB1
         2fJmYNG21/XX3Whkxuf1dPcmVe925V4lEjK5oOht8EIc5v5HFqhhbSITVVR8co/cdPZB
         nfeeSQhgaC4OZDQSgNVaZclcAwfZj/9U8Jh2TXw6zJKjOGI0yezjV2s1bdp9ZhqP3NXo
         aGlc7KsarJFeJQBlFoB7LlsBjTcrekddx5p2Hh88YZrKlaKjIn1xg/rKCO1hI+8waQ5C
         cpZWAY71bFDxtjCwCG42HEJ46s9wJW9l0xokQkG/q4shKIpFb2bMQosgnwtk+dYS20Sn
         p49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728078529; x=1728683329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zi1jIhrpiRkiS4x4FePba+v93fkZAzTXFTnvV0Q7SJI=;
        b=lHegFF+IWLZBdOZGWHYlggs8zpt0DQJfnyLGdeksKKZ+EJDwIa8V3LZXJNdxeQCuP4
         QLW/R/Q2GHuPTPXHfBvHj+zun/EfYuPhFCYsseV1YjU+u9R73sqSBAcGSuZ3xEkeTbwk
         gBCXuq8CTakUam65vYHmuc+SlJGfCLLhC026CJjzoojDf1v3gMbtpyBKDO/f7A7dvogU
         ELu6yIZ77ZRlKHvF5ZTlV44WocVwUFpHxwFCqjQCqZJFqzKacmoLP1yEYUQUyXYhNrDr
         K9LxZaAdC+EOIKX3uhGpr40epKaT+vuY0nKT/14p+antSHGhttKhpoB4Zn4gKgKfQzBi
         oc+A==
X-Forwarded-Encrypted: i=1; AJvYcCWoaRYKvFqRd5VuILaSMTupuQWgaKyW4yc0phk17OCLwBuGdpeq13g8IMN6DJ+8tS0tON8zaOM7FYxmjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWUW1CCNVTfjdV78fKHehpFfQAxY8DKnaK5NM60dwK24nb7Nhg
	UDkVAp09auAGKkZULP5e2YYyozxlIg3SN0syylPPGOMsWSV95sUaXDUAkocWUGs=
X-Google-Smtp-Source: AGHT+IG9vKnlCyYpJNJyXVcqaNvjMhM227pXj314Ws0xBmbWWcURKzDXKJu6hWgq+z1B4KbbgtI7zg==
X-Received: by 2002:a05:6512:3090:b0:52c:e1cd:39b7 with SMTP id 2adb3069b0e04-539ab85be3fmr2837875e87.5.1728078528670;
        Fri, 04 Oct 2024 14:48:48 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b4ab63sm24680375e9.40.2024.10.04.14.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:48:47 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Date: Fri, 04 Oct 2024 21:48:36 +0000
Subject: [PATCH v3 02/10] dt-bindings: iio: adc: ad7606: Remove spi-cpha
 from required
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ad7606_add_iio_backend_support-v3-2-38757012ce82@baylibre.com>
References: <20241004-ad7606_add_iio_backend_support-v3-0-38757012ce82@baylibre.com>
In-Reply-To: <20241004-ad7606_add_iio_backend_support-v3-0-38757012ce82@baylibre.com>
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
 aardelean@baylibre.com, dlechner@baylibre.com, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Guillaume Stols <gstols@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728078523; l=2037;
 i=gstols@baylibre.com; s=20240417; h=from:subject:message-id;
 bh=dW6NuJWAL0tnqJGgsGPu8j1VoVP4zCeNUzqvDunBNqs=;
 b=1JBVnXogi8Y6VmRN4ENJTNsSU2nRs5+Y+Xu9FQStSslUOMfRP19G/XBoT+HQFyDiYJCMz/qD8
 NFHk3dWGBGUD1Y8O56KBx8G/wlK2ECH14DN83u6ihheoy5zIGdM+Ejb
X-Developer-Key: i=gstols@baylibre.com; a=ed25519;
 pk=XvMm5WHuV67sGYOJZqIYzXndbaJOlNd8Q6li6vnb4Cs=

The documentation is erroneously stating that spi-cpha is required, and
the example is erroneously setting both spi-cpol and spi-cpha. According
to the datasheet, only cpol should be set.

On zedboard for instance, setting the devicetree as in the example will
simply not work.

Fixes: 416f882c3b40 ("dt-bindings: iio: adc: Migrate AD7606 documentation to yaml")
Fixes: 6e33a125df66 ("dt-bindings: iio: adc: Add docs for AD7606 ADC")
Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index bec7cfba52a7..47081c79a1cf 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -39,6 +39,11 @@ properties:
   "#size-cells":
     const: 0
 
+  # According to the datasheet, "Data is clocked in from SDI on the falling
+  # edge of SCLK, while data is clocked out on DOUTA on the rising edge of
+  # SCLK".  Also, even if not stated textually in the datasheet, it is made
+  # clear on the diagrams that sclk idles at high.  Subsequently, in case SPI
+  # interface is used, the correct way is to only set spi-cpol.
   spi-cpha: true
 
   spi-cpol: true
@@ -168,7 +173,6 @@ patternProperties:
 required:
   - compatible
   - reg
-  - spi-cpha
   - avcc-supply
   - vdrive-supply
   - interrupts
@@ -255,7 +259,6 @@ examples:
             reg = <0>;
             spi-max-frequency = <1000000>;
             spi-cpol;
-            spi-cpha;
 
             avcc-supply = <&adc_vref>;
             vdrive-supply = <&vdd_supply>;
@@ -288,7 +291,6 @@ examples:
 
             spi-max-frequency = <1000000>;
             spi-cpol;
-            spi-cpha;
 
             avcc-supply = <&adc_vref>;
             vdrive-supply = <&vdd_supply>;

-- 
2.34.1


