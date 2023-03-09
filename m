Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B5E6B29B9
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Mar 2023 17:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjCIQDd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Mar 2023 11:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbjCIQCV (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Mar 2023 11:02:21 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A89EDF7EC0;
        Thu,  9 Mar 2023 08:02:19 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3EB1920188;
        Thu,  9 Mar 2023 16:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678377738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3kZX8EmQe3IAEU0LH1oxMIvRcDm5wiAbtU7Jk+5Zv3U=;
        b=gti5ZhgRVsHxsNxkdlXALqaCbMRiaTHS0TRUzri2radJZ/SfVaDFK9XPwpb6WPPcKfE5EZ
        BvlFkTZR4WYS+PmVybjuBzDW42WBqTaac51zYkwJr11j/dCqGKwxecOw29eukQcpmif3Vq
        WqWbQKKszxYt7KRCLZC9BTEhr0wSlms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678377738;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3kZX8EmQe3IAEU0LH1oxMIvRcDm5wiAbtU7Jk+5Zv3U=;
        b=InBj3RHeVLA4P9g9rV4Lf4l+c5fbol1a3uFH8jZRP49oUktbeaTjpaK3cWysqd9Y7XAKll
        MptlT9eKu/3m6yCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D551B13A73;
        Thu,  9 Mar 2023 16:02:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OJkjMwkDCmQHbgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:17 +0000
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
Subject: [PATCH v2 033/101] fbdev/i740fb: Parse option string with struct option_iter
Date:   Thu,  9 Mar 2023 17:00:53 +0100
Message-Id: <20230309160201.5163-34-tzimmermann@suse.de>
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
 drivers/video/fbdev/i740fb.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 61c022b8d5de..6da2f3b7846d 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/cmdline.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1262,17 +1263,15 @@ static struct pci_driver i740fb_driver = {
 };
 
 #ifndef MODULE
-static int  __init i740fb_setup(char *options)
+static int  __init i740fb_setup(const char *options)
 {
+	struct option_iter iter;
 	char *opt;
 
-	if (!options || !*options)
-		return 0;
+	option_iter_init(&iter, options);
 
-	while ((opt = strsep(&options, ",")) != NULL) {
-		if (!*opt)
-			continue;
-		else if (!strncmp(opt, "mtrr:", 5))
+	while (option_iter_next(&iter, &opt)) {
+		if (!strncmp(opt, "mtrr:", 5))
 			mtrr = simple_strtoul(opt + 5, NULL, 0);
 		else {
 			kfree(mode_option_buf);
@@ -1281,6 +1280,8 @@ static int  __init i740fb_setup(char *options)
 		}
 	}
 
+	option_iter_release(&iter);
+
 	return 0;
 }
 #endif
-- 
2.39.2

