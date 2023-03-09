Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 577926B2985
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Mar 2023 17:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbjCIQDD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Mar 2023 11:03:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbjCIQCM (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Mar 2023 11:02:12 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08299F7ED7;
        Thu,  9 Mar 2023 08:02:10 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 73A842017D;
        Thu,  9 Mar 2023 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678377729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+FUi3cC4ZbNfnVzDlRVuUkJNsL1SkMquCeIFMmvAC8o=;
        b=IUPQEEYnXT7GyVhVVIVQfYM1bet8PDGuc1h2UDerjes0SxQAn2C/FlvGez6Ic/PqalEUDD
        49x+fRHdnUJGSmwspY4kgfcCJcXJGr0qXuD+yvcfq5r4Co+jFz7McSNgO83mkT2+QqbQco
        clCYFpog5JZXedsiH8jEaZ+BSeBABa8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678377729;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+FUi3cC4ZbNfnVzDlRVuUkJNsL1SkMquCeIFMmvAC8o=;
        b=04hFjl3HX3Hs4/ETS8p0/KG+5HcDpCm4C1v6z24G2Oa2NO/APnZuQK90gwFrwfZ40Y+tDF
        /0HyodwPVhZ2lgDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13C0C1391B;
        Thu,  9 Mar 2023 16:02:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id MJniAwEDCmQHbgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:09 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
        rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
        linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
        thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
        sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
        corbet@lwn.net
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 012/101] fbdev/aty: Parse option string with struct option_iter
Date:   Thu,  9 Mar 2023 17:00:32 +0100
Message-Id: <20230309160201.5163-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309160201.5163-1-tzimmermann@suse.de>
References: <20230309160201.5163-1-tzimmermann@suse.de>
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
 drivers/video/fbdev/aty/aty128fb.c    | 12 ++++++++----
 drivers/video/fbdev/aty/atyfb_base.c  | 12 ++++++++----
 drivers/video/fbdev/aty/radeon_base.c | 15 ++++++++-------
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index 0e725a6eb40b..ee2be122de2d 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -48,6 +48,7 @@
 
 
 #include <linux/aperture.h>
+#include <linux/cmdline.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -1674,14 +1675,14 @@ static int aty128fb_sync(struct fb_info *info)
 }
 
 #ifndef MODULE
-static int aty128fb_setup(char *options)
+static int aty128fb_setup(const char *options)
 {
+	struct option_iter iter;
 	char *this_opt;
 
-	if (!options || !*options)
-		return 0;
+	option_iter_init(&iter, options);
 
-	while ((this_opt = strsep(&options, ",")) != NULL) {
+	while (option_iter_next(&iter, &this_opt)) {
 		if (!strncmp(this_opt, "lcd:", 4)) {
 			default_lcd_on = simple_strtoul(this_opt+4, NULL, 0);
 			continue;
@@ -1730,6 +1731,9 @@ static int aty128fb_setup(char *options)
 			mode_option = mode_option_buf;
 		}
 	}
+
+	option_iter_release(&iter);
+
 	return 0;
 }
 #endif  /*  MODULE  */
diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index d83b3dae795b..f4b22d2f0d3d 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -49,6 +49,7 @@
 ******************************************************************************/
 
 #include <linux/aperture.h>
+#include <linux/cmdline.h>
 #include <linux/compat.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -3832,14 +3833,14 @@ static struct pci_driver atyfb_driver = {
 #endif /* CONFIG_PCI */
 
 #ifndef MODULE
-static int __init atyfb_setup(char *options)
+static int __init atyfb_setup(const char *options)
 {
+	struct option_iter iter;
 	char *this_opt;
 
-	if (!options || !*options)
-		return 0;
+	option_iter_init(&iter, options);
 
-	while ((this_opt = strsep(&options, ",")) != NULL) {
+	while (option_iter_next(&iter, &this_opt)) {
 		if (!strncmp(this_opt, "noaccel", 7)) {
 			noaccel = true;
 		} else if (!strncmp(this_opt, "nomtrr", 6)) {
@@ -3903,6 +3904,9 @@ static int __init atyfb_setup(char *options)
 			mode = mode_buf;
 		}
 	}
+
+	option_iter_release(&iter);
+
 	return 0;
 }
 #endif  /*  MODULE  */
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index dc2657ae96f2..975323e82f52 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -55,6 +55,7 @@
 #include "radeonfb.h"
 
 #include <linux/aperture.h>
+#include <linux/cmdline.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -2562,17 +2563,14 @@ static struct pci_driver radeonfb_driver = {
 };
 
 #ifndef MODULE
-static int __init radeonfb_setup (char *options)
+static int __init radeonfb_setup (const char *options)
 {
+	struct option_iter iter;
 	char *this_opt;
 
-	if (!options || !*options)
-		return 0;
-
-	while ((this_opt = strsep (&options, ",")) != NULL) {
-		if (!*this_opt)
-			continue;
+	option_iter_init(&iter, options);
 
+	while (option_iter_next(&iter, &this_opt)) {
 		if (!strncmp(this_opt, "noaccel", 7)) {
 			noaccel = 1;
 		} else if (!strncmp(this_opt, "mirror", 6)) {
@@ -2603,6 +2601,9 @@ static int __init radeonfb_setup (char *options)
 			mode_option = mode_option_buf;
 		}
 	}
+
+	option_iter_release(&iter);
+
 	return 0;
 }
 #endif  /*  MODULE  */
-- 
2.39.2

