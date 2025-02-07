Return-Path: <linux-fbdev+bounces-3725-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10336A2BA1E
	for <lists+linux-fbdev@lfdr.de>; Fri,  7 Feb 2025 05:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F08771888D1C
	for <lists+linux-fbdev@lfdr.de>; Fri,  7 Feb 2025 04:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172EF231CAE;
	Fri,  7 Feb 2025 04:20:18 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2623B1DE8B4
	for <linux-fbdev@vger.kernel.org>; Fri,  7 Feb 2025 04:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.139.58.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738902018; cv=none; b=erD7yLLDamLr77rTlbjNHJUQDvBOzJZC96fTQRB/R+PraGRcgNSgmnaxxnAD9nCTnHdUIxWF/p83CN5bIWgE34/UcVimOKrtN7vJbvnsLdqDbegruBljP3BufFMqXHYsDJ8VA8RnD1rBmv3ZuqglJDAgIM1hflrqZ+/H4iWAEdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738902018; c=relaxed/simple;
	bh=mFtr4j2GEi+pHkWGAp2NORP4Wpr4BzYDX3tj6wGhAZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FRmAhwjY9Q+1LYkQJ2SUwx/NNVXU0vV6fpN4pug117cVv7OlR3kiX5aU3OhXo2cz4MR2n0UJsnqP7WJ9bIYht/ZfMpV8GBRILeH1MEMPlDgR8wSHYMVdjLknbZ4n0eOqIIzszfmkwMj3SuRU0EAjy2KH3R2+6XqqGIHV8eiKifc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org; spf=pass smtp.mailfrom=c64.rulez.org; arc=none smtp.client-ip=79.139.58.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c64.rulez.org
Received: by c64.rulez.org (Postfix, from userid 1000)
	id 1D65A101E4; Fri,  7 Feb 2025 05:19:52 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH RESEND 03/13] fbdev: core: Use generic copyarea for as cfb_copyarea
Date: Fri,  7 Feb 2025 05:18:08 +0100
Message-Id: <20250207041818.4031-4-soci@c64.rulez.org>
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
 drivers/video/fbdev/core/cfbcopyarea.c | 426 +------------------------
 1 file changed, 10 insertions(+), 416 deletions(-)

diff --git a/drivers/video/fbdev/core/cfbcopyarea.c b/drivers/video/fbdev/core/cfbcopyarea.c
index a271f57d9..ba0ebd115 100644
--- a/drivers/video/fbdev/core/cfbcopyarea.c
+++ b/drivers/video/fbdev/core/cfbcopyarea.c
@@ -7,434 +7,28 @@
  *  License.  See the file COPYING in the main directory of this archive for
  *  more details.
  *
- * NOTES:
- *
- *  This is for cfb packed pixels. Iplan and such are incorporated in the
- *  drivers that need them.
- *
- *  FIXME
- *
- *  Also need to add code to deal with cards endians that are different than
- *  the native cpu endians. I also need to deal with MSB position in the word.
- *
- *  The two functions or copying forward and backward could be split up like
- *  the ones for filling, i.e. in aligned and unaligned versions. This would
- *  help moving some redundant computations and branches out of the loop, too.
  */
 
 #include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
 #include <linux/fb.h>
 #include <asm/types.h>
-#include <asm/io.h>
-#include "fb_draw.h"
 
 #if BITS_PER_LONG == 32
-#  define FB_WRITEL fb_writel
-#  define FB_READL  fb_readl
+#  define FB_WRITEL       fb_writel
+#  define FB_READL        fb_readl
 #else
