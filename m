Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57A406AC681
	for <lists+linux-fbdev@lfdr.de>; Mon,  6 Mar 2023 17:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbjCFQBW (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 6 Mar 2023 11:01:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbjCFQAq (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 6 Mar 2023 11:00:46 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E16B305DA;
        Mon,  6 Mar 2023 08:00:44 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 62216223EB;
        Mon,  6 Mar 2023 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678118442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VWHGHzW+q4kH1KH9xY8JJ8/Ps4LWtbKGrYcEV4O06cw=;
        b=VJph/50tpYWpeD5xSouwPdd5N+UgrC9A0PWexq0Z93ZLQnDO2jbNMZSbhMebV1wmOD8h6k
        CJjdO30HSXkjqa4QnBJ0Z1tNVCg1oQx7RwF/3Fku3u4BotRgPjPlTmRl25vB6oA8Pk6vzC
        fWhWMr9eTu1T22A7hxkhHbuNuNCHMpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678118442;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VWHGHzW+q4kH1KH9xY8JJ8/Ps4LWtbKGrYcEV4O06cw=;
        b=ynBpFxaUvUoYCB9hqyNEKRepUHFWDhchenuy25Fur3iMNFndKFcoS3PED9ofZDOeY8woPN
        6SplZdPzWJzn5iDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0873613A6A;
        Mon,  6 Mar 2023 16:00:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id CPYyASoOBmQ/PwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:42 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
        linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
        adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
        mbroemme@libmpq.org, thomas@winischhofer.net,
        James.Bottomley@HansenPartnership.com, spock@gentoo.org,
        sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
        geert+renesas@glider.be, corbet@lwn.net
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 47/99] fbdev/mx3fb: Parse option string with struct option_iter
Date:   Mon,  6 Mar 2023 16:59:24 +0100
Message-Id: <20230306160016.4459-48-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306160016.4459-1-tzimmermann@suse.de>
References: <20230306160016.4459-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Use struct option_iter to walk over the individual options in the
driver's option string. Replaces the hand-written strsep() loop with
a clean interface. The helpers for struct option_iter handle empty
option strings and empty options transparently. The struct's _init
and _release functions duplicate and release the option string's
memory buffer as needed.

Done in preparation of constifying the option string.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/mx3fb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index cf14fe08567a..cb9f5ac69e79 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -6,6 +6,7 @@
  * Copyright 2004-2007 Freescale Semiconductor, Inc. All Rights Reserved.
  */
 
+#include <linux/cmdline.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
@@ -1653,17 +1654,16 @@ static struct platform_driver mx3fb_driver = {
 static int __init mx3fb_setup(void)
 {
 #ifndef MODULE
-	char *opt, *options = NULL;
+	char *options = NULL;
+	struct option_iter iter;
+	const char *opt;
 
 	if (fb_get_options("mx3fb", &options))
 		return -ENODEV;
 
-	if (!options || !*options)
-		return 0;
+	option_iter_init(&iter, options);
 
-	while ((opt = strsep(&options, ",")) != NULL) {
-		if (!*opt)
-			continue;
+	while (option_iter_next(&iter, opt)) {
 		if (!strncmp(opt, "bpp=", 4))
 			default_bpp = simple_strtoul(opt + 4, NULL, 0);
 		else {
@@ -1678,6 +1678,8 @@ static int __init mx3fb_setup(void)
 			fb_mode = mode_option_buf;
 		}
 	}
+
+	option_iter_release(&iter);
 #endif
 
 	return 0;
-- 
2.39.2

