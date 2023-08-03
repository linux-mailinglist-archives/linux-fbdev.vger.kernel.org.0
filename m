Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 147DE76F220
	for <lists+linux-fbdev@lfdr.de>; Thu,  3 Aug 2023 20:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234123AbjHCSkw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 3 Aug 2023 14:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbjHCSks (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 3 Aug 2023 14:40:48 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B812D7B;
        Thu,  3 Aug 2023 11:40:45 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A30591F890;
        Thu,  3 Aug 2023 18:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1691088043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JNBli7ory+gyKuKwHaGXbQurMpw0VV11y2foC+Necv8=;
        b=qWytb2Rza+De3yOqACFMtr8+agcJQmVMl5YF9VMlevucfLfEAcSkpmpbmA5PaycIkr4vFN
        0zbs4cQrxV2db4c7BjtERP67CC/FEW+WU1i0eX5b9oBplcv2HplkkmrQOfJsF3A2fmvK/1
        XRKxNbsiuvV4Qevzxe2lCrtO01FAh/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1691088043;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JNBli7ory+gyKuKwHaGXbQurMpw0VV11y2foC+Necv8=;
        b=vfXglBuUkb8zydPE/D60YXyEtHcRiYFSIm/44C7Q74YAAGDUwn2jLlWj74swAz8S2ELUcQ
        3Daf6JIBsBP9LdCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EF43139BD;
        Thu,  3 Aug 2023 18:40:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id uKgvGqv0y2TLGAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 03 Aug 2023 18:40:43 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com, sam@ravnborg.org
Cc:     linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-geode@lists.infradead.org, linux-omap@vger.kernel.org,
        kvm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 22/47] fbdev/macfb: Use fbdev I/O helpers
Date:   Thu,  3 Aug 2023 20:35:47 +0200
Message-ID: <20230803184034.6456-23-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803184034.6456-1-tzimmermann@suse.de>
References: <20230803184034.6456-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Set struct fb_ops and with FB_DEFAULT_IOMEM_OPS, fbdev's initializer
for I/O memory. Sets the callbacks to the cfb_ and fb_io_ functions.
Select the correct modules with Kconfig's FB_IOMEM_HELPERS token.

The macro and token set the currently selected values, so there is
no functional change.

v3:
	* use _IOMEM_ in commit message
v2:
	* updated to use _IOMEM_ tokens

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/Kconfig | 4 +---
 drivers/video/fbdev/macfb.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 231450ef449f..c7ee242985ed 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -407,9 +407,7 @@ config FB_STI
 config FB_MAC
 	bool "Generic Macintosh display support"
 	depends on (FB = y) && MAC
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_HELPERS
 	select FB_MACMODES
 
 config FB_HP300
diff --git a/drivers/video/fbdev/macfb.c b/drivers/video/fbdev/macfb.c
index 5ca208d992cc..887fffdccd24 100644
--- a/drivers/video/fbdev/macfb.c
+++ b/drivers/video/fbdev/macfb.c
@@ -498,10 +498,8 @@ static int macfb_setcolreg(unsigned regno, unsigned red, unsigned green,
 
 static const struct fb_ops macfb_ops = {
 	.owner		= THIS_MODULE,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_setcolreg	= macfb_setcolreg,
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
-	.fb_imageblit	= cfb_imageblit,
 };
 
 static void __init macfb_setup(char *options)
-- 
2.41.0

