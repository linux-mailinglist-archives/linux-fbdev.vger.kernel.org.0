Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD51B70054C
	for <lists+linux-fbdev@lfdr.de>; Fri, 12 May 2023 12:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240822AbjELKZM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 12 May 2023 06:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240756AbjELKYz (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 12 May 2023 06:24:55 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205B91160A;
        Fri, 12 May 2023 03:24:51 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 8A46E2285C;
        Fri, 12 May 2023 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683887089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TsCcOGz5betxsl/z3gg1DELmwbMOiMUYFQ0FPGwVwok=;
        b=ckOic6Y9CZxZNqNruxJPc64gJXNyDImWkmR6oxIhC89WsX4d+Q7Rj/DdiQ75cODaEqCvga
        VL/AXgIllwXu0rl3QrEd855mo2hZ6ehYUNhPrCDzzWv0RKsv1uCLpdembpVdveseQe59sr
        hsveTVLmid82r8cqirHFQOLJVqkrCA8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683887089;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TsCcOGz5betxsl/z3gg1DELmwbMOiMUYFQ0FPGwVwok=;
        b=4DQaoZVnPVJqKMM5RAM0aiiI0GTW6uNcGd06Sc0n7MkQZMMaWwt6D/j2xT/Ptnq8wYyArm
        xGVbYEyk7nsXEqAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1103A13A0A;
        Fri, 12 May 2023 10:24:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id CKgzA/ETXmS5XwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 10:24:49 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com,
        daniel@ffwll.ch, vgupta@kernel.org, chenhuacai@kernel.org,
        kernel@xen0n.name, davem@davemloft.net,
        James.Bottomley@HansenPartnership.com, arnd@arndb.de,
        sam@ravnborg.org, suijingfeng@loongson.cn
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 7/7] fbdev: Rename fb_mem*() helpers
Date:   Fri, 12 May 2023 12:24:44 +0200
Message-Id: <20230512102444.5438-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512102444.5438-1-tzimmermann@suse.de>
References: <20230512102444.5438-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Update the names of the fb_mem*() helpers to be consistent with their
regular counterparts. Hence, fb_memset() now becomes fb_memset_io(),
fb_memcpy_fromfb() now becomes fb_memcpy_fromio() and fb_memcpy_tofb()
becomes fb_memcpy_toio(). No functional changes.

v6:
	* update new file fb_io_fops.c

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 arch/ia64/include/asm/fb.h              | 12 ++++++------
 arch/loongarch/include/asm/fb.h         | 12 ++++++------
 arch/sparc/include/asm/fb.h             | 12 ++++++------
 drivers/video/fbdev/aty/mach64_cursor.c |  2 +-
 drivers/video/fbdev/chipsfb.c           |  2 +-
 drivers/video/fbdev/core/fb_io_fops.c   |  4 ++--
 drivers/video/fbdev/kyro/fbdev.c        |  2 +-
 drivers/video/fbdev/pvr2fb.c            |  2 +-
 drivers/video/fbdev/sstfb.c             |  2 +-
 drivers/video/fbdev/stifb.c             |  4 ++--
 drivers/video/fbdev/tdfxfb.c            |  2 +-
 include/asm-generic/fb.h                | 16 ++++++++--------
 12 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/ia64/include/asm/fb.h b/arch/ia64/include/asm/fb.h
index bcf982043a5c..1717b26fd423 100644
--- a/arch/ia64/include/asm/fb.h
+++ b/arch/ia64/include/asm/fb.h
@@ -20,23 +20,23 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 }
 #define fb_pgprotect fb_pgprotect
 
-static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
 {
 	memcpy(to, (void __force *)from, n);
 }
-#define fb_memcpy_fromfb fb_memcpy_fromfb
+#define fb_memcpy_fromio fb_memcpy_fromio
 
-static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+static inline void fb_memcpy_toio(volatile void __iomem *to, const void *from, size_t n)
 {
 	memcpy((void __force *)to, from, n);
 }
-#define fb_memcpy_tofb fb_memcpy_tofb
+#define fb_memcpy_toio fb_memcpy_toio
 
-static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
 {
 	memset((void __force *)addr, c, n);
 }
