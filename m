Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46BB560BDEC
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Oct 2022 00:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiJXWyw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Oct 2022 18:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbiJXWyc (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Oct 2022 18:54:32 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA9D2D12A1
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Oct 2022 14:16:10 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MwxVv5yLtzJn9K
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Oct 2022 21:58:31 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 22:01:16 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 22:01:16 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-fbdev@vger.kernel.org>
CC:     <deller@gmx.de>, <yangyingliang@huawei.com>
Subject: [PATCH] video: fbdev: cyber2000fb: fix missing pci_disable_device()
Date:   Mon, 24 Oct 2022 22:00:28 +0800
Message-ID: <20221024140028.2896689-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Add missing pci_disable_device() in error path of probe() and remove() path.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/video/fbdev/cyber2000fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 585af90a68a5..31ff1da82c05 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1796,6 +1796,7 @@ static int cyberpro_pci_probe(struct pci_dev *dev,
 failed_regions:
 	cyberpro_free_fb_info(cfb);
 failed_release:
+	pci_disable_device(dev);
 	return err;
 }
 
@@ -1812,6 +1813,7 @@ static void cyberpro_pci_remove(struct pci_dev *dev)
 			int_cfb_info = NULL;
 
 		pci_release_regions(dev);
+		pci_disable_device(dev);
 	}
 }
 
-- 
2.25.1

