Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF887CF932
	for <lists+linux-fbdev@lfdr.de>; Tue,  8 Oct 2019 14:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730838AbfJHMF2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 8 Oct 2019 08:05:28 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46287 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730904AbfJHMF1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 8 Oct 2019 08:05:27 -0400
Received: by mail-lf1-f65.google.com with SMTP id t8so11692334lfc.13
        for <linux-fbdev@vger.kernel.org>; Tue, 08 Oct 2019 05:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GHqEF0WPzWee4xQdmsltBE/DbSJ8wdizxOO3R+g9Qfw=;
        b=iHfqd7InHpWSp9HtncYc/nGuUN2SQLNPz6EP4Z7c0utpCDEfBTHo79qRfdGdqnHjDc
         mUERS8N/Ezm1xJivvlU2FPSjziBCWfbM0Mp19xZKJ+DciElb5UKCU0Vr/UJTOEN7Raiq
         9nMDdC6cEjkuK79xMF6I9qmtVilDUGJ2/wvCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GHqEF0WPzWee4xQdmsltBE/DbSJ8wdizxOO3R+g9Qfw=;
        b=IwFNfcf2/CbCfnC7wCj0m4I1Kavps+JO9d/2jVk3Ru0klCBuyCu0aNAmL29x4YgBcz
         EDKkcc9mlyq4z/ivitwXB1y5KjR0Pw0xj7JyD5CMAtk3AQWKb4xDfzv7RSxPXux1dFAS
         TBZ7HEKd3DPZCnw5mGAQsrYWVJARcFTdd9aR3oNL5KJaEPVUhAK50ZFbcAYGA8l4sc65
         CkzWaLipT4rD6Owom6WXomdIpnHwCu2wOgVBAKuohyxsbwP6sVHttnJWkVnAjy36XoJ4
         u666A70veFXdgTVJiyF5T5SEUaROj32Zr+0gAjykYk3SwZXCSj2K2ZLeYOeHWGzYYFgy
         V4gw==
X-Gm-Message-State: APjAAAVfYYa+Y3GpIuKxPDQ6vm/4ujswQUp0IHn3e4qLDEBYydaYSZyj
        b8vog3khthixDvhzaIt2OyjJ2g==
X-Google-Smtp-Source: APXvYqxCIRhO8rpvb/4039KpvxZ2HkirRtcoXz27yozPDPIZ8udJLy4ukMGlXb9inSVE+1v8hleq+g==
X-Received: by 2002:a19:90:: with SMTP id 138mr19176383lfa.111.1570536324544;
        Tue, 08 Oct 2019 05:05:24 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id z18sm3918033ljh.17.2019.10.08.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 05:05:22 -0700 (PDT)
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
Subject: [PATCH v2 3/4] backlight: pwm_bl: drop use of int_pow()
Date:   Tue,  8 Oct 2019 14:03:26 +0200
Message-Id: <20191008120327.24208-4-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

For a fixed small exponent of 3, it is more efficient to simply use
two explicit multiplications rather than calling the int_pow() library
function: Aside from the function call overhead, its implementation
using repeated squaring means it ends up doing four 64x64
multiplications.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/video/backlight/pwm_bl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 672c5e7cfcd1..273d3fb628a0 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -179,7 +179,8 @@ static u64 cie1931(unsigned int lightness, unsigned int scale)
 	if (lightness <= (8 * scale)) {
 		retval = DIV_ROUND_CLOSEST(lightness * 10, 9033);
 	} else {
-		retval = int_pow((lightness + (16 * scale)) / 116, 3);
+		retval = (lightness + (16 * scale)) / 116;
+		retval *= retval * retval;
 		retval = DIV_ROUND_CLOSEST_ULL(retval, (scale * scale));
 	}
 
-- 
2.20.1

