Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84FE870181
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 15:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730688AbfGVNon (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 09:44:43 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:32989 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730658AbfGVNon (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 09:44:43 -0400
Received: by mail-wm1-f67.google.com with SMTP id h19so28824803wme.0
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ut01oNwMX57rewfZ2xdsVgjWVgPo2hqv1zk7e2eNV1c=;
        b=Mbw6mQ9KduwIta89J1LYlF6kc7o9GduaI0+z36i+2YY7oFXW+PCLPTx4jo/x6p2lrr
         bmnE83LSxvIXiByTDGashJrMHQFIDsfkQOAym7PDLEp7mOrwZdITOnei15kO7/TIwW92
         9UairCADBliTVQSS4u9xdgFDh3yLDQOsfhO4I+F1vjLKSAnjdyh+5v3xVb3mLqlS2zkV
         YxV5QorVrwRlzvMhRYmTt8lY1h8nuFPSnpAeBJT0SLyrhCvYO8ZogPoIl0Huw6jxgnZ0
         o+EJiIkgWqa6jBvcMAH+Cj6fVgT8sENWgCKGrQLxfOCYp7YQxrxvMQdxt/pxvso7qJf9
         6s1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ut01oNwMX57rewfZ2xdsVgjWVgPo2hqv1zk7e2eNV1c=;
        b=jBm8kxpDJyp2hD4dCwAdUt8rEuvIFMNzLTpSZK2ARi4w/fg6iDqVSffG3YTGaZROvZ
         9qSPS5CQf0ickv+jK5taV6ZUhQsMbKy9ohsVgOOnFSd8kDdeKt7d1Ol4UFg5OycGjTIf
         WFt5QOdhdzYecj4xjIOra2y7S5VZEr1uuu/59Ith/PHDLI4TMMpEFpPTHHKcmgCejZCo
         GFMchb65mu/ulBIY0TxXe2LZNZkiVCAmp50gyS062W+g/96tjEy1TD2su/iv3K/ThfO3
         ceVoPQYuS3KNtGW2+MUlyiHKqrEZRI7B6xMmq8TfKjqdLoCVJZyU8e1SX75gz2srZAD6
         QQkQ==
X-Gm-Message-State: APjAAAV0KciDLgMSgS/PR0Cnk+gOT58VHVqCU7FxdEkoU8Hz770dnvb1
        P5V6zKTgaQhZXCd3W5tZ0WI=
X-Google-Smtp-Source: APXvYqzqrhDn87TPfR0stSfqmLuYDN1SzTLtME8rAq3V9wDoFdme8RgMbrLtcH/C2F3SJsvmcaSLPA==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr59100904wma.123.1563803081131;
        Mon, 22 Jul 2019 06:44:41 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id p6sm40652484wrq.97.2019.07.22.06.44.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 06:44:40 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 2/9] ARM: davinci_all_defconfig: enable GPIO backlight
Date:   Mon, 22 Jul 2019 15:44:16 +0200
Message-Id: <20190722134423.26555-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722134423.26555-1-brgl@bgdev.pl>
References: <20190722134423.26555-1-brgl@bgdev.pl>
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
index 7c2a39305f2b..56c23f8d9f26 100644
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

