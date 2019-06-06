Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF9A370AD
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Jun 2019 11:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfFFJrZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 6 Jun 2019 05:47:25 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40409 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbfFFJrY (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 6 Jun 2019 05:47:24 -0400
Received: by mail-lj1-f196.google.com with SMTP id a21so1366439ljh.7
        for <linux-fbdev@vger.kernel.org>; Thu, 06 Jun 2019 02:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rKGTOfiJLhxkK5DAGNPwC06vm8bKZwP8i9X7cgh9zRA=;
        b=K+PqH70Mt8b5TNW5xvyKMCLzJtovkyWC4zw7/gWft90LGfZ2cANg/5W/zie4WCakja
         iqBzR6M/vddI7/EJkTSwFeHsH6hRt4shQeumyR/ZYmDdgkZiqc5Wm6oLzCIacG4Q0Mqv
         lvJIBpKkC+6yMDO0x90jeibFkzrw1QpAao7YTIOOadlwLYolHX6oIJ4WCgLM2CD/yUgl
         ePdQIpZw28df1WlqwFUyJoe6wpBHUCyVK64DdRONB0FcZyGGFE9EMlKystWQFaI1LAzr
         Lg6zc7EfV2TgzfWHFK+Ug4ER7oXkMFTR73mMQVaH3VMxJUeutxA+xdU/7CS1ix1hp2qW
         ig2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rKGTOfiJLhxkK5DAGNPwC06vm8bKZwP8i9X7cgh9zRA=;
        b=QITIU3d8+Mf/9AVjaWOD92YppJ6ZLNJXEYWQpYf80Lnfx1kDXPsTCjsgAmQn5qvWJT
         naN5IJ4G5vWZDwE/dUpUiTDSpFQQ8yr3M9vO+o4InhzOmSkw642lrGAB0Jo/Ra/Q4vQ0
         fOTUwfVnPnNao8Ifr0fmtraWsPDTEN7rYEmpC8E1pyaA5e4F3z9hifkrLbMIgSMhD2b/
         7eyKxw2bAFlcP7bP23MnPFzEE0IgFK5R5MgpQB+LI4JYdH5wieeHTHfRPDO51kfjkS3A
         mPyUaKFgbzjh0ivK52/vHV+4Tx1JPQml9PKfgbnexHVLfwqTrSyFGGbWlvTRoNFMi6QP
         UQoQ==
X-Gm-Message-State: APjAAAW66xYuTvZMStepmNY0rMK/kaCDhen+2+m2cvat/NMkTmP+Tmg/
        irv3T585PSJcK3POdtGeYYZ9mw==
X-Google-Smtp-Source: APXvYqxPlKZHL9CiyClyWDvutiKzyHn6nhVbMEAw7QIESvJ4dLD6VWjiINM1rxgc+VbZYV5LMX8zug==
X-Received: by 2002:a2e:9284:: with SMTP id d4mr24398129ljh.26.1559814442103;
        Thu, 06 Jun 2019 02:47:22 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se. [213.112.54.28])
        by smtp.gmail.com with ESMTPSA id r24sm124610ljb.72.2019.06.06.02.47.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 02:47:21 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     airlied@linux.ie, daniel@ffwll.ch, a.hajda@samsung.com,
        mchehab@kernel.org
Cc:     andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
        marex@denx.de, stefan@agner.ch, shawnguo@kernel.org,
        s.hauer@pengutronix.de, b.zolnierkie@samsung.com,
        p.zabel@pengutronix.de, hkallweit1@gmail.com, lee.jones@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, davem@davemloft.net,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-media@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 4/8] drivers: media: i2c: fix warning same module names
Date:   Thu,  6 Jun 2019 11:47:17 +0200
Message-Id: <20190606094717.23766-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

When building with CONFIG_VIDEO_ADV7511 and CONFIG_DRM_I2C_ADV7511
enabled as loadable modules, we see the following warning:

warning: same module names found:
  drivers/gpu/drm/bridge/adv7511/adv7511.ko
  drivers/media/i2c/adv7511.ko

Rework so the names matches the config fragment.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
This is only one issue that have been addressed.
The other issue is that itseems to refer to the same device name in
i2c_device_id, any guidance how that should be solved?


Cheers,
Anders

 drivers/gpu/drm/bridge/adv7511/Makefile | 10 +++++-----
 drivers/media/i2c/Makefile              |  3 ++-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/Makefile b/drivers/gpu/drm/bridge/adv7511/Makefile
index b46ebeb35fd4..e367426bd73e 100644
--- a/drivers/gpu/drm/bridge/adv7511/Makefile
+++ b/drivers/gpu/drm/bridge/adv7511/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-adv7511-y := adv7511_drv.o
-adv7511-$(CONFIG_DRM_I2C_ADV7511_AUDIO) += adv7511_audio.o
-adv7511-$(CONFIG_DRM_I2C_ADV7511_CEC) += adv7511_cec.o
-adv7511-$(CONFIG_DRM_I2C_ADV7533) += adv7533.o
-obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511.o
+drm-i2c-adv7511-y := adv7511_drv.o
+drm-i2c-adv7511-$(CONFIG_DRM_I2C_ADV7511_AUDIO) += adv7511_audio.o
+drm-i2c-adv7511-$(CONFIG_DRM_I2C_ADV7511_CEC) += adv7511_cec.o
+drm-i2c-adv7511-$(CONFIG_DRM_I2C_ADV7533) += adv7533.o
+obj-$(CONFIG_DRM_I2C_ADV7511) += drm-i2c-adv7511.o
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index d8ad9dad495d..b71a427a89fd 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -35,7 +35,8 @@ obj-$(CONFIG_VIDEO_ADV748X) += adv748x/
 obj-$(CONFIG_VIDEO_ADV7604) += adv7604.o
 obj-$(CONFIG_VIDEO_ADV7842) += adv7842.o
 obj-$(CONFIG_VIDEO_AD9389B) += ad9389b.o
-obj-$(CONFIG_VIDEO_ADV7511) += adv7511.o
+obj-$(CONFIG_VIDEO_ADV7511) += video-adv7511.o
+video-adv7511-objs          := adv7511.o
 obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
 obj-$(CONFIG_VIDEO_VS6624)  += vs6624.o
 obj-$(CONFIG_VIDEO_BT819) += bt819.o
-- 
2.20.1

