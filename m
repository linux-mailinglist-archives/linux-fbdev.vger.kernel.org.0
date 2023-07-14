Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99796753436
	for <lists+linux-fbdev@lfdr.de>; Fri, 14 Jul 2023 09:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235821AbjGNHxF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 14 Jul 2023 03:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235563AbjGNHwH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 14 Jul 2023 03:52:07 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2DE30FA;
        Fri, 14 Jul 2023 00:52:04 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 25F5822166;
        Fri, 14 Jul 2023 07:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1689321123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v24pXsvqjxRrlvyUnUkzMIb7phvTsFoE3ROzADjf/xc=;
        b=1QAjz7jNu8g4h3nl1Sbt5B/JnL3QU/PwIE/aPhtVDqsbNTRx1Qk3wujg+dyuGne0UAzTd5
        8VYuwMy/Ii267KthOixOwxSX4VNf9n86YfR1mkE1rPAz7wDgagQEjibHJAuLlHCqOPnEML
        LFMB2wt3yMRZUVJmn4cQ4XpWMbtUGcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1689321123;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v24pXsvqjxRrlvyUnUkzMIb7phvTsFoE3ROzADjf/xc=;
        b=C7k4QhCog6fuvwN7ocouiUiL48mPCICeCftR0Xke8ZmRHbS2C35kZfXDLeClrTp0JTw8cn
        yuV6M2LjHdRAFEAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 70D8113A15;
        Fri, 14 Jul 2023 07:52:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id QIN3GqL+sGQCQwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 14 Jul 2023 07:52:02 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com
Cc:     linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-geode@lists.infradead.org, linux-nvidia@lists.surfsouth.com,
        linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jaya Kumar <jayalk@intworks.biz>,
        Peter Jones <pjones@redhat.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Maik Broemme <mbroemme@libmpq.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Teddy Wang <teddy.wang@siliconmotion.com>,
        Michal Januszewski <spock@gentoo.org>
Subject: [PATCH v3 14/18] fbdev: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
Date:   Fri, 14 Jul 2023 09:49:40 +0200
Message-ID: <20230714075155.5686-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714075155.5686-1-tzimmermann@suse.de>
References: <20230714075155.5686-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
fbinfo.flags has been allocated to zero by framebuffer_alloc(). So
do not set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jaya Kumar <jayalk@intworks.biz>
Cc: Helge Deller <deller@gmx.de>
Cc: Peter Jones <pjones@redhat.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Maik Broemme <mbroemme@libmpq.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Teddy Wang <teddy.wang@siliconmotion.com>
Cc: Michal Januszewski <spock@gentoo.org>
---
 drivers/video/fbdev/arcfb.c                    | 1 -
 drivers/video/fbdev/aty/aty128fb.c             | 1 -
 drivers/video/fbdev/broadsheetfb.c             | 2 +-
 drivers/video/fbdev/da8xx-fb.c                 | 1 -
 drivers/video/fbdev/efifb.c                    | 1 -
 drivers/video/fbdev/goldfishfb.c               | 1 -
 drivers/video/fbdev/gxt4500.c                  | 3 +--
 drivers/video/fbdev/hecubafb.c                 | 2 +-
 drivers/video/fbdev/imxfb.c                    | 3 +--
 drivers/video/fbdev/intelfb/intelfbdrv.c       | 1 -
 drivers/video/fbdev/metronomefb.c              | 2 +-
 drivers/video/fbdev/mx3fb.c                    | 1 -
 drivers/video/fbdev/omap/omapfb_main.c         | 1 -
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c | 1 -
 drivers/video/fbdev/s3c-fb.c                   | 1 -
 drivers/video/fbdev/sh_mobile_lcdcfb.c         | 2 --
 drivers/video/fbdev/sis/sis_main.c             | 2 --
 drivers/video/fbdev/sm501fb.c                  | 2 +-
 drivers/video/fbdev/sm712fb.c                  | 1 -
 drivers/video/fbdev/uvesafb.c                  | 3 +--
 drivers/video/fbdev/vesafb.c                   | 2 +-
 drivers/video/fbdev/vfb.c                      | 1 -
 drivers/video/fbdev/vga16fb.c                  | 2 +-
 drivers/video/fbdev/xen-fbfront.c              | 2 +-
 24 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 9aaea3be8281..cff11cb04a55 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -546,7 +546,6 @@ static int arcfb_probe(struct platform_device *dev)
 	par->c2io_addr = c2io_addr;
 	par->cslut[0] = 0x00;
 	par->cslut[1] = 0x06;
