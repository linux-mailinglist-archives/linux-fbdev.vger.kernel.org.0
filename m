Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C73DC370B5
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Jun 2019 11:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbfFFJsG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 6 Jun 2019 05:48:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44892 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727866AbfFFJrO (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 6 Jun 2019 05:47:14 -0400
Received: by mail-lj1-f196.google.com with SMTP id k18so1345928ljc.11
        for <linux-fbdev@vger.kernel.org>; Thu, 06 Jun 2019 02:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l/U6XWsLOhFjdMqLKkh6fLtzFOqDQWJVhwH8yel62eg=;
        b=DPqi9DXwR+/hq7+Y9ZtMxZT2lLXGKzxdH/38Gu1SLXrFX1a+ucNrqvP8hDzJ33uHfp
         pHEwDO0hH6zLdP51PIE7a9x0i3YEr55tq9dzzKM2sf7emuDCE24z6TmisXtKu4JZYCfT
         I5+Ywy17dLMfSskwg73uua2d5seIGWnJH4ccXJGPEm56bi+clkBBXjvOTAbhkMQl7xUu
         REhmNfRmiR3yPcEvujzxpqbYiiNCMdqFFPlGaOIrpBDxtQDH8j1BgnS/FfuowKEobouO
         ZtKE/RsncvrSsnltdI/Y98+ttSi+9orKWxSDoJjdFl077xhmlcWcq4CB/fwN06jV3ZJQ
         pFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l/U6XWsLOhFjdMqLKkh6fLtzFOqDQWJVhwH8yel62eg=;
        b=QSGxXIcE53DmJoiLa85l8X/6s28mUWmSjf3Jh1aHvPo1LsvgBEgWfpgRqgKA5ycU5l
         5sRHEIrsHEpULn2vrBQ6WLgG6IXawzOl/JWnf0RWd8ElE/0Dz9BKPzlMK+OvDXsxXACk
         EFKFvuGQj6MM4622QJcl/VmQKYEHeuT8subANH36EiW1qehnz5QOUj/e1j5LhWfa8aL5
         iOGYayRyHAeZZr4x8/aWqMv55uJu/3Neo5QzHPBRL8PaySobysQf+oSSNmO7g/XanD7O
         jOR6X4yQl0XBS2oeGbLLFdVTIrHDQQa/uVi7ZGWCt8Jxu2cQ0wt7HZ+OcOvVGlNCqHaa
         AdQA==
X-Gm-Message-State: APjAAAVCqLG3GVEw2JAlNEbtiTIGQZoyaVpJB/bkwURbKKohbD6dT6aE
        YfqkcjxYgKD9FFKtGDn4bTTCvICBvoXHbtiu
X-Google-Smtp-Source: APXvYqy7mb00k+UK6LOG7DoqGlifcZ13JvJ32QMCTaESKr1UJUujm2V1imjgYwk0EZVnqo92sOxRgA==
X-Received: by 2002:a2e:2b11:: with SMTP id q17mr24274621lje.23.1559814431865;
        Thu, 06 Jun 2019 02:47:11 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se. [213.112.54.28])
        by smtp.gmail.com with ESMTPSA id q2sm217457lfj.25.2019.06.06.02.47.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 02:47:11 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
        davem@davemloft.net
Cc:     marex@denx.de, stefan@agner.ch, airlied@linux.ie, daniel@ffwll.ch,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        b.zolnierkie@samsung.com, a.hajda@samsung.com, mchehab@kernel.org,
        p.zabel@pengutronix.de, hkallweit1@gmail.com, lee.jones@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-media@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 1/8] drivers: net: dsa: realtek: fix warning same module names
Date:   Thu,  6 Jun 2019 11:47:07 +0200
Message-Id: <20190606094707.23664-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

When building with CONFIG_NET_DSA_REALTEK_SMI and CONFIG_REALTEK_PHY
enabled as loadable modules, we see the following warning:

warning: same module names found:
  drivers/net/phy/realtek.ko
  drivers/net/dsa/realtek.ko

Rework so the names matches the config fragment.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/net/dsa/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/Makefile b/drivers/net/dsa/Makefile
index fefb6aaa82ba..dbe8352cf8a4 100644
--- a/drivers/net/dsa/Makefile
+++ b/drivers/net/dsa/Makefile
@@ -9,8 +9,8 @@ obj-$(CONFIG_NET_DSA_LANTIQ_GSWIP) += lantiq_gswip.o
 obj-$(CONFIG_NET_DSA_MT7530)	+= mt7530.o
 obj-$(CONFIG_NET_DSA_MV88E6060) += mv88e6060.o
 obj-$(CONFIG_NET_DSA_QCA8K)	+= qca8k.o
-obj-$(CONFIG_NET_DSA_REALTEK_SMI) += realtek.o
-realtek-objs			:= realtek-smi.o rtl8366.o rtl8366rb.o
+obj-$(CONFIG_NET_DSA_REALTEK_SMI) += dsa-realtek-smi.o
+dsa-realtek-smi-objs			:= realtek-smi.o rtl8366.o rtl8366rb.o
 obj-$(CONFIG_NET_DSA_SMSC_LAN9303) += lan9303-core.o
 obj-$(CONFIG_NET_DSA_SMSC_LAN9303_I2C) += lan9303_i2c.o
 obj-$(CONFIG_NET_DSA_SMSC_LAN9303_MDIO) += lan9303_mdio.o
-- 
2.20.1

