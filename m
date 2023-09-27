Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD1E37AFC92
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Sep 2023 09:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjI0Hrv (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Sep 2023 03:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjI0Hre (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Sep 2023 03:47:34 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49B61BF;
        Wed, 27 Sep 2023 00:47:32 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 30598218A2;
        Wed, 27 Sep 2023 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695800850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zoNkSP1xm6F8e8A1K7Rp8buTbSF05HOcVujnEuQjmXA=;
        b=g3uV31Zq5cu/s+j+N17iTRI7prQaoiU42/M3es/U5vfZm3J8r9YpB70qiDLWSKf7dyTcO7
        /gimMZzrguh2xuvMP5mIGJ6ZbgCj8DHYnZ1eU93p9+vCqbp2aGcnD9Q6luwSCa94zhuRI4
        XzCXphj7wkaTcJxOaSx9ErcZQSiZAmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695800850;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zoNkSP1xm6F8e8A1K7Rp8buTbSF05HOcVujnEuQjmXA=;
        b=G2sOpLRe/EVgCAJJjss/r3CZV4J6LvipbEO6PHnwKCjNY/svTjrN0PKOz172NvGAN2sfve
        ECQgYnvKZNNLsNCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2A711338F;
        Wed, 27 Sep 2023 07:47:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 2DJ4NhHeE2XvUQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:29 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
        daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maik Broemme <mbroemme@libmpq.org>
Subject: [PATCH 21/46] fbdev/intelfb: Initialize fb_ops to fbdev I/O-memory helpers
Date:   Wed, 27 Sep 2023 09:26:54 +0200
Message-ID: <20230927074722.6197-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927074722.6197-1-tzimmermann@suse.de>
References: <20230927074722.6197-1-tzimmermann@suse.de>
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

Initialize the instance of struct fb_ops with fbdev initializer
macros for framebuffers in I/O address space. Set the read/write,
draw and mmap callbacks to the correct implementation and avoid
implicit defaults. Also select the necessary I/O helpers in Kconfig.

Fbdev drivers sometimes rely on the callbacks being NULL for a
default implementation to be invoked; hence requiring the I/O
helpers to be built in any case. Setting all callbacks in all
drivers explicitly will allow to make the I/O helpers optional.
This benefits systems that do not use these functions.

No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maik Broemme <mbroemme@libmpq.org>
---
 drivers/video/fbdev/Kconfig              | 3 ++-
 drivers/video/fbdev/intelfb/intelfbdrv.c | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 46f761ffa13c9..c1bb885cee4c3 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -861,10 +861,11 @@ config FB_CARILLO_RANCH
 config FB_INTEL
 	tristate "Intel 830M/845G/852GM/855GM/865G/915G/945G/945GM/965G/965GM support"
 	depends on FB && PCI && X86 && AGP_INTEL && EXPERT
-	select FB_MODE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
+	select FB_MODE_HELPERS
 	select BOOT_VESA_SUPPORT if FB_INTEL = y
 	select VIDEO_NOMODESET
 	depends on !DRM_I915
diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index 3d334f1719596..d29d80a16295e 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -198,6 +198,7 @@ static const struct fb_ops intel_fb_ops = {
 	.owner =		THIS_MODULE,
 	.fb_open =              intelfb_open,
 	.fb_release =           intelfb_release,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var =         intelfb_check_var,
 	.fb_set_par =           intelfb_set_par,
 	.fb_setcolreg =		intelfb_setcolreg,
@@ -208,7 +209,8 @@ static const struct fb_ops intel_fb_ops = {
 	.fb_imageblit =         intelfb_imageblit,
 	.fb_cursor =            intelfb_cursor,
 	.fb_sync =              intelfb_sync,
-	.fb_ioctl =		intelfb_ioctl
+	.fb_ioctl =		intelfb_ioctl,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 /* PCI driver module table */
-- 
2.42.0

