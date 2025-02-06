Return-Path: <linux-fbdev+bounces-3715-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B64C0A2B2B0
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Feb 2025 20:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72351885CBC
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Feb 2025 19:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E991ACECD;
	Thu,  6 Feb 2025 19:52:32 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686AE1ACECB
	for <linux-fbdev@vger.kernel.org>; Thu,  6 Feb 2025 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.139.58.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871552; cv=none; b=N8xLKqhsIsmaDs6S0TxPlIngq+LoE7f+Kr0iO9oJy+W9YUuvCnI63JCLkoMQopJg3CjSebHIET2wQEeWn75g7p3GvT3ttmDfSEqYWt4aTW/KhESK+Jj0UKin37GTwcDLheL5qh38nyO6NNd4MU6PZ5fULTeWj59oSvtcmKO7+dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871552; c=relaxed/simple;
	bh=KEwQW6hBcJr6V40s1wEyMklz3JL485B9hZSFYt3pHSE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=cqK5y5dsXWaP8EnnQmi5VMAn3f1hYgrQorlh24sgkzrKE5WBZQxz7IJS8ogoKOtph8AILRe30DomS14SF71jLuXZA+Kw/nSa2F+ROkFwXgFNmF5cqYk/IGAMvZaAs5K/OzKLXWoGpzpln0L5qJR7pBjuBhxeZb6jLHVgArmV9VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org; spf=pass smtp.mailfrom=c64.rulez.org; arc=none smtp.client-ip=79.139.58.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c64.rulez.org
Received: by c64.rulez.org (Postfix, from userid 1000)
	id CFE17100FA; Thu,  6 Feb 2025 20:52:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by c64.rulez.org (Postfix) with ESMTP id CE8C0100F6;
	Thu,  6 Feb 2025 20:52:28 +0100 (CET)
Date: Thu, 6 Feb 2025 20:52:28 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 08/13] fbdev: core: Use generic fillrect for as
 sys_fillrect
Message-ID: <8dacc89-9b2b-28e7-1e51-6d66d09b5f6c@c64.rulez.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII

fbdev: core: Use generic fillrect for as sys_fillrect

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
  drivers/video/fbdev/core/sysfillrect.c | 314 +------------------------
  1 file changed, 9 insertions(+), 305 deletions(-)

diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
index e49221a88..48d0f0efb 100644
--- a/drivers/video/fbdev/core/sysfillrect.c
+++ b/drivers/video/fbdev/core/sysfillrect.c
@@ -12,314 +12,18 @@
   *  more details.
   */
  #include <linux/module.h>
-#include <linux/string.h>
  #include <linux/fb.h>
  #include <asm/types.h>
-#include "fb_draw.h"

