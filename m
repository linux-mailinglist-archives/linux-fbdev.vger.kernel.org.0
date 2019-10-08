Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6E2DCF92A
	for <lists+linux-fbdev@lfdr.de>; Tue,  8 Oct 2019 14:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730819AbfJHMFR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 8 Oct 2019 08:05:17 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42825 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730332AbfJHMFR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 8 Oct 2019 08:05:17 -0400
Received: by mail-lf1-f68.google.com with SMTP id c195so11743317lfg.9
        for <linux-fbdev@vger.kernel.org>; Tue, 08 Oct 2019 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yIqqIP3EIw1WUky7Dl5KboQRqFaypkEePxm8k0rEc9o=;
        b=AponybTxAeH4Qwys7uf32YeqpoJ78jgDddTlKOmqmCAlexPcNn8x24ajVQ+O7+xRkR
         RuBT096o6RaBaaTnFRhKPGbBnK69SeSdi0jX5VxETzV8yWF+FlbeSjLE8LtoSz+LXe/9
         1SJ01i6mDKGlRWpaglFSkyprM69Ur66rByxaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yIqqIP3EIw1WUky7Dl5KboQRqFaypkEePxm8k0rEc9o=;
        b=RjwTfmHEJn8GkI0DxCoIGIZF8tpBmi6Iut8pnfaQmLbI85huRrWNsXRqw1Z1XfyepX
         19BJJSy80vbjoEvEqWRBQ6f2hPULsRvabKhLq6ps/DP6W2Uvex18K/fPform7kemmX78
         ZjtAO0ViZ/kpg55o8DU16SlCrxojR2OUX+ix5mvPqzq4aJS/D04LV6s0FL3dCVa8knuP
         BvwKHDYIVyD2mtOlxykOgRYZNnGTxg2KnhtVm4R3JaSNK5qTvGBQrXbMibk7GX7rpX5w
         K1uhjUP6gbWRETZyArXp5EPXKCEeC8jurKZnA0E+VVKbzZzMS47GZgFowkJTUFM5ACJs
         d/1A==
X-Gm-Message-State: APjAAAVOGFVbSmfBk26c3Cn4iQHSTgY8NmF9CoMT75FgLO9BWHZ9QAmq
        eESAxdcgUI1ShxA9FyGmHmniZw==
X-Google-Smtp-Source: APXvYqykeLmJ/WUhlQxva8zZaqPikrZhQ2ld9WnisNftyHunM8rSa4gXa55Lqcwffs1sdJgebXd04g==
X-Received: by 2002:a19:ec16:: with SMTP id b22mr20438594lfa.189.1570536316077;
        Tue, 08 Oct 2019 05:05:16 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id z18sm3918033ljh.17.2019.10.08.05.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 05:05:15 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 0/4] backlight: pwm_bl: optimizations and small fix for cie1913
Date:   Tue,  8 Oct 2019 14:03:23 +0200
Message-Id: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

These patches optimize the cie1913() implementation by using fewer 64
bit divisions and multiplications. It also contains a minor fix for
the linear constant used.

v2:
- Drop patch 5.
- Fix thinko in patch 4, otherwise no code change.
- Better changelog in patch 3.
- Add Daniel's Reviewed-By to the four patches.

Daniel, I took the liberty of adding your R-B to patch 4 despite
changing it a little to fix a thinko - I should add 1<<31 and not
1<<15. Please tell me if that was inappropriate.

Rasmus Villemoes (4):
  backlight: pwm_bl: fix cie1913 comments and constant
  backlight: pwm_bl: eliminate a 64/32 division
  backlight: pwm_bl: drop use of int_pow()
  backlight: pwm_bl: switch to power-of-2 base for fixed-point math

 drivers/video/backlight/pwm_bl.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

-- 
2.20.1

