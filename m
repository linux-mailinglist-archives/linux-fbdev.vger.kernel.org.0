Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE46459812
	for <lists+linux-fbdev@lfdr.de>; Fri, 28 Jun 2019 12:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfF1KDL (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 28 Jun 2019 06:03:11 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39592 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbfF1KDK (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 28 Jun 2019 06:03:10 -0400
Received: by mail-wr1-f68.google.com with SMTP id x4so5635399wrt.6
        for <linux-fbdev@vger.kernel.org>; Fri, 28 Jun 2019 03:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2fXlJr+KLvMvzQ39JeY61bDwufklUTFeJJHO6S5cuaU=;
        b=sD7MfnUDEG9Nd5uhC9bU5PmddNwA0kXjHFTB641OJnJbCVKMFSAVMjZL3WHIHVu9yK
         fWS6zgw4R+OgBrpyehUiUda/A3VJaZHc4PQcV+1UrPo/fQTnVzHjg/wFJEQUgJ1LTof1
         A9rU7MhtRr4OfO5v5XUSDXGeveEB3DlbEytfcutjLNQ4Rq7n+QsPRVzpFRBhT6WwrgXA
         P824u8V2ZL/4JLS1+D2X9xh51UyCdJVPvsZ2h1alJHkiGzhpqmMD3JjADNtIfb2zXS5g
         sU6GozYeONWsvwBkC7JcyYFmXUK0vJjNv7o2sInGwoPWQyhMsXRPA2eW77XBfYz7HMWu
         ZUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2fXlJr+KLvMvzQ39JeY61bDwufklUTFeJJHO6S5cuaU=;
        b=A0AN4E7JQluCO4TKz8UfHKqkmgZVmhZ5rjjSUoQ4KLa90lxsVlXVWgGoXt5E078r2W
         B6Og7uTy5dxlQrMZI5v7cEtCUIIEY5dk6q3wKbtlda1H4EN8R4AECuq8PTdvVmmH1VX8
         u65Tr4Lh453df6V+9cPMSRqSGgJHNBA5vr9wseS/zu6MOjKkwwIBWKtAFyCyyz5OZbqg
         XQcy2PzXOcWhrhv4ir0du938FexfBrH48A42p0GMvE2v3d5pB2kvm+s4htPaCcZCXEVl
         Gf2mwTcJD4++WzIke/SSm6ToKacom/lioFMzl6iOKi5wv1CJSiRVsrCKEjHdKrShOkAE
         lHdg==
X-Gm-Message-State: APjAAAXGofRwgDjz2WUCRBrIQmtsYVEAbGtMXjjEjLUTfKNlPX2IjnsF
        MJvDFtNKZEi/4iH+PKCE1qGnS0iTekY=
X-Google-Smtp-Source: APXvYqykUEXT3B0487J5sArEnZO+0OtmpAg6hB7ll9Lv+cgBqkGF8/Iqkv/JGRgFkwYe/JBUjT/HeQ==
X-Received: by 2002:adf:c654:: with SMTP id u20mr4384217wrg.271.1561716188085;
        Fri, 28 Jun 2019 03:03:08 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id l124sm1628874wmf.36.2019.06.28.03.03.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 03:03:07 -0700 (PDT)
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
Subject: [PATCH RFT 4/4] backlight: gpio: remove unused fields from platform data
Date:   Fri, 28 Jun 2019 12:02:53 +0200
Message-Id: <20190628100253.8385-5-brgl@bgdev.pl>
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

Remove the platform data fields that nobody uses.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/platform_data/gpio_backlight.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/platform_data/gpio_backlight.h b/include/linux/platform_data/gpio_backlight.h
index 34179d600360..1a8b5b1946fe 100644
--- a/include/linux/platform_data/gpio_backlight.h
+++ b/include/linux/platform_data/gpio_backlight.h
@@ -9,9 +9,6 @@ struct device;
 
 struct gpio_backlight_platform_data {
 	struct device *fbdev;
-	int gpio;
-	int def_value;
-	const char *name;
 };
 
 #endif
-- 
2.21.0

