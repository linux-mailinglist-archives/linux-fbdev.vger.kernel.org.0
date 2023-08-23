Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A43785162
	for <lists+linux-fbdev@lfdr.de>; Wed, 23 Aug 2023 09:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbjHWHWN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 23 Aug 2023 03:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjHWHWN (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 23 Aug 2023 03:22:13 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2411ADB
        for <linux-fbdev@vger.kernel.org>; Wed, 23 Aug 2023 00:22:11 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RVyKy4PQQzrSgM;
        Wed, 23 Aug 2023 15:20:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 15:22:08 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tzimmermann@suse.de>, <sam@ravnborg.org>, <javierm@redhat.com>,
        <syoshida@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Helge Deller <deller@gmx.de>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] fbdev/core: Use list_for_each_entry() helper
Date:   Wed, 23 Aug 2023 15:21:49 +0800
Message-ID: <20230823072150.451189-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Convert list_for_each() to list_for_each_entry() so that the pos
list_head pointer and list_entry() call are no longer needed, which
can reduce a few lines of code. No functional changed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/video/fbdev/core/fbsysfs.c |  8 ++------
 drivers/video/fbdev/core/modedb.c  | 22 +++++-----------------
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index fafe574398b0..1b3c9958ef5c 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -61,14 +61,12 @@ static ssize_t store_mode(struct device *device, struct device_attribute *attr,
 	struct fb_var_screeninfo var;
 	struct fb_modelist *modelist;
 	struct fb_videomode *mode;
-	struct list_head *pos;
 	size_t i;
 	int err;
 
 	memset(&var, 0, sizeof(var));
 
-	list_for_each(pos, &fb_info->modelist) {
-		modelist = list_entry(pos, struct fb_modelist, list);
+	list_for_each_entry(modelist, &fb_info->modelist, list) {
 		mode = &modelist->mode;
 		i = mode_string(mstr, 0, mode);
 		if (strncmp(mstr, buf, max(count, i)) == 0) {
@@ -129,13 +127,11 @@ static ssize_t show_modes(struct device *device, struct device_attribute *attr,
 {
 	struct fb_info *fb_info = dev_get_drvdata(device);
 	unsigned int i;
-	struct list_head *pos;
 	struct fb_modelist *modelist;
 	const struct fb_videomode *mode;
 
 	i = 0;
-	list_for_each(pos, &fb_info->modelist) {
-		modelist = list_entry(pos, struct fb_modelist, list);
+	list_for_each_entry(modelist, &fb_info->modelist, list) {
 		mode = &modelist->mode;
 		i += mode_string(buf, i, mode);
 	}
diff --git a/drivers/video/fbdev/core/modedb.c b/drivers/video/fbdev/core/modedb.c
index f7e019dded0f..7196b055f2bd 100644
--- a/drivers/video/fbdev/core/modedb.c
+++ b/drivers/video/fbdev/core/modedb.c
@@ -963,15 +963,12 @@ int fb_mode_is_equal(const struct fb_videomode *mode1,
 const struct fb_videomode *fb_find_best_mode(const struct fb_var_screeninfo *var,
 					     struct list_head *head)
 {
-	struct list_head *pos;
 	struct fb_modelist *modelist;
 	struct fb_videomode *mode, *best = NULL;
 	u32 diff = -1;
 
-	list_for_each(pos, head) {
+	list_for_each_entry(modelist, head, list) {
 		u32 d;
-
-		modelist = list_entry(pos, struct fb_modelist, list);
 		mode = &modelist->mode;
 
 		if (mode->xres >= var->xres && mode->yres >= var->yres) {
@@ -1001,15 +998,12 @@ const struct fb_videomode *fb_find_best_mode(const struct fb_var_screeninfo *var
 const struct fb_videomode *fb_find_nearest_mode(const struct fb_videomode *mode,
 					        struct list_head *head)
 {
-	struct list_head *pos;
 	struct fb_modelist *modelist;
 	struct fb_videomode *cmode, *best = NULL;
 	u32 diff = -1, diff_refresh = -1;
 
-	list_for_each(pos, head) {
+	list_for_each_entry(modelist, head, list) {
 		u32 d;
-
-		modelist = list_entry(pos, struct fb_modelist, list);
 		cmode = &modelist->mode;
 
 		d = abs(cmode->xres - mode->xres) +
@@ -1041,13 +1035,11 @@ const struct fb_videomode *fb_find_nearest_mode(const struct fb_videomode *mode,
 const struct fb_videomode *fb_match_mode(const struct fb_var_screeninfo *var,
 					 struct list_head *head)
 {
-	struct list_head *pos;
 	struct fb_modelist *modelist;
 	struct fb_videomode *m, mode;
 
 	fb_var_to_videomode(&mode, var);
-	list_for_each(pos, head) {
-		modelist = list_entry(pos, struct fb_modelist, list);
+	list_for_each_entry(modelist, head, list) {
 		m = &modelist->mode;
 		if (fb_mode_is_equal(m, &mode))
 			return m;
@@ -1065,13 +1057,11 @@ const struct fb_videomode *fb_match_mode(const struct fb_var_screeninfo *var,
  */
 int fb_add_videomode(const struct fb_videomode *mode, struct list_head *head)
 {
-	struct list_head *pos;
 	struct fb_modelist *modelist;
 	struct fb_videomode *m;
 	int found = 0;
 
-	list_for_each(pos, head) {
-		modelist = list_entry(pos, struct fb_modelist, list);
+	list_for_each_entry(modelist, head, list) {
 		m = &modelist->mode;
 		if (fb_mode_is_equal(m, mode)) {
 			found = 1;
@@ -1152,7 +1142,6 @@ void fb_videomode_to_modelist(const struct fb_videomode *modedb, int num,
 const struct fb_videomode *fb_find_best_display(const struct fb_monspecs *specs,
 					        struct list_head *head)
 {
-	struct list_head *pos;
 	struct fb_modelist *modelist;
 	const struct fb_videomode *m, *m1 = NULL, *md = NULL, *best = NULL;
 	int first = 0;
@@ -1161,8 +1150,7 @@ const struct fb_videomode *fb_find_best_display(const struct fb_monspecs *specs,
 		goto finished;
 
 	/* get the first detailed mode and the very first mode */
-	list_for_each(pos, head) {
-		modelist = list_entry(pos, struct fb_modelist, list);
+	list_for_each_entry(modelist, head, list) {
 		m = &modelist->mode;
 
 		if (!first) {
-- 
2.34.1

