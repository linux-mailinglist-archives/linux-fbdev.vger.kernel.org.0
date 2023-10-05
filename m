Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57DB87BA981
	for <lists+linux-fbdev@lfdr.de>; Thu,  5 Oct 2023 20:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjJESzk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 5 Oct 2023 14:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjJESzj (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 5 Oct 2023 14:55:39 -0400
X-Greylist: delayed 350 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 05 Oct 2023 11:55:38 PDT
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140AC93;
        Thu,  5 Oct 2023 11:55:38 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
        by mx.skole.hr (mx.skole.hr) with ESMTP id 54BB984F75;
        Thu,  5 Oct 2023 20:49:48 +0200 (CEST)
From:   =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date:   Thu, 05 Oct 2023 20:49:08 +0200
Subject: [PATCH 1/2] dt-bindings: backlight: add Kinetic KTD2801 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231005-ktd2801-v1-1-43cd85b0629a@skole.hr>
References: <20231005-ktd2801-v1-0-43cd85b0629a@skole.hr>
In-Reply-To: <20231005-ktd2801-v1-0-43cd85b0629a@skole.hr>
To:     Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Helge Deller <deller@gmx.de>
Cc:     Karel Balej <balejk@matfyz.cz>, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=UdiONCDFn7tSC5O0Vn6kl8sVoN7CSUp9mQWdTvRQG54=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlHwVCfv22qJGXGxy+4xw0vT+90XZOJv8VbwEA1
 upnGjCeI6eJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZR8FQgAKCRCaEZ6wQi2W
 4RKXD/9XfqrqI9hIeLFo4dL2yYC+GvW8XRQw3ij9ldGmH5vDRakMYYgMM3RjG204uN3bQO9yPjJ
 AIZnmONSC6fEjx3EgOBYvhNaa4sxxDsh7LwUvIbQeIQ+eZZVRS6YusOguR3xv+vvr1SJ8UrPGas
 60idqG69zQjXVnoBK3lVlzZKQlBBlyRXyzoBJOgvB+T0s9/jT/2IqEXnS+i6EM7M2+werN3lGo+
 lunZHJmuTmWuOrr1yKi4YaxE5h8uPToiALQdwfuU6TSwcdP0hi92LpAVE4p51KYB74pFKXm1IXQ
 FaIUFk+NmvntQR8P/sGc4CNlN21LmpJ/D6wxIIXxmrmrFYnqOMqJwIvDKhjkAxsJD/sTwEh2A6s
 P/UBNpCfl3iCqAZP//0qZ9EzVfEBrafl0pqlKWkEkY9K1YP8L3uujyxgDMfoHaWvnggeGAEQs9u
 ksij04LIVR1XFIlDtfgx+NZ5sspmDjWKLpXiw/JdMzDAEeZexNnwa0NmZyeiahubRIaXAnvZLy2
 bt0df+oNz7ackb4gSEVOitqw0g5IjN/TZEeJKxobJq3RUg0ErGS7xljASaIqMkaLkVJ3xHrCYJq
 eXsYYDr/sKW8S7VYFNtzeVYfMX01hfx/NxCrCSCVd+WkT7Dby2gzwQMk7zZVHxwFFKWpgjmX6BH
 SU0bAmrwbsBOFag==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Add the dt binding for the Kinetic KTD2801 backlight driver.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 .../bindings/leds/backlight/kinetic,ktd2801.yaml   | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.yaml
new file mode 100644
index 000000000000..970d54bac18e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd2801.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kinetic Technologies KTD2801 one-wire backlight
+
+maintainers:
+  - Duje Mihanović <duje.mihanovic@skole.hr>
+
+description: |
+  The Kinetic Technologies KTD2801 is a LED backlight driver controlled
+  by a single GPIO line. The driver can be controlled with a PWM signal
+  or by pulsing the GPIO line to set the backlight level. This is called
+  "ExpressWire".
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: kinetic,ktd2801
+
+  enable-gpios:
+    maxItems: 1
+
+  default-brightness: true
+  max-brightness: true
+
+required:
+  - compatible
+  - enable-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    backlight {
+        compatible = "kinetic,ktd2801";
+        enable-gpios = <&gpio 97 GPIO_ACTIVE_LOW>;
+        max-brightness = <210>;
+        default-brightness = <100>;
+    };

-- 
2.42.0


