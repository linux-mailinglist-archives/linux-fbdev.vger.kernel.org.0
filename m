Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72D32554A2
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Jun 2019 18:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730232AbfFYQfA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 25 Jun 2019 12:35:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44009 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730123AbfFYQfA (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 25 Jun 2019 12:35:00 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so18610210wru.10
        for <linux-fbdev@vger.kernel.org>; Tue, 25 Jun 2019 09:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sFDObtAhBFoq+e3uGBncXCZh94u1gqoIy533R027F8g=;
        b=G4Pw99p7XQ8OGBF3dnF0u8nsP2gzt973olZmzxwCvcharaKDy85867vLHAfEEMeOY6
         WbvGNVaQTvX6o6k0m03Dbg3bqJePqRGuhQt3WSt/PGG8Cb/oCVEqY2X6FLotNA0IXfJm
         ARyniYvJZe/t7VQyJcxGxpDqPU66WCtZIWCej1JRYrPbhTKgeT2by3xxii6Mp4ieweY4
         kcGKmEFn2Ow9kyf3HS2AOfy4WfOxqLajkqnTEHqnZVLC2+gcImOh2N06MabRO5E7+Uh0
         Rz8cDgo9FQcCj48JgPkYsVbGknrWRKT8C9/qsCP3bGmyaklMqjuX8zcNjbTiVOhmz5fy
         wOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sFDObtAhBFoq+e3uGBncXCZh94u1gqoIy533R027F8g=;
        b=JvlYl03VjfAxW2zYjfJAFdMakrlotzbWYMv6K5QQ2SHhiy2QYgvUETIXujTEfvvJ2N
         x/mkI239++4L2Gmmo8rio1UzuvPd+2vWJjLS1mo9Ycwrva1MijC/w/207WF1x/uS6wMn
         D17sG3CEt4RPyhuKQPX1n18l0MkvsQ1k41sAEBPYz0euSurWztzpXqWNoO+DK4QCs0Vo
         tToCkkRjWLeBD3I+7PzR2CxF7G3jvMsukhNQ4BCVUujM03KLxvUi6LH1JfmenS36l/Zf
         zY17jn3JKavzIy7CUVQnCcKy2au8IQRIQWTNVTrXUdbaGW016LqrU+qnzycdmKg7nKa0
         IEKQ==
X-Gm-Message-State: APjAAAWzAcFbJK6sliwFix+CICAHuXteZBbdO/7EsEoYfj3eweU/6Cm7
        oBTGPC0G3ELDe2269vUwabsCfg==
X-Google-Smtp-Source: APXvYqw0FlaqXL9keBHWR7KbT8zOx0gQKa57yMr4s6cP5zk/w1cWEybKYPn7W1s8wCZ4fu5o6W6zoA==
X-Received: by 2002:adf:fc91:: with SMTP id g17mr25182759wrr.194.1561480498103;
        Tue, 25 Jun 2019 09:34:58 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.34.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 09:34:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 05/12] ARM: davinci_all_defconfig: enable GPIO backlight
Date:   Tue, 25 Jun 2019 18:34:27 +0200
Message-Id: <20190625163434.13620-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Enable the GPIO backlight module in davinci_all_defconfig.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/configs/davinci_all_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index 13d7846c613d..06855b2bce7e 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -158,6 +158,7 @@ CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_DA8XX=y
 CONFIG_BACKLIGHT_PWM=m
+CONFIG_BACKLIGHT_GPIO=m
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 CONFIG_SOUND=m
-- 
2.21.0

