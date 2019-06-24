Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDF7E51C60
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jun 2019 22:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731798AbfFXUbY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Jun 2019 16:31:24 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39047 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731786AbfFXUbW (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Jun 2019 16:31:22 -0400
Received: by mail-pf1-f196.google.com with SMTP id j2so8162662pfe.6
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Jun 2019 13:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JP95lZdX+e5+GJVUv6OxKodaA7GTVH/s6o/zZ4o6Yqk=;
        b=GH6GaNaGuD+3/lq/E8qiZgIhrqY4POMDMF6xHbas+S9+1gjPhAdu+raSlGPuBLqD9g
         BkKsc+XCH1g3Z10BQaTguBLuGNZWvrF/v7D7o9CGRm3XNhjIs+7yeIKYYcTpDmT9I9R8
         CIvyVtU+X72CfuHwtLu5CTf7kBuk4/yEwY9wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JP95lZdX+e5+GJVUv6OxKodaA7GTVH/s6o/zZ4o6Yqk=;
        b=dyihgq95AwLlVAcJucET6ekc+b0vx5+Bf+77k7Mn5n7ffth0nTqzAD0hfCX8mEEZR4
         Qm2/wTkUhcaUzcxQc1jm6HZ+5UUB+n6yvoTQm03c7h1lZmZ4gz69Elbu9S2BRlqBFW7O
         0hZn1InNb+OxUrDNkhc75DfLY5AoXY/Rv0/lE1lJtR/zx5mQrVYGLhO+TQjCLXbMDqpa
         1QEmDQKUMmUtw3dR2YX/GWNWY2UV+Dy+mH/nioBgN9W1M+lJvIPJROyRDaDADLcciYTl
         LimvGWDg6OBbRJg2HW2uYAHwGi24F/xGAadLjacn9l6GEUTX8zD7z59ERDLw3MkUNiNS
         PGgA==
X-Gm-Message-State: APjAAAVG3d9Ek90GxC+ibhoESAVbZoLF1vbW1hLc1ZUWQ5Rx7nLuo3zh
        GJgDT2mSjO9+nVjo/0ywB5cviQ==
X-Google-Smtp-Source: APXvYqw9jBap6wGYgRpzAJeJ6bDMEgATfqj/PCB+aRPwnHh0ax4ayLJ9RddKSYOnMpDP5vtjzzt8pg==
X-Received: by 2002:a17:90a:cd04:: with SMTP id d4mr27797860pju.128.1561408281769;
        Mon, 24 Jun 2019 13:31:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id r198sm6217026pfc.149.2019.06.24.13.31.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 13:31:21 -0700 (PDT)
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
Subject: [PATCH v2 1/4] MAINTAINERS: Add entry for stable backlight sysfs ABI documentation
Date:   Mon, 24 Jun 2019 13:31:10 -0700
Message-Id: <20190624203114.93277-2-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190624203114.93277-1-mka@chromium.org>
References: <20190624203114.93277-1-mka@chromium.org>
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

