Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C0374504A
	for <lists+linux-fbdev@lfdr.de>; Sun,  2 Jul 2023 21:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjGBTQm (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 2 Jul 2023 15:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbjGBTQg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sun, 2 Jul 2023 15:16:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3DA134
        for <linux-fbdev@vger.kernel.org>; Sun,  2 Jul 2023 12:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688325350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O+OpQ8FhWL4vINUgdpBq2jtly/gGBeEwyQXrGSBuzmI=;
        b=J3eYqcEo+SEaOeGRDJhyM98ODRgZew8AC5SOMYgHTXHh1Pl0X4xUvyOFmwdHPq0Fcv3C7I
        z0XNrz8ClprTla9eI7h0jG8nKQX51jmUwkPTe2lab5r6UYS3RgBJVbIdYA+A4D0ItdIx/V
        FqTdlDZ36SuGgIdYMXWX2N7eWI/Jg1Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-ptTGL9FEMk-Fp5i3lLeUTQ-1; Sun, 02 Jul 2023 15:15:49 -0400
X-MC-Unique: ptTGL9FEMk-Fp5i3lLeUTQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fbb34f7224so22155885e9.2
        for <linux-fbdev@vger.kernel.org>; Sun, 02 Jul 2023 12:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688325348; x=1690917348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+OpQ8FhWL4vINUgdpBq2jtly/gGBeEwyQXrGSBuzmI=;
        b=MQxu7FBrPo8uyjYUZKlrEEUGiTeE8bfYfazxEADW1+aBKJfBBDK/vSNdHVzJjo7Ww7
         d56kZB7uEMYIJrVvu/F33BEFe7p5z44wWTeMluCTaCjTN1ZYWBvQNz0YW4XnWJuVns7b
         6w/cTus6aTu11Kv9L1HsecBpwLm9XZ72LOr7MY027CEccnIjKgEqJ64AC0s19E7ay7yb
         956aI1JYI+/C+rSI4830fEMP/1t19GvRc0I32yjQGGkwgUPsvClKYJfjYFG9+juRUH/K
         yfPa4OLhUJVdl5rAHPzUfkOcRsdOrLY5kaWmoMH01WN3VU/fXBhSChFLEBL4zpEj1/Ft
         SNNw==
X-Gm-Message-State: AC+VfDw7WK2D7+pOruf9VhErvcWifpxb/mIVnERkDnd/3pPU/sN+p+i0
        5OTtUGYAiPNkmHTaqTS/h9x9HBsY8wo68EYx+4llmRAn1XRynPMcGmAYvHDBjt21QFoSAHt6u/u
        S6Q7ZIAn9dLymAyPRDL4ug/w=
X-Received: by 2002:a1c:ed19:0:b0:3fb:407e:9b30 with SMTP id l25-20020a1ced19000000b003fb407e9b30mr6973007wmh.13.1688325347774;
        Sun, 02 Jul 2023 12:15:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6TEDx7mZMSKS0zMb7cTutew+fp0z6fzjfQL6TR1HiUxmFFKyKRmLqu7ujS36y1E7Z5uUniDA==
X-Received: by 2002:a1c:ed19:0:b0:3fb:407e:9b30 with SMTP id l25-20020a1ced19000000b003fb407e9b30mr6972988wmh.13.1688325347442;
        Sun, 02 Jul 2023 12:15:47 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id g11-20020a7bc4cb000000b003fbab76165asm14144231wmk.48.2023.07.02.12.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 12:15:47 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Borislav Petkov <bp@alien8.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
        Ingo Molnar <mingo@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        x86@kernel.org
Subject: [PATCH v3 2/3] fbdev: Split frame buffer support in FB and FB_CORE symbols
Date:   Sun,  2 Jul 2023 21:15:19 +0200
Message-ID: <20230702191529.768248-3-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230702191529.768248-1-javierm@redhat.com>
References: <20230702191529.768248-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Currently the CONFIG_FB option has to be enabled even if no legacy fbdev
drivers are needed (e.g: only to have support for framebuffer consoles).

The DRM subsystem has a fbdev emulation layer, but depends on CONFIG_FB
and so it can only be enabled if that dependency is enabled as well.

That means fbdev drivers have to be explicitly disabled if users want to
enable CONFIG_FB, only to use fbcon and/or the DRM fbdev emulation layer.

This patch introduces a non-visible CONFIG_FB_CORE symbol that could be
enabled just to have core support needed for CONFIG_DRM_FBDEV_EMULATION,
allowing CONFIG_FB to be disabled (and automatically disabling all the
fbdev drivers).

Nothing from fb_backlight.o and fbmon.o is used by the DRM fbdev emulation
layer so these two objects can be compiled out when CONFIG_FB is disabled.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v3:
- Really make a hidden symbol by removing the prompt (Arnd Bergmann).
- Change FB_CORE to config instead of menuconfig (Arnd Bergmann).
- Keep "depends on FB" for FIRMWARE_EDID (Arnd Bergmann).
- Compile out fb_backlight.o and fbmon.o that are only needed for FB
  (Arnd Bergmann).
- Make FB_DEVICE to depend on FB_CORE instead of selecting it.

Changes in v2:
- Keep "depends on FB" for FB_DDC, FB_HECUBA, FB_SVGALIB, FB_MACMODES,
  FB_BACKLIGHT, FB_MODE_HELPERS and FB_TILEBLITTING (Arnd Bergmann).
- Don't change the fb.o object name (Arnd Bergmann).
- Make FB_CORE a non-visible Kconfig symbol instead (Thomas Zimmermann).

 arch/x86/Makefile                 |  2 +-
 arch/x86/video/Makefile           |  2 +-
 drivers/video/console/Kconfig     |  2 +-
 drivers/video/fbdev/Kconfig       | 40 +++++++++++++++++++------------
 drivers/video/fbdev/core/Makefile |  8 +++----
 5 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index b39975977c03..89a02e69be5f 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -259,7 +259,7 @@ drivers-$(CONFIG_PCI)            += arch/x86/pci/
 # suspend and hibernation support
 drivers-$(CONFIG_PM) += arch/x86/power/
 
-drivers-$(CONFIG_FB) += arch/x86/video/
+drivers-$(CONFIG_FB_CORE) += arch/x86/video/
 
 ####
 # boot loader support. Several targets are kept for legacy purposes
diff --git a/arch/x86/video/Makefile b/arch/x86/video/Makefile
index 11640c116115..5ebe48752ffc 100644
--- a/arch/x86/video/Makefile
+++ b/arch/x86/video/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_FB)               += fbdev.o
+obj-$(CONFIG_FB_CORE)		+= fbdev.o
diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index a2a88d42edf0..1b5a319971ed 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -72,7 +72,7 @@ config DUMMY_CONSOLE_ROWS
 
 config FRAMEBUFFER_CONSOLE
 	bool "Framebuffer Console support"
