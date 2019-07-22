Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC6A370177
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 15:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730028AbfGVNol (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 09:44:41 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46148 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729188AbfGVNok (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 09:44:40 -0400
Received: by mail-wr1-f66.google.com with SMTP id z1so39453753wru.13
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 06:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6OE2vgUPZ5yWbUkDxF2/EfNu3Dftuv+SUPLz3txgSn0=;
        b=jDRY8s9DB/0Rdp9EuXO3MDPJTyhubw2FhY+I8rkA7gKejbLftYHvixid1ZPoPkn7ts
         A9Nt0ELbEQ+/mnmPAbuZJmaKi0ux4J1MO9XL/EyAnVRDeRvZfwqvUc++Ubl3EYf8e3Sy
         5kQgt3VZWaBETd569WwmaFNrKER5ta73sPjxhbRBvYk4TMIt9TU1tH/jJx/xRDpxl6ND
         cqVIo0A69rGe/3GNQFG+6aa4luSVqjzMBWjvzxHiwouptlDVdrwOcKzz1Xa7JljTKa+m
         /AEYM3KnHHCq1RbWGM9tJ6BQTPX5Jy7r16BNc/owfeuNU3e+zArBIS8uq8uVLMstI3w2
         M4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6OE2vgUPZ5yWbUkDxF2/EfNu3Dftuv+SUPLz3txgSn0=;
        b=jmOLXWFpoR6JcveyDjwWdagdLduFi9lvVJW/gP3bj7BGCd1VZ+ErjK2h7bUE9dh9Nd
         qLuzI+rDRNwTK2DvivoBaZ1LaBPoWvR+nMGUYVWjjcJH3qs7XQqaImHVb/VjFMMld4jA
         sTfv7uznOm3JDgSoN1dICeSuJrklD23LAbgMSAV8MdovcMWg+ke75ld1kq3DoFyBmKWz
         aYBboCZZXQXXmHZywjeJ8BYY9zltDN1naheWiVtxm8Lx8KzQOq42mJKuCDPokkXhArGE
         MvsNajqqGxHyTnERVvoU80kjUcRBbtmGOaXFQnyFDnNhzqSrZ76pn93gwVzkVRhqayU3
         5taA==
X-Gm-Message-State: APjAAAX9gB8rRNyVzZqIqjYMdNvvXa1hDDisGY7MUto6t1Y7fLZ7hrz0
        rfdB4mGrNrdAaT4mIXuEUjA=
X-Google-Smtp-Source: APXvYqwvf5snwzuBm1QlzKK/QuN97vn9/tXDk4UIUnMrk9mGyCSxLMLSb1VOWE60YCYGqOxJSBkzkg==
X-Received: by 2002:adf:f246:: with SMTP id b6mr47585965wrp.92.1563803079035;
        Mon, 22 Jul 2019 06:44:39 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id p6sm40652484wrq.97.2019.07.22.06.44.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 06:44:38 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/9] ARM: davinci: da850-evm: remove more legacy GPIO calls
Date:   Mon, 22 Jul 2019 15:44:14 +0200
Message-Id: <20190722134423.26555-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is another small step on the path to liberating davinci from legacy
GPIO API calls and shrinking the davinci GPIO driver by not having to
support the base GPIO number anymore.

This time we're removing the legacy calls used indirectly by the LCDC
fbdev driver.

First two patches enable the GPIO backlight driver in
davinci_all_defconfig.

Patch 3/12 models the backlight GPIO as an actual GPIO backlight device.

Patches 4-6 extend the fbdev driver with regulator support and convert
the da850-evm board file to using it.

Last three patches are improvements to the da8xx fbdev driver since
we're already touching it in this series.

v1 -> v2:
- dopped the gpio-backlight patches from this series as since v5.3-rc1 we
  can probe the module with neither the OF node nor platform data
- collected review and ack tags
- rebased on top of v5.3-rc1

Bartosz Golaszewski (9):
  ARM: davinci: refresh davinci_all_defconfig
  ARM: davinci_all_defconfig: enable GPIO backlight
  ARM: davinci: da850-evm: model the backlight GPIO as an actual device
  fbdev: da8xx: add support for a regulator
  ARM: davinci: da850-evm: switch to using a fixed regulator for lcdc
  fbdev: da8xx: remove panel_power_ctrl() callback from platform data
  fbdev: da8xx-fb: use devm_platform_ioremap_resource()
  fbdev: da8xx-fb: drop a redundant if
  fbdev: da8xx: use resource management for dma

 arch/arm/configs/davinci_all_defconfig  |  27 ++----
 arch/arm/mach-davinci/board-da850-evm.c |  90 +++++++++++++-----
 drivers/video/fbdev/da8xx-fb.c          | 118 +++++++++++++-----------
 include/video/da8xx-fb.h                |   1 -
 4 files changed, 141 insertions(+), 95 deletions(-)

-- 
2.21.0

