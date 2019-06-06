Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D830370AF
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Jun 2019 11:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbfFFJrU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 6 Jun 2019 05:47:20 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33381 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728030AbfFFJrT (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 6 Jun 2019 05:47:19 -0400
Received: by mail-lj1-f196.google.com with SMTP id v29so1385927ljv.0
        for <linux-fbdev@vger.kernel.org>; Thu, 06 Jun 2019 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dQfbJoiQ5WTWGjUJ1PADkmMlX7UTg1NHq4Oh3Ljtrbo=;
        b=v0l1t7motrGGJZjUZw7mZhdXu71rcqkX14qgcfNJsj0pBDkflH+Yc72Rh58UO+K/ma
         NkcmwaO4ZRwUGSEf8FDCBIG9d5FZ14s3/Wu+e7uRpuc3N+NwdVmPkgZ3ASVth/T3MdYP
         zkyIoXbtLNxGxDWBwLZLLWP5BgK4Cj1MAjGGDwMPETEClXrqSkfGB+ui3a6x4JzT1JRI
         G7GVtXsWqf6Jrl0j4cKaP5Z91IJPDBMDrMDcVB3HTk4V95x6QgEjoib0TMkiQWzWtb0X
         Fwk6a3D+h0Vdr8Ji3cBC+l5ZJv9LqytaxcbMrFHRJKAG/dbb4ZLq/iU1m+2Kc78Nhxrd
         PHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dQfbJoiQ5WTWGjUJ1PADkmMlX7UTg1NHq4Oh3Ljtrbo=;
        b=MkC9b2Pux/SKdSbMlGdoh9PYUhccEUd3Orcyf2aj4xB7nW3pe+50HGqKmXEF5z2ggo
         Sukb8/FcFRjF1J97DZw9VLU3/07Eq9UUKnGfA3yF8fzy1m5RZRafqTQbsKlv0KHsDqyx
         5zJxTynXIPxqwvqCmyrSs5xhSChyvMqcqhGTOdQcR7hSyMNRwLHx6rQdg+95Cs8q8J7j
         En5hVm7jazjnst3lMxABWQIxesbwAMQsJ/5yK1K+2KJIOuphIhfvDM8/rhv907FdVOuO
         dnAjmthHApn1fHiUHG0/KRpiZLYk9WzC2CU5g36YAi6z6zoqSv9/D7DIe5trZaFx1M3f
         LVlg==
X-Gm-Message-State: APjAAAWN+1tfgQX93KFIxagJ4aXZQ0vxFbN4RW925K6gfQ2OJvFrlTMG
        3x4oOYj6f8i7MkaipK9NxgWshg==
X-Google-Smtp-Source: APXvYqynVELsYqcqQ3WkOuXVc21SB/kMXSnXwhm4rJjbGqpBW3X6B+fXTZsFIXnZIxLxYIvULF3Ugg==
X-Received: by 2002:a2e:9cc3:: with SMTP id g3mr9015135ljj.117.1559814437482;
        Thu, 06 Jun 2019 02:47:17 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se. [213.112.54.28])
        by smtp.gmail.com with ESMTPSA id s20sm214365lfb.95.2019.06.06.02.47.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 02:47:16 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     marex@denx.de, stefan@agner.ch, airlied@linux.ie, daniel@ffwll.ch,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        b.zolnierkie@samsung.com
Cc:     andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
        a.hajda@samsung.com, mchehab@kernel.org, p.zabel@pengutronix.de,
        hkallweit1@gmail.com, lee.jones@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, davem@davemloft.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-media@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 3/8] drivers: (video|gpu): fix warning same module names
Date:   Thu,  6 Jun 2019 11:47:12 +0200
Message-Id: <20190606094712.23715-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

When building with CONFIG_DRM_MXSFB and CONFIG_FB_MXS enabled as
loadable modules, we see the following warning:

warning: same module names found:
  drivers/video/fbdev/mxsfb.ko
  drivers/gpu/drm/mxsfb/mxsfb.ko

Rework so the names matches the config fragment.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/gpu/drm/mxsfb/Makefile | 4 ++--
 drivers/video/fbdev/Makefile   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Makefile b/drivers/gpu/drm/mxsfb/Makefile
index ff6e358088fa..5d49d7548e66 100644
--- a/drivers/gpu/drm/mxsfb/Makefile
+++ b/drivers/gpu/drm/mxsfb/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-mxsfb-y := mxsfb_drv.o mxsfb_crtc.o mxsfb_out.o
-obj-$(CONFIG_DRM_MXSFB)	+= mxsfb.o
+drm-mxsfb-y := mxsfb_drv.o mxsfb_crtc.o mxsfb_out.o
+obj-$(CONFIG_DRM_MXSFB)	+= drm-mxsfb.o
diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
index 655f2537cac1..7ee967525af2 100644
--- a/drivers/video/fbdev/Makefile
+++ b/drivers/video/fbdev/Makefile
@@ -131,7 +131,8 @@ obj-$(CONFIG_FB_VGA16)            += vga16fb.o
 obj-$(CONFIG_FB_OF)               += offb.o
 obj-$(CONFIG_FB_MX3)		  += mx3fb.o
 obj-$(CONFIG_FB_DA8XX)		  += da8xx-fb.o
-obj-$(CONFIG_FB_MXS)		  += mxsfb.o
+obj-$(CONFIG_FB_MXS)		  += fb-mxs.o
+fb-mxs-objs			  := mxsfb.o
 obj-$(CONFIG_FB_SSD1307)	  += ssd1307fb.o
 obj-$(CONFIG_FB_SIMPLE)           += simplefb.o
 
-- 
2.20.1

