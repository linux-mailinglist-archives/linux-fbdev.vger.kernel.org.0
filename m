Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7A21F4046
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Jun 2020 18:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731005AbgFIQJL (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 9 Jun 2020 12:09:11 -0400
Received: from mail-bn8nam12on2119.outbound.protection.outlook.com ([40.107.237.119]:21057
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728888AbgFIQJI (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 9 Jun 2020 12:09:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgDMiYVG3MW3hQy7Fpj/hYPgqpoctFsTqbXe4JeoPtzlxFYBtvVcNOnl3Nn8ilVo1x2c08nVYYhcH7aL5UnGc2HwfOo0wbhv7AvlNPGoHb8rrdUNatdeVImIOYxlc74f+cwMVXt3r9JISI5o1oEaw47WaZ6WPuM5YrJATkkiNWF/sonFZuB3KAvlJD2t5wDW3h/YXXCpvOkZ8LKdSTJRRRCqCGtRGbOwmqLPeFrTLgs55M4M53q+O0Lugu+zCAMPScCrOZt0V/UAVbGIPVY3060ez0wY0Pa7Zp2r8abXo3OevTc+KyN+lNZIyk/yGG2bU4hs8r8tE3Q3ssbdditwvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iI46TTQ7tYVkc4MKc7mIVcSj56gRNADd+uQfYUlVc6o=;
 b=ijqOZH9ePlcDhAcMgUMxQv4Go5SsPd8tw7f2Xq6wC2Sg1swGXgkwhGfR+iitWsxP6k+y3aAdEql28QlMIyDTIlfmToUj5YAI5sM2aD74nyI7uPxYQL3MZlonxzg26CqoSDWSVKSIBxmMQX4+tW4xSIqfaAssK04ZcLlc78DONfWYF5fl1S/C6LwbAjcP9Oz3ryR8AjKty/sagC/zOSf4bCygFF7Gryv3oFS3qZfbpXDE1v8+drQ06ny7EhMauUU0ah0JfEOKF3I/R2n6BWxUtInUWIx2bQx4n+Nl4U6IcfalLqzpR5qJRAC94mLmaMq4iFHeFpid+lkxgmPhkocw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iI46TTQ7tYVkc4MKc7mIVcSj56gRNADd+uQfYUlVc6o=;
 b=homgDN/4kJ01ytcFwW6XkCqx6rxhuhiOjhr2gyI+f/Nliu0kqa/OT41PIm/mumu+gEyEBwoIuk6374zkJ+HIJBVMftSdXrCpGSbxBu/VlsNjHtezFJWnei7P7hM+G5P/M0FQyJ1FWte35ZMKtXpPirsJUz0xqyqhN43KX0/pGwk=
Received: from BN6PR06MB2532.namprd06.prod.outlook.com (2603:10b6:404:2a::10)
 by BN6PR06MB2324.namprd06.prod.outlook.com (2603:10b6:404:2e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Tue, 9 Jun
 2020 16:09:05 +0000
Received: from BN6PR06MB2532.namprd06.prod.outlook.com
 ([fe80::e802:ad07:3832:e440]) by BN6PR06MB2532.namprd06.prod.outlook.com
 ([fe80::e802:ad07:3832:e440%11]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 16:09:05 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
CC:     "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "Lu, Long" <l.lu@northeastern.edu>,
        "yaohway@gmail.com" <yaohway@gmail.com>
Subject: RE: [Bug Report] drivers/video/fbdev/kyro/fbdev.c: unsigned integer
 wrap-around might cause unexpected behavior
Thread-Topic: [Bug Report] drivers/video/fbdev/kyro/fbdev.c: unsigned integer
 wrap-around might cause unexpected behavior
Thread-Index: AdYvDPkmGOphWO3cRE+TFVL2OMV8xgPPfeAAAArgWkA=
Date:   Tue, 9 Jun 2020 16:09:05 +0000
Message-ID: <BN6PR06MB2532740233C9CC536EF1F182E5820@BN6PR06MB2532.namprd06.prod.outlook.com>
References: <CGME20200521011509eucas1p240099e1e51780beeee80257bfc361e33@eucas1p2.samsung.com>
        <BL0PR06MB45489A53C61DF15BF2F95B9CE5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
 <c20a2141-1586-aeb3-abf8-385bb6e498b6@samsung.com>
In-Reply-To: <c20a2141-1586-aeb3-abf8-385bb6e498b6@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none
 header.from=northeastern.edu;
x-originating-ip: [155.33.134.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33525ed3-60f8-408d-10f1-08d80c8f6ed5
x-ms-traffictypediagnostic: BN6PR06MB2324:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR06MB23247F5C9E2FBF2F4742F770E5820@BN6PR06MB2324.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gLwbBb9Jf063oP5bAonW8530DdDyLuLagU3Pq/HfiWVYTsyzhG1N0XWsIDE/DyiQEyhOb6gdvtNKHTapZ05BYA5aqpVm7rH0IOI/yOQnAf56jVTOh37n8OMqO9RjNcEFi9QUbAdTfSMZGNaOb1ulsn3ZbLI0xLevBqqx9dlSnSyUlqgiYYaiUHPa9J10Xe7MYIh+g/NEVSwdv5ouHZqMfNhy7+mzefHhHGwYDbz/ecx6Xc1IsxWt/ixXQckUceW/xtNNr2hLGFkTz5gcmd/Jvsd6FO7oCqq2p+akm8BB3Ynv3f+wPbH0prwl/tDSWkQFirVBaiEfti818o1nicBSjQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR06MB2532.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(54906003)(55016002)(9686003)(86362001)(66556008)(478600001)(66446008)(71200400001)(66476007)(64756008)(26005)(5660300002)(76116006)(6916009)(8936002)(33656002)(8676002)(66946007)(7696005)(2906002)(316002)(786003)(83380400001)(53546011)(75432002)(6506007)(52536014)(4326008)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Y6iixd5Pyj5S+3x7jhoWbQGk0C1Zng+pJjIfMk8ahC6NjKEOGNKfdE2SO1Uq8m7pUYqQywyf3k9NDkGWQvgewmmBFSNqzuXHjo8fyy9Ad/lnO4vp+/FqmzNlOi/RS7Gd7j3QtjDWk45Mfs9aX+S29gJGvtf9z+8FCIEM5rhsZ0o+YHwrfbzXIQv+eWORjHTKJNvPM0guVBDWNp9m/PDy4yCBF0E+CT1sS7pZFc8VsA3RPem49JtolEh6LFm0NF9Zahq5wZVVrjOunuwnMxpHCgSAqzE8ghVGA1E1UBhQ4Zwz1K3/jeCsGXThFVtRJbSg7op/bwISWxJXYM67cY8IT6bXIiiv3Du2Vt+VGXixIdaklawDgA902ZVSzS5/Zt2c01N+vx5BNJVm8fc/TCZke4q5eTWQ6JpjiQN92X1ALc7yliXnOLZysEumFV3IYcbU+8spyrOKbTs82gZQjpbLSN+VmS25CXNDD3ZZp5L7w2s=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 33525ed3-60f8-408d-10f1-08d80c8f6ed5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 16:09:05.1239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pGdJFHBx9tRspHRQbytRNBwtStTfb8JPKezanIkEwJ4CFX6/1n9BobkGCV8qk51NOmYMvWuTeYxZ+0EXdHo1V3D0iPyfLaRXgKty4QUDwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR06MB2324
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

PiBGcm9tOiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5j
b20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgOSwgMjAyMCA2OjQ0IEFNDQo+IFRvOiBDaGFuZ21p
bmcgTGl1IDxsaXUuY2hhbmdtQG5vcnRoZWFzdGVybi5lZHU+DQo+IENjOiBsaW51eC1mYmRldkB2
Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEx1LCBMb25n
DQo+IDxsLmx1QG5vcnRoZWFzdGVybi5lZHU+OyB5YW9od2F5QGdtYWlsLmNvbQ0KPiBTdWJqZWN0
OiBSZTogW0J1ZyBSZXBvcnRdIGRyaXZlcnMvdmlkZW8vZmJkZXYva3lyby9mYmRldi5jOiB1bnNp
Z25lZA0KPiBpbnRlZ2VyIHdyYXAtYXJvdW5kIG1pZ2h0IGNhdXNlIHVuZXhwZWN0ZWQgYmVoYXZp
b3INCj4gDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDUvMjEvMjAgMzoxNSBBTSwgQ2hhbmdtaW5nIExp
dSB3cm90ZToNCj4gPiBIaSBCYXJ0bG9taWVqLA0KPiA+IEdyZWV0aW5ncywgSSdtIGEgZmlyc3Qt
eWVhciBQaEQgc3R1ZGVudCB3aG8gaXMgaW50ZXJlc3RlZCBpbiB0aGUgdXNhZ2Ugb2YNCj4gVUJT
YW4gZm9yIGxpbnV4Lg0KPiA+IEFuZCBhZnRlciBzb21lIGV4cGVyaW1lbnRzLCBJIGZvdW5kIHRo
YXQgaW4NCj4gPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2t5cm8vZmJkZXYuYyBmdW5jdGlvbg0KPiBr
eXJvX2Rldl9vdmVybGF5X3ZpZXdwb3J0X3NldCwgdGhlcmUgaXMgYW4gdW5zaWduZWQgaW50ZWdl
ciBvdmVyZmxvdyB0aGF0DQo+IG1pZ2h0IGNhdXNlIHVuZXhwZWN0ZWQgYmVoYXZpb3IuDQo+ID4N
Cj4gPiBNb3JlIHNwZWNpZmljYWxseSwgZmlyc3QgYXQgaXRzIGNhbGxlciwga3lyb2ZiX2lvY3Rs
LCBhZnRlciBleGVjdXRpb24gb2YNCj4gY29weV9mcm9tX3VzZXIgYXQgbGluZSA1OTksIHN0cnVj
dCBvbF92aWV3cG9ydF9zZXQgaXMgZmlsbGVkIHdpdGggZGF0YSBmcm9tDQo+IHVzZXIgc3BhY2Uu
DQo+ID4gQW5kIHRoZSA0IDMyYml0IHVuc2lnbmVkIGludGVnZXJzIGZyb20gaXQgYXJlIHBhc3Nl
ZCBpbnRvDQo+ID4ga3lyb19kZXZfb3ZlcmxheV92aWV3cG9ydF9zZXQuIEluIGZ1bmN0aW9uDQo+
IGt5cm9fZGV2X292ZXJsYXlfdmlld3BvcnRfc2V0LCB4IGlzIGFkZGVkIHdpdGggdWxXaWR0aCwg
eSBpcyBhZGRlZCB3aXRoDQo+IHVsSGVpZ2h0IHRvIHRyYW5zZmVyIHRoZSBsZW5ndGggdG8gdGhl
IGNvb3JkaW5hdGUuDQo+ID4gQW5kIHRoZSByZXN1bHQgY29vcmRpbmF0ZSBtaWdodCBvdmVyZmxv
dyBhbmQgd3JhcCBhcm91bmQuIEFuZCBpdCBpcw0KPiBwYXNzZWQgaW50byBmdW5jdGlvbiBTZXRP
dmVybGF5Vmlld1BvcnQuDQo+ID4NCj4gPiBJdCBhcHBlYXJzIHRoYXQgaW4gZnVuY3Rpb24gU2V0
T3ZlcmxheVZpZXdQb3J0LCB0aGVzZSB2YWx1ZXMgYXJlIHRyZWF0ZWQgYXMNCj4gdGhlIGNvb3Jk
aW5hdGUgb2YgdGhlIGJvdHRvbS1yaWdodCBwb2ludCBhbmQgdGhlIHdyYXAtYXJvdW5kIGlzIG5v
dA0KPiBjaGVja2VkLihJIG1pZ2h0IG1pc3Mgc29tZXRoaW5nKS4NCj4gPg0KPiA+IER1ZSB0byB0
aGUgbGFjayBvZiBrbm93bGVkZ2Ugb2YgdGhlIGludGVyYWN0aW9uIGJldHdlZW4gdGhpcyBtb2R1
bGUgYW5kDQo+IHRoZSB1c2VyIHNwYWNlLCBJJ20gbm90IGFibGUgdG8gYXNzZXNzIGlmIHRoaXMg
aXMgYSBiZW5pZ24gd3JhcC1hcm91bmQgb3INCj4gd2hldGhlciB0aGUgd3JhcC1hcm91bmQgY291
bGQgaGFwcGVuIGF0IGFsbC4NCj4gPiBJJ2QgYXBwcmVjaWF0ZSBmb3IgeW91IGNvbW1lbnQgb24g
dGhpcyBpc3N1ZSwgdGhpcyBjb3VsZCBoZWxwIG1lDQo+IHVuZGVyc3RhbmQgbGludXggYW5kIHVu
c2lnbmVkIHdyYXAgYXJvdW5kIGEgbG90Lg0KPiA+DQo+ID4gTG9va2luZyBmb3J3YXJkIHRvIHlv
dXIgdmFsdWFibGUgcmVzcG9uc2UhDQo+IA0KPiBJdCBzZWVtcyB0aGF0IHdyYXAtYXJvdW5kIGNh
biBpbmRlZWQgaGFwcGVuIGJ1dCBJJ20gbm90IHN1cmUgd2hhdCBhcmUgdGhlDQo+IGV4YWN0IGNv
bnNlcXVlbmNlcyBvZiBpdCAoU2V0T3ZlcmxheVZpZXdQb3J0KCkgaXMgcXVpdGUgY29tcGxpY2F0
ZWQgYW5kIEkNCj4gYWxzbyBkb24ndCBrbm93IGhvdyBoYXJkd2FyZSB3b3VsZCByZWFjdCB0byBp
bXByb3BlciBzZXR0aW5ncykuDQo+IA0KPiBreXJvZmIgZHJpdmVyIGlzIGZvciBsZWdhY3kgZGV2
aWNlcyBhbmQgaXMgbm90IGFjdGl2ZWx5IG1haW50YWluZWQgc28gSSB3b3JyeQ0KPiB0aGF0IHdp
dGhvdXQgc29tZWJvZHkgd2l0aCB0aGUgYWNjZXNzIHRvIGhhcmR3YXJlIGFuZCB0aW1lIHRvIGlu
dmVzdGlnYXRlDQo+IGl0IGZ1cnRoZXIgSSBjYW5ub3QgZG8gbXVjaCBhYm91dCB0aGUgcHJvYmxl
bS4NCj4gDQpUaGFua3MgZm9yIHRoZSBjb21tZW50cyEgVGhlc2UgYXJlIHZhbHVhYmxlIG9ic2Vy
dmF0aW9ucyB3aGljaCBzaG93IHRoYXQNCmhhcmR3YXJlLWRyaXZlciBpbnRlcmFjdGlvbiBjYW4g
cGxheSBhIHJvbGUgaW4gdW5zaWduZWQgd3JhcC1hcm91bmQgaGVyZS4NCkluZGVlZCwgdGhlcmUg
aXMgbm8gZXZpZGVuY2UgdG8gZGV0ZXJtaW5lIHRoZSB3cmFwIGFyb3VuZCBpcyBiZW5pZ24gb3Ig
bm90Lg0KU2luY2UgdGhlc2UgYXJlIGp1c3QgZm9yIGxlZ2FjeSBkZXZpY2VzLCBJIHRvbyB3b3Vs
ZCBub3QgdGFrZSB0aGUgcmlzayB0byBmaXggc3RoDQp3aGljaCBpcyBub3QgYnJva2VuLg0KDQpU
aGFua3MgYWdhaW4gZm9yIHlvdXIgZmVlZGJhY2ssIEkgbGVhcm5lZCBhIGxvdC4NCg0KQmVzdCwN
CkNoYW5nbWluZw0KDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gQmFydGxvbWllaiBab2xuaWVy
a2lld2ljeg0KPiBTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kDQo+IFNhbXN1bmcgRWxlY3Ry
b25pY3MNCj4gDQo+ID4gQmVzdCwNCj4gPiBDaGFuZ21pbmcgTGl1DQo+ID4NCg==
