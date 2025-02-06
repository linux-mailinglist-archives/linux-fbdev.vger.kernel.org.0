Return-Path: <linux-fbdev+bounces-3709-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 085C4A2B2A2
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Feb 2025 20:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B450188BB44
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Feb 2025 19:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8BB1A76AC;
	Thu,  6 Feb 2025 19:47:33 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52249239571
	for <linux-fbdev@vger.kernel.org>; Thu,  6 Feb 2025 19:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.139.58.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871253; cv=none; b=m4JuJyAFfvobwyV/SqLdmRH6Ax5N/Uk4Cgg8UtYVdMV5VcsDUg2jxFjmijR6vHl+cVIzQT/nxgIc6gMJqpFF4VCWY1Oeg4wd7N8ZjdiWd/Rp8ei5KA51HebrTPdj9ohkTX2GsGrx5LW0zGkG/vinPGHGk5D1gah1WmpNs9ThfAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871253; c=relaxed/simple;
	bh=cw7PXwyKwp4GMAORIviZ7RpoJYZ/OukNEx2VO9AP6+U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=hMgOa7FM5mICnttLtIMcw/IP23XlQtPF4JR/+bRAho50m9EuHdFlq8YOFCMQE4E42poK+/KABAclKsE05bpNgTfxtYom1mUzCt/oWoKiaAzAzg2RRWdQp2GuxMIQFuOgLMP4yBevsTZlFs41Fz7aCMQ06AmjxD/Nt2WY9WiB4u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org; spf=pass smtp.mailfrom=c64.rulez.org; arc=none smtp.client-ip=79.139.58.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c64.rulez.org
Received: by c64.rulez.org (Postfix, from userid 1000)
	id CF9A2100FA; Thu,  6 Feb 2025 20:47:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by c64.rulez.org (Postfix) with ESMTP id CCDEA100F6;
	Thu,  6 Feb 2025 20:47:28 +0100 (CET)
Date: Thu, 6 Feb 2025 20:47:28 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 02/13] fbdev: core: Make fb_copyarea generic
Message-ID: <371d117-932d-f09d-acad-60ee9e49e7ed@c64.rulez.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII

fbdev: core: Make fb_copyarea generic

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
  drivers/video/fbdev/core/fb_copyarea.h | 144 +++++++++++--------------
  1 file changed, 63 insertions(+), 81 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_copyarea.h b/drivers/video/fbdev/core/fb_copyarea.h
index f266de119..4d7b1acd5 100644
--- a/drivers/video/fbdev/core/fb_copyarea.h
+++ b/drivers/video/fbdev/core/fb_copyarea.h
@@ -21,30 +21,15 @@
   *  the ones for filling, i.e. in aligned and unaligned versions. This would
   *  help moving some redundant computations and branches out of the loop, too.
   */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/fb.h>
-#include <asm/types.h>
-#include <asm/io.h>
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
       *  Generic bitwise copy algorithm
       */

  static void
