Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57F53F97CE
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Aug 2021 12:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244741AbhH0KGc (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 27 Aug 2021 06:06:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45074 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244653AbhH0KGa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 27 Aug 2021 06:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630058741;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=EXPxGlvkpHmnHEK7OKsOddraGW7pm1nQZapyJTQunr0=;
        b=IHC2UbjC99thvUImE6M42oE49ieC25+PXlpC3YX+sWZze1WpxQCpkm5SFw2yyNg6ZE/iRf
        SWtulqG8fQXssC4XK5G0Z55oKbYzT90uX02JtSwhXiWK2Dne/aVCEaMorbWpfpXRAtlJ3A
        vN4AK+tDtinfBg/XcgHIfDLjO7S8WjI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-B3-rfjkfO_emi_G7gLil3g-1; Fri, 27 Aug 2021 06:05:40 -0400
X-MC-Unique: B3-rfjkfO_emi_G7gLil3g-1
Received: by mail-wr1-f71.google.com with SMTP id a9-20020a0560000509b029015485b95d0cso1710305wrf.5
        for <linux-fbdev@vger.kernel.org>; Fri, 27 Aug 2021 03:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EXPxGlvkpHmnHEK7OKsOddraGW7pm1nQZapyJTQunr0=;
        b=MvdtXXWodwCfSM3wHqqIoeS1m95MQgj6+SOY4MNKLtcFHFyphBfCztVSYie3kc8+Yb
         Mm2HxeZ5jC3DVF9QGZQKB3Td0/zHZBMNMTUtmXkNbiD/6nK+nAfSnEg4tg9lERY8NlY1
         peYRVts2555um6POQW18SJCYVRf2yz2GDZO+35PybScK0aXnRDHFcvytTd1nJpmBJYT5
         apyv5+5QG35ozGHhLWxQwA0Ce68UDBY7GcuDiNehV+SgS6PINre2Do7o/5dqme5dOHoO
         IbhMcLSFgIa8OQ4YBCz9sn4y+N306iY+jJyOOWKYEd2mDKER0EUg+SlxtjS+dQT270tg
         6T0Q==
X-Gm-Message-State: AOAM533E3uo+iAYSze+rBpWAonukOsbq3B0ODPLKDqLnGYswVzct14tZ
        xUGZMd1tEznDUEBcdUM+s0xJDx79CMdNrFH4J5rOl0kdTw2kpV+7KVPIB5TpLUJOAUaqBY9syDg
        ehkjcegCQ3nTvPRYEVyb0BPY=
X-Received: by 2002:a5d:4309:: with SMTP id h9mr9106849wrq.299.1630058737166;
        Fri, 27 Aug 2021 03:05:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6JdgxUEqVQvWbLK8LE9lw2ijxb9tPU/9Zb2lUFyehWm5LdPhMOjL+HnOK1KX40fmwm9S6tw==
X-Received: by 2002:a5d:4309:: with SMTP id h9mr9106825wrq.299.1630058736889;
        Fri, 27 Aug 2021 03:05:36 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
        by smtp.gmail.com with ESMTPSA id p5sm6658888wrd.25.2021.08.27.03.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 03:05:36 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>,
        Peter Robinson <pbrobinson@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>, x86@kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: [RFC PATCH 3/4] fbdev: Split frame buffer support in FB and FB_CORE symbols
Date:   Fri, 27 Aug 2021 12:05:31 +0200
Message-Id: <20210827100531.1578604-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Currently the CONFIG_FB option has to be enabled even if no legacy fbdev
drivers are needed, in order to have support for a framebuffer console.

The DRM subsystem has a fbdev emulation layer, but depends on CONFIG_FB
and so it can only be enabled if that dependency is enabled as well.

That means fbdev drivers have to be explicitly disabled if users want to
enable CONFIG_FB, only to use fbcon with the DRM fbdev emulation layer.

This patch introduces a CONFIG_FB_CORE option that could be enabled just
to have the core support needed for CONFIG_DRM_FBDEV_EMULATION, allowing
CONFIG_FB to be disabled (and automatically disabling all fbdev drivers).

The fbsysfs.o object is left out of fb_core.o, because that's not needed
for KMS drivers and the DRM fbdev emulation layer.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 arch/x86/Makefile                 |  2 +-
 arch/x86/video/Makefile           |  2 +-
 drivers/video/console/Kconfig     |  2 +-
 drivers/video/fbdev/Kconfig       | 57 ++++++++++++++++++-------------
 drivers/video/fbdev/core/Makefile | 13 ++++---
 include/linux/fb.h                | 14 ++++++++
 6 files changed, 59 insertions(+), 31 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 44dd071d836..dc409539218 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -229,7 +229,7 @@ drivers-$(CONFIG_PCI)            += arch/x86/pci/
 # suspend and hibernation support
 drivers-$(CONFIG_PM) += arch/x86/power/
 
-drivers-$(CONFIG_FB) += arch/x86/video/
+drivers-$(CONFIG_FB_CORE) += arch/x86/video/
 
 ####
 # boot loader support. Several targets are kept for legacy purposes
diff --git a/arch/x86/video/Makefile b/arch/x86/video/Makefile
index 11640c11611..cb0735bd662 100644
--- a/arch/x86/video/Makefile
+++ b/arch/x86/video/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_FB)               += fbdev.o
+obj-$(CONFIG_FB_CORE)               += fbdev.o
diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 840d9813b0b..0c562ed3495 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -71,7 +71,7 @@ config DUMMY_CONSOLE_ROWS
 
 config FRAMEBUFFER_CONSOLE
 	bool "Framebuffer Console support"
