Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDCB1814F5
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Mar 2020 10:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgCKJch (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 11 Mar 2020 05:32:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:32924 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728349AbgCKJcg (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 11 Mar 2020 05:32:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id BAF13B387;
        Wed, 11 Mar 2020 09:32:34 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-fbdev@vger.kernel.org
Subject: [PATCH 1/3] video: omapfb: Use scnprintf() for avoiding potential buffer overflow
Date:   Wed, 11 Mar 2020 10:32:28 +0100
Message-Id: <20200311093230.24900-2-tiwai@suse.de>
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
 drivers/video/fbdev/omap/omapfb_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index e8a304f84ea8..1a9d6242916e 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1247,7 +1247,7 @@ static ssize_t omapfb_show_caps_num(struct device *dev,
 	size = 0;
 	while (size < PAGE_SIZE && plane < OMAPFB_PLANE_NUM) {
 		omapfb_get_caps(fbdev, plane, &caps);
-		size += snprintf(&buf[size], PAGE_SIZE - size,
+		size += scnprintf(&buf[size], PAGE_SIZE - size,
 			"plane#%d %#010x %#010x %#010x\n",
 			plane, caps.ctrl, caps.plane_color, caps.wnd_color);
 		plane++;
@@ -1268,28 +1268,28 @@ static ssize_t omapfb_show_caps_text(struct device *dev,
 	size = 0;
 	while (size < PAGE_SIZE && plane < OMAPFB_PLANE_NUM) {
 		omapfb_get_caps(fbdev, plane, &caps);
-		size += snprintf(&buf[size], PAGE_SIZE - size,
+		size += scnprintf(&buf[size], PAGE_SIZE - size,
 				 "plane#%d:\n", plane);
 		for (i = 0; i < ARRAY_SIZE(ctrl_caps) &&
 		     size < PAGE_SIZE; i++) {
 			if (ctrl_caps[i].flag & caps.ctrl)
-				size += snprintf(&buf[size], PAGE_SIZE - size,
+				size += scnprintf(&buf[size], PAGE_SIZE - size,
 					" %s\n", ctrl_caps[i].name);
 		}
-		size += snprintf(&buf[size], PAGE_SIZE - size,
+		size += scnprintf(&buf[size], PAGE_SIZE - size,
 				 " plane colors:\n");
 		for (i = 0; i < ARRAY_SIZE(color_caps) &&
 		     size < PAGE_SIZE; i++) {
 			if (color_caps[i].flag & caps.plane_color)
-				size += snprintf(&buf[size], PAGE_SIZE - size,
+				size += scnprintf(&buf[size], PAGE_SIZE - size,
 					"  %s\n", color_caps[i].name);
 		}
-		size += snprintf(&buf[size], PAGE_SIZE - size,
+		size += scnprintf(&buf[size], PAGE_SIZE - size,
 				 " window colors:\n");
 		for (i = 0; i < ARRAY_SIZE(color_caps) &&
 		     size < PAGE_SIZE; i++) {
 			if (color_caps[i].flag & caps.wnd_color)
-				size += snprintf(&buf[size], PAGE_SIZE - size,
+				size += scnprintf(&buf[size], PAGE_SIZE - size,
 					"  %s\n", color_caps[i].name);
 		}
 
-- 
2.16.4

