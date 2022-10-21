Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D08C6607B7B
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Oct 2022 17:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiJUPvI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 21 Oct 2022 11:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiJUPu7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 21 Oct 2022 11:50:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BCE38A21;
        Fri, 21 Oct 2022 08:50:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9DCC961EFF;
        Fri, 21 Oct 2022 15:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D87C433C1;
        Fri, 21 Oct 2022 15:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666367411;
        bh=u6mgMMUQyq3LFTowajdhaabP7RK0RDkS+CspfzBu8ss=;
        h=From:To:Cc:Subject:Date:From;
        b=us0m33iN6iGUZAAMh/Tz2ACZqo/rRVOrTPq0AWj1RL6s3z/p+CCsHUvJRu5akxjQo
         NAgDX/4rE2eTKbbKRNUu1qMS9HbUE7hBKXzuyBmlbAVPKgTnm7SIIoBjG7oa1JhO5X
         Bbn3eytw/tvEaOQRAP3EchiZX1LCriiwv1RlRq7dYHNHecYzEOfrJiMPlBJsIgS2v4
         ffjTapecJOzW8de60RWn4ZRsLwB9JEl7RXFN35GRR68VGqfScsqL4/H001kjm+08Zj
         kByGPimYibfhMNGOY7hTpfmS8tGiJ4liQ5zHdn+cfX9gK/rfydaNWrsuLbjIbDnFm6
         pgQ9VzbgZnxdA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lubomir Rintel <lkundrak@v3.sk>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Peter Chubb <peter.chubb@unsw.edu.au>,
        Richard Weinberger <richard@nod.at>,
        Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 00/11] ARM: sa1100, mmp: drop unused board files
Date:   Fri, 21 Oct 2022 17:49:30 +0200
Message-Id: <20221021155000.4108406-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A number of board files were marked as 'unused' in 2022 and can
get removed in linux-6.2 at the beginning of 2023.
I wanted to group these two platforms with the PXA series, but
that one is already too big.

MMP is now DT-only, which allows removing most of the platform
specific source code.

On SA1100, four boards that have no apparent users get removed,
while another four boards each had one person saying they would
like to keep it around.

