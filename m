Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB20629579A
	for <lists+linux-fbdev@lfdr.de>; Thu, 22 Oct 2020 07:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507753AbgJVFF0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 22 Oct 2020 01:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2507743AbgJVFFZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 22 Oct 2020 01:05:25 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6AACC0613CE
        for <linux-fbdev@vger.kernel.org>; Wed, 21 Oct 2020 22:05:25 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k8so302900pjd.0
        for <linux-fbdev@vger.kernel.org>; Wed, 21 Oct 2020 22:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C5BT7RMAs0/3eZgZYHYOxHc0EDbBzG7anVqARFZyeFU=;
        b=XvKUfgUyd0NYeIZvTa6xCzLGIitiKOVTaHiXd1A5cdyCbdS3RCSwPmT14tINVj7p58
         ZjoILcgKrUbr6CoGWbGZF9RCNbMTFPuO/zhUjpIFQfkzBxxzAdtsXrLiUAHoV0m4gqxo
         dz2gHjjHe7+PfcAiXLawFvftyX/rYLCXQBpzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C5BT7RMAs0/3eZgZYHYOxHc0EDbBzG7anVqARFZyeFU=;
        b=EbHW4oCi3BW6zPKXD19uyuERjisbC9y/O/IsZtDm8tFJ/of6zQBHzp+y2iciCRHQTl
         4hVCVS7/2Gbe/Qz2TMvTXpFwXiSg7dp3fHlkXCXOYSNllLNsvUvaUK8lzQAmUim3jP1X
         mCwMxxfqyEMfUzMmUFSe1sBXVugHkXldBd1HC+d8uPXOxyMPpLGhYjoskFf8RGCrUzBu
         74r3fEZnxRhUXlhhUrQ3GMTOaZFWneu1BGOOm+bBv3NTyrw5j6esKKma1RSblJNTD0hg
         IYYQvs5VLFM0zgB0+RKJn46LsT+hQOz8pf5Jzpd9HJnk4IDL6dX4vZBITDwu5YJ24Ckv
         5P7g==
X-Gm-Message-State: AOAM531V7DQNIKtYlOpGw5jYjA0aYOaDN2kCXOGhx19r7FFgCOEb6A9b
        59LlT/j+xAw4xb/XqrqmZJ+cRQ==
X-Google-Smtp-Source: ABdhPJyF93+jSyPOMyLP8D6FYrIUtIyWICWGBG+huvjxyS7+ozDTFec/xOcF8Xh72SHjeUSPsWehQw==
X-Received: by 2002:a17:90a:840d:: with SMTP id j13mr772927pjn.31.1603343125231;
        Wed, 21 Oct 2020 22:05:25 -0700 (PDT)
Received: from alex-desktop.lan (c-73-63-253-164.hsd1.ca.comcast.net. [73.63.253.164])
        by smtp.gmail.com with ESMTPSA id q16sm394954pfu.206.2020.10.21.22.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 22:05:24 -0700 (PDT)
From:   Alexandru Stan <amstan@chromium.org>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Alexandru Stan <amstan@chromium.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v3 3/3] backlight: pwm_bl: Fix interpolation
Date:   Wed, 21 Oct 2020 22:04:45 -0700
Message-Id: <20201021220404.v3.3.I4dcea1c90e9da3902d466033aa73351e19e49c49@changeid>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022050445.930403-1-amstan@chromium.org>
References: <20201022050445.930403-1-amstan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The previous behavior was a little unexpected, its properties/problems:
1. It was designed to generate strictly increasing values (no repeats)
2. It had quantization errors when calculating step size. Resulting in
unexpected jumps near the end of some segments.

Example settings:
	brightness-levels = <0 1 2 4 8 16 32 64 128 256>;
	num-interpolated-steps = <16>;

Whenever num-interpolated-steps was larger than the distance
between 2 consecutive brightness levels the table would get really
discontinuous. The slope of the interpolation would stick with
integers only and if it was 0 the whole line segment would get skipped.

