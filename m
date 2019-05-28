Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22EA52C2A3
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 May 2019 11:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfE1JGq (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 May 2019 05:06:46 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38087 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbfE1JDX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 May 2019 05:03:23 -0400
Received: by mail-ed1-f67.google.com with SMTP id g13so835778edu.5
        for <linux-fbdev@vger.kernel.org>; Tue, 28 May 2019 02:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HZwP5CFzD06sWD0G+Fe0mAzCpHhgcMKFAUp7XhkxC/k=;
        b=eXb8rxg7fFF6/2RAfZ4NWczgflnTAPw/L+VbbIhxEioapduOh2JwUJvBTIee7RTcn8
         /AEmskfBbKkJwNvzDW7ImicadrrECvrGsi/czi03V+Fn1gADb65ZC5uqG6kdNJWkk1ve
         o3N9d6Vz76kkzKUppLsCnKwnFEu72Q0/Uz8E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZwP5CFzD06sWD0G+Fe0mAzCpHhgcMKFAUp7XhkxC/k=;
        b=dXtEr43NkBaWE9V+F4u+Tr8qxuWwkB5BTeTYz0PS8SNy2KWOYzZLuyWR3eB8nBzcee
         mW8aAL6Vac6YVSK2XsrVXnA/qrZWloM6Ul0rmtJqlbTtv2+D9edHSEcrvUqt5ksuCTUQ
         np6M998BYcVgc9DHlYlV4zjlUCP2TAb3kfMPUUycpfDsgRn27kuyXDPVqFPW1rq3FPu0
         tGSiGp+qzyFpb7/+XW9/gZiVfyB4wrIQmk9qNx9pT4yiGQg8bN7w/+2b0ICGyEWm44Kb
         1SoEGqoRiaUsElitHyMhh9IIgvGlSwX5PDYjwSZJghk/mK7/T6wiV5p7R9YLuRbdmG+y
         aKgQ==
X-Gm-Message-State: APjAAAW5bRGBcygYuuwM2pRM+CKScKhN/gr6vQ2At8dBZVlJBaPSdnvC
        pT3URS70ZleeWBwKNGXAJfogPA==
X-Google-Smtp-Source: APXvYqwHlk+CTEOYRVR2n0Zwg2fJHnhIcAQkS/q4yn3g+Dr67BhbtStsBv6flBr94eYXjUxcKSAJfQ==
X-Received: by 2002:a50:bf0c:: with SMTP id f12mr128312359edk.181.1559034201426;
        Tue, 28 May 2019 02:03:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 02:03:20 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Paul Mackerras <paulus@samba.org>
Subject: [PATCH 07/33] fbdev/aty128fb: Remove dead code
Date:   Tue, 28 May 2019 11:02:38 +0200
Message-Id: <20190528090304.9388-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
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
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/aty/aty128fb.c | 64 ------------------------------
 1 file changed, 64 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index 794434891291..b02e67528a99 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -2350,70 +2350,6 @@ static int aty128fb_ioctl(struct fb_info *info, u_int cmd, u_long arg)
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

