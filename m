Return-Path: <linux-fbdev+bounces-2793-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B014694C882
	for <lists+linux-fbdev@lfdr.de>; Fri,  9 Aug 2024 04:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 334861F2246D
	for <lists+linux-fbdev@lfdr.de>; Fri,  9 Aug 2024 02:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83A517557;
	Fri,  9 Aug 2024 02:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P7rzJUJG"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1994C8E;
	Fri,  9 Aug 2024 02:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723170589; cv=fail; b=prQIqx9K4a6lMZjuQ0UdaROejVKoBs9Rv/XpCKAIVwBXGGNDXX4H7emBxTQ9W5RpnUlvtHA1+rykrGunHZUzWpKrhc8g+bEEBKcRfvs9trazSUXzY0omtphwwNbs0VBWZjJmhqOEoKmTl+frGuLv2s5S3HxAWZYsfutGMk0PCaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723170589; c=relaxed/simple;
	bh=0S4HhA6V4Y7wOAzcvtWxO4AJH9Yap/zj0e67pgfMeKk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GUuv9LUJFA8fsZSFAzfZX0mhQsEKHzGd8SfagfbibHmZtgt/o33RKYuLFsDp/siFU0L1kldUTNShiEaSp8B/J5xB/Nx7x1EbmKT8+xBOr8c0vggg29KFe7E6z6AFAytaZAaUj9An53mOHAv/84d8FKGpJ18LRxe9CG3QBVYIDOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P7rzJUJG; arc=fail smtp.client-ip=52.101.125.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dp5jbuDGya2DQvJTE7CNxGOD77wRduv815ZdtvFMUqwn/Sns35RquuIbHjPVheSL6ZBr7jM09Ta8rV2hcpTD5zkrTCHybHV+zety61vYc011pDJlGH83AndoRPZTSs/yostFzriD55QxffDYhDd7fuIS1Tr7El4VHM9EhHzyDxlw7k7yFx1vk1F8rOTbqut+52crb6OycjHRAZnnahhiCm8xyyf28nE2g0LShdEChS4uxYPWSQIDBu9ge64joR75rXgdgnm/AMrVIx2CgREfwYnU8Tp9Cp5Zs3CS6zB/Fr9mx/RE/wcPtXlHR+uDs3DMF4jNgjx8ICR5eMqU79frhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIWPnZrX0geVg+dPXwVbp8RDqvCfNmilReoJjEsbXp0=;
 b=h9Rs3GNA6ZsJkw46d2PLrq9jMqjQLGPjEPOw4/7o7JFpK6ozeCQxswUNmGWImAKt6sMBsuXpiNzldceyVQB4hOdABOLAWVqrRRSSX3BpAoh7HX3IkxS3Uf2OF9pq3TUGpPDtu6yQaPZhIceY7IYtMlow6KpymkmOikSl5kSzQYmKbowYHGh1knrSf+5Ilt9SZj9fRKffVA6xw8xIemMUshBEBB+sXA6vB7J/mFO1xEl7FGQVvnaZM22N83myyDsyNS42ZNMN2I9n7wi1I5Fxl4zKZHlI04gB7Gy+ykvDYctkiokT/vEtEmWHzU2IruwN9JWMBBQE5HfDOZsTaHSR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIWPnZrX0geVg+dPXwVbp8RDqvCfNmilReoJjEsbXp0=;
 b=P7rzJUJGBHK70E/SHP8+yT4ShErIXX6qFJ7feUKY3gTUf6ddiHVqHy0p31ySndW3ZX8QF4RCEGfX6Jo6euuRdHXn/deVCZo8AGQN3Gm7xYzpgoUrs1yeJJKH3fg95IUxy3l5BlhQre1MyLsOZMb7IgPkSdHq7PPsFv5LiDj8wBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10597.jpnprd01.prod.outlook.com
 (2603:1096:400:319::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 02:29:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 02:29:42 +0000
Message-ID: <877ccq8m3t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
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
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/9] of: property: add of_graph_get_next_port_endpoint()
In-Reply-To: <49d736c4-1964-4f51-a951-6e98319181c2@ideasonboard.com>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
	<87jzguw8ln.wl-kuninori.morimoto.gx@renesas.com>
	<49d736c4-1964-4f51-a951-6e98319181c2@ideasonboard.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Aug 2024 02:29:42 +0000
