Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5819F5049B
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jun 2019 10:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfFXIdD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Jun 2019 04:33:03 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37208 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfFXIdD (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Jun 2019 04:33:03 -0400
Received: by mail-ed1-f65.google.com with SMTP id w13so20569894eds.4
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Jun 2019 01:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rhq/A+Wmeu0M0xpQ5ggr38wrWajMw16Fcl2eXJ2cqCM=;
        b=Xl/UEKe4ZlQUG9JziPsm9bJPu2EwUbCisCgv19ADkWt/skBEuSaOrDxTyNaRZz7YyX
         4T1ON3POCGbrp06bokoC9KhzKCaNrCKtOjDsn0kqroRsiAqSl9aCec7I50oZT34BhC36
         2Nw5U0uZUXfzcDRYP5lBEypT/89qU86eBX/7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rhq/A+Wmeu0M0xpQ5ggr38wrWajMw16Fcl2eXJ2cqCM=;
        b=ipKCk6jxYi3hFZe+Z7N5JEa0kmOwccDbnVgP+DZb+dU38cWjIh7/p9Ta0/kBQ+LQlY
         gmBGw/XUDMNVDW26t6ZnRuIo4lAnB+T3GSEip22gy1Tkqk8lHCWPZ91kyiZgDIN+hyq8
         i2hB/q5V7+8aXPTZjVgYgItVsQ7pAi04cgtKi+1AqxigbtQ8ZJ/Bw+Ga6an8ElmPrIyp
         omf8CtIniK/khLYb/5kIMf5Pmv8xO3Co28P9WrObOgcNSfzTFQHTA96N0AjEIdu0R9Md
         cKkBzVDYN3OJdHjOGksc6jBPcC4HZYevjyVLGPxXK8AYQKtLFQ5EDnt0ZzRh7uxC2sBM
         bneQ==
X-Gm-Message-State: APjAAAXdwJBxw5bOsus5X5dUGPmMsXGHEUlrpV5zW1IaOwpxpM4Hwt4/
        qsch6K/GGoGvQyreFsgR0Z440Q==
X-Google-Smtp-Source: APXvYqyxQqcCOaClByMhs9zg429dU19NX8iT7BNkF349mthFHC5Eqv9G8GiIgew05iugGCQJDye1Bg==
X-Received: by 2002:a50:e612:: with SMTP id y18mr160702738edm.143.1561365181654;
        Mon, 24 Jun 2019 01:33:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id s5sm3431668edh.3.2019.06.24.01.33.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 24 Jun 2019 01:33:00 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kbuild test robot <lkp@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Yisheng Xie <ysxie@foxmail.com>, linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] fbcon: Export fbcon_remap_all
Date:   Mon, 24 Jun 2019 10:32:55 +0200
Message-Id: <20190624083255.13235-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fixes linking fail when fbcon/fbdev is moduler and vgaswitcheroo is
enabled:

x86_64-linux-gnu-ld: drivers/gpu/vga/vga_switcheroo.o: in function `vga_switchto_stage2':
vga_switcheroo.c:(.text+0x997): undefined reference to `fbcon_remap_all'

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 1cd51b5d200d ("vgaswitcheroo: call fbcon_remap_all directly")
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Yisheng Xie <ysxie@foxmail.com>
Cc: linux-fbdev@vger.kernel.org
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
--
wrt merging probably best if Maarten adds this to the topic branch we
have already and sends out an updated pull request.

Apologies for the mess.
-Daniel
---
 drivers/video/fbdev/core/fbcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index c9235a2f42f8..199ca723c768 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3194,6 +3194,7 @@ void fbcon_remap_all(struct fb_info *info)
 	}
 	console_unlock();
 }
+EXPORT_SYMBOL(fbcon_remap_all);
 
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
 static void fbcon_select_primary(struct fb_info *info)
-- 
2.20.1

