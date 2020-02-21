Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8B716831D
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Feb 2020 17:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbgBUQSu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 21 Feb 2020 11:18:50 -0500
Received: from gateway30.websitewelcome.com ([50.116.127.1]:14123 "EHLO
        gateway30.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727213AbgBUQSt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 21 Feb 2020 11:18:49 -0500
X-Greylist: delayed 1287 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Feb 2020 11:18:49 EST
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id 2247D1CA3A
        for <linux-fbdev@vger.kernel.org>; Fri, 21 Feb 2020 09:57:22 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 5Ag6jWUTBAGTX5Ag6jgrx6; Fri, 21 Feb 2020 09:57:22 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WtMzr2gjoX6df0EoQz24CcYsj+i/bg0u7qsVYdxv5ak=; b=FhvXqQUtu/kbV+Vrnk71BG8yZl
        0TSU2YZiZPuLm929TonrbWh+9w4cqnRMB47gz6qXSDLBweYpn9jQ+EjXxYW/M5bcxnogAtcQqyQcT
        d9YOOfhiTjG1h/fi3IibqqqRun0NUq+ZHlwKQZa8WF1W2O438fbUpOSn0SFF5xQGz3i5HQoQ0UFmX
        1o4m7QN23g9FgLM7f75UPYJm5fMx6rIzxCe4Df7P2QFM8aOXA9Ml7jH9RJH7sBkjxlO1tdJ73WDIu
        G/2bBwvnZdm9s6uI2vLVmlN8cuWvlEiicixYHyVO2UPgWMqlvYp+ALBiFytrjN6JVHyz9MPmuV3z3
        EJXGFXrQ==;
Received: from [200.68.140.54] (port=6638 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j5Ag4-003vD4-K4; Fri, 21 Feb 2020 09:57:20 -0600
Date:   Fri, 21 Feb 2020 10:00:05 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] video: Replace zero-length array with flexible-array member
Message-ID: <20200221160005.GA13552@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.54
X-Source-L: No
X-Exim-ID: 1j5Ag4-003vD4-K4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.54]:6638
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 31
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/video/fbdev/mmp/hw/mmp_ctrl.h | 2 +-
 drivers/video/fbdev/ssd1307fb.c       | 2 +-
 include/video/mmp_disp.h              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/mmp/hw/mmp_ctrl.h b/drivers/video/fbdev/mmp/hw/mmp_ctrl.h
index 335d4983dc52..167585a889d3 100644
--- a/drivers/video/fbdev/mmp/hw/mmp_ctrl.h
+++ b/drivers/video/fbdev/mmp/hw/mmp_ctrl.h
@@ -1406,7 +1406,7 @@ struct mmphw_ctrl {
 
 	/*pathes*/
 	int path_num;
-	struct mmphw_path_plat path_plats[0];
+	struct mmphw_path_plat path_plats[];
 };
 
 static inline int overlay_is_vid(struct mmp_overlay *overlay)
diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 142535267fec..fb2640fe575a 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -89,7 +89,7 @@ struct ssd1307fb_par {
 
 struct ssd1307fb_array {
 	u8	type;
-	u8	data[0];
+	u8	data[];
 };
 
 static const struct fb_fix_screeninfo ssd1307fb_fix = {
diff --git a/include/video/mmp_disp.h b/include/video/mmp_disp.h
index 1f9bc133e230..77252cb46361 100644
--- a/include/video/mmp_disp.h
+++ b/include/video/mmp_disp.h
@@ -231,7 +231,7 @@ struct mmp_path {
 
 	/* layers */
 	int overlay_num;
-	struct mmp_overlay overlays[0];
+	struct mmp_overlay overlays[];
 };
 
 extern struct mmp_path *mmp_get_path(const char *name);
-- 
2.25.0

