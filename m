Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75C2227795
	for <lists+linux-fbdev@lfdr.de>; Tue, 21 Jul 2020 06:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgGUE1V (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 21 Jul 2020 00:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgGUE1U (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 21 Jul 2020 00:27:20 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677D3C0619D5
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Jul 2020 21:27:20 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id q17so10107243pfu.8
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Jul 2020 21:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N/wJfZ0DKQLS30NQ3l5EIxZJq9J06grk8ARjTDSck7w=;
        b=PFRa/z5GQ2aechR5xdic5ratkkROo9TDbkDV0lfEhzl5c2wyBrpnCvl57h3r6cKVo6
         pxMZ02n3ejPcvOlM99KP4pcnPYYp5sRlNo/dXiQZyn4d8IORomjDiBWZKyIRJOjrllZF
         SdnwlQpb6nT2RAeLooiCOTqO33gn75W0W9hgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N/wJfZ0DKQLS30NQ3l5EIxZJq9J06grk8ARjTDSck7w=;
        b=XjhqmqYIUlXcHEQogfNsYPjJmN7MWfqduopYRoS2/IiiUScGf/YxDxLdR2m4vbCeWE
         5+1sHlnkeemCs+WLOOg0CXZBkSZFyTPBd5LMqsvM0w8qgBOcFWZ/OvrH8QY1Qe3R25eF
         HJxyRCoWq2jA2EDcHuKkHI3vwa2gMDzUEA2biEBECZlO+csb1FrGZadnVseKAMnTz/RL
         zhk7l/mb6yiWuLaM1rYppHTCV1gc5q9IYFmnzs9l5uToZW8If5XTwc80KYNLMvxGj0ao
         orXNzXbkcbD7ZE6/XWg71yLsTRxQ9y9aPfdKLV2ipQuW8bx5skNLoBEjSUUXCOIhTRYb
         55Xg==
X-Gm-Message-State: AOAM530GiITkg0uwyD8q32dz1gEWBMK8Kgxf36RYI2DTcBEmjUt2mmFX
        xKf6l4Q1RZgirZZVCXygF5/aMQ==
X-Google-Smtp-Source: ABdhPJyUx8c12Dq9u0oNfnaJvKI51s1Ej6i9NFYa2LGNRTz8LXng/MMLgsjl9D/uUGj8e5JMXp2RVw==
X-Received: by 2002:a62:647:: with SMTP id 68mr12022813pfg.45.1595305639994;
        Mon, 20 Jul 2020 21:27:19 -0700 (PDT)
Received: from alex-desktop.lan (c-73-63-253-164.hsd1.ca.comcast.net. [73.63.253.164])
        by smtp.gmail.com with ESMTPSA id o8sm1207075pjf.37.2020.07.20.21.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 21:27:19 -0700 (PDT)
From:   Alexandru Stan <amstan@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Alexandru Stan <amstan@chromium.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH 2/3] backlight: pwm_bl: Artificially add 0% during interpolation
Date:   Mon, 20 Jul 2020 21:25:21 -0700
Message-Id: <20200720212502.2.Iab4d2192e4cf50226e0a58d58df7d90ef92713ce@changeid>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200721042522.2403410-1-amstan@chromium.org>
References: <20200721042522.2403410-1-amstan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Some displays need the low end of the curve cropped in order to make
them happy. In that case we still want to have the 0% point, even though
anything between 0% and 5%(example) would be skipped.

Signed-off-by: Alexandru Stan <amstan@chromium.org>
---

 drivers/video/backlight/pwm_bl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 5193a72305a2..b24711ddf504 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -349,6 +349,14 @@ static int pwm_backlight_parse_dt(struct device *dev,
 			/* Fill in the last point, since no line starts here. */
 			table[x2] = y2;
 
+			/*
+			 * If we don't start at 0 yet we're increasing, assume
+			 * the dts wanted to crop the low end of the range, so
+			 * insert a 0 to provide a display off mode.
+			 */
+			if (table[0] > 0 && table[0] < table[num_levels - 1])
+				table[0] = 0;
+
 			/*
 			 * As we use interpolation lets remove current
 			 * brightness levels table and replace for the
-- 
2.27.0