-	depends on FB && !UML
+	depends on FB_CORE && !UML
 	select VT_HW_CONSOLE_BINDING
 	select CRC32
 	select FONT_SUPPORT
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index cecf15418632..d436a4fd6f0a 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -6,10 +6,14 @@
 config FB_NOTIFY
 	bool
 
+config FB_CORE
+	select VIDEO_CMDLINE
+	tristate
+
 menuconfig FB
-	tristate "Support for frame buffer devices"
+	tristate "Support for frame buffer device drivers"
+	select FB_CORE
 	select FB_NOTIFY
-	select VIDEO_CMDLINE
 	help
 	  The frame buffer device provides an abstraction for the graphics
 	  hardware. It represents the frame buffer of some video hardware and
@@ -33,6 +37,12 @@ menuconfig FB
 	  <http://www.munted.org.uk/programming/Framebuffer-HOWTO-1.3.html> for more
 	  information.
 
+	  This enables support for native frame buffer device (fbdev) drivers.
+
+	  The DRM subsystem provides support for emulated frame buffer devices
+	  on top of KMS drivers, but this option allows legacy fbdev drivers to
+	  be enabled as well.
+
 	  Say Y here and to the driver for your graphics board below if you
 	  are compiling a kernel for a non-x86 architecture.
 
