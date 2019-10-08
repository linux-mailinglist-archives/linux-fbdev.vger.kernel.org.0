Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE30ECF939
	for <lists+linux-fbdev@lfdr.de>; Tue,  8 Oct 2019 14:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730893AbfJHMFV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 8 Oct 2019 08:05:21 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32894 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730890AbfJHMFV (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 8 Oct 2019 08:05:21 -0400
Received: by mail-lj1-f196.google.com with SMTP id a22so17248809ljd.0
        for <linux-fbdev@vger.kernel.org>; Tue, 08 Oct 2019 05:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kZ+v3Ie5jsyMpg1/r8HbbsX7sXk3b8d5gKwzOHbV1b8=;
        b=W0ddgUpZ8caX090N18rJXEGsy5RctbdFr4Uj8eEHV+WXpAquDOJGemg+ouB0b7rO2k
         wQfnFphLbbQKFY/9KqpuIJl8qs1h1g3Lae36ILXsc4WNO/eomzP41sRPtH5RcLggU2XK
         ai8CJyNSJdiOh5PVAUkZIqTEPEq2lsZk8iZhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kZ+v3Ie5jsyMpg1/r8HbbsX7sXk3b8d5gKwzOHbV1b8=;
        b=BqUnjz9my4Q1OoN/DI2igIGxajT5BvpypndW984Irudyy2dLBX5vyDrYdHsJxPXXBJ
         H3uJz0R9RyRPcZTZNEOGvRemspyrU0GAIdkBz7t5jhxtfTslvbFM6nLk7WdFMCsdCavl
         dDMHb27we85GRX047FeiJBy5xshEToUD9k9F89kTCTSu4l6DFsWjMLKrH15iCU04WgfZ
         74zCsSj8dYByPMPIHOVXpYHVDxo3YiCiNco9pd8loYn+qHG+0zE9H1jOGKOpgp/FrInO
         Tc6TV+MkMHopxLpY8RGxqqqOoi72bGygS3N/IUK4QaTcZ+JvVB7TEec/phPOLq6fAqKU
         Ag3A==
X-Gm-Message-State: APjAAAWipruHB6t//9dAc33DniokmbG0nNfsyvU7YUTAh6U/VLgiXf3i
        Nh3CiyF0N0dYOUtoqWZM1VnaMg==
X-Google-Smtp-Source: APXvYqxr3LSKZs/gnEdARVmL8Fu4FXziognliaJ/7eGB45xQLrMsXf20NWCHuBIyf534zW7ay+klcg==
X-Received: by 2002:a2e:810e:: with SMTP id d14mr22480784ljg.160.1570536318667;
        Tue, 08 Oct 2019 05:05:18 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id z18sm3918033ljh.17.2019.10.08.05.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 05:05:17 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] backlight: pwm_bl: fix cie1913 comments and constant
Date:   Tue,  8 Oct 2019 14:03:24 +0200
Message-Id: <20191008120327.24208-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The "break-even" point for the two formulas is L==8, which is also
what the code actually implements. [Incidentally, at that point one
has Y=0.008856, not 0.08856].

Moreover, all the sources I can find say the linear factor is 903.3
rather than 902.3, which makes sense since then the formulas agree at
L==8, both yielding the 0.008856 figure to four significant digits.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/video/backlight/pwm_bl.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 746eebc411df..cc44a02e95c7 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -155,8 +155,8 @@ static const struct backlight_ops pwm_backlight_ops = {
  *
  * The CIE 1931 lightness formula is what actually describes how we perceive
  * light:
- *          Y = (L* / 902.3)           if L* ≤ 0.08856
- *          Y = ((L* + 16) / 116)^3    if L* > 0.08856
+ *          Y = (L* / 903.3)           if L* ≤ 8
+ *          Y = ((L* + 16) / 116)^3    if L* > 8
  *
  * Where Y is the luminance, the amount of light coming out of the screen, and
  * is a number between 0.0 and 1.0; and L* is the lightness, how bright a human
@@ -169,9 +169,15 @@ static u64 cie1931(unsigned int lightness, unsigned int scale)
 {
 	u64 retval;
 
+	/*
+	 * @lightness is given as a number between 0 and 1, expressed
+	 * as a fixed-point number in scale @scale. Convert to a
+	 * percentage, still expressed as a fixed-point number, so the
+	 * above formulas can be applied.
+	 */
 	lightness *= 100;
 	if (lightness <= (8 * scale)) {
-		retval = DIV_ROUND_CLOSEST_ULL(lightness * 10, 9023);
+		retval = DIV_ROUND_CLOSEST_ULL(lightness * 10, 9033);
 	} else {
 		retval = int_pow((lightness + (16 * scale)) / 116, 3);
 		retval = DIV_ROUND_CLOSEST_ULL(retval, (scale * scale));
-- 
2.20.1

