Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0261690AF3
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Feb 2023 14:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbjBINzT (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Feb 2023 08:55:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbjBINzR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Feb 2023 08:55:17 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCA25B76B
        for <linux-fbdev@vger.kernel.org>; Thu,  9 Feb 2023 05:55:15 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id B87BC5D02F;
        Thu,  9 Feb 2023 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1675950913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fdkZxZ1tj+/TzXlhWq4Mz1qQtxylK1v1bJXhXgBLSpA=;
        b=MH66V1Az1kpW7k9YAXKTcie6qpNmwWClZuwMgliuDPAjI56M0jtR4gNYlzPRC+neCUkQss
        88V0U2sokjiqGIa9oJcCJIxjhQw/vJ0XGHzgRSuAH/T9rtR/FlgWwyPzNw7Z6cW7Y4nJsi
        GHA+EO9WpV2ZWz3aF46GJ3Uk41s4qmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1675950913;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fdkZxZ1tj+/TzXlhWq4Mz1qQtxylK1v1bJXhXgBLSpA=;
        b=FgTBqDZxusuB15BYHZSu+HXrLvTcIJCQcWBG2vF+iJDux84+Zetdu43UT85Ha+BtyyJr/t
        wZCTqz5yz8pp7QAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7AA26138E4;
        Thu,  9 Feb 2023 13:55:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id MOT7HEH75GNTfwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 13:55:13 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de,
        javierm@redhat.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/11] drivers/ps3: Read video= option with fb_get_option()
Date:   Thu,  9 Feb 2023 14:55:02 +0100
Message-Id: <20230209135509.7786-5-tzimmermann@suse.de>
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
 drivers/ps3/ps3av.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/ps3/ps3av.c b/drivers/ps3/ps3av.c
index 516e6d14d32e..8f3e60f1bfe2 100644
--- a/drivers/ps3/ps3av.c
+++ b/drivers/ps3/ps3av.c
@@ -921,6 +921,9 @@ EXPORT_SYMBOL_GPL(ps3av_audio_mute);
 
 static int ps3av_probe(struct ps3_system_bus_device *dev)
 {
+#ifdef CONFIG_FB
+	char *mode_option = NULL;
+#endif
 	int res;
 	int id;
 
@@ -969,8 +972,12 @@ static int ps3av_probe(struct ps3_system_bus_device *dev)
 	ps3av_get_hw_conf(ps3av);
 
 #ifdef CONFIG_FB
-	if (fb_mode_option && !strcmp(fb_mode_option, "safe"))
-		safe_mode = 1;
+	fb_get_options(NULL, &mode_option);
+	if (mode_option) {
+		if (!strcmp(mode_option, "safe"))
+			safe_mode = 1;
+		kfree(mode_option);
+	}
 #endif /* CONFIG_FB */
 	id = ps3av_auto_videomode(&ps3av->av_hw_conf);
 	if (id < 0) {
-- 
2.39.1