-#  define FB_WRITEL fb_writeq
-#  define FB_READL  fb_readq
-#endif
-
-    /*
-     *  Generic bitwise copy algorithm
-     */
-
-static void
-bitcpy(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
-		const unsigned long __iomem *src, unsigned src_idx, int bits,
-		unsigned n, u32 bswapmask)
-{
-	unsigned long first, last;
-	int const shift = dst_idx-src_idx;
-
-#if 0
-	/*
-	 * If you suspect bug in this function, compare it with this simple
-	 * memmove implementation.
-	 */
-	memmove((char *)dst + ((dst_idx & (bits - 1))) / 8,
-		(char *)src + ((src_idx & (bits - 1))) / 8, n / 8);
-	return;
-#endif
-
-	first = fb_shifted_pixels_mask_long(p, dst_idx, bswapmask);
-	last = ~fb_shifted_pixels_mask_long(p, (dst_idx+n) % bits, bswapmask);
-
-	if (!shift) {
-		// Same alignment for source and dest
-
-		if (dst_idx+n <= bits) {
-			// Single word
-			if (last)
-				first &= last;
-			FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
-		} else {
-			// Multiple destination words
-
-			// Leading bits
-			if (first != ~0UL) {
-				FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
-				dst++;
-				src++;
-				n -= bits - dst_idx;
-			}
-
-			// Main chunk
-			n /= bits;
-			while (n >= 8) {
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				n -= 8;
-			}
-			while (n--)
-				FB_WRITEL(FB_READL(src++), dst++);
-
-			// Trailing bits
-			if (last)
-				FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
-		}
-	} else {
-		/* Different alignment for source and dest */
-		unsigned long d0, d1;
-		int m;
-
-		int const left = shift & (bits - 1);
-		int const right = -shift & (bits - 1);
-
-		if (dst_idx+n <= bits) {
-			// Single destination word
-			if (last)
-				first &= last;
-			d0 = FB_READL(src);
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			if (shift > 0) {
-				// Single source word
-				d0 <<= left;
-			} else if (src_idx+n <= bits) {
-				// Single source word
-				d0 >>= right;
-			} else {
-				// 2 source words
-				d1 = FB_READL(src + 1);
-				d1 = fb_rev_pixels_in_long(d1, bswapmask);
-				d0 = d0 >> right | d1 << left;
-			}
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			FB_WRITEL(comp(d0, FB_READL(dst), first), dst);
-		} else {
-			// Multiple destination words
-			/** We must always remember the last value read, because in case
-			SRC and DST overlap bitwise (e.g. when moving just one pixel in
-			1bpp), we always collect one full long for DST and that might
-			overlap with the current long from SRC. We store this value in
-			'd0'. */
-			d0 = FB_READL(src++);
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			// Leading bits
-			if (shift > 0) {
-				// Single source word
-				d1 = d0;
-				d0 <<= left;
-				n -= bits - dst_idx;
-			} else {
-				// 2 source words
-				d1 = FB_READL(src++);
-				d1 = fb_rev_pixels_in_long(d1, bswapmask);
-
-				d0 = d0 >> right | d1 << left;
-				n -= bits - dst_idx;
-			}
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			FB_WRITEL(comp(d0, FB_READL(dst), first), dst);
-			d0 = d1;
-			dst++;
-
-			// Main chunk
-			m = n % bits;
-			n /= bits;
-			while ((n >= 4) && !bswapmask) {
-				d1 = FB_READL(src++);
-				FB_WRITEL(d0 >> right | d1 << left, dst++);
-				d0 = d1;
-				d1 = FB_READL(src++);
-				FB_WRITEL(d0 >> right | d1 << left, dst++);
-				d0 = d1;
-				d1 = FB_READL(src++);
-				FB_WRITEL(d0 >> right | d1 << left, dst++);
-				d0 = d1;
-				d1 = FB_READL(src++);
-				FB_WRITEL(d0 >> right | d1 << left, dst++);
-				d0 = d1;
-				n -= 4;
-			}
-			while (n--) {
-				d1 = FB_READL(src++);
-				d1 = fb_rev_pixels_in_long(d1, bswapmask);
-				d0 = d0 >> right | d1 << left;
-				d0 = fb_rev_pixels_in_long(d0, bswapmask);
-				FB_WRITEL(d0, dst++);
-				d0 = d1;
-			}
-
-			// Trailing bits
-			if (m) {
-				if (m <= bits - right) {
-					// Single source word
-					d0 >>= right;
-				} else {
-					// 2 source words
-					d1 = FB_READL(src);
-					d1 = fb_rev_pixels_in_long(d1,
-								bswapmask);
-					d0 = d0 >> right | d1 << left;
-				}
-				d0 = fb_rev_pixels_in_long(d0, bswapmask);
-				FB_WRITEL(comp(d0, FB_READL(dst), last), dst);
-			}
-		}
-	}
-}
-
-    /*
-     *  Generic bitwise copy algorithm, operating backward
-     */
-
-static void
-bitcpy_rev(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
-		const unsigned long __iomem *src, unsigned src_idx, int bits,
-		unsigned n, u32 bswapmask)
-{
-	unsigned long first, last;
-	int shift;
-
-#if 0
-	/*
-	 * If you suspect bug in this function, compare it with this simple
-	 * memmove implementation.
-	 */
-	memmove((char *)dst + ((dst_idx & (bits - 1))) / 8,
-		(char *)src + ((src_idx & (bits - 1))) / 8, n / 8);
-	return;
+#  define FB_WRITEL       fb_writeq
+#  define FB_READL        fb_readq
 #endif
-
-	dst += (dst_idx + n - 1) / bits;
-	src += (src_idx + n - 1) / bits;
-	dst_idx = (dst_idx + n - 1) % bits;
-	src_idx = (src_idx + n - 1) % bits;
-
-	shift = dst_idx-src_idx;
-
-	first = ~fb_shifted_pixels_mask_long(p, (dst_idx + 1) % bits, bswapmask);
-	last = fb_shifted_pixels_mask_long(p, (bits + dst_idx + 1 - n) % bits, bswapmask);
-
-	if (!shift) {
-		// Same alignment for source and dest
-
-		if ((unsigned long)dst_idx+1 >= n) {
-			// Single word
-			if (first)
-				last &= first;
-			FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
-		} else {
-			// Multiple destination words
-
-			// Leading bits
-			if (first) {
-				FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
-				dst--;
-				src--;
-				n -= dst_idx+1;
-			}
-
-			// Main chunk
-			n /= bits;
-			while (n >= 8) {
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				n -= 8;
-			}
-			while (n--)
-				FB_WRITEL(FB_READL(src--), dst--);
-
-			// Trailing bits
-			if (last != -1UL)
-				FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
-		}
-	} else {
-		// Different alignment for source and dest
-		unsigned long d0, d1;
-		int m;
-
-		int const left = shift & (bits-1);
-		int const right = -shift & (bits-1);
-
-		if ((unsigned long)dst_idx+1 >= n) {
-			// Single destination word
-			if (first)
-				last &= first;
-			d0 = FB_READL(src);
-			if (shift < 0) {
-				// Single source word
-				d0 >>= right;
-			} else if (1+(unsigned long)src_idx >= n) {
-				// Single source word
-				d0 <<= left;
-			} else {
-				// 2 source words
-				d1 = FB_READL(src - 1);
-				d1 = fb_rev_pixels_in_long(d1, bswapmask);
-				d0 = d0 << left | d1 >> right;
-			}
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			FB_WRITEL(comp(d0, FB_READL(dst), last), dst);
-		} else {
-			// Multiple destination words
-			/** We must always remember the last value read, because in case
-			SRC and DST overlap bitwise (e.g. when moving just one pixel in
-			1bpp), we always collect one full long for DST and that might
-			overlap with the current long from SRC. We store this value in
-			'd0'. */
-
-			d0 = FB_READL(src--);
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			// Leading bits
-			if (shift < 0) {
-				// Single source word
-				d1 = d0;
-				d0 >>= right;
-			} else {
-				// 2 source words
-				d1 = FB_READL(src--);
-				d1 = fb_rev_pixels_in_long(d1, bswapmask);
-				d0 = d0 << left | d1 >> right;
-			}
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			if (!first)
-				FB_WRITEL(d0, dst);
-			else
-				FB_WRITEL(comp(d0, FB_READL(dst), first), dst);
-			d0 = d1;
-			dst--;
-			n -= dst_idx+1;
-
-			// Main chunk
-			m = n % bits;
-			n /= bits;
-			while ((n >= 4) && !bswapmask) {
-				d1 = FB_READL(src--);
-				FB_WRITEL(d0 << left | d1 >> right, dst--);
-				d0 = d1;
-				d1 = FB_READL(src--);
-				FB_WRITEL(d0 << left | d1 >> right, dst--);
-				d0 = d1;
-				d1 = FB_READL(src--);
-				FB_WRITEL(d0 << left | d1 >> right, dst--);
-				d0 = d1;
-				d1 = FB_READL(src--);
-				FB_WRITEL(d0 << left | d1 >> right, dst--);
-				d0 = d1;
-				n -= 4;
-			}
-			while (n--) {
-				d1 = FB_READL(src--);
-				d1 = fb_rev_pixels_in_long(d1, bswapmask);
-				d0 = d0 << left | d1 >> right;
-				d0 = fb_rev_pixels_in_long(d0, bswapmask);
-				FB_WRITEL(d0, dst--);
-				d0 = d1;
-			}
-
-			// Trailing bits
-			if (m) {
-				if (m <= bits - left) {
-					// Single source word
-					d0 <<= left;
-				} else {
-					// 2 source words
-					d1 = FB_READL(src);
-					d1 = fb_rev_pixels_in_long(d1,
-								bswapmask);
-					d0 = d0 << left | d1 >> right;
-				}
-				d0 = fb_rev_pixels_in_long(d0, bswapmask);
-				FB_WRITEL(comp(d0, FB_READL(dst), last), dst);
-			}
-		}
-	}
-}
-
-void cfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
-{
-	u32 dx = area->dx, dy = area->dy, sx = area->sx, sy = area->sy;
-	u32 height = area->height, width = area->width;
-	unsigned int const bits_per_line = p->fix.line_length * 8u;
-	unsigned long __iomem *base = NULL;
-	int bits = BITS_PER_LONG, bytes = bits >> 3;
-	unsigned dst_idx = 0, src_idx = 0, rev_copy = 0;
-	u32 bswapmask = fb_compute_bswapmask(p);
-
-	if (p->state != FBINFO_STATE_RUNNING)
-		return;
-
-	if (p->flags & FBINFO_VIRTFB)
-		fb_warn_once(p, "Framebuffer is not in I/O address space.");
-
-	/* if the beginning of the target area might overlap with the end of
-	the source area, be have to copy the area reverse. */
-	if ((dy == sy && dx > sx) || (dy > sy)) {
-		dy += height;
-		sy += height;
-		rev_copy = 1;
-	}
-
-	// split the base of the framebuffer into a long-aligned address and the
-	// index of the first bit
-	base = (unsigned long __iomem *)((unsigned long)p->screen_base & ~(bytes-1));
-	dst_idx = src_idx = 8*((unsigned long)p->screen_base & (bytes-1));
-	// add offset of source and target area
-	dst_idx += dy*bits_per_line + dx*p->var.bits_per_pixel;
-	src_idx += sy*bits_per_line + sx*p->var.bits_per_pixel;
-
-	if (p->fbops->fb_sync)
-		p->fbops->fb_sync(p);
-
-	if (rev_copy) {
-		while (height--) {
-			dst_idx -= bits_per_line;
-			src_idx -= bits_per_line;
-			bitcpy_rev(p, base + (dst_idx / bits), dst_idx % bits,
-				base + (src_idx / bits), src_idx % bits, bits,
-				width*p->var.bits_per_pixel, bswapmask);
-		}
-	} else {
-		while (height--) {
-			bitcpy(p, base + (dst_idx / bits), dst_idx % bits,
-				base + (src_idx / bits), src_idx % bits, bits,
-				width*p->var.bits_per_pixel, bswapmask);
-			dst_idx += bits_per_line;
-			src_idx += bits_per_line;
-		}
-	}
-}
+#define FB_MEM            /* nothing */
+#define FB_COPYAREA       cfb_copyarea
+#define FB_SPACE          0
+#define FB_SPACE_NAME     "I/O"
+#define FB_SCREEN_BASE(a) ((a)->screen_base)
+#include "fb_copyarea.h"
 
 EXPORT_SYMBOL(cfb_copyarea);
 
 MODULE_AUTHOR("James Simmons <jsimmons@users.sf.net>");
 MODULE_DESCRIPTION("Generic software accelerated copyarea");
 MODULE_LICENSE("GPL");
-
-- 
2.30.2


