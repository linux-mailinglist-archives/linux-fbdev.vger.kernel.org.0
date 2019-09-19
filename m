Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27B9AB7BA0
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Sep 2019 16:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389489AbfISOGf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 19 Sep 2019 10:06:35 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46389 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389372AbfISOGe (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 19 Sep 2019 10:06:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id e17so3683178ljf.13
        for <linux-fbdev@vger.kernel.org>; Thu, 19 Sep 2019 07:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k4SJ+eSfjSAP63ushly3GU0Efl4ebkKBMuWTSOkSqS8=;
        b=W4FhrPJAR9Dqgs5qFA5Pl22WVgeXGbokdSlE6Xjl8ev+AwkvtlovQkmnKhocbnMFdS
         81B7iYoNdsvMs2yQlsvxAdJGvvAKDR0FvjYPLiSIbpwUt9AMKu8kvddB2vIg68Gs3TZA
         XspHxRzEPQhGFNCyXRy2eUNIWhGekZOWx5Sfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k4SJ+eSfjSAP63ushly3GU0Efl4ebkKBMuWTSOkSqS8=;
        b=mi8TqKbbVfMFz2tfVWQM2n6VNMlsDAQ2c4TGNBCazhd4GFjoKU+Sl1uJptU0KkhJG1
         kHWs9eNeuYNPW5WdGVQmf25hFDyT3aBgMiXW3b6nNelzVZeJGoCkhCmISPKMF00Evbcz
         TM+IW0yqpA+/de+yGre7YS0HzhbhnlZbydI3f70Iknz1MEQKXaR+g+lBMNrPRetEiRrM
         X4sOYfDEQMfn0DQmONoxdEEMkSy/VLbTVB0+kDkjJSbt+kmDPCRHVuCEyzv2IUYztazf
         FkqvIpuexdbvBfRpPJouoOwm2271m8DAEfT9yccAoQQb+ar06ZNi3WBcYZM/JtwVcmyi
         CkrA==
X-Gm-Message-State: APjAAAUXx+I9gfrLl2g6N2Z6FfVO7fH1WP2AdoUoS0ZqfTkzPCQwhTH5
        zlbuT2rIJ1vTInLjWV0uHohuCw==
X-Google-Smtp-Source: APXvYqzlHJRhLqL82K2xKbtjAXAMpinhzWwpvMBA7qVfJ7tNQ26aw9X0BviaTA3hpMKKf3q8cAewtQ==
X-Received: by 2002:a2e:934f:: with SMTP id m15mr5586940ljh.101.1568901991526;
        Thu, 19 Sep 2019 07:06:31 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id h3sm1687886ljf.12.2019.09.19.07.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 07:06:31 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] backlight: pwm_bl: drop use of int_pow()
Date:   Thu, 19 Sep 2019 16:06:18 +0200
Message-Id: <20190919140620.32407-3-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The scheduler uses a (currently private) fixed_power_int() in its load
average computation for computing powers of numbers 0 < x < 1
expressed as fixed-point numbers, which is also what we want here. But
that requires the scale to be a power-of-2.

We could (and a following patch will) change to use a power-of-2 scale,
but for a fixed small exponent of 3, there's no advantage in using
repeated squaring.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/video/backlight/pwm_bl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 9252d51f31b9..aee6839e024a 100644
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

