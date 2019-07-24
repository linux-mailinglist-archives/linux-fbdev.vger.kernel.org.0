Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC3A9729FC
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jul 2019 10:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfGXIZr (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Jul 2019 04:25:47 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37040 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbfGXIZT (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Jul 2019 04:25:19 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so20859519wrr.4
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jul 2019 01:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PtXEm5EHLkMfau18VS0/ndTlnG64/pDTlbKgiSCBHXM=;
        b=pjvnwWlg1S0JJObJ4VAQYglevZH6RzmSr9LO8Vogmks9DNfq/Ol7Vv994gV+BUd3ea
         BzBvGJRFZG460Sx04z9WdPLd5/AWYUsRQsPfSbsvEdQZbEzWUWAM2vwkxE7EBHXG+iQY
         h3q3/kwA6euG7dAy9zWHIe292Lm41qMYTqLzrGHC6RXOOWBrDIlBoML4fRdfoSzJrh1v
         8924F2s+Z5KscpUb/O8kWJ0k9TcHopYH2o18DLKSTopAiitXP7ZveOS4UIOKF6zdZHJm
         QGVgGP4zLRsWceIkaRs7WzkZzgwaK5qgmUcXdwmgxGYb9fTRcWyQYB+4fwYPsXpV6aCj
         u2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PtXEm5EHLkMfau18VS0/ndTlnG64/pDTlbKgiSCBHXM=;
        b=MGKN4Q+h5i51mSEaTtcCchq5Lq6NQbtR1uPLOFqHiW0N1VOullrEeKIP8E4mM1Yjhe
         HhUhi3QjUQCEVDTgt+x7GyDiVKyVBVrOGDsJkGQJ0qdSyoGHYknND73rovqg6Pcu15wH
         ugS3RUXdtV7ZiaBG0OSDaYZ6kiumDVsgNEt90kEcD73J+dt/DbF0peG/kB/BtnXIUP4q
         rBEfHJs+UOjAwXjKNDZ05C2ZMVOcHXUzFyzBwC4gyuEzk7+sTiJUhxBleazTc/WJFgJi
         UDHpbHRV0OpI7TNIbUQLqJdVtYZQspqamD2QuLogE14k/35D+GuUzLG8Fl3Hw//9HUJ4
         rYpA==
X-Gm-Message-State: APjAAAW37PPJKY8zAmL/A4RS0h+qV+snejrnpbwR5ch80PVHKq6e9ad1
        qF7P1hCLcyfDIvQHPnplahE=
X-Google-Smtp-Source: APXvYqwzyOuZJqgrEqGk5ckOvAjzeH6Yh+/HufAQdFV4AXpJer4oPxFe3x+2qPBsY0spQGgjJr4fWA==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr11543282wrn.11.1563956717025;
        Wed, 24 Jul 2019 01:25:17 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 01:25:16 -0700 (PDT)
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
Subject: [PATCH v3 4/7] backlight: gpio: remove unused fields from platform data
Date:   Wed, 24 Jul 2019 10:25:05 +0200
Message-Id: <20190724082508.27617-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
References: <20190724082508.27617-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Remove the platform data fields that nobody uses.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

