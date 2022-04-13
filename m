Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 393A74FF373
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Apr 2022 11:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbiDMJ1W (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 13 Apr 2022 05:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbiDMJ1T (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 13 Apr 2022 05:27:19 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CA74B41D;
        Wed, 13 Apr 2022 02:24:57 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 853B4210DF;
        Wed, 13 Apr 2022 09:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1649841896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uv3U9w6DDmu2kMGp6MxPhWiFNJjGjZSQTOEnzs614qY=;
        b=xAvjrjYrG4noAj3TyAzi8TdnC5jNWB9K565uzi/DA+ENLfv/SyajJCgfJS16/ph44lzbSt
        WBxKnFqveM6OuzEKolCvbnbwXE2V9WKqch02AEw970P+m6YZjojfRdLs2p5zkv1/uyQQC3
        Auu+jAWymKak1MxkgdaGH5KE9Y+py9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1649841896;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uv3U9w6DDmu2kMGp6MxPhWiFNJjGjZSQTOEnzs614qY=;
        b=fxHHiYpNPGOFO6ZUuk/9Db5NU8DSC9ENagdqNu2zF0+zDf7drjM26XAFSiNwzCmtoTq54u
        L4ahpXxsHNfjUBAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3487A13ABC;
        Wed, 13 Apr 2022 09:24:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id yF2cC+iWVmI5FwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 13 Apr 2022 09:24:56 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     robh+dt@kernel.org, frowand.list@gmail.com, daniel@ffwll.ch,
        deller@gmx.de, sam@ravnborg.org, linux@roeck-us.net,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
Cc:     devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] of: Create platform devices for OF framebuffers
Date:   Wed, 13 Apr 2022 11:24:53 +0200
Message-Id: <20220413092454.1073-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413092454.1073-1-tzimmermann@suse.de>
References: <20220413092454.1073-1-tzimmermann@suse.de>
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

Create a platform device for each OF-declared framebuffer and have
offb bind to these devices. Allows for real hot-unplugging and other
drivers besides offb.

Originally, offb created framebuffer devices while initializing its
module by parsing the OF device tree. No actual Linux device was set
up. This tied OF framebuffers to offb and makes writing other drivers
for the OF framebuffers complicated. The absence of a Linux device
prevented real hot-unplugging. Adding a distinct platform device for
each OF framebuffer solves both problems. Specifically, a DRM drivers
can now provide graphics output with modern userspace.

Some of the offb init code is now located in the OF initialization.
There's now also an implementation of of_platform_default_populate_init(),
which was missing before. The OF side creates different devices for
either OF display nodes or bootx displays as they require different
handling by the driver. The offb drivers picks up each type of device
and runs the appropriate fbdev initialization.

Tested with OF display nodes on qemu's ppc64le target.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/of/platform.c      | 73 ++++++++++++++++++++++++++--
 drivers/video/fbdev/offb.c | 98 +++++++++++++++++++++++++-------------
 2 files changed, 134 insertions(+), 37 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index a16b74f32aa9..4c63b9a73587 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -447,6 +447,60 @@ int of_platform_bus_probe(struct device_node *root,
 }
 EXPORT_SYMBOL(of_platform_bus_probe);
 
+static int __init of_platform_populate_framebuffers(void)
+{
+	struct device_node *boot_display = NULL;
+	struct device_node *node;
+	struct platform_device *dev;
+	int ret;
+
+	node = of_get_compatible_child(of_chosen, "simple-framebuffer");
+	of_platform_device_create(node, NULL, NULL);
+	of_node_put(node);
+
+	/* Check if we have a MacOS display without a node spec */
+	if (of_get_property(of_chosen, "linux,bootx-noscreen", NULL)) {
+		/*
+		 * The old code tried to work out which node was the MacOS
+		 * display based on the address. I'm dropping that since the
+		 * lack of a node spec only happens with old BootX versions
+		 * (users can update) and with this code, they'll still get
+		 * a display (just not the palette hacks).
+		 */
+		dev = platform_device_alloc("bootx-noscreen", 0);
+		if (WARN_ON(!dev))
+			return -ENOMEM;
+		ret = platform_device_add(dev);
+		if (WARN_ON(ret)) {
+			platform_device_put(dev);
+			return ret;
+		}
+	}
+
+	/*
+	 * For OF framebuffers, first create the device for the boot display,
+	 * then for the other framebuffers. Only fail for the boot display;
+	 * ignore errors for the rest.
+	 */
+	for_each_node_by_type(node, "display") {
+		if (!of_get_property(node, "linux,opened", NULL) ||
+		    !of_get_property(node, "linux,boot-display", NULL))
+			continue;
+		dev = of_platform_device_create(node, "of-display", NULL);
+		if (WARN_ON(!dev))
+			return -ENOMEM;
+		boot_display = node;
+		break;
+	}
+	for_each_node_by_type(node, "display") {
+		if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
+			continue;
+		of_platform_device_create(node, "of-display", NULL);
+	}
+
+	return 0;
+}
+
 /**
  * of_platform_populate() - Populate platform_devices from device tree data
  * @root: parent of the first level to probe or NULL for the root of the tree
@@ -541,9 +595,7 @@ static int __init of_platform_default_populate_init(void)
 		of_node_put(node);
 	}
 
-	node = of_get_compatible_child(of_chosen, "simple-framebuffer");
-	of_platform_device_create(node, NULL, NULL);
-	of_node_put(node);
+	of_platform_populate_framebuffers();
 
 	/* Populate everything else. */
 	of_platform_default_populate(NULL, NULL, NULL);
@@ -551,6 +603,20 @@ static int __init of_platform_default_populate_init(void)
 	return 0;
 }
 arch_initcall_sync(of_platform_default_populate_init);
