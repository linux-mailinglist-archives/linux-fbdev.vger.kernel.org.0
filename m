Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE61CDD76E
	for <lists+linux-fbdev@lfdr.de>; Sat, 19 Oct 2019 10:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfJSIgW (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 19 Oct 2019 04:36:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44675 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbfJSIgU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 19 Oct 2019 04:36:20 -0400
Received: by mail-wr1-f65.google.com with SMTP id z9so8527538wrl.11
        for <linux-fbdev@vger.kernel.org>; Sat, 19 Oct 2019 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YdPiqrMx4DGxjMQly7Bs8yH/i3WsBA2bl/JSPtLQAlU=;
        b=KTrWMJfcSsNsU/hInH+8etvSbXWxmCunj3myy9w3kenbKYKLPvPV2HXvi/9ONkNlby
         JlacPZ3LR4yVNif1PlgZpYgm6GvDWNCsxclVp+7fpsz9MlOznlaVrG9I85dnSyZcPjuK
         zZTZrKKoHTU/wnkEaBL9oEttLxsLvew/TtYzrVTXdL4dWZQ4NtjZyZq6UYkDskdNSgWP
         Aw7QdUQ0Pi9iYxj9wqB9guvcDwKlzlHqSbrPiqZ9iUULr1G+gvARZZTFhGNhXxAxkcXm
         EBhC3iFA9YN46vY/ako/Gp2L4ASzbDaTlcUsXZxo3XR04DIEVlIbKINwG1cLyh8dPg2u
         /HUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YdPiqrMx4DGxjMQly7Bs8yH/i3WsBA2bl/JSPtLQAlU=;
        b=AXXuceQLEj/nP3ntYdt7v7Fj1CGZGasXVeil8IZahAu/9Nc3nzQkaSCq59FHzCbbeP
         KGvxkQITVuukvw5bwlYXDPXmeGWjkAXpxTnU+S+18imlY7A7Q+ZpHerVNqfxYwcor+cB
         CuH2iKjuO+2vOOm+WhWVxbekbMWcs94lJgmJB0dwTHyZXo3jWCL6PBMmAJF20hv+ORsL
         Sn9M1zcVWj3pAjFBztdY9ZbMfeHMvqaYW8NjdMMp9p3uLpi+nq4NAwp0U/jPgZol7jr/
         nS4MP5+Q17pOtHnNLnueAg9v7pwCgeLCC6+kuUk5Ue8nSz1f2sKFzyC9ZQWyZDGuDUBZ
         cK6g==
X-Gm-Message-State: APjAAAVsmuiQkB9z/Z7iidb7kshfSz450gdPxiQBDlFDukdiFSEvo1UP
        hfkUNTO4Ve5nX2bB1iVHFwI8bw==
X-Google-Smtp-Source: APXvYqyMb3UE4kvzJU/RtmQDyFjei6QR5gPK148b8ly3ekSY2I6LEvUTkS+/jEFISaVozTN+hXpUFA==
X-Received: by 2002:adf:c105:: with SMTP id r5mr4342828wre.125.1571474177563;
        Sat, 19 Oct 2019 01:36:17 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2019 01:36:17 -0700 (PDT)
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
Subject: [PATCH v6 6/9] sh: ecovec24: don't set unused fields in platform data
Date:   Sat, 19 Oct 2019 10:35:53 +0200
Message-Id: <20191019083556.19466-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019083556.19466-1-brgl@bgdev.pl>
References: <20191019083556.19466-1-brgl@bgdev.pl>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/sh/boards/mach-ecovec24/setup.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index aaa8ea62636f..dd427bac5cde 100644
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
2.23.0