-	depends on FB && !UML
+	depends on FB_CORE && !UML
 	select VT_HW_CONSOLE_BINDING
 	select CRC32
 	select FONT_SUPPORT
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index d33c5cd684c..cb9e8b503a5 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -9,10 +9,8 @@ config FB_CMDLINE
 config FB_NOTIFY
 	bool
 
-menuconfig FB
-	tristate "Support for frame buffer devices"
-	select FB_CMDLINE
-	select FB_NOTIFY
+menuconfig FB_CORE
+	tristate "Core support for frame buffer devices"
 	help
 	  The frame buffer device provides an abstraction for the graphics
 	  hardware. It represents the frame buffer of some video hardware and
@@ -36,6 +34,19 @@ menuconfig FB
 	  <http://www.munted.org.uk/programming/Framebuffer-HOWTO-1.3.html> for more
 	  information.
 
+	  This options enables the core support for frame buffer devices.
+
+menuconfig FB
+	tristate "Support for frame buffer device drivers"
+	depends on FB_CORE
+	select FB_CMDLINE
+	select FB_NOTIFY
+	help
+	  This enables support for frame buffer devices (fbdev) drivers.
+
+	  The DRM subsystem provides an option to emulate fbdev devices but
+	  this option allows legacy fbdev drivers to be enabled as well.
+
 	  Say Y here and to the driver for your graphics board below if you
 	  are compiling a kernel for a non-x86 architecture.
 
@@ -47,7 +58,7 @@ menuconfig FB
 
 config FIRMWARE_EDID
 	bool "Enable firmware EDID"
-	depends on FB
+	depends on FB_CORE
 	help
 	  This enables access to the EDID transferred from the firmware.
 	  On the i386, this is from the Video BIOS. Enable this if DDC/I2C
@@ -62,7 +73,7 @@ config FIRMWARE_EDID
 
 config FB_DDC
 	tristate
-	depends on FB
+	depends on FB_CORE
 	select I2C_ALGOBIT
 	select I2C
 
@@ -75,7 +86,7 @@ config FB_BOOT_VESA_SUPPORT
 
 config FB_CFB_FILLRECT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the cfb_fillrect function for generic software rectangle
 	  filling. This is used by drivers that don't provide their own
@@ -83,7 +94,7 @@ config FB_CFB_FILLRECT
 
 config FB_CFB_COPYAREA
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the cfb_copyarea function for generic software area copying.
 	  This is used by drivers that don't provide their own (accelerated)
@@ -91,7 +102,7 @@ config FB_CFB_COPYAREA
 
 config FB_CFB_IMAGEBLIT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the cfb_imageblit function for generic software image
 	  blitting. This is used by drivers that don't provide their own
@@ -99,7 +110,7 @@ config FB_CFB_IMAGEBLIT
 
 config FB_CFB_REV_PIXELS_IN_BYTE
 	bool
-	depends on FB
+	depends on FB_CORE
 	help
 	  Allow generic frame-buffer functions to work on displays with 1, 2
 	  and 4 bits per pixel depths which has opposite order of pixels in
@@ -107,7 +118,7 @@ config FB_CFB_REV_PIXELS_IN_BYTE
 
 config FB_SYS_FILLRECT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the sys_fillrect function for generic software rectangle
 	  filling. This is used by drivers that don't provide their own
@@ -115,7 +126,7 @@ config FB_SYS_FILLRECT
 
 config FB_SYS_COPYAREA
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the sys_copyarea function for generic software area copying.
 	  This is used by drivers that don't provide their own (accelerated)
@@ -123,7 +134,7 @@ config FB_SYS_COPYAREA
 
 config FB_SYS_IMAGEBLIT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the sys_imageblit function for generic software image
 	  blitting. This is used by drivers that don't provide their own
