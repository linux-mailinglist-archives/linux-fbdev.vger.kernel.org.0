Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3D5658C6E3
	for <lists+linux-fbdev@lfdr.de>; Mon,  8 Aug 2022 12:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242712AbiHHKrx (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 8 Aug 2022 06:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242684AbiHHKru (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 8 Aug 2022 06:47:50 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164DF13D07
        for <linux-fbdev@vger.kernel.org>; Mon,  8 Aug 2022 03:47:48 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bq11so12084911lfb.5
        for <linux-fbdev@vger.kernel.org>; Mon, 08 Aug 2022 03:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WAcb2UIHnzQWc+7wJXO7+t1zm0MYd48VFY89RfjXd90=;
        b=pZ5n4LsUBuRfPUkslmcaCk2lyPkUqZyTC3GWr4dCq4OQhzI2yFphVsu0x+mjWy8fZw
         UIsmWZYgMFr9Yo+y/H67qdsq9admU3xUHWPwbiGxpLJTqpj7syYu3bHYvDKQBqxv1lQ/
         zwGG8xpqoab03LUU6cXmLLzRjm5EJl/y/z4KAHXoVfA68w6a+AySxuiMRh0q9utI2nfY
         h7sZyPEQwg+KnK+U7ITd4kryslnHn1NAXGj3Ib6yOHzncgujAx+CICo/SBYUeqRAfpEq
         igdQhXtZc7CNdOE9/5MzuJe6z4xR4AvvhTeCIDUczl3v3IUhqL7T2aSQFXnAIlKPk2az
         hSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WAcb2UIHnzQWc+7wJXO7+t1zm0MYd48VFY89RfjXd90=;
        b=b/PNwNsC7bU7SRYbqvT7F/SLc3XfEC95uqyIZVoXlP8e3TiRKF8BKMRv+L3NAgm4cl
         9GTkGE+4OXbYOzINI6bpfmYE79xgEzumwsdZIdQN94bAyQ5SZPy7pxCpxlWR3/qBVLWZ
         m7J+JxSZx4Jc6OD40xcv0V8RuePuFf+NrxCsI/oWMiJ1741fOkbUgWgftOYrjsf5XMGz
         B2B0/VCN9paZVot3N8MrF7tpK0zVX52e/dG18USXi9XkR4lwiV4xDB1OXu2G/peja+z/
         +Brcd5A+ZMaFwevYavAmwZqZRDY5gtCrtHnSnUGVYPuiFCXEjpkY0LKeUmpOO0Zjoz25
         9eGg==
X-Gm-Message-State: ACgBeo2tf+XHg7Qwo3MH1TWQaFnX8jMAxDTM+jgnzNlp/wh677XkCvcu
        zGfUMVcEuS3PkQXBcGT8CJ6wEA==
X-Google-Smtp-Source: AA6agR5EYE1Bofb0M8EdhYNvz7LnouDO56jHt/oH1KxMlhgzj77yT9NZM45q6dvtAj/sMKDOm7VOew==
X-Received: by 2002:ac2:50d2:0:b0:48a:f4fe:3553 with SMTP id h18-20020ac250d2000000b0048af4fe3553mr5797397lfm.248.1659955666064;
        Mon, 08 Aug 2022 03:47:46 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id l18-20020a2ea312000000b0025e040510e7sm1314321lje.74.2022.08.08.03.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 03:47:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Pavel Machek <pavel@ucw.cz>,
        Tim Harvey <tharvey@gateworks.com>,
        Robert Jones <rjones@gateworks.com>,
        Lee Jones <lee@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Ricardo Rivera-Matos <r-rivera-matos@ti.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org,
        alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] dt-bindings: iio: Drop Joachim Eastwood
Date:   Mon,  8 Aug 2022 13:47:08 +0300
Message-Id: <20220808104712.54315-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
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