@@ -59,7 +69,7 @@ config FIRMWARE_EDID
 
 config FB_DEVICE
 	bool "Provide legacy /dev/fb* device"
-	depends on FB
+	depends on FB_CORE
 	default y
 	help
 	  Say Y here if you want the legacy /dev/fb* device file and
@@ -75,7 +85,7 @@ config FB_DDC
 
 config FB_CFB_FILLRECT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the cfb_fillrect function for generic software rectangle
 	  filling. This is used by drivers that don't provide their own
@@ -83,7 +93,7 @@ config FB_CFB_FILLRECT
 
 config FB_CFB_COPYAREA
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the cfb_copyarea function for generic software area copying.
 	  This is used by drivers that don't provide their own (accelerated)
@@ -91,7 +101,7 @@ config FB_CFB_COPYAREA
 
 config FB_CFB_IMAGEBLIT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the cfb_imageblit function for generic software image
 	  blitting. This is used by drivers that don't provide their own
@@ -99,7 +109,7 @@ config FB_CFB_IMAGEBLIT
 
 config FB_CFB_REV_PIXELS_IN_BYTE
 	bool
-	depends on FB
+	depends on FB_CORE
 	help
 	  Allow generic frame-buffer functions to work on displays with 1, 2
 	  and 4 bits per pixel depths which has opposite order of pixels in
@@ -107,7 +117,7 @@ config FB_CFB_REV_PIXELS_IN_BYTE
 
 config FB_SYS_FILLRECT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the sys_fillrect function for generic software rectangle
 	  filling. This is used by drivers that don't provide their own
@@ -115,7 +125,7 @@ config FB_SYS_FILLRECT
 
 config FB_SYS_COPYAREA
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the sys_copyarea function for generic software area copying.
 	  This is used by drivers that don't provide their own (accelerated)
@@ -123,7 +133,7 @@ config FB_SYS_COPYAREA
 
 config FB_SYS_IMAGEBLIT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the sys_imageblit function for generic software image
 	  blitting. This is used by drivers that don't provide their own
@@ -162,22 +172,22 @@ endchoice
 
 config FB_SYS_FOPS
 	tristate
-	depends on FB
+	depends on FB_CORE
 
 config FB_DEFERRED_IO
 	bool
-	depends on FB
+	depends on FB_CORE
 
 config FB_IO_HELPERS
 	bool
-	depends on FB
+	depends on FB_CORE
 	select FB_CFB_COPYAREA
 	select FB_CFB_FILLRECT
 	select FB_CFB_IMAGEBLIT
 
 config FB_SYS_HELPERS
 	bool
-	depends on FB
+	depends on FB_CORE
 	select FB_SYS_COPYAREA
 	select FB_SYS_FILLRECT
 	select FB_SYS_FOPS
@@ -185,7 +195,7 @@ config FB_SYS_HELPERS
 
 config FB_SYS_HELPERS_DEFERRED
 	bool
-	depends on FB
+	depends on FB_CORE
 	select FB_DEFERRED_IO
 	select FB_SYS_HELPERS
 
diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index 9150bafd9e89..2cd213716c12 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
-obj-$(CONFIG_FB)                  += fb.o
-fb-y                              := fb_backlight.o \
-                                     fb_info.o \
-                                     fbmem.o fbmon.o fbcmap.o \
+obj-$(CONFIG_FB_CORE)             += fb.o
+fb-y                              := fb_info.o \
+                                     fbmem.o fbcmap.o \
                                      modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
+fb-$(CONFIG_FB)                   += fb_backlight.o fbmon.o
 fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
 fb-$(CONFIG_FB_DEVICE)            += fb_chrdev.o \
                                      fb_procfs.o \
-- 
2.41.0

