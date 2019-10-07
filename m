Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAA6CDAB8
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Oct 2019 05:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbfJGDcL (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 6 Oct 2019 23:32:11 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40981 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbfJGDcK (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sun, 6 Oct 2019 23:32:10 -0400
Received: by mail-pf1-f195.google.com with SMTP id q7so7715424pfh.8
        for <linux-fbdev@vger.kernel.org>; Sun, 06 Oct 2019 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YdPiqrMx4DGxjMQly7Bs8yH/i3WsBA2bl/JSPtLQAlU=;
        b=CdUzkW995hDj+4VhwVg9oMZHUzQGlHk72ob3OVsXRVWZgf7+4PHcvudHA/4wmxF+Nx
         q+SIn6grfSFoMvOijlJ9pQ33jnn2HTj+q/fNdBXa9XiocAuw6VtpXZ6uq4TlDqtHtpoW
         uzBnJM5AkvSTCU9MtnTncl8QA8kaeg1O2tXI77iJpYeu/i7WyUxJzuzz7F21puHWx2Vv
         n3dkHdeaikrmzXLbNk9GudGvyDoVdGfiVsmDaMrvK8ByUz5nRuPw0Z4rzejlbciaT0p9
         oCxo5hLvx+sIIVu0Vn9kz6xNFGZ12WuMxEDcZWxk1OPqX2NpNxdx+GQmU1E8FXVLopYl
         n06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YdPiqrMx4DGxjMQly7Bs8yH/i3WsBA2bl/JSPtLQAlU=;
        b=stl/EHw42Nkan2lddTStuMKDKilX+RKo/1hbeCWno46mQwaHphyZMueerXgJT1e4k8
         VbXkHtLaLZB9LKCr2XOYDbWVoqULgjKnppA4xBjPqFuC/6v8JSk8Wqe209Fc6NbOcSle
         kRHUz3fib8KUji3tC29NpkbZbO/U5+dScrQDi8cjY7OMBVNDco7tzAUStQfW/52MJb7Q
         exL+kiJgg3W5bwMA4g5TW3113IJ6eaq/E1/y6lenjxTEOm95+Yn89ecDWotE2DZVO+dX
         fm1a4aH5sJTV1V/Acntc114ZB8X3Wnktwi4GM40+zg1A3lAHonQ1foPvLvHcxs8bls+G
         elGg==
X-Gm-Message-State: APjAAAVnC19dnYW/nNUuoKcGWOPyCyw7ZASXyfMnEphXLohSwGSo5qgw
        UWWgXAjklTJjQe889EaTQUpvpw==
X-Google-Smtp-Source: APXvYqzdOWFcsQosjrpnIGRE710tR911OOtW+TNB7GzyjXHdPq3QJaRmZyw9bD+GubnD2IvAJNhmSw==
X-Received: by 2002:a62:7d54:: with SMTP id y81mr30577794pfc.86.1570419128451;
        Sun, 06 Oct 2019 20:32:08 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net. [96.95.220.76])
        by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 20:32:08 -0700 (PDT)
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
Subject: [PATCH v5 4/7] sh: ecovec24: don't set unused fields in platform data
Date:   Mon,  7 Oct 2019 05:31:57 +0200
Message-Id: <20191007033200.13443-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007033200.13443-1-brgl@bgdev.pl>
References: <20191007033200.13443-1-brgl@bgdev.pl>
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

