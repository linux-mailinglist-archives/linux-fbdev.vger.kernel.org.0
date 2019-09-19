Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A24CCB7B9F
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Sep 2019 16:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389501AbfISOGf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 19 Sep 2019 10:06:35 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38025 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389448AbfISOGe (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 19 Sep 2019 10:06:34 -0400
Received: by mail-lj1-f194.google.com with SMTP id y23so3741712ljn.5
        for <linux-fbdev@vger.kernel.org>; Thu, 19 Sep 2019 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jg7JcvREMiiX5x2HEJEjAcDv3XByVb0RNmStAp9nahQ=;
        b=MZKdSEpOEV+5iG16oW7TXFRd1eg5H9XeUG6b1t8t2jgOvEG6oGHacyhtyg3NPIEGY/
         uKiTYPItaGHpX/90K1aP/bPkpA8b+8k/Rldl4zxvx2B9det3NTU55vbdyWW1nSSp9eg3
         YRFw3EAaRrmgYhPjv9gwnV6JQyEwF2erlvjsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jg7JcvREMiiX5x2HEJEjAcDv3XByVb0RNmStAp9nahQ=;
        b=YCv6z0+/LfYMKPJEs9smrUsnCLnKwpssoSLLJT9S3wX0+oG0JcTpR1Ji7Bng3Rsi0n
         gB3wdOcJxcT08ffhzACliE6vcTF1eJSLZzGg5HYh5crB+Y06b+8+05i2x8rBqWiOUujH
         dCZIyjVObm9tyg24zw1Syx7zNV/wgwMQ9XwkAs/SOCzV0DrQpVBZ3K2/ba66tSIOBXLR
         ZsiPTwCKLgeU8heHx3JKCI2WsxqrLGr0+fux/sJzkBfZ+McDacWAuqtreF1CkrhOavKY
         87+KHIl9C0R7UyJcfUBVxHLhYST7TPGwZ42A2M7LsenZeZGBdLOi+8uapvJfa7P4lEUB
         1wqA==
X-Gm-Message-State: APjAAAVJ+FkjehRptVEegbAtmyalfOPrDX4wh2xEEwDjMb3UJh4aW6oR
        HLvgtaaKE/UoPN2sKpNvRE/wYQ==
X-Google-Smtp-Source: APXvYqwT7aVA83Vb4qPr4tBmMd1vi6mmQP81J4Kl4kTliuCxLy+GI3jRKm2Szplr4kWj55N1eonI9A==
X-Received: by 2002:a05:651c:c9:: with SMTP id 9mr107103ljr.29.1568901992739;
        Thu, 19 Sep 2019 07:06:32 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id h3sm1687886ljf.12.2019.09.19.07.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 07:06:32 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] backlight: pwm_bl: switch to power-of-2 base for fixed-point math
Date:   Thu, 19 Sep 2019 16:06:19 +0200
Message-Id: <20190919140620.32407-4-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Using a power-of-2 instead of power-of-10 base makes the computations
much cheaper. 2^16 is safe; retval never becomes more than 2^48 +
2^16/2. On a 32 bit platform, the very expensive 64/32 division at the
end of cie1931() instead becomes essentially free (a shift by 32 is
just a register rename).

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/video/backlight/pwm_bl.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index aee6839e024a..102bc191310f 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -148,7 +148,8 @@ static const struct backlight_ops pwm_backlight_ops = {
 };
 
 #ifdef CONFIG_OF
-#define PWM_LUMINANCE_SCALE	10000 /* luminance scale */
+#define PWM_LUMINANCE_SHIFT	16
+#define PWM_LUMINANCE_SCALE	(1 << PWM_LUMINANCE_SHIFT) /* luminance scale */
 
 /*
  * CIE lightness to PWM conversion.
@@ -165,23 +166,25 @@ static const struct backlight_ops pwm_backlight_ops = {
  * The following function does the fixed point maths needed to implement the
  * above formula.
  */
-static u64 cie1931(unsigned int lightness, unsigned int scale)
+static u64 cie1931(unsigned int lightness)
 {
 	u64 retval;
 
 	/*
 	 * @lightness is given as a number between 0 and 1, expressed
-	 * as a fixed-point number in scale @scale. Convert to a
-	 * percentage, still expressed as a fixed-point number, so the
-	 * above formulas can be applied.
+	 * as a fixed-point number in scale
+	 * PWM_LUMINANCE_SCALE. Convert to a percentage, still
+	 * expressed as a fixed-point number, so the above formulas
+	 * can be applied.
 	 */
 	lightness *= 100;
-	if (lightness <= (8 * scale)) {
+	if (lightness <= (8 * PWM_LUMINANCE_SCALE)) {
 		retval = DIV_ROUND_CLOSEST(lightness * 10, 9033);
 	} else {
-		retval = (lightness + (16 * scale)) / 116;
+		retval = (lightness + (16 * PWM_LUMINANCE_SCALE)) / 116;
 		retval *= retval * retval;
-		retval = DIV_ROUND_CLOSEST_ULL(retval, (scale * scale));
+		retval += PWM_LUMINANCE_SCALE/2;
+		retval >>= 2*PWM_LUMINANCE_SHIFT;
 	}
 
 	return retval;
@@ -215,8 +218,7 @@ int pwm_backlight_brightness_default(struct device *dev,
 	/* Fill the table using the cie1931 algorithm */
 	for (i = 0; i < data->max_brightness; i++) {
 		retval = cie1931((i * PWM_LUMINANCE_SCALE) /
-				 data->max_brightness, PWM_LUMINANCE_SCALE) *
-				 period;
+				 data->max_brightness) * period;
 		retval = DIV_ROUND_CLOSEST_ULL(retval, PWM_LUMINANCE_SCALE);
 		if (retval > UINT_MAX)
 			return -EINVAL;
-- 
2.20.1

