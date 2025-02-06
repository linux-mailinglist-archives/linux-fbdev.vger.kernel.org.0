Return-Path: <linux-fbdev+bounces-3716-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE555A2B2B2
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Feb 2025 20:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E8761886749
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Feb 2025 19:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3701ACEAD;
	Thu,  6 Feb 2025 19:53:18 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFB1156C5E
	for <linux-fbdev@vger.kernel.org>; Thu,  6 Feb 2025 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.139.58.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871598; cv=none; b=OM86FcM/wmSN1WryPUjmcrS6cYVK6UUBiXLoO4gqmq+Go/6sWF3bqgb9kFdPP2fdGuhsu6kdb3s7ENh7UxRT9pPLhgU8o7sCBlHTSepvu3ubK90yLGrL1Mv9HzS31V3aCpbxRQH2v/5vvm7C33yNIN9HAWx5DSuUjpI7AuI0LhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871598; c=relaxed/simple;
	bh=jkZvaqWZgGALo+LyFXp/586bmiiYPGJLyll6AOFADAM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=cpz4GuD4wh/ZBYsZpamlq/ryFBkCUC2RdARtL1fKz7/y9R52hUPjuu3Gl/j0uK/i2wfTy+uLGmyX2bw16UJBcdEL4WD8Gy1MGqusJoPEpHFVmJODNl4jlVznZZFPFy8/1IAhIK3lMgiAfKvcNegfhD2Xg2RMRge4rh0dKRQQFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org; spf=pass smtp.mailfrom=c64.rulez.org; arc=none smtp.client-ip=79.139.58.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c64.rulez.org
Received: by c64.rulez.org (Postfix, from userid 1000)
	id 98D9F100FA; Thu,  6 Feb 2025 20:53:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by c64.rulez.org (Postfix) with ESMTP id 9800F100F6;
	Thu,  6 Feb 2025 20:53:14 +0100 (CET)
Date: Thu, 6 Feb 2025 20:53:14 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 09/13] fbdev: core: Copy cfbimgblt to fb_imageblit
Message-ID: <17c49ca6-15d7-ee53-2777-e131436acd6e@c64.rulez.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII

fbdev: core: Copy cfbimgblt to fb_imageblit

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
  drivers/video/fbdev/core/fb_imageblit.h | 368 ++++++++++++++++++++++++
  1 file changed, 368 insertions(+)
  create mode 100644 drivers/video/fbdev/core/fb_imageblit.h

