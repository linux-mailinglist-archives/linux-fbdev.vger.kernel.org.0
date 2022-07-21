Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB0557CF10
	for <lists+linux-fbdev@lfdr.de>; Thu, 21 Jul 2022 17:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbiGUPck (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 21 Jul 2022 11:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbiGUPcQ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 21 Jul 2022 11:32:16 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5AF820EE
        for <linux-fbdev@vger.kernel.org>; Thu, 21 Jul 2022 08:32:15 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id r14so2266844ljp.2
        for <linux-fbdev@vger.kernel.org>; Thu, 21 Jul 2022 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EQ3a4s4qAEwtcohIu8tm1jnBQEyD7eezvu0seYsojDk=;
        b=pikqJKQKDc80pZvt5GG9B/77j9Vze0u0SHT/M63SdP85NaV/WJhfiWUx/O1iwBo1Zs
         51WywlGFpQWGed8kGkk3jy3hRIlYyF6bMoDMzVFESaPihCyv2oGnsZBrm+fYFQQUvEfI
         8SERir7uPVpgDr1aUxZpdzczhbLYBol8OzA6bkZU1Q4mIQjwb2Wno1DEK6jwYIdYnX3s
         a7ZnCdCjHAjyZ8H5kdIxU1KB2fF5E+C2gKb1LQV8HYp2F5BTeFLPaSMuW8NDUaoIGUuS
         eJ0tKfWVX9DsAu/i2o+lGMU/UooKmEoL+XO1TwpEoziUCJ/CUbB4nG9nYzyj0wOLRrVO
         aDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EQ3a4s4qAEwtcohIu8tm1jnBQEyD7eezvu0seYsojDk=;
        b=5LwxWHrFXTKL9DH7eowb9MKQkx9dc8TtYVa5V92I45D+PT4LK/hQhX21JeC67TpsFh
         iZG9gEZwjzAx4yHMHI8UChbckXbDB7ELB4R+NS9ionQQUR5ASt7p8h8GF0RaRQYTNNTV
         G8fXtGW//Tb2LkCge/kRbXna1PpaEuCPxVaHvE/MG+jqo380Vh+ibhjn1cGU53bGvqjV
         /w0QEHKH/ijJZWc9gr2r/YD5xLbBLXBXgx8YL0Nufa9ymCloVT0TqKqo85QY+xtsAWhS
         jCiDmKkTHj3av26nqR+anRJMdq5PYOyJh4KDubgGJTFhl8XSfUA4AxN4ZSNvGqo8GKVr
         VjPg==
X-Gm-Message-State: AJIora8pm1KiRN2IDgu7PVQ0ZrnwLCEarudNu4h2rLuZ+PxNssunl8nR
        Afvy8I4iAJJydEnAODWt3nHc7w==
X-Google-Smtp-Source: AGRyM1tu65CRx5q05gwHKFNcvSCCItevg0NuGLpkWKa4yuq3GQbnJvL5P0DuUjKl3ITIfcyOAD7U5g==
X-Received: by 2002:a2e:164b:0:b0:25d:eb67:7161 with SMTP id 11-20020a2e164b000000b0025deb677161mr256507ljw.70.1658417531893;
        Thu, 21 Jul 2022 08:32:11 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id a27-20020ac25e7b000000b0048a2995772asm504604lfr.73.2022.07.21.08.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 08:32:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Markuss Broks <markuss.broks@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Alexandru Tachici <alexandru.tachici@analog.com>,
        Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Cosmin Tanislav <cosmin.tanislav@analog.com>,
        Nishant Malpani <nish.malpani25@gmail.com>,
        Dragos Bogdan <dragos.bogdan@analog.com>,
        Nuno Sa <nuno.sa@analog.com>,
        Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Marek Belisko <marek@goldelico.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Christian Eggers <ceggers@arri.de>,
        Beniamin Bia <beniamin.bia@analog.com>,
        Stefan Popa <stefan.popa@analog.com>,
        Oskar Andero <oskar.andero@gmail.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <martenli@axis.com>,
        Dan Murphy <dmurphy@ti.com>, Sean Nyekjaer <sean@geanix.com>,
        Cristian Pop <cristian.pop@analog.com>,
        Lukas Wunner <lukas@wunner.de>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Matheus Tavares <matheus.bernardino@usp.br>,
        Sankar Velliangiri <navin@linumiz.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Stefan Wahren <stefan.wahren@in-tech.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-fbdev@vger.kernel.org, netdev@vger.kernel.org,
        linux-spi@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/6] dt-bindings: eeprom: at25: explicitly list SPI CPHA and CPOL
Date:   Thu, 21 Jul 2022 17:31:51 +0200
Message-Id: <20220721153155.245336-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721153155.245336-1-krzysztof.kozlowski@linaro.org>
References: <20220721153155.245336-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The spi-cpha and spi-cpol properties are device specific and should be
accepted only if device really needs them.  Explicitly list them in
device bindings in preparation of their removal from generic
spi-peripheral-props.yaml schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/eeprom/at25.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at25.yaml b/Documentation/devicetree/bindings/eeprom/at25.yaml
index fbf99e346966..64666624b6aa 100644
--- a/Documentation/devicetree/bindings/eeprom/at25.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at25.yaml
@@ -65,9 +65,15 @@ properties:
       For 9 bits, the MSB of the address is sent as bit 3 of the instruction
       byte, before the address byte.
 
-  spi-cpha: true
+  spi-cpha:
+    type: boolean
+    description:
+      The device requires shifted clock phase (CPHA) mode.
 
-  spi-cpol: true
+  spi-cpol:
+    type: boolean
+    description:
+      The device requires inverse clock polarity (CPOL) mode.
 
   read-only:
     description:
-- 
2.34.1

