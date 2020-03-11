Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 916D21814F4
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Mar 2020 10:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728514AbgCKJch (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 11 Mar 2020 05:32:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:32940 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728721AbgCKJcg (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 11 Mar 2020 05:32:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id D0E33B38B;
        Wed, 11 Mar 2020 09:32:34 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-fbdev@vger.kernel.org
Subject: [PATCH 3/3] video: uvesafb: Use scnprintf() for avoiding potential buffer overflow
Date:   Wed, 11 Mar 2020 10:32:30 +0100
Message-Id: <20200311093230.24900-4-tiwai@suse.de>
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
 drivers/video/fbdev/uvesafb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 53d08d1b56f5..1b385cf76110 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1560,7 +1560,7 @@ static ssize_t uvesafb_show_vbe_modes(struct device *dev,
 	int ret = 0, i;
 
 	for (i = 0; i < par->vbe_modes_cnt && ret < PAGE_SIZE; i++) {
-		ret += snprintf(buf + ret, PAGE_SIZE - ret,
+		ret += scnprintf(buf + ret, PAGE_SIZE - ret,
 			"%dx%d-%d, 0x%.4x\n",
 			par->vbe_modes[i].x_res, par->vbe_modes[i].y_res,
 			par->vbe_modes[i].depth, par->vbe_modes[i].mode_id);
-- 
2.16.4

