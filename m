Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 759166B29EC
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Mar 2023 17:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbjCIQEI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Mar 2023 11:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbjCIQCa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Mar 2023 11:02:30 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3593F7EC5;
        Thu,  9 Mar 2023 08:02:29 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 628AD2215A;
        Thu,  9 Mar 2023 16:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678377748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U+Wv5+2Mg/OOpac2b+Kt6VAraiPSH3rcxItITwlujo0=;
        b=2MNMPBZYCIIHTJ2a9JkvDWsYV8evjucSV74au32ruPU/hzE/mOYrSxmf61i7KgGaAYkliZ
        DWu+fI20MDJORKJm3G1h6mvegZdTJ5/Fl91EZGDPqh1Goif9fF/ROHx893iPmOCjMZAniT
        IRpWPGDs9DVrRLU/zkJD4qSX+cGhguI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678377748;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U+Wv5+2Mg/OOpac2b+Kt6VAraiPSH3rcxItITwlujo0=;
        b=IYkv7jGmizkWRSS1WbdG2KFhNI5g5MrC25KLR887jQRD8KgRS6cMUcN2U/skNhJzjD0g2k
        SMKmJL+ohR28VlCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09A8C1391B;
        Thu,  9 Mar 2023 16:02:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0CqGARQDCmQHbgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:28 +0000
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
Subject: [PATCH v2 059/101] fbdev/pm3fb: Duplicate video-mode option string
Date:   Thu,  9 Mar 2023 17:01:19 +0100
Message-Id: <20230309160201.5163-60-tzimmermann@suse.de>
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

Assume that the driver does not own the option string or its substrings
and hence duplicate the option string for the video mode. Allocate the
copy's memory with kstrdup() and free it in the module's exit function.

Done in preparation of switching the driver to struct option_iter and
constifying the option string.

v2:
	* replace static memory with kstrdup()/kfree() (Geert)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/pm3fb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/pm3fb.c b/drivers/video/fbdev/pm3fb.c
index b46a471df9ae..b6b378e7554d 100644
--- a/drivers/video/fbdev/pm3fb.c
+++ b/drivers/video/fbdev/pm3fb.c
@@ -54,6 +54,7 @@
  * Driver data
  */
 static int hwcursor = 1;
+static char *mode_option_buf;
 static char *mode_option;
 static bool noaccel;
 static bool nomtrr;
@@ -1526,8 +1527,11 @@ static int __init pm3fb_setup(char *options)
 			hwcursor = simple_strtoul(this_opt + 9, NULL, 0);
 		else if (!strncmp(this_opt, "nomtrr", 6))
 			nomtrr = 1;
-		else
-			mode_option = this_opt;
+		else {
+			kfree(mode_option_buf);
+			mode_option_buf = kstrdup(this_opt, GFP_KERNEL); // ignore errors
+			mode_option = mode_option_buf;
+		}
 	}
 	return 0;
 }
@@ -1558,6 +1562,7 @@ static int __init pm3fb_init(void)
 static void __exit pm3fb_exit(void)
 {
 	pci_unregister_driver(&pm3fb_driver);
+	kfree(mode_option_buf);
 }
 
 module_exit(pm3fb_exit);
-- 
2.39.2

