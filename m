Return-Path: <linux-fbdev+bounces-3204-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E6199119F
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Oct 2024 23:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53470284CF2
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Oct 2024 21:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27431D89EF;
	Fri,  4 Oct 2024 21:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kYOv5Fgc"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4771B4F18
	for <linux-fbdev@vger.kernel.org>; Fri,  4 Oct 2024 21:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728078533; cv=none; b=t7J9oMFpjlzFioNu1XGlh1Y4yOfemU1sVcr/6fhQxUUOIv/sIKUMF4YNO4Yo/UBgr+rO55YezSS846ozHR07JOmT18COb3J0uSjHeITz7MnKdfTgNc0kGmbqC8qO0dHOfl1NxJDe80XUslfGfzGyPjjhXvKikV29VgAOPk6LIaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728078533; c=relaxed/simple;
	bh=EZV8dwpNecrxaA4gPBjayOFyXxpIgNERPQfdwxT0f2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=npyxYD3GP1Cse5RKWoE3uexmfPgZDHUDwLCXb+gHS85UE2v/KsTygdsQuXd3zWLHsO6HnEcQlfeCLGkLKWVuYfHhBAl9f/0v42G0a222EF1MF4w95p4DAXBiBaSpCOv5QE4xVPNB5HOMwcxq2DeGJ78t35bwjcynIj8CYkrGC7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kYOv5Fgc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso15985965e9.0
        for <linux-fbdev@vger.kernel.org>; Fri, 04 Oct 2024 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728078530; x=1728683330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqWeA0LEyP3743aCtTxENnEYgzsdT+gARkI29iFfPOM=;
        b=kYOv5Fgc5FhUoesPXstC1CzXi0At8wQ1Z7Pk3Gm1TxoWnMFIsprUlYKInvWImmaHef
         9nBGV/B2YDeLyOUQ5V6+RVE1ASA2k6N8ERyLe9RaMC5T1cUK3xqtNMesmSVYKxAwSQjv
         4AfH/dGXBNuXKKra8W5RH1foQSoQfBhZdfLXdk3Y3/m9ylIVTHdvXOSYXGupb00AWuir
         TJTsky+SejqX0N6bf8XZfrulxqbBGJRWCaU2QiTc5lR/PhniIZK9tD6GkPYNI5+3aQ33
         aD3ua8sbeJp7yucti26Xe5rDjc1Z6dobe5pC+n3kuXF0vMEXpWPNZIPrFN510qPMcpeX
         H1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728078530; x=1728683330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqWeA0LEyP3743aCtTxENnEYgzsdT+gARkI29iFfPOM=;
        b=GuF0lAj4/zp51NRTDyM5L3cMcuvaLjPv7QlUKBOh1D/VRn7lRvh2irSbV5V6iuvvOz
         ZJ7NqniErPDNYIyX2zZtPKfDd8+zHprnsfx2KWRLQwUESGjvSwj2JuCPUwdKXTSNQOqS
         FyVYZKBk8ILkxXRdn9+OJxZWLySWbt+zgQAdGjOeiDQ6CJwuhQ7G2ZOhxtOuczlRIc6z
         QOkbk/NeZe5Da9Br6N3WvVX6RpB9oGHwKdBz5orV8BbpuGzdHovZ46wGCd5o0m2O5w84
         eVHw+3TGCBrvLu0Qx/XD5fuRGQR6GuW/3AtYAkTgDeHycdekwBTRq0agdwz24YdabDsE
         HwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT0X/m2SLOqT4lM+Z3nrjlb5tiX5DZ8Io48ER6TlwLa8fX3oeUcHawN1u3fGpFnUBj7flW8kCZ2HSS9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3OPnRH3JWClyRCgfV/UewKPHR2AEojVtYI99SWwgM/PNJ/PB/
	D+f9S/gZi3vusVIO3wp25tJL41hzJh6pOWy23qTWmkFmcrp1f6DPRaLfHEBJLLM=
X-Google-Smtp-Source: AGHT+IFOelcSDljYwTZ3b1CqqshjojVPvrSodxfuXipBb6+t8a3QnlRE/fgX9Pqas+cEy3gWoq5beQ==
X-Received: by 2002:a05:600c:1d1c:b0:42c:b697:a62c with SMTP id 5b1f17b1804b1-42f7df1cffbmr56193625e9.5.1728078529506;
        Fri, 04 Oct 2024 14:48:49 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b4ab63sm24680375e9.40.2024.10.04.14.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:48:49 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Date: Fri, 04 Oct 2024 21:48:37 +0000
