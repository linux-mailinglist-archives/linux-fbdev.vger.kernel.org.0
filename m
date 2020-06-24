Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D5520768A
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2020 17:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404358AbgFXPEt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Jun 2020 11:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404348AbgFXPEr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Jun 2020 11:04:47 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5AC1C061795
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jun 2020 08:04:46 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g75so2635771wme.5
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jun 2020 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+OscN/rzPmV+Ca3LDqP3+7QfjG8tQ3er8qfNyGN0efc=;
        b=XNDfNdRiXmh7t9RgId/4XIu21fy4oogY+Nr/WCo6/NyZHQ4Itv6OslAVjjAeFK19iG
         i0f5xKyDMsV7Y4sxJPI9YCbK1EV5DMyQj7kn5az4goE+ZWa4Hc/EbVOv8PPGwvzyvzbE
         4WqWCqGHmNWK5VT5Y/FG+T47fTbw53DNfdHg44MNHKBE2UAvgbjqSEO0jtByy5F7T5G/
         ErFuGywjPZ/ZLSOfBNKzhIRi6Zi+cXmpf6gCITOXFnk+trenk9HoqGajs0aLJ5DdlAuo
         iL8KWarHIl3WczC77gRnj4JI3dHaFMqREtkO9wIJig1PkRUTzCNZ3nVTe0zR5R0gh3Gu
         h8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+OscN/rzPmV+Ca3LDqP3+7QfjG8tQ3er8qfNyGN0efc=;
        b=nOy2zxs4GhvS5eADC0Mp71ldaUEZ+aIosrq0cmqNKRrJmwHn64zDfFm9qUkcE7ldJq
         MV84VQxIHSMEv6CYEG0adUKR4aw8X4hRzbtJpHdkD+uIatVyb/dm4zCCdTsIrQbxouCm
         nX9dSBWSypXTLtY5WtZgl9TbD0J4RBGRhIDSc9UfxXG6sKIrHOV9hWR1U8ggTYY+x1p0
         L6l8iSbDbj10JCOtEb8oHVc7M2PFKwP5+Fku5qC3vWmJ+WFxZmqj0CBMpTyWu0qnbYCc
         aIeMw2/lia10q+khY7KLhnIuQBMSpDouyzmg8Skxz/TwqhVIunUTWmmmGCGINOI1d2P2
         DjPw==
X-Gm-Message-State: AOAM533hMWBB7vu+cX5ZrueyE/TBFqUxiZyL4bdznFUz0D0UIzPyoJnb
        TPtxWPKUJWIoPXYcHySQLk0hfw==
X-Google-Smtp-Source: ABdhPJwVNF8XQROSvPdr0XQdKc3EWPYY8aw/n5FerSWHfY3zltFgb+IFcI7EijR9JNDoP40hEcO9eQ==
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr16795235wmi.95.1593011085576;
        Wed, 24 Jun 2020 08:04:45 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:04:44 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, stable@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Software Engineering <sbabic@denx.de>
Subject: [PATCH 4/8] backlight: ili922x: Remove invalid use of kerneldoc syntax
Date:   Wed, 24 Jun 2020 15:57:17 +0100
Message-Id: <20200624145721.2590327-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200624145721.2590327-1-lee.jones@linaro.org>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Kerneldoc is for documenting function arguments and return values.

Prevents warnings like:

 drivers/video/backlight/ili922x.c:127: warning: cannot understand function prototype: 'int ili922x_id = 1; '
 drivers/video/backlight/ili922x.c:136: warning: cannot understand function prototype: 'struct ili922x '

Cc: <stable@vger.kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Software Engineering <sbabic@denx.de>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/backlight/ili922x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
index 8cb4b9d3c3bba..cd41433b87aeb 100644
--- a/drivers/video/backlight/ili922x.c
+++ b/drivers/video/backlight/ili922x.c
@@ -123,7 +123,7 @@
 
 #define set_tx_byte(b)		(tx_invert ? ~(b) : b)
 
-/**
+/*
  * ili922x_id - id as set by manufacturer
  */
 static int ili922x_id = 1;
@@ -132,7 +132,7 @@ module_param(ili922x_id, int, 0);
 static int tx_invert;
 module_param(tx_invert, int, 0);
 
-/**
+/*
  * driver's private structure
  */
 struct ili922x {
-- 
2.25.1

