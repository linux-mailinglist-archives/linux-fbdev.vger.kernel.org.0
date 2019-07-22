Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7784770879
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 20:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731995AbfGVSZJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 14:25:09 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37866 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731813AbfGVSZI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 14:25:08 -0400
Received: by mail-pf1-f193.google.com with SMTP id 19so17774446pfa.4
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6lPTFkPAyVmuitAa4mWi4F3NQrNbt8SbSytM3vpn0a4=;
        b=HbRHDvfM0apfHIujyRj3077zDqjerxdCRfAZo6YgD6vz6Zsc15GjN+7nPgKerlEBLN
         4yAfZGf9Wq/qgGh8pvCNUq3+QtBcnC3ykrSvr7kATX6tqP81wL1yoSc8P/qF2fL4tWaR
         hi05VT7unfKPLXhDchw25LWu4Cufs7dF1a/eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6lPTFkPAyVmuitAa4mWi4F3NQrNbt8SbSytM3vpn0a4=;
        b=QHDgLh0MDMcB1gzQSGjI3TNMGThYgP22F9gkZyQXIK+xU7RmALVjYiNM0YzZ/7wuvq
         LGGhI4j4zUcYDyKk2YClEdU6hHJAxEakuHFu2AwwI6mF43USOUr7SnrntLx7+ltHFjhc
         N13xlQtDX5q411XrHzDjTU8y3avc3+zyd+bEx1auFQsG2gMYDsGqBW3HSqTEr3nUghNX
         10A0JyLCEVC7GYAE5zVJq5AmiNaWklodetIgLrhH3HzA6WQYBc4DlnJUn1sDkMEXa7ti
         qDggdcpJ2vX4O5JWWByWyuXplVfPVOQEHlu/OvtwhUGl2st/4zq2BJQQJMTSqzEDLWvk
         p42Q==
X-Gm-Message-State: APjAAAX+g0CpxFxldV7bVMdgVM3Cv1nZ99OHtzCzfcCgHxY+RTQBagjI
        OZTNYatjuuP0QbqhE0Z5y3E+vw==
X-Google-Smtp-Source: APXvYqwI+vy0ViASrIf3xCLwt0/dbuCnHEOUXK68q+q6D/Uk77Ehyv/s9HJa76vJ9R6YVsvovtfFjg==
X-Received: by 2002:a63:5a4b:: with SMTP id k11mr13577531pgm.143.1563819907864;
        Mon, 22 Jul 2019 11:25:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id a3sm36117683pfl.145.2019.07.22.11.25.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 11:25:07 -0700 (PDT)
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
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] video: amba-clcd: Spout an error if of_get_display_timing() gives an error
Date:   Mon, 22 Jul 2019 11:24:39 -0700
Message-Id: <20190722182439.44844-5-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
In-Reply-To: <20190722182439.44844-1-dianders@chromium.org>
References: <20190722182439.44844-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

In the patch ("video: of: display_timing: Don't yell if no timing node
is present") we'll stop spouting an error directly in
of_get_display_timing() if no node is present.  Presumably amba-clcd
should take charge of spouting its own error now.

NOTE: we'll print two errors if the node was present but there were
problems parsing the timing node (one in of_parse_display_timing() and
this new one).  Since this is a fatal error for the driver's probe
(and presumably someone will be debugging), this should be OK.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/video/fbdev/amba-clcd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
index 89324e42a033..7de43be6ef2c 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -561,8 +561,10 @@ static int clcdfb_of_get_dpi_panel_mode(struct device_node *node,
 	struct videomode video;
 
 	err = of_get_display_timing(node, "panel-timing", &timing);
-	if (err)
+	if (err) {
+		pr_err("%pOF: problems parsing panel-timing (%d)\n", node, err);
 		return err;
+	}
 
 	videomode_from_timing(&timing, &video);
 
-- 
2.22.0.657.g960e92d24f-goog

