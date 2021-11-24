Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E621445C83F
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Nov 2021 16:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhKXPLk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Nov 2021 10:11:40 -0500
Received: from asav21.altibox.net ([109.247.116.8]:53580 "EHLO
        asav21.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhKXPLj (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Nov 2021 10:11:39 -0500
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav21.altibox.net (Postfix) with ESMTPSA id 618D4800A7;
        Wed, 24 Nov 2021 16:08:21 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     robh+dt@kernel.org, david@lechnology.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
        dave.stevenson@raspberrypi.com, maxime@cerno.tech,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 3/6] dt-bindings: display: sitronix,st7735r: Remove spi-max-frequency limit
Date:   Wed, 24 Nov 2021 16:07:54 +0100
Message-Id: <20211124150757.17929-4-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124150757.17929-1-noralf@tronnes.org>
References: <20211124150757.17929-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ZLv5Z0zb c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
        a=3IttHYtGSP5F0p6lhesA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
        a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The datasheet lists the minimum Serial clock cycle (Write) as 66ns which is
15MHz. Mostly it can do much better than that and is in fact often run at
32MHz. With a clever driver that runs configuration commands at a low speed
and only the pixel data at the maximum speed the configuration can't be
messed up by transfer errors and the speed is only limited by the amount of
pixel glitches that one is able to tolerate.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 .../devicetree/bindings/display/sitronix,st7735r.yaml         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
index f81d0d0d51fe..157b1a7b18f9 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
@@ -32,15 +32,13 @@ properties:
               - okaya,rh128128t
           - const: sitronix,st7715r
 
-  spi-max-frequency:
-    maximum: 32000000
-
   dc-gpios:
     maxItems: 1
     description: Display data/command selection (D/CX)
 
   backlight: true
   reg: true
+  spi-max-frequency: true
   reset-gpios: true
   rotation: true
 
-- 
2.33.0

