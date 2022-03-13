Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEF64D77F8
	for <lists+linux-fbdev@lfdr.de>; Sun, 13 Mar 2022 20:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbiCMTbE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 13 Mar 2022 15:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235186AbiCMTbE (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 13 Mar 2022 15:31:04 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C68B4D626
        for <linux-fbdev@vger.kernel.org>; Sun, 13 Mar 2022 12:29:56 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 977201F452;
        Sun, 13 Mar 2022 19:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1647199794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bM2qp3okxbiiyPi7OeWNunpQsircOdKGfAhpG/om7SI=;
        b=MiPCDNItg92JH04Dm7zzD+c3Ep/noumuBEk2hSsYjDLTIw80XbeusGZZSYec+i8kSE+2mY
        itpoW2X7XKvh3A72FvVNqm3JsIUOvOq0UsHwcbD6Iqdwl6Km8oapcp0RErb78dEDxIlPci
        wGMcTqWwITxzYYSJyipQXHyyt6BGvBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1647199794;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bM2qp3okxbiiyPi7OeWNunpQsircOdKGfAhpG/om7SI=;
        b=AIJHKReoz7v1ziFHZRyvZt3JA7yCiYcTHXxLp2uIoeyE0svIQ092PLBl3CN0JTUovvP0wS
        hMQwBa8gsQvMcwAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64BF313AFE;
        Sun, 13 Mar 2022 19:29:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id KPiLFzJGLmIiFQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Sun, 13 Mar 2022 19:29:54 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, deller@gmx.de, m.szyprowski@samsung.com,
        geert@linux-m68k.org, javierm@redhat.com, sam@ravnborg.org
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] fbdev: Fix cfb_imageblit() for arbitrary image widths
Date:   Sun, 13 Mar 2022 20:29:52 +0100
Message-Id: <20220313192952.12058-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220313192952.12058-1-tzimmermann@suse.de>
References: <20220313192952.12058-1-tzimmermann@suse.de>
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

Commit 0d03011894d2 ("fbdev: Improve performance of cfb_imageblit()")
broke cfb_imageblit() for image widths that are not aligned to 8-bit
boundaries. Fix this by handling the trailing pixels on each line
separately. The performance improvements in the original commit do not
regress by this change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 0d03011894d2 ("fbdev: Improve performance of cfb_imageblit()")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/cfbimgblt.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/cfbimgblt.c b/drivers/video/fbdev/core/cfbimgblt.c
index 7361cfabdd85..9ebda4e0dc7a 100644
--- a/drivers/video/fbdev/core/cfbimgblt.c
+++ b/drivers/video/fbdev/core/cfbimgblt.c
@@ -218,7 +218,7 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
 {
 	u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
 	u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
-	u32 bit_mask, eorx;
+	u32 bit_mask, eorx, shift;
 	const char *s = image->data, *src;
 	u32 __iomem *dst;
 	const u32 *tab = NULL;
@@ -259,17 +259,23 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
 
 	for (i = image->height; i--; ) {
 		dst = (u32 __iomem *)dst1;
+		shift = 8;
 		src = s;
 
+		/*
+		 * Manually unroll the per-line copying loop for better
+		 * performance. This works until we processed the last
+		 * completely filled source byte (inclusive).
+		 */
 		switch (ppw) {
 		case 4: /* 8 bpp */
-			for (j = k; j; j -= 2, ++src) {
+			for (j = k; j >= 2; j -= 2, ++src) {
 				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
 				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
 			}
 			break;
 		case 2: /* 16 bpp */
-			for (j = k; j; j -= 4, ++src) {
+			for (j = k; j >= 4; j -= 4, ++src) {
 				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
 				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
 				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
@@ -277,7 +283,7 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
 			}
 			break;
 		case 1: /* 32 bpp */
-			for (j = k; j; j -= 8, ++src) {
+			for (j = k; j >= 8; j -= 8, ++src) {
 				FB_WRITEL(colortab[(*src >> 7) & bit_mask], dst++);
 				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
 				FB_WRITEL(colortab[(*src >> 5) & bit_mask], dst++);
@@ -290,6 +296,20 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
 			break;
 		}
 
+		/*
+		 * For image widths that are not a multiple of 8, there
+		 * are trailing pixels left on the current line. Print
+		 * them as well.
+		 */
+		for (; j--; ) {
+			shift -= ppw;
+			FB_WRITEL(colortab[(*src >> shift) & bit_mask], dst++);
+			if (!shift) {
+				shift = 8;
+				++src;
+			}
+		}
+
 		dst1 += p->fix.line_length;
 		s += spitch;
 	}
-- 
2.35.1

