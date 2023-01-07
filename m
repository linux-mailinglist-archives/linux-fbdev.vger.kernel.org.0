Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0437C6610F2
	for <lists+linux-fbdev@lfdr.de>; Sat,  7 Jan 2023 19:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbjAGS1E (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 7 Jan 2023 13:27:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232647AbjAGS01 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sat, 7 Jan 2023 13:26:27 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7104A40C08;
        Sat,  7 Jan 2023 10:26:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BE900B80707;
        Sat,  7 Jan 2023 18:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14232C43325;
        Sat,  7 Jan 2023 18:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673115982;
        bh=SjEXDcxd+wP5nx2Qt2TI3P4sxguFwMHIJck6CTMy4h4=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
        b=eVFt1praUtSy9SLyuRZ8HK6ttWVjZLhbVuOWZ1UP2GaH4eBiGK8qMXCkAwo54KPEQ
         BdNulawL+1EDpxs5TDDEcBmweHmDf5VzjX9o5nrLl2iUgvc3Rptrjkf7pqldfjvddF
         xrRShUmkxSZxF6x4nSZZY9VikQdM/u4kb/macdtJnxG6U/EC7DDM9igF3HjKwhHe1P
         SJh4HL/vFZvt4UIBvGWvpAmXWuaAJ2JKPxvI3oT6a4JjbQy4Ty8XoZxtcaehoEF43z
         19NdBItXL21Uy9WazM+XIJ5XmsH/pZIZOcK0NrqOpOhd4gWHyJ5ZnKksWoLxJ5FJ5u
         op4HsJFaydwjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.lore.kernel.org (Postfix) with ESMTP id 054BFC54EBC;
        Sat,  7 Jan 2023 18:26:22 +0000 (UTC)
From:   Sam Ravnborg via B4 Submission Endpoint 
        <devnull+sam.ravnborg.org@kernel.org>
Date:   Sat, 07 Jan 2023 19:26:28 +0100
Subject: [PATCH 14/15] backlight: tosa: Use backlight helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230107-sam-video-backlight-drop-fb_blank-v1-14-1bd9bafb351f@ravnborg.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673115978; l=1164;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=TiWKXtIRXmpUw/px6HIrIXkwB1iOud1SvGNIg23j2tc=; =?utf-8?q?b=3D58e624VDMkDH?=
 =?utf-8?q?ye2VhFgLUprGgEmC4cjpB62XJtnFRSF9zXBgn6AjMkxv5uKzvqWz18/h1I4SuRN7?=
 d8AnGMa0CQN1M+u17H3W2BQG2L5Klm/uDXn9OmNUOoeaOkYVE1n3
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

From: Stephen Kitt <steve@sk2.org>

Instead of retrieving the backlight brightness in struct
backlight_properties manually, and then checking whether the backlight
should be on at all, use backlight_get_brightness() which does all
this and insulates this from future changes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/backlight/tosa_bl.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/video/backlight/tosa_bl.c b/drivers/video/backlight/tosa_bl.c
index f55b3d616a87..cb07f13dd886 100644
--- a/drivers/video/backlight/tosa_bl.c
+++ b/drivers/video/backlight/tosa_bl.c
@@ -50,13 +50,8 @@ static void tosa_bl_set_backlight(struct tosa_bl_data *data, int brightness)
 
 static int tosa_bl_update_status(struct backlight_device *dev)
 {
-	struct backlight_properties *props = &dev->props;
 	struct tosa_bl_data *data = bl_get_data(dev);
-	int power = max(props->power, props->fb_blank);
-	int brightness = props->brightness;
-
-	if (power)
-		brightness = 0;
+	int brightness = backlight_get_brightness(dev);
 
 	tosa_bl_set_backlight(data, brightness);
 

-- 
2.34.1
