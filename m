Return-Path: <linux-fbdev+bounces-3233-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E5995D36
	for <lists+linux-fbdev@lfdr.de>; Wed,  9 Oct 2024 03:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF5B1C2357E
	for <lists+linux-fbdev@lfdr.de>; Wed,  9 Oct 2024 01:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DBC364BA;
	Wed,  9 Oct 2024 01:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lNVGoDj9"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D421D69E;
	Wed,  9 Oct 2024 01:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728438295; cv=fail; b=lV1Ss65tOeJarN32KliILV4F+zKypix8mhvsxUKOI6mD38Of3Dup26H/v8DFqVQznIlLf+2e7HI04wcunMyDnhALZ34brRenbX9cxoFbre6SMFdYyWSFVV4ZlzBgv8+4rabVOcDgNPmqLbj2c8jqhlQcdOsiCacDDQzBCk/fDXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728438295; c=relaxed/simple;
	bh=PqYAW5u12Pijloz/G0d1lVBXUhFxgnrIUYX8HtZJKKc=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PPPdEhi9dA3iLvrgtLfCAunfANXEW2Zo6/GC26SzKsp2pz5Ru1KQKzSI4N/W5nm5Eda42f7g8QsymQ6kp1SyKyBXIj1d4+qEAx0I5FvHFzEf+35XYLR/VMybQpdEqTMh5CRHCPSV0e6ID3oAtRxSPXwgcgLrqAhAjafe29/FbMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lNVGoDj9; arc=fail smtp.client-ip=52.101.125.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5HKtOMySErihMIfENmnURQ+d51HeBk6daLdGKAn/emfY1TWKMokA5utqdDeCmEtI+JstRIgn34lRkergugUo/I9BOpibNX7Bltk7GSAkZ0TAVeppfY+OqZcIKeo737J3r3/2pb+J2miHkpjfiPxhaVHNouxrfx/lH1t5ClPDRyABOeFZPD9RgGhthqBI4lP/Lckng5Q5He6I/hPVTeDjAgU5Ds/4u3lyPZJXmdN6wI6LQCDl2GkNgtD/3LX26jaX/bL8wS60K11xmBbX0Fyu1chvtCvOSqOerE1htXXBA3tNG84Ui/RSM/HK9NQ4/Q0QyMbdMl+Jrgx9nymf+h8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGjZIhB+elB0dqTsvRysDjB811MCxqKaJeFpHJ6knI0=;
 b=KShvQ7GFjpZv78XWq4grdDd7rLotoI9SXO+GsQoXo+zd4S5x5SO7ra9JsZg2sygxnmYqoM+64tzkiQOyTsPXhWNxMxrztAg/eztC/dgCj2946xCgO1otaJB8EzghX8ggHvqhd8SMsUXP7lO449wigeFZCbYIY3Pq2bVZsAs1AynPvdfIhLkjprYUDVrsV+Miw0RhAuaY6BOHbIBJ7tv1pOSOElxgYsL+nBj+pxhuGjeEAItKDVwmgrt/lLzNXKzs3frQtvI6zlODfeFxp5zblsznS0S7e2ouEHFA6S+uZDxOzOfyiRvXnDoq0WhPYBZo0eC+aMtuzGkilvet9Y1d5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGjZIhB+elB0dqTsvRysDjB811MCxqKaJeFpHJ6knI0=;
 b=lNVGoDj9sjJ0mXWdVLjsoyvwMZo5S1ssZAV3S8MihiYi9OGwtmQWV/a36Vz2NMf7QSJ43mUfG4kfVMrODLS8GjmPnrGsqXh8M8unjmCHVyhm9DBIFsEntA+r492soVNbMqRSErJ/AtqvQtXjvHB2yULXv86SWHu1TtVkSpVXsPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11140.jpnprd01.prod.outlook.com
 (2603:1096:400:3df::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 01:44:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 01:44:49 +0000
Message-ID: <87v7y2rqwf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 1/9] of: property: add of_graph_get_next_port()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>
In-Reply-To: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Oct 2024 01:44:48 +0000
X-ClientProxiedBy: TYCP286CA0180.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11140:EE_
X-MS-Office365-Filtering-Correlation-Id: d190d650-d59e-418a-690e-08dce803f60f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Nc0sTzZqwtzqyYrHAtXKE43tH0akrPwnPkN3XeLBdMhjyxVz/fxXz8JbZ7lj?=
 =?us-ascii?Q?kGj9JWhhjPkb7MrfwxaY5sTO+FKmMuKwqo4fYOv8tK4OD6YrHydjDtqk+Bn/?=
 =?us-ascii?Q?PPZlFns/RQI0bT8BnLb5Sg75QJU/gKgjcKtyr+R44g0Z8XIzMDj4tCaNCS4l?=
 =?us-ascii?Q?jtgHW7JeR/KimAq2Zpm6DEhqtCfd3O8i4pHFZt1sQziauSisA6dF+x36TwQJ?=
 =?us-ascii?Q?e1iLdenqOWAIxL4SMlIMdoPFOmBFEblHLrsqKqqKtVauzZMlqpxl1E2oGEXX?=
 =?us-ascii?Q?c9taRaQDLo5tCzOd5c8haBuknuM52+KlAex9Le5DY1CFtqk52ycFogzcoFRZ?=
 =?us-ascii?Q?75VLeKoFY2YescvnfKW4V2o/vLdR7rAX9skIlu22UPMRe1tDePKfkr+MyDQq?=
 =?us-ascii?Q?sksKQpkSUfAgmaFjCchNTZFib7wCgqBg00f4xUbo2kltt+KeCo4UfYNzsJ9X?=
 =?us-ascii?Q?jmW1DoD6vwqqik1BwQQLXRMQ9F4CoAOnl2uh+5UF9w8Fc3ypRd6/ZlwJQPf9?=
 =?us-ascii?Q?4odL68Bdh0Dg8YI/vJ5LxHjMGb8lMmcRpgFxJ8z0oQ6FTFlYNbOyky/wS+t0?=
 =?us-ascii?Q?uQhXKC/jQ+ktp8GgRwosOry5GH8k1sH/jh5ng/UqiXmLq38vZSo2WGAFXm4Q?=
 =?us-ascii?Q?/iRs4kEMcqa5Dwwb8BoPVn3cTK5AcBJ0Mo8ex4VD/v0vmZUDzkFQzvJZu9sX?=
 =?us-ascii?Q?ZtvI1/GCqoccMbHxz08U4wFo4MPdLXgN5v9FwdNpZ//z/Xxyk8ziwOrMGWM/?=
 =?us-ascii?Q?Nwec8cH4lZ/Or/ur0wz21Hl7gVyJkKPMR3nUSzwkua5ygCfE3X9bildAHhxx?=
 =?us-ascii?Q?VryzJZClA6/ul/oPlpihTK8DTCU56ghGFhSWf6HXQkJdahpttGlnuKQ/YIcF?=
 =?us-ascii?Q?++cc81MuCjb/3yYDl3+XTwWz9zLOEDYe5hinq2KhWJqpubGn8TfbUmjGUdBO?=
 =?us-ascii?Q?BCw3454Ns7Wwl3GD0EE3FmX4lRn+MOsKY4dPCFYnwo7pxgU26DhT6y9lNzL7?=
 =?us-ascii?Q?2AU1peDaELScEDIaHF5XPw/3CG8aoI/3rRPQcXACcjbARNOZGFs0RnbE48Y9?=
 =?us-ascii?Q?A6IjbjG4aLZvdBibbMFYvlbnuC1T9ua8YrAW/u9UaluogM/MIyijqLi8kh+j?=
 =?us-ascii?Q?alBP7W5rixqMXpzLdBz9xFdhRiSCLwLdlElZs3RlbSatmldKMqRBla43FD8f?=
 =?us-ascii?Q?x89NnLHs0UjCZgwVzOB1VsShOoN70eXGOTb6ypgSehBWKFXsEknXhvuTfTfL?=
 =?us-ascii?Q?1IkaMda4wdvw0kpBPz099WNlLJTxJF39oqFQyHX5SYDQaQOo6yhfLvUuYXi0?=
 =?us-ascii?Q?laCKCpNuPb30kuhaKbi7exo+sNEBd+LMGMmvgSij6Lf6i+LU9D0XjlqkFM/G?=
 =?us-ascii?Q?nI3RON0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?jBImTV7yhrFful175lzEcz4peFx4VZ88KkJIANTqSHVGPcx+cITFw78VeH7Q?=
 =?us-ascii?Q?M2i924m652FXw5uweVdUTGuu2rkwJ/KzJDX36P2GnYOMf8GcbcS6x49OiInG?=
 =?us-ascii?Q?b5tA+zbbX3+gAj3b9ejFqpJwXNsWQjNXCRo6oY2GK4imWgK17w0g5mQbcB+F?=
 =?us-ascii?Q?mIpGFhZ5FfzjIfXJvv1Rn1/Wmj3F0V5nT6IZ/SAOKYpkwoLM3CJL/NeWwVBi?=
 =?us-ascii?Q?yeeS65TWzq0okVYzB0GzcoGEskZ/wMUe/hEVpKfKPU1oyMzt/1qbnM0/+Rs5?=
 =?us-ascii?Q?h1XzSpmxohG8IlmkTsKPm6przwAcNGid1Iga5X+/3M3M2hDm/sdTXC9gNn4J?=
 =?us-ascii?Q?uly8BXvCiFZc6VOQaiCyoJPVJQTdV1A6cTDQv0TEVFW0eV70BDBvD+vk++PN?=
 =?us-ascii?Q?kMuLqJeaHYurhWVK9OXCdniGYEoqnet0XumvHZUssNv46A1PVilDoNOqv8UP?=
 =?us-ascii?Q?bhpnNw8f7XDU2C3s9xHXCL4XVLgP+V0OeFFu/6FJUP9k3jFomXBC+1+B4VE2?=
 =?us-ascii?Q?ya1pLGtMpm/hCTD/mRD7rsfj3prHWixihfPIuV8whRdHcYZvqNZzi22XYJsW?=
 =?us-ascii?Q?pdyoJ4vvv34hG15aXG4H5b24nsXqHbePd7L46oCyKn77OtlOZ1Ykk+FAp1sm?=
 =?us-ascii?Q?XfmuLoW7UvPULMuiMagypoRd/+VF22ZF6t5BIjntfu8MoRZy/FHkS55HYFlZ?=
 =?us-ascii?Q?4gdTA3BVcAVlxLTXLdlngJVi4lPCybPR4UD02bj07mbXU2OIihMa2KROMVv8?=
 =?us-ascii?Q?I8wirNqit0fDrcBrav4tV6F2PQfP8kVOyUYC4rSYwCJ5YowBD+kWAwVilh8R?=
 =?us-ascii?Q?cMgblkUvt/Lk/nrX8uC3Mzf95wcG6sOgq735Ri1CcK2PYEqTxZRL1Q3h0SD5?=
 =?us-ascii?Q?D5w3xYFd3VSAlpnBZeKg3hf6E1vpPa4rbctmaIYW7VrF0bhOQEcd8LYbcj4E?=
 =?us-ascii?Q?ZGpp2NcdA149QFJAHpjHo0CDUzRvUH+MPmbe7CRcx23YQ8KL8fjBRXtjIVZ+?=
 =?us-ascii?Q?2Y62mGVIxrxMCNi+5h3UqZubCVrlRbSuV62hGfJai0phGhHamK+uvOHudPvf?=
 =?us-ascii?Q?qGWSnFJYsmKj8ABitKpGzfItgEK2qoP7Z10R9Z23aM4rPjJ4jAUzbRgmGHVP?=
 =?us-ascii?Q?+ZGfCualcn537bBM14eImk104hjueJvMsZPZh2HkllqNxBUMmGBc9S1wqZNk?=
 =?us-ascii?Q?j1Nra77rVxP6P9KoCnd5asQ313HeUngdWhPAm1GJLfYZxcUNpmGmqXc1UVv2?=
 =?us-ascii?Q?JhJpg6/RRWIZDdcRw5UlJ5GtDzP1+3gLWUWR3W9DsosrnEv0bM5H2ZDTJltE?=
 =?us-ascii?Q?GatzFp4iKJHrVU9fMGXfvBxOb4pNNUY7ZTcpzRRN02rJs2a49ally8bLowi/?=
 =?us-ascii?Q?HF7lv2+yJEX5qRO8L01F1tUBkO58T0cZYmWchl34SSSAnLDJA/H7QpdL4Lkv?=
 =?us-ascii?Q?u/MD0L7fZZrS40Wi/TnnFETdlus0sEJX7YtHvUcETGXevUbmDLRTna65QWPa?=
 =?us-ascii?Q?ehon2JJkUTbBCki1ZHD/ha21luAXb7FUm/EAVRIclxckANo8bwlJYA19UZN8?=
 =?us-ascii?Q?eOAfGcl2RxNP5vwmbopxpF237fHCtW3cEYnzlK6MthVcwhUXRJHObjmcEvPa?=
 =?us-ascii?Q?Ue78843hpOc4gBpzkcunX2w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d190d650-d59e-418a-690e-08dce803f60f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:44:49.1597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKIAV+4aaRLeuDdElsJt2Haw31KNbuQfTMM6omgI3L8K7aWGb4XUSzGgK5nAaQk6qUwhKLTQBY3u1S3bi57XsUomMe2vISdTJW1REN7123465xEmdoHVn0xeOhLq3GkO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11140

