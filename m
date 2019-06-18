Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C38449ACD
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jun 2019 09:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbfFRHly (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jun 2019 03:41:54 -0400
Received: from mail-wr1-f100.google.com ([209.85.221.100]:42175 "EHLO
        mail-wr1-f100.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbfFRHly (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jun 2019 03:41:54 -0400
Received: by mail-wr1-f100.google.com with SMTP id x17so12738642wrl.9
        for <linux-fbdev@vger.kernel.org>; Tue, 18 Jun 2019 00:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=okoko.fi; s=okoko;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RJV2c/yp+5Do5r3i0Oh53aiXsFA5fZSjKFxBZIwxxB4=;
        b=d0+0frtSg952+lM6f0nBtK47869GFo/kZ49bF9nda2IzhOwtCpAxPQQKkPzzfvPy7D
         4eY4ARuUNqbPQwctLijpvGklj6NQIdAQo0vMwPAoFiVihX1737VFcv+1WPV8x0kO0nX5
         DbqE8tyTJHeLE2P/sdmVxB4dYR2ze9fzb51iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RJV2c/yp+5Do5r3i0Oh53aiXsFA5fZSjKFxBZIwxxB4=;
        b=dY30h1L97bb4gxxTMDn59/yBOIAZr9aThCF+q6VIJaOZbZ7AAS7dg27X6gum9kntqG
         XK53zns9BjgjNg5bWWFRb3piF8M7fvgescDl4rPt0dPotiBueBgn/XZOa8j8qXhSKpg4
         QuzRNfqSd+mOm9frQ04lvaKBaVIv3m8G1/+kR8nPZs59ulKc16IRY3GAL3C7JZybmaxp
         dHoxzkTcRNuJMX8StgcPNBAGXTN18753e0xT+a7+VKcrhe+pI1gTN14raRHfi8FZbR2R
         BhD+/WWkMq1cxbPwG0ReuTUv8CInRNKI9sicDkMLRUs3//e6ncz6jgjguOCvQnrCbezh
         FJ1Q==
X-Gm-Message-State: APjAAAWYBVT05nKcs15xbGsqyLmmvE6KCRjyvOgJgPyCYBULRHKsDK+G
        fYmuRuGNlM/kTRuCMGmN55CfrGpJsuwOQ1F5xtFiLEOyBBkzow==
X-Google-Smtp-Source: APXvYqzJtYYrIsIVjU6HwCxdrP51kOs3TdA56llOXfWqnnEnzoFlKNoTYyUl5l8w6i5sbjU9eoegASs4TVgl
X-Received: by 2002:a5d:53c2:: with SMTP id a2mr27917903wrw.8.1560843712369;
        Tue, 18 Jun 2019 00:41:52 -0700 (PDT)
Received: from localhost.localdomain (46-163-209-30.blcnet.fi. [46.163.209.30])
        by smtp-relay.gmail.com with ESMTPS id l18sm212063wrn.66.2019.06.18.00.41.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 00:41:52 -0700 (PDT)
X-Relaying-Domain: okoko.fi
From:   Marko Kohtala <marko.kohtala@okoko.fi>
To:     linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
        Marko Kohtala <marko.kohtala@okoko.fi>
Subject: [PATCH 2/6] video: ssd1307fb: Remove unneeded semicolons
Date:   Tue, 18 Jun 2019 10:41:07 +0300
Message-Id: <20190618074111.9309-3-marko.kohtala@okoko.fi>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618074111.9309-1-marko.kohtala@okoko.fi>
References: <20190618074111.9309-1-marko.kohtala@okoko.fi>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

coccicheck reported unneeded semicolons. Remove them.

Signed-off-by: Marko Kohtala <marko.kohtala@okoko.fi>
---
 drivers/video/fbdev/ssd1307fb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 6c2980331ffd..9ab00e0dadc7 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -313,7 +313,7 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 
 		dev_dbg(&par->client->dev, "Using PWM%d with a %dns period.\n",
 			par->pwm->pwm, par->pwm_period);
-	};
+	}
 
 	/* Set initial contrast */
 	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_CONTRAST);
@@ -329,7 +329,7 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 		ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SEG_REMAP_ON);
 		if (ret < 0)
 			return ret;
-	};
+	}
 
 	/* Set COM direction */
 	com_invdir = 0xc0 | (par->com_invdir & 0x1) << 3;
@@ -716,7 +716,7 @@ static int ssd1307fb_probe(struct i2c_client *client,
 	if (par->device_info->need_pwm) {
 		pwm_disable(par->pwm);
 		pwm_put(par->pwm);
-	};
+	}
 regulator_enable_error:
 	if (par->vbat_reg)
 		regulator_disable(par->vbat_reg);
@@ -740,7 +740,7 @@ static int ssd1307fb_remove(struct i2c_client *client)
 	if (par->device_info->need_pwm) {
 		pwm_disable(par->pwm);
 		pwm_put(par->pwm);
-	};
+	}
 	fb_deferred_io_cleanup(info);
 	__free_pages(__va(info->fix.smem_start), get_order(info->fix.smem_len));
 	framebuffer_release(info);
-- 
2.17.1

