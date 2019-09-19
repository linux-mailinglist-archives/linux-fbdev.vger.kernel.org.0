Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19CD2B7BA4
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Sep 2019 16:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389656AbfISOGn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 19 Sep 2019 10:06:43 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43041 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388605AbfISOGd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 19 Sep 2019 10:06:33 -0400
Received: by mail-lj1-f193.google.com with SMTP id d5so3701112lja.10
        for <linux-fbdev@vger.kernel.org>; Thu, 19 Sep 2019 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zBTcMpOyl2bLXBXPvlZrHA8WBZZACi7gNqiyseLnytg=;
        b=A48WL858gPJVbFagBB2BTpTgHdTGMt1R9BC01trDu5z3ENfmhWS7RiqjnfWx20RoUY
         E0iQrrx0deYrkinYfpODZNFzuVCQBajUDYXy09Qkmb+GV1iPmOdfGkZktLbOEyqsuOiz
         8Rwokwielo8W6w7zis9sx6uJ5V5kHfsVwrS8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zBTcMpOyl2bLXBXPvlZrHA8WBZZACi7gNqiyseLnytg=;
        b=CQxJxN9zxbMOuT+EDLifCvr2v+/qDRHmNDsiwC/H4MxSKRJXBWUi4grG+EBkHdvYND
         QPhUHV5sByRnYQ+T8I4jiXRTl46b9VIJWQFlqw5tDxAq20/D62To6ZX1bLOnU75gFboH
         PKoCpFQWX2wubK51JJQjZUiBv50KCvseQEe6CaVjZ19J68GmMayRi4B5yQKRSaUo7PZh
         HMdBKnfczEhr7L1vB/B1lXLPDWLW2NaGkc+pl8rqnwW1z9kf2z0jyjWlN9GB7rqA4oZt
         5PAvaJco34EROsdTTOpKJ2IxYP5rUeCsc3OMfoQSBL3WLsgf+6zDX/S0loucxCpaY/Nw
         RZAQ==
X-Gm-Message-State: APjAAAVmKljbinySqOUQY9SHdt4G4EflEcz4nlXy1SACrB19yFhd6D9L
        D4T0/ujvXvvSRZmjR1NeLDaA5A==
X-Google-Smtp-Source: APXvYqz80XnBinuoIhjkWosIvpazzODW2CaBBl25zB2SkJzfe+uW+0Y8qIL/RSBMCTZSD3oY/92ueA==
X-Received: by 2002:a2e:6e18:: with SMTP id j24mr5534397ljc.158.1568901990286;
        Thu, 19 Sep 2019 07:06:30 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id h3sm1687886ljf.12.2019.09.19.07.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 07:06:29 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] backlight: pwm_bl: eliminate a 64/32 division
Date:   Thu, 19 Sep 2019 16:06:17 +0200
Message-Id: <20190919140620.32407-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

lightness*1000 is nowhere near overflowing 32 bits, so we can just use
an ordinary 32/32 division, which is much cheaper than the 64/32 done
via do_div().

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/video/backlight/pwm_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index be36be1cacb7..9252d51f31b9 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -177,7 +177,7 @@ static u64 cie1931(unsigned int lightness, unsigned int scale)
 	 */
 	lightness *= 100;
 	if (lightness <= (8 * scale)) {
-		retval = DIV_ROUND_CLOSEST_ULL(lightness * 10, 9033);
+		retval = DIV_ROUND_CLOSEST(lightness * 10, 9033);
 	} else {
 		retval = int_pow((lightness + (16 * scale)) / 116, 3);
 		retval = DIV_ROUND_CLOSEST_ULL(retval, (scale * scale));
-- 
2.20.1

