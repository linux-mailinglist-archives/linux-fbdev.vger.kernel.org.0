Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC8C63B92
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Jul 2019 21:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbfGITAQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 9 Jul 2019 15:00:16 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35276 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfGITAO (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 9 Jul 2019 15:00:14 -0400
Received: by mail-pg1-f196.google.com with SMTP id s27so9926001pgl.2
        for <linux-fbdev@vger.kernel.org>; Tue, 09 Jul 2019 12:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m85WlLZHJVH8RETgsg0HqiVDllfx4XvsXRbdu3drMNc=;
        b=isQf2VDU03YGOtf8dFbZaoe7mOqoq6z2fbnfI76lyieAkq9c/O3MWRQWJsEu7o6Kv6
         +sO3jC2+6lChlABv2PHw4N+6FJo/vPGNbtghULmIYVEdHFqpxVU20P941UYVUnUfnmw0
         h+yt4jFHUsAjNf4RH7qkXTZR+LeFbJpXpHuk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m85WlLZHJVH8RETgsg0HqiVDllfx4XvsXRbdu3drMNc=;
        b=Ln98a5x+eP/xi4ffq7mwtdtNLnwkgNIS/QSXFNL1p9+dMA3I8VXjhOAvBjLga3cd1N
         004rpn4pgbberMe9uHszIrqTVP+tyOwcf8cJtilREuxn6EcpJpEf13mCaNzY9RogR2cI
         cNAwIeiBqvSKdtBfQA4T4RnP24nF7tI1KJkviZYTqHsu5jlYrM1Ju5Og7X+ok/gcnbNS
         +9np1cT/fq67cOZ7IxwyF/KhEPAZGAcSyQrx0pgbqBPMm1KHP6G9T/NixF+0IXAvVoMy
         nt90L39N3r4FDue2Svv4kkSN+bqH963R+xy1U6ZXYUXT+LE9k26arP7JbZWyZ0PAYDFS
         K5+Q==
X-Gm-Message-State: APjAAAX/lyWglNQZMA3Vkb2LIV2oZ2fhIcdQ5QSqjkXpScDfoU8T0Vhj
        cDQhDUFv5VyFOtdGIGvQATuFfw==
X-Google-Smtp-Source: APXvYqxDiBZW0Xb64K9vuI4D4EUi9LKfdzKQ60nHEzq2OO07kpy0OeqgLete4I10Vsc93WIyQfVezg==
X-Received: by 2002:a63:a1a:: with SMTP id 26mr31979652pgk.265.1562698814151;
        Tue, 09 Jul 2019 12:00:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id g62sm3356521pje.11.2019.07.09.12.00.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 12:00:13 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 1/4] MAINTAINERS: Add entry for stable backlight sysfs ABI documentation
Date:   Tue,  9 Jul 2019 12:00:04 -0700
Message-Id: <20190709190007.91260-2-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190709190007.91260-1-mka@chromium.org>
References: <20190709190007.91260-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Add an entry for the stable backlight sysfs ABI to the MAINTAINERS
file.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
Changes in v3:
- none

Changes in v2:
- added Daniel's 'Acked-by' tag
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 57f496cff999..d51e74340870 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2857,6 +2857,7 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 F:	Documentation/devicetree/bindings/leds/backlight
+F:	Documentation/ABI/stable/sysfs-class-backlight
 
 BATMAN ADVANCED
 M:	Marek Lindner <mareklindner@neomailbox.ch>
-- 
2.22.0.410.gd8fdbe21b5-goog

