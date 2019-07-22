Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 041F770878
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 20:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731963AbfGVSZH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 14:25:07 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37862 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731905AbfGVSZG (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 14:25:06 -0400
Received: by mail-pf1-f193.google.com with SMTP id 19so17774386pfa.4
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=phxXam+NzCk41fkXQIfIPhu7NO3JuGp0Zqj7GYLvO5g=;
        b=VORIvKvZyl9su9iT0PV3CqryHSefcsep6woCoAACriNyyj1wpAq19jNBW1BYF5IpQo
         US79nuEXwDfYRquImLevsgou9blTecCzbQdIRW8MvRGuCKdw8QN2iYCtNEWGFwhJ26xY
         CNEJ+PxvFxXS8ph5Wzk31pOD2MWnCapWoZQok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=phxXam+NzCk41fkXQIfIPhu7NO3JuGp0Zqj7GYLvO5g=;
        b=EyrYzZi7+1chfjhlqueaqPlADO4k12H4b9aR0ZIONyLGit7dWpal0uhoRepEjhefdu
         UjNJFhEfsJHGat4JLtvBP/n6T1MPpznh2qd/8WRxSsqWwUoXWjYvx1aFna8/gmZHDb52
         pfTBl8HpkwdR1tYIeae4Wi6viPP+BRUkjbQGEev8ytYZoncmZ0JJAhc1EuYkZsssSceP
         sqkh0g4mA9uiCQABxnKQ5amJYHlwPR12sZJikaAiKmVmhixj39FWTTvXWkhP7RTmYTdL
         HSmzSwIwUsNpq0CMA1e3dnA5vUfYDI6YUgyjwazOMcuKtvf3LlAg42y0hQaDM0hSPsC0
         EcQA==
X-Gm-Message-State: APjAAAXoz5KRReWJpeV3t5a/nKKM/8z2x71yRTdVqEmfpkE+yC3PQsLd
        aGaF/E2sFm9JCZYobtLbwKMwTQ==
X-Google-Smtp-Source: APXvYqxIok6j9SpyTOOUPPOSMw74gGma9eXYYBqZ20kYDDJq6S+wqATyE6oe5vdgxNJaBlFiNXuY1g==
X-Received: by 2002:a62:1883:: with SMTP id 125mr1535738pfy.178.1563819905974;
        Mon, 22 Jul 2019 11:25:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id a3sm36117683pfl.145.2019.07.22.11.25.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 11:25:05 -0700 (PDT)
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
Subject: [PATCH 2/4] video: of: display_timing: Don't yell if no timing node is present
Date:   Mon, 22 Jul 2019 11:24:37 -0700
Message-Id: <20190722182439.44844-3-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
In-Reply-To: <20190722182439.44844-1-dianders@chromium.org>
References: <20190722182439.44844-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

There may be cases (like in panel-simple.c) where we have a sane
fallback if no timings are specified in the device tree.  Let's get
rid of the unconditional pr_err().  We can add error messages in
individual drivers if it makes sense.

NOTE: we'll still print errors if the node is present but there are
problems parsing the timings.

Fixes: b8a2948fa2b3 ("drm/panel: simple: Add ability to override typical timing")
Reported-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/video/of_display_timing.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
index 5eedae0799f0..abc9ada798ee 100644
--- a/drivers/video/of_display_timing.c
+++ b/drivers/video/of_display_timing.c
@@ -125,10 +125,8 @@ int of_get_display_timing(const struct device_node *np, const char *name,
 		return -EINVAL;
 
 	timing_np = of_get_child_by_name(np, name);
-	if (!timing_np) {
-		pr_err("%pOF: could not find node '%s'\n", np, name);
+	if (!timing_np)
 		return -ENOENT;
-	}
 
 	ret = of_parse_display_timing(timing_np, dt);
 
-- 
2.22.0.657.g960e92d24f-goog

