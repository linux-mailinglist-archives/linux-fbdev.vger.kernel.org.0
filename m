Return-Path: <linux-fbdev+bounces-3728-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E833EA2BA22
	for <lists+linux-fbdev@lfdr.de>; Fri,  7 Feb 2025 05:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BA421669D3
	for <lists+linux-fbdev@lfdr.de>; Fri,  7 Feb 2025 04:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B20232368;
	Fri,  7 Feb 2025 04:20:33 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952D11DE8B4
	for <linux-fbdev@vger.kernel.org>; Fri,  7 Feb 2025 04:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.139.58.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738902033; cv=none; b=re4D4BaJJZjhuUuO5/w8Mq6MHxWBsKk5oj0hZkeyQfOPaRLqJCL+qPdGckGrizmaHl/6CI87ZnJ7QX5x0RtvOyweDOqYovxWNJtQfiPWI/f744yHUAFDR2K0BKrA/Bfh5PvVbSjtUPvCzAhQrGw8GrzQ8XEtyy9x5zqVETeTEOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738902033; c=relaxed/simple;
	bh=YhaEnY/crm4S/eVZ/FZM9ol8JWIeOpV5f/Hyc1ONGQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ufaBRbZGDBP5CFZTNLPgM58LW5EtytS7PZnsip6DmyAmA+xuUQdNCWOkpXP5AtWXiHU8M1FGNUL8Ib6wGctVrRlF6fZZ1ABldAB3gOjtBK/sBaZkVV6i5Cx5yDQKN/ycHu6JFVvEtlDwWJgo8q7MLCsN2VJg6n+rq9n9EHQyJnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org; spf=pass smtp.mailfrom=c64.rulez.org; arc=none smtp.client-ip=79.139.58.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c64.rulez.org
Received: by c64.rulez.org (Postfix, from userid 1000)
	id 2D8CD105CA; Fri,  7 Feb 2025 05:19:52 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH RESEND 06/13] fbdev: core: Make fb_fillrect generic
Date: Fri,  7 Feb 2025 05:18:11 +0100
Message-Id: <20250207041818.4031-7-soci@c64.rulez.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250207041818.4031-1-soci@c64.rulez.org>
References: <20250207041818.4031-1-soci@c64.rulez.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
 drivers/video/fbdev/core/fb_fillrect.h | 89 +++++++++++---------------
 1 file changed, 37 insertions(+), 52 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_fillrect.h b/drivers/video/fbdev/core/fb_fillrect.h
index a3bef06ce..5f1123533 100644
--- a/drivers/video/fbdev/core/fb_fillrect.h
+++ b/drivers/video/fbdev/core/fb_fillrect.h
@@ -13,26 +13,14 @@
  *  the native cpu endians. I also need to deal with MSB position in the word.
  *
  */
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/fb.h>
-#include <asm/types.h>
 #include "fb_draw.h"
 
-#if BITS_PER_LONG == 32
-#  define FB_WRITEL fb_writel
-#  define FB_READL  fb_readl
-#else
-#  define FB_WRITEL fb_writeq
-#  define FB_READL  fb_readq
-#endif
-
     /*
      *  Aligned pattern fill using 32/64-bit memory accesses
      */
 
 static void
