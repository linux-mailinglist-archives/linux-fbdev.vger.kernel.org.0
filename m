Return-Path: <linux-fbdev+bounces-3882-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995DA40B8E
	for <lists+linux-fbdev@lfdr.de>; Sat, 22 Feb 2025 21:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 768FF189F286
	for <lists+linux-fbdev@lfdr.de>; Sat, 22 Feb 2025 20:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B641E98F2;
	Sat, 22 Feb 2025 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VPc90dAL"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from CY4PR02CU008.outbound.protection.outlook.com (mail-westcentralusazolkn19011028.outbound.protection.outlook.com [52.103.7.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9865A78F46;
	Sat, 22 Feb 2025 20:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740255418; cv=fail; b=MrESlLzHnbZIiJSymQbcRpKK2/zCQpWV/1P5MZlJIMqw9+uzDrWoTAdjy58SP7zt3K1hD56SrAKq8Pj8EMoqjQdp03bOK7/rX6s/Qj1uVdTMDPoc4k6kANFRF0rhDyRv6TI1k+bgwRS3Oxb6EBQ2J+ZzH23Gc4OUQ8nMRTvcTv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740255418; c=relaxed/simple;
	bh=PNW5ENe8DI4n46h6T/QAvuAfEYaajrqdsQTz2Fc+a3I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f77G1KzV2rgkezU23QqRjUOzicTp3Ave6VvRZj88Yc91xOFnmBERPcZFicSnSki6SP7MbzJ8PXmPVoivF2Ac4G0qQtj3NBszwadQfK55FgQ8dll+WVkpat7Z42lnHZVTctXuKxvUMwT/84+AX/R9jfdg9Sjcqr0/Vjng82dUzlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VPc90dAL; arc=fail smtp.client-ip=52.103.7.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e++OjOkdr0Q7l0YX+OjI+F2fyszNTxBE4cwri4+WL1ylvHqqpc6WXXoO11v8aBw4UFAeSJHUJPUlaES3v/oNa3odNhFWMEohz/5XX5hpu8M9wLxlo516bxncjfe0r5zREwpCH4v/VnRRSGk2GXU4puzBgKD0BiiMn5sTvdY4YMzn0ADxMm/6K73GT4aLJM2R3x3N/VU0FwcmjLs4nZV9U6xo8oovuIAQae90p0ilHcKbA1MqHeJdctujHtaRp1jJE+Z3DGGdS/RDzMdwhh7/uclHWKBU5h6G2lqqX5Eco0enR7CtASPioQrRhezId5fbamj49H3DyWGs9gn/yigjgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNW5ENe8DI4n46h6T/QAvuAfEYaajrqdsQTz2Fc+a3I=;
 b=wi547QxDnFo5JJAPopC9FQq6WqlquDQdTOUZK44NJ7mPE0LipKJvrar76DHpibumrmVfmNOcyES5YLzaejW7P0KvnVK9ZQWjl8dZoeqGW13IXdj7X+s8N+2t0mqYGmfoxPEg2wmqEcLDlw31QqLPLsQwAZeqzC7oFZc893+4FoEQyGhcR6aVqttRPqxZYvHPwKIclo2ZlNOun1Z2KUbvdAhC4+eLynAl+QGybR2w72HB2IB7LPxei4/mE8dW3HJvvPvtcwZdP7iuaJDy86XBepIe4eZI3gnicQM3o8bLRef2i1iEpQPxjJu8YfVIJIL6UL3WZevr8vYtLy7vEhnr/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNW5ENe8DI4n46h6T/QAvuAfEYaajrqdsQTz2Fc+a3I=;
 b=VPc90dALMwimo/uV1y/Pbk5xzFaA9y1bGCKNent0aN5BsbCvGq1J0Z+NnTFyKadcT7yentaXU77xf3QlNmiIZirAkwfrbj9c6m3/Esm9LYYnMDpy+KFnqIfZ0oJEBMRruw0UddLi8yRm459WwsV5pyIB4OFpMpV209hwvOTw5Zf79IoAGLDX3DGZcrePRxlUN/doeAr+8ndcWWYdj+QeKgoxvePleG43cmFzg9kYYVCbfeD2WQ5MO2zcmNJkahNfXMtc7SaQ5P6qQiVdutUL+z62lGjmbv2nPwm6C8Ek8e+QnpLLbk+VCfgwebbrN7FxPCKJD65dEbIHOMD5pL//bA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by IA3PR02MB10674.namprd02.prod.outlook.com (2603:10b6:208:509::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Sat, 22 Feb
 2025 20:16:53 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8466.016; Sat, 22 Feb 2025
 20:16:53 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
