Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA3BDFF96
	for <lists+linux-fbdev@lfdr.de>; Tue, 22 Oct 2019 10:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731296AbfJVIgs (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 22 Oct 2019 04:36:48 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36999 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731281AbfJVIgr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 22 Oct 2019 04:36:47 -0400
Received: by mail-wr1-f65.google.com with SMTP id e11so8290543wrv.4
        for <linux-fbdev@vger.kernel.org>; Tue, 22 Oct 2019 01:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fJb9zTJUFk5gt04WV606l1pH2Oso/m6U1KjJZ/jsQAQ=;
        b=Fl1qTLhBQubCYTQvRFZGlqbpTFflj9tu3q08e1MlJzphl6MWRcspjYmiPTZQO2Nj6m
         L8FuqvAa/MmSqZfgRT8BK0odPTKh92doGHJtbxLFNYQ3Jq2IqO3h+/SX7sLrKDVjoZtO
         NcsW0dTxbzZRRQW+zVYC1/6FTVbUgWunR1cAtZ3QCODI0ZCAAS2VbKr/ZExzWJTjRnsS
         KZLvPQUIrnpg2BtCQrB5jK7IDHSB+/Xb4so9Es0sPAL3l52ve8BH3H/ygjsm0WkUjgPo
         z2OAjaxIvLaCP34M2mpYEXRyVWyNDFawxbs0agydIqrrRAhnwOhSTieVDVfZL8yBb/J3
         YAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fJb9zTJUFk5gt04WV606l1pH2Oso/m6U1KjJZ/jsQAQ=;
        b=H8GU+qKrDeV40y10urCzxdCBTfAq06DpLuuo86xn68PRbqv4TuBCD78pTCjOeytSge
         UE+qiEltuzqvYHRal4tWVKPjQpeETAOndwuapuwOZ1VGItyt3dQd08nDPbLOr5V8CA8C
         YUV+O/Q74bw4s96ejPYdLTIUoLYjXC7oVc7eHisPP1fgFRKlV8e9BiGHn0//zx9LSPtd
         r99Te+9F7zT5Tv3zSoy3V03h+Mcxc2bVWShirDCJJUD7OcgK5fQsU2lyXtdradupaNse
         RCvwdoKPEydFYjwVdV9edOLaxWTYq89pyj99sMGNNG+mskv3CJVBRUdWhkSk5wKwCuhr
         2XYw==
X-Gm-Message-State: APjAAAXEwf2klkULl5hCcduKYgz5BpQc8OBq6CumtYQWGQdHOYgg2aDh
        CfWsWbLjJfHxxd79S0bnsxXdzQ==
X-Google-Smtp-Source: APXvYqw+u7/kRo/kyLMNI3vyXRrtnO/cCP4ewAM9p5Okg1CflyD/yuwcP6eDPcrZB/Mod7dBy1vY5g==
X-Received: by 2002:a5d:44c8:: with SMTP id z8mr2324652wrr.66.1571733404239;
        Tue, 22 Oct 2019 01:36:44 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:36:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v7 7/9] backlight: gpio: remove unused fields from platform data
Date:   Tue, 22 Oct 2019 10:36:28 +0200
Message-Id: <20191022083630.28175-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
References: <20191022083630.28175-1-brgl@bgdev.pl>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
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
2.23.0

