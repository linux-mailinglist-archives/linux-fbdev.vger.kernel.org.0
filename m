Return-Path: <linux-fbdev+bounces-3637-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D4A2429D
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jan 2025 19:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8DC01888AFF
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jan 2025 18:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2BA1F1920;
	Fri, 31 Jan 2025 18:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KMXZlXZK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tR39KZo6"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EF44315A;
	Fri, 31 Jan 2025 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738348230; cv=fail; b=XdoqRURLmTnyqRXQxWKRiKMKZQFa1vgD1Ir/83EtJDqIpK1OeJoJDr5FS5zavdNZf5EQu2J+wg8hjiM7GOV7hA84mUyg9wtxAsv9/okFxNa0JMzSm7wUTsWJVxiTRRkvJClM8LK9HXo/0u7xUn3IKxHSi/lyEx5gUcCRo4ggfKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738348230; c=relaxed/simple;
	bh=q/MHj43qhzGPE9MMbmoVQWSjQPQHC5cczLJ+8IksXZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W6UjbW0DilC2nrfHAuHZ8fzNISxi0sQS7B/c/f/rtUol54LRKXwmtp0/gVooGgZ/mNqRP/elS1W5owx9f+aJk8mHbOzxF1EQDoVQ9adpuGNhOnZ7DSfHQUQC97PaY+Zc88XAABT893Z2s33x/zs/3NdDbdYXdQtbzHw2gbPQF4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KMXZlXZK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tR39KZo6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VHtm8c024798;
	Fri, 31 Jan 2025 18:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=vIk21mj59ZgaBOgOzltnjU6J7QwYZm9Z6mtoj9ezbAQ=; b=
	KMXZlXZK9VjufQKLZLHUElVYcbJxIDavRQZrXgk2AFyOoVXJ4UIDIF0HpVS8SFZr
	XyiJPFqO169REGrQaDBJO5n7VvzKHErXkJq7I9Gpz3FF+B3NCtRZrF8Y6yJT4p9h
	+RqKy96VQ3rjue0HImxNqwCt0aPTNJZ193RN45PzTVhTAJxQjOr2Mczp70st6li/
	YfjBTXuUNu2OJ9vWWDgqoQzIiE4ljPC0dQM0E+pno72QKfEgS6p2Pia5CDQ0CLJu
	WHXb6NMkLZ/V3XgtGagMyMnYQgC+S96q2Ha5bNr4nLeiYQKwhzuXK/TFAekuumEs
	kVg6P4uIC+iB/qX4UwVOXg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h1yj89fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 18:30:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VIFCtZ016091;
	Fri, 31 Jan 2025 18:30:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44ggvkmvj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 18:30:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srXwS/70AdMYZONhu9+tcwc/fB5lr5jaoas9ckg6zYucDWHMTeF6GQx6fL224n2wadjLItZi9MjqMFlPa/EJQmJbPG7WNZHvQ992ivgHparchORBuc/preT77aTsSCSZyZ9Nb9t2gxOsoHjSOfMyzdJax+6+FylUdnEnVNc8+q7Tcea3xkxuS4Yvp0wJklmhmpgtsjKSKecsg95yl/mJy0EaXKB3rP9MKNVjIDFpcVB9aotUxS03p5hQraxv+QCfxxgTZb2/3IqrQfaVmEwJqzmKejfSaS9golrAgia/gFVY5+zIc9yiEcOhTuDB9TRRnAt/7ScLCfgg8+qVlQo2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIk21mj59ZgaBOgOzltnjU6J7QwYZm9Z6mtoj9ezbAQ=;
 b=HXZtldWyNa8+TU3ZxWsqfJPqPKcjhch9OCQn56t/j3Ti/kJ53EVEsCkdc3jN6SRUenm71uViEiXmv0fQCKtiVflRzhLooxrZTKyWy0cRHRVHAXJu2nakMLdDJ6xelCwX4lXwGT31KwdnH5FBn+9tcztVeLb06VJN6UQ1q/G0O4dqSKnjfyMh69YW+KKHWewyJU+2WP/fao2hSrze59WKzasCQSwzFQ5xEBjT+4tkzSpMvBDOL+7+8u7eZXEyHtMz7o5jcnQFyc7a/H2LiesAPmtWDPjvBWrtJVUT3zfLAytlr01SLp2WJZNtLdpgZ2F1+dh+voa6Pr9cZFMnDPP7oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIk21mj59ZgaBOgOzltnjU6J7QwYZm9Z6mtoj9ezbAQ=;
 b=tR39KZo66nVVUTwhVhluJOehDRDVvlirv76rzYBJmJf6iAhOPx/n9ibt6Xeq1lFOcQhezDn9r6FD65FPQJ8cnEFgxUCsq51kytR9BOKZJ0js3PezdQZnogeb39UcEKGKSgEY/pvZ9YbnVypypmxehJ9jZ69+cK6/3FVJm69FzCk=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB4407.namprd10.prod.outlook.com (2603:10b6:510:31::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 18:30:02 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 18:30:02 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Kajtar Zsolt <soci@c64.rulez.org>, Maira Canal <mcanal@igalia.com>
Subject: [PATCH 2/3] mm: provide mapping_wrprotect_page() function
Date: Fri, 31 Jan 2025 18:28:57 +0000
Message-ID: <c802c17cdba59e3455f3d7db07659d5da0ed6dc1.1738347308.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738347308.git.lorenzo.stoakes@oracle.com>
References: <cover.1738347308.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0169.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::6) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: 081c31c3-9ef9-447f-6f18-08dd42254661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UTNaV3rxV5bwYgGpkjLnLV6xr8KH0+DXX8UnygGzRZWzoMz2brh64jvA73RS?=
 =?us-ascii?Q?aeJe3OkDLHiKphG0RHAE3CtrDtnLxbkYlh29gCj++GRaVnDYPGrmBtO4by14?=
 =?us-ascii?Q?UtbtyKQw2pYwhE8agbt9Ue1bsnXSzuAckaGmxlUJ7QXnG+XapaGY/kzWmhAb?=
 =?us-ascii?Q?yVELD7lQOAPVn3JoRKNWY9kS2KMTKk+d+y7JzQWPXMScexZQZw+XllvLHGue?=
 =?us-ascii?Q?z5NhiBXY5XQ3UFOxa2jOQNB3ebR/HyLl73eVQHZFPJea8PQJWTgkL77fBsKz?=
 =?us-ascii?Q?NhLjcGYerxN5uis15+maEWnI4x/coyfBDnf+VTtFZrsqqXv0cVEYWVketRgl?=
 =?us-ascii?Q?YAKmy9e04mgTDS6OzxzTULc20LkoMjj1P/CTj4ei2ErMutfxZ1dVpdx/J63n?=
 =?us-ascii?Q?hWIC39yuFg/8mCxrPPO4r1GJCwL4NQ5AR/MbWnlYTmftfQvqnJsSzU9uXker?=
 =?us-ascii?Q?+PzPy2IGQwUradIUSwIqYWCrs5aO7goMl92mfGwRzJWxTW9qZlHOCDQZAOTi?=
 =?us-ascii?Q?pCZodbnaotiyzm1NjmpEnwmFIYu/vVnPlvGGWBxnB14C67tYFgoLW8/YknBD?=
 =?us-ascii?Q?rdd8JgYrEEOUjPefnQYmukJHjeev7QPi9N8HwzjhsS6Y/sq3OBFSSQWvv8xO?=
 =?us-ascii?Q?FJ1yIdbKZyt69jTYOePK8uZnooFvYAFc6k7qb6kTinkvlEzAWINu67PQ45Rv?=
 =?us-ascii?Q?2EEW6+Qrq8dqi2MjsEsj7QVaU6a91HYNq8aRn4n4ZoS5REA98bRN8rPRcPhx?=
 =?us-ascii?Q?3t5wE8wmg7sXXOJqio/21RAWpn4t26t269QPkPGFmTdGQ9bqBBfZQI0YXD1h?=
 =?us-ascii?Q?40Yik3Tc6YXQg+1aPS+tr9iWV8gz0KCpal2/k2l49ernOmXkmgqE5NLg/IGu?=
 =?us-ascii?Q?qC/RSJvbRqqFAfIrH8VPFgYl/8TW91SZFNHERhzmuZ2++SlQrjyRaj2AR2gi?=
 =?us-ascii?Q?hXFc4xBC7AzW8OE+NR7XI+z+IxTh0b6k6Nbhif/TXY4FZbSgf2PGcfrJPaJk?=
 =?us-ascii?Q?dZZBIjatISe1Pm1K2DpswHN8qNnALNK9Lrj81fDROd2UJ8m5sJXir6rBhNFj?=
 =?us-ascii?Q?wrZZ1tDXGay1/rUM1GchnappefL3EhAaJ1ufbzwNrxFrkmX3/AmRDBoo0vjG?=
 =?us-ascii?Q?gfI1foHk/LpC91YfD+25m1+t0syCCoi9FpxPdvJ9rkLCImCsCPht68sQeCu8?=
 =?us-ascii?Q?baBZiy6AI5wpy16E5EohVwF0kRcZIYE7btqxDEBbj9QkD3lMt3ZUSSF4xGLE?=
 =?us-ascii?Q?QMmRjaklC6lMUmMPYBaUgSoJSoBlxKT2J/vVDfe1/En8ituqLfE+N6yJjXV1?=
 =?us-ascii?Q?wxvt/BaTveVsP0+Co9c2PaYXP6zd6KH6nlSjlMGKrQjWrNJ7X6em0AWr5ELp?=
 =?us-ascii?Q?Esac69xpHdN65JAada34s43zrU1k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gVsJKjh7Oy6wJ+8VJpbBBJcV6dQ/x+c8oZoLyAoBc0NHI7MmWwucj8DvnvmJ?=
 =?us-ascii?Q?mfeY/pmlI5c4W7SIgElPFOWths5cX+j/uQOUL/1K1MrNsvmgRJPf55nXR9Ro?=
 =?us-ascii?Q?5hxfMhAm9FiIetYaMAmAwgMlyywKNZVz826O6uLtUgRxeQZ3pQBmuYAx3Txt?=
 =?us-ascii?Q?9yo2s7F8ErztKK9h+JM3zAnIpSZKqhvSWritnX190w4uYA1xEtsKMIL1zrSJ?=
 =?us-ascii?Q?bA9UZBgQ8WiNsSSR3oObRy8WVgf7rIcqJPxXU9ZsxE9udVoDNorwYZnsI3y5?=
 =?us-ascii?Q?gfgExfPujEeO+bwN0PgnpDQwWR1I2p5eM9DuIG6aDSPD/yXKruoPuIs3Nsr8?=
 =?us-ascii?Q?TbBVL8vHjyuOojoILX1XZW/0zT79a05VFp/GX8Fb7jKMngugvjMGD/HvLOcO?=
 =?us-ascii?Q?cbYVq7fBoO84pKIZXVqQiJl1SVrqBbiQ7zGWeOg445K7QEg3OjBewrYW7ni5?=
 =?us-ascii?Q?XB2i8TvryHPqQF1YzIkAMgIrUfpkN9DtvfCdIVwD+c89Q/9gz29g9a824HPk?=
 =?us-ascii?Q?E1f5XlO0rlDjA/WO0F4h20c78kFCehqTC+1+WQ50166JYBoSOrQXYpM6YX34?=
 =?us-ascii?Q?cUHrLireJtLIK8iMCGio9fSs+WKZ9KEheG8FIMv6AZshHs9UmGwc9qiFeSpW?=
 =?us-ascii?Q?HZnX5zAeK95HlYfC1xDlPESgTwKLYCDXbDAC1vsGAFUS1a6sr4jKn1norB9p?=
 =?us-ascii?Q?LGl3xPOBPYCPTXuGCQEOFeBftph22H0v1Rr91QZNNyfdvjQeJvC42ocBXTb3?=
 =?us-ascii?Q?Ig8pnxiH0/1t9+UtdtBxilhbqD5PSiPohPSi4mkX4M3636YGDjpDOLFf74H4?=
 =?us-ascii?Q?6+TWxrhpzdRrRabzZLwjSVJDjeJDjyWUZQ2BrVtQTMSRQCVv5CFCRQstCR2A?=
 =?us-ascii?Q?AGNimQ66n2cGTlxiDcBR3OWAabo7IRmjwNjy9C/hS2r4sJ8wYU5C9t4/oqgn?=
 =?us-ascii?Q?uD2bw8FogkHOMthTwMt284Li96mOCR+pM/dYNxaYIPZtfrVODjSMwGOGFKKq?=
 =?us-ascii?Q?zEDLm3Jf5NEColiTpFj+h1RtPP9+F0dvQh9ULaVkvx8TYdGeE0hB7vtI5N8l?=
 =?us-ascii?Q?4p5X6nNQgO3mU4d8rKcVzvH/wXGzrP2gotoYrKCKieCVyaa2bVviewzekNj5?=
 =?us-ascii?Q?R2f+qlzNqiU907KimOWh2KgbqQBRBARhfh2+QUGeuc1veSNYbuslXDlQnXuU?=
 =?us-ascii?Q?r5oTYxn31PRTZiV8hDW35jbudEadRsHRqVb25BGXeheXfM6tBqyWV/rzx7xq?=
 =?us-ascii?Q?sDwlxmh3qP0P6SuUQrHFnKZV6TwDOUXKYX1cpjINiGFuh9APSR7VoxgudJa3?=
 =?us-ascii?Q?tNgXN2ZX4vsGlpRVCDG2Hfr7hvE4y5aNUrHpJdwJ3uI9TMEJXITcJrlyblt0?=
 =?us-ascii?Q?FBg2nozAuFFoI6Xn+QlL/U3sPdCy/nhEnl36Eb4cwDa5yMfvjLbN5K7hSuL0?=
 =?us-ascii?Q?q1eW6y1HNxFMez2fclDiTK9gPoDq1efh8Oc2pp0Aj83+XWeqtUNmV1fVd/v/?=
 =?us-ascii?Q?oinwLQqqIMpnl/LiPC4sUeYCxhTR1YhsqHxoM3hCydqA6IlH2HUmFq3x0xeh?=
 =?us-ascii?Q?HxSOY/Ne2G+v6uxhiJlVsA0KQZmrrFJu+uqx4m6W0em8ahdcr0Od2bIBImnY?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QGn+iZRZrI6ArBF5UPXDa8s+Ub759aBQYXh9aqt7Ei9JpTYJJGO4+FjbWOMOr8rIVP3HjQ/5NPn7kWp9C5fBGp4d46rZwW5GXidPptZ7C9nZeA/ngjw54Vev2pV5oLbm2rOtgaSPRA8tjuZ5thneyl/7UVEk3jtMmLvVJCOXCHopw946ps+waxvekMAo1O6EDY4uCI+PKfjMds55u5C4dH7T9aaQJnwNUyqpoP/pwuCjnzsoxVp4n1intFJQWunQDxzPCE6k3ayVWm/xIEHGNdSS9cHRMyh3YK6S45mTIYRRdUd/Ol+ezCx90jPtLfl7ZodGZ8e2zB5918EQn1Ysi7HdmPf9rHQocwNO0O9G5/mbby7wuIJNwP7WEk3cqfQGfEdrB1eU7IsJo351bUn2Pde8535rHyTUh+mW7LXSFrpLH67R0lpAuc6MlkbEahgE88h8//R8x5RTssNNiHF6qhu0/VxPt04a62Vd2e2ZvsjuCRv7fw8AjB23pt+3HYN4WstaHv/QWIf7AlCojoYYoTaaXvD4Q8g9eggupIZbPfGca535fXEBVE3ixX7qpj5VDbxVoSFHfPOz+x5jxVOIOe+VTNaCwAhSlIngSD2THvc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081c31c3-9ef9-447f-6f18-08dd42254661
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 18:30:01.9229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXnQZExOSlFc/F06n1yBcR3b2dr8BWWXxhq4AUiAb3tKWotf0vx7zp+Q/X2lHdZK6h3qlQZ4gOC7ynpdQoiEncXkseqkJhxhoXe7BhUesEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4407
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310139
X-Proofpoint-ORIG-GUID: mlFgOAIe2mdbnrIRYmRGJ6GLxpsXvmD4
X-Proofpoint-GUID: mlFgOAIe2mdbnrIRYmRGJ6GLxpsXvmD4

