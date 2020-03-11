Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AED2180D1C
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Mar 2020 02:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbgCKBHm (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 10 Mar 2020 21:07:42 -0400
Received: from mail-mw2nam10olkn2053.outbound.protection.outlook.com ([40.92.42.53]:19936
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727591AbgCKBHm (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 10 Mar 2020 21:07:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Taq44PIsUWwWJm93M+DoHfPaDSUcP8DPdPYiXI6QSkpebuv2mpMyXlXhUGQ7P3eje4JqSfAJYzTPw8fKSQg8kIq8tHV0NqZmmqNbygtjHsQz72aA7CpLUMBktU9ENP5VsiT5niGoMFuiMNNOmPEQw9olgCeCVfMbMRbDt+nj/Tsw61T3iimVdofyAteWBTB1H4Wq08+a8LeP4A4BmbQWjdFtiXXMna9o8lHa6D663Gj7chMd5I/5HP6ZS2jKgQhgvwmqb9CsnTOlz3aRFeJpPa8Q+yMcpzIx9hiP9ggo+haeBtIFt0tl02R3uIrQ42h3Wf5ztSsxMTyNqAAQ2wP0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEPzGK+HYnQKWSQxq30q3/0LsUvOM7W9LTDPFcWXJ+0=;
 b=Wf/BCGuvvh3UdxqYKD7iG0e/zZN+VHx6T8U1/0ieQSPneJGbQ75JD6BGAvggE6cWNhpqxpwGIS6SoFYuxZgvcSllxoY69S+KBjQm3QPP/vgYflxQMy/6kjWVC8m7/Gwx5VggX7067n26peN2OHan8kb9m69/YQsnpEnneTMiPTXH7jChRw1xqQDWw9rcSzPMUAkOzUeKvy9L4vsKufxCwcMSeDi5doU/pCKaSS/NTsUYeR6fIOmpTM6CEcUfkyMPLpRiAl+OXv/D3L+31/Iod4oku6lHrJLNG2pePdieyUv4gvBqkr2UqhQPOmqMF2+pvaZze8IXPTcawaL0IyVTgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=reversing.team; dmarc=pass action=none
 header.from=reversing.team; dkim=pass header.d=reversing.team; arc=none
Received: from MW2NAM10FT038.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e87::38) by
 MW2NAM10HT034.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e87::185)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.11; Wed, 11 Mar
 2020 01:07:40 +0000
Received: from BN6PR04MB0901.namprd04.prod.outlook.com (10.13.154.54) by
 MW2NAM10FT038.mail.protection.outlook.com (10.13.154.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Wed, 11 Mar 2020 01:07:40 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:F45479F7976681BC86A4F49DA766F6AE439ECEC949F8781DF0A17967EE121608;UpperCasedChecksum:A756236C5EFFCDE979EF18E5FF2689410B6CB5380E5B3A95F5074209735D69B1;SizeAsReceived:7383;Count:47
Received: from BN6PR04MB0901.namprd04.prod.outlook.com
 ([fe80::e9d4:f4f1:1249:eb63]) by BN6PR04MB0901.namprd04.prod.outlook.com
 ([fe80::e9d4:f4f1:1249:eb63%6]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 01:07:40 +0000
From:   "Jr Carreiro a.k.a Gordo" <jr@reversing.team>
To:     linux-fbdev@vger.kernel.org
Subject: [PATCH] Staging: fbtft: Remove space prohibited before that close parenthesis ')'
Date:   Wed, 11 Mar 2020 01:07:30 +0000
Message-ID: <BN6PR04MB090145E76716CBDCD1289656B4FC0@BN6PR04MB0901.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: CPXP152CA0013.LAMP152.PROD.OUTLOOK.COM (2603:10d6:103::25)
 To BN6PR04MB0901.namprd04.prod.outlook.com (2603:10b6:405:45::21)
X-Microsoft-Original-Message-ID: <20200311010730.26869-1-jr@reversing.team>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (201.82.97.233) by CPXP152CA0013.LAMP152.PROD.OUTLOOK.COM (2603:10d6:103::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14 via Frontend Transport; Wed, 11 Mar 2020 01:07:39 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200311010730.26869-1-jr@reversing.team>
X-TMN:  [ysjxQnGPFkp27zMdLEUQtq2BOMvKbgd2]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b2e1f7d2-66b7-425d-2ae2-08d7c5589864
X-MS-TrafficTypeDiagnostic: MW2NAM10HT034:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjlyrjpzCSNMi69D2BeckL776b76zWQVBYEfsArNC9OU5gm+BA0rhmwfeTPU1Ra8d9TpVB2TMFSMDNrcIAGk5iRp5YfD3k1UE42zTfwi1JBA0XzEZcx3BTssX8q8wpUMkd74v8fsZpWdz892VXYsZTKDWIXNRAFJJlEwbSD60kSLiYBfkRz5bWwTJrGba2SV
X-MS-Exchange-AntiSpam-MessageData: xq5SCNF6y8TP/H33Qn7Iqu9QWohDZhz8NU7ygSU+HWXQrkXbxpO5KaqDc03DSbU/xGLbwjOn/UVoSc4nwiX1mam+sl2mF+V3ZwXiSAR5Ex6XPXA7lZm+KPySa7xISmAyx9UAmd0U6U32dn3kKY/loA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e1f7d2-66b7-425d-2ae2-08d7c5589864
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 01:07:40.5876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2NAM10HT034
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Gordo <jr@reversing.team>

This patch fixes the checkpatch.pl error:

FILE: drivers/staging/fbtft/fbtft-bus.c:65:
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )

 FILE: drivers/staging/fbtft/fbtft-bus.c:67:
 +define_fbtft_write_reg(fbtft_write_reg8_bus8, u16, u16, )
---
 README                            | 3 +++
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 init/main.c                       | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/README b/README
index 669ac7c32..700e2fba3 100644
--- a/README
+++ b/README
@@ -16,3 +16,6 @@ several of them using the Restructured Text markup notation.
 Please read the Documentation/process/changes.rst file, as it contains the
 requirements for building and running the kernel, and information about
 the problems which may result by upgrading your kernel.
+
+Checking if send-email works
+
diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 63c65dd67..847cbfbbd 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
diff --git a/init/main.c b/init/main.c
index f95b014a5..f8a2f6cb9 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1360,6 +1360,7 @@ static int __ref kernel_init(void *unused)
 	numa_default_policy();
 
 	rcu_end_inkernel_boot();
+   pr_err("\n================\nHello LKCAMP !!!\n================\n\n"); 
 
 	if (ramdisk_execute_command) {
 		ret = run_init_process(ramdisk_execute_command);
-- 
2.20.1