-bitfill_aligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
+bitfill_aligned(struct fb_info *p, unsigned long FB_MEM *dst, int dst_idx,
                 unsigned long pat, unsigned n, int bits, u32 bswapmask)
 {
         unsigned long first, last;
@@ -44,21 +32,21 @@ bitfill_aligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
         last = ~fb_shifted_pixels_mask_long(p, (dst_idx+n) % bits, bswapmask);
 
         if (dst_idx+n <= bits) {
-                // Single word
+                /* Single word */
                 if (last)
                         first &= last;
                 FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
         } else {
-                // Multiple destination words
+                /* Multiple destination words */
 
-                // Leading bits
+                /* Leading bits */
                 if (first!= ~0UL) {
                         FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
                         dst++;
                         n -= bits - dst_idx;
                 }
 
-                // Main chunk
+                /* Main chunk */
                 n /= bits;
                 while (n >= 8) {
                         FB_WRITEL(pat, dst++);
@@ -74,7 +62,7 @@ bitfill_aligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
                 while (n--)
                         FB_WRITEL(pat, dst++);
 
-                // Trailing bits
+                /* Trailing bits */
                 if (last)
                         FB_WRITEL(comp(pat, FB_READL(dst), last), dst);
         }
@@ -89,7 +77,7 @@ bitfill_aligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
      */
 
 static void
-bitfill_unaligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
+bitfill_unaligned(struct fb_info *p, unsigned long FB_MEM *dst, int dst_idx,
                   unsigned long pat, int left, int right, unsigned n, int bits)
 {
         unsigned long first, last;
@@ -101,13 +89,13 @@ bitfill_unaligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
         last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
 
         if (dst_idx+n <= bits) {
-                // Single word
+                /* Single word */
                 if (last)
                         first &= last;
                 FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
         } else {
-                // Multiple destination words
-                // Leading bits
+                /* Multiple destination words */
+                /* Leading bits */
                 if (first) {
                         FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
                         dst++;
@@ -115,7 +103,7 @@ bitfill_unaligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
                         n -= bits - dst_idx;
                 }
 
-                // Main chunk
+                /* Main chunk */
                 n /= bits;
                 while (n >= 4) {
                         FB_WRITEL(pat, dst++);
@@ -133,7 +121,7 @@ bitfill_unaligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
                         pat = pat << left | pat >> right;
                 }
 
-                // Trailing bits
+                /* Trailing bits */
                 if (last)
                         FB_WRITEL(comp(pat, FB_READL(dst), last), dst);
         }
@@ -143,7 +131,7 @@ bitfill_unaligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
      *  Aligned pattern invert using 32/64-bit memory accesses
      */
 static void
-bitfill_aligned_rev(struct fb_info *p, unsigned long __iomem *dst,
+bitfill_aligned_rev(struct fb_info *p, unsigned long FB_MEM *dst,
                     int dst_idx, unsigned long pat, unsigned n, int bits,
                     u32 bswapmask)
 {
@@ -157,14 +145,14 @@ bitfill_aligned_rev(struct fb_info *p, unsigned long __iomem *dst,
         last = ~fb_shifted_pixels_mask_long(p, (dst_idx+n) % bits, bswapmask);
 
         if (dst_idx+n <= bits) {
-                // Single word
+                /* Single word */
                 if (last)
                         first &= last;
                 dat = FB_READL(dst);
                 FB_WRITEL(comp(dat ^ val, dat, first), dst);
         } else {
-                // Multiple destination words
-                // Leading bits
+                /* Multiple destination words */
+                /* Leading bits */
                 if (first!=0UL) {
                         dat = FB_READL(dst);
                         FB_WRITEL(comp(dat ^ val, dat, first), dst);
@@ -172,7 +160,7 @@ bitfill_aligned_rev(struct fb_info *p, unsigned long __iomem *dst,
                         n -= bits - dst_idx;
                 }
 
-                // Main chunk
+                /* Main chunk */
                 n /= bits;
                 while (n >= 8) {
                         FB_WRITEL(FB_READL(dst) ^ val, dst);
@@ -197,7 +185,7 @@ bitfill_aligned_rev(struct fb_info *p, unsigned long __iomem *dst,
                         FB_WRITEL(FB_READL(dst) ^ val, dst);
                         dst++;
                 }
-                // Trailing bits
+                /* Trailing bits */
                 if (last) {
                         dat = FB_READL(dst);
                         FB_WRITEL(comp(dat ^ val, dat, last), dst);
@@ -214,7 +202,7 @@ bitfill_aligned_rev(struct fb_info *p, unsigned long __iomem *dst,
      */
 
 static void
-bitfill_unaligned_rev(struct fb_info *p, unsigned long __iomem *dst,
+bitfill_unaligned_rev(struct fb_info *p, unsigned long FB_MEM *dst,
                       int dst_idx, unsigned long pat, int left, int right,
                       unsigned n, int bits)
 {
@@ -227,15 +215,15 @@ bitfill_unaligned_rev(struct fb_info *p, unsigned long __iomem *dst,
         last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
 
         if (dst_idx+n <= bits) {
-                // Single word
+                /* Single word */
                 if (last)
                         first &= last;
                 dat = FB_READL(dst);
                 FB_WRITEL(comp(dat ^ pat, dat, first), dst);
         } else {
-                // Multiple destination words
+                /* Multiple destination words */
 
-                // Leading bits
+                /* Leading bits */
                 if (first != 0UL) {
                         dat = FB_READL(dst);
                         FB_WRITEL(comp(dat ^ pat, dat, first), dst);
@@ -244,7 +232,7 @@ bitfill_unaligned_rev(struct fb_info *p, unsigned long __iomem *dst,
                         n -= bits - dst_idx;
                 }
 
-                // Main chunk
+                /* Main chunk */
                 n /= bits;
                 while (n >= 4) {
                         FB_WRITEL(FB_READL(dst) ^ pat, dst);
@@ -267,7 +255,7 @@ bitfill_unaligned_rev(struct fb_info *p, unsigned long __iomem *dst,
                         pat = pat << left | pat >> right;
                 }
 
-                // Trailing bits
+                /* Trailing bits */
                 if (last) {
                         dat = FB_READL(dst);
                         FB_WRITEL(comp(dat ^ pat, dat, last), dst);
@@ -275,20 +263,21 @@ bitfill_unaligned_rev(struct fb_info *p, unsigned long __iomem *dst,
         }
 }
 
-void cfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
+void FB_FILLRECT(struct fb_info *p, const struct fb_fillrect *rect)
 {
         unsigned long pat, pat2, fg;
         unsigned long width = rect->width, height = rect->height;
         int bits = BITS_PER_LONG, bytes = bits >> 3;
         u32 bpp = p->var.bits_per_pixel;
-        unsigned long __iomem *dst;
+        unsigned long FB_MEM *dst;
         int dst_idx, left;
 
         if (p->state != FBINFO_STATE_RUNNING)
                 return;
 
-        if (p->flags & FBINFO_VIRTFB)
-                fb_warn_once(p, "Framebuffer is not in I/O address space.");
+        if ((p->flags & FBINFO_VIRTFB) != FB_SPACE)
+                fb_warn_once(p, "Framebuffer is not in " FB_SPACE_NAME
+                             " address space.");
 
         if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
             p->fix.visual == FB_VISUAL_DIRECTCOLOR )
@@ -298,8 +287,8 @@ void cfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
 
         pat = pixel_to_pat(bpp, fg);
 
-        dst = (unsigned long __iomem *)((unsigned long)p->screen_base & ~(bytes-1));
-        dst_idx = ((unsigned long)p->screen_base & (bytes - 1))*8;
+        dst = (unsigned long FB_MEM *)((unsigned long)FB_SCREEN_BASE(p) & ~(bytes-1));
+        dst_idx = ((unsigned long)FB_SCREEN_BASE(p) & (bytes - 1))*8;
         dst_idx += rect->dy*p->fix.line_length*8+rect->dx*bpp;
         /* FIXME For now we support 1-32 bpp only */
         left = bits % bpp;
@@ -308,7 +297,7 @@ void cfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
         if (!left) {
                 u32 bswapmask = fb_compute_bswapmask(p);
                 void (*fill_op32)(struct fb_info *p,
-                                  unsigned long __iomem *dst, int dst_idx,
+                                  unsigned long FB_MEM *dst, int dst_idx,
                                   unsigned long pat, unsigned n, int bits,
                                   u32 bswapmask) = NULL;
 
@@ -320,7 +309,8 @@ void cfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
                         fill_op32 = bitfill_aligned;
                         break;
                 default:
-                        printk( KERN_ERR "cfb_fillrect(): unknown rop, defaulting to ROP_COPY\n");
+                        printk( KERN_ERR FB_FILLRECT_NAME "(): unknown rop, "
+                                "defaulting to ROP_COPY\n");
                         fill_op32 = bitfill_aligned;
                         break;
                 }
@@ -333,7 +323,7 @@ void cfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
                 }
         } else {
                 int right, r;
-                void (*fill_op)(struct fb_info *p, unsigned long __iomem *dst,
+                void (*fill_op)(struct fb_info *p, unsigned long FB_MEM *dst,
                                 int dst_idx, unsigned long pat, int left,
                                 int right, unsigned n, int bits) = NULL;
 #ifdef __LITTLE_ENDIAN
@@ -350,7 +340,8 @@ void cfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
                         fill_op = bitfill_unaligned;
                         break;
                 default:
-                        printk(KERN_ERR "cfb_fillrect(): unknown rop, defaulting to ROP_COPY\n");
+                        printk(KERN_ERR FB_FILLRECT_NAME "(): unknown rop, "
+                                "defaulting to ROP_COPY\n");
                         fill_op = bitfill_unaligned;
                         break;
                 }
@@ -366,9 +357,3 @@ void cfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
                 }
         }
 }
-
-EXPORT_SYMBOL(cfb_fillrect);
-
-MODULE_AUTHOR("James Simmons <jsimmons@users.sf.net>");
-MODULE_DESCRIPTION("Generic software accelerated fill rectangle");
-MODULE_LICENSE("GPL");
-- 
2.30.2


