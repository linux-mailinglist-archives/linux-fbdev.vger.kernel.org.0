Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30CE41A6075
	for <lists+linux-fbdev@lfdr.de>; Sun, 12 Apr 2020 22:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbgDLUVr (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 12 Apr 2020 16:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727315AbgDLUVr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 12 Apr 2020 16:21:47 -0400
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5BFC0A3BF0
        for <linux-fbdev@vger.kernel.org>; Sun, 12 Apr 2020 13:21:47 -0700 (PDT)
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id EE21F80478;
        Sun, 12 Apr 2020 22:21:44 +0200 (CEST)
Date:   Sun, 12 Apr 2020 22:21:43 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     Alexey Charkov <alchark@gmail.com>,
        Paul Mundt <lethal@linux-sh.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: vt8500lcdfb: fix fallthrough warning
Message-ID: <20200412202143.GA26948@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
        a=1cMp6Op0AAAA:8 a=hD80L64hAAAA:8 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8
        a=NcUNtGcOwW8lTd5LSkMA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
        a=cge21SmdFH0vqy2l-lvr:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fix following warning:
vt8500lcdfb.c: In function 'vt8500lcd_blank':
vt8500lcdfb.c:229:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
      if (info->fix.visual == FB_VISUAL_PSEUDOCOLOR ||
         ^
vt8500lcdfb.c:233:2: note: here
     case FB_BLANK_UNBLANK:
     ^~~~

Adding a simple "fallthrough;" fixed the warning.
The fix was build tested.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reported-by: kbuild test robot <lkp@intel.com>
Fixes: e41f1a989408 ("fbdev: Implement simple blanking in pseudocolor modes for vt8500lcdfb")
Cc: Alexey Charkov <alchark@gmail.com>
Cc: Paul Mundt <lethal@linux-sh.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: <stable@vger.kernel.org> # v2.6.38+
---
 drivers/video/fbdev/vt8500lcdfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/vt8500lcdfb.c b/drivers/video/fbdev/vt8500lcdfb.c
index f744479dc7df..c61476247ba8 100644
--- a/drivers/video/fbdev/vt8500lcdfb.c
+++ b/drivers/video/fbdev/vt8500lcdfb.c
@@ -230,6 +230,7 @@ static int vt8500lcd_blank(int blank, struct fb_info *info)
 		    info->fix.visual == FB_VISUAL_STATIC_PSEUDOCOLOR)
 			for (i = 0; i < 256; i++)
 				vt8500lcd_setcolreg(i, 0, 0, 0, 0, info);
+		fallthrough;
 	case FB_BLANK_UNBLANK:
 		if (info->fix.visual == FB_VISUAL_PSEUDOCOLOR ||
 		    info->fix.visual == FB_VISUAL_STATIC_PSEUDOCOLOR)
-- 
2.20.1

