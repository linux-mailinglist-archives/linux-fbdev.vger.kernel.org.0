Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9BF656A716
	for <lists+linux-fbdev@lfdr.de>; Thu,  7 Jul 2022 17:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbiGGPkD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 7 Jul 2022 11:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiGGPkC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 7 Jul 2022 11:40:02 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C5E2C673
        for <linux-fbdev@vger.kernel.org>; Thu,  7 Jul 2022 08:40:01 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 2D7DA1FF58;
        Thu,  7 Jul 2022 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1657208400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j5fY3Ea70f/1BWSbsP/cFiQ0tI3pdSpnfUk47C85qqo=;
        b=Pdr35ePFUfiihNOZy9AyhyNW1lA9ib9jQ4LrqFbcbT13SAbhU9Rg8E9ohoD2R6b0/hylFm
        fA3yrNeQ3o3TDJsA7dxcO06gxMJUf1zx19YvWzrU8ShtbBxplKwf8R2AgE+btknpa0584F
        koTRipdx2Z2gM9q2q+IAVBD/uhqntoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1657208400;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j5fY3Ea70f/1BWSbsP/cFiQ0tI3pdSpnfUk47C85qqo=;
        b=/UoVIgD2+Vu7wXxPZ6+/9zC6ZYyMHpHAdfjGw7t1a05v/ssSGWcCim8V+B1pHLHuI2RdvZ
        wnUOADB0finooICQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F140613B4E;
        Thu,  7 Jul 2022 15:39:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id mDzxOU/+xmI9UQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 07 Jul 2022 15:39:59 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch,
        sam@ravnborg.org, maxime@cerno.tech
Cc:     linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/11] video: Provide constants for VGA I/O range
Date:   Thu,  7 Jul 2022 17:39:49 +0200
Message-Id: <20220707153952.32264-9-tzimmermann@suse.de>
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

Provide VGA_FB_ constants for the VGA framebuffer I/O range and convert
fbdev code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbmem.c |  4 ++--
 drivers/video/fbdev/vga16fb.c    | 15 ++++++---------
 include/video/vga.h              |  2 ++
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 3ee3ea018245..2237049327db 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -39,6 +39,7 @@
 
 #include <asm/fb.h>
 
+#include <video/vga.h>
 
     /*
      *  Frame buffer device initialization and setup routines
@@ -1549,7 +1550,6 @@ static bool fb_do_apertures_overlap(struct apertures_struct *gena,
 
 static void do_unregister_framebuffer(struct fb_info *fb_info);
 
-#define VGA_FB_PHYS 0xA0000
 static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 					       const char *name, bool primary)
 {
@@ -1568,7 +1568,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 		device = registered_fb[i]->device;
 		if (fb_do_apertures_overlap(gen_aper, a) ||
 			(primary && gen_aper && gen_aper->count &&
-			 gen_aper->ranges[0].base == VGA_FB_PHYS)) {
+			 gen_aper->ranges[0].base == VGA_FB_PHYS_BASE)) {
 
 			printk(KERN_INFO "fb%d: switching to %s from %s\n",
 			       i, name, registered_fb[i]->fix.id);
diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index e7767ed50c5b..595a69634082 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -25,9 +25,6 @@
 #include <asm/io.h>
 #include <video/vga.h>
 
-#define VGA_FB_PHYS 0xA0000
-#define VGA_FB_PHYS_LEN 65536
-
 #define MODE_SKIP4	1
 #define MODE_8BPP	2
 #define MODE_CFB	4
@@ -87,8 +84,8 @@ static struct fb_var_screeninfo vga16fb_defined = {
 /* name should not depend on EGA/VGA */
 static const struct fb_fix_screeninfo vga16fb_fix = {
 	.id		= "VGA16 VGA",
-	.smem_start	= VGA_FB_PHYS,
-	.smem_len	= VGA_FB_PHYS_LEN,
+	.smem_start	= VGA_FB_PHYS_BASE,
+	.smem_len	= VGA_FB_PHYS_SIZE,
 	.type		= FB_TYPE_VGA_PLANES,
 	.type_aux	= FB_AUX_VGA_PLANES_VGA4,
 	.visual		= FB_VISUAL_PSEUDOCOLOR,
@@ -1357,8 +1354,8 @@ static int vga16fb_probe(struct platform_device *dev)
 		goto err_ioremap;
 	}
 
-	/* XXX share VGA_FB_PHYS and I/O region with vgacon and others */
-	info->screen_base = (void __iomem *)VGA_MAP_MEM(VGA_FB_PHYS, 0);
+	/* XXX share VGA_FB_PHYS_BASE and I/O region with vgacon and others */
+	info->screen_base = (void __iomem *)VGA_MAP_MEM(VGA_FB_PHYS_BASE, 0);
 
 	if (!info->screen_base) {
 		printk(KERN_ERR "vga16fb: unable to map device\n");
@@ -1409,8 +1406,8 @@ static int vga16fb_probe(struct platform_device *dev)
 
 	vga16fb_update_fix(info);
 
-	info->apertures->ranges[0].base = VGA_FB_PHYS;
-	info->apertures->ranges[0].size = VGA_FB_PHYS_LEN;
+	info->apertures->ranges[0].base = VGA_FB_PHYS_BASE;
+	info->apertures->ranges[0].size = VGA_FB_PHYS_SIZE;
 
 	if (register_framebuffer(info) < 0) {
 		printk(KERN_ERR "vga16fb: unable to register framebuffer\n");
diff --git a/include/video/vga.h b/include/video/vga.h
index ef8e9fa9b9bd..947c0abd04ef 100644
--- a/include/video/vga.h
+++ b/include/video/vga.h
@@ -22,6 +22,8 @@
 #include <asm/vga.h>
 #include <asm/byteorder.h>
 
+#define VGA_FB_PHYS_BASE	0xA0000 /* VGA framebuffer I/O base */
+#define VGA_FB_PHYS_SIZE	65536	/* VGA framebuffer I/O size */
 
 /* Some of the code below is taken from SVGAlib.  The original,
    unmodified copyright notice for that code is below. */
-- 
2.36.1

