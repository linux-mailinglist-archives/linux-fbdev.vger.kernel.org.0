Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A535980F
	for <lists+linux-fbdev@lfdr.de>; Fri, 28 Jun 2019 12:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfF1KDJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 28 Jun 2019 06:03:09 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50704 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbfF1KDI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 28 Jun 2019 06:03:08 -0400
Received: by mail-wm1-f65.google.com with SMTP id c66so8504433wmf.0
        for <linux-fbdev@vger.kernel.org>; Fri, 28 Jun 2019 03:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7sHmLWUZTOubwniZNmRjFR+C4eT64A3MhAkvvXjkgx8=;
        b=1kAaf6/E5+mGz2iHvV/w6LgbjXUhE1J3FzxAzvc/ZMLUb2zRO7JwW9EipA8C/jmpZz
         5HUle30z3/HdqsLsnPco+ax5qINUWQ4s7k4ggjosmlI/fbBXZm++e4cEugXp9BjHU4Qx
         tDbhB8VtKAOUXH+bWAlP3YAAdpR1/eiNGnr8Lw/R5l0m9gvXcqTTk656VSTq2JetlXPl
         mOFupK5XnTtvkJeO3/5iAsjwwzfMMZDAE3F7gDLzbahlsVVEIgrGTVx5hTTAHoDNnoXS
         n6Ms2cgxcakJiTfWkYmP27eXz32j6fhqow/QWLg8746IpufcteQsu1UzegGhleFtdr8W
         63pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7sHmLWUZTOubwniZNmRjFR+C4eT64A3MhAkvvXjkgx8=;
        b=iYkOGJea1q7rUB+Yz42NVOCwcfrZmD0Z16xmHE6HcWMS4dh7GHCT3/TZMEVKY+mhhH
         1e288fn4rlHYf+U9R+w4PND5m7KVazpBugj4QdBoO1rvkx3pObxrEWTk8Cgl6a+qAAyX
         3HrLgIDwzBT6erYovUe3vs9WThmcVbxjRw3tTmWWUcaMWeX1qh3nQH6EOtp3x1b4KzHg
         T1oMIYG6oNlxrW/6SsKudgfmb6ZWD+fTSUcxmhYo4uJPz6llQ9ST85fnL5LP/LszfU4r
         6VXH6Giuz3Hkb1yi3UKocfF2qKM0LX5eznPK4jOfSq4M7T3Oy2Ru+1h0IumggIuooKmm
         /CHg==
X-Gm-Message-State: APjAAAXIwWFjB2VHOHywacS+Rt9e4ChSuUEzbrRwv5zu2P1U6aySGYpL
        uh3x5c2Q8vbRKPsB3hW3YJsB0g==
X-Google-Smtp-Source: APXvYqwJX9x/uwYqffqMsBH3PX5OmMDmgZ/93GpHvTIYXbJMNuLuI1utY/Q3MxYU6lzYE9800yi4Gw==
X-Received: by 2002:a1c:6641:: with SMTP id a62mr6397513wmc.175.1561716186765;
        Fri, 28 Jun 2019 03:03:06 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id l124sm1628874wmf.36.2019.06.28.03.03.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 03:03:06 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH RFT 3/4] sh: ecovec24: don't set unused fields in platform data
Date:   Fri, 28 Jun 2019 12:02:52 +0200
Message-Id: <20190628100253.8385-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628100253.8385-1-brgl@bgdev.pl>
References: <20190628100253.8385-1-brgl@bgdev.pl>
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

