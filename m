Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEDE3C8659
	for <lists+linux-fbdev@lfdr.de>; Wed, 14 Jul 2021 16:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbhGNOyV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 14 Jul 2021 10:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232295AbhGNOyU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 14 Jul 2021 10:54:20 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A847C061760
        for <linux-fbdev@vger.kernel.org>; Wed, 14 Jul 2021 07:51:28 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:bcf3:b2b1:dff6:480b])
        by xavier.telenet-ops.be with bizsmtp
        id V2rR2500Q4sai0K012rRUZ; Wed, 14 Jul 2021 16:51:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3gEP-001AAj-7C; Wed, 14 Jul 2021 16:51:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3gEO-00AcE3-Od; Wed, 14 Jul 2021 16:51:24 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH resend v2] dt-bindings: display: ssd1307fb: Convert to json-schema
Date:   Wed, 14 Jul 2021 16:51:22 +0200
Message-Id: <20210714145122.2530176-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Convert the Solomon SSD1307 Framebuffer Device Tree binding
documentation to json-schema.

Fix the spelling of the "pwms" property.
Document default values.
Make properties with default values not required.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
  - Add Reviewed-by,
  - Document solomon,dclk-{div,freq} defaults.
---
 .../bindings/display/solomon,ssd1307fb.yaml   | 208 ++++++++++++++++++
 .../devicetree/bindings/display/ssd1307fb.txt |  60 -----
 2 files changed, 208 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/ssd1307fb.txt

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
new file mode 100644
index 0000000000000000..2ed2a7d0ca2fa23e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd1307fb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD1307 OLED Controller Framebuffer
+
+maintainers:
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - solomon,ssd1305fb-i2c
+      - solomon,ssd1306fb-i2c
+      - solomon,ssd1307fb-i2c
+      - solomon,ssd1309fb-i2c
+
+  reg:
+    maxItems: 1
+
+  pwms:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vbat-supply:
+    description: The supply for VBAT
+
+  solomon,height:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 16
+    description:
+      Height in pixel of the screen driven by the controller
+
+  solomon,width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 96
+    description:
+      Width in pixel of the screen driven by the controller
+
+  solomon,page-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 1
+    description:
+      Offset of pages (band of 8 pixels) that the screen is mapped to
+
+  solomon,segment-no-remap:
+    type: boolean
+    description:
+      Display needs normal (non-inverted) data column to segment mapping
+
+  solomon,col-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    description:
+      Offset of columns (COL/SEG) that the screen is mapped to
+
+  solomon,com-seq:
+    type: boolean
+    description:
+      Display uses sequential COM pin configuration
+
+  solomon,com-lrremap:
+    type: boolean
+    description:
+      Display uses left-right COM pin remap
+
+  solomon,com-invdir:
+    type: boolean
+    description:
+      Display uses inverted COM pin scan direction
+
+  solomon,com-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    description:
+      Number of the COM pin wired to the first display line
+
+  solomon,prechargep1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 2
+    description:
+      Length of deselect period (phase 1) in clock cycles
+
+  solomon,prechargep2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 2
+    description:
+      Length of precharge period (phase 2) in clock cycles.  This needs to be
+      the higher, the higher the capacitance of the OLED's pixels is.
+
+  solomon,dclk-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 16
+    description:
+      Clock divisor. The default value is controller-dependent.
+
+  solomon,dclk-frq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      Clock frequency, higher value means higher frequency.
+      The default value is controller-dependent.
+
+  solomon,lookup-table:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 4
+    description:
+      8 bit value array of current drive pulse widths for BANK0, and colors A,
+      B, and C. Each value in range of 31 to 63 for pulse widths of 32 to 64.
+      Color D is always width 64.
+
+  solomon,area-color-enable:
+    type: boolean
+    description:
+      Display uses color mode
+
+  solomon,low-power:
+    type: boolean
+    description:
+      Display runs in low power mode
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1305fb-i2c
+    then:
+      properties:
+        solomon,dclk-div:
+          default: 1
+        solomon,dclk-frq:
+          default: 7
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1306fb-i2c
+    then:
+      properties:
+        solomon,dclk-div:
+          default: 1
+        solomon,dclk-frq:
+          default: 8
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1307fb-i2c
+    then:
+      properties:
+        solomon,dclk-div:
+          default: 2
+        solomon,dclk-frq:
+          default: 12
+      required:
+        - pwms
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1309fb-i2c
+    then:
+      properties:
+        solomon,dclk-div:
+          default: 1
+        solomon,dclk-frq:
+          default: 10
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c1 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ssd1307: oled@3c {
+                    compatible = "solomon,ssd1307fb-i2c";
+                    reg = <0x3c>;
+                    pwms = <&pwm 4 3000>;
+                    reset-gpios = <&gpio2 7>;
+            };
+
+            ssd1306: oled@3d {
+                    compatible = "solomon,ssd1306fb-i2c";
+                    reg = <0x3c>;
+                    pwms = <&pwm 4 3000>;
+                    reset-gpios = <&gpio2 7>;
+                    solomon,com-lrremap;
+                    solomon,com-invdir;
+                    solomon,com-offset = <32>;
+                    solomon,lookup-table = /bits/ 8 <0x3f 0x3f 0x3f 0x3f>;
+            };
+    };
diff --git a/Documentation/devicetree/bindings/display/ssd1307fb.txt b/Documentation/devicetree/bindings/display/ssd1307fb.txt
deleted file mode 100644
index 2dcb6d12d1371536..0000000000000000
--- a/Documentation/devicetree/bindings/display/ssd1307fb.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-* Solomon SSD1307 Framebuffer Driver
-
-Required properties:
-  - compatible: Should be "solomon,<chip>fb-<bus>". The only supported bus for
-    now is i2c, and the supported chips are ssd1305, ssd1306, ssd1307 and
-    ssd1309.
-  - reg: Should contain address of the controller on the I2C bus. Most likely
-         0x3c or 0x3d
-  - pwm: Should contain the pwm to use according to the OF device tree PWM
-         specification [0]. Only required for the ssd1307.
-  - solomon,height: Height in pixel of the screen driven by the controller
-  - solomon,width: Width in pixel of the screen driven by the controller
-  - solomon,page-offset: Offset of pages (band of 8 pixels) that the screen is
-    mapped to.
-
-Optional properties:
-  - reset-gpios: The GPIO used to reset the OLED display, if available. See
-                 Documentation/devicetree/bindings/gpio/gpio.txt for details.
-  - vbat-supply: The supply for VBAT
-  - solomon,segment-no-remap: Display needs normal (non-inverted) data column
-                              to segment mapping
-  - solomon,col-offset: Offset of columns (COL/SEG) that the screen is mapped to.
-  - solomon,com-seq: Display uses sequential COM pin configuration
-  - solomon,com-lrremap: Display uses left-right COM pin remap
-  - solomon,com-invdir: Display uses inverted COM pin scan direction
-  - solomon,com-offset: Number of the COM pin wired to the first display line
-  - solomon,prechargep1: Length of deselect period (phase 1) in clock cycles.
-  - solomon,prechargep2: Length of precharge period (phase 2) in clock cycles.
-                         This needs to be the higher, the higher the capacitance
-                         of the OLED's pixels is
-  - solomon,dclk-div: Clock divisor 1 to 16
-  - solomon,dclk-frq: Clock frequency 0 to 15, higher value means higher
-                      frequency
-  - solomon,lookup-table: 8 bit value array of current drive pulse widths for
-                          BANK0, and colors A, B, and C. Each value in range
-                          of 31 to 63 for pulse widths of 32 to 64. Color D
-                          is always width 64.
-  - solomon,area-color-enable: Display uses color mode
-  - solomon,low-power. Display runs in low power mode
-
-[0]: Documentation/devicetree/bindings/pwm/pwm.txt
-
-Examples:
-ssd1307: oled@3c {
-        compatible = "solomon,ssd1307fb-i2c";
-        reg = <0x3c>;
-        pwms = <&pwm 4 3000>;
-        reset-gpios = <&gpio2 7>;
-};
-
-ssd1306: oled@3c {
-        compatible = "solomon,ssd1306fb-i2c";
-        reg = <0x3c>;
-        pwms = <&pwm 4 3000>;
-        reset-gpios = <&gpio2 7>;
-        solomon,com-lrremap;
-        solomon,com-invdir;
-        solomon,com-offset = <32>;
-        solomon,lookup-table = /bits/ 8 <0x3f 0x3f 0x3f 0x3f>;
-};
-- 
2.25.1

