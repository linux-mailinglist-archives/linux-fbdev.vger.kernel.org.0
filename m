Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2E4B4371
	for <lists+linux-fbdev@lfdr.de>; Mon, 16 Sep 2019 23:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbfIPVpp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 16 Sep 2019 17:45:45 -0400
Received: from mail-eopbgr1300119.outbound.protection.outlook.com ([40.107.130.119]:12689
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725912AbfIPVpo (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 16 Sep 2019 17:45:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRdC+TlA1a0IfrXVTObD49e+mhtMWjvlUBDgpdiMxn5rMuLyq19p5cT4kpc0s6TCTDxtt41H8I5XnrV6fisK1BVHCDIV1LHxlYfUUPBDs5aShvQcaT7Y4+sb5BuWLPVsKkMW2ZzfLKuRZ/XHmGNoJ556d2aZyfSuoCgbk7pjSj0/SMf5JObV/vGurm27idGIXdiDfv2h5KnpzJWXysGtsAWoGeSSSH4mPAx2RqQW0wYX75ScM2VeavN8ZcawNoC4Vz4+9cNHSiNTASN/YXTlkqrJ7SWf9S+WAhbvQ0bsKH1u+oi4FnEru8pcNemzpVUvniwlVQ5sAlKQ5sFkKkgDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3cbGL2JCb8Av9tK+Ylswn4m/nWZtnAMbXBvP2bfts8=;
 b=AV4cBgOlXI9tSgA5OxHI+D6KxhaSWvVV8Cutl7Nlgrav1pI1SkRIfqi6VlSCOUMmwyHhw/a/qUx6k34+dzOiqqJq1kcOfCHATPF7X85qhkW1gEpJXgqwC7Q+63YDMTXspgNJckJGGpcOTG17dXhN0UVdae6E4Vit3950Na6uMiDqv+ab0LcEC1KT3QeP+VT+5PVuGy9jSYUdWZ2d34z8gvf9FHiORgC5MN76imNIIl7C85L2BWij2tBwONBMYwgkYoozSzGCkAI9VR+hE6nH0kMCRD/JmwATybCO2Et1hWugjn3bo/MM7MWPeDfaUpugBZbZZvYeDXu4V8obvu2y5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3cbGL2JCb8Av9tK+Ylswn4m/nWZtnAMbXBvP2bfts8=;
 b=iOHgui5FYEbObjzBbf5MuXp5xbiz8tessrgBeRmGROnBsmrzI/G+jYL5t2T1TiLmlytraAnAB9sWW+0e83RBDCgAKGmj+CbeAuoDsHtFBx4EGaBEGMsIg9VLT4YTP6jl3yQTzdMMuD04ywHopeVLaZA7OP2BJbhn+tJ2TtKNT/E=
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM (10.170.189.13) by
 PU1P153MB0201.APCP153.PROD.OUTLOOK.COM (10.170.190.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.3; Mon, 16 Sep 2019 21:45:36 +0000
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::fc44:a784:73e6:c1c2]) by PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::fc44:a784:73e6:c1c2%8]) with mapi id 15.20.2305.000; Mon, 16 Sep 2019
 21:45:36 +0000
From:   Dexuan Cui <decui@microsoft.com>
To:     Michael Kelley <mikelley@microsoft.com>,
        Wei Hu <weh@microsoft.com>,
        "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
        "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        "sashal@kernel.org" <sashal@kernel.org>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        KY Srinivasan <kys@microsoft.com>
CC:     Iouri Tarassov <iourit@microsoft.com>
Subject: RE: [PATCH v4] video: hyperv: hyperv_fb: Obtain screen resolution
 from Hyper-V host
Thread-Topic: [PATCH v4] video: hyperv: hyperv_fb: Obtain screen resolution
 from Hyper-V host
Thread-Index: AQHVY8n1ZHStyEKyQEWtq6qT8x1cIqcdHi/QgAwV3LCABbGEQA==
Date:   Mon, 16 Sep 2019 21:45:36 +0000
Message-ID: <PU1P153MB0169E5FA3D359C6BDD50EC34BF8C0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
References: <20190905091120.16761-1-weh@microsoft.com>
 <DM5PR21MB0137D40DF705CDB372497266D7BB0@DM5PR21MB0137.namprd21.prod.outlook.com>
 <PU1P153MB0169656B3EC48BFCF4D8C134BFB30@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
