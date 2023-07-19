Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2402175959B
	for <lists+linux-fbdev@lfdr.de>; Wed, 19 Jul 2023 14:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbjGSMlm (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 19 Jul 2023 08:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbjGSMlU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 19 Jul 2023 08:41:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E88F1FDD;
        Wed, 19 Jul 2023 05:41:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E83F360B5E;
        Wed, 19 Jul 2023 12:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF51C433CB;
        Wed, 19 Jul 2023 12:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689770470;
        bh=DSbbxM7Nm5R08oXf4nrTJZNlLKLq0B901vQZguQIfaQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JJHmVL40dK/B5XyvTW4hIONjVHwXhHB1N1WMGvcOOAz3pkee5wcjjJ+HGuW5zSXgK
         hfWJ5V9HLYhQRtq764mXFMOqv+ulqXOU9TOt2KxYj3n2iZwuy5W8auMxzt5MSTbBlH
         WEJUG3agXHVtAAw0bstpk2cV0zlWodATGGh2nvqV1nRDiTgx3F4oaBCZw3bNjfiz/H
         ysuKpoa2UkvUmrYNxcs+p2NQw0t63dCxoQxHWOcoK7htztJiayK/IORWTl2FQ043Wp
         6nO9m8qlKti3zdrwEA3rl5cf4NjJ/OlxJ2+mOB75c56//SM+9c6EJgg7XA/IaN3pUP
         nxpli2y0BjzdA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Helge Deller <deller@gmx.de>,
        Javier Martinez Canillas <javierm@redhat.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Deepak Rawat <drawat.floss@gmail.com>,
        Dexuan Cui <decui@microsoft.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guo Ren <guoren@kernel.org>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Khalid Aziz <khalid@gonehiking.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        WANG Xuerui <kernel@xen0n.name>, Wei Liu <wei.liu@kernel.org>,
        Will Deacon <will@kernel.org>, x86@kernel.org,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-hyperv@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/9] vgacon: clean up global screen_info instances
Date:   Wed, 19 Jul 2023 14:39:41 +0200
Message-Id: <20230719123944.3438363-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719123944.3438363-1-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

To prepare for completely separating the VGA console screen_info from
the one used in EFI/sysfb, rename the vgacon instances and make them
local as much as possible.

ia64 and arm both have confurations with vgacon and efi, but the contents
never overlaps because ia64 has no EFI framebuffer, and arm only has
vga console on legacy platforms without EFI. Renaming these is required
before the EFI screen_info can be moved into drivers/firmware.

The ia64 vga console is actually registered in two places from
setup_arch(), but one of them is wrong, so drop the one in pcdp.c and
the fix the one in setup.c to use the correct conditional.

x86 has to keep them together, as the boot protocol is used to switch
between VGA text console and framebuffer through the screen_info data.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/kernel/proto.h         |  2 ++
 arch/alpha/kernel/setup.c         |  6 ++--
 arch/alpha/kernel/sys_sio.c       |  6 ++--
 arch/arm/include/asm/setup.h      |  5 ++++
 arch/arm/kernel/atags_parse.c     | 18 ++++++------
 arch/arm/kernel/efi.c             |  6 ----
 arch/arm/kernel/setup.c           | 10 +++++--
 arch/ia64/kernel/setup.c          | 49 +++++++++++++++----------------
 arch/mips/kernel/setup.c          | 11 -------
 arch/mips/mti-malta/malta-setup.c |  4 ++-
 arch/mips/sibyte/swarm/setup.c    | 24 ++++++++-------
 arch/mips/sni/setup.c             | 16 +++++-----
 drivers/firmware/pcdp.c           |  1 -
 13 files changed, 78 insertions(+), 80 deletions(-)

diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index 5816a31c1b386..2c89c1c557129 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/interrupt.h>
+#include <linux/screen_info.h>
 #include <linux/io.h>
 
 /* Prototypes of functions used across modules here in this directory.  */