CC: "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com"
	<haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
	"decui@microsoft.com" <decui@microsoft.com>, "deller@gmx.de" <deller@gmx.de>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ssengar@microsoft.com" <ssengar@microsoft.com>
Subject: RE: [PATCH] fbdev: hyperv_fb: Allow graceful removal of framebuffer
Thread-Topic: [PATCH] fbdev: hyperv_fb: Allow graceful removal of framebuffer
Thread-Index: AQHbf4rly0L2XRweZkiIboVOb0veYbNN636ggAWzc4CAAC5VwA==
Date: Sat, 22 Feb 2025 20:16:53 +0000
Message-ID:
 <SN6PR02MB4157F6CF7CACF45C398933C4D4C62@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1739611240-9512-1-git-send-email-ssengar@linux.microsoft.com>
 <SN6PR02MB4157813782C1D9E6D1225582D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250222172715.GA28061@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To:
 <20250222172715.GA28061@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|IA3PR02MB10674:EE_
x-ms-office365-filtering-correlation-id: 7c6f3546-17cf-474b-5564-08dd537dd92c
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|8060799006|19110799003|15080799006|8022599003|461199028|440099028|3412199025|12091999003|41001999003|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?elZ6SDJ0UDYxZnNnYWRBU0dWRWMxWnNGZDhzUEdCQVRqbWpVQXE4b0VNREts?=
 =?utf-8?B?TGNQckVJL0QxTElkMnFVSjJSQ3EwNGxrM0x6NTZOdTV1d29ySWNobVA3L2Zh?=
 =?utf-8?B?Ymw0eWpYbFhMOFVmaGwzN1ptbFpLMklFWWNEQzQzZ1VXVmNndGg5eXI0Skha?=
 =?utf-8?B?aktRUWtyTkFCOHQ0cllIQmt3ZnVla2o2YU9RdFVRL04zUEdyN29sbHRFOXZu?=
 =?utf-8?B?Y2NBYzEyeUNlcUEwdzFvYXhGWFA3MUhTdnUzTGlkMy8vZmc5Zm1QaUEwbUlZ?=
 =?utf-8?B?bG05dWI1V3RYQ1FCSkJ0dmk0QnZ0akhMNElvcTcyZmdNdnUxRjZLakwzSU42?=
 =?utf-8?B?RnB0c0hRWDRoWjJXbm12ait6bDdxQnBUTHF6S0lPemlyUTVEV3huR2FJMlBO?=
 =?utf-8?B?cmxlRWNieDl0Uy93OVJOcjdsUFo3TUxpWGQ0QmlDQ3NOcDJBbTNSeHcrSjB1?=
 =?utf-8?B?NDE1TGsydGczRlNkdkkxdmwrYkN4QWlyblNxUkdHRzFUK0RHRURqWDhzdmJr?=
 =?utf-8?B?bS84SjFJS3U5dHlTZGcwZFMvajFDeWtIL00zQzgxUFlUeVAyTVBFV1BBbE82?=
 =?utf-8?B?OHJWaHR4TmNnelUwOVhzc0c4azZIWWRNeTFZaHpSMGtKekM0bzNuU1lHVjlw?=
 =?utf-8?B?VUlodWRXY2dWck01VkZWWlp5djdFQUFEa3o1VEUxZnZNNEd2K2srR3gzVXhB?=
 =?utf-8?B?alBtcG05RWFnZmZWQnd4djhOQTk1cGpWcXIxN3NzQXJudHpHYlhrS0NxN0VL?=
 =?utf-8?B?S1RZbTF4SHNISFY0SHYxT2JFMmthcXpBdGdRNUJ0Rm1UVmIwaFFkWjYvSjVC?=
 =?utf-8?B?TFpiQU9nN0tvN0hiTkFUK0tLSXNuL0NQTGgzZmJuTXByMkNvMmp3MVFvdDRM?=
 =?utf-8?B?VVo1cEI0T1BJcUdxcm1UVTk3OUR0NEJYaXMxUlpMK2FzazdSWFEzL2FYZUJ1?=
 =?utf-8?B?REdoZGNuVmNRdHFTdkpsb080SjNvajlJRlRPaU5RZ3gvTDU0ZnF1V1RzNmg5?=
 =?utf-8?B?aGwwUTV2ZzMydHdlNUFOd1NvZU5zNFBNVkE0eUs2TUZYUE1lM0NZM092akpp?=
 =?utf-8?B?VG9YR3BNZVpjV0tvYW5YUnRFUEo4aE5qRzhTcGFwVlRvTkNZWFFpNk1WNkNt?=
 =?utf-8?B?dlgwTUU4SUI1RlRPOWwxTDhRaEZpZm1NUDZSYWZSUlJIUUpJWlJVb280N3Zs?=
 =?utf-8?B?S2c1WE5EcjErM3hSZDVJRUlhdjRRb3NRbUxGSHcrc3B4MVZ4TlZNQm9pWGFq?=
 =?utf-8?B?bTdSN1hPbGxNTlpuNVVqUXV5TVZLQ2F0VDIxbkhtcGViNWp6L1hnY21pc3F0?=
 =?utf-8?B?aGd5YzAzanVEVjM5czl3ZnMyQnpvL01SYUlJYlRJZStXeStXeDZuUDhjMnph?=
 =?utf-8?B?WlFYZk9EUEFnRTFBdUwwTFhuS2V5Z0xRREdpZk5wT052Wkt1bURmWWFwcVdt?=
 =?utf-8?B?OVVmL09JZEI1TUJ5Y09jQk55T2E0NklkQ1JOdys2aklvcFVRZWs3czBiN1p4?=
 =?utf-8?B?dnJMMEE1eEJCVEVBclBxWEdrcU53SjJLYUVvUmlYb3RsMy9jemMvS1ByY3Fv?=
 =?utf-8?B?aDk5UT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b2d1dnhqSUQ3d0o3VDJ0ZHU5K0FueEkzQjBPdXZodFAzeTFCR2ROV2VBRzBD?=
 =?utf-8?B?Nk45aHQvci9RWFMwS0l4cmg3dHZvSVM1ZFVhNnhVeEh2MW1YZ2l5RzM2VDNE?=
 =?utf-8?B?NnA2NytBMHZMVnpVblAzVUZBMXJGRHlKcW5xYjJJbEZtQkFaWm9QV2Z1akRC?=
 =?utf-8?B?TGN5TkRMRnN2MkYyQktqVlBnSzdFQ0FlRk5FZDl5M2pTZk5GTmdvTVhZN2V0?=
 =?utf-8?B?b1U2VktsUTI4V0lHVDdPNkt4MEh5Vit2aHJ6eEtyaWFPaUdtelIzUUVxTk0w?=
 =?utf-8?B?M0g2cThYZUx0clUrUHBYajJGVGxKZE4zMVNPV0I2aXcybUgvdEh2Zk43MkNH?=
 =?utf-8?B?czVVV21NbktmNTZ6b0dDemlxanN0c1BLTVpJaG5vcGU0WEorVmFJZG5jZ3Ir?=
 =?utf-8?B?Y0k4Q3RjeXNBM3ZCRnhOSkNPSE9yWTltZ3N2UWpGVlllVk5FRUtabU9Dam1B?=
 =?utf-8?B?NWFrdnVKZWtUcVczYTN2QnNpMk5nVWNOOUgySE5NZktFOTRhRTBVL2s2eCtk?=
 =?utf-8?B?R0VFMzRjUWJ4TXp1WUxJZjFFRmxCeHZkbnQ4UytZSmh6cnV1bUVubERyeXVu?=
 =?utf-8?B?dmwzZjBKbzdHMGJxUm8xbld5NGdnZ2VrVDRiV1QzajZnWHVsRWtOcnYwbURS?=
 =?utf-8?B?Ris0bU93UVI1MW1wYXhsZ0NPQUgxVG5aREMxcStvSkNHc0pXU2FLSzRJMHZh?=
 =?utf-8?B?eTlyTnVNbDJRd3JpUUpYRWFIMy9XeXVteWEyM1hWUmZjNjB0WW5aL3NlNmYv?=
 =?utf-8?B?NEF5WWs2TGJIcGFVajdOV0NEbFZtWms3RSt5VHdwV2t6QngxczB4OGJ1QlF6?=
 =?utf-8?B?SWNWWXlkckxmaHpqYTdUUEZhVEljWFJrak5kc1kxcTdlb1VRQmZ1aE9xS2pv?=
 =?utf-8?B?ZnM0MEdFd0FEZFBiSTZCSy83VHRQNnJLaDJHcmgzKy82cVdUMENOZFo0OS9V?=
 =?utf-8?B?V2lLeUZKWDdMQlY2RXU4QkNzMlo4YU9YU2dYbktaN1JhVERTdSsvWkRYQ09o?=
 =?utf-8?B?Q2RoZldiV2llYStkREpRMWRYczJQenc3SStLNjg0QUJTT0F3KzFiZExDVk9L?=
 =?utf-8?B?aWxXNkFtWlZXdXFYZnRsMWdvZzc4TGZDOXNYMHpseHU4WXE2U0x6ZzZHL0Nz?=
 =?utf-8?B?cW5WZ0kyb2NVWU5OT05BNHBIbUJXeXE1RFYxYUg3bjVKTE9LRmxaUjAyWkZQ?=
 =?utf-8?B?bEMxT0pQTldhVFlkUkQ0Ulh0ckEwMC9JdWRKRHdtajhZbElSZE5XNGdxMU8y?=
 =?utf-8?B?Mmx6V2JxMjlxT1lFWWpGcUplK0U1K3Z4RjRtcE4wSi9BZlN2YUIwNFhwaUNM?=
 =?utf-8?B?TDVjZmFDTjI4WWxqY1dFL05EN0NadzM4UlVidkxqb2hwdFJlc214TWhabnNL?=
 =?utf-8?B?NklVNmtrM3hwSEVRemdNbm5LWFplMmFEYUl4clMyb2lLS0piSnIwZDJPeXR2?=
 =?utf-8?B?SktUaUo0d0hNV1RQR241QmlrZkpoWWRDS1cyVGZBMlRpeVFGS3NSdVdVSVlh?=
 =?utf-8?B?V1ljVFErU0YyeCsra25zZzlWWGlsbU4wWDJCMG5iM0VsVEFsR05OM2p3MWRB?=
 =?utf-8?B?TUZ4U09SNlpQMnJKUEFGYzkyUy90UzdTdW5MdGJYTUxySUVLS0dVRWw1MC81?=
 =?utf-8?Q?ZAfvno9mc1FYi9JmJW5mY7FLaTaNJjtoxOGscNbk8Kyg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6f3546-17cf-474b-5564-08dd537dd92c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2025 20:16:53.5423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR02MB10674

