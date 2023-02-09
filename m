Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D69DA690AF7
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Feb 2023 14:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbjBINzU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Feb 2023 08:55:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbjBINzR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Feb 2023 08:55:17 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7E65B770
        for <linux-fbdev@vger.kernel.org>; Thu,  9 Feb 2023 05:55:15 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 057ED22A07;
        Thu,  9 Feb 2023 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1675950914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8eBCLRr3t1h8753CZ0GUzerEoeVgFt36ay0mIxK/Nlk=;
        b=RpxPnW2YRMAvdXXvgwtBBFHfVKDfyVoxorZzYEeC2BMCok6Vlbpz/p5i44Q73/+lFUMhGd
        gUPgsHb6lJ02TEst8GtVA7FBv6we67LZFETHBr+qTUdxIRmVLW9FxU9dC9fhKQD6jXLLa4
        IbjMntXxvkFdg/pGDjc+StSWTzG9V6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1675950914;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8eBCLRr3t1h8753CZ0GUzerEoeVgFt36ay0mIxK/Nlk=;
        b=8WA+mC44dHmYSPNgW47lM3JP7rmzvxibc9Yk9LKoVTLJvD0QbAxlSlAIB39+Ep+/4U0kl6
        YtqCBx7G04oJVABQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC93113915;
        Thu,  9 Feb 2023 13:55:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id YGQsLUH75GNTfwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 13:55:13 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de,
        javierm@redhat.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/11] fbdev: Read video= option with fb_get_option() in modedb
Date:   Thu,  9 Feb 2023 14:55:03 +0100
Message-Id: <20230209135509.7786-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209135509.7786-1-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
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

Get the kernel's global video= parameter with fb_get_option(). Done
to unexport the internal fbdev state fb_mode_config. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/modedb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/modedb.c b/drivers/video/fbdev/core/modedb.c
index 6473e0dfe146..23cf8eba785d 100644
--- a/drivers/video/fbdev/core/modedb.c
+++ b/drivers/video/fbdev/core/modedb.c
@@ -620,6 +620,7 @@ int fb_find_mode(struct fb_var_screeninfo *var,
 		 const struct fb_videomode *default_mode,
 		 unsigned int default_bpp)
 {
+	char *mode_option_buf = NULL;
 	int i;
 
 	/* Set up defaults */
@@ -635,8 +636,10 @@ int fb_find_mode(struct fb_var_screeninfo *var,
 		default_bpp = 8;
 
 	/* Did the user specify a video mode? */
-	if (!mode_option)
-		mode_option = fb_mode_option;
+	if (!mode_option) {
+		fb_get_options(NULL, &mode_option_buf);
+		mode_option = mode_option_buf;
+	}
 	if (mode_option) {
 		const char *name = mode_option;
 		unsigned int namelen = strlen(name);
@@ -715,6 +718,7 @@ int fb_find_mode(struct fb_var_screeninfo *var,
 			res_specified = 1;
 		}
 done:
+		kfree(mode_option_buf);
 		if (cvt) {
 			struct fb_videomode cvt_mode;
 			int ret;
-- 
2.39.1