In-Reply-To: <PU1P153MB0169656B3EC48BFCF4D8C134BFB30@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-09-05T14:05:47.2964572Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=5fdc59c0-9d8b-4103-9a31-ed8f82961311;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=decui@microsoft.com; 
x-originating-ip: [2001:4898:80e8:a:58f6:aea4:93d:b127]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4190cbb1-daee-41e5-6dfd-08d73aef3593
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: PU1P153MB0201:|PU1P153MB0201:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PU1P153MB0201E6D109F639B194ACC422BF8C0@PU1P153MB0201.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(189003)(199004)(66946007)(2501003)(478600001)(8990500004)(6636002)(8676002)(305945005)(7736002)(74316002)(6436002)(10090500001)(53936002)(55016002)(22452003)(486006)(2906002)(81166006)(229853002)(14444005)(256004)(8936002)(6116002)(476003)(46003)(446003)(11346002)(52536014)(25786009)(76116006)(186003)(4326008)(14454004)(81156014)(6246003)(9686003)(110136005)(71190400001)(71200400001)(316002)(107886003)(7696005)(2201001)(86362001)(33656002)(10290500003)(5660300002)(66446008)(64756008)(66556008)(66476007)(6506007)(76176011)(102836004)(99286004)(53546011)(1511001)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:PU1P153MB0201;H:PU1P153MB0169.APCP153.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NjSdzum/rUZYszn0gYkjqkaF0mVTZxc9cOZ12b+HO+9SfWezJDaBwYITiYgoC4g2WY3xPgajz0FAkfSUgQiH5+N9Wr3ohzw7ixIYr8FncoSHW8UC436pQYO76k6fUtImWbe4QJ2GLD3jPA3iRgvkIOrMDe/1MKTO5WzPre1Uop5FQbm1Sbqj/KPKgRCO3wfiVvzm/thApwyGfYsxK8d7DqR+bvQ2NpvLz3c5pyWe7jhJET/TsV372/okGiPaBYKM+R+UhfXbU+AJ0dxCpEylSBiGR0Wgn1Qy1U+nyYpg/xacUchxXO1bdXeLqz5fTd+qG/EknLTQEjxZDDOXioeM/r07U112tznpvYzPzMQesisW4zIENG1BmWqBF8cSTtLVhvp0Ep9sNMt7WoFfN6VlIeEXnkps6qkOWeSYdgpHvr8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4190cbb1-daee-41e5-6dfd-08d73aef3593
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 21:45:36.2556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bidzf/l/ul8I2Ome+taSJLOuR/7VGhrkd+KxCAhUyqXwMNlyvbMfnfbDwqINfaM93GJrIUWnjyg7APKvjbUNPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1P153MB0201
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

