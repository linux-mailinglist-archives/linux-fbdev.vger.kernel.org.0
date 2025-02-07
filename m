Return-Path: <linux-fbdev+bounces-3735-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDCA2BA29
	for <lists+linux-fbdev@lfdr.de>; Fri,  7 Feb 2025 05:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 841723A5982
	for <lists+linux-fbdev@lfdr.de>; Fri,  7 Feb 2025 04:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD16023237B;
	Fri,  7 Feb 2025 04:21:06 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14911DE8B4
	for <linux-fbdev@vger.kernel.org>; Fri,  7 Feb 2025 04:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.139.58.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738902066; cv=none; b=nzPpCS2fZklmNaONLvxKktntGKDiCQWoQICb65sTDHn5QNhTRvunAjpVpyDoOj0VF5l210IqZYOoRS0uHAa2HvDTjl1SpJxd+8ceoeR0aIZmW46D7Eie4uAsITkLQ8tgXK/zpts5PFkaEy891YGndtU70xXcS4qcIGOjGXO6aXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738902066; c=relaxed/simple;
	bh=2nfwY4sf2mVWk7Yj316aTP5y7CCRvQyp+o14K4vMbMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lTWNVA/2ClSsgQWf2Xu7QOuJ8emDNrtvH4G+BRF5L+dFSIwXvfXaWhZwulhRqI7guJEJ62vI2+qkFYEFSgWnl6lhQU5laL26WIvz1AS54cR6vfHCDyDqCyYW7Fw+XIVv4IDYm9wrr8+UvtG6WR5GN4VDV8Du/v2x8aaK+ik4Kow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org; spf=pass smtp.mailfrom=c64.rulez.org; arc=none smtp.client-ip=79.139.58.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c64.rulez.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c64.rulez.org
Received: by c64.rulez.org (Postfix, from userid 1000)
	id 50903105D5; Fri,  7 Feb 2025 05:19:52 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH RESEND 13/13] fbdev: core: Split CFB and SYS pixel reversing configuration
Date: Fri,  7 Feb 2025 05:18:18 +0100
Message-Id: <20250207041818.4031-14-soci@c64.rulez.org>
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
 drivers/video/fbdev/core/Kconfig       | 10 +++++++++-
 drivers/video/fbdev/core/cfbcopyarea.c |  1 +
 drivers/video/fbdev/core/cfbfillrect.c |  1 +
 drivers/video/fbdev/core/cfbimgblt.c   |  1 +
 drivers/video/fbdev/core/fb_draw.h     |  6 +++---
 drivers/video/fbdev/core/syscopyarea.c |  1 +
 drivers/video/fbdev/core/sysfillrect.c |  1 +
 drivers/video/fbdev/core/sysimgblt.c   |  1 +
 8 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index d554d8c54..05aa9b42a 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -69,7 +69,7 @@ config FB_CFB_REV_PIXELS_IN_BYTE
 	bool
 	depends on FB_CORE
 	help
-	  Allow generic frame-buffer functions to work on displays with 1, 2
+	  Allow I/O memory frame-buffer functions to work on displays with 1, 2
 	  and 4 bits per pixel depths which has opposite order of pixels in
 	  byte order to bytes in long order.
 
@@ -97,6 +97,14 @@ config FB_SYS_IMAGEBLIT
 	  blitting. This is used by drivers that don't provide their own
 	  (accelerated) version and the framebuffer is in system RAM.
 
+config FB_SYS_REV_PIXELS_IN_BYTE
+	bool
+	depends on FB_CORE
+	help
+	  Allow SYS memory frame-buffer functions to work on displays with 1, 2
+	  and 4 bits per pixel depths which has opposite order of pixels in
+	  byte order to bytes in long order.
+
 config FB_PROVIDE_GET_FB_UNMAPPED_AREA
 	bool
 	depends on FB
diff --git a/drivers/video/fbdev/core/cfbcopyarea.c b/drivers/video/fbdev/core/cfbcopyarea.c
index ba0ebd115..85c406125 100644
--- a/drivers/video/fbdev/core/cfbcopyarea.c
+++ b/drivers/video/fbdev/core/cfbcopyarea.c
@@ -25,6 +25,7 @@
 #define FB_SPACE          0
 #define FB_SPACE_NAME     "I/O"
 #define FB_SCREEN_BASE(a) ((a)->screen_base)
+#define FB_REV_PIXELS_IN_BYTE CONFIG_FB_CFB_REV_PIXELS_IN_BYTE
 #include "fb_copyarea.h"
 
 EXPORT_SYMBOL(cfb_copyarea);
diff --git a/drivers/video/fbdev/core/cfbfillrect.c b/drivers/video/fbdev/core/cfbfillrect.c
index 116d56de2..9fff21680 100644
--- a/drivers/video/fbdev/core/cfbfillrect.c
+++ b/drivers/video/fbdev/core/cfbfillrect.c
@@ -25,6 +25,7 @@
 #define FB_SPACE          0
 #define FB_SPACE_NAME     "I/O"
 #define FB_SCREEN_BASE(a) ((a)->screen_base)