X-ClientProxiedBy: TYCP286CA0357.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10597:EE_
X-MS-Office365-Filtering-Correlation-Id: a856ad53-ed42-476e-a08c-08dcb81b2067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gcU2KmtX5JnPD1jWwAqtsukbkgSxDV4+fXAyPN+wlk+3+bXNA/43KNodDHEg?=
 =?us-ascii?Q?FD+eLEOBoPGS+8XhMYUgkROoXL1AUzlMOmRecHAuOJSAD9op4otnT0tymJhl?=
 =?us-ascii?Q?mnvlFzxclwzMDP1hx/UlNlacMIyzq1DEvxO5LGp6KTe7qvXFb+8vjTd5NW6M?=
 =?us-ascii?Q?DXXaigtS78QrqQojrWbQXFGvqtTWlon6+9TIXGaYWml8MH1DfBmVoZbH07lG?=
 =?us-ascii?Q?p5V65YZAqH5l8f6qgkiEQiOy5zvZ8eWnZwyTsbnTA1f6q0F3uECHAUBvMK+L?=
 =?us-ascii?Q?x01xVF/AgDaNecV3LHaZOyXsCDQj/fkL9RWl/ISpn0o4wfFJql+P2mXvR68J?=
 =?us-ascii?Q?K6IPiGdmelvtgflhZj2XirxsN7P7UZHffzjDesYoOY71oihjolK/HjVZM7OE?=
 =?us-ascii?Q?Pt1l6VlQ2hYPts1ab+25Z2JivqI5wJDE6m+9DG7w/4HJVgbVawJCpzJvScBg?=
 =?us-ascii?Q?aUb4HAjYUFhWjDJvnq4QkKO4g/jVV56xTshLjcGufrjul1M8MGG4FKARXUTu?=
 =?us-ascii?Q?U/lsJmciwb2rHjyCreAis5WSsSEhur8xbf8nzogZ8cuPspbqZlZLrmg1fVPs?=
 =?us-ascii?Q?21buKp/CSmtjTWvaoEmHpP+k40h4llHiALSLFxuK2HNuSCkGuFDrD1/3jZIz?=
 =?us-ascii?Q?UxCdWOd3HHOWINhetxEnRlGilbVKWK+u6IPyBB4n15pMd2wZrxyYE/GbCtOo?=
 =?us-ascii?Q?eOFpeRXNmnTv27iSMd+1aD3VSrIQcNn4KAUvUEpMeygfuYa1hBGMGCcMHmm6?=
 =?us-ascii?Q?C4iYx2CmTSNKoS5Kx4yBp/mpaH9yLZv07mQN8Fr9P14Y7EXI8G557WI5ixMo?=
 =?us-ascii?Q?GRuWsnwxaSXSGJNG5fUDCoozyrzxuQ1kDEgokKIBcsoz70s6l77XlvtQYloa?=
 =?us-ascii?Q?gIbc59jV7ar2bliXS1x1dltgetikFXdDMkv8m1qGk/o9drmgIOJUNkIi55QC?=
 =?us-ascii?Q?0a2qxJ/R4jl/bX2FwoO3+5kGqFdX6wBL+8dkXWifb0kfgZjMGgAV/g6Eibd8?=
 =?us-ascii?Q?4tN6huY/8WAkPdMiDwmBO2P6RdKkDkPSJ1NcjE0BQmcQV5bI+hRKM/moiLNT?=
 =?us-ascii?Q?cDOhC4C4qDx69zvr29m38iQ3KgNB2XsE+n9uomwaqo+M+l01DaVypnFqm07G?=
 =?us-ascii?Q?0+cFBHPETe5fn6pTPk9+8oHlM/CzfucBSOW4m+gRjR9QaJW6E6cY4BHit9uG?=
 =?us-ascii?Q?jLG/eBEb/RJT0TLaoZ533BZGyDjmRSOToTQrKdnHzcmFhnPR21xdFwetsFK0?=
 =?us-ascii?Q?JzmZjTfRCXL5dwf4kGNNcVxDdWA+lxiqY5e2CfjmWVz81z6bPcexH5p95jSI?=
 =?us-ascii?Q?+fU+hW/6CCqLh6OU9vD9xQI688zOje8m5YqSkUA4kLL0FXymUfZnC93Vz1oS?=
 =?us-ascii?Q?LXGoKJXodHoOP/ySB8Hn579q7DiUnfdimjekQGnN4Y2sDwj2ig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L2lkewQZfu3EokTRO6X0bYw9vMZZgRaWpeeUgg4CQG3J/a4UxdstLf0Z7nzr?=
 =?us-ascii?Q?t49I8dmtMBv4OBhsn3/127qzzmCN5LxVd6XFvvXH8GLXQMiIG5oowx8BK42W?=
 =?us-ascii?Q?KFsQausFS/9MyIh7rNXknRds+dAsbAA+I6Y6CVc/Bi6eQFzD5fyfU/fY67K+?=
 =?us-ascii?Q?TpKX+Nt1wFYtK0uvUUiXBZZ2p6VgRUypu8gX+voN5tqhssvKFkjt5l2pE4wD?=
 =?us-ascii?Q?0VkMexuqC9XyjBardpMdf51mPKxKgfctEZq1PMhQSJGkj5JXTCfse14dxV/S?=
 =?us-ascii?Q?SKipS2DUFcMOjHC/pvoMmUWSndJgMuoUrojQd99L0Qr/B4lwBqEUsB+Oz23g?=
 =?us-ascii?Q?EdAOdfmWWSzNQqPDoL62oN2avc6aN3JYJ0dALu7t+wXeDY/SJVFQ96O4RWTo?=
 =?us-ascii?Q?jGQfd+eCKoObFro1papX8WgxQeidXZK00mPadKr/msMYdj2lIi+vLqGwb9FR?=
 =?us-ascii?Q?sTHluZsa78xMobbqvCBXSW7esPsevL4L6Lc0pefYoepdI7ibxetqPwcyVvgx?=
 =?us-ascii?Q?9+N5IYpeytXbscFqzFCfl9v3wk2JofwHAKi6sPYx7N2iDmyN7ruO1b7gN6NX?=
 =?us-ascii?Q?bK0JzRAECu7RbS0qsrgNOFdmosvsw2gbrZ6FMN1xvDnu18ZxaxIshnrIcg7l?=
 =?us-ascii?Q?y7ZYyio2JffkTf2HqCZhip3hWPdXap46yMImIlLMpQZ4MQBMg5LIK/3nggOK?=
 =?us-ascii?Q?7gjwlc/dze9xDCgdY1mcTGfUfCN5K6bnDfq0e3l4N9ZXcbZC5Ok6Ok6MY+SG?=
 =?us-ascii?Q?sxudnAo9GsM3OpqmHGzNn4QVhri2e0Yt2RpBao51kaOeo3y/id9MUDA2Eq0g?=
 =?us-ascii?Q?HleknKEsiWVmGtHI+ejO0Vh+Ut79f9LFwNbslk39kiDj2zxvzBZyf/lA557n?=
 =?us-ascii?Q?JuSXtDjwOmq7xEiWmFusRKFzzm65FdqneV1Ea0jxAiACo3y7iOMSuCmOzxbh?=
 =?us-ascii?Q?i4D/HeXU0CUrnHsgg3I40+JOwMNcPxh4bmqAysDATVWhsrIrevqHLjYKhVhB?=
 =?us-ascii?Q?iqWT0EJHu7HeOcKH4F5W1UG+U3T9yskXzRyDT0DAtd0jVjGqWE/NYtqe/tb8?=
 =?us-ascii?Q?ZzZnQ8vTI3dcm3Oxnx5j5fw2hxvSgid18QDhwLoT+XBPCfKXHFOrCOAgEPKa?=
 =?us-ascii?Q?oN+mEiXJipmnxA0HQjFmfgnYGoC34Zw0JhW3oG9oVUAywQS/1amL8ATlZh0t?=
 =?us-ascii?Q?J+NSelCfE1orv40O3kV4jgByUWdfgUW6YoTEdqjnF6xxBEs/fyELHP74j4cV?=
 =?us-ascii?Q?Eg+EOYf6su9JtdhqhCfJIAVe2OM0eY1q25ZyFcPn8H6ky60q35XsrTDxZtLg?=
 =?us-ascii?Q?PKxhz/I5qrsDrt78wGqobjeWcKvDN1IK8cHopukCW/xLfYtUr5NVUhDfYNIy?=
 =?us-ascii?Q?7sXyvutg+Si60UGOcJ95EOAy2Y+tMmC3wkTjLkVhYYmbC7K51rjg5g3kGiUc?=
 =?us-ascii?Q?uP4DOXkTF5bxzF7g/nitpyk2jYzk1fcrAVTC7sQblmigRip5W7ZsxLK6hIkV?=
 =?us-ascii?Q?O4CNwCLHcelOjvF8O/t66lxb3PP/ovKHfeovsuTQSEu17s5ec+dL1uTjptcA?=
 =?us-ascii?Q?k47FFweu2qeAsPqWpMB6CF7YOlQWlKMXe7FP2pCkkdPVFWsU0mlEnRIe++xt?=
 =?us-ascii?Q?q6nTqEJFrZXFG+3NVIARyFI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a856ad53-ed42-476e-a08c-08dcb81b2067
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 02:29:42.8578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KRZ78EVQbQVgTiOkkBOHzKvtn7zeXBawXAYvNe6vL7heC/P5r/Qrfk4g9WT8AvTansGXpM8+zG4NCG2WFDbS4KPsvisEYuJZntpUQxrQJQHW5+R1zyHV7ssQWicCPY4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10597


Hi Tomi

> > +/**
> > + * of_graph_get_next_port_endpoint() - get next endpoint node in port.
> > + * If it reached to end of the port, it will return NULL.
> > + * @port: pointer to the target port node
> > + * @endpoint: current endpoint node, or NULL to get first
> > + *
> > + * Return: An 'endpoint' node pointer with refcount incremented. Refcount
> > + * of the passed @prev node is decremented.
> > + */
> 
> Same issues here too. No "prev" parameter, and I suggest using 
> "previous", not "current", to be consistent with 
> of_graph_get_next_endpoint(). (or alternatively, change 
> of_graph_get_next_endpoint()).
> 
> Oh, the declaration of the function uses "prev", but the implementation 
> "endpoint". Please make the naming same.

Will fix in v2.
But it will use "prev" for param same as of_graph_get_next_endpoint()

> > +/**
> > + * for_each_of_graph_port_endpoint - iterate over every endpoint in a port node
> > + * @parent: parent device or ports node
> 
> Hmm, shouldn't the parent be a port node?

Thanks, will fix in v2


Thank you for your help !!

Best regards
---
Kuninori Morimoto

