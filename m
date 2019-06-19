Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB304B3AF
	for <lists+linux-fbdev@lfdr.de>; Wed, 19 Jun 2019 10:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731243AbfFSIL0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 19 Jun 2019 04:11:26 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:32905 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731136AbfFSIL0 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 19 Jun 2019 04:11:26 -0400
Received: by mail-ed1-f68.google.com with SMTP id i11so25894258edq.0
        for <linux-fbdev@vger.kernel.org>; Wed, 19 Jun 2019 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MC/t0+GCQCXJ5HUw0cDp3wEG1uegYs81hRvZB9zVfE0=;
        b=TCSvmjBFMsZZpW3/6MEVx/M9rF5A1CIG3A8MxzxJxdmjwtt3zBZJhDrICd3UjKokZG
         GdVSHPAkfPNi9HmYnYnLR9+c0Fzdn18pvcnp1ZUU1KOmqejSfqXlRka+TsfuMM/UwQNt
         1oGFzgQsKETlSKCa8LEXGuV2ekdZCkNVa/tP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MC/t0+GCQCXJ5HUw0cDp3wEG1uegYs81hRvZB9zVfE0=;
        b=MLzqwti3j5g8hvc44N1Kh6uJk7G6CHH+P6v5YiLnqNC8G2qxDeEl/YGCjzpBJCLYIs
         8k7pLXYPd+PJbiUMr3GGjTZ6x9wxvNlmXreHonJgRtuUCv65ej2Rsn2t/eq7l+cqlx8Z
         LcgrBtP9URAtpqbJSo4TglVDWjKBScZcSVhP9s6NUUWHJ4xXp8U1QekS7ymTHYnUntz9
         nCE/DP5pbldYc9BxORuJ8PCXovOIqC6+VeBpWXmnUcomAaEyRueyECPJ82zdawDbzble
         emMEDVuqPjOvWIhPTi1hL4dB5QIVRi27e6EPGcHmEA2GQhVwHqkRd0kopq6pjNra0Wpe
         kDOg==
X-Gm-Message-State: APjAAAXkBWspCIWfKybjmgb76tiGCH7cWBduVvlDer7jdyb1tlmqpnOK
        9EWm4I5dwJuiFxN40CoxOGhz2g==
X-Google-Smtp-Source: APXvYqyzTlz7Dqh5Dq8iiPWQJepg5nNh+DInaUL45FQ0/ysRzTOM13RL70UlqW1akAA2NnNB+6n7Sg==
X-Received: by 2002:a50:b343:: with SMTP id r3mr44092303edd.16.1560931884407;
        Wed, 19 Jun 2019 01:11:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x4sm5562329eda.22.2019.06.19.01.11.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 01:11:23 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        kbuild test robot <lkp@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Yisheng Xie <ysxie@foxmail.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Mikulas Patocka <mpatocka@redhat.com>,
        linux-fbdev@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lukas Wunner <lukas@wunner.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbcon: Export fbcon_update_vcs
Date:   Wed, 19 Jun 2019 10:11:15 +0200
Message-Id: <20190619081115.27921-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

I failed to spot this while compile-testing. Oops.

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 9e1467002630 ("fbcon: replace FB_EVENT_MODE_CHANGE/_ALL with direct calls")
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Yisheng Xie <ysxie@foxmail.com>
Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
Cc: Peter Rosin <peda@axentia.se>
Cc: Mikulas Patocka <mpatocka@redhat.com>
Cc: linux-fbdev@vger.kernel.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/video/fbdev/core/fbcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index b8067e07f8a8..c9235a2f42f8 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3037,6 +3037,7 @@ void fbcon_update_vcs(struct fb_info *info, bool all)
 	else
 		fbcon_modechanged(info);
 }
+EXPORT_SYMBOL(fbcon_update_vcs);
 
 int fbcon_mode_deleted(struct fb_info *info,
 		       struct fb_videomode *mode)
-- 
2.20.1

