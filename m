Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9448119CEB3
	for <lists+linux-fbdev@lfdr.de>; Fri,  3 Apr 2020 04:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389366AbgDCC1i (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 2 Apr 2020 22:27:38 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:36724 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390163AbgDCC1i (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 2 Apr 2020 22:27:38 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 64E5E7DD1FE74094EAC8;
        Fri,  3 Apr 2020 10:27:27 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Apr 2020
 10:27:16 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <b.zolnierkie@samsung.com>, <gregkh@linuxfoundation.org>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] video: fbdev: mb862xx: remove set but not used variable 'mdr'
Date:   Fri, 3 Apr 2020 10:25:53 +0800
Message-ID: <20200403022553.33320-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fix the following gcc warning:

drivers/video/fbdev/mb862xx/mb862xxfb_accel.c:187:6: warning: variable
‘mdr’ set but not used [-Wunused-but-set-variable]
  int mdr;
      ^~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/video/fbdev/mb862xx/mb862xxfb_accel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
index 42569264801f..d40b806461ca 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
@@ -184,7 +184,6 @@ static void mb86290fb_imageblit16(u32 *cmd, u16 step, u16 dx, u16 dy,
 static void mb86290fb_imageblit(struct fb_info *info,
 				const struct fb_image *image)
 {
-	int mdr;
 	u32 *cmd = NULL;
 	void (*cmdfn) (u32 *, u16, u16, u16, u16, u16, u32, u32,
 		       const struct fb_image *, struct fb_info *) = NULL;
@@ -196,7 +195,6 @@ static void mb86290fb_imageblit(struct fb_info *info,
 	u16 dx = image->dx, dy = image->dy;
 	int x2, y2, vxres, vyres;
 
-	mdr = (GDC_ROP_COPY << 9);
 	x2 = image->dx + image->width;
 	y2 = image->dy + image->height;
 	vxres = info->var.xres_virtual;
-- 
2.17.2

