Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78DE56B2A3D
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Mar 2023 17:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbjCIQFB (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Mar 2023 11:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbjCIQCp (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Mar 2023 11:02:45 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72B4F7EE2;
        Thu,  9 Mar 2023 08:02:44 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7CB1622158;
        Thu,  9 Mar 2023 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678377763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jWp/QupJ7lE9lZrkHkA8/CsL9Gj47AgqbuLGp0xrG1c=;
        b=XRSsNo3dtACqfxy0a48JxdH15rwMVIHpG1l3WXc2kEYIigrEdk28EP+Nn76+l4FNgLwVHz
        zr4pBxNmpg8zZTyVJdW3FoVYQg+Aihdd4UMunIwiMopFYYjQbpYBaNXdIYjZlzuQqsWjGn
        6MRaiG04ik99uB6GQUFFFBsVk2U+7aQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678377763;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jWp/QupJ7lE9lZrkHkA8/CsL9Gj47AgqbuLGp0xrG1c=;
        b=1VLdQckklPlS8Lm6AMQ7rfktOYxy4ECYo2JAc26tLf8sFvOswz6SWNJ+7EI3SRphcrBRsc
        5Felkaa2IufKu6Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B7D01391B;
        Thu,  9 Mar 2023 16:02:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id KKKyBSMDCmQHbgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:43 +0000
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
Subject: [PATCH v2 096/101] fbdev/viafb: Parse option string with struct option_iter
Date:   Thu,  9 Mar 2023 17:01:56 +0100
Message-Id: <20230309160201.5163-97-tzimmermann@suse.de>
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
 drivers/video/fbdev/via/viafbdev.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/via/viafbdev.c
index 2d67c92c5774..749aee9f6c56 100644
--- a/drivers/video/fbdev/via/viafbdev.c
+++ b/drivers/video/fbdev/via/viafbdev.c
@@ -5,6 +5,7 @@
 
  */
 
+#include <linux/cmdline.h>
 #include <linux/compiler.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
@@ -1922,21 +1923,18 @@ void via_fb_pci_remove(struct pci_dev *pdev)
 #ifndef MODULE
 static int __init viafb_setup(void)
 {
-	char *this_opt;
 	char *options;
+	struct option_iter iter;
+	char *this_opt;
 
 	DEBUG_MSG(KERN_INFO "viafb_setup!\n");
 
 	if (fb_get_options("viafb", &options))
 		return -ENODEV;
 
-	if (!options || !*options)
-		return 0;
-
-	while ((this_opt = strsep(&options, ",")) != NULL) {
-		if (!*this_opt)
-			continue;
+	option_iter_init(&iter, options);
 
+	while (option_iter_next(&iter, &this_opt)) {
 		if (!strncmp(this_opt, "viafb_mode1=", 12)) {
 			viafb_mode1 = kstrdup(this_opt + 12, GFP_KERNEL);
 			if (!viafb_mode1)
@@ -2009,6 +2007,9 @@ static int __init viafb_setup(void)
 				return -ENOMEM;
 		}
 	}
+
+	option_iter_release(&iter);
+
 	return 0;
 }
 #endif
-- 
2.39.2

