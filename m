Return-Path: <linux-fbdev+bounces-3719-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 324D2A2B2BA
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Feb 2025 20:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 173D6188B2A9
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Feb 2025 19:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781421ACEDD;
	Thu,  6 Feb 2025 19:55:41 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74B91ACECD
	for <linux-fbdev@vger.kernel.org>; Thu,  6 Feb 2025 19:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.139.58.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871741; cv=none; b=RcnYaJuR5namgtkXQ6NVgyt+tDFnHJQZZVm6LcOeKzvLEv7vwTNKucAnS3HtL6OLzCH0EUT7szm3rHM/7tohsWAvz9u4Y2M16AIzSiPGhb4Qmko6gvnsaRBWbx0N2LA6ycyAKNf1KPQ6qGCEHdGv19q3PB/qf+MIzKevbkmu3Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871741; c=relaxed/simple;
	bh=A6NL/ODGX8eyjmSZnYEAaJurRWvwkYk+vZx3uAirDLs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=CIcgRHbv4zVe7i0X9ZHTf3QQRcA7Wg5bf2GP0+V1SyJ6J3UYAQ0Xe7Sj/SuohGycZ2IyWt23EhX69N8QGbJp9qwhkEVsTzENUVo4+uaccpAdD87lNFk4+SGIdpWvW6l0B/SrKw528jmobv5TGs5Mz0rHfAzy6SE2350RZJ93B84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org; spf=pass smtp.mailfrom=c64.rulez.org; arc=none smtp.client-ip=79.139.58.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c64.rulez.org
Received: by c64.rulez.org (Postfix, from userid 1000)
	id 1FFD8100FA; Thu,  6 Feb 2025 20:55:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by c64.rulez.org (Postfix) with ESMTP id 1F43B100F6;
	Thu,  6 Feb 2025 20:55:37 +0100 (CET)
Date: Thu, 6 Feb 2025 20:55:37 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 12/13] fbdev: core: Use generic imageblit for as
 sys_imageblit
Message-ID: <ca72ab75-6817-7486-fb53-d6219df2b679@c64.rulez.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII

fbdev: core: Use generic imageblit for as sys_imageblit

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
  drivers/video/fbdev/core/sysimgblt.c | 325 +--------------------------
  1 file changed, 8 insertions(+), 317 deletions(-)

diff --git a/drivers/video/fbdev/core/sysimgblt.c b/drivers/video/fbdev/core/sysimgblt.c
index 6949bbd51..6e60e3486 100644
--- a/drivers/video/fbdev/core/sysimgblt.c
+++ b/drivers/video/fbdev/core/sysimgblt.c
@@ -11,329 +11,20 @@
   *  more details.
   */
  #include <linux/module.h>
-#include <linux/string.h>
  #include <linux/fb.h>
  #include <asm/types.h>