in the fb_defio video driver, page dirty state is used to determine when
frame buffer pages have been changed, allowing for batched, deferred I/O to
be performed for efficiency.

This implementation had only one means of doing so effectively - the use of
the folio_mkclean() function.

However, this use of the function is inappropriate, as the fb_defio
implementation allocates kernel memory to back the framebuffer, and then is
forced to specified page->index, mapping fields in order to permit the
folio_mkclean() rmap traversal to proceed correctly.

It is not correct to specify these fields on kernel-allocated memory, and
moreover since these are not folios, page->index, mapping are deprecated
fields, soon to be removed.

We therefore need to provide a means by which we can correctly traverse the
reverse mapping and write-protect mappings for a page backing an
address_space page cache object at a given offset.

This patch provides this - mapping_wrprotect_page() allows for this
operation to be performed for a specified address_space, offset and page,
without requiring a folio nor, of course, an inappropriate use of
page->index, mapping.

With this provided, we can subequently adjust the fb_defio implementation
to make use of this function and avoid incorrect invocation of
folio_mkclean() and more importantly, incorrect manipulation of
page->index, mapping fields.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/rmap.h |  3 ++
 mm/rmap.c            | 73 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 683a04088f3f..0bf5f64884df 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -739,6 +739,9 @@ unsigned long page_address_in_vma(const struct folio *folio,
  */
 int folio_mkclean(struct folio *);
 
+int mapping_wrprotect_page(struct address_space *mapping, pgoff_t pgoff,
+		unsigned long nr_pages, struct page *page);
+
 int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
 		      struct vm_area_struct *vma);
 
