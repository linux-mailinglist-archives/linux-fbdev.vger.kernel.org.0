Return-Path: <linux-fbdev+bounces-3727-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB23A2BA21
	for <lists+linux-fbdev@lfdr.de>; Fri,  7 Feb 2025 05:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF3013A6085
	for <lists+linux-fbdev@lfdr.de>; Fri,  7 Feb 2025 04:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07691232363;
	Fri,  7 Feb 2025 04:20:28 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D121DE8B4
	for <linux-fbdev@vger.kernel.org>; Fri,  7 Feb 2025 04:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.139.58.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738902027; cv=none; b=QKKyPMNlZOy2Tpy1QDa0hDGbLv0CkK1ZhyIHK4Ul3S62FhH3IF4JdnRtwMxXzKD26sn3t5HH5uziZFemyTY/24FkXGS4W5IQOOiBqmRAUADiHYMhDXdLWCpPH2X4YcZGroHNfZfvyjXWzHCAMMwMoibyFn1NxpJve//htGGmbIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738902027; c=relaxed/simple;
	bh=9Fvp9MUX9ofVSdOlWpG61+swyMK9E7HCdb44HOojX0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V3HYKaskU7ihW71F95xpAG1vsNdxzOopUYofkcXSK1LDu7v0RRRWTNGl7uzHEOxWOla7lnwvZw4k/H7MN0lRPuGNIC9IkBtPYSXCrN2uA2FZW6tjEers26iI2rbQF0VW6efl/HTOKQdHQD9GPQ5TQ8gHfT9F4+KjlRiZi2A6NiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org; spf=pass smtp.mailfrom=c64.rulez.org; arc=none smtp.client-ip=79.139.58.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c64.rulez.org
Received: by c64.rulez.org (Postfix, from userid 1000)
	id 269E2105C9; Fri,  7 Feb 2025 05:19:52 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH RESEND 05/13] fbdev: core: Copy cfbfillrect to fb_fillrect
Date: Fri,  7 Feb 2025 05:18:10 +0100
Message-Id: <20250207041818.4031-6-soci@c64.rulez.org>
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
 drivers/video/fbdev/core/fb_fillrect.h | 374 +++++++++++++++++++++++++
 1 file changed, 374 insertions(+)
 create mode 100644 drivers/video/fbdev/core/fb_fillrect.h

