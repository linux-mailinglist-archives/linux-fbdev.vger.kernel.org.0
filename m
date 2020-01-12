Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66D04138730
	for <lists+linux-fbdev@lfdr.de>; Sun, 12 Jan 2020 18:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732827AbgALRP0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 12 Jan 2020 12:15:26 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:60282 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732859AbgALRP0 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 12 Jan 2020 12:15:26 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id pVFN2100D5USYZQ01VFNDa; Sun, 12 Jan 2020 18:15:24 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iqgpe-0008HY-Ab; Sun, 12 Jan 2020 18:15:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iqgpe-0005qj-9J; Sun, 12 Jan 2020 18:15:22 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] fbdev: c2p: Use BUILD_BUG() instead of custom solution
Date:   Sun, 12 Jan 2020 18:15:21 +0100
Message-Id: <20200112171521.22443-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Replace the call to the custom non-existing function by a standard
BUILD_BUG() invocation.

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/c2p_core.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/c2p_core.h b/drivers/video/fbdev/c2p_core.h
index 45a6d895a7d7208e..cf5f1ebce65e6afd 100644
--- a/drivers/video/fbdev/c2p_core.h
+++ b/drivers/video/fbdev/c2p_core.h
@@ -12,6 +12,8 @@
  *  for more details.
  */
 
+#include <linux/build_bug.h>
+
 
     /*
      *  Basic transpose step
@@ -27,8 +29,6 @@ static inline void _transp(u32 d[], unsigned int i1, unsigned int i2,
 }
 
 
-extern void c2p_unsupported(void);
-
 static __always_inline u32 get_mask(unsigned int n)
 {
 	switch (n) {
@@ -48,7 +48,7 @@ static __always_inline u32 get_mask(unsigned int n)
 		return 0x0000ffff;
 	}
 
-	c2p_unsupported();
+	BUILD_BUG();
 	return 0;
 }
 
@@ -91,7 +91,7 @@ static __always_inline void transp8(u32 d[], unsigned int n, unsigned int m)
 		return;
 	}
 
-	c2p_unsupported();
+	BUILD_BUG();
 }
 
 
@@ -118,7 +118,7 @@ static __always_inline void transp4(u32 d[], unsigned int n, unsigned int m)
 		return;
 	}
 
-	c2p_unsupported();
+	BUILD_BUG();
 }
 
 
@@ -138,7 +138,7 @@ static __always_inline void transp4x(u32 d[], unsigned int n, unsigned int m)
 		return;
 	}
 
-	c2p_unsupported();
+	BUILD_BUG();
 }
 
 
-- 
2.17.1