-	info->flags = FBINFO_FLAG_DEFAULT;
 	spin_lock_init(&par->lock);
 	if (irq) {
 		par->irq = irq;
diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index 2d9320a52e51..b44fc78ccd4f 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -1927,7 +1927,6 @@ static int aty128_init(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	/* fill in info */
 	info->fbops = &aty128fb_ops;
-	info->flags = FBINFO_FLAG_DEFAULT;
 
 	par->lcd_on = default_lcd_on;
 	par->crt_on = default_crt_on;
diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index cb725a91b6bb..e51e14c29c55 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -1069,7 +1069,7 @@ static int broadsheetfb_probe(struct platform_device *dev)
 
 	mutex_init(&par->io_lock);
 
-	info->flags = FBINFO_FLAG_DEFAULT | FBINFO_VIRTFB;
+	info->flags = FBINFO_VIRTFB;
 
 	info->fbdefio = &broadsheetfb_defio;
 	fb_deferred_io_init(info);
diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index 60cd1286370f..988dedcf6be8 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1463,7 +1463,6 @@ static int fb_probe(struct platform_device *device)
 	da8xx_fb_var.bits_per_pixel = lcd_cfg->bpp;
 
 	/* Initialize fbinfo */
-	da8xx_fb_info->flags = FBINFO_FLAG_DEFAULT;
 	da8xx_fb_info->fix = da8xx_fb_fix;
 	da8xx_fb_info->var = da8xx_fb_var;
 	da8xx_fb_info->fbops = &da8xx_fb_ops;
diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 3d7be69ab593..3391c8e84210 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -555,7 +555,6 @@ static int efifb_probe(struct platform_device *dev)
 	info->fbops = &efifb_ops;
 	info->var = efifb_defined;
 	info->fix = efifb_fix;
-	info->flags = FBINFO_FLAG_DEFAULT;
 
 	orientation = drm_get_panel_orientation_quirk(efifb_defined.xres,
 						      efifb_defined.yres);
diff --git a/drivers/video/fbdev/goldfishfb.c b/drivers/video/fbdev/goldfishfb.c
index 6fa2108fd912..ef2528c3faa9 100644
--- a/drivers/video/fbdev/goldfishfb.c
+++ b/drivers/video/fbdev/goldfishfb.c
@@ -212,7 +212,6 @@ static int goldfish_fb_probe(struct platform_device *pdev)
 	height = readl(fb->reg_base + FB_GET_HEIGHT);
 
 	fb->fb.fbops		= &goldfish_fb_ops;
-	fb->fb.flags		= FBINFO_FLAG_DEFAULT;
 	fb->fb.pseudo_palette	= fb->cmap;
 	fb->fb.fix.type		= FB_TYPE_PACKED_PIXELS;
 	fb->fb.fix.visual = FB_VISUAL_TRUECOLOR;
diff --git a/drivers/video/fbdev/gxt4500.c b/drivers/video/fbdev/gxt4500.c
index 5f42d3d9d6ce..8d0976578ddf 100644
--- a/drivers/video/fbdev/gxt4500.c
+++ b/drivers/video/fbdev/gxt4500.c
@@ -690,8 +690,7 @@ static int gxt4500_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 #endif
 
 	info->fbops = &gxt4500_ops;
-	info->flags = FBINFO_FLAG_DEFAULT | FBINFO_HWACCEL_XPAN |
-					    FBINFO_HWACCEL_YPAN;
+	info->flags = FBINFO_HWACCEL_XPAN | FBINFO_HWACCEL_YPAN;
 
 	err = fb_alloc_cmap(&info->cmap, 256, 0);
 	if (err) {
diff --git a/drivers/video/fbdev/hecubafb.c b/drivers/video/fbdev/hecubafb.c
index 5043d08ade54..c4938554ea45 100644
--- a/drivers/video/fbdev/hecubafb.c
+++ b/drivers/video/fbdev/hecubafb.c
@@ -189,7 +189,7 @@ static int hecubafb_probe(struct platform_device *dev)
 	par->send_command = apollo_send_command;
 	par->send_data = apollo_send_data;
 
-	info->flags = FBINFO_FLAG_DEFAULT | FBINFO_VIRTFB;
+	info->flags = FBINFO_VIRTFB;
 
 	info->fbdefio = &hecubafb_defio;
 	fb_deferred_io_init(info);
diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index adf36690c342..5b1ddce1f9d3 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -698,8 +698,7 @@ static int imxfb_init_fbinfo(struct platform_device *pdev)
 	info->var.vmode			= FB_VMODE_NONINTERLACED;
 
 	info->fbops			= &imxfb_ops;
-	info->flags			= FBINFO_FLAG_DEFAULT |
-					  FBINFO_READS_FAST;
+	info->flags			= FBINFO_READS_FAST;
 
 	np = pdev->dev.of_node;
 	info->var.grayscale = of_property_read_bool(np,
diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index 85a6341b8ac0..3d334f171959 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -1098,7 +1098,6 @@ static int intelfb_set_fbinfo(struct intelfb_info *dinfo)
 
 	DBG_MSG("intelfb_set_fbinfo\n");
 
-	info->flags = FBINFO_FLAG_DEFAULT;
 	info->fbops = &intel_fb_ops;
 	info->pseudo_palette = dinfo->pseudo_palette;
 
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index 667bef10738c..857e56fbb56f 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -642,7 +642,7 @@ static int metronomefb_probe(struct platform_device *dev)
 	if (retval < 0)
 		goto err_free_irq;
 
-	info->flags = FBINFO_FLAG_DEFAULT | FBINFO_VIRTFB;
+	info->flags = FBINFO_VIRTFB;
 
 	info->fbdefio = &metronomefb_defio;
 	fb_deferred_io_init(info);
diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index 63c186e0364a..3a053005d2b9 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -1406,7 +1406,6 @@ static struct fb_info *mx3fb_init_fbinfo(struct device *dev,
 	fbi->var.activate	= FB_ACTIVATE_NOW;
 
 	fbi->fbops		= ops;
-	fbi->flags		= FBINFO_FLAG_DEFAULT;
 	fbi->pseudo_palette	= mx3fbi->pseudo_palette;
 
 	mutex_init(&mx3fbi->mutex);
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index ad65554b33c3..783bbe026207 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1451,7 +1451,6 @@ static int fbinfo_init(struct omapfb_device *fbdev, struct fb_info *info)
 	int				r = 0;
 
 	info->fbops = &omapfb_ops;
-	info->flags = FBINFO_FLAG_DEFAULT;
 
 	strscpy(fix->id, MODULE_NAME, sizeof(fix->id));
 
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
index c0538069eb48..b5acad8eb279 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
@@ -1732,7 +1732,6 @@ static int omapfb_fb_init(struct omapfb2_device *fbdev, struct fb_info *fbi)
 	int r = 0;
 
 	fbi->fbops = &omapfb_ops;
-	fbi->flags = FBINFO_FLAG_DEFAULT;
 	fbi->pseudo_palette = fbdev->pseudo_palette;
 
 	if (ofbi->region->size == 0) {
diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index 1ce707e4cfd0..c50b92c06c5d 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -1244,7 +1244,6 @@ static int s3c_fb_probe_win(struct s3c_fb *sfb, unsigned int win_no,
 	fbinfo->var.vmode	= FB_VMODE_NONINTERLACED;
 	fbinfo->var.bits_per_pixel = windata->default_bpp;
 	fbinfo->fbops		= &s3c_fb_ops;
-	fbinfo->flags		= FBINFO_FLAG_DEFAULT;
 	fbinfo->pseudo_palette  = &win->pseudo_palette;
 
 	/* prepare to actually start the framebuffer */
diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 093f035d1246..8f9bbbe77d8c 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1565,7 +1565,6 @@ sh_mobile_lcdc_overlay_fb_init(struct sh_mobile_lcdc_overlay *ovl)
 
 	ovl->info = info;
 
-	info->flags = FBINFO_FLAG_DEFAULT;
 	info->fbops = &sh_mobile_lcdc_overlay_ops;
 	info->device = priv->dev;
 	info->screen_buffer = ovl->fb_mem;
@@ -2052,7 +2051,6 @@ sh_mobile_lcdc_channel_fb_init(struct sh_mobile_lcdc_chan *ch,
 
 	ch->info = info;
 
-	info->flags = FBINFO_FLAG_DEFAULT;
 	info->fbops = &sh_mobile_lcdc_ops;
 	info->device = priv->dev;
 	info->screen_buffer = ch->fb_mem;
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 2beb3512a853..0f5374f6ef05 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -6477,8 +6477,6 @@ error_3:	vfree(ivideo->bios_abase);
 				     FBINFO_HWACCEL_COPYAREA 	|
 				     FBINFO_HWACCEL_FILLRECT 	|
 				     ((ivideo->accel) ? 0 : FBINFO_HWACCEL_DISABLED);
-#else
-		sis_fb_info->flags = FBINFO_FLAG_DEFAULT;
 #endif
 		sis_fb_info->var = ivideo->default_var;
 		sis_fb_info->fix = ivideo->sisfb_fix;
diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index 46951a095274..65c799ac5604 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -1731,7 +1731,7 @@ static int sm501fb_init_fb(struct fb_info *fb, enum sm501_controller head,
 		par->ops.fb_cursor = NULL;
 
 	fb->fbops = &par->ops;
-	fb->flags = FBINFO_FLAG_DEFAULT | FBINFO_READS_FAST |
+	fb->flags = FBINFO_READS_FAST |
 		FBINFO_HWACCEL_COPYAREA | FBINFO_HWACCEL_FILLRECT |
 		FBINFO_HWACCEL_XPAN | FBINFO_HWACCEL_YPAN;
 
diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index f929091da4e7..db129ed3b2f7 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -1528,7 +1528,6 @@ static int smtcfb_pci_probe(struct pci_dev *pdev,
 	sfb->fb = info;
 	sfb->chip_id = ent->device;
 	sfb->pdev = pdev;
-	info->flags = FBINFO_FLAG_DEFAULT;
 	info->fbops = &smtcfb_ops;
 	info->fix = smtcfb_fix;
 	info->var = smtcfb_var;
diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 78d85dae8ec8..df2574d4ff30 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1508,8 +1508,7 @@ static void uvesafb_init_info(struct fb_info *info, struct vbe_mode_ib *mode)
 		par->ypan = 0;
 	}
 
-	info->flags = FBINFO_FLAG_DEFAULT |
-			(par->ypan ? FBINFO_HWACCEL_YPAN : 0);
+	info->flags = (par->ypan ? FBINFO_HWACCEL_YPAN : 0);
 
 	if (!par->ypan)
 		uvesafb_ops.fb_pan_display = NULL;
diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index 7451c607dc50..422a1c53decd 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -457,7 +457,7 @@ static int vesafb_probe(struct platform_device *dev)
 	info->fbops = &vesafb_ops;
 	info->var = vesafb_defined;
 	info->fix = vesafb_fix;
-	info->flags = FBINFO_FLAG_DEFAULT | (ypan ? FBINFO_HWACCEL_YPAN : 0);
+	info->flags = (ypan ? FBINFO_HWACCEL_YPAN : 0);
 
 	if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
 		err = -ENOMEM;
diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
index cf3c72754ce7..1b7c338f9956 100644
--- a/drivers/video/fbdev/vfb.c
+++ b/drivers/video/fbdev/vfb.c
@@ -455,7 +455,6 @@ static int vfb_probe(struct platform_device *dev)
 	info->fix = vfb_fix;
 	info->pseudo_palette = info->par;
 	info->par = NULL;
-	info->flags = FBINFO_FLAG_DEFAULT;
 
 	retval = fb_alloc_cmap(&info->cmap, 256, 0);
 	if (retval < 0)
diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index 34d00347ad58..b43c874c199f 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1359,7 +1359,7 @@ static int vga16fb_probe(struct platform_device *dev)
 	info->fix = vga16fb_fix;
 	/* supports rectangles with widths of multiples of 8 */
 	info->pixmap.blit_x = 1 << 7 | 1 << 15 | 1 << 23 | 1 << 31;
-	info->flags = FBINFO_FLAG_DEFAULT | FBINFO_HWACCEL_YPAN;
+	info->flags = FBINFO_HWACCEL_YPAN;
 
 	i = (info->var.bits_per_pixel == 8) ? 256 : 16;
 	ret = fb_alloc_cmap(&info->cmap, i, 0);
diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 6664dc7a5a41..9a4c29cb1a80 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -432,7 +432,7 @@ static int xenfb_probe(struct xenbus_device *dev,
 	fb_info->fix.type = FB_TYPE_PACKED_PIXELS;
 	fb_info->fix.accel = FB_ACCEL_NONE;
 
-	fb_info->flags = FBINFO_FLAG_DEFAULT | FBINFO_VIRTFB;
+	fb_info->flags = FBINFO_VIRTFB;
 
 	ret = fb_alloc_cmap(&fb_info->cmap, 256, 0);
 	if (ret < 0) {
-- 
2.41.0