Arnd Bergmann (11):
  ARM: sa1100: un-deprecate jornada720
  ARM: sa1100: remove unused board files
  ARM: sa1100: remove irda references
  ARM: sa1100: make cpufreq driver build standalone
  cpufreq: remove sa1100 driver
  mtd: remove lart flash driver
  ARM: mmp: select specific CPU implementation
  ARM: mmp: remove all board files
  ARM: mmp: remove custom sram code
  ARM: mmp: remove device definitions
  ARM: mmp: remove old PM support

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Lee Jones <lee@kernel.org>
Cc: Lubomir Rintel <lkundrak@v3.sk>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Peter Chubb <peter.chubb@unsw.edu.au>
Cc: Richard Weinberger <richard@nod.at>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-pm@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-usb@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

 MAINTAINERS                                   |  11 -
 arch/arm/Kconfig                              |   6 -
 arch/arm/boot/compressed/head-sa1100.S        |   4 -
 arch/arm/configs/badge4_defconfig             | 105 ---
 arch/arm/configs/cerfcube_defconfig           |  73 --
 arch/arm/configs/hackkit_defconfig            |  48 --
 arch/arm/configs/jornada720_defconfig         |   1 -
 arch/arm/configs/lart_defconfig               |  64 --
 arch/arm/configs/pleb_defconfig               |  53 --
 arch/arm/configs/pxa168_defconfig             |   3 -
 arch/arm/configs/pxa910_defconfig             |   2 -
 arch/arm/configs/shannon_defconfig            |  45 --
 arch/arm/configs/simpad_defconfig             | 100 ---
 arch/arm/mach-mmp/Kconfig                     |  96 ---
 arch/arm/mach-mmp/Makefile                    |  21 +-
 arch/arm/mach-mmp/aspenite.c                  | 284 --------
 arch/arm/mach-mmp/avengers_lite.c             |  55 --
 arch/arm/mach-mmp/brownstone.c                | 237 ------
 arch/arm/mach-mmp/common.c                    |   5 -
 arch/arm/mach-mmp/common.h                    |   2 -
 arch/arm/mach-mmp/devices.c                   | 359 ---------
 arch/arm/mach-mmp/devices.h                   |  57 --
 arch/arm/mach-mmp/flint.c                     | 131 ----
 arch/arm/mach-mmp/gplugd.c                    | 206 ------
 arch/arm/mach-mmp/irqs.h                      | 240 ------
 arch/arm/mach-mmp/jasper.c                    | 185 -----
 arch/arm/mach-mmp/mfp-mmp2.h                  | 396 ----------
 arch/arm/mach-mmp/mfp-pxa168.h                | 355 ---------
 arch/arm/mach-mmp/mfp-pxa910.h                | 170 -----
 arch/arm/mach-mmp/mfp.h                       |  35 -
 arch/arm/mach-mmp/mmp2.c                      | 175 -----
 arch/arm/mach-mmp/mmp2.h                      | 104 ---
 arch/arm/mach-mmp/pm-mmp2.c                   | 248 -------
 arch/arm/mach-mmp/pm-mmp2.h                   |  59 --
 arch/arm/mach-mmp/pm-pxa910.c                 | 272 -------
 arch/arm/mach-mmp/pm-pxa910.h                 |  75 --
 arch/arm/mach-mmp/pxa168.c                    | 175 -----
 arch/arm/mach-mmp/pxa168.h                    | 139 ----
 arch/arm/mach-mmp/pxa910.c                    | 190 -----
 arch/arm/mach-mmp/pxa910.h                    |  90 ---
 arch/arm/mach-mmp/regs-apbc.h                 |  19 -
 arch/arm/mach-mmp/regs-apmu.h                 |  28 -
 arch/arm/mach-mmp/regs-icu.h                  |  69 --
 arch/arm/mach-mmp/regs-timers.h               |   5 -
 arch/arm/mach-mmp/regs-usb.h                  | 155 ----
 arch/arm/mach-mmp/sram.c                      | 167 -----
 arch/arm/mach-mmp/teton_bga.c                 | 100 ---
 arch/arm/mach-mmp/teton_bga.h                 |  22 -
 arch/arm/mach-mmp/time.c                      |   9 +-
 arch/arm/mach-mmp/ttc_dkb.c                   | 315 --------
 arch/arm/mach-sa1100/Kconfig                  | 112 ---
 arch/arm/mach-sa1100/Makefile                 |  21 -
 arch/arm/mach-sa1100/assabet.c                |   1 -
 arch/arm/mach-sa1100/badge4.c                 | 338 ---------
 arch/arm/mach-sa1100/cerf.c                   | 181 -----
 arch/arm/mach-sa1100/collie.c                 |   1 -
 arch/arm/mach-sa1100/generic.c                |  32 -
 arch/arm/mach-sa1100/generic.h                |   4 -
 arch/arm/mach-sa1100/h3100.c                  | 140 ----
 arch/arm/mach-sa1100/h3600.c                  |   1 -
 arch/arm/mach-sa1100/hackkit.c                | 184 -----
 arch/arm/mach-sa1100/include/mach/badge4.h    |  71 --
 arch/arm/mach-sa1100/include/mach/cerf.h      |  20 -
 arch/arm/mach-sa1100/include/mach/generic.h   |   1 -
 .../arm/mach-sa1100/include/mach/nanoengine.h |  48 --
 arch/arm/mach-sa1100/include/mach/shannon.h   |  40 -
 arch/arm/mach-sa1100/include/mach/simpad.h    | 159 ----
 arch/arm/mach-sa1100/lart.c                   | 177 -----
 arch/arm/mach-sa1100/nanoengine.c             | 136 ----
 arch/arm/mach-sa1100/pci-nanoengine.c         | 191 -----
 arch/arm/mach-sa1100/pleb.c                   | 148 ----
 arch/arm/mach-sa1100/shannon.c                | 157 ----
 arch/arm/mach-sa1100/simpad.c                 | 423 -----------
 drivers/cpufreq/Kconfig                       |   2 +-
 drivers/cpufreq/Kconfig.arm                   |   3 -
 drivers/cpufreq/Makefile                      |   1 -
 drivers/cpufreq/sa1100-cpufreq.c              | 206 ------
 drivers/cpufreq/sa1110-cpufreq.c              |  38 +-
 drivers/dma/mmp_tdma.c                        |   7 +-
 drivers/mfd/Kconfig                           |   2 +-
 drivers/mtd/devices/Kconfig                   |   8 -
 drivers/mtd/devices/Makefile                  |   1 -
 drivers/mtd/devices/lart.c                    | 682 ------------------
 drivers/pcmcia/sa1100_generic.c               |   5 +-
 drivers/pcmcia/sa1100_h3600.c                 |   2 +-
 drivers/pcmcia/sa1111_generic.c               |   4 -
 drivers/usb/host/ohci-sa1111.c                |   5 +-
 drivers/video/fbdev/sa1100fb.c                |   1 -
 include/linux/platform_data/dma-mmp_tdma.h    |  36 -
 include/linux/platform_data/irda-sa11x0.h     |  17 -
 include/linux/soc/mmp/cputype.h               |  24 +-
 91 files changed, 43 insertions(+), 9352 deletions(-)
 delete mode 100644 arch/arm/configs/badge4_defconfig
 delete mode 100644 arch/arm/configs/cerfcube_defconfig
 delete mode 100644 arch/arm/configs/hackkit_defconfig
 delete mode 100644 arch/arm/configs/lart_defconfig
 delete mode 100644 arch/arm/configs/pleb_defconfig
 delete mode 100644 arch/arm/configs/shannon_defconfig
 delete mode 100644 arch/arm/configs/simpad_defconfig
 delete mode 100644 arch/arm/mach-mmp/aspenite.c
 delete mode 100644 arch/arm/mach-mmp/avengers_lite.c
 delete mode 100644 arch/arm/mach-mmp/brownstone.c
 delete mode 100644 arch/arm/mach-mmp/devices.c
 delete mode 100644 arch/arm/mach-mmp/devices.h
 delete mode 100644 arch/arm/mach-mmp/flint.c
 delete mode 100644 arch/arm/mach-mmp/gplugd.c
 delete mode 100644 arch/arm/mach-mmp/irqs.h
 delete mode 100644 arch/arm/mach-mmp/jasper.c
 delete mode 100644 arch/arm/mach-mmp/mfp-mmp2.h
 delete mode 100644 arch/arm/mach-mmp/mfp-pxa168.h
 delete mode 100644 arch/arm/mach-mmp/mfp-pxa910.h
 delete mode 100644 arch/arm/mach-mmp/mfp.h
 delete mode 100644 arch/arm/mach-mmp/mmp2.c
 delete mode 100644 arch/arm/mach-mmp/mmp2.h
 delete mode 100644 arch/arm/mach-mmp/pm-mmp2.c
 delete mode 100644 arch/arm/mach-mmp/pm-mmp2.h
 delete mode 100644 arch/arm/mach-mmp/pm-pxa910.c
 delete mode 100644 arch/arm/mach-mmp/pm-pxa910.h
 delete mode 100644 arch/arm/mach-mmp/pxa168.c
 delete mode 100644 arch/arm/mach-mmp/pxa168.h
 delete mode 100644 arch/arm/mach-mmp/pxa910.c
 delete mode 100644 arch/arm/mach-mmp/pxa910.h
 delete mode 100644 arch/arm/mach-mmp/regs-apbc.h
 delete mode 100644 arch/arm/mach-mmp/regs-apmu.h
 delete mode 100644 arch/arm/mach-mmp/regs-icu.h
 delete mode 100644 arch/arm/mach-mmp/regs-usb.h
 delete mode 100644 arch/arm/mach-mmp/sram.c
 delete mode 100644 arch/arm/mach-mmp/teton_bga.c
 delete mode 100644 arch/arm/mach-mmp/teton_bga.h
 delete mode 100644 arch/arm/mach-mmp/ttc_dkb.c
 delete mode 100644 arch/arm/mach-sa1100/badge4.c
 delete mode 100644 arch/arm/mach-sa1100/cerf.c
 delete mode 100644 arch/arm/mach-sa1100/h3100.c
 delete mode 100644 arch/arm/mach-sa1100/hackkit.c
 delete mode 100644 arch/arm/mach-sa1100/include/mach/badge4.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/cerf.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/generic.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/nanoengine.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/shannon.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/simpad.h
 delete mode 100644 arch/arm/mach-sa1100/lart.c
 delete mode 100644 arch/arm/mach-sa1100/nanoengine.c
 delete mode 100644 arch/arm/mach-sa1100/pci-nanoengine.c
 delete mode 100644 arch/arm/mach-sa1100/pleb.c
 delete mode 100644 arch/arm/mach-sa1100/shannon.c
 delete mode 100644 arch/arm/mach-sa1100/simpad.c
 delete mode 100644 drivers/cpufreq/sa1100-cpufreq.c
 delete mode 100644 drivers/mtd/devices/lart.c
 delete mode 100644 include/linux/platform_data/dma-mmp_tdma.h
 delete mode 100644 include/linux/platform_data/irda-sa11x0.h

-- 
2.29.2

