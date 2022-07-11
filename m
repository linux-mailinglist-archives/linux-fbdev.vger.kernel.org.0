Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29ADE56A714
	for <lists+linux-fbdev@lfdr.de>; Thu,  7 Jul 2022 17:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235474AbiGGPkC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 7 Jul 2022 11:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235304AbiGGPkC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 7 Jul 2022 11:40:02 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCDCA2CDE6
        for <linux-fbdev@vger.kernel.org>; Thu,  7 Jul 2022 08:40:00 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 63EA01FE74;
        Thu,  7 Jul 2022 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1657208399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JLZSjD9KJpu7/jrbo2ieGliOMjlns4+usNCsA+ouyXY=;
        b=MSLUB6HmZ5SUgQsaqAtnrace+tiSG6OWsYXgL0TCDAPbEsrbTfIr2YALHDSGZ8fA35U0v+
        QpvypxYuH7b5LUe1TiQU0Fbu28zeQNBR9Z2xLDh+ibKPkQd62yzEDE9YtvDgknDDcFKQwF
        Se8bOTrhgEJC5IDkl8pB/MUHJxXZSYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1657208399;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JLZSjD9KJpu7/jrbo2ieGliOMjlns4+usNCsA+ouyXY=;
        b=Fmo8XrVRzBLbfFhcWB+r6bkOlVK51/wqJM7bMObLfxs70eCxlsg1bd1aV/yloxcT315rTt
        JkeHieEr9W+2RyBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33EF213A33;
        Thu,  7 Jul 2022 15:39:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id SNC9C0/+xmI9UQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 07 Jul 2022 15:39:59 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch,
        sam@ravnborg.org, maxime@cerno.tech
Cc:     linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/11] fbdev: Convert drivers to aperture helpers
Date:   Thu,  7 Jul 2022 17:39:46 +0200
Message-Id: <20220707153952.32264-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707153952.32264-1-tzimmermann@suse.de>
References: <20220707153952.32264-1-tzimmermann@suse.de>
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

Convert fbdev drivers from fbdev's remove_conflicting_framebuffers() to
the framework-independent aperture_remove_conflicting_devices(). Calling
this function will also remove conflicting DRM drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/staging/sm750fb/sm750.c       | 15 +++++----------
 drivers/video/fbdev/aty/radeon_base.c | 17 ++++-------------
 drivers/video/fbdev/hyperv_fb.c       |  6 ++++--
 3 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index dbd1159a2ef0..ce04c38f6afd 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/aperture.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/errno.h>
@@ -987,22 +988,16 @@ static int sm750fb_framebuffer_alloc(struct sm750_dev *sm750_dev, int fbidx)
 
 static int lynxfb_kick_out_firmware_fb(struct pci_dev *pdev)
 {
-	struct apertures_struct *ap;
+	resource_size_t base = pci_resource_start(pdev, 0);
+	resource_size_t size = pci_resource_len(pdev, 0);
 	bool primary = false;
 
-	ap = alloc_apertures(1);
-	if (!ap)
-		return -ENOMEM;
-
-	ap->ranges[0].base = pci_resource_start(pdev, 0);
-	ap->ranges[0].size = pci_resource_len(pdev, 0);
 #ifdef CONFIG_X86
 	primary = pdev->resource[PCI_ROM_RESOURCE].flags &
 					IORESOURCE_ROM_SHADOW;
 #endif
-	remove_conflicting_framebuffers(ap, "sm750_fb1", primary);
-	kfree(ap);
-	return 0;
+
+	return aperture_remove_conflicting_devices(base, size, primary, "sm750_fb1");
 }
 
 static int lynxfb_pci_probe(struct pci_dev *pdev,
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index b311c07fe66d..e5e362b8c9da 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -54,6 +54,7 @@
 
 #include "radeonfb.h"
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -2239,20 +2240,10 @@ static const struct bin_attribute edid2_attr = {
 
 static int radeon_kick_out_firmware_fb(struct pci_dev *pdev)
 {
-	struct apertures_struct *ap;
+	resource_size_t base = pci_resource_start(pdev, 0);
+	resource_size_t size = pci_resource_len(pdev, 0);
 
-	ap = alloc_apertures(1);
-	if (!ap)
-		return -ENOMEM;
-
-	ap->ranges[0].base = pci_resource_start(pdev, 0);
-	ap->ranges[0].size = pci_resource_len(pdev, 0);
-
-	remove_conflicting_framebuffers(ap, KBUILD_MODNAME, false);
-
-	kfree(ap);
-
-	return 0;
+	return aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME, false);
 }
 
 static int radeonfb_pci_register(struct pci_dev *pdev,
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 886c564787f1..a944a6620527 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -45,6 +45,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/vmalloc.h>
@@ -1074,8 +1075,9 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	info->screen_size = dio_fb_size;
 
 getmem_done:
-	remove_conflicting_framebuffers(info->apertures,
-					KBUILD_MODNAME, false);
+	aperture_remove_conflicting_devices(info->apertures->ranges[0].base,
+					    info->apertures->ranges[0].size,
+					    KBUILD_MODNAME, false);
 
 	if (gen2vm) {
 		/* framebuffer is reallocated, clear screen_info to avoid misuse from kexec */
-- 
2.36.1