@@ -113,6 +114,7 @@ extern int boot_cpuid;
 #ifdef CONFIG_VERBOSE_MCHECK
 extern unsigned long alpha_verbose_mcheck;
 #endif
+extern struct screen_info vgacon_screen_info;
 
 /* srmcons.c */
 #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index d73b685fe9852..7b35af2ed2787 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -138,7 +138,7 @@ static char __initdata command_line[COMMAND_LINE_SIZE];
  * code think we're on a VGA color display.
  */
 
-struct screen_info screen_info = {
+struct screen_info vgacon_screen_info = {
 	.orig_x = 0,
 	.orig_y = 25,
 	.orig_video_cols = 80,
@@ -146,8 +146,6 @@ struct screen_info screen_info = {
 	.orig_video_isVGA = 1,
 	.orig_video_points = 16
 };
-
-EXPORT_SYMBOL(screen_info);
 #endif
 
 /*
@@ -655,7 +653,7 @@ setup_arch(char **cmdline_p)
 
 #ifdef CONFIG_VT
 #if defined(CONFIG_VGA_CONSOLE)
-	vgacon_register_screen(&screen_info);
+	vgacon_register_screen(&vgacon_screen_info);
 #endif
 #endif
 
diff --git a/arch/alpha/kernel/sys_sio.c b/arch/alpha/kernel/sys_sio.c
index 7de8a5d2d2066..086488ed83a7f 100644
--- a/arch/alpha/kernel/sys_sio.c
+++ b/arch/alpha/kernel/sys_sio.c
@@ -60,9 +60,9 @@ alphabook1_init_arch(void)
 #ifdef CONFIG_VGA_CONSOLE
 	/* The AlphaBook1 has LCD video fixed at 800x600,
 	   37 rows and 100 cols. */
-	screen_info.orig_y = 37;
-	screen_info.orig_video_cols = 100;
-	screen_info.orig_video_lines = 37;
+	vgacon_screen_info.orig_y = 37;
+	vgacon_screen_info.orig_video_cols = 100;
+	vgacon_screen_info.orig_video_lines = 37;
 #endif
 
 	lca_init_arch();
diff --git a/arch/arm/include/asm/setup.h b/arch/arm/include/asm/setup.h
index 546af8b1e3f65..cc106f946c691 100644
--- a/arch/arm/include/asm/setup.h
+++ b/arch/arm/include/asm/setup.h
@@ -11,6 +11,7 @@
 #ifndef __ASMARM_SETUP_H
 #define __ASMARM_SETUP_H
 
+#include <linux/screen_info.h>
 #include <uapi/asm/setup.h>
 
 
@@ -35,4 +36,8 @@ void early_mm_init(const struct machine_desc *);
 void adjust_lowmem_bounds(void);
 void setup_dma_zone(const struct machine_desc *desc);
 
+#ifdef CONFIG_VGA_CONSOLE
+extern struct screen_info vgacon_screen_info;
+#endif
+
 #endif
diff --git a/arch/arm/kernel/atags_parse.c b/arch/arm/kernel/atags_parse.c
index 4c815da3b77b0..4ec591bde3dfa 100644
--- a/arch/arm/kernel/atags_parse.c
+++ b/arch/arm/kernel/atags_parse.c
@@ -72,15 +72,15 @@ __tagtable(ATAG_MEM, parse_tag_mem32);
 #if defined(CONFIG_ARCH_FOOTBRIDGE) && defined(CONFIG_VGA_CONSOLE)
 static int __init parse_tag_videotext(const struct tag *tag)
 {
-	screen_info.orig_x            = tag->u.videotext.x;
-	screen_info.orig_y            = tag->u.videotext.y;
-	screen_info.orig_video_page   = tag->u.videotext.video_page;
-	screen_info.orig_video_mode   = tag->u.videotext.video_mode;
-	screen_info.orig_video_cols   = tag->u.videotext.video_cols;
-	screen_info.orig_video_ega_bx = tag->u.videotext.video_ega_bx;
-	screen_info.orig_video_lines  = tag->u.videotext.video_lines;
-	screen_info.orig_video_isVGA  = tag->u.videotext.video_isvga;
-	screen_info.orig_video_points = tag->u.videotext.video_points;
+	vgacon_screen_info.orig_x            = tag->u.videotext.x;
+	vgacon_screen_info.orig_y            = tag->u.videotext.y;
+	vgacon_screen_info.orig_video_page   = tag->u.videotext.video_page;
+	vgacon_screen_info.orig_video_mode   = tag->u.videotext.video_mode;
+	vgacon_screen_info.orig_video_cols   = tag->u.videotext.video_cols;
+	vgacon_screen_info.orig_video_ega_bx = tag->u.videotext.video_ega_bx;
+	vgacon_screen_info.orig_video_lines  = tag->u.videotext.video_lines;
+	vgacon_screen_info.orig_video_isVGA  = tag->u.videotext.video_isvga;
+	vgacon_screen_info.orig_video_points = tag->u.videotext.video_points;
 	return 0;
 }
 
diff --git a/arch/arm/kernel/efi.c b/arch/arm/kernel/efi.c
index e94655ef16bb3..6f9ec7d28a710 100644
--- a/arch/arm/kernel/efi.c
+++ b/arch/arm/kernel/efi.c
@@ -123,12 +123,6 @@ void __init arm_efi_init(void)
 {
 	efi_init();
 
-	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI) {
-		/* dummycon on ARM needs non-zero values for columns/lines */
-		screen_info.orig_video_cols = 80;
-		screen_info.orig_video_lines = 25;
-	}
-
 	/* ARM does not permit early mappings to persist across paging_init() */
 	efi_memmap_unmap();
 
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 5d8a7fb3eba45..86c2751f56dcf 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -928,8 +928,8 @@ static void __init request_standard_resources(const struct machine_desc *mdesc)
 		request_resource(&ioport_resource, &lp2);
 }
 
-#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_EFI)
-struct screen_info screen_info = {
+#if defined(CONFIG_VGA_CONSOLE)
+static struct screen_info vgacon_screen_info = {
  .orig_video_lines	= 30,
  .orig_video_cols	= 80,
  .orig_video_mode	= 0,
@@ -939,6 +939,10 @@ struct screen_info screen_info = {
 };
 #endif
 
+#if defined(CONFIG_EFI)
+struct screen_info screen_info;
+#endif
+
 static int __init customize_machine(void)
 {
 	/*
@@ -1192,7 +1196,7 @@ void __init setup_arch(char **cmdline_p)
 
 #ifdef CONFIG_VT
 #if defined(CONFIG_VGA_CONSOLE)
-	vgacon_register_screen(&screen_info);
+	vgacon_register_screen(&vgacon_screen_info);
 #endif
 #endif
 
diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
index 2c9283fcd3759..82feae1323f40 100644
--- a/arch/ia64/kernel/setup.c
+++ b/arch/ia64/kernel/setup.c
@@ -86,7 +86,8 @@ EXPORT_SYMBOL(local_per_cpu_offset);
 #endif
 unsigned long ia64_cycles_per_usec;
 struct ia64_boot_param *ia64_boot_param;
-#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_EFI)
+#if defined(CONFIG_EFI)
+/* No longer used on ia64, but needed for linking */
 struct screen_info screen_info;
 #endif
 #ifdef CONFIG_VGA_CONSOLE
@@ -503,8 +504,9 @@ screen_info_setup(void)
 {
 #ifdef CONFIG_VGA_CONSOLE
 	unsigned int orig_x, orig_y, num_cols, num_rows, font_height;
+	static struct screen_info si;
 
-	memset(&screen_info, 0, sizeof(screen_info));
+	memset(&si, 0, sizeof(si));
 
 	if (!ia64_boot_param->console_info.num_rows ||
 	    !ia64_boot_param->console_info.num_cols) {
@@ -522,14 +524,26 @@ screen_info_setup(void)
 		font_height = 400 / num_rows;
 	}
 
-	screen_info.orig_x = orig_x;
-	screen_info.orig_y = orig_y;
-	screen_info.orig_video_cols  = num_cols;
-	screen_info.orig_video_lines = num_rows;
-	screen_info.orig_video_points = font_height;
-	screen_info.orig_video_mode = 3;	/* XXX fake */
-	screen_info.orig_video_isVGA = 1;	/* XXX fake */
-	screen_info.orig_video_ega_bx = 3;	/* XXX fake */
+	si.orig_x = orig_x;
+	si.orig_y = orig_y;
+	si.orig_video_cols  = num_cols;
+	si.orig_video_lines = num_rows;
+	si.orig_video_points = font_height;
+	si.orig_video_mode = 3;	/* XXX fake */
+	si.orig_video_isVGA = 1;	/* XXX fake */
+	si.orig_video_ega_bx = 3;	/* XXX fake */
+
+	if (!conswitchp) {
+		/*
+		 * Non-legacy systems may route legacy VGA MMIO range to system
+		 * memory.  vga_con probes the MMIO hole, so memory looks like
+		 * a VGA device to it.  The EFI memory map can tell us if it's
+		 * memory so we can avoid this problem.
+		 */
+		if (efi_mem_type(vga_console_membase + 0xA0000) !=
+		    EFI_CONVENTIONAL_MEMORY) {
+			vgacon_register_screen(&si);
+	}
 #endif
 }
 
@@ -609,21 +623,6 @@ setup_arch (char **cmdline_p)
 	cpu_init();	/* initialize the bootstrap CPU */
 	mmu_context_init();	/* initialize context_id bitmap */
 
-#ifdef CONFIG_VT
-	if (!conswitchp) {
-# if defined(CONFIG_VGA_CONSOLE)
-		/*
-		 * Non-legacy systems may route legacy VGA MMIO range to system
-		 * memory.  vga_con probes the MMIO hole, so memory looks like
-		 * a VGA device to it.  The EFI memory map can tell us if it's
-		 * memory so we can avoid this problem.
-		 */
-		if (efi_mem_type(0xA0000) != EFI_CONVENTIONAL_MEMORY)
-			vgacon_register_screen(&screen_info);
-# endif
-	}
-#endif
-
 	/* enable IA-64 Machine Check Abort Handling unless disabled */
 	if (!nomca)
 		ia64_mca_init();
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 6c3fae62a9f6b..cae181bbfee10 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -15,7 +15,6 @@
 #include <linux/delay.h>
 #include <linux/ioport.h>
 #include <linux/export.h>
-#include <linux/screen_info.h>
 #include <linux/memblock.h>
 #include <linux/initrd.h>
 #include <linux/root_dev.h>
@@ -54,10 +53,6 @@ struct cpuinfo_mips cpu_data[NR_CPUS] __read_mostly;
 
 EXPORT_SYMBOL(cpu_data);
 
-#ifdef CONFIG_VGA_CONSOLE
-struct screen_info screen_info;
-#endif
-
 /*
  * Setup information
  *
@@ -792,12 +787,6 @@ void __init setup_arch(char **cmdline_p)
 	if (IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
 		check_bugs64_early();
 
-#if defined(CONFIG_VT)
-#if defined(CONFIG_VGA_CONSOLE)
-	vgacon_register_screen(&screen_info);
-#endif
-#endif
-
 	arch_mem_init(cmdline_p);
 	dmi_setup();
 
diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
index 21cb3ac1237b7..3a2836e9d8566 100644
--- a/arch/mips/mti-malta/malta-setup.c
+++ b/arch/mips/mti-malta/malta-setup.c
@@ -161,7 +161,7 @@ static void __init pci_clock_check(void)
 #if defined(CONFIG_VT) && defined(CONFIG_VGA_CONSOLE)
 static void __init screen_info_setup(void)
 {
-	screen_info = (struct screen_info) {
+	static struct screen_info si = {
 		.orig_x = 0,
 		.orig_y = 25,
 		.ext_mem_k = 0,
@@ -175,6 +175,8 @@ static void __init screen_info_setup(void)
 		.orig_video_isVGA = VIDEO_TYPE_VGAC,
 		.orig_video_points = 16
 	};
+
+	vgacon_register_screen(&si);
 }
 #endif
 
diff --git a/arch/mips/sibyte/swarm/setup.c b/arch/mips/sibyte/swarm/setup.c
index 37df504d3ecbb..74e7c242b6902 100644
--- a/arch/mips/sibyte/swarm/setup.c
+++ b/arch/mips/sibyte/swarm/setup.c
@@ -112,6 +112,19 @@ int update_persistent_clock64(struct timespec64 now)
 	}
 }
 
+#ifdef CONFIG_VGA_CONSOLE
+static struct screen_info vgacon_screen_info = {
+	.orig_video_page	= 52,
+	.orig_video_mode	= 3,
+	.orig_video_cols	= 80,
+	.flags			= 12,
+	.orig_video_ega_bx	= 3,
+	.orig_video_lines	= 25,
+	.orig_video_isVGA	= 0x22,
+	.orig_video_points	= 16,
+};
+#endif
+
 void __init plat_mem_setup(void)
 {
 #ifdef CONFIG_SIBYTE_BCM1x80
@@ -130,16 +143,7 @@ void __init plat_mem_setup(void)
 		swarm_rtc_type = RTC_M41T81;
 
 #ifdef CONFIG_VGA_CONSOLE
-	screen_info = (struct screen_info) {
-		.orig_video_page	= 52,
-		.orig_video_mode	= 3,
-		.orig_video_cols	= 80,
-		.flags			= 12,
-		.orig_video_ega_bx	= 3,
-		.orig_video_lines	= 25,
-		.orig_video_isVGA	= 0x22,
-		.orig_video_points	= 16,
-       };
+	vgacon_register_screen(&vgacon_screen_info);
        /* XXXKW for CFE, get lines/cols from environment */
 #endif
 }
diff --git a/arch/mips/sni/setup.c b/arch/mips/sni/setup.c
index 9984cf91be7d0..42fdb939c88d8 100644
--- a/arch/mips/sni/setup.c
+++ b/arch/mips/sni/setup.c
@@ -39,18 +39,20 @@ extern void sni_machine_power_off(void);
 static void __init sni_display_setup(void)
 {
 #if defined(CONFIG_VGA_CONSOLE) && defined(CONFIG_FW_ARC)
-	struct screen_info *si = &screen_info;
+	static struct screen_info si;
 	DISPLAY_STATUS *di;
 
 	di = ArcGetDisplayStatus(1);
 
 	if (di) {
-		si->orig_x		= di->CursorXPosition;
-		si->orig_y		= di->CursorYPosition;
-		si->orig_video_cols	= di->CursorMaxXPosition;
-		si->orig_video_lines	= di->CursorMaxYPosition;
-		si->orig_video_isVGA	= VIDEO_TYPE_VGAC;
-		si->orig_video_points	= 16;
+		si.orig_x		= di->CursorXPosition;
+		si.orig_y		= di->CursorYPosition;
+		si.orig_video_cols	= di->CursorMaxXPosition;
+		si.orig_video_lines	= di->CursorMaxYPosition;
+		si.orig_video_isVGA	= VIDEO_TYPE_VGAC;
+		si.orig_video_points	= 16;
+
+		vgacon_register_screen(&si);
 	}
 #endif
 }
diff --git a/drivers/firmware/pcdp.c b/drivers/firmware/pcdp.c
index 667a595373b2d..876b3e9b37e25 100644
--- a/drivers/firmware/pcdp.c
+++ b/drivers/firmware/pcdp.c
@@ -72,7 +72,6 @@ setup_vga_console(struct pcdp_device *dev)
 		return -ENODEV;
 	}
 
-	vgacon_register_screen(&screen_info);
 	printk(KERN_INFO "PCDP: VGA console\n");
 	return 0;
 #else
-- 
2.39.2

