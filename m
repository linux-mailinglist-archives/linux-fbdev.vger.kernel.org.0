Return-Path: <linux-fbdev+bounces-595-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E218311E7
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jan 2024 04:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 461081C2088E
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jan 2024 03:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAA96111;
	Thu, 18 Jan 2024 03:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Ffu1MIeq"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2010.outbound.protection.outlook.com [40.92.20.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9C06104;
	Thu, 18 Jan 2024 03:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.20.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705549798; cv=fail; b=fvwI6NonB9TBCBZSJ02tEJ4CkEZw+/XhaqRtUBZlwMKmfplsmPaFHQQdEaZlEpaUPCQ6v/hCxr/GGIXJWPP030vrg7wOvnaRjnP5UGR0eGk221xKhLtsxgCoamygUkWntjrQ5S7/22vzyl0UUl29OJ8rjAwzZ5tECeeVucEatTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705549798; c=relaxed/simple;
	bh=9+ZdnMgXSnEftjkAa5qqD0fMwuYy8Nf080YlBAGoChU=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 Content-Transfer-Encoding:Content-Type:X-TMN:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=PdrwPwzmR2Wv4jIJOlL24UmY1z0vgwJoeHA7HDoHWlNKU/NBUqk8DxakNuz3IZSH6QAXUxFMjLzB+AytLk/Z5DM4JWwuvmXjnOxZZewwqIjpkzweeVGYy1I3DNqb8vf5WtcZHhVDgYt0eeIFBuJ3EE2vzX0vN1+wRROJB3Z0omc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Ffu1MIeq; arc=fail smtp.client-ip=40.92.20.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bz4wypkxoj34g5QrkpTi0OZlmX8MkABuZcyOqKcQwWaQWewaCp3Gw3pO3ra4vKoroJxOnhNOmghhfz3pb6+N34eqO4Qg4Ovd/r5LjvWyKwZDCqe2cJK2XYE7T6LrZEitD3WdZ0zu/2rHGJENmY07JJIIy6ARHvStq6FfOt0YaNZM4leUedhvskJmqbskSVVguIYBvwKN1GZDC0Fxh0dble7P2KC51aK+yt7LSZECC2C/DbjnfZzKRIu58K4F8WjnZbnQvD48jPRkzv/PIcrfCAbiLrtXqAQGFg+H1Pox5DnTCoporbKHoPw7RytGjsfDAu0+/H4yqi8VmFPE9B43Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sK/10QuoOSOznME75OArl9avCk+48frXCoSRNUxVpkA=;
 b=ZeIdo9+Jb93ABEcjF2EWgCRdMpcWlZmZ+2kEmWS8kyJT4xtQNnA+mDIImiNWZPLERJ1Ze/RgbPkRVkopVegiV3J+9IwFJHPg4A3oHBGyySUbFNO0l8fF+/39eqvcXKrAfznOzeYoTWIlAtWlFSPPlAE3plL5wXgZglstFTeIgOizKg6dLnGu6T8FzU+A2NRWxk0v4SQSSN/gpcDzxh1IpVT4UbKtsQJUaDBOy+pci1z8pDN2lB5QbrrvvhObuHSe7LElrHY1lvvhvCrxpI19OxYFvubpEWcRaIBWb7V4ArOp+MdkeIURECchrUJ+WjyIaAUsfw8ea8UJdjFFa3uPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK/10QuoOSOznME75OArl9avCk+48frXCoSRNUxVpkA=;
 b=Ffu1MIeq1Wd4yYsFyoz62AR6df1wNQ4vfOoMBpKsqBTYd/o7wTz8FwC75suQgS8G6Js6UnN8+2IyLPcaP/8FaAYrudXSVo7TXRnflEfqus3QvXJspZz8icNItXpC8NlM5c0PLZGF1MYTx2fPclOz9Mr6x1LGhB3Xdn/CVVp1AyPxQHcxKuVOluGPVShLWNMCND5J3f3ofO1fiK1hO2Dyy6LeXbFtxVoVgmiHzEgfy2ODV7LUPS/TLYrT1cmA5qYxsyu+FxvdhaAFfMhqvoGyZOYVKVrDE0ikk3J0E585sRSLbGM1d/287K3G+AQI4Mb/Yv0y1Jnypko7qHQxzo8OpA==
