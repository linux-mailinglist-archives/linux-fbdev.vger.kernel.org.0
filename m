Return-Path: <linux-fbdev+bounces-2658-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7003F924670
	for <lists+linux-fbdev@lfdr.de>; Tue,  2 Jul 2024 19:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 939A51C22D6A
	for <lists+linux-fbdev@lfdr.de>; Tue,  2 Jul 2024 17:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944B31CB307;
	Tue,  2 Jul 2024 17:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Tb2/hbh2"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448C71C007E
	for <linux-fbdev@vger.kernel.org>; Tue,  2 Jul 2024 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719941654; cv=none; b=ZR9g3zhwGYslIUuAKzFo16JW7qK6B3Rfm5PNjEVQntDFwF0lvZZIIpyTPlC6to7MsK7JiM1oHZrQrmCPd2WLueApen7asa+7xifBZOB60SPlR6a0bZevAF42hQIY96l/GGD7+TGFFV5TTEMyqMFQDRP3FpvcghLMWmrYT85rXUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719941654; c=relaxed/simple;
	bh=/LA/tVbUGREpux3rwFNrtFexWvYIFIQqHifGylYOE7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RPjmzcjhXHS1U1Peu4k5+cWZJpH0L5HKm6QXRkjIewiCxn+uOcyqyBdEqwtIzsOA1si+wr7ztRNpvl64QjnGk8an7/QlfCJZGNU+pPHtRTK4Ae27gBGQ7y74cvbgSrFvkbVCQ5Ja2ATKkxxeAZ5oujw78d/uvVSwvAaR7/+Vd78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Tb2/hbh2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-425814992aeso17037435e9.1
        for <linux-fbdev@vger.kernel.org>; Tue, 02 Jul 2024 10:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719941649; x=1720546449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlOMVM0Oi/I1G5ABSh4CvVIoiZHYlhaelZAr8Gl3RX4=;
        b=Tb2/hbh25bo/t5+n3AURyKbt8RCGLirlj9Dzhx3WRbY6Rf+9SPAc3FH73mXmDXjc0r
         oecveLKmgKuQw/9hNnyGi3S8L3W5Pl1wLMFYIssGi0QiqdTx/Sd2nib8Fx1In2mmZEsX
         sTf/I2R1uYfqUD5y8rktm73lE4yBU30TQmo7sEO8s5TYZH1Uwb4+5dzNJ8sMd4RwXGcq
         l9+7mQd1CAiNBGxZjte/NKmjepAXvKOk6Zv2biaaN7SQyReGZnQENMVNFAWySePshDyN
         GC7BBHxwts+6IJ5bqdtKCMMLLyNhx3yziQS5JJQ/Qk5WIGRSX6YvxjfehsrHOQ5BqcMW
         VatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719941649; x=1720546449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlOMVM0Oi/I1G5ABSh4CvVIoiZHYlhaelZAr8Gl3RX4=;
        b=KijwKOBFyVTdFKUTX6yDLhWJZJP6f4v1fvXG7dEVEqKH9lnSt9/iGNeM+X55E6H+zm
         zXRubs+5N7gxnVRM2flAlPm/QN0lZ2W8AJrzW0buAYCeJGNdsLrEQOBlmsSWLr+LZD4K
         osjyTqMrSwXd4B2EWMJw+uPjGI/8EblPzRC/EpvPpqy4po6RdzXjCJc7V8gvyZ6AV9Pq
         6jHYkEoMPsBom6sGcwuxTNaz3fxIcdd091hxb1Mqt2M/819EnC/LrK8tjHobrcGWdZpp
         ujoNke7sG/ve6lVuu3SV8Dk9YA3RqTP9jXwA3KPZjlL7kGFt8Cc5eOk0nhD26pCF60NJ
         pTBA==
X-Forwarded-Encrypted: i=1; AJvYcCUGsXEMztAcE5KDew4RjL7io3ThdCmvGYXJx+EMvfxu4cuM08Lhv440GQAsn8zLHAPJxaDzg/cs6aa+iH9Uv9V1YAZGNbsHRXlqd78=
X-Gm-Message-State: AOJu0YyntfKC9LULFSDjXDRL3RghU1ocxht5fZyHzAzz4sG7BqbdMFx1
	PMVxBPqfJxWpy8OiAUk0mkQTDeqOpGYiPhAsUIGy1qqEwfb+nDYa+9SnezVUHoU=
X-Google-Smtp-Source: AGHT+IE7S6mRIdq/pwCzKBcD26Jq2dW/C6XfGEiQgs8D7NweKQh0I45uV18IHCqTsOFz+vvMfcxK8A==
X-Received: by 2002:a05:600c:3542:b0:425:77ad:93cb with SMTP id 5b1f17b1804b1-4257a009c1cmr61212815e9.2.1719941649375;
        Tue, 02 Jul 2024 10:34:09 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af59732sm207594485e9.11.2024.07.02.10.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 10:34:09 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Date: Tue, 02 Jul 2024 17:34:09 +0000
Subject: [PATCH v3 5/8] dt-bindings: iio: adc: adi,ad7606: add conditions
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240702-cleanup-ad7606-v3-5-57fd02a4e2aa@baylibre.com>
References: <20240702-cleanup-ad7606-v3-0-57fd02a4e2aa@baylibre.com>
In-Reply-To: <20240702-cleanup-ad7606-v3-0-57fd02a4e2aa@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Guillaume Stols <gstols@baylibre.com>, jstephan@baylibre.com, 
 dlechner@baylibre.com, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0

Since the driver supports several parts that present differences in
their layout and behaviour, it is necessary to describe the differences
from one chip to another.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    | 60 +++++++++++++++++++---
 1 file changed, 54 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 499b6ad5525a..69408cae3db9 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -52,10 +52,11 @@ properties:
 
   adi,conversion-start-gpios:
     description:
-      Must be the device tree identifier of the CONVST pin. This logic input is
-      used to initiate conversions on the analog input channels. As the line is
-      active high, it should be marked GPIO_ACTIVE_HIGH.
-    maxItems: 1
+      Must be the device tree identifier of the CONVST pin(s). This logic input
+      is used to initiate conversions on the analog input channels. As the line
+      is active high, it should be marked GPIO_ACTIVE_HIGH.
+    minItems: 1
+    maxItems: 2
 
   reset-gpios:
     description:
@@ -88,8 +89,11 @@ properties:
       is tied to a logic high, the analog input range is ±10V for all channels.
       On the AD760X, if this pin is tied to a logic low, the analog input range
       is ±5V for all channels. As the line is active high, it should be marked
-      GPIO_ACTIVE_HIGH.
-    maxItems: 1
+      GPIO_ACTIVE_HIGH. On the AD7616, there are 2 pins, and if the 2 pins are
+      tied to a logic high, software mode is enabled, otherwise one of the 3
+      possible range values is selected.
+    minItems: 1
+    maxItems: 2
 
   adi,oversampling-ratio-gpios:
     description:
@@ -122,6 +126,50 @@ required:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: adi,ad7616
+    then:
+      properties:
+        adi,first-data-gpios: false
+        standby-gpios: false
+        adi,range-gpios:
+          maxItems: 2
+    else:
+      properties:
+        adi,range-gpios:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,ad7605-4
+              - adi,ad7616
+    then:
+      properties:
+        adi,oversampling-ratio-gpios: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,ad7605-4
+              - adi,ad7606-4
+              - adi,ad7606-6
+              - adi,ad7606-8
+    then:
+      properties:
+        adi,sw-mode: false
+    else:
+      properties:
+        adi,conversion-start-gpios:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