Subject: [PATCH v3 03/10] dt-bindings: iio: adc: ad7606: Add iio backend
 bindings
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ad7606_add_iio_backend_support-v3-3-38757012ce82@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728078523; l=3674;
 i=gstols@baylibre.com; s=20240417; h=from:subject:message-id;
 bh=EZV8dwpNecrxaA4gPBjayOFyXxpIgNERPQfdwxT0f2w=;
 b=rhqaKH6XB4tMlodHXcvh1879XCExdjmm3WkwiHwl2vsDT6KX7CZ/tBLm0AlR5QtNKDbHzV2r5
 +j3Czol72YWDFIaM1qiiATSytiRQL1Eu9i8+7JXC5T/EfXecO5OGu//
X-Developer-Key: i=gstols@baylibre.com; a=ed25519;
 pk=XvMm5WHuV67sGYOJZqIYzXndbaJOlNd8Q6li6vnb4Cs=

Add the required properties for iio-backend support, as well as an
example and the conditions to mutually exclude interruption and
conversion trigger with iio-backend.
The iio-backend's function is to controls the communication, and thus the
interruption pin won't be available anymore.
As a consequence, the conversion pin must be controlled externally since
we will miss information about when every single conversion cycle (i.e
conversion + data transfer) ends, hence a PWM is introduced to trigger
the conversions.

Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    | 64 +++++++++++++++++++++-
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 47081c79a1cf..a389cfda824d 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -129,6 +129,29 @@ properties:
       assumed that the pins are hardwired to VDD.
     type: boolean
 
+  pwms:
+    description:
+      In case the conversion is triggered by a PWM instead of a GPIO plugged to
+      the CONVST pin, the PWM must be referenced.
+      The first is the PWM connected to CONVST or CONVST1 for the chips with 2
+      PWM connected to CONVST2 if CONVST2 is available and not shorted to
+      CONVST1.
+    minItems: 1
+    maxItems: 2
+
+  pwm-names:
+    items:
+      - const: convst1
+      - const: convst2
+
+  io-backends:
+    description:
+      A reference to the iio-backend, which is responsible handling the BUSY
+      pin's falling edge and communication.
+      An example of backend can be found at
+      http://analogdevicesinc.github.io/hdl/library/axi_ad7606x/index.html
+
+
 patternProperties:
   "^channel@[1-8]$":
     type: object
@@ -175,12 +198,22 @@ required:
   - reg
   - avcc-supply
   - vdrive-supply
-  - interrupts
-  - adi,conversion-start-gpios
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
+  - oneOf:
+      - required:
+          - adi,conversion-start-gpios
+      - required:
+          - pwms
+
+  - oneOf:
+      - required:
+          - interrupts
+      - required:
+          - io-backends
+
   - if:
       properties:
         compatible:
@@ -222,6 +255,10 @@ allOf:
         adi,sw-mode: false
     else:
       properties:
+        pwms:
+          maxItems: 1
+        pwm-names:
+          maxItems: 1
         adi,conversion-start-gpios:
           maxItems: 1
 
@@ -247,6 +284,29 @@ allOf:
 unevaluatedProperties: false
 
 examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    iio-backend {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        adi_adc@0 {
+            compatible = "adi,ad7606b";
+            reg = <0>;
+            pwms = <&axi_pwm_gen 0 0>;
+
+            avcc-supply = <&adc_vref>;
+            vdrive-supply = <&vdd_supply>;
+
+            reset-gpios = <&gpio0 91 GPIO_ACTIVE_HIGH>;
+            standby-gpios = <&gpio0 90 GPIO_ACTIVE_LOW>;
+            adi,range-gpios = <&gpio0 89 GPIO_ACTIVE_HIGH>;
+            adi,oversampling-ratio-gpios = <&gpio0 88 GPIO_ACTIVE_HIGH
+                                            &gpio0 87 GPIO_ACTIVE_HIGH
+                                            &gpio0 86 GPIO_ACTIVE_HIGH>;
+            io-backends = <&iio_backend>;
+        };
+    };
+
   - |
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>

-- 
2.34.1


