Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F5E58DBED
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Aug 2022 18:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245031AbiHIQ2G (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 9 Aug 2022 12:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245018AbiHIQ2D (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 9 Aug 2022 12:28:03 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBEA1EEE1
        for <linux-fbdev@vger.kernel.org>; Tue,  9 Aug 2022 09:28:00 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l10so8923186lje.7
        for <linux-fbdev@vger.kernel.org>; Tue, 09 Aug 2022 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvjM538Lt57aPAtY3bjfgbW8emF1tmOhCzp45F4HTBs=;
        b=ICG/3Y0P4RWgA/0Gi/4UlpWVRyTdyma//p23F60dT0+Zmw3VXvEqVGA5ukzEv+cw2t
         PnWHJ99YeOEmlzLjMF9eAACAKuU7E1VvZ8UeYybhftlXIDyduv8eOqYd7Fm+zF+1mXws
         bzmQoxqiwasnz+YqZtVqpfpQacvrfybziWBylA2q9ia2G/5HJiSA+mqhSx4FIBF0yYEK
         b8Xkwbr0Mh61hsjdAUOMku/GiQW51z6ykQ/t9abh5f+VkoRpAP7VfIEEu0R2AAgysp7O
         UA1RmYBz2NzfEidhLjPpQ5vQ3muEqkJ5DE7PX6mVHQuay4bboakfxaxkS5MZB6JEhCuz
         SgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvjM538Lt57aPAtY3bjfgbW8emF1tmOhCzp45F4HTBs=;
        b=WZ2SC9D7kI8blf+XjZOr6SmlJDLCE5TIJ4ySHN/G8teu56BmpZzliJmoZ2NBMpxqXe
         WHuBHU1V4kEHPR51u1UI3cOhNicGjZqW56oJJEQMe9jaWaE+5zsVEz4ga/ibTvGWkzxp
         9fKtv9zdVG1i2inWkKLw0SpyurjNpdLwmk7YR43THH/QLo8lgMgqQPfkNqzWmclTWcl9
         r1ydhxr1gnXd6l/Lno87dhahivkr4AGYBec5W4E6XFG9FkHLeT022VLf0FAGPocdMBdk
         kuw3s/IEJNIEdHZK2/VCq3/X5jk2RYFzHjya7uhqlDLzXwbelHqiNYJCRQ6FpLkbsL4s
         DfOA==
X-Gm-Message-State: ACgBeo26Joj9XEYXBGmgwKwJpmCF9rCzQze00pZEyhTU8i6NB9fZTwfI
        88bK26KNZzk/pnHb2pSRgLCPtg==
X-Google-Smtp-Source: AA6agR4nSP4Nvz03+ppBOMLl8U1WhyjNooB6UiKwR/ZbuBfV0W58Zp1a5YPASidYywxtpOignuTHhw==
X-Received: by 2002:a2e:a884:0:b0:25d:d8a2:d18c with SMTP id m4-20020a2ea884000000b0025dd8a2d18cmr6982978ljq.305.1660062478560;
        Tue, 09 Aug 2022 09:27:58 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id h7-20020ac24d27000000b0048a8c907fe9sm20999lfk.167.2022.08.09.09.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 09:27:57 -0700 (PDT)
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
Subject: [PATCH v2 1/5] dt-bindings: iio: Drop Joachim Eastwood
Date:   Tue,  9 Aug 2022 19:27:48 +0300
Message-Id: <20220809162752.10186-2-krzysztof.kozlowski@linaro.org>
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

Emails to Joachim Eastwood bounce ("552 5.2.2 The email account that you
tried to reach is over quota and inactive.").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml   | 1 -
 Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml b/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
index 7c8f8bdc2333..9c7c66feeffc 100644
--- a/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale MMA7455 and MMA7456 three axis accelerometers
 
 maintainers:
-  - Joachim Eastwood <manabian@gmail.com>
   - Jonathan Cameron <jic23@kernel.org>
 
 description:
diff --git a/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml b/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
index 6404fb73f8ed..43abb300fa3d 100644
--- a/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP LPC1850 ADC bindings
 
 maintainers:
-  - Joachim Eastwood <manabian@gmail.com>
+  - Jonathan Cameron <jic23@kernel.org>
 
 description:
   Supports the ADC found on the LPC1850 SoC.
-- 
2.34.1