-    /*
-     *  Aligned pattern fill using 32/64-bit memory accesses
-     */
-
-static void
-bitfill_aligned(struct fb_info *p, unsigned long *dst, int dst_idx,
-		unsigned long pat, unsigned n, int bits)
-{
-	unsigned long first, last;
-
-	if (!n)
-		return;
-
-	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
-	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
-
-	if (dst_idx+n <= bits) {
-		/* Single word */
-		if (last)
-			first &= last;
-		*dst = comp(pat, *dst, first);
-	} else {
-		/* Multiple destination words */
-
-		/* Leading bits */
- 		if (first!= ~0UL) {
-			*dst = comp(pat, *dst, first);
-			dst++;
-			n -= bits - dst_idx;
-		}
-
-		/* Main chunk */
-		n /= bits;
-		memset_l(dst, pat, n);
-		dst += n;
-
-		/* Trailing bits */
-		if (last)
-			*dst = comp(pat, *dst, last);
-	}
-}
-
-
-    /*
-     *  Unaligned generic pattern fill using 32/64-bit memory accesses
-     *  The pattern must have been expanded to a full 32/64-bit value
-     *  Left/right are the appropriate shifts to convert to the pattern to be
-     *  used for the next 32/64-bit word
-     */
-
-static void
-bitfill_unaligned(struct fb_info *p, unsigned long *dst, int dst_idx,
-		  unsigned long pat, int left, int right, unsigned n, int bits)
-{
-	unsigned long first, last;
-
-	if (!n)
-		return;
-
-	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
-	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
-
-	if (dst_idx+n <= bits) {
-		/* Single word */
-		if (last)
-			first &= last;
-		*dst = comp(pat, *dst, first);
-	} else {
-		/* Multiple destination words */
-		/* Leading bits */
-		if (first) {
-			*dst = comp(pat, *dst, first);
-			dst++;
-			pat = pat << left | pat >> right;
-			n -= bits - dst_idx;
-		}
-
-		/* Main chunk */
-		n /= bits;
-		while (n >= 4) {
-			*dst++ = pat;
-			pat = pat << left | pat >> right;
-			*dst++ = pat;
-			pat = pat << left | pat >> right;
-			*dst++ = pat;
-			pat = pat << left | pat >> right;
-			*dst++ = pat;
-			pat = pat << left | pat >> right;
-			n -= 4;
-		}
-		while (n--) {
-			*dst++ = pat;
-			pat = pat << left | pat >> right;
-		}
-
-		/* Trailing bits */
-		if (last)
-			*dst = comp(pat, *dst, last);
-	}
-}
-
-    /*
-     *  Aligned pattern invert using 32/64-bit memory accesses
-     */
-static void
-bitfill_aligned_rev(struct fb_info *p, unsigned long *dst, int dst_idx,
-		    unsigned long pat, unsigned n, int bits)
-{
-	unsigned long val = pat;
-	unsigned long first, last;
-
-	if (!n)
-		return;
-
-	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
-	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
-
-	if (dst_idx+n <= bits) {
-		/* Single word */
-		if (last)
-			first &= last;
-		*dst = comp(*dst ^ val, *dst, first);
-	} else {
-		/* Multiple destination words */
-		/* Leading bits */
-		if (first!=0UL) {
-			*dst = comp(*dst ^ val, *dst, first);
-			dst++;
-			n -= bits - dst_idx;
-		}
-
-		/* Main chunk */
-		n /= bits;
-		while (n >= 8) {
-			*dst++ ^= val;
-			*dst++ ^= val;
-			*dst++ ^= val;
-			*dst++ ^= val;
-			*dst++ ^= val;
-			*dst++ ^= val;
-			*dst++ ^= val;
-			*dst++ ^= val;
-			n -= 8;
-		}
-		while (n--)
-			*dst++ ^= val;
-		/* Trailing bits */
-		if (last)
-			*dst = comp(*dst ^ val, *dst, last);
-	}
-}
-
-
-    /*
-     *  Unaligned generic pattern invert using 32/64-bit memory accesses
-     *  The pattern must have been expanded to a full 32/64-bit value
-     *  Left/right are the appropriate shifts to convert to the pattern to be
-     *  used for the next 32/64-bit word
-     */
-
-static void
-bitfill_unaligned_rev(struct fb_info *p, unsigned long *dst, int dst_idx,
-		      unsigned long pat, int left, int right, unsigned n,
-		      int bits)
-{
-	unsigned long first, last;
-
-	if (!n)
-		return;
-
-	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
-	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
-
-	if (dst_idx+n <= bits) {
-		/* Single word */
-		if (last)
-			first &= last;
-		*dst = comp(*dst ^ pat, *dst, first);
-	} else {
-		/* Multiple destination words */
-
-		/* Leading bits */
-		if (first != 0UL) {
-			*dst = comp(*dst ^ pat, *dst, first);
-			dst++;
-			pat = pat << left | pat >> right;
-			n -= bits - dst_idx;
-		}
-
-		/* Main chunk */
-		n /= bits;
-		while (n >= 4) {
-			*dst++ ^= pat;
-			pat = pat << left | pat >> right;
-			*dst++ ^= pat;
-			pat = pat << left | pat >> right;
-			*dst++ ^= pat;
-			pat = pat << left | pat >> right;
-			*dst++ ^= pat;
-			pat = pat << left | pat >> right;
-			n -= 4;
-		}
-		while (n--) {
-			*dst ^= pat;
-			pat = pat << left | pat >> right;
-		}
-
-		/* Trailing bits */
-		if (last)
-			*dst = comp(*dst ^ pat, *dst, last);
-	}
-}
-
-void sys_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
-{
-	unsigned long pat, pat2, fg;
-	unsigned long width = rect->width, height = rect->height;
-	int bits = BITS_PER_LONG, bytes = bits >> 3;
-	u32 bpp = p->var.bits_per_pixel;
-	unsigned long *dst;
-	int dst_idx, left;
-
-	if (p->state != FBINFO_STATE_RUNNING)
-		return;
-
-	if (!(p->flags & FBINFO_VIRTFB))
-		fb_warn_once(p, "Framebuffer is not in virtual address space.");
-
-	if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
-	    p->fix.visual == FB_VISUAL_DIRECTCOLOR )
-		fg = ((u32 *) (p->pseudo_palette))[rect->color];
-	else
-		fg = rect->color;
-
-	pat = pixel_to_pat( bpp, fg);
-
-	dst = (unsigned long *)((unsigned long)p->screen_base & ~(bytes-1));
-	dst_idx = ((unsigned long)p->screen_base & (bytes - 1))*8;
-	dst_idx += rect->dy*p->fix.line_length*8+rect->dx*bpp;
-	/* FIXME For now we support 1-32 bpp only */
-	left = bits % bpp;
-	if (p->fbops->fb_sync)
-		p->fbops->fb_sync(p);
-	if (!left) {
-		void (*fill_op32)(struct fb_info *p, unsigned long *dst,
-				  int dst_idx, unsigned long pat, unsigned n,
-				  int bits) = NULL;
-
-		switch (rect->rop) {
-		case ROP_XOR:
-			fill_op32 = bitfill_aligned_rev;
-			break;
-		case ROP_COPY:
-			fill_op32 = bitfill_aligned;
-			break;
-		default:
-			printk( KERN_ERR "cfb_fillrect(): unknown rop, "
-				"defaulting to ROP_COPY\n");
-			fill_op32 = bitfill_aligned;
-			break;
-		}
-		while (height--) {
-			dst += dst_idx >> (ffs(bits) - 1);
-			dst_idx &= (bits - 1);
-			fill_op32(p, dst, dst_idx, pat, width*bpp, bits);
-			dst_idx += p->fix.line_length*8;
-		}
-	} else {
-		int right, r;
-		void (*fill_op)(struct fb_info *p, unsigned long *dst,
-				int dst_idx, unsigned long pat, int left,
-				int right, unsigned n, int bits) = NULL;
-#ifdef __LITTLE_ENDIAN
-		right = left;
-		left = bpp - right;
-#else
-		right = bpp - left;
-#endif
-		switch (rect->rop) {
-		case ROP_XOR:
-			fill_op = bitfill_unaligned_rev;
-			break;
-		case ROP_COPY:
-			fill_op = bitfill_unaligned;
-			break;
-		default:
-			printk(KERN_ERR "sys_fillrect(): unknown rop, "
-				"defaulting to ROP_COPY\n");
-			fill_op = bitfill_unaligned;
-			break;
-		}
-		while (height--) {
-			dst += dst_idx / bits;
-			dst_idx &= (bits - 1);
-			r = dst_idx % bpp;
-			/* rotate pattern to the correct start position */
-			pat2 = le_long_to_cpu(rolx(cpu_to_le_long(pat), r, bpp));
-			fill_op(p, dst, dst_idx, pat2, left, right,
-				width*bpp, bits);
-			dst_idx += p->fix.line_length*8;
-		}
-	}
-}
+#define FB_READL(a)       (*a)
+#define FB_WRITEL(a,b)    do { *(b) = (a); } while (false)
+#define FB_MEM            /* nothing */
+#define FB_FILLRECT       sys_fillrect
+#define FB_FILLRECT_NAME  "sys_fillrect"
+#define FB_SPACE          FBINFO_VIRTFB
+#define FB_SPACE_NAME     "virtual"
+#define FB_SCREEN_BASE(a) ((a)->screen_buffer)
+#include "fb_fillrect.h"

  EXPORT_SYMBOL(sys_fillrect);

-- 
2.30.2


