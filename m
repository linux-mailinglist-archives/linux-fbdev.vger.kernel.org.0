Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B608C54EA22
	for <lists+linux-fbdev@lfdr.de>; Thu, 16 Jun 2022 21:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378340AbiFPTa2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 16 Jun 2022 15:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbiFPTa1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 16 Jun 2022 15:30:27 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D2F56C38;
        Thu, 16 Jun 2022 12:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tj/Kn/m3ywOpZInEIxiIXir5jWNKsECP2ZJ92u8nQq9XOQkS0k+XMcO9mA79g/Ocw/xN/AJXicoTF2EC5X7BhFd3iDdDXMhG+pkATx1owrxUZAEZrrYJirzXW4ntsttxh2wfYEi5wIvutUN3OUcRuvUndPKYxTjvwJb1IM5kYoCfqIoo4UQWugsK0DO5gDvmkUf8qWWiW2t3lurhL2CvrJfW3NYxaIli8u9H5/Tet/Dhcj4jzQqDG62jl/MVlHQsSMl8YIyFcw3NA4Y522C7nt9Y+GQ24BFnY2/W/budRfSXI8PNL8T4eDIRuKGgHESSdk7C2q2MPDUzvuBWtgXe3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrTS58qPqIlCyrgY084fIV6pOz4+7GJPx+6wcTC3x4s=;
 b=EyYT0a4T+wLInnN8VMgs4RKSjdXC713iKrGyzwH0BOKrgcoTbTz/PKMOzon4t3Ov8TanNPI9DVwvrgzsx+v0dyf4HOx2CI+AfqDW8Fnk9egT4qX8PCsX1ojT1aPUS0TEvh1dSiEav86hKQ7aGzJ2EUGcuDyXYEOaCmB9nXeJ9yf09yPNFO3cgqnnZvaWOAJTpTWgJY2Y3lnuhrvTZZtohivvgbR8CJmmltiA7h3No402pfq7+sPvcTVB2SBvxVMfISeXQluZbJD1WJy4NHuQaf/qYJA3iiAMTvuBeHYRmmjaUNiRpJOk47DI7RsQkERNNP0cZ6u1Qxr/STE2KaSHZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrTS58qPqIlCyrgY084fIV6pOz4+7GJPx+6wcTC3x4s=;
 b=goTFAFfKyjIk14fPzLwVjdefMbJSWA//oW/Me5IgZflldgAL+a+HdvI6amHhgSXJJjGDrOCInde8W861NrtrhLabXvHVRaksR3mqMAp3+VufTFnCmKBARNMTpZDn6BqYv+ZUJTLv/UPRQzTc/c1bBTWleTs2MQT2jxGc8ZQuC18=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by BYAPR05MB6213.namprd05.prod.outlook.com (2603:10b6:a03:de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 19:29:43 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02%3]) with mapi id 15.20.5353.011; Thu, 16 Jun 2022
 19:29:42 +0000
From:   Zack Rusin <zackr@vmware.com>
To:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "javierm@redhat.com" <javierm@redhat.com>
CC:     "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "kraxel@redhat.com" <kraxel@redhat.com>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
        "lersek@redhat.com" <lersek@redhat.com>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "deller@gmx.de" <deller@gmx.de>,
        Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Subject: Re: [PATCH v6 3/5] fbdev: Disable sysfb device registration when
 removing conflicting FBs
Thread-Topic: [PATCH v6 3/5] fbdev: Disable sysfb device registration when
 removing conflicting FBs
Thread-Index: AQHYepvEjLx5F4TpvU6kmXodMqZSca1SeaGA
Date:   Thu, 16 Jun 2022 19:29:42 +0000
Message-ID: <de83ae8cb6de7ee7c88aa2121513e91bb0a74608.camel@vmware.com>
References: <20220607182338.344270-1-javierm@redhat.com>
         <20220607182338.344270-4-javierm@redhat.com>