RnJvbTogU2F1cmFiaCBTaW5naCBTZW5nYXIgPHNzZW5nYXJAbGludXgubWljcm9zb2Z0LmNvbT4g
U2VudDogU2F0dXJkYXksIEZlYnJ1YXJ5IDIyLCAyMDI1IDk6MjcgQU0NCj4gDQo+IE9uIFdlZCwg
RmViIDE5LCAyMDI1IGF0IDA1OjIyOjM2QU0gKzAwMDAsIE1pY2hhZWwgS2VsbGV5IHdyb3RlOg0K
PiA+IEZyb206IFNhdXJhYmggU2VuZ2FyIDxzc2VuZ2FyQGxpbnV4Lm1pY3Jvc29mdC5jb20+IFNl
bnQ6IFNhdHVyZGF5LCBGZWJydWFyeSAxNSwNCj4gMjAyNSAxOjIxIEFNDQo+ID4gPg0KPiA+ID4g
V2hlbiBhIEh5cGVyLVYgZnJhbWVidWZmZXIgZGV2aWNlIGlzIHVuYmluZCwgaHlwZXJ2X2ZiIGRy
aXZlciB0cmllcyB0bw0KPiA+ID4gcmVsZWFzZSB0aGUgZnJhbWVidWZmZXIgZm9yY2VmdWxseS4g
SWYgdGhpcyBmcmFtZWJ1ZmZlciBpcyBpbiB1c2UgaXQNCj4gPiA+IHByb2R1Y2UgdGhlIGZvbGxv
d2luZyBXQVJOIGFuZCBoZW5jZSB0aGlzIGZyYW1lYnVmZmVyIGlzIG5ldmVyIHJlbGVhc2VkLg0K
PiA+ID4NCj4gPiA+IFsgICA0NC4xMTEyMjBdIFdBUk5JTkc6IENQVTogMzUgUElEOiAxODgyIGF0
IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9pbmZvLmM6NzANCj4gZnJhbWVidWZmZXJfcmVs
ZWFzZSsweDJjLzB4NDANCj4gPiA+IDwgc25pcCA+DQo+ID4gPiBbICAgNDQuMTExMjg5XSBDYWxs
IFRyYWNlOg0KPiA+ID4gWyAgIDQ0LjExMTI5MF0gIDxUQVNLPg0KPiA+ID4gWyAgIDQ0LjExMTI5
MV0gID8gc2hvd19yZWdzKzB4NmMvMHg4MA0KPiA+ID4gWyAgIDQ0LjExMTI5NV0gID8gX193YXJu
KzB4OGQvMHgxNTANCj4gPiA+IFsgICA0NC4xMTEyOThdICA/IGZyYW1lYnVmZmVyX3JlbGVhc2Ur
MHgyYy8weDQwDQo+ID4gPiBbICAgNDQuMTExMzAwXSAgPyByZXBvcnRfYnVnKzB4MTgyLzB4MWIw
DQo+ID4gPiBbICAgNDQuMTExMzAzXSAgPyBoYW5kbGVfYnVnKzB4NmUvMHhiMA0KPiA+ID4gWyAg
IDQ0LjExMTMwNl0gID8gZXhjX2ludmFsaWRfb3ArMHgxOC8weDgwDQo+ID4gPiBbICAgNDQuMTEx
MzA4XSAgPyBhc21fZXhjX2ludmFsaWRfb3ArMHgxYi8weDIwDQo+ID4gPiBbICAgNDQuMTExMzEx
XSAgPyBmcmFtZWJ1ZmZlcl9yZWxlYXNlKzB4MmMvMHg0MA0KPiA+ID4gWyAgIDQ0LjExMTMxM10g
ID8gaHZmYl9yZW1vdmUrMHg4Ni8weGEwIFtoeXBlcnZfZmJdDQo+ID4gPiBbICAgNDQuMTExMzE1
XSAgdm1idXNfcmVtb3ZlKzB4MjQvMHg0MCBbaHZfdm1idXNdDQo+ID4gPiBbICAgNDQuMTExMzIz
XSAgZGV2aWNlX3JlbW92ZSsweDQwLzB4ODANCj4gPiA+IFsgICA0NC4xMTEzMjVdICBkZXZpY2Vf
cmVsZWFzZV9kcml2ZXJfaW50ZXJuYWwrMHgyMGIvMHgyNzANCj4gPiA+IFsgICA0NC4xMTEzMjdd
ICA/IGJ1c19maW5kX2RldmljZSsweGIzLzB4ZjANCj4gPiA+DQo+ID4gPiBGaXggdGhpcyBieSBt
b3ZpbmcgdGhlIHJlbGVhc2Ugb2YgZnJhbWVidWZmZXIgdG8gZmJfb3BzLmZiX2Rlc3Ryb3kgZnVu
Y3Rpb24NCj4gPiA+IHNvIHRoYXQgZnJhbWVidWZmZXIgZnJhbWV3b3JrIGhhbmRsZXMgaXQgZ3Jh
Y2VmdWxseQ0KPiA+DQo+ID4gVGhlc2UgY2hhbmdlcyBsb29rIGdvb2QgZm9yIHNvbHZpbmcgdGhl
IHNwZWNpZmljIHByb2JsZW0gd2hlcmUNCj4gPiB0aGUgcmVmZXJlbmNlIGNvdW50IFdBUk4gaXMg
cHJvZHVjZWQuIEJ1dCB0aGVyZSBpcyBhbm90aGVyDQo+ID4gcHJvYmxlbSBvZiB0aGUgc2FtZSB0
eXBlIHRoYXQgaGFwcGVucyB3aGVuIGRvaW5nIHVuYmluZA0KPiA+IG9mIGEgaHlwZXJ2X2ZiIGRl
dmljZSB0aGF0IGlzIGluIHVzZSAoaS5lLiwgL2Rldi9mYjAgaXMgb3BlbiBhbmQNCj4gPiBtbWFw
J2VkIGJ5IHNvbWUgdXNlciBzcGFjZSBwcm9ncmFtKS4NCj4gPg0KPiA+IEZvciB0aGlzIGFkZGl0
aW9uYWwgcHJvYmxlbSwgdGhlcmUgYXJlIHRocmVlIHN1Yi1jYXNlcywNCj4gPiBkZXBlbmRpbmcg
b24gd2hhdCBtZW1vcnkgZ2V0cyBtbWFwJ2VkIGludG8gdXNlciBzcGFjZS4NCj4gPiBUd28gb2Yg
dGhlIHRocmVlIHN1Yi1jYXNlcyBoYXZlIGEgcHJvYmxlbS4NCj4gPg0KPiA+IDEpIFdoZW4gSHlw
ZXItViBGQiB1c2VzIGRlZmVycmVkIEkvTywgdGhlIHZtYWxsb2MgZGlvIG1lbW9yeQ0KPiA+IGlz
IHdoYXQgZ2V0IG1hcHBlZCBpbnRvIHVzZXIgc3BhY2UuIFdoZW4gaHlwZXJ2X2ZiIGlzIHVuYm91
bmQsDQo+ID4gdGhlIHZtYWxsb2MgZGlvIG1lbW9yeSBpcyBmcmVlZC4gQnV0IHRoZSBtZW1vcnkg
ZG9lc24ndCBhY3R1YWxseQ0KPiA+IGdldCBmcmVlZCBpZiBpdCBpcyBzdGlsbCBtbWFwJ2VkIGlu
dG8gdXNlciBzcGFjZS4gVGhlIGRlZmVycmVkIEkvTw0KPiA+IG1lY2hhbmlzbSBpcyBzdG9wcGVk
LCBidXQgdXNlciBzcGFjZSBjYW4ga2VlcCB3cml0aW5nIHRvIHRoZQ0KPiA+IG1lbW9yeSBldmVu
IHRob3VnaCB0aGUgcGl4ZWxzIGRvbid0IGdldCBjb3BpZWQgdG8gdGhlIGFjdHVhbA0KPiA+IGZy
YW1lYnVmZmVyIGFueSBsb25nZXIuICBXaGVuIHRoZSB1c2VyIHNwYWNlIHByb2dyYW0gdGVybWlu
YXRlcw0KPiA+IChvciB1bm1hcHMgdGhlIG1lbW9yeSksIHRoZSBtZW1vcnkgd2lsbCBiZSBmcmVl
ZC4gU28gdGhpcyBjYXNlDQo+ID4gaXMgT0ssIHRob3VnaCBwZXJoYXBzIGEgYml0IGR1YmlvdXMu
DQo+ID4NCj4gPiAyKSBXaGVuIEh5cGVyLVYgRkIgaXMgaW4gYSBHZW4gMSBWTSwgYW5kIHRoZSBm
cmFtZSBidWZmZXIgc2l6ZQ0KPiA+IGlzIDw9IDQgTWlCLCBhIG5vcm1hbCBrZXJuZWwgYWxsb2Nh
dGlvbiBpcyB1c2VkIGZvciB0aGUNCj4gPiBtZW1vcnkgdGhhdCBpcyBtbWFwJ2VkIHRvIHVzZXIg
c3BhY2UuIElmIHRoaXMgbWVtb3J5DQo+ID4gaXMgZnJlZWQgd2hlbiBoeXBlcnZfZmIgaXMgdW5i
b3VuZCwgYmFkIHRoaW5ncyBoYXBwZW4NCj4gPiBiZWNhdXNlIHRoZSBtZW1vcnkgaXMgc3RpbGwg
YmVpbmcgd3JpdHRlbiB0byB2aWEgdGhlIHVzZXIgc3BhY2UNCj4gPiBtbWFwLiBUaGVyZSBhcmUg
bXVsdGlwbGUgIkJVRzogQmFkIHBhZ2Ugc3RhdGUgaW4gcHJvY2Vzcw0KPiA+IGJhc2ggIHBmbjox
MDZjNjUiIGVycm9ycyBmb2xsb3dlZCBieSBzdGFjayB0cmFjZXMuDQo+ID4NCj4gPiAzKSBTaW1p
bGFybHkgaW4gYSBHZW4gMSBWTSwgaWYgdGhlIGZyYW1lIGJ1ZmZlciBzaXplIGlzID4gNCBNaUIs
DQo+ID4gQ01BIG1lbW9yeSBpcyBhbGxvY2F0ZWQgKGFzc3VtaW5nIGl0IGlzIGF2YWlsYWJsZSku
IFRoaXMgQ01BDQo+ID4gbWVtb3J5IGdldHMgbWFwcGVkIGludG8gdXNlciBzcGFjZS4gV2hlbiBo
eXBlcnZfZmIgaXMNCj4gPiB1bmJvdW5kLCB0aGF0IG1lbW9yeSBpcyBmcmVlZC4gQnV0IENNQSBj
b21wbGFpbnMgdGhhdCB0aGUNCj4gPiByZWYgY291bnQgb24gdGhlIHBhZ2VzIGlzIG5vdCB6ZXJv
LiBIZXJlJ3MgdGhlIGRtZXNnIG91dHB1dDoNCj4gPg0KPiA+IFsgIDE5MS42Mjk3ODBdIC0tLS0t
LS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiA+IFsgIDE5MS42Mjk3ODRdIDIwMCBw
YWdlcyBhcmUgc3RpbGwgaW4gdXNlIQ0KPiA+IFsgIDE5MS42Mjk3ODldIFdBUk5JTkc6IENQVTog
MyBQSUQ6IDExMTUgYXQgbW0vcGFnZV9hbGxvYy5jOjY3NTcNCj4gZnJlZV9jb250aWdfcmFuZ2Ur
MHgxNWUvMHgxNzANCj4gPg0KPiA+IFN0YWNrIHRyYWNlIGlzOg0KPiA+DQo+ID4gWyAgMTkxLjYy
OTg0N10gID8gX193YXJuKzB4OTcvMHgxNjANCj4gPiBbICAxOTEuNjI5ODQ5XSAgPyBmcmVlX2Nv
bnRpZ19yYW5nZSsweDE1ZS8weDE3MA0KPiA+IFsgIDE5MS42Mjk4NDldICA/IHJlcG9ydF9idWcr
MHgxYmIvMHgxZDANCj4gPiBbICAxOTEuNjI5ODUxXSAgPyBjb25zb2xlX3VubG9jaysweGRkLzB4
MWUwDQo+ID4gWyAgMTkxLjYyOTg1NF0gID8gaGFuZGxlX2J1ZysweDYwLzB4YTANCj4gPiBbICAx
OTEuNjI5ODU3XSAgPyBleGNfaW52YWxpZF9vcCsweDFkLzB4ODANCj4gPiBbICAxOTEuNjI5ODU5
XSAgPyBhc21fZXhjX2ludmFsaWRfb3ArMHgxZi8weDMwDQo+ID4gWyAgMTkxLjYyOTg2Ml0gID8g
ZnJlZV9jb250aWdfcmFuZ2UrMHgxNWUvMHgxNzANCj4gPiBbICAxOTEuNjI5ODYyXSAgPyBmcmVl
X2NvbnRpZ19yYW5nZSsweDE1ZS8weDE3MA0KPiA+IFsgIDE5MS42Mjk4NjNdICBjbWFfcmVsZWFz
ZSsweGM2LzB4MTUwDQo+ID4gWyAgMTkxLjYyOTg2NV0gIGRtYV9mcmVlX2NvbnRpZ3VvdXMrMHgz
NC8weDcwDQo+ID4gWyAgMTkxLjYyOTg2OF0gIGRtYV9kaXJlY3RfZnJlZSsweGQzLzB4MTMwDQo+
ID4gWyAgMTkxLjYyOTg2OV0gIGRtYV9mcmVlX2F0dHJzKzB4NmIvMHgxMzANCj4gPiBbICAxOTEu
NjI5ODcyXSAgaHZmYl9wdXRtZW0uaXNyYS4wKzB4OTkvMHhkMCBbaHlwZXJ2X2ZiXQ0KPiA+IFsg
IDE5MS42Mjk4NzRdICBodmZiX3JlbW92ZSsweDc1LzB4ODAgW2h5cGVydl9mYl0NCj4gPiBbICAx
OTEuNjI5ODc2XSAgdm1idXNfcmVtb3ZlKzB4MjgvMHg0MCBbaHZfdm1idXNdDQo+ID4gWyAgMTkx
LjYyOTg4M10gIGRldmljZV9yZW1vdmUrMHg0My8weDcwDQo+ID4gWyAgMTkxLjYyOTg4Nl0gIGRl
dmljZV9yZWxlYXNlX2RyaXZlcl9pbnRlcm5hbCsweGJkLzB4MTQwDQo+ID4gWyAgMTkxLjYyOTg4
OF0gIGRldmljZV9kcml2ZXJfZGV0YWNoKzB4MTgvMHgyMA0KPiA+IFsgIDE5MS42Mjk4OTBdICB1
bmJpbmRfc3RvcmUrMHg4Zi8weGEwDQo+ID4gWyAgMTkxLjYyOTg5MV0gIGRydl9hdHRyX3N0b3Jl
KzB4MjUvMHg0MA0KPiA+IFsgIDE5MS42Mjk4OTJdICBzeXNmc19rZl93cml0ZSsweDNmLzB4NTAN
Cj4gPiBbICAxOTEuNjI5ODk0XSAga2VybmZzX2ZvcF93cml0ZV9pdGVyKzB4MTQyLzB4MWQwDQo+
ID4gWyAgMTkxLjYyOTg5Nl0gIHZmc193cml0ZSsweDMxYi8weDQ1MA0KPiA+IFsgIDE5MS42Mjk4
OThdICBrc3lzX3dyaXRlKzB4NmUvMHhlMA0KPiA+IFsgIDE5MS42Mjk4OTldICBfX3g2NF9zeXNf
d3JpdGUrMHgxZS8weDMwDQo+ID4gWyAgMTkxLjYyOTkwMF0gIHg2NF9zeXNfY2FsbCsweDE2YmYv
MHgyMTUwDQo+ID4gWyAgMTkxLjYyOTkwM10gIGRvX3N5c2NhbGxfNjQrMHg0ZS8weDExMA0KPiA+
IFsgIDE5MS42Mjk5MDRdICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3Ni8weDdl
DQo+ID4NCj4gPiBGb3IgYWxsIHRocmVlIGNhc2VzLCBJIHRoaW5rIHRoZSBtZW1vcnkgZnJlZWlu
ZyBhbmQgaW91bm1hcCgpIG9wZXJhdGlvbnMNCj4gPiBjYW4gYmUgbW92ZWQgdG8gdGhlIG5ldyBo
dmZiX2Rlc3Ryb3koKSBmdW5jdGlvbiBzbyB0aGF0IHRoZSBtZW1vcnkNCj4gPiBpcyBjbGVhbmVk
IHVwIG9ubHkgd2hlbiB0aGVyZSBhcmVuJ3QgYW55IHVzZXJzLiBXaGlsZSB0aGVzZSBhZGRpdGlv
bmFsDQo+ID4gY2hhbmdlcyBjb3VsZCBiZSBkb25lIGFzIGEgc2VwYXJhdGUgcGF0Y2gsIGl0IHNl
ZW1zIHRvIG1lIGxpa2UgdGhleSBhcmUgYWxsDQo+ID4gcGFydCBvZiB0aGUgc2FtZSB1bmRlcmx5
aW5nIGlzc3VlIGFzIHRoZSByZWZlcmVuY2UgY291bnQgcHJvYmxlbSwgYW5kDQo+ID4gY291bGQg
YmUgY29tYmluZWQgaW50byB0aGlzIHBhdGNoLg0KPiA+DQo+ID4gTWljaGFlbA0KPiA+DQo+IA0K
PiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KPiANCj4gSSBoYWQgY29uc2lkZXJlZCBtb3Zpbmcg
dGhlIGVudGlyZSBgaHZmYl9wdXRtZW0oKWAgZnVuY3Rpb24gdG8gYGRlc3Ryb3lgLA0KPiBidXQg
SSB3YXMgaGVzaXRhbnQgZm9yIHR3byByZWFzb25zOg0KPiANCj4gICAxLiBJIHdhc27igJl0IGF3
YXJlIG9mIGFueSBzY2VuYXJpbyB3aGVyZSB0aGlzIHdvdWxkIGJlIHVzZWZ1bC4gSG93ZXZlciwN
Cj4gICAgICB5b3VyIGV4cGxhbmF0aW9uIGhhcyBjb252aW5jZWQgbWUgdGhhdCBpdCBpcyBuZWNl
c3NhcnkuDQo+ICAgMi4gYGh2ZmJfcmVsZWFzZV9waHltZW0oKWAgcmVsaWVzIG9uIHRoZSBgaGRl
dmAgcG9pbnRlciwgd2hpY2ggcmVxdWlyZXMNCj4gICAgICBtdWx0aXBsZSBgY29udGFpbmVyX29m
YCBvcGVyYXRpb25zIHRvIGRlcml2ZSBpdCBmcm9tIHRoZSBgaW5mb2AgcG9pbnRlci4NCj4gICAg
ICBJIHdhcyB1bnN1cmUgaWYgdGhlIGNvbXBsZXhpdHkgd2FzIGp1c3RpZmllZCwgYnV0IGl0IHNl
ZW1zIHdvcnRod2hpbGUgbm93Lg0KPiANCj4gSSB3aWxsIG1vdmUgYGh2ZmJfcHV0bWVtKClgIHRv
IHRoZSBgZGVzdHJveWAgZnVuY3Rpb24gaW4gVjIsIGFuZCBJIGhvcGUgdGhpcw0KPiB3aWxsIGFk
ZHJlc3MgYWxsIHRoZSBjYXNlcyB5b3UgbWVudGlvbmVkLg0KPiANCg0KWWVzLCB0aGF0J3Mgd2hh
dCBJIGV4cGVjdCBuZWVkcyB0byBoYXBwZW4sIHRob3VnaCBJIGhhdmVuJ3QgbG9va2VkIGF0IHRo
ZQ0KZGV0YWlscyBvZiBtYWtpbmcgc3VyZSBhbGwgdGhlIG5lZWRlZCBkYXRhIHN0cnVjdHVyZXMg
YXJlIHN0aWxsIGFyb3VuZC4gTGlrZQ0KeW91LCBJIGp1c3QgaGFkIHRoaXMgc2Vuc2UgdGhhdCBo
dmZiX3B1dG1lbSgpIG1pZ2h0IG5lZWQgdG8gYmUgbW92ZWQgYXMNCndlbGwsIHNvIEkgdHJpZWQg
dG8gcHJvZHVjZSBhIGZhaWx1cmUgc2NlbmFyaW8gdG8gcHJvdmUgaXQsIHdoaWNoIHR1cm5lZCBv
dXQNCnRvIGJlIGVhc3kuDQoNCk1pY2hhZWwNCg==