+#define FB_REV_PIXELS_IN_BYTE CONFIG_FB_CFB_REV_PIXELS_IN_BYTE
 #include "fb_fillrect.h"
 
 EXPORT_SYMBOL(cfb_fillrect);
diff --git a/drivers/video/fbdev/core/cfbimgblt.c b/drivers/video/fbdev/core/cfbimgblt.c
index a5bb63913..729bf1ace 100644
--- a/drivers/video/fbdev/core/cfbimgblt.c
+++ b/drivers/video/fbdev/core/cfbimgblt.c
@@ -19,6 +19,7 @@
 #define FB_SPACE          0
 #define FB_SPACE_NAME     "I/O"
 #define FB_SCREEN_BASE(a) ((a)->screen_base)
+#define FB_REV_PIXELS_IN_BYTE CONFIG_FB_CFB_REV_PIXELS_IN_BYTE
 #include "fb_imageblit.h"
 
 EXPORT_SYMBOL(cfb_imageblit);
diff --git a/drivers/video/fbdev/core/fb_draw.h b/drivers/video/fbdev/core/fb_draw.h
index e0d829873..1ed7e58f1 100644
--- a/drivers/video/fbdev/core/fb_draw.h
+++ b/drivers/video/fbdev/core/fb_draw.h
@@ -75,7 +75,7 @@ pixel_to_pat( u32 bpp, u32 pixel)
 }
 #endif
 
-#ifdef CONFIG_FB_CFB_REV_PIXELS_IN_BYTE
+#ifdef FB_REV_PIXELS_IN_BYTE
 #if BITS_PER_LONG == 64
 #define REV_PIXELS_MASK1 0x5555555555555555ul
 #define REV_PIXELS_MASK2 0x3333333333333333ul
@@ -157,7 +157,7 @@ static inline u32 fb_compute_bswapmask(struct fb_info *info)
 	return bswapmask;
 }
 
-#else /* CONFIG_FB_CFB_REV_PIXELS_IN_BYTE */
+#else /* FB_REV_PIXELS_IN_BYTE */
 
 static inline unsigned long fb_rev_pixels_in_long(unsigned long val,
 						  u32 bswapmask)
@@ -169,7 +169,7 @@ static inline unsigned long fb_rev_pixels_in_long(unsigned long val,
 #define fb_shifted_pixels_mask_long(p, i, b) FB_SHIFT_HIGH((p), ~0UL, (i))
 #define fb_compute_bswapmask(...) 0
 
-#endif  /* CONFIG_FB_CFB_REV_PIXELS_IN_BYTE */
+#endif  /* FB_REV_PIXELS_IN_BYTE */
 
 #define cpu_to_le_long _cpu_to_le_long(BITS_PER_LONG)
 #define _cpu_to_le_long(x) __cpu_to_le_long(x)
diff --git a/drivers/video/fbdev/core/syscopyarea.c b/drivers/video/fbdev/core/syscopyarea.c
index 124831eed..a14328f98 100644
--- a/drivers/video/fbdev/core/syscopyarea.c
+++ b/drivers/video/fbdev/core/syscopyarea.c
@@ -23,6 +23,7 @@
 #define FB_SPACE          FBINFO_VIRTFB
 #define FB_SPACE_NAME     "virtual"
 #define FB_SCREEN_BASE(a) ((a)->screen_buffer)
+#define FB_REV_PIXELS_IN_BYTE CONFIG_FB_SYS_REV_PIXELS_IN_BYTE
 #include "fb_copyarea.h"
 
 EXPORT_SYMBOL(sys_copyarea);
diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
index 48d0f0efb..1b039573b 100644
--- a/drivers/video/fbdev/core/sysfillrect.c
+++ b/drivers/video/fbdev/core/sysfillrect.c
@@ -23,6 +23,7 @@
 #define FB_SPACE          FBINFO_VIRTFB
 #define FB_SPACE_NAME     "virtual"
 #define FB_SCREEN_BASE(a) ((a)->screen_buffer)
+#define FB_REV_PIXELS_IN_BYTE CONFIG_FB_SYS_REV_PIXELS_IN_BYTE
 #include "fb_fillrect.h"
 
 EXPORT_SYMBOL(sys_fillrect);
diff --git a/drivers/video/fbdev/core/sysimgblt.c b/drivers/video/fbdev/core/sysimgblt.c
index 6e60e3486..e8b849b82 100644
--- a/drivers/video/fbdev/core/sysimgblt.c
+++ b/drivers/video/fbdev/core/sysimgblt.c
@@ -21,6 +21,7 @@
 #define FB_SPACE          FBINFO_VIRTFB
 #define FB_SPACE_NAME     "virtual"
 #define FB_SCREEN_BASE(a) ((a)->screen_buffer)
+#define FB_REV_PIXELS_IN_BYTE CONFIG_FB_SYS_REV_PIXELS_IN_BYTE
 #include "fb_imageblit.h"
 
 EXPORT_SYMBOL(sys_imageblit);
-- 
2.30.2


