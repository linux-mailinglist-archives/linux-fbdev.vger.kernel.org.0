Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3315176359
	for <lists+linux-fbdev@lfdr.de>; Fri, 26 Jul 2019 12:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfGZKSw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 26 Jul 2019 06:18:52 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40480 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfGZKSw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 26 Jul 2019 06:18:52 -0400
Received: by mail-ed1-f67.google.com with SMTP id k8so52793954eds.7
        for <linux-fbdev@vger.kernel.org>; Fri, 26 Jul 2019 03:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zvX8OAziSNN5OsE8bfDSJk4CpRqBH7dyRkXnk7RG3eI=;
        b=SQ+kR3HFvM8rRAriUWeNVj3CtMUPufRrOW+OwICxFGNVnRWXCviwz8rPVrkxPsqWvt
         so/d+iUbNVXle4UoflYpCtgJrbIWBpLrYq7n7BxKuBRd2wcmWzoCepE2yShpS9IDrXxr
         lfoYZn7wzcj3RaFzS0PgYA2VbD81mL4EWnwVCs6lReq1B8FCPihsVM0eQOf4QZWxtHUz
         2DOl/R/0zPso2GBSxcDdxzgfrhqAuvXnmqlwNt77AHzUClOIJzDsuTaTqAzOnD3cUuNC
         8fGfuoXcc67FENJuPfXlPxOrFRYpUGS9Jsn2UZPmXzhV4Z84bSm1yVh7mDOJQ7qieebR
         yVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zvX8OAziSNN5OsE8bfDSJk4CpRqBH7dyRkXnk7RG3eI=;
        b=g3sko/h1Hlr9lRCs/TF3AHtb7XUdAoKyYKJyOgyHndeQ0tCWoztBCCsr6FPEw9XKza
         tjQx8kcABHHNxLY3FUbXUbVZVH2Pbg8Gb/JW4FpIfCJ8hapG5afCC0LVO22KlXATqEgb
         +JBBmdyREKAD99STqa7k1Hqz19TD9Ct6oynDuNhg+bkcdLLH6ZtoCVqIXV2Hh9ojS+hZ
         XTi8P2TAclAhQPkz5Moi7vhccTZpyx9GXqUL6D8HoetQzMvn+4TxOKJBwH5gFl+4OFjr
         WS3paaEirN2buAxTDNo6Ig4vcET1b2z+Cig/lWW4JmQL4nj6uCx1JMqhXaxEN4r8JDR2
         zCyA==
X-Gm-Message-State: APjAAAUzsvbG3vPhnEtWRL9TfML/J4y/3yw3t4TJACbpysWb0AMcoq5Z
        aRYRIfd0492sUfEqzZ9ZuIi7S5cS
X-Google-Smtp-Source: APXvYqxCyBKloo2ImEn7ZegComMOJVWc4Hd9pm9aIYYqDnpaJVx8KHDgAMTnTb+ts8jOJor/MME7Vw==
X-Received: by 2002:a50:ac6e:: with SMTP id w43mr81856932edc.181.1564136330750;
        Fri, 26 Jul 2019 03:18:50 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id f26sm6595812ejo.25.2019.07.26.03.18.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 03:18:50 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org
Subject: [PATCH] video: Demote panel timing not found error message
Date:   Fri, 26 Jul 2019 12:18:49 +0200
Message-Id: <20190726101849.27322-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Failing to find a panel-timing node is not an error in all cases, so do
not output an error message in that case. Instead turn it into a debug
message and make the drivers that care about it output an error message
of their own.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/panel/panel-lvds.c | 4 +++-
 drivers/video/fbdev/amba-clcd.c    | 4 +++-
 drivers/video/of_display_timing.c  | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 1ec57d0806a8..7fcb3527c788 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -147,8 +147,10 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 	int ret;
 
 	ret = of_get_display_timing(np, "panel-timing", &timing);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(lvds->dev, "%pOF: could not find panel timing\n", np);
 		return ret;
+	}
 
 	videomode_from_timing(&timing, &lvds->video_mode);
 
diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
index 89324e42a033..13df898a3481 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -561,8 +561,10 @@ static int clcdfb_of_get_dpi_panel_mode(struct device_node *node,
 	struct videomode video;
 
 	err = of_get_display_timing(node, "panel-timing", &timing);
-	if (err)
+	if (err) {
+		pr_err("%pOF: could not find panel timing\n", node);
 		return err;
+	}
 
 	videomode_from_timing(&timing, &video);
 
diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
index f5c1c469c0af..9385b518349f 100644
--- a/drivers/video/of_display_timing.c
+++ b/drivers/video/of_display_timing.c
@@ -125,7 +125,7 @@ int of_get_display_timing(const struct device_node *np, const char *name,
 
 	timing_np = of_get_child_by_name(np, name);
 	if (!timing_np) {
-		pr_err("%pOF: could not find node '%s'\n", np, name);
+		pr_debug("%pOF: could not find node '%s'\n", np, name);
 		return -ENOENT;
 	}
 
-- 
2.22.0

