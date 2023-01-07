Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6464E6610CD
	for <lists+linux-fbdev@lfdr.de>; Sat,  7 Jan 2023 19:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbjAGS0Y (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 7 Jan 2023 13:26:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjAGS0X (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sat, 7 Jan 2023 13:26:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FFDB3F10C;
        Sat,  7 Jan 2023 10:26:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F0C5360BAD;
        Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49F6AC433A0;
        Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673115981;
        bh=stKQw4ypuM0c2CGPJsNtwm+f9+XYDr8crV+YAKDS7Qg=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
        b=HXp0PrAmyat56OZcxRyrQ/u0BelQxizvXcSVJ/N3/uFmiUg6VQTRXJtGXsYB14EHz
         +nHBE4J5sNIy6jBDIClPyrBAZv3W/RoIFnJbLVPQ7ZAs3VfvliAlE6DuGOKl7zfLq4
         44Aif18Fp3M7Ph3Az3wBULTOOFWPfMFSHahDAygGGiAaD97eZnpk68RhtrZLLOzvlV
         Fx4tAS8UpfshZxo7EQCsGIB068l83dPE5lXJpxr2kxeeQQgEeeOJTWld2h3AY1U/dQ
         S//nSCeosL5beIgaC+DwF2MMBtoer1V9fbzl7ibWqEo+WbO2HJSpsK4zQDkQ9C2LcC
         9dU3qSq2Fb9Tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.lore.kernel.org (Postfix) with ESMTP id 399B4C54EBD;
        Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
From:   Sam Ravnborg via B4 Submission Endpoint 
        <devnull+sam.ravnborg.org@kernel.org>
Date:   Sat, 07 Jan 2023 19:26:18 +0100
Subject: [PATCH 04/15] video: fbdev: radeon: Introduce backlight_get_brightness()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230107-sam-video-backlight-drop-fb_blank-v1-4-1bd9bafb351f@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
To:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Helge Deller <deller@gmx.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Antonino Daplas <adaplas@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>, Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, Stephen Kitt <steve@sk2.org>,
        Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673115978; l=1304;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=Go6rR02iCXe+4kQHAFtFCxiJJyvkl/oj7VhzPcU0Z6Y=; =?utf-8?q?b=3DflqgadwX+l3X?=
 =?utf-8?q?JQBMurYVeZ5lw7jYwnq+fjSaCXLgDVsWCF4QeU+pM/JkNHOUd4eAe48lF762VyAl?=
 Zy46RGaUDUVM8Rn1neRnITDLjeGxeqHCDC0WSLnf3NCp1XdsYp8r
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
Reply-To: <sam@ravnborg.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Sam Ravnborg <sam@ravnborg.org>

Introduce backlight_get_brightness() to simplify logic
and avoid direct access to backlight properties.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/aty/radeon_backlight.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/aty/radeon_backlight.c b/drivers/video/fbdev/aty/radeon_backlight.c
index d2c1263ad260..22a39fea7b89 100644
--- a/drivers/video/fbdev/aty/radeon_backlight.c
+++ b/drivers/video/fbdev/aty/radeon_backlight.c
@@ -54,14 +54,10 @@ static int radeon_bl_update_status(struct backlight_device *bd)
 		return 0;
 
 	/* We turn off the LCD completely instead of just dimming the
-	 * backlight. This provides some greater power saving and the display
-	 * is useless without backlight anyway.
+	 * backlight if level < 1. This provides some greater power saving
+	 * and the display is useless without backlight anyway.
 	 */
-        if (bd->props.power != FB_BLANK_UNBLANK ||
-	    bd->props.fb_blank != FB_BLANK_UNBLANK)
-		level = 0;
-	else
-		level = bd->props.brightness;
+	level = backlight_get_brightness(bd);
 
 	del_timer_sync(&rinfo->lvds_timer);
 	radeon_engine_idle();

-- 
2.34.1