diff --git a/drivers/video/fbdev/core/fb_imageblit.h b/drivers/video/fbdev/core/fb_imageblit.h
new file mode 100644
index 000000000..129822b6f
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_imageblit.h
@@ -0,0 +1,368 @@
+/*
+ *  Generic BitBLT function for frame buffer with packed pixels of any depth.
+ *
+ *      Copyright (C)  June 1999 James Simmons
+ *
+ *  This file is subject to the terms and conditions of the GNU General Public
+ *  License.  See the file COPYING in the main directory of this archive for
+ *  more details.
+ *
+ * NOTES:
+ *
+ *    This function copys a image from system memory to video memory. The
+ *  image can be a bitmap where each 0 represents the background color and
+ *  each 1 represents the foreground color. Great for font handling. It can
+ *  also be a color image. This is determined by image_depth. The color image
+ *  must be laid out exactly in the same format as the framebuffer. Yes I know
+ *  their are cards with hardware that coverts images of various depths to the
+ *  framebuffer depth. But not every card has this. All images must be rounded
+ *  up to the nearest byte. For example a bitmap 12 bits wide must be two
+ *  bytes width.
+ *
+ *  Tony:
+ *  Incorporate mask tables similar to fbcon-cfb*.c in 2.4 API.  This speeds
+ *  up the code significantly.
+ *
+ *  Code for depths not multiples of BITS_PER_LONG is still kludgy, which is
+ *  still processed a bit at a time.
+ *
+ *  Also need to add code to deal with cards endians that are different than
+ *  the native cpu endians. I also need to deal with MSB position in the word.
+ */
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/fb.h>
+#include <asm/types.h>
+#include "fb_draw.h"
+
+#define DEBUG
+
+#ifdef DEBUG
+#define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt,__func__,## args)
+#else
+#define DPRINTK(fmt, args...)
+#endif
+
+static const u32 cfb_tab8_be[] = {
+    0x00000000,0x000000ff,0x0000ff00,0x0000ffff,
+    0x00ff0000,0x00ff00ff,0x00ffff00,0x00ffffff,
+    0xff000000,0xff0000ff,0xff00ff00,0xff00ffff,
+    0xffff0000,0xffff00ff,0xffffff00,0xffffffff
+};
+
+static const u32 cfb_tab8_le[] = {
+    0x00000000,0xff000000,0x00ff0000,0xffff0000,
+    0x0000ff00,0xff00ff00,0x00ffff00,0xffffff00,
+    0x000000ff,0xff0000ff,0x00ff00ff,0xffff00ff,
+    0x0000ffff,0xff00ffff,0x00ffffff,0xffffffff
+};
+
+static const u32 cfb_tab16_be[] = {
+    0x00000000, 0x0000ffff, 0xffff0000, 0xffffffff
+};
+
+static const u32 cfb_tab16_le[] = {
+    0x00000000, 0xffff0000, 0x0000ffff, 0xffffffff
+};
+
+static const u32 cfb_tab32[] = {
+        0x00000000, 0xffffffff
+};
+
+#define FB_WRITEL fb_writel
+#define FB_READL  fb_readl
+
+static inline void color_imageblit(const struct fb_image *image,
+                                   struct fb_info *p, u8 __iomem *dst1,
+                                   u32 start_index,
+                                   u32 pitch_index)
+{
+        /* Draw the penguin */
+        u32 __iomem *dst, *dst2;
+        u32 color = 0, val, shift;
+        int i, n, bpp = p->var.bits_per_pixel;
+        u32 null_bits = 32 - bpp;
+        u32 *palette = (u32 *) p->pseudo_palette;
+        const u8 *src = image->data;
+        u32 bswapmask = fb_compute_bswapmask(p);
+
+        dst2 = (u32 __iomem *) dst1;
+        for (i = image->height; i--; ) {
+                n = image->width;
+                dst = (u32 __iomem *) dst1;
+                shift = 0;
+                val = 0;
+
+                if (start_index) {
+                        u32 start_mask = ~fb_shifted_pixels_mask_u32(p,
+                                                start_index, bswapmask);
+                        val = FB_READL(dst) & start_mask;
+                        shift = start_index;
+                }
+                while (n--) {
+                        if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
+                            p->fix.visual == FB_VISUAL_DIRECTCOLOR )
+                                color = palette[*src];
+                        else
+                                color = *src;
+                        color <<= FB_LEFT_POS(p, bpp);
+                        val |= FB_SHIFT_HIGH(p, color, shift ^ bswapmask);
+                        if (shift >= null_bits) {
+                                FB_WRITEL(val, dst++);
+
+                                val = (shift == null_bits) ? 0 :
+                                        FB_SHIFT_LOW(p, color, 32 - shift);
+                        }
+                        shift += bpp;
+                        shift &= (32 - 1);
+                        src++;
+                }
+                if (shift) {
+                        u32 end_mask = fb_shifted_pixels_mask_u32(p, shift,
+                                                bswapmask);
+
+                        FB_WRITEL((FB_READL(dst) & end_mask) | val, dst);
+                }
+                dst1 += p->fix.line_length;
+                if (pitch_index) {
+                        dst2 += p->fix.line_length;
+                        dst1 = (u8 __iomem *)((long __force)dst2 & ~(sizeof(u32) - 1));
+
+                        start_index += pitch_index;
+                        start_index &= 32 - 1;
+                }
+        }
+}
+
+static inline void slow_imageblit(const struct fb_image *image, struct fb_info *p,
+                                  u8 __iomem *dst1, u32 fgcolor,
+                                  u32 bgcolor,
+                                  u32 start_index,
+                                  u32 pitch_index)
+{
+        u32 shift, color = 0, bpp = p->var.bits_per_pixel;
+        u32 __iomem *dst, *dst2;
+        u32 val, pitch = p->fix.line_length;
+        u32 null_bits = 32 - bpp;
+        u32 spitch = (image->width+7)/8;
+        const u8 *src = image->data, *s;
+        u32 i, j, l;
+        u32 bswapmask = fb_compute_bswapmask(p);
+
+        dst2 = (u32 __iomem *) dst1;
+        fgcolor <<= FB_LEFT_POS(p, bpp);
+        bgcolor <<= FB_LEFT_POS(p, bpp);
+
+        for (i = image->height; i--; ) {
+                shift = val = 0;
+                l = 8;
+                j = image->width;
+                dst = (u32 __iomem *) dst1;
+                s = src;
+
+                /* write leading bits */
+                if (start_index) {
+                        u32 start_mask = ~fb_shifted_pixels_mask_u32(p,
+                                                start_index, bswapmask);
+                        val = FB_READL(dst) & start_mask;
+                        shift = start_index;
+                }
+
+                while (j--) {
+                        l--;
+                        color = (*s & (1 << l)) ? fgcolor : bgcolor;
+                        val |= FB_SHIFT_HIGH(p, color, shift ^ bswapmask);
+
+                        /* Did the bitshift spill bits to the next long? */
+                        if (shift >= null_bits) {
+                                FB_WRITEL(val, dst++);
+                                val = (shift == null_bits) ? 0 :
+                                        FB_SHIFT_LOW(p, color, 32 - shift);
+                        }
+                        shift += bpp;
+                        shift &= (32 - 1);
+                        if (!l) { l = 8; s++; }
+                }
+
+                /* write trailing bits */
+                if (shift) {
+                        u32 end_mask = fb_shifted_pixels_mask_u32(p, shift,
+                                                bswapmask);
+
+                        FB_WRITEL((FB_READL(dst) & end_mask) | val, dst);
+                }
+
+                dst1 += pitch;
+                src += spitch;
+                if (pitch_index) {
+                        dst2 += pitch;
+                        dst1 = (u8 __iomem *)((long __force)dst2 & ~(sizeof(u32) - 1));
+                        start_index += pitch_index;
+                        start_index &= 32 - 1;
+                }
+
+        }
+}
+
+/*
+ * fast_imageblit - optimized monochrome color expansion
+ *
+ * Only if:  bits_per_pixel == 8, 16, or 32
+ *           image->width is divisible by pixel/dword (ppw);
+ *           fix->line_legth is divisible by 4;
+ *           beginning and end of a scanline is dword aligned
+ */
+static inline void fast_imageblit(const struct fb_image *image, struct fb_info *p,
+                                  u8 __iomem *dst1, u32 fgcolor,
+                                  u32 bgcolor)
+{
+        u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
+        u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
+        u32 bit_mask, eorx, shift;
+        const char *s = image->data, *src;
+        u32 __iomem *dst;
+        const u32 *tab = NULL;
+        size_t tablen;
+        u32 colortab[16];
+        int i, j, k;
+
+        switch (bpp) {
+        case 8:
+                tab = fb_be_math(p) ? cfb_tab8_be : cfb_tab8_le;
+                tablen = 16;
+                break;
+        case 16:
+                tab = fb_be_math(p) ? cfb_tab16_be : cfb_tab16_le;
+                tablen = 4;
+                break;
+        case 32:
+                tab = cfb_tab32;
+                tablen = 2;
+                break;
+        default:
+                return;
+        }
+
+        for (i = ppw-1; i--; ) {
+                fgx <<= bpp;
+                bgx <<= bpp;
+                fgx |= fgcolor;
+                bgx |= bgcolor;
+        }
+
+        bit_mask = (1 << ppw) - 1;
+        eorx = fgx ^ bgx;
+        k = image->width/ppw;
+
+        for (i = 0; i < tablen; ++i)
+                colortab[i] = (tab[i] & eorx) ^ bgx;
+
+        for (i = image->height; i--; ) {
+                dst = (u32 __iomem *)dst1;
+                shift = 8;
+                src = s;
+
+                /*
+                 * Manually unroll the per-line copying loop for better
+                 * performance. This works until we processed the last
+                 * completely filled source byte (inclusive).
+                 */
+                switch (ppw) {
+                case 4: /* 8 bpp */
+                        for (j = k; j >= 2; j -= 2, ++src) {
+                                FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
+                                FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
+                        }
+                        break;
+                case 2: /* 16 bpp */
+                        for (j = k; j >= 4; j -= 4, ++src) {
+                                FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
+                                FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
+                                FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
+                                FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
+                        }
+                        break;
+                case 1: /* 32 bpp */
+                        for (j = k; j >= 8; j -= 8, ++src) {
+                                FB_WRITEL(colortab[(*src >> 7) & bit_mask], dst++);
+                                FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
+                                FB_WRITEL(colortab[(*src >> 5) & bit_mask], dst++);
+                                FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
+                                FB_WRITEL(colortab[(*src >> 3) & bit_mask], dst++);
+                                FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
+                                FB_WRITEL(colortab[(*src >> 1) & bit_mask], dst++);
+                                FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
+                        }
+                        break;
+                }
+
+                /*
+                 * For image widths that are not a multiple of 8, there
+                 * are trailing pixels left on the current line. Print
+                 * them as well.
+                 */
+                for (; j--; ) {
+                        shift -= ppw;
+                        FB_WRITEL(colortab[(*src >> shift) & bit_mask], dst++);
+                        if (!shift) {
+                                shift = 8;
+                                ++src;
+                        }
+                }
+
+                dst1 += p->fix.line_length;
+                s += spitch;
+        }
+}
+
+void cfb_imageblit(struct fb_info *p, const struct fb_image *image)
+{
+        u32 fgcolor, bgcolor, start_index, bitstart, pitch_index = 0;
+        u32 bpl = sizeof(u32), bpp = p->var.bits_per_pixel;
+        u32 width = image->width;
+        u32 dx = image->dx, dy = image->dy;
+        u8 __iomem *dst1;
+
+        if (p->state != FBINFO_STATE_RUNNING)
+                return;
+
+        if (p->flags & FBINFO_VIRTFB)
+                fb_warn_once(p, "Framebuffer is not in I/O address space.");
+
+        bitstart = (dy * p->fix.line_length * 8) + (dx * bpp);
+        start_index = bitstart & (32 - 1);
+        pitch_index = (p->fix.line_length & (bpl - 1)) * 8;
+
+        bitstart /= 8;
+        bitstart &= ~(bpl - 1);
+        dst1 = p->screen_base + bitstart;
+
+        if (p->fbops->fb_sync)
+                p->fbops->fb_sync(p);
+
+        if (image->depth == 1) {
+                if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
+                    p->fix.visual == FB_VISUAL_DIRECTCOLOR) {
+                        fgcolor = ((u32*)(p->pseudo_palette))[image->fg_color];
+                        bgcolor = ((u32*)(p->pseudo_palette))[image->bg_color];
+                } else {
+                        fgcolor = image->fg_color;
+                        bgcolor = image->bg_color;
+                }
+
+                if (32 % bpp == 0 && !start_index && !pitch_index &&
+                    ((width & (32/bpp-1)) == 0) &&
+                    bpp >= 8 && bpp <= 32)
+                        fast_imageblit(image, p, dst1, fgcolor, bgcolor);
+                else
+                        slow_imageblit(image, p, dst1, fgcolor, bgcolor,
+                                        start_index, pitch_index);
+        } else
+                color_imageblit(image, p, dst1, start_index, pitch_index);
+}
+
+EXPORT_SYMBOL(cfb_imageblit);
+
+MODULE_AUTHOR("James Simmons <jsimmons@users.sf.net>");
+MODULE_DESCRIPTION("Generic software accelerated imaging drawing");
+MODULE_LICENSE("GPL");
-- 
2.30.2