PiBGcm9tOiBsaW51eC1oeXBlcnYtb3duZXJAdmdlci5rZXJuZWwub3JnDQo+IDxsaW51eC1oeXBl
cnYtb3duZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgRGV4dWFuIEN1aQ0KPiBTZW50
OiBUaHVyc2RheSwgU2VwdGVtYmVyIDEyLCAyMDE5IDExOjM5IFBNDQo+IFRvOiBNaWNoYWVsIEtl
bGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IFdlaSBIdSA8d2VoQG1pY3Jvc29mdC5jb20+
Ow0KPiBiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb207IGxpbnV4LWh5cGVydkB2Z2VyLmtlcm5lbC5v
cmc7DQo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWZiZGV2QHZnZXIu
a2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgU3RlcGhlbiBIZW1t
aW5nZXINCj4gPHN0aGVtbWluQG1pY3Jvc29mdC5jb20+OyBzYXNoYWxAa2VybmVsLm9yZzsgSGFp
eWFuZyBaaGFuZw0KPiA8aGFpeWFuZ3pAbWljcm9zb2Z0LmNvbT47IEtZIFNyaW5pdmFzYW4gPGt5
c0BtaWNyb3NvZnQuY29tPg0KPiBDYzogSW91cmkgVGFyYXNzb3YgPGlvdXJpdEBtaWNyb3NvZnQu
Y29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY0XSB2aWRlbzogaHlwZXJ2OiBoeXBlcnZfZmI6
IE9idGFpbiBzY3JlZW4gcmVzb2x1dGlvbg0KPiBmcm9tIEh5cGVyLVYgaG9zdA0KPiANCj4gPiBG
cm9tOiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT4NCj4gPiBTZW50OiBU
aHVyc2RheSwgU2VwdGVtYmVyIDUsIDIwMTkgNzowNiBBTQ0KPiA+DQo+ID4gRnJvbTogV2VpIEh1
IDx3ZWhAbWljcm9zb2Z0LmNvbT4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciA1LCAyMDE5DQo+
IDI6MTINCj4gPiBBTQ0KPiA+ID4NCj4gPiA+IEJlZ2lubmluZyBmcm9tIFdpbmRvd3MgMTAgUlM1
KywgVk0gc2NyZWVuIHJlc29sdXRpb24gaXMgb2J0YWluZWQgZnJvbQ0KPiA+IGhvc3QuDQo+ID4g
PiBUaGUgInZpZGVvPWh5cGVydl9mYiIgYm9vdCB0aW1lIG9wdGlvbiBpcyBub3QgbmVlZGVkLCBi
dXQgc3RpbGwgY2FuIGJlDQo+ID4gPiB1c2VkIHRvIG92ZXJ3cml0ZSB3aGF0IHRoZSBob3N0IHNw
ZWNpZmllcy4gVGhlIFZNIHJlc29sdXRpb24gb24gdGhlIGhvc3QNCj4gPiA+IGNvdWxkIGJlIHNl
dCBieSBleGVjdXRpbmcgdGhlIHBvd2Vyc2hlbGwgInNldC12bXZpZGVvIiBjb21tYW5kLg0KPiA+
ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IElvdXJpIFRhcmFzc292IDxpb3VyaXRAbWljcm9zb2Z0
LmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBIdSA8d2VoQG1pY3Jvc29mdC5jb20+DQo+
ID4gPiAtLS0NCj4gPiA+ICAgICB2MjoNCj4gPiA+ICAgICAtIEltcGxlbWVudGVkIGZhbGxiYWNr
IHdoZW4gdmVyc2lvbiBuZWdvdGlhdGlvbiBmYWlsZWQuDQo+ID4gPiAgICAgLSBEZWZpbmVkIGZ1
bGwgc2l6ZSBmb3Igc3VwcG9ydGVkX3Jlc29sdXRpb24gYXJyYXkuDQo+ID4gPg0KPiA+ID4gICAg
IHYzOg0KPiA+ID4gICAgIC0gQ29ycmVjdGVkIHRoZSBzeW50aHZpZCBtYWpvciBhbmQgbWlub3Ig
dmVyc2lvbiBjb21wYXJpc29uDQo+IHByb2JsZW0uDQo+ID4gPg0KPiA+ID4gICAgIHY0Og0KPiA+
ID4gICAgIC0gQ2hhbmdlZCBmdW5jdGlvbiBuYW1lIHRvIHN5bnRodmlkX3Zlcl9nZSgpLg0KPiA+
ID4NCj4gPiA+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jIHwgMTU5DQo+ID4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTQ3
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPg0KPiA+IFJldmlld2Vk
LWJ5OiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT4NCj4gDQo+IExvb2tz
IGdvb2QgdG8gbWUuDQo+IA0KPiBSZXZpZXdlZC1ieTogRGV4dWFuIEN1aSA8ZGVjdWlAbWljcm9z
b2Z0LmNvbT4NCg0KSGkgV2VpLA0KSXQgdHVybnMgb3V0IHdlIG5lZWQgdG8gbWFrZSBhIGZ1cnRo
ZXIgZml4LiA6LSkNCg0KVGhlIHBhdGNoIGZvcmdldHMgdG8gdGFrZSBwYXItPnVwZGF0ZSBpbnRv
IGNvbnNpZGVyYXRpb24uDQoNCldoZW4gdGhlIFZNIENvbm5lY3Rpb24gd2luZG93IGlzIGNsb3Nl
ZCAob3IgbWluaW1pemVkPyksDQp0aGUgaG9zdCBzZW5kcyBhIG1lc3NhZ2UgdG8gdGhlIGd1ZXN0
LCBhbmQgdGhlIGd1ZXN0IHNldHMNCnBhci0+dXBkYXRlIHRvIGZhbHNlIGluIHN5bnRodmlkX3Jl
Y3Zfc3ViKCkuDQoNCklmIHBhci0+dXBkYXRlIGlzIGZhbHNlLCB0aGUgZ3Vlc3QgZG9lc24ndCBu
ZWVkIHRvIGNhbGwNCnN5bnRodmlkX3VwZGF0ZSgpLg0KDQpUaGFua3MsDQotLSBEZXh1YW4NCg==