We have endpoint base functions
	- of_graph_get_next_endpoint()
	- of_graph_get_endpoint_count()
	- for_each_endpoint_of_node()

Here, for_each_endpoint_of_node() loop finds each endpoints

	ports {
		port@0 {
(1)			endpoint {...};
		};
		port@1 {
(2)			endpoint {...};
		};
		...
	};

In above case, it finds endpoint as (1) -> (2) -> ...

Basically, user/driver knows which port is used for what, but not in
all cases. For example on flexible/generic driver case, how many ports
are used is not fixed.

For example Sound Generic Card driver which is very flexible/generic and
used from many venders can't know how many ports are used, and used for
what, because it depends on each vender SoC and/or its used board.

And more, the port can have multi endpoints. For example Generic Sound
Card case, it supports many type of connection between CPU / Codec, and
some of them uses multi endpoint in one port. see below.

	ports {
(A)		port@0 {
(1)			endpoint@0 {...};
(2)			endpoint@1 {...};
		};
(B)		port@1 {
(3)			endpoint {...};
		};
		...
	};

Generic Sound Card want to handle each connection via "port" base instead
of "endpoint" base. But, it is very difficult to handle each "port" via
existing for_each_endpoint_of_node(). Because getting each "port" via
of_get_parent() from each "endpoint" doesn't work. For example in above
case, both (1) (2) endpoint has same "port" (= A).

