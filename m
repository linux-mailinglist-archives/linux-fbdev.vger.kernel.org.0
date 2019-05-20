Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20F3C22EA0
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 May 2019 10:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731312AbfETIWd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 May 2019 04:22:33 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45635 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731291AbfETIWc (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 May 2019 04:22:32 -0400
Received: by mail-ed1-f67.google.com with SMTP id g57so22486317edc.12
        for <linux-fbdev@vger.kernel.org>; Mon, 20 May 2019 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Yi2X1g2LDOK5pARSqfDRbgYny8Ht12DRNhi7B8kudE=;
        b=G0YJ7vs27y+V7OdMp+ENPD1lSgTa7pNGdeswUFxkTwXtbtAumSLGCgWrIYQVT55Q9W
         1QcmoAdHvvy0lrdBljaNzs8QH2Pl1vBp/eZd4v9sjDPKQ3L6aCcyxlfACZbPsj5X2VZr
         s61clzBKGrQItY414cJdscFjWMzl/7+tRX4ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Yi2X1g2LDOK5pARSqfDRbgYny8Ht12DRNhi7B8kudE=;
        b=fMBrRSA9vsahyw1Te2XoSl/0PzH58vDZ8ORY4wUwQ9+Y/DeqErbshmChG89FM86Bhs
         CvtkkTMdF6iDRKDocYKetLR85uHxktVAFvElMh4PGlgdvDvwlKLCH4fDXRkE2XhFPN2G
         ixM1eIrqso7IKPaLjKa9lmtMp/e6Fbx5UylwKBdJU0BzfgbY6EEgpq8SFw/zQN/HEXQj
         wmcMvGWh2077AgOs6S+BblESrvDVY6QIBDkRETcezYus1Rt5wWE4fC3ojKf1WSJaahLD
         QXV2R70FXOFNifzSZkqY+LfMeD7bN7olTLfGXRmnoYBLdtMIwL1FkHQLPE3sCTiDUaT1
         xXyw==
X-Gm-Message-State: APjAAAUZ7SqMzRunRUzW8cwwf7I8ilYploBFyyFsE/zz6M1Tv/NlY7qW
        aZVtuVnKYBYyvhmVOhV1gCqwrcoJ9TI=
X-Google-Smtp-Source: APXvYqx1KMcrcgpQkz4bO2jVYqWxeEYutnIUAq9EK8LkqC8rGjLsuq/dv8waUJ8jpDkNsjUkAr/k7w==
X-Received: by 2002:a17:906:2cd1:: with SMTP id r17mr57422258ejr.101.1558340550757;
        Mon, 20 May 2019 01:22:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 01:22:30 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org
Subject: [PATCH 07/33] fbdev/aty128fb: Remove dead code
Date:   Mon, 20 May 2019 10:21:50 +0200
Message-Id: <20190520082216.26273-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Motivated because it contains a struct display, which is a fbcon
internal data structure that I want to rename. It seems to have been
formerly used in drivers, but that's very long time ago.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/aty/aty128fb.c | 64 ------------------------------
 1 file changed, 64 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index 6cc46867ff57..c022ad7a49c2 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -2349,70 +2349,6 @@ static int aty128fb_ioctl(struct fb_info *info, u_int cmd, u_long arg)
 	return -EINVAL;
 }
 
-#if 0
-    /*
-     *  Accelerated functions
-     */
-
-static inline void aty128_rectcopy(int srcx, int srcy, int dstx, int dsty,
-				   u_int width, u_int height,
-				   struct fb_info_aty128 *par)
-{
-	u32 save_dp_datatype, save_dp_cntl, dstval;
-
-	if (!width || !height)
-		return;
-
-	dstval = depth_to_dst(par->current_par.crtc.depth);
-	if (dstval == DST_24BPP) {
-		srcx *= 3;
-		dstx *= 3;
-		width *= 3;
-	} else if (dstval == -EINVAL) {
-		printk("aty128fb: invalid depth or RGBA\n");
-		return;
-	}
-
-	wait_for_fifo(2, par);
-	save_dp_datatype = aty_ld_le32(DP_DATATYPE);
-	save_dp_cntl     = aty_ld_le32(DP_CNTL);
-
-	wait_for_fifo(6, par);
-	aty_st_le32(SRC_Y_X, (srcy << 16) | srcx);
-	aty_st_le32(DP_MIX, ROP3_SRCCOPY | DP_SRC_RECT);
-	aty_st_le32(DP_CNTL, DST_X_LEFT_TO_RIGHT | DST_Y_TOP_TO_BOTTOM);
-	aty_st_le32(DP_DATATYPE, save_dp_datatype | dstval | SRC_DSTCOLOR);
-
-	aty_st_le32(DST_Y_X, (dsty << 16) | dstx);
-	aty_st_le32(DST_HEIGHT_WIDTH, (height << 16) | width);
-
-	par->blitter_may_be_busy = 1;
-
-	wait_for_fifo(2, par);
-	aty_st_le32(DP_DATATYPE, save_dp_datatype);
-	aty_st_le32(DP_CNTL, save_dp_cntl);
-}
-
-
-    /*
-     * Text mode accelerated functions
-     */
-
-static void fbcon_aty128_bmove(struct display *p, int sy, int sx, int dy,
-			       int dx, int height, int width)
-{
-	sx     *= fontwidth(p);
-	sy     *= fontheight(p);
-	dx     *= fontwidth(p);
-	dy     *= fontheight(p);
-	width  *= fontwidth(p);
-	height *= fontheight(p);
-
-	aty128_rectcopy(sx, sy, dx, dy, width, height,
-			(struct fb_info_aty128 *)p->fb_info);
-}
-#endif /* 0 */
-
 static void aty128_set_suspend(struct aty128fb_par *par, int suspend)
 {
 	u32	pmgt;
-- 
2.20.1

