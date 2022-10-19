Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 847B9604C68
	for <lists+linux-fbdev@lfdr.de>; Wed, 19 Oct 2022 17:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbiJSPzZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 19 Oct 2022 11:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbiJSPyx (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 19 Oct 2022 11:54:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8FA17E81B;
        Wed, 19 Oct 2022 08:52:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 565D261844;
        Wed, 19 Oct 2022 15:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA7AC433D6;
        Wed, 19 Oct 2022 15:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666194707;
        bh=eqTrY4H4gnTgNtOLkl/PKGnR0u/ijjGY8yZ03RnlQ/k=;
        h=From:To:Cc:Subject:Date:From;
        b=lrbgq4B9Ai4N3HqsC2E5OGoxHcz7GQSv408l8Am1Jx9QFrrnCymzf3UgVaisbQkeM
         ZP6H03N/ADs7smh308X0lIhD5MuRzQ2ugTMxeomOUAHtEa4u+O11MDmg0qd0/04lY0
         pelYTiK+Db7iK2WBLnvZQWopigbxcPo5Fl/ppXQwWNhhLlL8h5V1MBdg+MkINWHmDk
         BaU3fs3Tw7W2ehkiO6cU370AQDzOkVXRmmx7Hir7ZgNtfPC7rOzGwsOUJJeABjvp9/
         1/eaokm0a5Ghroc/48TeMwRNgGXLDQB9FHPmPioGCbdfWwjNDgw1Nao5KRZVaMXCR7
         ubrK39+7sg2VA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
        Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
        Lennert Buytenhek <kernel@wantstofly.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Petchkovsky <mkpetch@internode.on.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Parsons <lost.distance@yahoo.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Reichel <sre@kernel.org>,
        Sergey Lapin <slapin@ossfans.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-pm@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 00/30] ARM: pxa: remove all unused boards&drivers
Date:   Wed, 19 Oct 2022 17:50:54 +0200
Message-Id: <20221019155129.3861230-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Most of the legacy PXA board files were marked as unused in linux-5.19 and
can get removed in linux-6.2. There is support for pxa250/pxa270/pxa300
using devicetree already, which supports a number of boards, but progress
on converting the remaining ones has stalled over the past few years.

The two boards that are left in the tree for now are the three 'sharpsl'
variants (spitz/akita/borzoi) and the 'gumstix' family of machines.
Both of these are supported by qemu, which can be helpful for completing
the DT conversion.

Only PXA25x and PXA27x are left with full boardfile support, so PXA300
can get a lot simpler while still working with DT, and PXA310/320/93x
can be removed entirely.

A good number of drivers become impossible to select after this, so
each of these also get dropped. I'm including the driver patches in the
series here and can either merge them through the soc tree, or they
can get picked up by the individual subsystem maintainers. Since both
the platform and the drivers get removed, the order should not matter.

Note that the patches here are generated with 'git format-patch -D'
and don't contain the contents of removed files because of the
significant size (the first patch is close to a megabyte).

