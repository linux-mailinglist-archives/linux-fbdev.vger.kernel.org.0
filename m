Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC6944C7E
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2019 21:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729126AbfFMTnt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 13 Jun 2019 15:43:49 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37640 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729318AbfFMTng (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 13 Jun 2019 15:43:36 -0400
Received: by mail-pl1-f193.google.com with SMTP id bh12so8576342plb.4
        for <linux-fbdev@vger.kernel.org>; Thu, 13 Jun 2019 12:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AB616NjBSa9Vj9zUvVGBmMFoqPgqn8QM9MSbUPc9ICQ=;
        b=Yxrvkmixlfb/dkkn3muC+q7KBymUNvGxf3uq8JFtc1veDsLcXzlkkbky+1KOMyJJy5
         AUXgm4wSct7l+DLpaom1h3YgZ53bhvH7VMit/r23M13Zf7UJXpiZNBMpf5qKt8L5WZzR
         JCW00YgMSqhmw+cLWJ4x1BT1ucklGqtUb1zYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AB616NjBSa9Vj9zUvVGBmMFoqPgqn8QM9MSbUPc9ICQ=;
        b=HBiOl3SpR+DvovDlG0fEREHwZKixHgHjlYhw8jqg9U0CGvPwbEvVMELsfmsHoda+EE
         8NXsao8SnrXxH1iA72pk47G1Y8DUWm6tH+KMF/sdbXkjlO3PzAN3DpSIPcvIFxQ8/a4T
         +wPVRqCpB2fRviUY7WeRzlnHpdNvS3bqR0iJ8hrkMhommbv/c6x63VaiGpLJjn7lrzTu
         q2X8MOhOwuZgkS58wS0OU7tylu3fQ9jEWBJcKh1WtvNlflqL0QSA8U9/0d6R0cUckKnV
         jLbi/z5lnB+WwyJfdvJlK8CXdLQ6XTFbSwwh90dbKqdBDASa5IEDJsYJvJfs3+ZYcntF
         fRqQ==
X-Gm-Message-State: APjAAAVlEdGVdCQTpZN5Iy+3EwKBPXOTiTPBgF0Ycxw3D7uhvyXzloFM
        sFXO+NNikZXIEnkdWXkaHcsaDw==
X-Google-Smtp-Source: APXvYqzSKXohZs3Y1MuNYqnEVn0RY46WZktUdfaBzLXLJbhxNFxqybOloZxPtO9z7gXgrhS6QV+9tg==
X-Received: by 2002:a17:902:d695:: with SMTP id v21mr72975853ply.342.1560455016086;
        Thu, 13 Jun 2019 12:43:36 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id b17sm525029pfb.18.2019.06.13.12.43.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 12:43:35 -0700 (PDT)
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
Subject: [PATCH 3/4] backlight: pwm_bl: Set scale type for CIE 1931 curves
Date:   Thu, 13 Jun 2019 12:43:25 -0700
Message-Id: <20190613194326.180889-4-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190613194326.180889-1-mka@chromium.org>
References: <20190613194326.180889-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

For backlight curves calculated with the CIE 1931 algorithm set
the brightness scale type property accordingly. This makes the
scale type available to userspace via the 'scale' sysfs attribute.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/video/backlight/pwm_bl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index fb45f866b923..f067fe7aa35d 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -553,6 +553,8 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 		goto err_alloc;
 	}
 
+	memset(&props, 0, sizeof(struct backlight_properties));
+
 	if (data->levels) {
 		/*
 		 * For the DT case, only when brightness levels is defined
@@ -591,6 +593,8 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 
 			pb->levels = data->levels;
 		}
+
+		props.scale = BACKLIGHT_SCALE_CIE1931;
 	} else {
 		/*
 		 * That only happens for the non-DT case, where platform data
@@ -601,7 +605,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 
 	pb->lth_brightness = data->lth_brightness * (state.period / pb->scale);
 
-	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = data->max_brightness;
 	bl = backlight_device_register(dev_name(&pdev->dev), &pdev->dev, pb,
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