-#define DEBUG
-
-#ifdef DEBUG
-#define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt,__func__,## args)
-#else
-#define DPRINTK(fmt, args...)
-#endif
-
-static const u32 cfb_tab8_be[] = {
-    0x00000000,0x000000ff,0x0000ff00,0x0000ffff,
-    0x00ff0000,0x00ff00ff,0x00ffff00,0x00ffffff,
-    0xff000000,0xff0000ff,0xff00ff00,0xff00ffff,
-    0xffff0000,0xffff00ff,0xffffff00,0xffffffff
-};
-
-static const u32 cfb_tab8_le[] = {
-    0x00000000,0xff000000,0x00ff0000,0xffff0000,
-    0x0000ff00,0xff00ff00,0x00ffff00,0xffffff00,
-    0x000000ff,0xff0000ff,0x00ff00ff,0xffff00ff,
-    0x0000ffff,0xff00ffff,0x00ffffff,0xffffffff
-};
-
-static const u32 cfb_tab16_be[] = {
-    0x00000000, 0x0000ffff, 0xffff0000, 0xffffffff
-};
-
-static const u32 cfb_tab16_le[] = {
-    0x00000000, 0xffff0000, 0x0000ffff, 0xffffffff
-};
-
-static const u32 cfb_tab32[] = {
-	0x00000000, 0xffffffff
-};
-
-static void color_imageblit(const struct fb_image *image, struct fb_info *p,
-			    void *dst1, u32 start_index, u32 pitch_index)
-{
-	/* Draw the penguin */
-	u32 *dst, *dst2;
-	u32 color = 0, val, shift;
-	int i, n, bpp = p->var.bits_per_pixel;
-	u32 null_bits = 32 - bpp;
-	u32 *palette = (u32 *) p->pseudo_palette;
-	const u8 *src = image->data;
-
-	dst2 = dst1;
-	for (i = image->height; i--; ) {
-		n = image->width;
-		dst = dst1;
-		shift = 0;
-		val = 0;
-
-		if (start_index) {
-			u32 start_mask = ~(FB_SHIFT_HIGH(p, ~(u32)0,
-							 start_index));
-			val = *dst & start_mask;
-			shift = start_index;
-		}
-		while (n--) {
-			if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
-			    p->fix.visual == FB_VISUAL_DIRECTCOLOR )
-				color = palette[*src];
-			else
-				color = *src;
-			color <<= FB_LEFT_POS(p, bpp);
-			val |= FB_SHIFT_HIGH(p, color, shift);
-			if (shift >= null_bits) {
-				*dst++ = val;
-
-				val = (shift == null_bits) ? 0 :
-					FB_SHIFT_LOW(p, color, 32 - shift);
-			}
-			shift += bpp;
-			shift &= (32 - 1);
-			src++;
-		}
-		if (shift) {
-			u32 end_mask = FB_SHIFT_HIGH(p, ~(u32)0, shift);
-
-			*dst &= end_mask;
-			*dst |= val;
-		}
-		dst1 += p->fix.line_length;
-		if (pitch_index) {
-			dst2 += p->fix.line_length;
-			dst1 = (u8 *)((long)dst2 & ~(sizeof(u32) - 1));
-
-			start_index += pitch_index;
-			start_index &= 32 - 1;
-		}
-	}
-}
-
-static void slow_imageblit(const struct fb_image *image, struct fb_info *p,
-				  void *dst1, u32 fgcolor, u32 bgcolor,
-				  u32 start_index, u32 pitch_index)
-{
-	u32 shift, color = 0, bpp = p->var.bits_per_pixel;
-	u32 *dst, *dst2;
-	u32 val, pitch = p->fix.line_length;
-	u32 null_bits = 32 - bpp;
-	u32 spitch = (image->width+7)/8;
-	const u8 *src = image->data, *s;
-	u32 i, j, l;
-
-	dst2 = dst1;
-	fgcolor <<= FB_LEFT_POS(p, bpp);
-	bgcolor <<= FB_LEFT_POS(p, bpp);
-
-	for (i = image->height; i--; ) {
-		shift = val = 0;
-		l = 8;
-		j = image->width;
-		dst = dst1;
-		s = src;
-
-		/* write leading bits */
-		if (start_index) {
-			u32 start_mask = ~(FB_SHIFT_HIGH(p, ~(u32)0,
-							 start_index));
-			val = *dst & start_mask;
-			shift = start_index;
-		}
-
-		while (j--) {
-			l--;
-			color = (*s & (1 << l)) ? fgcolor : bgcolor;
-			val |= FB_SHIFT_HIGH(p, color, shift);
-
-			/* Did the bitshift spill bits to the next long? */
-			if (shift >= null_bits) {
-				*dst++ = val;
-				val = (shift == null_bits) ? 0 :
-					FB_SHIFT_LOW(p, color, 32 - shift);
-			}
-			shift += bpp;
-			shift &= (32 - 1);
-			if (!l) { l = 8; s++; }
-		}
-
-		/* write trailing bits */
- 		if (shift) {
-			u32 end_mask = FB_SHIFT_HIGH(p, ~(u32)0, shift);
-
-			*dst &= end_mask;
-			*dst |= val;
-		}
-
-		dst1 += pitch;
-		src += spitch;
-		if (pitch_index) {
-			dst2 += pitch;
-			dst1 = (u8 *)((long)dst2 & ~(sizeof(u32) - 1));
-			start_index += pitch_index;
-			start_index &= 32 - 1;
-		}
-
-	}
-}
-
-/*
- * fast_imageblit - optimized monochrome color expansion
- *
- * Only if:  bits_per_pixel == 8, 16, or 32
- *           image->width is divisible by pixel/dword (ppw);
- *           fix->line_legth is divisible by 4;
- *           beginning and end of a scanline is dword aligned
- */
-static void fast_imageblit(const struct fb_image *image, struct fb_info *p,
-				  void *dst1, u32 fgcolor, u32 bgcolor)
-{
-	u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
-	u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
-	u32 bit_mask, eorx, shift;
-	const u8 *s = image->data, *src;
-	u32 *dst;
-	const u32 *tab;
-	size_t tablen;
-	u32 colortab[16];
-	int i, j, k;
-
-	switch (bpp) {
-	case 8:
-		tab = fb_be_math(p) ? cfb_tab8_be : cfb_tab8_le;
-		tablen = 16;
-		break;
-	case 16:
-		tab = fb_be_math(p) ? cfb_tab16_be : cfb_tab16_le;
-		tablen = 4;
-		break;
-	case 32:
-		tab = cfb_tab32;
-		tablen = 2;
-		break;
-	default:
-		return;
-	}
-
-	for (i = ppw-1; i--; ) {
-		fgx <<= bpp;
-		bgx <<= bpp;
-		fgx |= fgcolor;
-		bgx |= bgcolor;
-	}
-
-	bit_mask = (1 << ppw) - 1;
-	eorx = fgx ^ bgx;
-	k = image->width/ppw;
-
-	for (i = 0; i < tablen; ++i)
-		colortab[i] = (tab[i] & eorx) ^ bgx;
-
-	for (i = image->height; i--; ) {
-		dst = dst1;
-		shift = 8;
-		src = s;
-
-		/*
-		 * Manually unroll the per-line copying loop for better
-		 * performance. This works until we processed the last
-		 * completely filled source byte (inclusive).
-		 */
-		switch (ppw) {
-		case 4: /* 8 bpp */
-			for (j = k; j >= 2; j -= 2, ++src) {
-				*dst++ = colortab[(*src >> 4) & bit_mask];
-				*dst++ = colortab[(*src >> 0) & bit_mask];
-			}
-			break;
-		case 2: /* 16 bpp */
-			for (j = k; j >= 4; j -= 4, ++src) {
-				*dst++ = colortab[(*src >> 6) & bit_mask];
-				*dst++ = colortab[(*src >> 4) & bit_mask];
-				*dst++ = colortab[(*src >> 2) & bit_mask];
-				*dst++ = colortab[(*src >> 0) & bit_mask];
-			}
-			break;
-		case 1: /* 32 bpp */
-			for (j = k; j >= 8; j -= 8, ++src) {
-				*dst++ = colortab[(*src >> 7) & bit_mask];
-				*dst++ = colortab[(*src >> 6) & bit_mask];
-				*dst++ = colortab[(*src >> 5) & bit_mask];
-				*dst++ = colortab[(*src >> 4) & bit_mask];
-				*dst++ = colortab[(*src >> 3) & bit_mask];
-				*dst++ = colortab[(*src >> 2) & bit_mask];
-				*dst++ = colortab[(*src >> 1) & bit_mask];
-				*dst++ = colortab[(*src >> 0) & bit_mask];
-			}
-			break;
-		}
-
-		/*
-		 * For image widths that are not a multiple of 8, there
-		 * are trailing pixels left on the current line. Print
-		 * them as well.
-		 */
-		for (; j--; ) {
-			shift -= ppw;
-			*dst++ = colortab[(*src >> shift) & bit_mask];
-			if (!shift) {
-				shift = 8;
-				++src;
-			}
-		}
-
-		dst1 += p->fix.line_length;
-		s += spitch;
-	}
-}
-
-void sys_imageblit(struct fb_info *p, const struct fb_image *image)
-{
-	u32 fgcolor, bgcolor, start_index, bitstart, pitch_index = 0;
-	u32 bpl = sizeof(u32), bpp = p->var.bits_per_pixel;
-	u32 width = image->width;
-	u32 dx = image->dx, dy = image->dy;
-	void *dst1;
-
-	if (p->state != FBINFO_STATE_RUNNING)
-		return;
-
-	if (!(p->flags & FBINFO_VIRTFB))
-		fb_warn_once(p, "Framebuffer is not in virtual address space.");
-
-	bitstart = (dy * p->fix.line_length * 8) + (dx * bpp);
-	start_index = bitstart & (32 - 1);
-	pitch_index = (p->fix.line_length & (bpl - 1)) * 8;
-
-	bitstart /= 8;
-	bitstart &= ~(bpl - 1);
-	dst1 = (void __force *)p->screen_base + bitstart;
-
-	if (p->fbops->fb_sync)
-		p->fbops->fb_sync(p);
-
-	if (image->depth == 1) {
-		if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
-		    p->fix.visual == FB_VISUAL_DIRECTCOLOR) {
-			fgcolor = ((u32*)(p->pseudo_palette))[image->fg_color];
-			bgcolor = ((u32*)(p->pseudo_palette))[image->bg_color];
-		} else {
-			fgcolor = image->fg_color;
-			bgcolor = image->bg_color;
-		}
-
-		if (32 % bpp == 0 && !start_index && !pitch_index &&
-		    ((width & (32/bpp-1)) == 0) &&
-		    bpp >= 8 && bpp <= 32)
-			fast_imageblit(image, p, dst1, fgcolor, bgcolor);
-		else
-			slow_imageblit(image, p, dst1, fgcolor, bgcolor,
-					start_index, pitch_index);
-	} else
-		color_imageblit(image, p, dst1, start_index, pitch_index);
-}
+#define FB_READL(a)       (*a)
+#define FB_WRITEL(a,b)    do { *(b) = (a); } while (false)
+#define FB_MEM            /* nothing */
+#define FB_IMAGEBLIT      sys_imageblit
+#define FB_SPACE          FBINFO_VIRTFB
+#define FB_SPACE_NAME     "virtual"
+#define FB_SCREEN_BASE(a) ((a)->screen_buffer)
+#include "fb_imageblit.h"

  EXPORT_SYMBOL(sys_imageblit);

  MODULE_AUTHOR("Antonino Daplas <adaplas@pol.net>");
  MODULE_DESCRIPTION("1-bit/8-bit to 1-32 bit color expansion (sys-to-sys)");
  MODULE_LICENSE("GPL");
-
-- 
2.30.2