In-Reply-To: <20220607182338.344270-4-javierm@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15e3ff4e-3fc9-40ec-eda5-08da4fce902c
x-ms-traffictypediagnostic: BYAPR05MB6213:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <BYAPR05MB6213F397CE22366484678B16CEAC9@BYAPR05MB6213.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xhHCPlBWLI0GZ5iLVcwJ4mDgLKNEjwdA71RB2LE7xD0uU1/aK5UKBS8aI9loJ495K/zsdru/cmBTGrN2C7hah280GLXtII/zkg87EpuWrjzsy3dAPCD2cie89aYRHEksAY3Y8M6FAlt7jo5/8FyHhtmTDGL4VdRnrTg6YPDdfW1P6sfnzjmku6PH4QkrSruprhH94NTpQdjI7dUrhTi848O9d7bV6ouiDsIjo66YuFTyVwLIcaZDDct4PgODUWk1CGUPwiAqiPKeV2WsFfv+7HeZe2miKRPjRMC/ATmYOZ9BWLzmstfcLIiisnjcLAtoAAILrhpVc1yYm4uy+Jth3HVvIqUSFFvbOpxP2N4hy9e9pl9qpMF53o9a5CkWM9Vi16s0d+L6auLPwCZZCwukyL7fog+9YcCB1kzkSpd6HO0jxv4M+UtofLBzGDqEsLPku/ZXVugc+OtzKl7VxEazazX3Go9weiQ2Ns4+BRwfZZfg8KbWSX1UqOxpowKYBgfkB3AvfaPHpvcwlX4TejwbMtRQ+bEhPGd3HZWsmzBiUBUvowPuJRr9RXkGMnzc99Cak68PGt1+rVJrmnU6YiRWKuT78vhWCtQX8rtGWrXNfJfnBsM2W+APtzE7qeZ/d/McHbddR5wE4BAqzayr8AUsqBKQlKbU0lyORiqcXUMTh2uzup5vh6w6L9xU2xR/HCxR4AW5diNUQrNQdF4oMOx/lQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR05MB3047.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(7416002)(2906002)(66946007)(91956017)(508600001)(45080400002)(66476007)(110136005)(8936002)(6486002)(86362001)(6512007)(76116006)(5660300002)(6506007)(8676002)(64756008)(26005)(38100700002)(66556008)(66446008)(4326008)(71200400001)(316002)(54906003)(83380400001)(122000001)(38070700005)(36756003)(107886003)(186003)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0ZwYzZVT0V0TVUvMkpGRm1OUlhSU1FmQUNYREZLN0xhZjRjZ3gyQ2xvK0pW?=
 =?utf-8?B?QmZMU2FCOXFRYmdwbkRieUhaV2NkU2lNeHpqZmUzbGpvMkY3Mys2Qm1DU2V6?=
 =?utf-8?B?dUUrVWhvMTM5VUdTVHd0VnpYR0hua01OMnp2ZzlBZWRQTlBXNm9RTXdnZWVn?=
 =?utf-8?B?c0pBRDJjeFg1R1RTdkdoaTU2emxESzFYOFNjNjdWaVZ2VlFFVlFLdFNSUXFk?=
 =?utf-8?B?WGhYc01ibUNERjROWmllQmNoZUNxL1VBempkMDA0KzFwQnRGVVkxTmdlUkky?=
 =?utf-8?B?TnpOaHp1YkZmTVVVMThtMEhIVTJ2K0RKUGdraUdIdnJYd0l3OU5CanNVOFB2?=
 =?utf-8?B?TFBpOVBOMm1XejNTaUVNMFU0ZklQZUU1a1RjTzZLY0gzUnNIZGl0d05xYWxh?=
 =?utf-8?B?STRtQWVSTlBDSU9UK0xWTlVodVY0MjJDbThRK0p4OGRHZ3R4T1V5blhMQVBz?=
 =?utf-8?B?L2xxQ1ZCSHJIa1JtMk5MckZjcmVIZFdPcmUzM3MxdWVzRy80dlZVZVB5TDRw?=
 =?utf-8?B?ZUh5cEx6UGxHcEh2RGIrRGc0UXZWUVk4a1BTKythQTJBNFc0cFZvY2Z0TUtv?=
 =?utf-8?B?RzM0UHJOd2h5Rnp3bElwU0s1N3JrQWUxcEttaVp1L2pwaS9Ea2NwNzY5c3Q1?=
 =?utf-8?B?K3ZaRDQvbldwVHE5UHp4clYvc213VUtGQzhidHVOYXprN213OSthSVBFdzBE?=
 =?utf-8?B?ZlovMzFybzBpeHhTNTdjcldUQk5zSXd5WXA4VTBiUE1Ca2Rta3JHVmNvaS9i?=
 =?utf-8?B?VDMrcXhrMlh1TFY1aU1aMUdpSjhKUEU1ckVkUld0R1dFUGhDQkRzRWNXcy9N?=
 =?utf-8?B?Tm1lNkZJQVhnZkFYQzRxN3dsTFpCb2VKRmNkKzkzK2tTNk9PZnRNOUROSjNP?=
 =?utf-8?B?VWFERmVwczFhalJsQ05ESFZqbnpSUm5NMjNoYjdHOWpvSW1sTjhwSlR5YmpC?=
 =?utf-8?B?dGdwRmtJdlhIMFk0MDdzbGd2eCtrbDRIUFF2S0grMUwyWmdZVkt0WndqVi9t?=
 =?utf-8?B?SjBrNlk0ZldnRlQ4TUltT0hQSzEvbkxRTE9IWkJNUzJMSkZVbnpCWXdpQTRZ?=
 =?utf-8?B?YUs2K0grNy9MWExMWnp1V0o0OVE5Tmo5ZHZFaDZ6ODlnMVp2b21TSGM4ZWgr?=
 =?utf-8?B?UHJhQUVnWnNRR3ZrS0Fma2x3ZFp3L0ExanF1UW5zTUtNUldOVHFEUzZaakh3?=
 =?utf-8?B?cUYrSkZOWUVSd2w0WnZzY3MwZDZXZlRvT0xYZkQyZzUwaHAzeldlWnc5cWRE?=
 =?utf-8?B?ZTVOV201TEtqdm9DZmg0SFJycFloZGJKU1l5ZTg0akV3bDFFbFZBbWcvcEQz?=
 =?utf-8?B?UmEraXBCZVVCdG5XWWQwZGl5azRibGJBWlBHcUFDb081Q2lmaDNrMTh6S203?=
 =?utf-8?B?OVZkMzBmTUxZeW5hR1pud3Z6dldnTW1pMTVhS00yUWRGYnBTR0hJK1p6S3Rw?=
 =?utf-8?B?MDB3MzM1Y245R2FIZnVZemtCNVViZ3VkM3hxMk9ycmNtZ21FSDdTd0RXVmhs?=
 =?utf-8?B?bkt3UGdMc0RjeVJOL1R1VkVVV0ZRRnIxVVhwdGFSOWJVdVZZM2JDSlZwdzhL?=
 =?utf-8?B?WFI4U1Z4cFRzWEpiT3poak9NT050VVFDdnd6Q3lPL3NJSzRYZitrTTRIWXJM?=
 =?utf-8?B?bVFyRy9tTkZsdklEdkR4N2ZJcllmUHlBT241UDcvNDFhUHJuVzUyLzYrdmRz?=
 =?utf-8?B?T0F6NDZnSWZpRFlYZ0VDOFp6QmdJdmhVQ2JUdHRxUTY3K0dNY0lrcjFodUJt?=
 =?utf-8?B?YlIvT0M1MHV6NE9LbWZWcWN0T0ZtTktWQnZzbU9UR0NGUUFXb0k1bG1MR0V3?=
 =?utf-8?B?dTZKVTZLeFFWYTlXb0xWanVmdVNTcjdFditldVdabzA2WjkydVNkMmVMVUNh?=
 =?utf-8?B?dW0rUjNQRzdGVWxDelF2a09McVdpM09sWjVsV0VjZExHTUo1dkU0U2xkNnRO?=
 =?utf-8?B?VmY2NytNUUlYenNmcjVxMFdIVHgraWtla3pqcU50TkNRaUNjNzBDTzVwdnE2?=
 =?utf-8?B?ek8xTkZZQjRnVCtwUTZ4M0d4MWN5VkNSbEdoaFpsVW9oVzVIVTBnS1VHSk5h?=
 =?utf-8?B?d05PR3Vsb3l3bW92MEtkSUtXOW5neFExbU56bGxSemszSFNtWHBjbWk4OFU5?=
 =?utf-8?B?R3hoT2l2RXQxN2lkQzU2dkhrY05JN0hPM1U3MldtNGxmZnF0T3hDTHhsUmZa?=
 =?utf-8?B?clBncEVVYnZnVGR1aSsyaG9vOWpCeklIQVBETlNRdEhlVG5wUlNvNVN5NnZa?=
 =?utf-8?B?QmJWR3VYTERFY3VNZTBxcmRLdjlFY3h3RW9Ibk1LZmc3ZG4wSW1LY0hKL3FI?=
 =?utf-8?B?My9NckhUbVYvVzFOdlJIZW51eERwd2NBc2NmYUNhTTVJWFEwMEpEUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9C73EEC29767C4088A40466EB8BA93F@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e3ff4e-3fc9-40ec-eda5-08da4fce902c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 19:29:42.6598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2OMb7DEkGCZaLuc+iv3XN2Lovfe5G/OJLnpGkisRbtjsr3yepGrkEbp6wLsOlWlaa+EMmu8UhAz9t4miWBRobQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB6213
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