The distances between 1 2 4 and 8 would be 1 (property #1 fighting us),
and only starting with 16 it would start to interpolate properly.

Property #1 is not enough. The goal here is more than just monotonically
increasing. We should still care about the shape of the curve. Repeated
points might be desired if we're in the part of the curve where we want
to go slow (aka slope near 0).

Problem #2 is plainly a bug. Imagine if the 64 entry was 63 instead,
the calculated slope on the 32-63 segment will be almost half as it
should be.

The most expected and simplest algorithm for interpolation is linear
interpolation, which would handle both problems.
Let's just implement that!

Take pairs of points from the brightness-levels array and linearly
interpolate between them. On the X axis (what userspace sees) we'll
now have equally sized intervals (num-interpolated-steps sized,
as opposed to before where we were at the mercy of quantization).

END

Signed-off-by: Alexandru Stan <amstan@chromium.org>
---

 drivers/video/backlight/pwm_bl.c | 70 ++++++++++++++------------------
 1 file changed, 31 insertions(+), 39 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index dfc760830eb9..e48fded3e414 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -230,8 +230,7 @@ static int pwm_backlight_parse_dt(struct device *dev,
 				  struct platform_pwm_backlight_data *data)
 {
 	struct device_node *node = dev->of_node;
-	unsigned int num_levels = 0;
-	unsigned int levels_count;
+	unsigned int num_levels;
 	unsigned int num_steps = 0;
 	struct property *prop;
 	unsigned int *table;
@@ -260,12 +259,11 @@ static int pwm_backlight_parse_dt(struct device *dev,
 	if (!prop)
 		return 0;
 
-	data->max_brightness = length / sizeof(u32);
+	num_levels = length / sizeof(u32);
 
 	/* read brightness levels from DT property */
-	if (data->max_brightness > 0) {
-		size_t size = sizeof(*data->levels) * data->max_brightness;
-		unsigned int i, j, n = 0;
+	if (num_levels > 0) {
+		size_t size = sizeof(*data->levels) * num_levels;
 
 		data->levels = devm_kzalloc(dev, size, GFP_KERNEL);
 		if (!data->levels)
@@ -273,7 +271,7 @@ static int pwm_backlight_parse_dt(struct device *dev,
 
 		ret = of_property_read_u32_array(node, "brightness-levels",
 						 data->levels,
-						 data->max_brightness);
+						 num_levels);
 		if (ret < 0)
 			return ret;
 
@@ -298,7 +296,13 @@ static int pwm_backlight_parse_dt(struct device *dev,
 		 * between two points.
 		 */
 		if (num_steps) {
-			if (data->max_brightness < 2) {
+			unsigned int num_input_levels = num_levels;
+			unsigned int i;
+			u32 x1, x2, x, dx;
+			u32 y1, y2;
+			s64 dy;
+
+			if (num_input_levels < 2) {
 				dev_err(dev, "can't interpolate\n");
 				return -EINVAL;
 			}
@@ -308,14 +312,7 @@ static int pwm_backlight_parse_dt(struct device *dev,
 			 * taking in consideration the number of interpolated
 			 * steps between two levels.
 			 */
-			for (i = 0; i < data->max_brightness - 1; i++) {
-				if ((data->levels[i + 1] - data->levels[i]) /
-				   num_steps)
-					num_levels += num_steps;
-				else
-					num_levels++;
-			}
-			num_levels++;
+			num_levels = (num_input_levels - 1) * num_steps + 1;
 			dev_dbg(dev, "new number of brightness levels: %d\n",
 				num_levels);
 
@@ -327,24 +324,25 @@ static int pwm_backlight_parse_dt(struct device *dev,
 			table = devm_kzalloc(dev, size, GFP_KERNEL);
 			if (!table)
 				return -ENOMEM;
-
-			/* Fill the interpolated table. */
-			levels_count = 0;
-			for (i = 0; i < data->max_brightness - 1; i++) {
-				value = data->levels[i];
-				n = (data->levels[i + 1] - value) / num_steps;
-				if (n > 0) {
-					for (j = 0; j < num_steps; j++) {
-						table[levels_count] = value;
-						value += n;
-						levels_count++;
-					}
-				} else {
-					table[levels_count] = data->levels[i];
-					levels_count++;
+			/*
+			 * Fill the interpolated table[x] = y
+			 * by draw lines between each (x1, y1) to (x2, y2).
+			 */
+			dx = num_steps;
+			for (i = 0; i < num_input_levels - 1; i++) {
+				x1 = i * dx;
+				x2 = x1 + dx;
+				y1 = data->levels[i];
+				y2 = data->levels[i + 1];
+				dy = (s64)y2 - y1;
+
+				for (x = x1; x < x2; x++) {
+					table[x] = y1 +
+						div_s64(dy * (x - x1), dx);
 				}
 			}
-			table[levels_count] = data->levels[i];
+			/* Fill in the last point, since no line starts here. */
+			table[x2] = y2;
 
 			/*
 			 * As we use interpolation lets remove current
@@ -353,15 +351,9 @@ static int pwm_backlight_parse_dt(struct device *dev,
 			 */
 			devm_kfree(dev, data->levels);
 			data->levels = table;
-
-			/*
-			 * Reassign max_brightness value to the new total number
-			 * of brightness levels.
-			 */
-			data->max_brightness = num_levels;
 		}
 
-		data->max_brightness--;
+		data->max_brightness = num_levels - 1;
 	}
 
 	return 0;
-- 
2.28.0