-bitcpy(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
-                const unsigned long __iomem *src, unsigned src_idx, int bits,
+bitcpy(struct fb_info *p, unsigned long FB_MEM *dst, unsigned dst_idx,
+                const unsigned long FB_MEM *src, unsigned src_idx, int bits,
                  unsigned n, u32 bswapmask)
  {
          unsigned long first, last;
@@ -64,17 +49,17 @@ bitcpy(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
          last = ~fb_shifted_pixels_mask_long(p, (dst_idx+n) % bits, bswapmask);

          if (!shift) {
-                // Same alignment for source and dest
+                /* Same alignment for source and dest */

                  if (dst_idx+n <= bits) {
-                        // Single word
+                        /* Single word */
                          if (last)
                                  first &= last;
                          FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
                  } else {
-                        // Multiple destination words
+                        /* Multiple destination words */

-                        // Leading bits
+                        /* Leading bits */
                          if (first != ~0UL) {
                                  FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
                                  dst++;
@@ -82,7 +67,7 @@ bitcpy(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
                                  n -= bits - dst_idx;
                          }

-                        // Main chunk
+                        /* Main chunk */
                          n /= bits;
                          while (n >= 8) {
                                  FB_WRITEL(FB_READL(src++), dst++);
@@ -98,7 +83,7 @@ bitcpy(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
                          while (n--)
                                  FB_WRITEL(FB_READL(src++), dst++);

-                        // Trailing bits
+                        /* Trailing bits */
                          if (last)
                                  FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
                  }
@@ -111,19 +96,19 @@ bitcpy(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
                  int const right = -shift & (bits - 1);

                  if (dst_idx+n <= bits) {
-                        // Single destination word
+                        /* Single destination word */
                          if (last)
                                  first &= last;
                          d0 = FB_READL(src);
                          d0 = fb_rev_pixels_in_long(d0, bswapmask);
                          if (shift > 0) {
-                                // Single source word
+                                /* Single source word */
                                  d0 <<= left;
                          } else if (src_idx+n <= bits) {
-                                // Single source word
+                                /* Single source word */
                                  d0 >>= right;
                          } else {
-                                // 2 source words
+                                /* 2 source words */
                                  d1 = FB_READL(src + 1);
                                  d1 = fb_rev_pixels_in_long(d1, bswapmask);
                                  d0 = d0 >> right | d1 << left;
@@ -131,22 +116,23 @@ bitcpy(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
                          d0 = fb_rev_pixels_in_long(d0, bswapmask);
                          FB_WRITEL(comp(d0, FB_READL(dst), first), dst);
                  } else {
-                        // Multiple destination words
-                        /** We must always remember the last value read, because in case
-                        SRC and DST overlap bitwise (e.g. when moving just one pixel in
-                        1bpp), we always collect one full long for DST and that might
-                        overlap with the current long from SRC. We store this value in
-                        'd0'. */
+                        /* Multiple destination words */
+                        /** We must always remember the last value read,
+                            because in case SRC and DST overlap bitwise (e.g.
+                            when moving just one pixel in 1bpp), we always
+                            collect one full long for DST and that might
+                            overlap with the current long from SRC. We store
+                            this value in 'd0'. */
                          d0 = FB_READL(src++);
                          d0 = fb_rev_pixels_in_long(d0, bswapmask);
-                        // Leading bits
+                        /* Leading bits */
                          if (shift > 0) {
-                                // Single source word
+                                /* Single source word */
                                  d1 = d0;
                                  d0 <<= left;
                                  n -= bits - dst_idx;
                          } else {
-                                // 2 source words
+                                /* 2 source words */
                                  d1 = FB_READL(src++);
                                  d1 = fb_rev_pixels_in_long(d1, bswapmask);

@@ -158,7 +144,7 @@ bitcpy(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
                          d0 = d1;
                          dst++;

-                        // Main chunk
+                        /* Main chunk */
                          m = n % bits;
                          n /= bits;
                          while ((n >= 4) && !bswapmask) {
@@ -185,13 +171,13 @@ bitcpy(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
                                  d0 = d1;
                          }

-                        // Trailing bits
+                        /* Trailing bits */
                          if (m) {
                                  if (m <= bits - right) {
-                                        // Single source word
+                                        /* Single source word */
                                          d0 >>= right;
                                  } else {
-                                        // 2 source words
+                                        /* 2 source words */
                                          d1 = FB_READL(src);
                                          d1 = fb_rev_pixels_in_long(d1,
                                                                  bswapmask);
@@ -209,8 +195,8 @@ bitcpy(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
       */

  static void
-bitcpy_rev(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
-                const unsigned long __iomem *src, unsigned src_idx, int bits,
+bitcpy_rev(struct fb_info *p, unsigned long FB_MEM *dst, unsigned dst_idx,
+                const unsigned long FB_MEM *src, unsigned src_idx, int bits,
                  unsigned n, u32 bswapmask)
  {
          unsigned long first, last;
@@ -237,17 +223,17 @@ bitcpy_rev(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
          last = fb_shifted_pixels_mask_long(p, (bits + dst_idx + 1 - n) % bits, bswapmask);

          if (!shift) {
-                // Same alignment for source and dest
+                /* Same alignment for source and dest */

                  if ((unsigned long)dst_idx+1 >= n) {
-                        // Single word
+                        /* Single word */
                          if (first)
                                  last &= first;
                          FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
                  } else {
-                        // Multiple destination words
+                        /* Multiple destination words */

-                        // Leading bits
+                        /* Leading bits */
                          if (first) {
                                  FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
                                  dst--;
@@ -255,7 +241,7 @@ bitcpy_rev(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
                                  n -= dst_idx+1;
                          }

-                        // Main chunk
+                        /* Main chunk */
                          n /= bits;
                          while (n >= 8) {
                                  FB_WRITEL(FB_READL(src--), dst--);
@@ -271,12 +257,12 @@ bitcpy_rev(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
                          while (n--)
                                  FB_WRITEL(FB_READL(src--), dst--);

-                        // Trailing bits
+                        /* Trailing bits */
                          if (last != -1UL)
                                  FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
                  }
          } else {
-                // Different alignment for source and dest
+                /* Different alignment for source and dest */
                  unsigned long d0, d1;
                  int m;

@@ -284,18 +270,18 @@ bitcpy_rev(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
                  int const right = -shift & (bits-1);

                  if ((unsigned long)dst_idx+1 >= n) {
-                        // Single destination word
+                        /* Single destination word */
                          if (first)
                                  last &= first;
                          d0 = FB_READL(src);
                          if (shift < 0) {
-                                // Single source word
+                                /* Single source word */
                                  d0 >>= right;
                          } else if (1+(unsigned long)src_idx >= n) {
-                                // Single source word
+                                /* Single source word */
                                  d0 <<= left;
                          } else {
-                                // 2 source words
+                                /* 2 source words */
                                  d1 = FB_READL(src - 1);
                                  d1 = fb_rev_pixels_in_long(d1, bswapmask);
                                  d0 = d0 << left | d1 >> right;
@@ -303,22 +289,23 @@ bitcpy_rev(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
                          d0 = fb_rev_pixels_in_long(d0, bswapmask);
                          FB_WRITEL(comp(d0, FB_READL(dst), last), dst);
                  } else {
-                        // Multiple destination words
-                        /** We must always remember the last value read, because in case
-                        SRC and DST overlap bitwise (e.g. when moving just one pixel in
-                        1bpp), we always collect one full long for DST and that might
-                        overlap with the current long from SRC. We store this value in
-                        'd0'. */
+                        /* Multiple destination words */
+                        /** We must always remember the last value read,
+                            because in case SRC and DST overlap bitwise (e.g.
+                            when moving just one pixel in 1bpp), we always
+                            collect one full long for DST and that might
+                            overlap with the current long from SRC. We store
+                            this value in 'd0'. */

                          d0 = FB_READL(src--);
                          d0 = fb_rev_pixels_in_long(d0, bswapmask);
-                        // Leading bits
+                        /* Leading bits */
                          if (shift < 0) {
-                                // Single source word
+                                /* Single source word */
                                  d1 = d0;
                                  d0 >>= right;
                          } else {
-                                // 2 source words
+                                /* 2 source words */
                                  d1 = FB_READL(src--);
                                  d1 = fb_rev_pixels_in_long(d1, bswapmask);
                                  d0 = d0 << left | d1 >> right;
@@ -332,7 +319,7 @@ bitcpy_rev(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
                          dst--;
                          n -= dst_idx+1;

-                        // Main chunk
+                        /* Main chunk */
                          m = n % bits;
                          n /= bits;
                          while ((n >= 4) && !bswapmask) {
@@ -359,13 +346,13 @@ bitcpy_rev(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
                                  d0 = d1;
                          }

-                        // Trailing bits
+                        /* Trailing bits */
                          if (m) {
                                  if (m <= bits - left) {
-                                        // Single source word
+                                        /* Single source word */
                                          d0 <<= left;
                                  } else {
-                                        // 2 source words
+                                        /* 2 source words */
                                          d1 = FB_READL(src);
                                          d1 = fb_rev_pixels_in_long(d1,
                                                                  bswapmask);
@@ -378,12 +365,12 @@ bitcpy_rev(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
          }
  }

-void cfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
+void FB_COPYAREA(struct fb_info *p, const struct fb_copyarea *area)
  {
          u32 dx = area->dx, dy = area->dy, sx = area->sx, sy = area->sy;
          u32 height = area->height, width = area->width;
          unsigned int const bits_per_line = p->fix.line_length * 8u;
-        unsigned long __iomem *base = NULL;
+        unsigned long FB_MEM *base = NULL;
          int bits = BITS_PER_LONG, bytes = bits >> 3;
          unsigned dst_idx = 0, src_idx = 0, rev_copy = 0;
          u32 bswapmask = fb_compute_bswapmask(p);
@@ -391,8 +378,9 @@ void cfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
          if (p->state != FBINFO_STATE_RUNNING)
                  return;

-        if (p->flags & FBINFO_VIRTFB)
-                fb_warn_once(p, "Framebuffer is not in I/O address space.");
+        if ((p->flags & FBINFO_VIRTFB) != FB_SPACE)
+                fb_warn_once(p, "Framebuffer is not in " FB_SPACE_NAME
+                             " address space.");

          /* if the beginning of the target area might overlap with the end of
          the source area, be have to copy the area reverse. */
@@ -402,11 +390,11 @@ void cfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
                  rev_copy = 1;
          }

-        // split the base of the framebuffer into a long-aligned address and the
-        // index of the first bit
-        base = (unsigned long __iomem *)((unsigned long)p->screen_base & ~(bytes-1));
-        dst_idx = src_idx = 8*((unsigned long)p->screen_base & (bytes-1));
-        // add offset of source and target area
+        /* split the base of the framebuffer into a long-aligned address and
+           the index of the first bit */
+        base = (unsigned long FB_MEM *)((unsigned long)FB_SCREEN_BASE(p) & ~(bytes-1));
+        dst_idx = src_idx = 8*((unsigned long)FB_SCREEN_BASE(p) & (bytes-1));
+        /* add offset of source and target area */
          dst_idx += dy*bits_per_line + dx*p->var.bits_per_pixel;
          src_idx += sy*bits_per_line + sx*p->var.bits_per_pixel;

@@ -431,9 +419,3 @@ void cfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
                  }
          }
  }
-
-EXPORT_SYMBOL(cfb_copyarea);
-
-MODULE_AUTHOR("James Simmons <jsimmons@users.sf.net>");
-MODULE_DESCRIPTION("Generic software accelerated copyarea");
-MODULE_LICENSE("GPL");
-- 
2.30.2