Arnd Bergmann (30):
  ARM: pxa: remove unused board files
  ARM: pxa: remove irda leftover
  ARM: pxa: remove unused pxa3xx-ulpi
  ARM: pxa: drop pxa310/pxa320/pxa93x support
  ARM: pxa: prune unused device support
  power: remove z2_battery driver
  power: remove tosa_battery driver
  ata: remove palmld pata driver
  backlight: remove pxa tosa support
  input: remove pxa930_trkball driver
  input: remove pxa930_rotary keyboard driver
  input: remove zylonite touchscreen driver
  pcmcia: remove unused pxa/sa1100 drivers
  ASoC: pxa: remove unused board support
  ALSA: remove ac97 bus support
  mfd: remove wm97xx driver
  input: remove wm97xx support
  parport: remove ax88796 driver
  power: remove pda_power supply driver
  rtc: remove v3020 driver
  mfd: remove toshiba tmio drivers
  mfd: remove ucb1400 support
  mtd: remove tmio_nand driver
  mmc: remove tmio_mmc driver
  fbdev: remove tmiofb driver
  fbdev: remove w100fb driver
  leds: remove asic3 driver
  usb: remove ohci-tmio driver
  w1: remove ds1wm driver
  mfd: remove htc-pasic3 driver

Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Lee Jones <lee@kernel.org>
Cc: Lennert Buytenhek <kernel@wantstofly.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michael Petchkovsky <mkpetch@internode.on.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Paul Parsons <lost.distance@yahoo.com>
Cc: Philipp Zabel <philipp.zabel@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Sergey Lapin <slapin@ossfans.org>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ide@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: linux-leds@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: alsa-devel@alsa-project.org

 Documentation/power/power_supply_class.rst    |    4 +-
 MAINTAINERS                                   |  100 +-
 arch/arm/Kconfig                              |    1 -
 arch/arm/configs/cm_x300_defconfig            |  163 --
 arch/arm/configs/colibri_pxa270_defconfig     |  157 --
 arch/arm/configs/colibri_pxa300_defconfig     |   60 -
 arch/arm/configs/corgi_defconfig              |  247 ---
 arch/arm/configs/eseries_pxa_defconfig        |   97 -
 arch/arm/configs/ezx_defconfig                |  389 ----
 arch/arm/configs/h5000_defconfig              |   74 -
 arch/arm/configs/lpd270_defconfig             |   58 -
 arch/arm/configs/lubbock_defconfig            |   53 -
 arch/arm/configs/magician_defconfig           |  151 --
 arch/arm/configs/mainstone_defconfig          |   51 -
 arch/arm/configs/palmz72_defconfig            |   75 -
 arch/arm/configs/pcm027_defconfig             |   90 -
 arch/arm/configs/pxa255-idp_defconfig         |   55 -
 arch/arm/configs/pxa_defconfig                |    3 -
 arch/arm/configs/trizeps4_defconfig           |  207 ---
 arch/arm/configs/viper_defconfig              |  160 --
 arch/arm/configs/xcep_defconfig               |   89 -
 arch/arm/configs/zeus_defconfig               |  173 --
 arch/arm/mach-pxa/Kconfig                     |  583 +-----
 arch/arm/mach-pxa/Makefile                    |   60 +-
 arch/arm/mach-pxa/balloon3-pcmcia.c           |  137 --
 arch/arm/mach-pxa/balloon3.c                  |  821 --------
 arch/arm/mach-pxa/balloon3.h                  |  181 --
 arch/arm/mach-pxa/capc7117.c                  |  159 --
 arch/arm/mach-pxa/cm-x300.c                   |  883 ---------
 arch/arm/mach-pxa/colibri-evalboard.c         |  138 --
 arch/arm/mach-pxa/colibri-pcmcia.c            |  165 --
 arch/arm/mach-pxa/colibri-pxa270-income.c     |  236 ---
 arch/arm/mach-pxa/colibri-pxa270.c            |  330 ----
 arch/arm/mach-pxa/colibri-pxa300.c            |  193 --
 arch/arm/mach-pxa/colibri-pxa320.c            |  264 ---
 arch/arm/mach-pxa/colibri-pxa3xx.c            |  147 --
 arch/arm/mach-pxa/colibri.h                   |   70 -
 arch/arm/mach-pxa/corgi.c                     |  826 ---------
 arch/arm/mach-pxa/corgi.h                     |  110 --
 arch/arm/mach-pxa/corgi_pm.c                  |  221 ---
 arch/arm/mach-pxa/csb701.c                    |   67 -
 arch/arm/mach-pxa/csb726.c                    |  291 ---
 arch/arm/mach-pxa/csb726.h                    |   24 -
 arch/arm/mach-pxa/devices.c                   |  408 ----
 arch/arm/mach-pxa/devices.h                   |    3 -
 arch/arm/mach-pxa/e740-pcmcia.c               |  127 --
 arch/arm/mach-pxa/eseries-gpio.h              |   63 -
 arch/arm/mach-pxa/eseries-irq.h               |   24 -
 arch/arm/mach-pxa/eseries.c                   | 1001 ----------
 arch/arm/mach-pxa/ezx.c                       | 1254 -------------
 arch/arm/mach-pxa/h5000.c                     |  210 ---
 arch/arm/mach-pxa/h5000.h                     |  109 --
 arch/arm/mach-pxa/himalaya.c                  |  166 --
 arch/arm/mach-pxa/hx4700-pcmcia.c             |  118 --
 arch/arm/mach-pxa/hx4700.c                    |  942 ----------
 arch/arm/mach-pxa/hx4700.h                    |  129 --
 arch/arm/mach-pxa/icontrol.c                  |  218 ---
 arch/arm/mach-pxa/idp.c                       |  285 ---
 arch/arm/mach-pxa/idp.h                       |  195 --
 arch/arm/mach-pxa/littleton.c                 |  462 -----
 arch/arm/mach-pxa/littleton.h                 |   14 -
 arch/arm/mach-pxa/lpd270.c                    |  518 ------
 arch/arm/mach-pxa/lpd270.h                    |   40 -
 arch/arm/mach-pxa/lubbock.c                   |  649 -------
 arch/arm/mach-pxa/lubbock.h                   |   47 -
 arch/arm/mach-pxa/magician.c                  | 1112 -----------
 arch/arm/mach-pxa/magician.h                  |  125 --
 arch/arm/mach-pxa/mainstone.c                 |  738 --------
 arch/arm/mach-pxa/mainstone.h                 |  140 --
 arch/arm/mach-pxa/mfp-pxa25x.h                |   33 -
 arch/arm/mach-pxa/mfp-pxa2xx.c                |    4 -
 arch/arm/mach-pxa/mfp-pxa300.h                |   52 -
 arch/arm/mach-pxa/mfp-pxa320.h                |  458 -----
 arch/arm/mach-pxa/mfp-pxa930.h                |  495 -----
 arch/arm/mach-pxa/mioa701.c                   |  784 --------
 arch/arm/mach-pxa/mioa701.h                   |   76 -
 arch/arm/mach-pxa/mioa701_bootresume.S        |   38 -
 arch/arm/mach-pxa/mp900.c                     |  101 -
 arch/arm/mach-pxa/mxm8x10.c                   |  477 -----
 arch/arm/mach-pxa/mxm8x10.h                   |   22 -
 arch/arm/mach-pxa/palm27x.c                   |  473 -----
 arch/arm/mach-pxa/palm27x.h                   |   77 -
 arch/arm/mach-pxa/palmld-pcmcia.c             |  111 --
 arch/arm/mach-pxa/palmld.c                    |  392 ----
 arch/arm/mach-pxa/palmld.h                    |  107 --
 arch/arm/mach-pxa/palmt5.c                    |  234 ---
 arch/arm/mach-pxa/palmt5.h                    |   82 -
 arch/arm/mach-pxa/palmtc-pcmcia.c             |  162 --
 arch/arm/mach-pxa/palmtc.c                    |  539 ------
 arch/arm/mach-pxa/palmtc.h                    |   84 -
 arch/arm/mach-pxa/palmte2.c                   |  383 ----
 arch/arm/mach-pxa/palmte2.h                   |   64 -
 arch/arm/mach-pxa/palmtreo.c                  |  548 ------
 arch/arm/mach-pxa/palmtreo.h                  |   64 -
 arch/arm/mach-pxa/palmtx-pcmcia.c             |  111 --
 arch/arm/mach-pxa/palmtx.c                    |  390 ----
 arch/arm/mach-pxa/palmtx.h                    |  110 --
 arch/arm/mach-pxa/palmz72.c                   |  319 ----
 arch/arm/mach-pxa/palmz72.h                   |   80 -
 arch/arm/mach-pxa/pcm027.c                    |  266 ---
 arch/arm/mach-pxa/pcm027.h                    |   73 -
 arch/arm/mach-pxa/pcm990-baseboard.c          |  408 ----
 arch/arm/mach-pxa/pcm990_baseboard.h          |  199 --
 arch/arm/mach-pxa/pm.c                        |    2 -
 arch/arm/mach-pxa/pm.h                        |   10 -
 arch/arm/mach-pxa/poodle.c                    |  484 -----
 arch/arm/mach-pxa/poodle.h                    |   92 -
 arch/arm/mach-pxa/pxa25x.c                    |    7 -
 arch/arm/mach-pxa/pxa27x.c                    |   18 +-
 arch/arm/mach-pxa/pxa27x.h                    |    3 -
 arch/arm/mach-pxa/pxa2xx.c                    |   29 -
 arch/arm/mach-pxa/pxa300.c                    |   17 +-
 arch/arm/mach-pxa/pxa320.c                    |   88 -
 arch/arm/mach-pxa/pxa320.h                    |    9 -
 arch/arm/mach-pxa/pxa3xx-ulpi.c               |  385 ----
 arch/arm/mach-pxa/pxa3xx.c                    |   91 -
 arch/arm/mach-pxa/pxa930.c                    |  217 ---
 arch/arm/mach-pxa/pxa930.h                    |    8 -
 arch/arm/mach-pxa/pxa_cplds_irqs.c            |  200 --
 arch/arm/mach-pxa/regs-u2d.h                  |  199 --
 arch/arm/mach-pxa/regs-uart.h                 |  146 --
 arch/arm/mach-pxa/saar.c                      |  604 ------
 arch/arm/mach-pxa/sharpsl_pm.c                |    4 -
 arch/arm/mach-pxa/spitz.c                     |   23 -
 arch/arm/mach-pxa/tavorevb.c                  |  506 -----
 arch/arm/mach-pxa/tosa-bt.c                   |  134 --
 arch/arm/mach-pxa/tosa.c                      |  946 ----------
 arch/arm/mach-pxa/tosa.h                      |  165 --
 arch/arm/mach-pxa/tosa_bt.h                   |   18 -
 arch/arm/mach-pxa/trizeps4-pcmcia.c           |  200 --
 arch/arm/mach-pxa/trizeps4.c                  |  575 ------
 arch/arm/mach-pxa/trizeps4.h                  |  166 --
 arch/arm/mach-pxa/viper-pcmcia.c              |  180 --
 arch/arm/mach-pxa/viper-pcmcia.h              |   12 -
 arch/arm/mach-pxa/viper.c                     | 1034 -----------
 arch/arm/mach-pxa/viper.h                     |   91 -
 arch/arm/mach-pxa/vpac270-pcmcia.c            |  137 --
 arch/arm/mach-pxa/vpac270.c                   |  736 --------
 arch/arm/mach-pxa/vpac270.h                   |   38 -
 arch/arm/mach-pxa/xcep.c                      |  190 --
 arch/arm/mach-pxa/z2.c                        |  781 --------
 arch/arm/mach-pxa/z2.h                        |   37 -
 arch/arm/mach-pxa/zeus.c                      |  974 ----------
 arch/arm/mach-pxa/zeus.h                      |   82 -
 arch/arm/mach-pxa/zylonite.c                  |  495 -----
 arch/arm/mach-pxa/zylonite.h                  |   45 -
 arch/arm/mach-pxa/zylonite_pxa300.c           |  281 ---
 arch/arm/mach-pxa/zylonite_pxa320.c           |  213 ---
 arch/arm/mach-tegra/tegra.c                   |    1 -
 drivers/ata/Kconfig                           |    9 -
 drivers/ata/Makefile                          |    1 -
 drivers/ata/pata_palmld.c                     |  137 --
 drivers/clk/pxa/clk-pxa3xx.c                  |   22 +-
 drivers/cpufreq/pxa3xx-cpufreq.c              |   21 +-
 drivers/gpio/Kconfig                          |    7 -
 drivers/gpio/Makefile                         |    1 -
 drivers/gpio/gpio-ucb1400.c                   |   85 -
 drivers/input/keyboard/Kconfig                |    9 -
 drivers/input/keyboard/Makefile               |    1 -
 drivers/input/keyboard/pxa930_rotary.c        |  195 --
 drivers/input/mouse/Kconfig                   |    6 -
 drivers/input/mouse/Makefile                  |    1 -
 drivers/input/mouse/pxa930_trkball.c          |  250 ---
 drivers/input/touchscreen/Kconfig             |   81 -
 drivers/input/touchscreen/Makefile            |    8 -
 drivers/input/touchscreen/mainstone-wm97xx.c  |   10 -
 drivers/input/touchscreen/ucb1400_ts.c        |  458 -----
 drivers/input/touchscreen/wm9705.c            |  345 ----
 drivers/input/touchscreen/wm9712.c            |  466 -----
 drivers/input/touchscreen/wm9713.c            |  476 -----
 drivers/input/touchscreen/wm97xx-core.c       |  910 ---------
 drivers/input/touchscreen/zylonite-wm97xx.c   |  220 ---
 drivers/leds/Kconfig                          |   11 -
 drivers/leds/Makefile                         |    1 -
 drivers/leds/leds-asic3.c                     |  177 --
 drivers/mfd/Kconfig                           |   72 -
 drivers/mfd/Makefile                          |    8 -
 drivers/mfd/asic3.c                           | 1071 -----------
 drivers/mfd/htc-pasic3.c                      |  210 ---
 drivers/mfd/t7l66xb.c                         |  432 -----
 drivers/mfd/tc6387xb.c                        |  233 ---
 drivers/mfd/tc6393xb.c                        |  912 ---------
 drivers/mfd/tmio_core.c                       |   70 -
 drivers/mfd/ucb1400_core.c                    |  158 --
 drivers/mfd/wm97xx-core.c                     |  362 ----
 drivers/mmc/host/Kconfig                      |    8 -
 drivers/mmc/host/Makefile                     |    1 -
 drivers/mmc/host/pxamci.c                     |    3 +-
 drivers/mmc/host/tmio_mmc.c                   |  227 ---
 drivers/mtd/nand/raw/Kconfig                  |    7 -
 drivers/mtd/nand/raw/Makefile                 |    1 -
 drivers/mtd/nand/raw/tmio_nand.c              |  533 ------
 drivers/parport/Kconfig                       |   11 -
 drivers/parport/Makefile                      |    1 -
 drivers/parport/parport_ax88796.c             |  418 -----
 drivers/pcmcia/Kconfig                        |   12 +-
 drivers/pcmcia/Makefile                       |    5 -
 drivers/pcmcia/pxa2xx_base.c                  |   14 +-
 drivers/pcmcia/pxa2xx_mainstone.c             |  122 --
 drivers/pcmcia/sa1100_simpad.c                |  115 --
 drivers/pcmcia/sa1111_badge4.c                |  158 --
 drivers/pcmcia/sa1111_generic.c               |    4 -
 drivers/pcmcia/sa1111_lubbock.c               |  155 --
 drivers/power/supply/Kconfig                  |   22 -
 drivers/power/supply/Makefile                 |    3 -
 drivers/power/supply/ds2760_battery.c         |    8 -
 drivers/power/supply/pda_power.c              |  520 ------
 drivers/power/supply/tosa_battery.c           |  512 -----
 drivers/power/supply/z2_battery.c             |  317 ----
 drivers/rtc/Kconfig                           |    9 -
 drivers/rtc/Makefile                          |    1 -
 drivers/rtc/rtc-v3020.c                       |  369 ----
 drivers/usb/gadget/udc/pxa25x_udc.c           |   62 -
 drivers/usb/host/ohci-hcd.c                   |   18 -
 drivers/usb/host/ohci-pxa27x.c                |    9 -
 drivers/usb/host/ohci-tmio.c                  |  364 ----
 drivers/video/backlight/Kconfig               |   14 -
 drivers/video/backlight/Makefile              |    2 -
 drivers/video/backlight/locomolcd.c           |   10 -
 drivers/video/backlight/tosa_bl.c             |  173 --
 drivers/video/backlight/tosa_bl.h             |    8 -
 drivers/video/backlight/tosa_lcd.c            |  284 ---
 drivers/video/fbdev/Kconfig                   |   39 -
 drivers/video/fbdev/Makefile                  |    2 -
 drivers/video/fbdev/tmiofb.c                  | 1040 -----------
 drivers/video/fbdev/w100fb.c                  | 1644 -----------------
 drivers/video/fbdev/w100fb.h                  |  924 ---------
 drivers/w1/masters/Kconfig                    |    7 -
 drivers/w1/masters/Makefile                   |    1 -
 drivers/w1/masters/ds1wm.c                    |  675 -------
 include/linux/mfd/asic3.h                     |  313 ----
 include/linux/mfd/htc-pasic3.h                |   54 -
 include/linux/mfd/t7l66xb.h                   |   29 -
 include/linux/mfd/tc6387xb.h                  |   19 -
 include/linux/mfd/tc6393xb.h                  |   53 -
 include/linux/mfd/tmio.h                      |    5 -
 include/linux/parport.h                       |    5 -
 include/linux/pda_power.h                     |   39 -
 include/linux/platform_data/asoc-palm27x.h    |    9 -
 include/linux/platform_data/asoc-poodle.h     |   16 -
 include/linux/platform_data/asoc-pxa.h        |   31 -
 include/linux/platform_data/irda-pxaficp.h    |   26 -
 .../platform_data/keyboard-pxa930_rotary.h    |   21 -
 include/linux/platform_data/mmp_audio.h       |   18 -
 .../platform_data/mouse-pxa930_trkball.h      |   11 -
 include/linux/platform_data/rtc-v3020.h       |   41 -
 include/linux/platform_data/usb-pxa3xx-ulpi.h |   32 -
 include/linux/soc/pxa/cpu.h                   |   93 +-
 include/linux/ucb1400.h                       |  160 --
 include/linux/z2_battery.h                    |   17 -
 include/sound/ac97/codec.h                    |  116 --
 include/sound/ac97/compat.h                   |   17 -
 include/sound/ac97/controller.h               |   83 -
 include/video/w100fb.h                        |  147 --
 sound/Kconfig                                 |    3 -
 sound/Makefile                                |    1 -
 sound/ac97/Kconfig                            |   19 -
 sound/ac97/Makefile                           |    9 -
 sound/ac97/ac97_core.h                        |   13 -
 sound/ac97/bus.c                              |  557 ------
 sound/ac97/codec.c                            |   12 -
 sound/ac97/snd_ac97_compat.c                  |  120 --
 sound/arm/Kconfig                             |   13 -
 sound/arm/Makefile                            |    4 -
 sound/arm/pxa2xx-ac97-lib.c                   |  466 -----
 sound/arm/pxa2xx-ac97-regs.h                  |  100 -
 sound/arm/pxa2xx-ac97.c                       |  293 ---
 sound/pci/ac97/ac97_codec.c                   |    1 -
 sound/pci/ac97/ac97_patch.c                   |   40 -
 sound/soc/codecs/wm9705.c                     |    2 -
 sound/soc/codecs/wm9712.c                     |    2 -
 sound/soc/codecs/wm9713.c                     |    2 -
 sound/soc/pxa/Kconfig                         |  183 --
 sound/soc/pxa/Makefile                        |   35 -
 sound/soc/pxa/brownstone.c                    |  133 --
 sound/soc/pxa/corgi.c                         |  332 ----
 sound/soc/pxa/e740_wm9705.c                   |  168 --
 sound/soc/pxa/e750_wm9705.c                   |  147 --
 sound/soc/pxa/e800_wm9712.c                   |  147 --
 sound/soc/pxa/em-x270.c                       |   92 -
 sound/soc/pxa/hx4700.c                        |  207 ---
 sound/soc/pxa/magician.c                      |  366 ----
 sound/soc/pxa/mioa701_wm9713.c                |  201 --
 sound/soc/pxa/mmp-pcm.c                       |  267 ---
 sound/soc/pxa/palm27x.c                       |  162 --
 sound/soc/pxa/poodle.c                        |  291 ---
 sound/soc/pxa/pxa2xx-ac97.c                   |  307 ---
 sound/soc/pxa/pxa2xx-i2s.c                    |    2 -
 sound/soc/pxa/tosa.c                          |  255 ---
 sound/soc/pxa/ttc-dkb.c                       |  143 --
 sound/soc/pxa/z2.c                            |  218 ---
 sound/soc/pxa/zylonite.c                      |  266 ---
 292 files changed, 24 insertions(+), 59127 deletions(-)
 delete mode 100644 arch/arm/configs/cm_x300_defconfig
 delete mode 100644 arch/arm/configs/colibri_pxa270_defconfig
 delete mode 100644 arch/arm/configs/colibri_pxa300_defconfig
 delete mode 100644 arch/arm/configs/corgi_defconfig
 delete mode 100644 arch/arm/configs/eseries_pxa_defconfig
 delete mode 100644 arch/arm/configs/ezx_defconfig
 delete mode 100644 arch/arm/configs/h5000_defconfig
 delete mode 100644 arch/arm/configs/lpd270_defconfig
 delete mode 100644 arch/arm/configs/lubbock_defconfig
 delete mode 100644 arch/arm/configs/magician_defconfig
 delete mode 100644 arch/arm/configs/mainstone_defconfig
 delete mode 100644 arch/arm/configs/palmz72_defconfig
 delete mode 100644 arch/arm/configs/pcm027_defconfig
 delete mode 100644 arch/arm/configs/pxa255-idp_defconfig
 delete mode 100644 arch/arm/configs/trizeps4_defconfig
 delete mode 100644 arch/arm/configs/viper_defconfig
 delete mode 100644 arch/arm/configs/xcep_defconfig
 delete mode 100644 arch/arm/configs/zeus_defconfig
 delete mode 100644 arch/arm/mach-pxa/balloon3-pcmcia.c
 delete mode 100644 arch/arm/mach-pxa/balloon3.c
 delete mode 100644 arch/arm/mach-pxa/balloon3.h
 delete mode 100644 arch/arm/mach-pxa/capc7117.c
 delete mode 100644 arch/arm/mach-pxa/cm-x300.c
 delete mode 100644 arch/arm/mach-pxa/colibri-evalboard.c
 delete mode 100644 arch/arm/mach-pxa/colibri-pcmcia.c
 delete mode 100644 arch/arm/mach-pxa/colibri-pxa270-income.c
 delete mode 100644 arch/arm/mach-pxa/colibri-pxa270.c
 delete mode 100644 arch/arm/mach-pxa/colibri-pxa300.c
 delete mode 100644 arch/arm/mach-pxa/colibri-pxa320.c
 delete mode 100644 arch/arm/mach-pxa/colibri-pxa3xx.c
 delete mode 100644 arch/arm/mach-pxa/colibri.h
 delete mode 100644 arch/arm/mach-pxa/corgi.c
 delete mode 100644 arch/arm/mach-pxa/corgi.h
 delete mode 100644 arch/arm/mach-pxa/corgi_pm.c
 delete mode 100644 arch/arm/mach-pxa/csb701.c
 delete mode 100644 arch/arm/mach-pxa/csb726.c
 delete mode 100644 arch/arm/mach-pxa/csb726.h
 delete mode 100644 arch/arm/mach-pxa/e740-pcmcia.c
 delete mode 100644 arch/arm/mach-pxa/eseries-gpio.h
 delete mode 100644 arch/arm/mach-pxa/eseries-irq.h
 delete mode 100644 arch/arm/mach-pxa/eseries.c
 delete mode 100644 arch/arm/mach-pxa/ezx.c
 delete mode 100644 arch/arm/mach-pxa/h5000.c
 delete mode 100644 arch/arm/mach-pxa/h5000.h
 delete mode 100644 arch/arm/mach-pxa/himalaya.c
 delete mode 100644 arch/arm/mach-pxa/hx4700-pcmcia.c
 delete mode 100644 arch/arm/mach-pxa/hx4700.c
 delete mode 100644 arch/arm/mach-pxa/hx4700.h
 delete mode 100644 arch/arm/mach-pxa/icontrol.c
 delete mode 100644 arch/arm/mach-pxa/idp.c
 delete mode 100644 arch/arm/mach-pxa/idp.h
 delete mode 100644 arch/arm/mach-pxa/littleton.c
 delete mode 100644 arch/arm/mach-pxa/littleton.h
 delete mode 100644 arch/arm/mach-pxa/lpd270.c
 delete mode 100644 arch/arm/mach-pxa/lpd270.h
 delete mode 100644 arch/arm/mach-pxa/lubbock.c
 delete mode 100644 arch/arm/mach-pxa/lubbock.h
 delete mode 100644 arch/arm/mach-pxa/magician.c
 delete mode 100644 arch/arm/mach-pxa/magician.h
 delete mode 100644 arch/arm/mach-pxa/mainstone.c
 delete mode 100644 arch/arm/mach-pxa/mainstone.h
 delete mode 100644 arch/arm/mach-pxa/mfp-pxa320.h
 delete mode 100644 arch/arm/mach-pxa/mfp-pxa930.h
 delete mode 100644 arch/arm/mach-pxa/mioa701.c
 delete mode 100644 arch/arm/mach-pxa/mioa701.h
 delete mode 100644 arch/arm/mach-pxa/mioa701_bootresume.S
 delete mode 100644 arch/arm/mach-pxa/mp900.c
 delete mode 100644 arch/arm/mach-pxa/mxm8x10.c
 delete mode 100644 arch/arm/mach-pxa/mxm8x10.h
 delete mode 100644 arch/arm/mach-pxa/palm27x.c
 delete mode 100644 arch/arm/mach-pxa/palm27x.h
 delete mode 100644 arch/arm/mach-pxa/palmld-pcmcia.c
 delete mode 100644 arch/arm/mach-pxa/palmld.c
 delete mode 100644 arch/arm/mach-pxa/palmld.h
 delete mode 100644 arch/arm/mach-pxa/palmt5.c
 delete mode 100644 arch/arm/mach-pxa/palmt5.h
 delete mode 100644 arch/arm/mach-pxa/palmtc-pcmcia.c
 delete mode 100644 arch/arm/mach-pxa/palmtc.c
 delete mode 100644 arch/arm/mach-pxa/palmtc.h
 delete mode 100644 arch/arm/mach-pxa/palmte2.c
 delete mode 100644 arch/arm/mach-pxa/palmte2.h
 delete mode 100644 arch/arm/mach-pxa/palmtreo.c
 delete mode 100644 arch/arm/mach-pxa/palmtreo.h
 delete mode 100644 arch/arm/mach-pxa/palmtx-pcmcia.c
 delete mode 100644 arch/arm/mach-pxa/palmtx.c
 delete mode 100644 arch/arm/mach-pxa/palmtx.h
 delete mode 100644 arch/arm/mach-pxa/palmz72.c
 delete mode 100644 arch/arm/mach-pxa/palmz72.h
 delete mode 100644 arch/arm/mach-pxa/pcm027.c
 delete mode 100644 arch/arm/mach-pxa/pcm027.h
 delete mode 100644 arch/arm/mach-pxa/pcm990-baseboard.c
 delete mode 100644 arch/arm/mach-pxa/pcm990_baseboard.h
 delete mode 100644 arch/arm/mach-pxa/poodle.c
 delete mode 100644 arch/arm/mach-pxa/poodle.h
 delete mode 100644 arch/arm/mach-pxa/pxa320.c
 delete mode 100644 arch/arm/mach-pxa/pxa320.h
 delete mode 100644 arch/arm/mach-pxa/pxa3xx-ulpi.c
 delete mode 100644 arch/arm/mach-pxa/pxa930.c
 delete mode 100644 arch/arm/mach-pxa/pxa930.h
 delete mode 100644 arch/arm/mach-pxa/pxa_cplds_irqs.c
 delete mode 100644 arch/arm/mach-pxa/regs-u2d.h
 delete mode 100644 arch/arm/mach-pxa/regs-uart.h
 delete mode 100644 arch/arm/mach-pxa/saar.c
 delete mode 100644 arch/arm/mach-pxa/tavorevb.c
 delete mode 100644 arch/arm/mach-pxa/tosa-bt.c
 delete mode 100644 arch/arm/mach-pxa/tosa.c
 delete mode 100644 arch/arm/mach-pxa/tosa.h
 delete mode 100644 arch/arm/mach-pxa/tosa_bt.h
 delete mode 100644 arch/arm/mach-pxa/trizeps4-pcmcia.c
 delete mode 100644 arch/arm/mach-pxa/trizeps4.c
 delete mode 100644 arch/arm/mach-pxa/trizeps4.h
 delete mode 100644 arch/arm/mach-pxa/viper-pcmcia.c
 delete mode 100644 arch/arm/mach-pxa/viper-pcmcia.h
 delete mode 100644 arch/arm/mach-pxa/viper.c
 delete mode 100644 arch/arm/mach-pxa/viper.h
 delete mode 100644 arch/arm/mach-pxa/vpac270-pcmcia.c
 delete mode 100644 arch/arm/mach-pxa/vpac270.c
 delete mode 100644 arch/arm/mach-pxa/vpac270.h
 delete mode 100644 arch/arm/mach-pxa/xcep.c
 delete mode 100644 arch/arm/mach-pxa/z2.c
 delete mode 100644 arch/arm/mach-pxa/z2.h
 delete mode 100644 arch/arm/mach-pxa/zeus.c
 delete mode 100644 arch/arm/mach-pxa/zeus.h
 delete mode 100644 arch/arm/mach-pxa/zylonite.c
 delete mode 100644 arch/arm/mach-pxa/zylonite.h
 delete mode 100644 arch/arm/mach-pxa/zylonite_pxa300.c
 delete mode 100644 arch/arm/mach-pxa/zylonite_pxa320.c
 delete mode 100644 drivers/ata/pata_palmld.c
 delete mode 100644 drivers/gpio/gpio-ucb1400.c
 delete mode 100644 drivers/input/keyboard/pxa930_rotary.c
 delete mode 100644 drivers/input/mouse/pxa930_trkball.c
 delete mode 100644 drivers/input/touchscreen/ucb1400_ts.c
 delete mode 100644 drivers/input/touchscreen/wm9705.c
 delete mode 100644 drivers/input/touchscreen/wm9712.c
 delete mode 100644 drivers/input/touchscreen/wm9713.c
 delete mode 100644 drivers/input/touchscreen/wm97xx-core.c
 delete mode 100644 drivers/input/touchscreen/zylonite-wm97xx.c
 delete mode 100644 drivers/leds/leds-asic3.c
 delete mode 100644 drivers/mfd/asic3.c
 delete mode 100644 drivers/mfd/htc-pasic3.c
 delete mode 100644 drivers/mfd/t7l66xb.c
 delete mode 100644 drivers/mfd/tc6387xb.c
 delete mode 100644 drivers/mfd/tc6393xb.c
 delete mode 100644 drivers/mfd/tmio_core.c
 delete mode 100644 drivers/mfd/ucb1400_core.c
 delete mode 100644 drivers/mfd/wm97xx-core.c
 delete mode 100644 drivers/mmc/host/tmio_mmc.c
 delete mode 100644 drivers/mtd/nand/raw/tmio_nand.c
 delete mode 100644 drivers/parport/parport_ax88796.c
 delete mode 100644 drivers/pcmcia/pxa2xx_mainstone.c
 delete mode 100644 drivers/pcmcia/sa1100_simpad.c
 delete mode 100644 drivers/pcmcia/sa1111_badge4.c
 delete mode 100644 drivers/pcmcia/sa1111_lubbock.c
 delete mode 100644 drivers/power/supply/pda_power.c
 delete mode 100644 drivers/power/supply/tosa_battery.c
 delete mode 100644 drivers/power/supply/z2_battery.c
 delete mode 100644 drivers/rtc/rtc-v3020.c
 delete mode 100644 drivers/usb/host/ohci-tmio.c
 delete mode 100644 drivers/video/backlight/tosa_bl.c
 delete mode 100644 drivers/video/backlight/tosa_bl.h
 delete mode 100644 drivers/video/backlight/tosa_lcd.c
 delete mode 100644 drivers/video/fbdev/tmiofb.c
 delete mode 100644 drivers/video/fbdev/w100fb.c
 delete mode 100644 drivers/video/fbdev/w100fb.h
 delete mode 100644 drivers/w1/masters/ds1wm.c
 delete mode 100644 include/linux/mfd/asic3.h
 delete mode 100644 include/linux/mfd/htc-pasic3.h
 delete mode 100644 include/linux/mfd/t7l66xb.h
 delete mode 100644 include/linux/mfd/tc6387xb.h
 delete mode 100644 include/linux/mfd/tc6393xb.h
 delete mode 100644 include/linux/pda_power.h
 delete mode 100644 include/linux/platform_data/asoc-palm27x.h
 delete mode 100644 include/linux/platform_data/asoc-poodle.h
 delete mode 100644 include/linux/platform_data/asoc-pxa.h
 delete mode 100644 include/linux/platform_data/irda-pxaficp.h
 delete mode 100644 include/linux/platform_data/keyboard-pxa930_rotary.h
 delete mode 100644 include/linux/platform_data/mmp_audio.h
 delete mode 100644 include/linux/platform_data/mouse-pxa930_trkball.h
 delete mode 100644 include/linux/platform_data/rtc-v3020.h
 delete mode 100644 include/linux/platform_data/usb-pxa3xx-ulpi.h
 delete mode 100644 include/linux/ucb1400.h
 delete mode 100644 include/linux/z2_battery.h
 delete mode 100644 include/sound/ac97/codec.h
 delete mode 100644 include/sound/ac97/compat.h
 delete mode 100644 include/sound/ac97/controller.h
 delete mode 100644 include/video/w100fb.h
 delete mode 100644 sound/ac97/Kconfig
 delete mode 100644 sound/ac97/Makefile
 delete mode 100644 sound/ac97/ac97_core.h
 delete mode 100644 sound/ac97/bus.c
 delete mode 100644 sound/ac97/codec.c
 delete mode 100644 sound/ac97/snd_ac97_compat.c
 delete mode 100644 sound/arm/pxa2xx-ac97-lib.c
 delete mode 100644 sound/arm/pxa2xx-ac97-regs.h
 delete mode 100644 sound/arm/pxa2xx-ac97.c
 delete mode 100644 sound/soc/pxa/brownstone.c
 delete mode 100644 sound/soc/pxa/corgi.c
 delete mode 100644 sound/soc/pxa/e740_wm9705.c
 delete mode 100644 sound/soc/pxa/e750_wm9705.c
 delete mode 100644 sound/soc/pxa/e800_wm9712.c
 delete mode 100644 sound/soc/pxa/em-x270.c
 delete mode 100644 sound/soc/pxa/hx4700.c
 delete mode 100644 sound/soc/pxa/magician.c
 delete mode 100644 sound/soc/pxa/mioa701_wm9713.c
 delete mode 100644 sound/soc/pxa/mmp-pcm.c
 delete mode 100644 sound/soc/pxa/palm27x.c
 delete mode 100644 sound/soc/pxa/poodle.c
 delete mode 100644 sound/soc/pxa/pxa2xx-ac97.c
 delete mode 100644 sound/soc/pxa/tosa.c
 delete mode 100644 sound/soc/pxa/ttc-dkb.c
 delete mode 100644 sound/soc/pxa/z2.c
 delete mode 100644 sound/soc/pxa/zylonite.c

-- 
2.29.2