-#define fb_memset fb_memset
+#define fb_memset fb_memset_io
 
 #include <asm-generic/fb.h>
 
diff --git a/arch/loongarch/include/asm/fb.h b/arch/loongarch/include/asm/fb.h
index c6fc7ef374a4..0b218b10a9ec 100644
--- a/arch/loongarch/include/asm/fb.h
+++ b/arch/loongarch/include/asm/fb.h
@@ -8,23 +8,23 @@
 #include <linux/compiler.h>
 #include <linux/string.h>
 
-static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
 {
 	memcpy(to, (void __force *)from, n);
 }
-#define fb_memcpy_fromfb fb_memcpy_fromfb
+#define fb_memcpy_fromio fb_memcpy_fromio
 
-static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+static inline void fb_memcpy_toio(volatile void __iomem *to, const void *from, size_t n)
 {
 	memcpy((void __force *)to, from, n);
 }
-#define fb_memcpy_tofb fb_memcpy_tofb
+#define fb_memcpy_toio fb_memcpy_toio
 
-static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
 {
 	memset((void __force *)addr, c, n);
 }
-#define fb_memset fb_memset
+#define fb_memset fb_memset_io
 
 #include <asm-generic/fb.h>
 
diff --git a/arch/sparc/include/asm/fb.h b/arch/sparc/include/asm/fb.h
index 077da91aeba1..572ecd3e1cc4 100644
--- a/arch/sparc/include/asm/fb.h
+++ b/arch/sparc/include/asm/fb.h
@@ -18,23 +18,23 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 int fb_is_primary_device(struct fb_info *info);
 #define fb_is_primary_device fb_is_primary_device
 
-static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
 {
 	sbus_memcpy_fromio(to, from, n);
 }
-#define fb_memcpy_fromfb fb_memcpy_fromfb
+#define fb_memcpy_fromio fb_memcpy_fromio
 
-static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+static inline void fb_memcpy_toio(volatile void __iomem *to, const void *from, size_t n)
 {
 	sbus_memcpy_toio(to, from, n);
 }
-#define fb_memcpy_tofb fb_memcpy_tofb
+#define fb_memcpy_toio fb_memcpy_toio
 
-static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
 {
 	sbus_memset_io(addr, c, n);
 }
-#define fb_memset fb_memset
+#define fb_memset fb_memset_io
 
 #include <asm-generic/fb.h>
 
diff --git a/drivers/video/fbdev/aty/mach64_cursor.c b/drivers/video/fbdev/aty/mach64_cursor.c
index 4ad0331a8c57..971355c2cd7e 100644
--- a/drivers/video/fbdev/aty/mach64_cursor.c
+++ b/drivers/video/fbdev/aty/mach64_cursor.c
@@ -153,7 +153,7 @@ static int atyfb_cursor(struct fb_info *info, struct fb_cursor *cursor)
 	    u8 m, b;
 
 	    // Clear cursor image with 1010101010...
-	    fb_memset(dst, 0xaa, 1024);
+	    fb_memset_io(dst, 0xaa, 1024);
 
 	    offset = align - width*2;
 
diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index 7799d52a651f..2a27ba94f652 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -332,7 +332,7 @@ static const struct fb_var_screeninfo chipsfb_var = {
 
 static void init_chips(struct fb_info *p, unsigned long addr)
 {
-	fb_memset(p->screen_base, 0, 0x100000);
+	fb_memset_io(p->screen_base, 0, 0x100000);
 
 	p->fix = chipsfb_fix;
 	p->fix.smem_start = addr;
diff --git a/drivers/video/fbdev/core/fb_io_fops.c b/drivers/video/fbdev/core/fb_io_fops.c
index f5299d50f33b..5985e5e1b040 100644
--- a/drivers/video/fbdev/core/fb_io_fops.c
+++ b/drivers/video/fbdev/core/fb_io_fops.c
@@ -42,7 +42,7 @@ ssize_t fb_io_read(struct fb_info *info, char __user *buf, size_t count, loff_t
 	while (count) {
 		c  = (count > PAGE_SIZE) ? PAGE_SIZE : count;
 		dst = buffer;
-		fb_memcpy_fromfb(dst, src, c);
+		fb_memcpy_fromio(dst, src, c);
 		dst += c;
 		src += c;
 
@@ -117,7 +117,7 @@ ssize_t fb_io_write(struct fb_info *info, const char __user *buf, size_t count,
 		}
 		c -= trailing;
 
-		fb_memcpy_tofb(dst, src, c);
+		fb_memcpy_toio(dst, src, c);
 		dst += c;
 		src += c;
 		*ppos += c;
diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 0596573ef140..3f277bdb3a32 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -737,7 +737,7 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			       info->var.bits_per_pixel);
 	size *= info->var.yres_virtual;
 
-	fb_memset(info->screen_base, 0, size);
+	fb_memset_io(info->screen_base, 0, size);
 
 	if (register_framebuffer(info) < 0)
 		goto out_unmap;
diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index 550fdb5b4d41..c692cd597ce3 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -801,7 +801,7 @@ static int __maybe_unused pvr2fb_common_init(void)
 		goto out_err;
 	}
 
-	fb_memset(fb_info->screen_base, 0, pvr2_fix.smem_len);
+	fb_memset_io(fb_info->screen_base, 0, pvr2_fix.smem_len);
 
 	pvr2_fix.ypanstep	= nopan  ? 0 : 1;
 	pvr2_fix.ywrapstep	= nowrap ? 0 : 1;
diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index da296b2ab54a..582324f5d869 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -335,7 +335,7 @@ static int sst_calc_pll(const int freq, int *freq_out, struct pll_timing *t)
 static void sstfb_clear_screen(struct fb_info *info)
 {
 	/* clear screen */
-	fb_memset(info->screen_base, 0, info->fix.smem_len);
+	fb_memset_io(info->screen_base, 0, info->fix.smem_len);
 }
 
 
diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index baca6974e288..01363dccfdaf 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -527,8 +527,8 @@ rattlerSetupPlanes(struct stifb_info *fb)
 	fb->id = saved_id;
 
 	for (y = 0; y < fb->info.var.yres; ++y)
-		fb_memset(fb->info.screen_base + y * fb->info.fix.line_length,
-			0xff, fb->info.var.xres * fb->info.var.bits_per_pixel/8);
+		fb_memset_io(fb->info.screen_base + y * fb->info.fix.line_length,
+			     0xff, fb->info.var.xres * fb->info.var.bits_per_pixel/8);
 
 	CRX24_SET_OVLY_MASK(fb);
 	SETUP_FB(fb);
diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index d17e5e1472aa..cdf8e9fe9948 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -1116,7 +1116,7 @@ static int tdfxfb_cursor(struct fb_info *info, struct fb_cursor *cursor)
 		u8 *mask = (u8 *)cursor->mask;
 		int i;
 
-		fb_memset(cursorbase, 0, 1024);
+		fb_memset_io(cursorbase, 0, 1024);
 
 		for (i = 0; i < cursor->image.height; i++) {
 			int h = 0;
diff --git a/include/asm-generic/fb.h b/include/asm-generic/fb.h
index 0540eccdbeca..bb7ee9c70e60 100644
--- a/include/asm-generic/fb.h
+++ b/include/asm-generic/fb.h
@@ -108,28 +108,28 @@ static inline void fb_writeq(u64 b, volatile void __iomem *addr)
 #endif
 #endif
 
-#ifndef fb_memcpy_fromfb
-static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+#ifndef fb_memcpy_fromio
+static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
 {
 	memcpy_fromio(to, from, n);
 }
-#define fb_memcpy_fromfb fb_memcpy_fromfb
+#define fb_memcpy_fromio fb_memcpy_fromio
 #endif
 
-#ifndef fb_memcpy_tofb
-static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+#ifndef fb_memcpy_toio
+static inline void fb_memcpy_toio(volatile void __iomem *to, const void *from, size_t n)
 {
 	memcpy_toio(to, from, n);
 }
-#define fb_memcpy_tofb fb_memcpy_tofb
+#define fb_memcpy_toio fb_memcpy_toio
 #endif
 
 #ifndef fb_memset
-static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
 {
 	memset_io(addr, c, n);
 }
-#define fb_memset fb_memset
+#define fb_memset fb_memset_io
 #endif
 
 #endif /* __ASM_GENERIC_FB_H_ */
-- 
2.40.1

