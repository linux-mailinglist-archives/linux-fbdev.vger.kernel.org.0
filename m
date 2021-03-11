Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A599A337275
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 Mar 2021 13:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhCKMWd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 11 Mar 2021 07:22:33 -0500
Received: from mail-m17635.qiye.163.com ([59.111.176.35]:59318 "EHLO
        mail-m17635.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbhCKMWD (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 11 Mar 2021 07:22:03 -0500
X-Greylist: delayed 499 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Mar 2021 07:22:03 EST
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
        by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 58EB740035F;
        Thu, 11 Mar 2021 20:14:45 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Tony Prisk <linux@prisktech.co.nz>,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH] video: fbdev: delete redundant printing of return value
Date:   Thu, 11 Mar 2021 20:14:40 +0800
Message-Id: <1615464880-18724-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGUlMQkJMH0hMSB4eVkpNSk5PTU9DQ05NT0lVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Py46Lgw*Az8XDwI4EQ40TgMq
        PSgKC0pVSlVKTUpOT01PQ0NOQkNPVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISllXWQgBWUFKTk5DNwY+
X-HM-Tid: 0a782135ed35d991kuws58eb740035f
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

platform_get_irq() has already checked and printed the return value, 
the printing here is nothing special, it is not necessary at all.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/video/fbdev/vt8500lcdfb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/vt8500lcdfb.c b/drivers/video/fbdev/vt8500lcdfb.c
index c614762..4cacff6
--- a/drivers/video/fbdev/vt8500lcdfb.c
+++ b/drivers/video/fbdev/vt8500lcdfb.c
@@ -373,7 +373,6 @@ static int vt8500lcd_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		dev_err(&pdev->dev, "no IRQ defined\n");
 		ret = -ENODEV;
 		goto failed_free_palette;
 	}
-- 
2.7.4