Add "port" base functions.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 54 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of_graph.h | 28 +++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 11b922fde7af..6a5d27dd0c64 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -630,6 +630,43 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
 }
 EXPORT_SYMBOL(of_graph_get_port_by_id);
 
+/**
+ * of_graph_get_next_port() - get next port node.
+ * @parent: pointer to the parent device node, or parent ports node
+ * @prev: previous port node, or NULL to get first
+ *
+ * Parent device node can be used as @parent whether device node has ports node or not.
+ * It will work same as ports@0 node.
+ *
+ * Return: A 'port' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_port(const struct device_node *parent,
+					   struct device_node *prev)
+{
+	if (!parent)
+		return NULL;
+
+	if (!prev) {
+		struct device_node *node __free(device_node) =
+			of_get_child_by_name(parent, "ports");
+
+		if (node)
+			parent = node;
+
+		return of_get_child_by_name(parent, "port");
+	}
+
+	do {
+		prev = of_get_next_child(parent, prev);
+		if (!prev)
+			break;
+	} while (!of_node_name_eq(prev, "port"));
+
+	return prev;
+}
+EXPORT_SYMBOL(of_graph_get_next_port);
+
 /**
  * of_graph_get_next_endpoint() - get next endpoint node
  * @parent: pointer to the parent device node
@@ -823,6 +860,23 @@ unsigned int of_graph_get_endpoint_count(const struct device_node *np)
 }
 EXPORT_SYMBOL(of_graph_get_endpoint_count);
 
+/**
+ * of_graph_get_port_count() - get the number of port in a device or ports node
+ * @np: pointer to the device or ports node
+ *
+ * Return: count of port of this device or ports node
+ */
+unsigned int of_graph_get_port_count(struct device_node *np)
+{
+	unsigned int num = 0;
+
+	for_each_of_graph_port(np, port)
+		num++;
+
+	return num;
+}
+EXPORT_SYMBOL(of_graph_get_port_count);
+
 /**
  * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
  * @node: pointer to parent device_node containing graph port/endpoint
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index a4bea62bfa29..44518f3583a4 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_OF_GRAPH_H
 #define __LINUX_OF_GRAPH_H
 
+#include <linux/cleanup.h>
 #include <linux/types.h>
 #include <linux/errno.h>
 
@@ -37,14 +38,29 @@ struct of_endpoint {
 	for (child = of_graph_get_next_endpoint(parent, NULL); child != NULL; \
 	     child = of_graph_get_next_endpoint(parent, child))
 
+/**
+ * for_each_of_graph_port - iterate over every port in a device or ports node
+ * @parent: parent device or ports node containing port
+ * @child: loop variable pointing to the current port node
+ *
+ * When breaking out of the loop, and continue to use the @child, you need to
+ * use return_ptr(@child) or no_free_ptr(@child) not to call __free() for it.
+ */
+#define for_each_of_graph_port(parent, child)			\
+	for (struct device_node *child __free(device_node) = of_graph_get_next_port(parent, NULL);\
+	     child != NULL; child = of_graph_get_next_port(parent, child))
+
 #ifdef CONFIG_OF
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
 unsigned int of_graph_get_endpoint_count(const struct device_node *np);
+unsigned int of_graph_get_port_count(struct device_node *np);
 struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
 struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 					struct device_node *previous);
+struct device_node *of_graph_get_next_port(const struct device_node *parent,
+					   struct device_node *port);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -73,6 +89,11 @@ static inline unsigned int of_graph_get_endpoint_count(const struct device_node
 	return 0;
 }
 
+static inline unsigned int of_graph_get_port_count(struct device_node *np)
+{
+	return 0;
+}
+
 static inline struct device_node *of_graph_get_port_by_id(
 					struct device_node *node, u32 id)
 {
@@ -86,6 +107,13 @@ static inline struct device_node *of_graph_get_next_endpoint(
 	return NULL;
 }
 
+static inline struct device_node *of_graph_get_next_port(
+					const struct device_node *parent,
+					struct device_node *previous)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg)
 {
-- 
2.43.0


