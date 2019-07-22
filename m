Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D95E70874
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 20:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731784AbfGVSZE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 14:25:04 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37420 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731778AbfGVSZE (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 14:25:04 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so19536217plr.4
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x8c0DPCRMv9IW9PP1p4HBNy16Fzp3nQIOkgwmBpQwpo=;
        b=FfZ6mG6bnACwo8lgLXr1zYGkAj7V4iNwkTU4H5ELO+CqHQDbFy8TPLhLV8XtPvILqW
         TowJOHAi23SCQrrxtT2YTfMTfZT0utOVqKKuvQM9feJUKIT7JNt7M+zJZk8pj3Ja4Z0d
         xtriekUe46UMlYaBOMlvThIUciUDwEHKz3k6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x8c0DPCRMv9IW9PP1p4HBNy16Fzp3nQIOkgwmBpQwpo=;
        b=iJe0n0H1VBUjIMDxl0cYubxwjwPKw74A/cNe+l9DVFbFfyt9F+MUSiNw4LeI6mRbRo
         smEtIe0YybAbDE0fvsKh6hnneWazVHC+4FZonsrbrK4YY00tadH6Wo1h39CMX1dwIPyF
         07YAtT8wdfLJrovfS+y1EyL1qNsaxliALtWBn07F41H7qonIVgs/eX60Xt9rZOTQrGAO
         ACxAgdZkz2Ez+7Ks7Ehr8Mz9RcAA+UjgtS5VBzasUxfwBZqpj0m49R6O9TZsJKlHp6tJ
         M9Xs2/xK6Bmu0LGFGW7Tu/CjrjybNGxBLLZ53TOeTtonG23HZntG+74cwoHVERSabDlV
         5vYw==
X-Gm-Message-State: APjAAAUsMzU/TpBrlNIOJKBqbH9FSS6QjID5Zono0XPpVu3rb8m8adcw
        q6v3KOpGPIiKoDOLIlMrGpW1yg==
X-Google-Smtp-Source: APXvYqwyyl3J3Mb8JWQgZSDuxJTdfEQ/qKsf4Mi5pmNYAuIsVFOtUl3uWg6CUWJmNS9uHBU4AAA4AQ==
X-Received: by 2002:a17:902:7448:: with SMTP id e8mr76695940plt.85.1563819903648;
        Mon, 22 Jul 2019 11:25:03 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id a3sm36117683pfl.145.2019.07.22.11.25.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 11:25:03 -0700 (PDT)
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
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/4] video: of: display_timing: Adjust err printing of of_get_display_timing()
Date:   Mon, 22 Jul 2019 11:24:35 -0700
Message-Id: <20190722182439.44844-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

As reported by Sam Ravnborg [1], after commit b8a2948fa2b3
("drm/panel: simple: Add ability to override typical timing") we now
see a pointless error message printed on every boot for many systems.
Let's fix that by adjusting who is responsible for printing error
messages when of_get_display_timing() is used.

Most certainly we can bikeshed the topic about whether this is the
right fix or we should instead add logic to panel_simple_probe() to
avoid calling of_get_display_timing() in the case where there is no
"panel-timing" sub-node.  If there is consensus that I should move the
fix to panel_simple_probe() I'm happy to spin this series.  In that
case we probably should _remove_ the extra prints that were already
present in the other two callers of of_get_display_timing().

While at it, fix a missing of_node_put() found by code inspection.

NOTE: amba-clcd and panel-lvds were only compile-tested.

[1] https://lkml.kernel.org/r/20190721093815.GA4375@ravnborg.org


Douglas Anderson (4):
  video: of: display_timing: Add of_node_put() in
    of_get_display_timing()
  video: of: display_timing: Don't yell if no timing node is present
  drm: panel-lvds: Spout an error if of_get_display_timing() gives an
    error
  video: amba-clcd: Spout an error if of_get_display_timing() gives an
    error

 drivers/gpu/drm/panel/panel-lvds.c |  5 ++++-
 drivers/video/fbdev/amba-clcd.c    |  4 +++-
 drivers/video/of_display_timing.c  | 11 +++++++----
 3 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.22.0.657.g960e92d24f-goog