T24gVHVlLCAyMDIyLTA2LTA3IGF0IDIwOjIzICswMjAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMgd3JvdGU6DQo+IFRoZSBwbGF0Zm9ybSBkZXZpY2VzIHJlZ2lzdGVyZWQgYnkgc3lzZmIgbWF0
Y2ggd2l0aCBmaXJtd2FyZS1iYXNlZCBEUk0gb3INCj4gZmJkZXYgZHJpdmVycywgdGhhdCBhcmUg
dXNlZCB0byBoYXZlIGVhcmx5IGdyYXBoaWNzIHVzaW5nIGEgZnJhbWVidWZmZXINCj4gcHJvdmlk
ZWQgYnkgdGhlIHN5c3RlbSBmaXJtd2FyZS4NCj4gDQo+IERSTSBvciBmYmRldiBkcml2ZXJzIGxh
dGVyIGFyZSBwcm9iZWQgYW5kIHJlbW92ZSBhbGwgY29uZmxpY3RpbmcgZnJhbWVidWZmZXJzLA0K
PiBsZWFkaW5nIHRvIHRoZXNlIHBsYXRmb3JtIGRldmljZXMgZm9yIGdlbmVyaWMgZHJpdmVycyB0
byBiZSB1bnJlZ2lzdGVyZWQuDQo+IA0KPiBCdXQgdGhlIGN1cnJlbnQgc29sdXRpb24gaGFzIGEg
cmFjZSwgc2luY2UgdGhlIHN5c2ZiX2luaXQoKSBmdW5jdGlvbiBjb3VsZA0KPiBiZSBjYWxsZWQg
YWZ0ZXIgYSBEUk0gb3IgZmJkZXYgZHJpdmVyIGlzIHByb2JlZCBhbmQgcmVxdWVzdCB0byB1bnJl
Z2lzdGVyDQo+IHRoZSBkZXZpY2VzIGZvciBkcml2ZXJzIHdpdGggY29uZmxpY3RpbmcgZnJhbWVi
dWZmZXMuDQo+IA0KPiBUbyBwcmV2ZW50IHRoaXMsIGRpc2FibGUgYW55IGZ1dHVyZSBzeXNmYiBw
bGF0Zm9ybSBkZXZpY2UgcmVnaXN0cmF0aW9uIGJ5DQo+IGNhbGxpbmcgc3lzZmJfZGlzYWJsZSgp
LCBpZiBhIGRyaXZlciByZXF1ZXN0cyB0byByZW1vdmUgdGhlIGNvbmZsaWN0aW5nDQo+IGZyYW1l
YnVmZmVycy4NCj4gDQo+IFN1Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4NCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxq
YXZpZXJtQHJlZGhhdC5jb20+DQo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPg0KPiAtLS0NCj4gDQo+IENoYW5nZXMgaW4gdjY6DQo+IC0gTW92ZSB0
aGUgc3lzZmJfZGlzYWJsZSgpIGJlZm9yZSB0aGUgcmVtb3ZlIGNvbmZsaWN0aW5nIGZyYW1lYnVm
ZmVycw0KPiAgIGxvb3AgKERhbmllbCBWZXR0ZXIpLg0KPiANCj4gQ2hhbmdlcyBpbiB2NToNCj4g
LSBNb3ZlIHRoZSBzeXNmYl9kaXNhYmxlKCkgY2FsbCBhdCBjb25mbGljdGluZyBmcmFtZWJ1ZmZl
cnMgYWdhaW4gdG8NCj4gICBhdm9pZCB0aGUgbmVlZCBvZiBhIERSSVZFUl9GSVJNV0FSRSBjYXBh
YmlsaXR5IGZsYWcuDQo+IC0gQWRkIERhbmllbCBWZXR0ZXIncyBSZXZpZXdlZC1ieSB0YWcgYWdh
aW4gc2luY2UgcmV2ZXJ0ZWQgdG8gdGhlIG9sZA0KPiAgIHBhdGNoIHRoYXQgaGUgYWxyZWFkeSBy
ZXZpZXdlZCBpbiB2Mi4NCj4gDQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gQ2FsbCBzeXNmYl9kaXNh
YmxlKCkgd2hlbiBhIERSTSBkZXYgYW5kIGEgZmJkZXYgYXJlIHJlZ2lzdGVyZWQgcmF0aGVyDQo+
ICAgdGhhbiB3aGVuIGNvbmZsaWN0aW5nIGZyYW1lYnVmZmVycyBhcmUgcmVtb3ZlZCAoVGhvbWFz
IFppbW1lcm1hbm4pLg0KPiAtIENhbGwgc3lzZmJfZGlzYWJsZSgpIHdoZW4gYSBmYmRldiBmcmFt
ZWJ1ZmZlciBpcyByZWdpc3RlcmVkIHJhdGhlcg0KPiAgIHRoYW4gd2hlbiBjb25mbGljdGluZyBm
cmFtZWJ1ZmZlcnMgYXJlIHJlbW92ZWQgKFRob21hcyBaaW1tZXJtYW5uKS4NCj4gLSBEcm9wIERh
bmllbCBWZXR0ZXIncyBSZXZpZXdlZC1ieSB0YWcgc2luY2UgcGF0Y2ggY2hhbmdlZCBhIGxvdC4N
Cj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gRXhwbGFpbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ug
dGhhdCBmYm1lbSBoYXMgdG8gdW5yZWdpc3RlciB0aGUgZGV2aWNlDQo+ICAgYXMgZmFsbGJhY2sg
aWYgYSBkcml2ZXIgcmVnaXN0ZXJlZCB0aGUgZGV2aWNlIGl0c2VsZiAoRGFuaWVsIFZldHRlciku
DQo+IC0gQWxzbyBleHBsYWluIHRoYXQgZmFsbGJhY2sgaW4gYSBjb21tZW50IGluIHRoZSBjb2Rl
IChEYW5pZWwgVmV0dGVyKS4NCj4gLSBEb24ndCBlbmNvZGUgaW4gZmJtZW0gdGhlIGFzc3VtcHRp
b24gdGhhdCBzeXNmYiB3aWxsIGFsd2F5cyByZWdpc3Rlcg0KPiAgIHBsYXRmb3JtIGRldmljZXMg
KERhbmllbCBWZXR0ZXIpLg0KPiAtIEFkZCBhIEZJWE1FIGNvbW1lbnQgYWJvdXQgZHJpdmVycyBy
ZWdpc3RlcmluZyBkZXZpY2VzIChEYW5pZWwgVmV0dGVyKS4NCj4gDQo+ICBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJtZW0uYyB8IDEyICsrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jDQo+IGluZGV4
IDJmZGE1OTE3YzIxMi4uZTA3MjBmZWYwZWU2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJtZW0uYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJt
ZW0uYw0KPiBAQCAtMTksNiArMTksNyBAQA0KPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0K
PiAgI2luY2x1ZGUgPGxpbnV4L21ham9yLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0K
PiArI2luY2x1ZGUgPGxpbnV4L3N5c2ZiLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvbW0uaD4NCj4g
ICNpbmNsdWRlIDxsaW51eC9tbWFuLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvdnQuaD4NCj4gQEAg
LTE3NjQsNiArMTc2NSwxNyBAQCBpbnQgcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhz
dHJ1Y3QgYXBlcnR1cmVzX3N0cnVjdCAqYSwNCj4gIAkJZG9fZnJlZSA9IHRydWU7DQo+ICAJfQ0K
PiAgDQo+ICsJLyoNCj4gKwkgKiBJZiBhIGRyaXZlciBhc2tlZCB0byB1bnJlZ2lzdGVyIGEgcGxh
dGZvcm0gZGV2aWNlIHJlZ2lzdGVyZWQgYnkNCj4gKwkgKiBzeXNmYiwgdGhlbiBjYW4gYmUgYXNz
dW1lZCB0aGF0IHRoaXMgaXMgYSBkcml2ZXIgZm9yIGEgZGlzcGxheQ0KPiArCSAqIHRoYXQgaXMg
c2V0IHVwIGJ5IHRoZSBzeXN0ZW0gZmlybXdhcmUgYW5kIGhhcyBhIGdlbmVyaWMgZHJpdmVyLg0K
PiArCSAqDQo+ICsJICogRHJpdmVycyBmb3IgZGV2aWNlcyB0aGF0IGRvbid0IGhhdmUgYSBnZW5l
cmljIGRyaXZlciB3aWxsIG5ldmVyDQo+ICsJICogYXNrIGZvciB0aGlzLCBzbyBsZXQncyBhc3N1
bWUgdGhhdCBhIHJlYWwgZHJpdmVyIGZvciB0aGUgZGlzcGxheQ0KPiArCSAqIHdhcyBhbHJlYWR5
IHByb2JlZCBhbmQgcHJldmVudCBzeXNmYiB0byByZWdpc3RlciBkZXZpY2VzIGxhdGVyLg0KPiAr
CSAqLw0KPiArCXN5c2ZiX2Rpc2FibGUoKTsNCj4gKw0KPiAgCW11dGV4X2xvY2soJnJlZ2lzdHJh
dGlvbl9sb2NrKTsNCj4gIAlkb19yZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKGEsIG5h
bWUsIHByaW1hcnkpOw0KPiAgCW11dGV4X3VubG9jaygmcmVnaXN0cmF0aW9uX2xvY2spOw0KDQpI
aSwgSmF2aWVyLg0KDQpUaGlzIGNoYW5nZSBicm9rZSBhcm02NCB3aXRoIHZtd2dmeC4gV2UgZ2V0
IGEga2VybmVsIG9vcHMgYXQgYm9vdCAobGV0IG1lIGtub3cgaWYNCnlvdSdkIGxpa2UgLmNvbmZp
ZyBvciBqdXN0IGhhdmUgdXMgdGVzdCBzb21ldGhpbmcgZGlyZWN0bHkgZm9yIHlvdSk6DQoNCg0K
IFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0
dWFsIGFkZHJlc3MNCjAwMDAwMDAwMDAwMDAwMDgNCiBNZW0gYWJvcnQgaW5mbzoNCiAgIEVTUiA9
IDB4OTYwMDAwMDQNCiAgIEVDID0gMHgyNTogREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0
cw0KICAgU0VUID0gMCwgRm5WID0gMA0KICAgRUEgPSAwLCBTMVBUVyA9IDANCiAgIEZTQyA9IDB4
MDQ6IGxldmVsIDAgdHJhbnNsYXRpb24gZmF1bHQNCiBEYXRhIGFib3J0IGluZm86DQogICBJU1Yg
PSAwLCBJU1MgPSAweDAwMDAwMDA0DQogICBDTSA9IDAsIFduUiA9IDANCiB1c2VyIHBndGFibGU6
IDRrIHBhZ2VzLCA0OC1iaXQgVkFzLCBwZ2RwPTAwMDAwMDAxNzg3ZWUwMDANCiBbMDAwMDAwMDAw
MDAwMDAwOF0gcGdkPTAwMDAwMDAwMDAwMDAwMDAsIHA0ZD0wMDAwMDAwMDAwMDAwMDAwDQogSW50
ZXJuYWwgZXJyb3I6IE9vcHM6IDk2MDAwMDA0IFsjMV0gU01QDQogTW9kdWxlcyBsaW5rZWQgaW46
IHZtd2dmeCgrKSBlMTAwMGUoKykgbnZtZSBhaGNpKCspIHhoY2lfcGNpIGRybV90dG1faGVscGVy
IHR0bQ0Kc2hhMjU2X2FybTY0IHNoYTFfY2UgbnZtZV9jb3JlIHhoY2lfcGNpX3JlbmVzYXMgYWVz
X25lb25fYnMgYWVzX25lb25fYmxrIGFlcz4NCiBDUFU6IDMgUElEOiAyMTUgQ29tbTogc3lzdGVt
ZC11ZGV2ZCBUYWludGVkOiBHICAgICBVICAgICAgICAgICAgNS4xOC4wLXJjNS12bXdnZngNCiMx
Mg0KIEhhcmR3YXJlIG5hbWU6IFZNd2FyZSwgSW5jLiBWQlNBL1ZCU0EsIEJJT1MgVkVGSSAxMi8z
MS8yMDIwDQogcHN0YXRlOiA4MDQwMDAwNSAoTnpjdiBkYWlmICtQQU4gLVVBTyAtVENPIC1ESVQg
LVNTQlMgQlRZUEU9LS0pDQogcGMgOiBrZXJuZnNfZmluZF9hbmRfZ2V0X25zKzB4MmMvMHg4MA0K
IGxyIDogc3lzZnNfdW5tZXJnZV9ncm91cCsweDMwLzB4ODANCiBzcCA6IGZmZmY4MDAwMGI3OGIz
ZjANCiB4Mjk6IGZmZmY4MDAwMGI3OGIzZjAgeDI4OiBmZmZmMDAwMGY3OTcwOTEwIHgyNzogMDAw
MDAwMDAwMDAwMDAwMg0KIHgyNjogZmZmZjAwMDBmNzk3MDkwMCB4MjU6IGZmZmY4MDAwMGFiY2Ez
NTggeDI0OiBmZmZmODAwMDA5MzZjZmEwDQogeDIzOiBmZmZmODAwMDBhYzhmNDU4IHgyMjogMDAw
MDAwMDAwMDAwMDAwMCB4MjE6IGZmZmY4MDAwMDk0MzE5MzgNCiB4MjA6IGZmZmY4MDAwMDk0MzE4
MDAgeDE5OiAwMDAwMDAwMDAwMDAwMDAwIHgxODogMDAwMDAwMDAwMDAwMDAwMA0KIHgxNzogNDI1
NTUzMDAzMDJlNzI2NSB4MTY6IDY2NjY3NTYyNjU2ZDYxNzIgeDE1OiA0ZDAwNmQ3MjZmNjY3NDYx
DQogeDE0OiA2YzcwM2Q0ZDQ1NTQ1MzU5IHgxMzogNTk1MzQyNTU1MzAwMzAyZSB4MTI6IDcyNjU2
NjY2NzU2MjY1NmQNCiB4MTE6IDAwMzIzMTM3MzIzZDRkNTUgeDEwOiA0ZTUxNDU1MzAwNzI2NTY2
IHg5IDogZmZmZjgwMDAwODVmNzQwMA0KIHg4IDogZmZmZjAwMDBmNzk3MDk4MCB4NyA6IDAwMDAw
MDAwMDAwMDAwMDAgeDYgOiAwMDAwMDAwMDc3ZmZmZmZmDQogeDUgOiAwMDAwMDAwMDcwMDAwMDAw
IHg0IDogZmZmZjgwMDAwYjc4YjU0OCB4MyA6IGZmZmY4MDAwMDg4YjA0MjANCiB4MiA6IDAwMDAw
MDAwMDAwMDAwMDAgeDEgOiBmZmZmODAwMDA5NDMxOTM4IHgwIDogMDAwMDAwMDAwMDAwMDAwMA0K
IENhbGwgdHJhY2U6DQogIGtlcm5mc19maW5kX2FuZF9nZXRfbnMrMHgyYy8weDgwDQogIHN5c2Zz
X3VubWVyZ2VfZ3JvdXArMHgzMC8weDgwDQogIGRwbV9zeXNmc19yZW1vdmUrMHgzYy8weDE3Yw0K
ICBkZXZpY2VfZGVsKzB4YjAvMHgzYTANCiAgcGxhdGZvcm1fZGV2aWNlX2RlbC5wYXJ0LjArMHgy
NC8weGIwDQogIHBsYXRmb3JtX2RldmljZV91bnJlZ2lzdGVyKzB4MzAvMHg1MA0KICBzeXNmYl9k
aXNhYmxlKzB4NGMvMHg4MA0KICByZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKzB4NDAv
MHgxMDANCiAgcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnMrMHgxMjgvMHgyNDAN
CiAgZHJtX2FwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJzKzB4Yjgv
MHgxNzANCiAgdm13X3Byb2JlKzB4NTAvMHhkMzAgW3Ztd2dmeF0NCiAgbG9jYWxfcGNpX3Byb2Jl
KzB4NGMvMHhjMA0KICBwY2lfZGV2aWNlX3Byb2JlKzB4MWU4LzB4MjMwDQogIHJlYWxseV9wcm9i
ZSsweDE4Yy8weDNmMA0KICBfX2RyaXZlcl9wcm9iZV9kZXZpY2UrMHgxMjQvMHgxYzANCiAgZHJp
dmVyX3Byb2JlX2RldmljZSsweDQ0LzB4MTQwDQogIF9fZHJpdmVyX2F0dGFjaCsweGUwLzB4MjM0
DQogIGJ1c19mb3JfZWFjaF9kZXYrMHg3Yy8weGUwDQogIGRyaXZlcl9hdHRhY2grMHgzMC8weDQw
DQogIGJ1c19hZGRfZHJpdmVyKzB4MTU4LzB4MjUwDQogIGRyaXZlcl9yZWdpc3RlcisweDg0LzB4
MTQwDQogIF9fcGNpX3JlZ2lzdGVyX2RyaXZlcisweDUwLzB4NWMNCiAgdm13X3BjaV9kcml2ZXJf
aW5pdCsweDQ0LzB4MTAwMCBbdm13Z2Z4XQ0KICBkb19vbmVfaW5pdGNhbGwrMHg1MC8weDI1MA0K
ICBkb19pbml0X21vZHVsZSsweDUwLzB4MjYwDQogIGxvYWRfbW9kdWxlKzB4MjNlNC8weDI3YzAN
CiAgX19kb19zeXNfZmluaXRfbW9kdWxlKzB4YWMvMHgxMmMNCiAgX19hcm02NF9zeXNfZmluaXRf
bW9kdWxlKzB4MmMvMHg0MA0KICBpbnZva2Vfc3lzY2FsbCsweDc4LzB4MTAwDQogIGVsMF9zdmNf
Y29tbW9uLmNvbnN0cHJvcC4wKzB4NTQvMHgxODQNCiAgZG9fZWwwX3N2YysweDM0LzB4OWMNCiAg
ZWwwX3N2YysweDU0LzB4MWUwDQogIGVsMHRfNjRfc3luY19oYW5kbGVyKzB4YTQvMHgxMzANCiAg
ZWwwdF82NF9zeW5jKzB4MWEwLzB4MWE0DQogQ29kZTogYWEwMDAzZjMgYTkwMjViZjUgYWEwMTAz
ZjUgYWEwMjAzZjYgKGY5NDAwNDAwKQ0KIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAg
XS0tLQ0K