diff --git a/drivers/video/fbdev/core/fb_fillrect.h b/drivers/video/fbdev/core/fb_fillrect.h
new file mode 100644
index 000000000..a3bef06ce
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_fillrect.h
@@ -0,0 +1,374 @@
+/*
+ *  Generic fillrect for frame buffers with packed pixels of any depth.
+ *
+ *      Copyright (C)  2000 James Simmons (jsimmons@linux-fbdev.org)
+ *
+ *  This file is subject to the terms and conditions of the GNU General Public
+ *  License.  See the file COPYING in the main directory of this archive for
+ *  more details.
+ *
+ * NOTES:
+ *
+ *  Also need to add code to deal with cards endians that are different than
+ *  the native cpu endians. I also need to deal with MSB position in the word.
+ *
+ */
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/fb.h>
+#include <asm/types.h>
+#include "fb_draw.h"
+
+#if BITS_PER_LONG == 32
+#  define FB_WRITEL fb_writel
+#  define FB_READL  fb_readl
+#else
+#  define FB_WRITEL fb_writeq
+#  define FB_READL  fb_readq
+#endif
+
+    /*
+     *  Aligned pattern fill using 32/64-bit memory accesses
+     */
+
+static void
+bitfill_aligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
+                unsigned long pat, unsigned n, int bits, u32 bswapmask)
+{
+        unsigned long first, last;
+
+        if (!n)
+                return;
+
+        first = fb_shifted_pixels_mask_long(p, dst_idx, bswapmask);
+        last = ~fb_shifted_pixels_mask_long(p, (dst_idx+n) % bits, bswapmask);
+
+        if (dst_idx+n <= bits) {
+                // Single word
+                if (last)
+                        first &= last;
+                FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
+        } else {
+                // Multiple destination words
+
+                // Leading bits
+                if (first!= ~0UL) {
+                        FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
+                        dst++;
+                        n -= bits - dst_idx;
+                }
+
+                // Main chunk
+                n /= bits;
+                while (n >= 8) {
+                        FB_WRITEL(pat, dst++);
+                        FB_WRITEL(pat, dst++);
+                        FB_WRITEL(pat, dst++);
+                        FB_WRITEL(pat, dst++);
+                        FB_WRITEL(pat, dst++);
+                        FB_WRITEL(pat, dst++);
+                        FB_WRITEL(pat, dst++);
+                        FB_WRITEL(pat, dst++);
+                        n -= 8;
+                }
+                while (n--)
+                        FB_WRITEL(pat, dst++);
+
+                // Trailing bits
+                if (last)
+                        FB_WRITEL(comp(pat, FB_READL(dst), last), dst);
+        }
+}
+
+
+    /*
+     *  Unaligned generic pattern fill using 32/64-bit memory accesses
+     *  The pattern must have been expanded to a full 32/64-bit value
+     *  Left/right are the appropriate shifts to convert to the pattern to be
+     *  used for the next 32/64-bit word
+     */
+
+static void
+bitfill_unaligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
+                  unsigned long pat, int left, int right, unsigned n, int bits)
+{
+        unsigned long first, last;
+
+        if (!n)
+                return;
+
+        first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
+        last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
+
+        if (dst_idx+n <= bits) {
+                // Single word
+                if (last)
+                        first &= last;
+                FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
+        } else {
+                // Multiple destination words
+                // Leading bits
+                if (first) {
+                        FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
+                        dst++;
+                        pat = pat << left | pat >> right;
+                        n -= bits - dst_idx;
+                }
+
+                // Main chunk
+                n /= bits;
+                while (n >= 4) {
+                        FB_WRITEL(pat, dst++);
+                        pat = pat << left | pat >> right;
+                        FB_WRITEL(pat, dst++);
+                        pat = pat << left | pat >> right;
+                        FB_WRITEL(pat, dst++);
+                        pat = pat << left | pat >> right;
+                        FB_WRITEL(pat, dst++);
+                        pat = pat << left | pat >> right;
+                        n -= 4;
+                }
+                while (n--) {
+                        FB_WRITEL(pat, dst++);
+                        pat = pat << left | pat >> right;
+                }
+
+                // Trailing bits
+                if (last)
+                        FB_WRITEL(comp(pat, FB_READL(dst), last), dst);
+        }
+}
+
+    /*
+     *  Aligned pattern invert using 32/64-bit memory accesses
+     */
+static void
+bitfill_aligned_rev(struct fb_info *p, unsigned long __iomem *dst,
+                    int dst_idx, unsigned long pat, unsigned n, int bits,
+                    u32 bswapmask)
+{
+        unsigned long val = pat, dat;
+        unsigned long first, last;
+
+        if (!n)
+                return;
+
+        first = fb_shifted_pixels_mask_long(p, dst_idx, bswapmask);
+        last = ~fb_shifted_pixels_mask_long(p, (dst_idx+n) % bits, bswapmask);
+
+        if (dst_idx+n <= bits) {
+                // Single word
+                if (last)
+                        first &= last;
+                dat = FB_READL(dst);
+                FB_WRITEL(comp(dat ^ val, dat, first), dst);
+        } else {
+                // Multiple destination words
+                // Leading bits
+                if (first!=0UL) {
+                        dat = FB_READL(dst);
+                        FB_WRITEL(comp(dat ^ val, dat, first), dst);
+                        dst++;
+                        n -= bits - dst_idx;
+                }
+
+                // Main chunk
+                n /= bits;
+                while (n >= 8) {
+                        FB_WRITEL(FB_READL(dst) ^ val, dst);
+                        dst++;
+                        FB_WRITEL(FB_READL(dst) ^ val, dst);
+                        dst++;
+                        FB_WRITEL(FB_READL(dst) ^ val, dst);
+                        dst++;
+                        FB_WRITEL(FB_READL(dst) ^ val, dst);
+                        dst++;
+                        FB_WRITEL(FB_READL(dst) ^ val, dst);
+                        dst++;
+                        FB_WRITEL(FB_READL(dst) ^ val, dst);
+                        dst++;
+                        FB_WRITEL(FB_READL(dst) ^ val, dst);
+                        dst++;
+                        FB_WRITEL(FB_READL(dst) ^ val, dst);
+                        dst++;
+                        n -= 8;
+                }
+                while (n--) {
+                        FB_WRITEL(FB_READL(dst) ^ val, dst);
+                        dst++;
+                }
+                // Trailing bits
+                if (last) {
+                        dat = FB_READL(dst);
+                        FB_WRITEL(comp(dat ^ val, dat, last), dst);
+                }
+        }
+}
+
+
+    /*
+     *  Unaligned generic pattern invert using 32/64-bit memory accesses
+     *  The pattern must have been expanded to a full 32/64-bit value
+     *  Left/right are the appropriate shifts to convert to the pattern to be
+     *  used for the next 32/64-bit word
+     */
+
+static void
+bitfill_unaligned_rev(struct fb_info *p, unsigned long __iomem *dst,
+                      int dst_idx, unsigned long pat, int left, int right,
+                      unsigned n, int bits)
+{
+        unsigned long first, last, dat;
+
+        if (!n)
+                return;
+
+        first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
+        last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
+
+        if (dst_idx+n <= bits) {
+                // Single word
+                if (last)
+                        first &= last;
+                dat = FB_READL(dst);
+                FB_WRITEL(comp(dat ^ pat, dat, first), dst);
+        } else {
+                // Multiple destination words
+
+                // Leading bits
+                if (first != 0UL) {
+                        dat = FB_READL(dst);
+                        FB_WRITEL(comp(dat ^ pat, dat, first), dst);
+                        dst++;
+                        pat = pat << left | pat >> right;
+                        n -= bits - dst_idx;
+                }
+
+                // Main chunk
+                n /= bits;
+                while (n >= 4) {
+                        FB_WRITEL(FB_READL(dst) ^ pat, dst);
+                        dst++;
+                        pat = pat << left | pat >> right;
+                        FB_WRITEL(FB_READL(dst) ^ pat, dst);
+                        dst++;
+                        pat = pat << left | pat >> right;
+                        FB_WRITEL(FB_READL(dst) ^ pat, dst);
+                        dst++;
+                        pat = pat << left | pat >> right;
+                        FB_WRITEL(FB_READL(dst) ^ pat, dst);
+                        dst++;
+                        pat = pat << left | pat >> right;
+                        n -= 4;
+                }
+                while (n--) {
+                        FB_WRITEL(FB_READL(dst) ^ pat, dst);
+                        dst++;
+                        pat = pat << left | pat >> right;
+                }
+
+                // Trailing bits
+                if (last) {
+                        dat = FB_READL(dst);
+                        FB_WRITEL(comp(dat ^ pat, dat, last), dst);
+                }
+        }
+}
+
+void cfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
+{
+        unsigned long pat, pat2, fg;
+        unsigned long width = rect->width, height = rect->height;
+        int bits = BITS_PER_LONG, bytes = bits >> 3;
+        u32 bpp = p->var.bits_per_pixel;
+        unsigned long __iomem *dst;
+        int dst_idx, left;
+
+        if (p->state != FBINFO_STATE_RUNNING)
+                return;
+
+        if (p->flags & FBINFO_VIRTFB)
+                fb_warn_once(p, "Framebuffer is not in I/O address space.");
+
+        if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
+            p->fix.visual == FB_VISUAL_DIRECTCOLOR )
+                fg = ((u32 *) (p->pseudo_palette))[rect->color];
+        else
+                fg = rect->color;
+
+        pat = pixel_to_pat(bpp, fg);
+
+        dst = (unsigned long __iomem *)((unsigned long)p->screen_base & ~(bytes-1));
+        dst_idx = ((unsigned long)p->screen_base & (bytes - 1))*8;
+        dst_idx += rect->dy*p->fix.line_length*8+rect->dx*bpp;
+        /* FIXME For now we support 1-32 bpp only */
+        left = bits % bpp;
+        if (p->fbops->fb_sync)
+                p->fbops->fb_sync(p);
+        if (!left) {
+                u32 bswapmask = fb_compute_bswapmask(p);
+                void (*fill_op32)(struct fb_info *p,
+                                  unsigned long __iomem *dst, int dst_idx,
+                                  unsigned long pat, unsigned n, int bits,
+                                  u32 bswapmask) = NULL;
+
+                switch (rect->rop) {
+                case ROP_XOR:
+                        fill_op32 = bitfill_aligned_rev;
+                        break;
+                case ROP_COPY:
+                        fill_op32 = bitfill_aligned;
+                        break;
+                default:
+                        printk( KERN_ERR "cfb_fillrect(): unknown rop, defaulting to ROP_COPY\n");
+                        fill_op32 = bitfill_aligned;
+                        break;
+                }
+                while (height--) {
+                        dst += dst_idx >> (ffs(bits) - 1);
+                        dst_idx &= (bits - 1);
+                        fill_op32(p, dst, dst_idx, pat, width*bpp, bits,
+                                  bswapmask);
+                        dst_idx += p->fix.line_length*8;
+                }
+        } else {
+                int right, r;
+                void (*fill_op)(struct fb_info *p, unsigned long __iomem *dst,
+                                int dst_idx, unsigned long pat, int left,
+                                int right, unsigned n, int bits) = NULL;
+#ifdef __LITTLE_ENDIAN
+                right = left;
+                left = bpp - right;
+#else
+                right = bpp - left;
+#endif
+                switch (rect->rop) {
+                case ROP_XOR:
+                        fill_op = bitfill_unaligned_rev;
+                        break;
+                case ROP_COPY:
+                        fill_op = bitfill_unaligned;
+                        break;
+                default:
+                        printk(KERN_ERR "cfb_fillrect(): unknown rop, defaulting to ROP_COPY\n");
+                        fill_op = bitfill_unaligned;
+                        break;
+                }
+                while (height--) {
+                        dst += dst_idx / bits;
+                        dst_idx &= (bits - 1);
+                        r = dst_idx % bpp;
+                        /* rotate pattern to the correct start position */
+                        pat2 = le_long_to_cpu(rolx(cpu_to_le_long(pat), r, bpp));
+                        fill_op(p, dst, dst_idx, pat2, left, right,
+                                width*bpp, bits);
+                        dst_idx += p->fix.line_length*8;
+                }
+        }
+}
+
+EXPORT_SYMBOL(cfb_fillrect);
+
+MODULE_AUTHOR("James Simmons <jsimmons@users.sf.net>");
+MODULE_DESCRIPTION("Generic software accelerated fill rectangle");
+MODULE_LICENSE("GPL");
-- 
2.30.2


