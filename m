Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20F6E1814F3
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Mar 2020 10:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgCKJcg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 11 Mar 2020 05:32:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:32930 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728514AbgCKJcg (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 11 Mar 2020 05:32:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id BF06DB388;
        Wed, 11 Mar 2020 09:32:34 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-fbdev@vger.kernel.org
Subject: [PATCH 2/3] video: omap2: Use scnprintf() for avoiding potential buffer overflow
Date:   Wed, 11 Mar 2020 10:32:29 +0100
Message-Id: <20200311093230.24900-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200311093230.24900-1-tiwai@suse.de>
References: <20200311093230.24900-1-tiwai@suse.de>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
index 4a5db170ef59..2d39dbfa742e 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
@@ -147,11 +147,11 @@ static ssize_t show_overlays(struct device *dev,
 			if (ovl == fbdev->overlays[ovlnum])
 				break;
 
-		l += snprintf(buf + l, PAGE_SIZE - l, "%s%d",
+		l += scnprintf(buf + l, PAGE_SIZE - l, "%s%d",
 				t == 0 ? "" : ",", ovlnum);
 	}
 
-	l += snprintf(buf + l, PAGE_SIZE - l, "\n");
+	l += scnprintf(buf + l, PAGE_SIZE - l, "\n");
 
 	omapfb_unlock(fbdev);
 	unlock_fb_info(fbi);
@@ -328,11 +328,11 @@ static ssize_t show_overlays_rotate(struct device *dev,
 	lock_fb_info(fbi);
 
 	for (t = 0; t < ofbi->num_overlays; t++) {
-		l += snprintf(buf + l, PAGE_SIZE - l, "%s%d",
+		l += scnprintf(buf + l, PAGE_SIZE - l, "%s%d",
 				t == 0 ? "" : ",", ofbi->rotation[t]);
 	}
 
-	l += snprintf(buf + l, PAGE_SIZE - l, "\n");
+	l += scnprintf(buf + l, PAGE_SIZE - l, "\n");
 
 	unlock_fb_info(fbi);
 
-- 
2.16.4