diff --git a/mm/rmap.c b/mm/rmap.c
index a2ff20c2eccd..bb5a42d95c48 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1127,6 +1127,79 @@ int folio_mkclean(struct folio *folio)
 }
 EXPORT_SYMBOL_GPL(folio_mkclean);
 
+struct wrprotect_file_state {
+	int cleaned;
+	pgoff_t pgoff;
+	unsigned long pfn;
+	unsigned long nr_pages;
+};
+
+static bool mapping_wrprotect_page_one(struct folio *folio,
+		struct vm_area_struct *vma, unsigned long address, void *arg)
+{
+	struct wrprotect_file_state *state = (struct wrprotect_file_state *)arg;
+	struct page_vma_mapped_walk pvmw = {
+		.pfn		= state->pfn,
+		.nr_pages	= state->nr_pages,
+		.pgoff		= state->pgoff,
+		.vma		= vma,
+		.address	= address,
+		.flags		= PVMW_SYNC,
+	};
+
+	state->cleaned += page_vma_mkclean_one(&pvmw);
+
+	return true;
+}
+
+static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
+			     pgoff_t pgoff_start, unsigned long nr_pages,
+			     struct rmap_walk_control *rwc, bool locked);
+
+/**
+ * mapping_wrprotect_page() - Write protect all mappings of this page.
+ *
+ * @mapping:	The mapping whose reverse mapping should be traversed.
+ * @pgoff:	The page offset at which @page is mapped within @mapping.
+ * @nr_pages:	The number of physically contiguous base pages spanned.
+ * @page:	The page mapped in @mapping at @pgoff.
+ *
+ * Traverses the reverse mapping, finding all VMAs which contain a shared
+ * mapping of the single @page in @mapping at offset @pgoff and write-protecting
+ * the mappings.
+ *
+ * The page does not have to be a folio, but rather can be a kernel allocation
+ * that is mapped into userland. We therefore do not require that the page maps
+ * to a folio with a valid mapping or index field, rather these are specified in
+ * @mapping and @pgoff.
+ *
+ * Return: the number of write-protected PTEs, or an error.
+ */
+int mapping_wrprotect_page(struct address_space *mapping, pgoff_t pgoff,
+		unsigned long nr_pages, struct page *page)
+{
+	struct wrprotect_file_state state = {
+		.cleaned = 0,
+		.pgoff = pgoff,
+		.pfn = page_to_pfn(page),
+		.nr_pages = nr_pages,
+	};
+	struct rmap_walk_control rwc = {
+		.arg = (void *)&state,
+		.rmap_one = mapping_wrprotect_page_one,
+		.invalid_vma = invalid_mkclean_vma,
+	};
+
+	if (!mapping)
+		return 0;
+
+	__rmap_walk_file(/* folio = */NULL, mapping, pgoff, nr_pages, &rwc,
+			 /* locked = */false);
+
+	return state.cleaned;
+}
+EXPORT_SYMBOL_GPL(mapping_wrprotect_page);
+
 /**
  * pfn_mkclean_range - Cleans the PTEs (including PMDs) mapped with range of
  *                     [@pfn, @pfn + @nr_pages) at the specific offset (@pgoff)
-- 
2.48.1


