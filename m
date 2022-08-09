Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9E5658DC03
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Aug 2022 18:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245095AbiHIQ2a (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 9 Aug 2022 12:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245019AbiHIQ2Q (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 9 Aug 2022 12:28:16 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1664A1EEC9
        for <linux-fbdev@vger.kernel.org>; Tue,  9 Aug 2022 09:28:04 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id bx38so13487239ljb.10
        for <linux-fbdev@vger.kernel.org>; Tue, 09 Aug 2022 09:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ga227+XjHKmXNlFWhnddLRopISEjRlyyZsIFo+W6TcM=;
        b=mlu+D/EMEEHlsnta+8nZjM0nCqo+gd1HvEXHMt62Z74w1o2AtTP5JFxw1CnAN20pZY
         EZY2VFYMSQKXzeuEjiLr4a4LIrZFNY4ixXvQ8oL5W5qXYH85nDxeu7eC3zrpD42akHek
         S5HLu5bSfKgpIMSZt0NhyyJ6x6ImIkXMnNwmmh+7zACr/8GLxQ6DzxUpLCKILO2NlVIL
         dgho7fuH5A8ok9nIND+dcEl7PIhUCaWKrffwPlHp2XrsXFSyGZuSPF1DGrwDqNXFEJMS
         MoIKDpYb1wMhceALamx0BueFXHlzlWdu0ZS4LY67cpbz8X1jbsg2KJ2awajWOldBSgbG
         upNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ga227+XjHKmXNlFWhnddLRopISEjRlyyZsIFo+W6TcM=;
        b=V6u9MxryFFy2yRoxF0LBiP+M0HDMnNgjtLyAVlZVy5ZLRnxKar96SXNseeOqizLLqC
         gD3v40pXXfyiHtxs1DP7Q+Chk5PDdFnSSuJidANfZvjD29cD4kOd2jjZnEK70cZyPZnc
         O4sbO8LbMcLw1/wp5MHpBmtZSCP0tvOhFAev69GP9UPiQH6MC4M5Vv/HdLlXwkztIKVk
         +ArAGZYQV2ZTPGEHXrHnrFqCzkGtgTN7KULX1EVoD3ccyiXm18DTjo7uplDnfvemjHiN
         g6EgIqC1x8E5AEdbCfDpYIC83HUbbyomG/w3k6Jq0lcxRKHQ2t9uyOt+hOz2c/i+kyfR
         Y1Rw==
X-Gm-Message-State: ACgBeo2u5yjxgmb+DdT48fubwL6ihqIWIfELmzulyu01sG39X8hs08s9
        xnllAbfYhko7nHl1DPDtBU9psQ==
X-Google-Smtp-Source: AA6agR68t7e6d0SYEAm2VxRd0F+y6tYKyy/R418cX2x3f087AlM7cpFl57QIeo13lmkWFE5jzF41Gw==
X-Received: by 2002:a2e:7804:0:b0:25e:5b54:74ae with SMTP id t4-20020a2e7804000000b0025e5b5474aemr7133252ljc.173.1660062481891;
        Tue, 09 Aug 2022 09:28:01 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id h7-20020ac24d27000000b0048a8c907fe9sm20999lfk.167.2022.08.09.09.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 09:28:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Pavel Machek <pavel@ucw.cz>,
        Tim Harvey <tharvey@gateworks.com>, Lee Jones <lee@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Andrew Davis <afd@ti.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org,
        alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 3/5] dt-bindings: Drop Beniamin Bia and Stefan Popa
Date:   Tue,  9 Aug 2022 19:27:50 +0300
Message-Id: <20220809162752.10186-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
References: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Emails to Beniamin Bia and Stefan Popa bounce ("550 5.1.10
RESOLVER.ADR.RecipientNotFound; Recipient not found by SMTP address
lookup").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml       | 1 -
 Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml    | 2 +-
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml      | 3 +--
 .../devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml        | 1 -
 4 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml b/Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml
index 154bee851139..d794deb08bb7 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml
@@ -8,7 +8,6 @@ title: Analog Devices ADM1177 Hot Swap Controller and Digital Power Monitor
 
 maintainers:
   - Michael Hennerich <michael.hennerich@analog.com>
-  - Beniamin Bia <beniamin.bia@analog.com>
 
 description: |
   Analog Devices ADM1177 Hot Swap Controller and Digital Power Monitor
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
index 31ffa275f5fa..b97559f23b3a 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Analog Devices AD7091R5 4-Channel 12-Bit ADC
 
 maintainers:
-  - Beniamin Bia <beniamin.bia@analog.com>
+  - Michael Hennerich <michael.hennerich@analog.com>
 
 description: |
   Analog Devices AD7091R5 4-Channel 12-Bit ADC
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 73775174cf57..516fc24d3346 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -7,8 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Analog Devices AD7606 Simultaneous Sampling ADC
 
 maintainers:
-  - Beniamin Bia <beniamin.bia@analog.com>
-  - Stefan Popa <stefan.popa@analog.com>
+  - Michael Hennerich <michael.hennerich@analog.com>
 
 description: |
   Analog Devices AD7606 Simultaneous Sampling ADC
diff --git a/Documentation/devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml b/Documentation/devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml
index a557761d8016..9fda56fa49c3 100644
--- a/Documentation/devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml
+++ b/Documentation/devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml
@@ -8,7 +8,6 @@ title: HMC425A 6-bit Digital Step Attenuator
 
 maintainers:
   - Michael Hennerich <michael.hennerich@analog.com>
-  - Beniamin Bia <beniamin.bia@analog.com>
 
 description: |
   Digital Step Attenuator IIO device with gpio interface.
-- 
2.34.1

