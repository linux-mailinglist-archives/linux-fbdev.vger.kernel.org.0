Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC374BEB6D
	for <lists+linux-fbdev@lfdr.de>; Mon, 21 Feb 2022 20:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233254AbiBUTyl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 21 Feb 2022 14:54:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233272AbiBUTyi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 21 Feb 2022 14:54:38 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFC822BD2
        for <linux-fbdev@vger.kernel.org>; Mon, 21 Feb 2022 11:54:14 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 29066210F7;
        Mon, 21 Feb 2022 19:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1645473253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0kCXgz7ZmdjVcsPxT2dMSshLSPoR59o8Hro9HGHaTfc=;
        b=Rh8PWpvPGmyzFLs+EddmxBuafMq3TdYp3GSnnEFKAHXtQN/ueUQsLqvqt4EhPP2Ta727Jo
        lwtgRhnpwh9VHaEAM9cCXXTq6YRGF29J8njkrJGszlISccEP18mMp2nlQ4JtslhR4zo2hA
        +4F8uOvt4wne8vJG/lxAt+So/Ja/HCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1645473253;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0kCXgz7ZmdjVcsPxT2dMSshLSPoR59o8Hro9HGHaTfc=;
        b=rqAaB09YIVps0TLClz9oMPzdwde7A8vMVw+xwJ+3Oqpo61usaKjycDkiCTNJZdhRGx/PfN
        XXJsniy0KwinzbCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E9CFB13BA4;
        Mon, 21 Feb 2022 19:54:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ICAFOOTtE2KVPwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 21 Feb 2022 19:54:12 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, deller@gmx.de, javierm@redhat.com,
        geert@linux-m68k.org, sam@ravnborg.org, kraxel@redhat.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/5] fbdev: Improve performance of cfb_imageblit()
Date:   Mon, 21 Feb 2022 20:54:09 +0100
Message-Id: <20220221195410.9172-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221195410.9172-1-tzimmermann@suse.de>
References: <20220221195410.9172-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Improve the performance of sys_imageblit() by manually unrolling
the inner blitting loop and moving some invariants out. The compiler
failed to do this automatically. This change keeps cfb_imageblit()
in sync with sys_imagebit().

A microbenchmark measures the average number of CPU cycles
for sys_imageblit() after a stabilizing period of a few minutes
(i7-4790, FullHD, simpledrm, kernel with debugging).

sys_imageblit(), new: 15724 cycles
cfb_imageblit(): old: 30566 cycles

In the optimized case, cfb_imageblit() is now ~2x faster than before.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/cfbimgblt.c | 51 +++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/core/cfbimgblt.c b/drivers/video/fbdev/core/cfbimgblt.c
index 01b01a279681..7361cfabdd85 100644
--- a/drivers/video/fbdev/core/cfbimgblt.c
+++ b/drivers/video/fbdev/core/cfbimgblt.c
@@ -218,23 +218,29 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
 {
 	u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
 	u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
-	u32 bit_mask, end_mask, eorx, shift;
+	u32 bit_mask, eorx;
 	const char *s = image->data, *src;
 	u32 __iomem *dst;
 	const u32 *tab = NULL;
+	size_t tablen;
+	u32 colortab[16];
 	int i, j, k;
 
 	switch (bpp) {
 	case 8:
 		tab = fb_be_math(p) ? cfb_tab8_be : cfb_tab8_le;
+		tablen = 16;
 		break;
 	case 16:
 		tab = fb_be_math(p) ? cfb_tab16_be : cfb_tab16_le;
+		tablen = 4;
 		break;
 	case 32:
-	default:
 		tab = cfb_tab32;
+		tablen = 2;
 		break;
+	default:
+		return;
 	}
 
 	for (i = ppw-1; i--; ) {
@@ -248,15 +254,42 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
 	eorx = fgx ^ bgx;
 	k = image->width/ppw;
 
-	for (i = image->height; i--; ) {
-		dst = (u32 __iomem *) dst1, shift = 8; src = s;
+	for (i = 0; i < tablen; ++i)
+		colortab[i] = (tab[i] & eorx) ^ bgx;
 
-		for (j = k; j--; ) {
-			shift -= ppw;
-			end_mask = tab[(*src >> shift) & bit_mask];
-			FB_WRITEL((end_mask & eorx)^bgx, dst++);
-			if (!shift) { shift = 8; src++; }
+	for (i = image->height; i--; ) {
+		dst = (u32 __iomem *)dst1;
+		src = s;
+
+		switch (ppw) {
+		case 4: /* 8 bpp */
+			for (j = k; j; j -= 2, ++src) {
+				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
+				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
+			}
+			break;
+		case 2: /* 16 bpp */
+			for (j = k; j; j -= 4, ++src) {
+				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
+				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
+				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
+				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
+			}
+			break;
+		case 1: /* 32 bpp */
+			for (j = k; j; j -= 8, ++src) {
+				FB_WRITEL(colortab[(*src >> 7) & bit_mask], dst++);
+				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
+				FB_WRITEL(colortab[(*src >> 5) & bit_mask], dst++);
+				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
+				FB_WRITEL(colortab[(*src >> 3) & bit_mask], dst++);
+				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
+				FB_WRITEL(colortab[(*src >> 1) & bit_mask], dst++);
+				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
+			}
+			break;
 		}
+
 		dst1 += p->fix.line_length;
 		s += spitch;
 	}
-- 
2.35.1

