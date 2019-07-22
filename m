Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDD9670309
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 17:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbfGVPDj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 11:03:39 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44389 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbfGVPDV (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 11:03:21 -0400
Received: by mail-wr1-f67.google.com with SMTP id p17so39754185wrf.11
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7sHmLWUZTOubwniZNmRjFR+C4eT64A3MhAkvvXjkgx8=;
        b=mrJgOxH8FNxXre25hO4e4JqY5KaSUwL9WKRb7av9PtAPr5yDAKsxN/QNtIEQbMtuXa
         jPjtGQMpFU6ZerdbIG2E5QmtaGj4FkqGBq/hRl+7EGoTSVdZEkAKoQ2B3HjHMrCnc6Rh
         IesPYBLjmdiz5wyfddmoB1EROajzaw2hurkPAf3sjXCNrHA4jrTSOL4dLzyQfzrhZ/O9
         eJLTNmT/646NjjFcp+oYe+2reOatt6QB32QDVcnuEEcI5WAnQpXNx1i23Jgijiux/ZwD
         FKycwkiGTXeeRKkMtPDHeNx+ydKt/8sLZeJjPtJXHLw0FaBI/69FiyYVR7tpJblh3Npv
         06oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7sHmLWUZTOubwniZNmRjFR+C4eT64A3MhAkvvXjkgx8=;
        b=oMsnJpZALLluo3o8uHSvaw6OhbV43D4PmTJsBeelTCXFfuvruD2/QA7N9+hutOS/3w
         R1oNtkWuTAba5LbMsjKjLh+kzadwTmKFSc2RfuiUfDiyo4sNQTGBhm1Vure713AS6DwL
         xLxjQzUSuQTQJ2wCT4Psm7q9dwMAMb+j/eD0LE8NatEkrDl5slUalhuxLAkvE8OZ7UCz
         R0kIWfH5FO1YZ//oL09g8xXl5Tg3JF/p84N2xyjTQT8gJVQJ97Qcle/JLnHHlEI0Qx0w
         P0ulaJoG/lMGUh6FujoyJda218R7w+kF4QmNsutVYOnnVdq6BfnvSZRZizOcMV6fF/cU
         LGXw==
X-Gm-Message-State: APjAAAVI3WfGRNEvlFCOELJG2cY7fP5jIwtwVLNNoc8ozJIe9aAFEW1T
        U8o4UmyOqRrXHDzdToTk7ak=
X-Google-Smtp-Source: APXvYqyD0gk37PBxpZeYy+SsBHOhPvxzoF1iNnmz4Uolt36vrAsN2WrWgoxaLjg7dKr/eB3qFIj57g==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr69095285wrm.68.1563807799269;
        Mon, 22 Jul 2019 08:03:19 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:03:18 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 3/7] sh: ecovec24: don't set unused fields in platform data
Date:   Mon, 22 Jul 2019 17:02:58 +0200
Message-Id: <20190722150302.29526-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722150302.29526-1-brgl@bgdev.pl>
References: <20190722150302.29526-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Platform data fields other than fbdev are no longer used by the
backlight driver. Remove them.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/sh/boards/mach-ecovec24/setup.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index 6926bb3865b9..64a5a1662b6d 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -386,9 +386,6 @@ static struct property_entry gpio_backlight_props[] = {
 
 static struct gpio_backlight_platform_data gpio_backlight_data = {
 	.fbdev = &lcdc_device.dev,
-	.gpio = GPIO_PTR1,
-	.def_value = 1,
-	.name = "backlight",
 };
 
 static const struct platform_device_info gpio_backlight_device_info = {
-- 
2.21.0

