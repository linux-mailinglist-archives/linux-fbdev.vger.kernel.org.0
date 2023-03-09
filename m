Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD096B29DE
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Mar 2023 17:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbjCIQDz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Mar 2023 11:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbjCIQCZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Mar 2023 11:02:25 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5B2F7EE7;
        Thu,  9 Mar 2023 08:02:24 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 5754A22158;
        Thu,  9 Mar 2023 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678377743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ai+UeCW+AhsoKfqWG5QFx6U/VSD9FuiIhsYKiqWB00A=;
        b=nxteKXOcJTnmZ+AfjBKZCbhwRbte4JILVsUC4GnBe5KlaPlLHXmTuGtVu+ViN+ECW+44P/
        Ly+dus4n/DRJHs2ySjeVVOF6Tzz5e/rNNJvysuW1h7tYti59rXT29y7lqTHHM/3enOOUIW
        a7CI5LbqIYbCVSYm1UGD3ocJMpq/un8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678377743;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ai+UeCW+AhsoKfqWG5QFx6U/VSD9FuiIhsYKiqWB00A=;
        b=qCR2hPQslBhn94hWgs9F4HlXq7ylQCuN35HGlZHqBA5tV8/mpI6q/xgjZg6Utr/YKiGfc/
        /zofyFiq7pUsA0Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03F3C1391B;
        Thu,  9 Mar 2023 16:02:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id CKobAA8DCmQHbgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:23 +0000
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
Subject: [PATCH v2 046/101] fbdev/mx3fb: Duplicate video-mode option string
Date:   Thu,  9 Mar 2023 17:01:06 +0100
Message-Id: <20230309160201.5163-47-tzimmermann@suse.de>
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
 drivers/video/fbdev/mx3fb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index 76771e126d0a..e33ad125318f 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -332,6 +332,7 @@ static void mx3fb_exit_backlight(struct mx3fb_data *fbd)
 static void mx3fb_dma_done(void *);
 
 /* Used fb-mode and bpp. Can be set on kernel command line, therefore file-static. */
+static const char *fb_mode_buf;
 static const char *fb_mode;
 static unsigned long default_bpp = 16;
 
@@ -1666,8 +1667,11 @@ static int __init mx3fb_setup(void)
 			continue;
 		if (!strncmp(opt, "bpp=", 4))
 			default_bpp = simple_strtoul(opt + 4, NULL, 0);
-		else
-			fb_mode = opt;
+		else {
+			kfree(fb_mode_buf);
+			fb_mode_buf = kstrdup(opt, GFP_KERNEL); // ignore errors
+			fb_mode = fb_mode_buf;
+		}
 	}
 #endif
 
@@ -1688,6 +1692,7 @@ static int __init mx3fb_init(void)
 static void __exit mx3fb_exit(void)
 {
 	platform_driver_unregister(&mx3fb_driver);
+	kfree(fb_mode_buf);
 }
 
 module_init(mx3fb_init);
-- 
2.39.2

