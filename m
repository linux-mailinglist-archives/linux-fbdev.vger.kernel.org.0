Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B07A7087B
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 20:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731880AbfGVSZK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 14:25:10 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38480 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731943AbfGVSZH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 14:25:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id y15so17777643pfn.5
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qfwsnuJ0Fo+yki7MwdfIhdjj83zSVUakcOxDUEqYWuw=;
        b=BMAJB7zCPWaxxlsIZhliKtF/Of3RCfBU19X2PdSfplILj6yScV53dJKd9GpZMW00sX
         21AvgBuU29a+7Tczy51BqeRf390trbirmAtQOeTwHaDaAgO71WXOqgW9qVG4I/0QwhsF
         fHbjC8EReFF044ivDo+ipVHhRsr2EV6EnYpNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qfwsnuJ0Fo+yki7MwdfIhdjj83zSVUakcOxDUEqYWuw=;
        b=laTT5AEYi2zzpK4lxr15AXcC0Z5ZRXb/zQhC5CZPVTCPhPl1w7MDIKyg8GdTYYhz4X
         dKMAr+yDIj3Zve+n0g4fKjUPcqdh0Bkby/WVbuRmTexUL9bLJmUNSx4ISj1r+jBOmfMv
         RpKcxrTtQ/l8kyYweYZVmaudbpVUFrj5gCYPtrDmQyppedEGbDoDXnqR9bPlfrsDTPtv
         zG29SUzrl8dHLfaQP+9jTvfptvjcHC/5dYum8q/RF2FH9FcaS9nZk6o8M7kmCfNwW78J
         pF3/slETJSm/bERtmNI9Ck2X+HO9m1N61j3515ATnlyoM5N8DgBp4TCKOELvlnCYhTQI
         MLig==
X-Gm-Message-State: APjAAAUMN6CMWbr7f6OReNRCTWunbHgASZ/WPJmvaSO/X9Av4r9HHqOq
        WoidaS0R/ZN6o8x3M0KSbYpGgg==
X-Google-Smtp-Source: APXvYqyEp+PIjudMUc2kzpn+Zl2EC+eIJeevs//E8DRu5CFrWzPYRAgF8677H9fM7Q0RWCkvTACSQA==
X-Received: by 2002:a17:90a:23ce:: with SMTP id g72mr47354809pje.77.1563819906950;
        Mon, 22 Jul 2019 11:25:06 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id a3sm36117683pfl.145.2019.07.22.11.25.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 11:25:06 -0700 (PDT)
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
Subject: [PATCH 3/4] drm: panel-lvds: Spout an error if of_get_display_timing() gives an error
Date:   Mon, 22 Jul 2019 11:24:38 -0700
Message-Id: <20190722182439.44844-4-dianders@chromium.org>
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
of_get_display_timing() if no node is present.  Presumably panel-lvds
should take charge of spouting its own error now.

NOTE: we'll print two errors if the node was present but there were
problems parsing the timing node (one in of_parse_display_timing() and
this new one).  Since this is a fatal error for the driver's probe
(and presumably someone will be debugging), this should be OK.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-lvds.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 1ec57d0806a8..ad47cc95459e 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -147,8 +147,11 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 	int ret;
 
 	ret = of_get_display_timing(np, "panel-timing", &timing);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(lvds->dev, "%pOF: problems parsing panel-timing (%d)\n",
+			np, ret);
 		return ret;
+	}
 
 	videomode_from_timing(&timing, &lvds->video_mode);
 
-- 
2.22.0.657.g960e92d24f-goog