Received: from PH7PR20MB5925.namprd20.prod.outlook.com (2603:10b6:510:27f::21)
 by CY5PR20MB4796.namprd20.prod.outlook.com (2603:10b6:930:24::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 03:49:54 +0000
Received: from PH7PR20MB5925.namprd20.prod.outlook.com
 ([fe80::e1de:29a8:e090:5b7b]) by PH7PR20MB5925.namprd20.prod.outlook.com
 ([fe80::e1de:29a8:e090:5b7b%4]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 03:49:54 +0000
From: Fullway Wang <fullwaywang@outlook.com>
To: adaplas@gmail.com,
	deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	fullwaywang@tencent.com,
	Fullway Wang <fullwaywang@outlook.com>
Subject: [PATCH] video: fbdev: savage: Error out if pixclock equals zero
Date: Thu, 18 Jan 2024 11:49:40 +0800
Message-ID:
 <PH7PR20MB5925BF5AA6B66B9E8733AFD0BF712@PH7PR20MB5925.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [he3cprEfCXhaGCQcnpqyKaMLVOheYFqg]
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To PH7PR20MB5925.namprd20.prod.outlook.com
 (2603:10b6:510:27f::21)
X-Microsoft-Original-Message-ID:
 <20240118034940.20683-1-fullwaywang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR20MB5925:EE_|CY5PR20MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: fbac9a61-6f28-44f9-2305-08dc17d887c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iqlQ34AHEtiejVqnJWBVkrPkw1bG/1lKKcMX0QIwzX07U+x2WiGg2TZ/fJiJ6VRw86XlAo4mXUG5IJW1IOi8X/c6gEPRh3meMsrSHVL1oPo6wtV5c4Ee46rL0oGZLQCHIBp63vkJwyvI71pKKWc3fGIYUQVEy7A2HPUV1fMrsiCKfq4u7ZJ5me2G2cJgxlAh4DkV4Al36ACPfj1yGzzdIoZONpTHiIWh+CHJt0oJbRQ/sbOVxBjPoIdf2NV0OqUAl+P+xPvlYTjTvI2JU8/YSOV3Rht0YTgkwE2GI9tUKnM2yoXYrgiBcAO2BxPtm83H15jG7A0wIPWmv06ZuwWqlytSD+VKmxyoBQM5n6InAzRReYtWPIhxq+xGo7h1MVZCEyiqPmMUrr7JKT219D5WEG9dWl+zVyRMTkraStr3XwB0afeNU4piYGPX6kFUjwU8E1RaitvYMq6omRb3KYQzAjl5Zcduu0/J6kXS0CtUsx+srRu/7erFsj/j+A5qWB5yD0SHou5d6VhhYQlJuyb6YmHbIe655rcnH0ogZGH6iS/+pgtbx4vXOyT/iWa31q4mqut4qSGsfLLtd9iGb8sHX7GWbun6r16IeuvTT8Fr76IwwlX3tGLEn7WSlzT02wXf
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JGCSxsRDHWIW3i7q7Fu8hy0JDCsQoYA/OGaU7vUMG3v5yxkpvuefvAaMPTpG?=
 =?us-ascii?Q?AuUVu0heJ6dOtQu8h7SonsDQV+mt8yvfkTHcdTOCgDSTAQZ0xD+SDILOzwLT?=
 =?us-ascii?Q?as/YIthO7W+Gss26LTVlD+Qyf/d94Q2Ja3S7B7IkwjCpaS+VKDQcHFAAlAO3?=
 =?us-ascii?Q?PYBHS1Sx2hiPpGgmukkUQH5Tk6YgVMjnKNs4BFfH+9RDXiN++XLw/URZqw12?=
 =?us-ascii?Q?I7R/Q355FyaywDtRl5j4lHfbBpSIfS1CmPZo9I4/01Rp4cqmf42gqOacyg7f?=
 =?us-ascii?Q?sncNzdPCH3WGZnvpxXreyk7xZy4fkzvuWsE1sZ6wB3UsQxeqEVqif7qHSiGh?=
 =?us-ascii?Q?NzBzRVMdR7a1d2TGSr71yK9g2Tf35PbGDm/+/pzipKhIwRr+i0hsD2QQBxRE?=
 =?us-ascii?Q?/ENK6qRMchyALaK5mxm+AoBbvJDOKKr+5ssqYXJi1kSXYNbMiveZO/d/SgwU?=
 =?us-ascii?Q?eok6XGYyoYntIKKygZW7b+jstuR9rRcFz8H2lShQAafd5b3xWXqmO1UFEslx?=
 =?us-ascii?Q?n9bbVkd056ZOQZ6QWqFSt8a6vhKd36EPT2TlbFFwN0eDD0DlFJP45YVSuO56?=
 =?us-ascii?Q?9wYi563kbJRtb57Vtjq6C4MbIpQQlXXwpW9oBp2bq2hZS8eD1ockm01nyWZf?=
 =?us-ascii?Q?OgG37Pt1lyIeizZn7wD55YVtaETjC1sjpDOMydb3J1AtSga4XTXoMsw2Kphg?=
 =?us-ascii?Q?gFzmg6eLvFI4pvV672ATOQW/i6UHqU7nnAzcKJjezUblb04AG6c6XyIYNGf5?=
 =?us-ascii?Q?IwElqUD7CC8qdTMgEgUAp1el7ZxHdwLfA/XDYwmT8p/QcDnRjfkXf7qx26Ih?=
 =?us-ascii?Q?4Bdm3HsjOxB0IV55Nl7xhLc8tLMR28IvuiJ3CMEbKM8ARQxYRO6T7jAwPL3Q?=
 =?us-ascii?Q?2Ab5kH9NGGgVzwQYm/iRRbVHMj34be1cU0zAsYCxuprLeQ5i7JlT7huU+znL?=
 =?us-ascii?Q?sZ9vV64MXqVUs5UDFChoWlzbBufmjrkulRzLE89pw/AiBF/gAu0m4xi7DAsu?=
 =?us-ascii?Q?v4n4v7y3oiMnXa990oJAaLndVLScFmgf4pDfZA7KZBdvkwIid1pG0hYVmlfG?=
 =?us-ascii?Q?lEscjzV6OW6QiRAnFAxrydP6bg3dKNcwO/FAMmIGdBSfICP3fBHyxe+MNbug?=
 =?us-ascii?Q?zIJEdFm2muQIyZOJ/y3JULo7bxe8KERj7elcQGsJQw982IqQ7bqVSNeiJGRS?=
 =?us-ascii?Q?EihJk+nuxM9H42As17Rv/NLXY3D1UoL2PzzYegtxyOIo3o1TnWvgtyi+FwE?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbac9a61-6f28-44f9-2305-08dc17d887c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR20MB5925.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 03:49:54.2490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR20MB4796

The userspace program could pass any values to the driver through
ioctl() interface. If the driver doesn't check the value of pixclock,
it may cause divide-by-zero error.

Although pixclock is checked in savagefb_decode_var(), but it is not
checked properly in savagefb_probe(). Fix this by checking whether
pixclock is zero in the function savagefb_check_var() before
info->var.pixclock is used as the divisor.

This is similar to CVE-2022-3061 in i740fb which was fixed by
commit 15cf0b8.

Signed-off-by: Fullway Wang <fullwaywang@outlook.com>
---
 drivers/video/fbdev/savage/savagefb_driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index dddd6afcb972..ebc9aeffdde7 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -869,6 +869,9 @@ static int savagefb_check_var(struct fb_var_screeninfo   *var,
 
 	DBG("savagefb_check_var");
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	var->transp.offset = 0;
 	var->transp.length = 0;
 	switch (var->bits_per_pixel) {
-- 
2.39.3 (Apple Git-145)


