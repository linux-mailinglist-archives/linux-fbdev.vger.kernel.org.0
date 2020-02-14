Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1C615F2B3
	for <lists+linux-fbdev@lfdr.de>; Fri, 14 Feb 2020 19:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730483AbgBNPu3 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 14 Feb 2020 10:50:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:54614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730478AbgBNPu3 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 14 Feb 2020 10:50:29 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C33EC24681;
        Fri, 14 Feb 2020 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581695428;
        bh=L28kKBzO9ZoLiwnERJQ4vhyPtlTmS54RuExX610RsWo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jowXcvdF3Fj84vZLD0RtjNRYK7sXF39RNwR4Muc33D94Ns0dnhI23clrlLK/SNTOy
         +4TvSBSKKkpC38pthND61TpUYJeQJIu4V+0HvkeaZ0y8cyiRqMVhtc40KS3VDar9lN
         kNdyNLNcUZVdKZcgoqpEWFZtn+2aOPy3rQ+uj5ek=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Beniamin Bia <beniamin.bia@analog.com>,
        Rob Herring <robh@kernel.org>, Sasha Levin <sashal@kernel.org>,
        linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 072/542] dt-bindings: iio: adc: ad7606: Fix wrong maxItems value
Date:   Fri, 14 Feb 2020 10:41:04 -0500
Message-Id: <20200214154854.6746-72-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Beniamin Bia <beniamin.bia@analog.com>

[ Upstream commit a6c4f77cb3b11f81077b53c4a38f21b92d41f21e ]

This patch set the correct value for oversampling maxItems. In the
original example, appears 3 items for oversampling while the maxItems
is set to 1, this patch fixes those issues.

Fixes: 416f882c3b40 ("dt-bindings: iio: adc: Migrate AD7606 documentation to yaml")
Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 6eb33207a1674..5117ad68a5840 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -82,7 +82,7 @@ properties:
       Must be the device tree identifier of the over-sampling
       mode pins. As the line is active high, it should be marked
       GPIO_ACTIVE_HIGH.
-    maxItems: 1
+    maxItems: 3
 
   adi,sw-mode:
     description:
@@ -125,9 +125,9 @@ examples:
                 adi,conversion-start-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
                 reset-gpios = <&gpio 27 GPIO_ACTIVE_HIGH>;
                 adi,first-data-gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
-                adi,oversampling-ratio-gpios = <&gpio 18 GPIO_ACTIVE_HIGH
-                                                &gpio 23 GPIO_ACTIVE_HIGH
-                                                &gpio 26 GPIO_ACTIVE_HIGH>;
+                adi,oversampling-ratio-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>,
+                                               <&gpio 23 GPIO_ACTIVE_HIGH>,
+                                               <&gpio 26 GPIO_ACTIVE_HIGH>;
                 standby-gpios = <&gpio 24 GPIO_ACTIVE_LOW>;
                 adi,sw-mode;
         };
-- 
2.20.1