+#else
+static int __init of_platform_default_populate_init(void)
+{
+	device_links_supplier_sync_state_pause();
+
+	if (!of_have_populated_dt())
+		return -ENODEV;
+
+	of_platform_populate_framebuffers();
+
+	return 0;
+}
+arch_initcall_sync(of_platform_default_populate_init);
+#endif
 
 static int __init of_platform_sync_state_init(void)
 {
@@ -558,7 +624,6 @@ static int __init of_platform_sync_state_init(void)
 	return 0;
 }
 late_initcall_sync(of_platform_sync_state_init);
-#endif
 
 int of_platform_device_destroy(struct device *dev, void *data)
 {
diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index afdb6aa48add..b1acb1ebebe9 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -386,10 +386,10 @@ static void offb_init_palette_hacks(struct fb_info *info, struct device_node *dp
 		FB_VISUAL_PSEUDOCOLOR : FB_VISUAL_STATIC_PSEUDOCOLOR;
 }
 
-static void __init offb_init_fb(const char *name,
-				int width, int height, int depth,
-				int pitch, unsigned long address,
-				int foreign_endian, struct device_node *dp)
+static void offb_init_fb(struct platform_device *parent, const char *name,
+			 int width, int height, int depth,
+			 int pitch, unsigned long address,
+			 int foreign_endian, struct device_node *dp)
 {
 	unsigned long res_size = pitch * height;
 	struct offb_par *par = &default_par;
@@ -410,12 +410,13 @@ static void __init offb_init_fb(const char *name,
 		return;
 	}
 
-	info = framebuffer_alloc(sizeof(u32) * 16, NULL);
+	info = framebuffer_alloc(sizeof(u32) * 16, &parent->dev);
 
 	if (!info) {
 		release_mem_region(res_start, res_size);
 		return;
 	}
+	platform_set_drvdata(parent, info);
 
 	fix = &info->fix;
 	var = &info->var;
@@ -535,7 +536,8 @@ static void __init offb_init_fb(const char *name,
 }
 
 
-static void __init offb_init_nodriver(struct device_node *dp, int no_real_node)
+static void offb_init_nodriver(struct platform_device *parent, struct device_node *dp,
+			       int no_real_node)
 {
 	unsigned int len;
 	int i, width = 640, height = 480, depth = 8, pitch = 640;
@@ -650,46 +652,76 @@ static void __init offb_init_nodriver(struct device_node *dp, int no_real_node)
 		/* kludge for valkyrie */
 		if (of_node_name_eq(dp, "valkyrie"))
 			address += 0x1000;
-		offb_init_fb(no_real_node ? "bootx" : NULL,
+		offb_init_fb(parent, no_real_node ? "bootx" : NULL,
 			     width, height, depth, pitch, address,
 			     foreign_endian, no_real_node ? NULL : dp);
 	}
 }
 
-static int __init offb_init(void)
+static int offb_remove(struct platform_device *pdev)
 {
-	struct device_node *dp = NULL, *boot_disp = NULL;
+	struct fb_info *info = platform_get_drvdata(pdev);
 
-	if (fb_get_options("offb", NULL))
-		return -ENODEV;
+	if (info)
+		unregister_framebuffer(info);
 
-	/* Check if we have a MacOS display without a node spec */
-	if (of_get_property(of_chosen, "linux,bootx-noscreen", NULL) != NULL) {
-		/* The old code tried to work out which node was the MacOS
-		 * display based on the address. I'm dropping that since the
-		 * lack of a node spec only happens with old BootX versions
-		 * (users can update) and with this code, they'll still get
-		 * a display (just not the palette hacks).
-		 */
-		offb_init_nodriver(of_chosen, 1);
-	}
+	return 0;
+}
 
-	for_each_node_by_type(dp, "display") {
-		if (of_get_property(dp, "linux,opened", NULL) &&
-		    of_get_property(dp, "linux,boot-display", NULL)) {
-			boot_disp = dp;
-			offb_init_nodriver(dp, 0);
-		}
-	}
-	for_each_node_by_type(dp, "display") {
-		if (of_get_property(dp, "linux,opened", NULL) &&
-		    dp != boot_disp)
-			offb_init_nodriver(dp, 0);
-	}
+static int offb_probe_bootx_noscreen(struct platform_device *pdev)
+{
+	offb_init_nodriver(pdev, of_chosen, 1);
 
 	return 0;
 }
 
+static struct platform_driver offb_driver_bootx_noscreen = {
+	.driver = {
+		.name = "bootx-noscreen",
+	},
+	.probe = offb_probe_bootx_noscreen,
+	.remove = offb_remove,
+};
+
+static int offb_probe_display(struct platform_device *pdev)
+{
+	offb_init_nodriver(pdev, pdev->dev.of_node, 0);
+
+	return 0;
+}
 
+static const struct of_device_id offb_of_match_display[] = {
+	{ .compatible = "display", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, offb_of_match_display);
+
+static struct platform_driver offb_driver_display = {
+	.driver = {
+		.name = "of-display",
+		.of_match_table = offb_of_match_display,
+	},
+	.probe = offb_probe_display,
+	.remove = offb_remove,
+};
+
+static int __init offb_init(void)
+{
+	if (fb_get_options("offb", NULL))
+		return -ENODEV;
+
+	platform_driver_register(&offb_driver_bootx_noscreen);
+	platform_driver_register(&offb_driver_display);
+
+	return 0;
+}
 module_init(offb_init);
+
+static void __exit offb_exit(void)
+{
+	platform_driver_unregister(&offb_driver_display);
+	platform_driver_unregister(&offb_driver_bootx_noscreen);
+}
+module_exit(offb_exit);
+
 MODULE_LICENSE("GPL");
-- 
2.35.1

