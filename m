Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAF41D6DC1
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 May 2020 00:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgEQWIQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 17 May 2020 18:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgEQWIP (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 17 May 2020 18:08:15 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3B7C05BD09
        for <linux-fbdev@vger.kernel.org>; Sun, 17 May 2020 15:08:15 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e1so9610188wrt.5
        for <linux-fbdev@vger.kernel.org>; Sun, 17 May 2020 15:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vlQG2udc7GDr5JGXbF/q4vF+mhIn8QekfFy1X7bhtvY=;
        b=DHyJsjBBHryBZH7glNoiQGUO7uk4uXwkkHGzn8Cp6rxZHsbFV6vGvDfTQ53aaDGZ1K
         BkIGkLCUuk4pweI4DpTcgK2Nekp2Jq9HOswvUsft68N7L0r5jtEmBlOGMEj9eYFiXcwE
         XeFzHic8KOMsH+dxliASyngPvtqSJNN+JTNeqjBC+SYBVlZ+qNNuWtBCqyObScliTop8
         1UtCt2TsKtCsj/WFVaAGVhvIkuZw1UGmMl8FMm2n/niXQZG1nALiJacRLQ5caPoGIlrD
         lKA6LUxr9oHYV73oshAeez7/epvHrZ4pRTHY0mg0nkQvwAdo2IbzrHMGitB10DmOzbti
         mAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vlQG2udc7GDr5JGXbF/q4vF+mhIn8QekfFy1X7bhtvY=;
        b=rQiBvoI6DaDQBfCqGeZVXkylmtWAI7Qu3q1HItqT0bGNpteQEXJF/aCl2HHZNC3jaO
         mVqnMTNRLLuSDUka40ITB78c1zkq9sJK/FcHknJ3pREYSZW7uYDkCHICP/wr/LpaOd1W
         8ggaokEwCOmCA8KmoMhsn+0QIZvsK0Hu4bGUAaVyr5Ep0pnFTPyyuF0k+jiR/1H19ajS
         FitHilOEKliTjxzNin4pxOnq7YDgwe+7Dh2UaUYNG6C0HAll61ItSDVPePDQC7AKdxwH
         Y4+D9VNBlMQ85BKWdqY+9o4q7WSaBWE80SJEvTcXzvckZxsVSRFt5jEHvA/7MwEIoYfw
         byJA==
X-Gm-Message-State: AOAM533sJLIt5m4TsxZsjSyHIWmMFdCL8II2br8+MtaEXyn3ERLwQhvI
        bLtVDcWRoOvwGaiFEgNCjEQ=
X-Google-Smtp-Source: ABdhPJztZqF86REgFZUlLolQDOtb+TvD9sDFoqDx5vwO0wz5kqneUY3+1a0p10+sjgxN4zO6IVtQkg==
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr15611191wrn.335.1589753294182;
        Sun, 17 May 2020 15:08:14 -0700 (PDT)
Received: from localhost.localdomain (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
        by smtp.gmail.com with ESMTPSA id d9sm13805482wmd.10.2020.05.17.15.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 15:08:13 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     emil.l.velikov@gmail.com, Antonino Daplas <adaplas@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia with nouveau
Date:   Sun, 17 May 2020 23:05:24 +0100
Message-Id: <20200517220524.4036334-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

As mentioned in earlier commit, the riva and nvidia fbdev drivers have
seen no love over the years, are short on features and overall below par

Users are encouraged to switch to the nouveau drm driver instead.

v2: Split configs to separate patch, enable nouveau (Bartlomiej)

Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
---
Hi all unless, there are objections I would prefer to merge this via
the drm tree.

Thanks
Emil
---
 arch/powerpc/configs/g5_defconfig     | 10 ++++++++--
 arch/powerpc/configs/pasemi_defconfig |  9 +++++++--
 arch/powerpc/configs/pmac32_defconfig |  9 +++++++--
 arch/powerpc/configs/ppc6xx_defconfig | 10 +++++++---
 4 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index a68c7f3af10e..213472f373b3 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -124,12 +124,18 @@ CONFIG_RAW_DRIVER=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_AGP=m
 CONFIG_AGP_UNINORTH=m
+CONFIG_DRM=y
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
+# CONFIG_NOUVEAU_DEBUG_MMU is not set
+CONFIG_DRM_NOUVEAU_BACKLIGHT=y
+# CONFIG_DRM_NOUVEAU_SVM is not set
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_OF=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_RADEON=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/powerpc/configs/pasemi_defconfig b/arch/powerpc/configs/pasemi_defconfig
index 08b7f4cef243..ccb3ab5e01da 100644
--- a/arch/powerpc/configs/pasemi_defconfig
+++ b/arch/powerpc/configs/pasemi_defconfig
@@ -102,11 +102,16 @@ CONFIG_SENSORS_LM85=y
 CONFIG_SENSORS_LM90=y
 CONFIG_DRM=y
 CONFIG_DRM_RADEON=y
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
+# CONFIG_NOUVEAU_DEBUG_MMU is not set
+CONFIG_DRM_NOUVEAU_BACKLIGHT=y
+# CONFIG_DRM_NOUVEAU_SVM is not set
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_VGA16=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_RADEON=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_VGACON_SOFT_SCROLLBACK=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 05e325ca3fbd..f858627385c8 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -199,6 +199,13 @@ CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_LEGACY=y
 CONFIG_DRM_R128=m
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
+# CONFIG_NOUVEAU_DEBUG_MMU is not set
+CONFIG_DRM_NOUVEAU_BACKLIGHT=y
+# CONFIG_DRM_NOUVEAU_SVM is not set
 CONFIG_FB=y
 CONFIG_FB_OF=y
 CONFIG_FB_CONTROL=y
@@ -206,8 +213,6 @@ CONFIG_FB_PLATINUM=y
 CONFIG_FB_VALKYRIE=y
 CONFIG_FB_CT65550=y
 CONFIG_FB_IMSTT=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_MILLENIUM=y
 CONFIG_FB_MATROX_MYSTIQUE=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index feb5d47d8d1e..48421f5007ed 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -738,15 +738,19 @@ CONFIG_DRM_MGA=m
 CONFIG_DRM_SIS=m
 CONFIG_DRM_VIA=m
 CONFIG_DRM_SAVAGE=m
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
+# CONFIG_NOUVEAU_DEBUG_MMU is not set
+CONFIG_DRM_NOUVEAU_BACKLIGHT=y
+# CONFIG_DRM_NOUVEAU_SVM is not set
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=m
 CONFIG_FB_OF=y
 CONFIG_FB_PLATINUM=y
 CONFIG_FB_VALKYRIE=y
 CONFIG_FB_CT65550=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
-CONFIG_FB_RIVA=m
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_MILLENIUM=y
 CONFIG_FB_MATROX_MYSTIQUE=y
-- 
2.25.1

