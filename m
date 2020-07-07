Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE5B2177ED
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2020 21:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgGGT0f (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Jul 2020 15:26:35 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56202 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbgGGT0f (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Jul 2020 15:26:35 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 067JQVCb140416;
        Tue, 7 Jul 2020 19:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id; s=corp-2020-01-29;
 bh=M0YzIh8yAX65MkbnudndTXO+4zepxLnVZjSce9soDr8=;
 b=Ai0dJnBPN+/3ZmYB45lo9sziEfc6+bP3de/eGt/gadvql5C1aHukQxPkBTxOa+n42TT5
 zFO5YHpj2r7dNPvEaUhP72FMMQYurYJ2BzHe2nTUTYXiDcNfeg+zr/kQAZ0zesopbNp1
 k5vSWVp3ncsvWgmJxHJY1VxqchZQrd2Sg6jyTEtksPHfawBwDhFyTEXNvcdo1cnYOxhq
 5v2NInWHVa4CYc30UughK1VQ0ah94mpLp2i4E11rl8YHBdyZKJAt00KRBWDdw3oZlqE2
 MEpdEsvAh753U7yzCiFf9gFIxQNtzdP9v9wDCs9Q5O4Sls+BDapaEvxCNbmiQRqrPERI ZQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 323sxxtt0q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 07 Jul 2020 19:26:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 067JN4Vd175501;
        Tue, 7 Jul 2020 19:26:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 324n4rq89q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Jul 2020 19:26:29 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 067JQSn5030836;
        Tue, 7 Jul 2020 19:26:28 GMT
Received: from dhcp-10-152-34-21.usdhcp.oraclecorp.com.com (/10.152.34.21)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Jul 2020 12:26:28 -0700
From:   George Kennedy <george.kennedy@oracle.com>
To:     b.zolnierkie@samsung.com, dan.carpenter@oracle.com,
        linux-fbdev@vger.kernel.org, dhaval.giani@oracle.com,
        george.kennedy@oracle.com
Subject: [PATCH 1/1] fbmem: add margin check to fb_check_caps()
Date:   Tue,  7 Jul 2020 15:26:03 -0400
Message-Id: <1594149963-13801-1-git-send-email-george.kennedy@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9675 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0 suspectscore=3
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007070130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9675 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 adultscore=0 cotscore=-2147483648 phishscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 suspectscore=3 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007070130
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

A fb_ioctl() FBIOPUT_VSCREENINFO call with invalid xres setting
or yres setting in struct fb_var_screeninfo will result in a
KASAN: vmalloc-out-of-bounds failure in bitfill_aligned() as
the margins are being cleared. The margins are cleared in
chunks and if the xres setting or yres setting is a value of
zero upto the chunk size, the failure will occur.

Add a margin check to validate xres and yres settings.

Signed-off-by: George Kennedy <george.kennedy@oracle.com>
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Reported-by: syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com
---
 drivers/video/fbdev/core/fbmem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 30e73ec..cd50302 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1007,6 +1007,10 @@ static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
 		return 0;
 	}
 
+	/* bitfill_aligned() assumes that it's at least 8x8 */
+	if (var->xres < 8 || var->yres < 8)
+		return -EINVAL;
+
 	ret = info->fbops->fb_check_var(var, info);
 
 	if (ret)
-- 
1.8.3.1

