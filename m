Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7444E1D2188
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 May 2020 23:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730047AbgEMV4Z (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 13 May 2020 17:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729487AbgEMV4Z (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 13 May 2020 17:56:25 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B27CC061A0E
        for <linux-fbdev@vger.kernel.org>; Wed, 13 May 2020 14:56:23 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id v12so1303832wrp.12
        for <linux-fbdev@vger.kernel.org>; Wed, 13 May 2020 14:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hwonKHzFuATNeAdoyzCvSTRBuE9NuTgicFg1W8wjFZg=;
        b=vHMbGgI7Rodl3kyPSAXHxWobKHo1GYSJ4oa2Z3FZcTd8iL1WF+wNrqZcu2RhW6OW2p
         jlPqiypDyN9iMTgTznUUpON9fpnWagb18lPHwXU2RlRWDbdNpCdrObQXBlybQNOp6iYl
         zkKYmHhlN3UPtxPXZZxUMULABWT0PL0ZX19LWaS+r8CYoow4yCUVQKb94UCT/efyiu6v
         ken+Xh4UOxhO7XbvSEB/SIoZKCHJeRO0g0zKqIlVJHCtYgJ+QlkLjLaeo8eN7VtiYCKo
         +v4ekNfkJmNj5r/Ud+YfrNYEePcEkka+3NsDGnMsF4kjf/4CS+9QdEjw5b4o5PoyjlDs
         OTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hwonKHzFuATNeAdoyzCvSTRBuE9NuTgicFg1W8wjFZg=;
        b=puPRDkxxDOL9OcAcXH3+kQ7r2VG/JRD8U8qBgI29a6G1M1RpacnGJIQzrcvTaUfuff
         Ih9ZMsUiusfReshT79I7JUpi2QTXVC9aTy8egdm6JwfTxWduBkvA/2PapewHJWHLbv/K
         1P2GE77skftEfiznBACj5/W5ZFkHE6GgrT4pvEYoNZl2tYpLWNP0Ya+hBoYDMxU94+JD
         tLEGH5gOvtRSx+jp0Ut0qLaF2Uz+caFFcntBErqUa7ZwuTsJ6JET/t5QNBa3s69O0NdI
         TZRdC+lnfQlpaWPNA/v6ROJNoa9NoI91Ii6S7iCF6MA4goivFOB9QYN6PubccQlQIqBr
         NZXA==
X-Gm-Message-State: AOAM532SkxykzyP/veYNeRBtELf9J+DVBIcpO/33AeluAidMik7/nc6F
        iFsS7oUFTd2wMa6XL5RteoM=
X-Google-Smtp-Source: ABdhPJwZab0RhfCQOqf/Ht72DHQCZ1jIssnq1PG+HQQCEjv/FfAMFsFPDkcvD1ObXYb4L1Cdf4yA7g==
X-Received: by 2002:a5d:4b09:: with SMTP id v9mr1548869wrq.297.1589406982352;
        Wed, 13 May 2020 14:56:22 -0700 (PDT)
Received: from localhost.localdomain (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
        by smtp.gmail.com with ESMTPSA id h133sm192371wmf.25.2020.05.13.14.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 14:56:21 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     emil.l.velikov@gmail.com, Antonino Daplas <adaplas@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org
Subject: [PATCH] fbdev: annotate rivafb/nvidiafb as obsolete
Date:   Wed, 13 May 2020 22:53:42 +0100
Message-Id: <20200513215342.2145495-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Drivers have not seen any love for years.

Be that fixes or improvements, or cosmetics like introducing symbolic
names, style and code-flow polish.

Seemingly the maintainer has also disappeared years ago :-\

Considering nouveau supports all that hardware (modulo nv03) just mark
these as obsolete/broken, referring to nouveau in the help text.

Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 MAINTAINERS                           | 3 +--
 arch/powerpc/configs/g5_defconfig     | 2 --
 arch/powerpc/configs/pasemi_defconfig | 2 --
 arch/powerpc/configs/pmac32_defconfig | 2 --
 arch/powerpc/configs/ppc6xx_defconfig | 3 ---
 drivers/video/fbdev/Kconfig           | 6 ++++++
 6 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 515a81fdb7d6..cc9da9a1e230 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11247,9 +11247,8 @@ F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
-M:	Antonino Daplas <adaplas@gmail.com>
 L:	linux-fbdev@vger.kernel.org
-S:	Maintained
+S:	Obsolete
 F:	drivers/video/fbdev/riva/
 F:	drivers/video/fbdev/nvidia/
 
diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index ceb3c770786f..24225e39662a 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -130,8 +130,6 @@ CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_OF=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_RADEON=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/powerpc/configs/pasemi_defconfig b/arch/powerpc/configs/pasemi_defconfig
index c0423b2cf7c0..36b242efae9a 100644
--- a/arch/powerpc/configs/pasemi_defconfig
+++ b/arch/powerpc/configs/pasemi_defconfig
@@ -107,8 +107,6 @@ CONFIG_DRM_RADEON=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_VGA16=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_RADEON=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_VGACON_SOFT_SCROLLBACK=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 50b610b48914..ef4470d44763 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -211,8 +211,6 @@ CONFIG_FB_PLATINUM=y
 CONFIG_FB_VALKYRIE=y
 CONFIG_FB_CT65550=y
 CONFIG_FB_IMSTT=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_MILLENIUM=y
 CONFIG_FB_MATROX_MYSTIQUE=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 7c6baf6df139..5b4e26de0bcf 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -752,9 +752,6 @@ CONFIG_FB_OF=y
 CONFIG_FB_PLATINUM=y
 CONFIG_FB_VALKYRIE=y
 CONFIG_FB_CT65550=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
-CONFIG_FB_RIVA=m
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_MILLENIUM=y
 CONFIG_FB_MATROX_MYSTIQUE=y
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 1b2f5f31fb6f..cad3e4bc5e52 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -868,6 +868,7 @@ config FB_ATMEL
 
 config FB_NVIDIA
 	tristate "nVidia Framebuffer Support"
+	depends on BROKEN
 	depends on FB && PCI
 	select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
 	select FB_MODE_HELPERS
@@ -877,6 +878,8 @@ config FB_NVIDIA
 	select BITREVERSE
 	select VGASTATE
 	help
+	  Obsolete, use nouveau instead.
+
 	  This driver supports graphics boards with the nVidia chips, TNT
 	  and newer. For very old chipsets, such as the RIVA128, then use
 	  the rivafb.
@@ -915,6 +918,7 @@ config FB_NVIDIA_BACKLIGHT
 
 config FB_RIVA
 	tristate "nVidia Riva support"
+	depends on BROKEN
 	depends on FB && PCI
 	select FB_BACKLIGHT if FB_RIVA_BACKLIGHT
 	select FB_MODE_HELPERS
@@ -924,6 +928,8 @@ config FB_RIVA
 	select BITREVERSE
 	select VGASTATE
 	help
+	  Obsolete, use nouveau instead.
+
 	  This driver supports graphics boards with the nVidia Riva/Geforce
 	  chips.
 	  Say Y if you have such a graphics board.
-- 
2.25.1

