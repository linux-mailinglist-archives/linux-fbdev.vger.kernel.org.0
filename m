Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10A3B70876
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 20:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731757AbfGVSZF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 14:25:05 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42526 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731812AbfGVSZF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 14:25:05 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay6so19553533plb.9
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 11:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gkGn8pX+SnGbncQZILWgKTNC3yYNo8zAMY1G6oxP7Bk=;
        b=kODRaWBKJXyuIRTX369dvcz8KsHsvOXWSPRckcRa6ktNtHmxUsikmQlXEMgVRiPoeq
         x7NoYUYH8Oo67zCDzUZ7wEDv9Hzk/Sk5FxtB3AcougBOrP4zw/IuxrqGJXNSUKywLpqf
         SqCtChZV6KHIRQ+rM0myXRa1+dwp1B6eBHx64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gkGn8pX+SnGbncQZILWgKTNC3yYNo8zAMY1G6oxP7Bk=;
        b=TqlHXJJYgfxz5XKP3qSeruESFhDAbdCRvsAE9Z2k3r+b4surM6ZMxWUiR0Hs5szqq8
         rz43Yl1Ahu0KvmjRQcbnJJcVI0T+ZhwRatDjuC5ZbhEL88NxESaJPyHoK1g+WLQOKbLj
         1kFdRuwEjAkrur7HADI+isGMD9OOqKcPTJoN3vMRWT4nSJe5Lic3muW3YmwC+AHhMGWJ
         FKPAMmQrnaVPqOCMOZFAUGAFypSv2V9OqzW9GfxyPEpYQ+EJJU1n5uRM1SS37r637LzX
         6a8cfXJq+AOIm8cDv7ZYZG2ZLgvmBT0dQ+xBoK34SALXwPbUE61bfU00Mkv98aDn3ZXr
         YKMQ==
X-Gm-Message-State: APjAAAWSDD74x/bV/qAmpEG0qbwc6xL4YEg+o+smBHWVLTfyvmVS/5lK
        qYmFNxvjbB1qapJj1h/j0D6R7Q==
X-Google-Smtp-Source: APXvYqwt8O0L83AANnlACuiSZO0y3AW9dmuUUC7ooEfiwSxSjS1wz+BGd5M4s1GjUn44c68TKPzdkg==
X-Received: by 2002:a17:902:9688:: with SMTP id n8mr75084152plp.227.1563819904526;
        Mon, 22 Jul 2019 11:25:04 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id a3sm36117683pfl.145.2019.07.22.11.25.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 11:25:04 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     David Airlie <airlied@linux.ie>, linux-fbdev@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] video: of: display_timing: Add of_node_put() in of_get_display_timing()
Date:   Mon, 22 Jul 2019 11:24:36 -0700
Message-Id: <20190722182439.44844-2-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
In-Reply-To: <20190722182439.44844-1-dianders@chromium.org>
References: <20190722182439.44844-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From code inspection it can be seen that of_get_display_timing() is
lacking an of_node_put().  Add it.

Fixes: ffa3fd21de8a ("videomode: implement public of_get_display_timing()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/video/of_display_timing.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
index f5c1c469c0af..5eedae0799f0 100644
--- a/drivers/video/of_display_timing.c
+++ b/drivers/video/of_display_timing.c
@@ -119,6 +119,7 @@ int of_get_display_timing(const struct device_node *np, const char *name,
 		struct display_timing *dt)
 {
 	struct device_node *timing_np;
+	int ret;
 
 	if (!np)
 		return -EINVAL;
@@ -129,7 +130,11 @@ int of_get_display_timing(const struct device_node *np, const char *name,
 		return -ENOENT;
 	}
 
-	return of_parse_display_timing(timing_np, dt);
+	ret = of_parse_display_timing(timing_np, dt);
+
+	of_node_put(timing_np);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(of_get_display_timing);
 
-- 
2.22.0.657.g960e92d24f-goog

