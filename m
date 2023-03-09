Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 902A56B2A07
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Mar 2023 17:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbjCIQEc (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Mar 2023 11:04:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbjCIQCg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Mar 2023 11:02:36 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83667F6C7A;
        Thu,  9 Mar 2023 08:02:35 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 44B6420179;
        Thu,  9 Mar 2023 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678377754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k8XeD13siGTPg6ur3jYfV0pIQmZ74GbDCRGpLHT3KYY=;
        b=usVstNaMvRiiNGybfSZtuWZwo3o9DGS90YmiNS0IerHlu++zx9+fuYsOeVk4z0EgLQTlP8
        14EDFUpo8H9GZmISw0ir5bUUpescdqkii0CWQ9VMU9VZvUb4BxdVaAytuOV9oq0xdv0TOG
        uHSraghKEl2vhKBCAMaVsBA1wC6TXuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678377754;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k8XeD13siGTPg6ur3jYfV0pIQmZ74GbDCRGpLHT3KYY=;
        b=/A7j3hhwjwv8mVq2lH3pzqblM4RD5k5cYFw3kOjsSVifHYNdq7tqboxQQcrw+F+RpFjPDD
        OeM8vPaucJ9tCuBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9D8613A73;
        Thu,  9 Mar 2023 16:02:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id SMUxNBkDCmQHbgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:33 +0000
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
Subject: [PATCH v2 074/101] fbdev/skeletonfb: Parse option string with struct option_iter
Date:   Thu,  9 Mar 2023 17:01:34 +0100
Message-Id: <20230309160201.5163-75-tzimmermann@suse.de>
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
 drivers/video/fbdev/skeletonfb.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index 40c130ab6b38..ee6944d0ebc1 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -43,6 +43,7 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/cmdline.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -973,9 +974,19 @@ static struct platform_device *xxxfb_device;
  * Only necessary if your driver takes special options,
  * otherwise we fall back on the generic fb_setup().
  */
-static int __init xxxfb_setup(char *options)
+static int __init xxxfb_setup(const char *options)
 {
-    /* Parse user specified options (`video=xxxfb:') */
+	/* Parse user-specified options (`video=xxxfb:') */
+
+	struct option_iter iter;
+	char *this_opt;
+
+	option_iter_init(&iter, options);
+
+	while (option_iter_next(&iter, &this_opt)) {
+	}
+
+	option_iter_release(&iter);
 }
 #endif /* MODULE */
 
-- 
2.39.2

