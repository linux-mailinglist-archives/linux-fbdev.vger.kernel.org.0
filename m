Return-Path: <linux-fbdev+bounces-3282-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2779099EE4A
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Oct 2024 15:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59FB91C22153
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Oct 2024 13:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B581B219A;
	Tue, 15 Oct 2024 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bkwCbjO2"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776AD1AF0B6
	for <linux-fbdev@vger.kernel.org>; Tue, 15 Oct 2024 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729000598; cv=none; b=jjy9CUutGkdLKdNKUy1ECWfQmPxHKseb3Yl5VxCatc/Maug0VGfTp+40RdbJzffPoLPQYb2xbqyQGvwuGm45o5M0+Vs2qfyyuwQOGX1kvkJo/BEBoPuBB6kpmhz6FpDB651ml8FLlCl1N2wG74glZAdDI08PJfnlfAsg7sQCAxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729000598; c=relaxed/simple;
	bh=i5ddTg9UYKxycz6OdhvhiiZOyT6VwY+Z1+h88aZcdf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iCHOqV++fI21bgicyPg7RgQiRIP9mFWj1yMHAyU2jswDGmAFR4yozOCDCj7JyrWyaPMi3JMoRYpuwK77FgFO0HssiwizdXo70xzuII5q7V8HRgGS423hOiSzAj7zSnXT8p5UBbnc7m9iRWZpSKOJZTKV4m4h0Ndt1F0kz28rrr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bkwCbjO2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4311fd48032so29518445e9.0
        for <linux-fbdev@vger.kernel.org>; Tue, 15 Oct 2024 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729000594; x=1729605394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h90tf0LvnuADZLFwaf8lb54SaNEZPrEuE8XroohvsMM=;
        b=bkwCbjO22u16KPEhUyXuD5Ti6+jDiCI14G213A3xPUH5RSEYU4RdBF5XO47JYPQweJ
         4vxHfGP10jmGV9L4kH77d6SnXVIecg+VRRlKXX5Z4x02/N2R0xQ6kBPy8bb8H7Y8ovkP
         6/WSpcV436FO4ZEfe995ypH//abPAJOIK9asyyF6h36Ju+6d2lNW8hwb717kAfeXceYL
         t+iDG7l0/0VS3tNImaPim7XNXh5Jw2QbiiBBPeLJw6rB05mDal72yKkM5PJ7FrfsUHGG
         zhK9fK/JCOvLqfBbQ5WjmqSV8AOqFMICjvkUuFl1s2J4K0KRPvFB8qmrPbrB6PcPnveI
         7U9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729000594; x=1729605394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h90tf0LvnuADZLFwaf8lb54SaNEZPrEuE8XroohvsMM=;
        b=YtWwzmZVCMWHs/OELswx9+/tkLH/QTbyyGr4c9YeHSbAGt0vbrPV1xYjRv/+kS+1kA
         Fi3dlTS8cgruvLmA9OJW3IOeP9gsZDXOf3Cm4gHlt71VvdiDO2rovFBxRAngONvjTvxA
         MhGh4K7PB0VEh3prE1YMPE88zN3Wq+5QO7M+dHWmAjEIf4Ak1KV5r5rKCxkULuAAFqnb
         5DCoqwZJrsLUAi+cONkLgbb7f2VW9aOsljW7kdmTmbCLt9RJLxIJm8Nvhj1GXKBdJ999
         a/FTWvCrLOheM5b9WtOgIGxa1y1IrcD64GQ/GxZQkoFNU+SSExa0OadnxVzFjy6RgMjn
         8z+A==
X-Forwarded-Encrypted: i=1; AJvYcCWUvBn/g+5jK5e9psMDJJ4+8iJC6TCXfqNFtFjZsE0vgcaeEeXyTdXi2BBE7+gZnW7qdXwFCmpnjt4rEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDB1MbwPPEpjmIrUttj4AGENDRNnl0eAL3xOojnBF13z2bfCAQ
	7O7qtVrleMCy+rwZ2+n0AL4heVxRc2gGqLEcj2qhu7YUJC34qglWOOfP9YFoVeg=
X-Google-Smtp-Source: AGHT+IHhf+9ITq2oLXri+liuyT6Hpb/e08PVQU+OeunYvA4yXrRxB3L9+6EuNBga9KUv0f7mcCsjBw==
X-Received: by 2002:a05:600c:a55:b0:426:5e91:3920 with SMTP id 5b1f17b1804b1-4314a38454cmr5238565e9.29.1729000593672;
        Tue, 15 Oct 2024 06:56:33 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f56f241sm18848295e9.22.2024.10.15.06.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 06:56:33 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Date: Tue, 15 Oct 2024 13:56:14 +0000
Subject: [PATCH v5 1/8] dt-bindings: iio: adc: ad7606: Remove spi-cpha from
 required
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-ad7606_add_iio_backend_support-v5-1-654faf1ae08c@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729000592; l=2087;
 i=gstols@baylibre.com; s=20240417; h=from:subject:message-id;
 bh=i5ddTg9UYKxycz6OdhvhiiZOyT6VwY+Z1+h88aZcdf0=;
 b=llTDacqfiNiCfSV52+gxL6/KFEr/5JuV2k/zG3dq92qjaNDLxjZdNcY8PXfrKtsnYXPOlGj9J
 ACXaSkeJvUyCc2TpHBuXbitb1XHdWP2ebfTQRuoxa50grZfa4nvyjqv
X-Developer-Key: i=gstols@baylibre.com; a=ed25519;
 pk=XvMm5WHuV67sGYOJZqIYzXndbaJOlNd8Q6li6vnb4Cs=

The documentation is erroneously stating that spi-cpha is required, and
the example is erroneously setting both spi-cpol and spi-cpha. According
to the datasheet, only cpol should be set.

On zedboard for instance, setting the devicetree as in the example will
simply not work.

Fixes: 416f882c3b40 ("dt-bindings: iio: adc: Migrate AD7606 documentation to yaml")
Fixes: 6e33a125df66 ("dt-bindings: iio: adc: Add docs for AD7606 ADC")
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