@@ -131,14 +142,14 @@ config FB_SYS_IMAGEBLIT
 
 config FB_PROVIDE_GET_FB_UNMAPPED_AREA
 	bool
-	depends on FB
+	depends on FB_CORE
 	help
 	  Allow generic frame-buffer to provide get_fb_unmapped_area
 	  function.
 
 menuconfig FB_FOREIGN_ENDIAN
 	bool "Framebuffer foreign endianness support"
-	depends on FB
+	depends on FB_CORE
 	help
 	  This menu will let you enable support for the framebuffers with
 	  non-native endianness (e.g. Little-Endian framebuffer on a
@@ -162,36 +173,36 @@ endchoice
 
 config FB_SYS_FOPS
 	tristate
-	depends on FB
+	depends on FB_CORE
 
 config FB_DEFERRED_IO
 	bool
-	depends on FB
+	depends on FB_CORE
 
 config FB_HECUBA
 	tristate
-	depends on FB
+	depends on FB_CORE
 	depends on FB_DEFERRED_IO
 
 config FB_SVGALIB
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Common utility functions useful to fbdev drivers of VGA-based
 	  cards.
 
 config FB_MACMODES
 	tristate
-	depends on FB
+	depends on FB_CORE
 
 config FB_BACKLIGHT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	select BACKLIGHT_CLASS_DEVICE
 
 config FB_MODE_HELPERS
 	bool "Enable Video Mode Handling Helpers"
-	depends on FB
+	depends on FB_CORE
 	help
 	  This enables functions for handling video modes using the
 	  Generalized Timing Formula and the EDID parser. A few drivers rely
@@ -201,7 +212,7 @@ config FB_MODE_HELPERS
 
 config FB_TILEBLITTING
 	bool "Enable Tile Blitting Support"
-	depends on FB
+	depends on FB_CORE
 	help
 	  This enables tile blitting.  Tile blitting is a drawing technique
 	  where the screen is divided into rectangular sections (tiles), whereas
diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index 26cbc965497..328a017c78b 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -1,22 +1,25 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_FB_CMDLINE)          += fb_cmdline.o
 obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
+obj-$(CONFIG_FB_CORE)             += fb_core.o
 obj-$(CONFIG_FB)                  += fb.o
-fb-y                              := fbmem.o fbmon.o fbcmap.o fbsysfs.o \
+fb_core-y                         := fbmem.o fbmon.o fbcmap.o \
                                      modedb.o fbcvt.o
-fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
+fb_core-$(CONFIG_FB_DEFERRED_IO)  += fb_defio.o
 
 ifeq ($(CONFIG_FRAMEBUFFER_CONSOLE),y)
-fb-y				  += fbcon.o bitblit.o softcursor.o
+fb_core-y			  += fbcon.o bitblit.o softcursor.o
 ifeq ($(CONFIG_FB_TILEBLITTING),y)
-fb-y				  += tileblit.o
+fb_core-y			  += tileblit.o
 endif
 ifeq ($(CONFIG_FRAMEBUFFER_CONSOLE_ROTATION),y)
-fb-y				  += fbcon_rotate.o fbcon_cw.o fbcon_ud.o \
+fb_core-y			  += fbcon_rotate.o fbcon_cw.o fbcon_ud.o \
 				     fbcon_ccw.o
 endif
 endif
 
+fb-y				  := fbsysfs.o
+
 obj-$(CONFIG_FB_CFB_FILLRECT)  += cfbfillrect.o
 obj-$(CONFIG_FB_CFB_COPYAREA)  += cfbcopyarea.o
 obj-$(CONFIG_FB_CFB_IMAGEBLIT) += cfbimgblt.o
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 96111248a25..f66eefbf1ee 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -689,9 +689,23 @@ static inline bool fb_be_math(struct fb_info *info)
 /* drivers/video/fbsysfs.c */
 extern struct fb_info *framebuffer_alloc(size_t size, struct device *dev);
 extern void framebuffer_release(struct fb_info *info);
+#if IS_ENABLED(CONFIG_FB)
 extern int fb_register_sysfs(struct fb_info *fb_info);
 extern void fb_unregister_sysfs(struct fb_info *head);
 extern void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max);
+#else
+static inline int fb_register_sysfs(struct fb_info *fb_info)
+{
+	return 0;
+}
+static inline void fb_unregister_sysfs(struct fb_info *head)
+{
+}
+static inline void fb_bl_default_curve(struct fb_info *fb_info, u8 off,
+				       u8 min, u8 max)
+{
+}
+#endif
 
 /* drivers/video/fbmon.c */
 #define FB_MAXTIMINGS		0
-- 
2.31.1

