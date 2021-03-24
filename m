Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C0A34760A
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Mar 2021 11:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235752AbhCXKZi (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Mar 2021 06:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235603AbhCXKZN (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Mar 2021 06:25:13 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7CD8CC061763;
        Wed, 24 Mar 2021 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
        In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID; bh=CQxzGixpgbWGArS2H8DTMl+TRREKp6I+YVDe
        syqE3EM=; b=Wcr4A4xAIyyTen5OhWFOBjLQaAQx+rwlv239WGFHbjM+WaUqJ9Vo
        ZwnSsQMWs1PZ56AI1zzJlIUWUV5rq70ABrzL/ul4dj2Csa20ItYyvowMXNIoDrzj
        UOQ9ckO6RJGp4lhZJTXxKtJjkmK36Yz/3KcSSFHkJAKhjKj/VNrScB4=
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Wed, 24 Mar
 2021 18:24:48 +0800 (GMT+08:00)
X-Originating-IP: [202.38.69.14]
Date:   Wed, 24 Mar 2021 18:24:48 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   lyl2019@mail.ustc.edu.cn
To:     "Michael Kelley" <mikelley@microsoft.com>
Cc:     "KY Srinivasan" <kys@microsoft.com>,
        "Haiyang Zhang" <haiyangz@microsoft.com>,
        "Stephen Hemminger" <sthemmin@microsoft.com>,
        "wei.liu@kernel.org" <wei.liu@kernel.org>,
        "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: RE: [PATCH] video/fbdev: Fix a double free in hvfb_probe
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20190610(cb3344cf) Copyright (c) 2002-2021 www.mailtech.cn ustc-xl
In-Reply-To: <MWHPR21MB1593E96D24957865DB46D3DBD7649@MWHPR21MB1593.namprd21.prod.outlook.com>
References: <20210323073350.17697-1-lyl2019@mail.ustc.edu.cn>
 <MWHPR21MB1593E96D24957865DB46D3DBD7649@MWHPR21MB1593.namprd21.prod.outlook.com>
X-SendMailWithSms: false
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5c22e0b9.10ae8.17863c3eddb.Coremail.lyl2019@mail.ustc.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LkAmygBnbkpwE1tgAq8yAA--.0W
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/1tbiAQoKBlQhn5ZS1wACs8
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

DQoNCg0KPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tDQo+IOWPkeS7tuS6ujogIk1pY2hhZWwgS2Vs
bGV5IiA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT4NCj4g5Y+R6YCB5pe26Ze0OiAyMDIxLTAzLTI0
IDAyOjUyOjA3ICjmmJ/mnJ/kuIkpDQo+IOaUtuS7tuS6ujogIkx2IFl1bmxvbmciIDxseWwyMDE5
QG1haWwudXN0Yy5lZHUuY24+LCAiS1kgU3Jpbml2YXNhbiIgPGt5c0BtaWNyb3NvZnQuY29tPiwg
IkhhaXlhbmcgWmhhbmciIDxoYWl5YW5nekBtaWNyb3NvZnQuY29tPiwgIlN0ZXBoZW4gSGVtbWlu
Z2VyIiA8c3RoZW1taW5AbWljcm9zb2Z0LmNvbT4sICJ3ZWkubGl1QGtlcm5lbC5vcmciIDx3ZWku
bGl1QGtlcm5lbC5vcmc+DQo+IOaKhOmAgTogImxpbnV4LWh5cGVydkB2Z2VyLmtlcm5lbC5vcmci
IDxsaW51eC1oeXBlcnZAdmdlci5rZXJuZWwub3JnPiwgImRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmciIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiwgImxpbnV4LWZiZGV2
QHZnZXIua2VybmVsLm9yZyIgPGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZz4sICJsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4NCj4g
5Li76aKYOiBSRTogW1BBVENIXSB2aWRlby9mYmRldjogRml4IGEgZG91YmxlIGZyZWUgaW4gaHZm
Yl9wcm9iZQ0KPiANCj4gRnJvbTogTHYgWXVubG9uZyA8bHlsMjAxOUBtYWlsLnVzdGMuZWR1LmNu
PiBTZW50OiBUdWVzZGF5LCBNYXJjaCAyMywgMjAyMSAxMjozNCBBTQ0KPiA+IA0KPiA+IEluIGZ1
bmN0aW9uIGh2ZmJfcHJvYmUgaW4gaHlwZXJ2X2ZiLmMsIGl0IGNhbGxzIGh2ZmJfZ2V0bWVtKGhk
ZXYsIGluZm8pDQo+ID4gYW5kIHJldHVybiBlcnIgd2hlbiBpbmZvLT5hcGVydHVyZXMgaXMgZnJl
ZWQuDQo+ID4gDQo+ID4gSW4gdGhlIGVycm9yMSBsYWJlbCBvZiBodmZiX3Byb2JlLCBpbmZvLT5h
cGVydHVyZXMgd2lsbCBiZSBmcmVlZCB0d2ljZQ0KPiA+IGJ5IGZyYW1lYnVmZmVyX3JlbGVhc2Uo
aW5mbykuDQo+ID4gDQo+ID4gTXkgcGF0Y2ggc2V0cyBpbmZvLT5hcGVydHVyZXMgdG8gTlVMTCBh
ZnRlciBpdCB3YXMgZnJlZWQgdG8gYXZvaWQNCj4gPiBkb3VibGUgZnJlZS4NCj4gPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBMdiBZdW5sb25nIDxseWwyMDE5QG1haWwudXN0Yy5lZHUuY24+DQo+ID4g
LS0tDQo+ID4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmMgfCAzICsrKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVy
dl9mYi5jDQo+ID4gaW5kZXggYzhiMGFlNjc2ODA5Li4yZmM5YjUwN2U3M2EgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9oeXBlcnZfZmIuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmMNCj4gPiBAQCAtMTAzMiw2ICsxMDMyLDcgQEAgc3RhdGlj
IGludCBodmZiX2dldG1lbShzdHJ1Y3QgaHZfZGV2aWNlICpoZGV2LCBzdHJ1Y3QgZmJfaW5mbw0K
PiA+ICppbmZvKQ0KPiA+ICAJCWlmICghcGRldikgew0KPiA+ICAJCQlwcl9lcnIoIlVuYWJsZSB0
byBmaW5kIFBDSSBIeXBlci1WIHZpZGVvXG4iKTsNCj4gPiAgCQkJa2ZyZWUoaW5mby0+YXBlcnR1
cmVzKTsNCj4gPiArCQkJaW5mby0+YXBlcnR1cmVzID0gTlVMTDsNCj4gPiAgCQkJcmV0dXJuIC1F
Tk9ERVY7DQo+ID4gIAkJfQ0KPiA+IA0KPiA+IEBAIC0xMTMwLDYgKzExMzEsNyBAQCBzdGF0aWMg
aW50IGh2ZmJfZ2V0bWVtKHN0cnVjdCBodl9kZXZpY2UgKmhkZXYsIHN0cnVjdCBmYl9pbmZvDQo+
ID4gKmluZm8pDQo+ID4gIAkJcGNpX2Rldl9wdXQocGRldik7DQo+ID4gIAl9DQo+ID4gIAlrZnJl
ZShpbmZvLT5hcGVydHVyZXMpOw0KPiA+ICsJaW5mby0+YXBlcnR1cmVzID0gTlVMTDsNCj4gPiAN
Cj4gPiAgCXJldHVybiAwOw0KPiA+IA0KPiA+IEBAIC0xMTQyLDYgKzExNDQsNyBAQCBzdGF0aWMg
aW50IGh2ZmJfZ2V0bWVtKHN0cnVjdCBodl9kZXZpY2UgKmhkZXYsIHN0cnVjdCBmYl9pbmZvDQo+
ID4gKmluZm8pDQo+ID4gIAlpZiAoIWdlbjJ2bSkNCj4gPiAgCQlwY2lfZGV2X3B1dChwZGV2KTsN
Cj4gPiAgCWtmcmVlKGluZm8tPmFwZXJ0dXJlcyk7DQo+ID4gKwlpbmZvLT5hcGVydHVyZXMgPSBO
VUxMOw0KPiA+IA0KPiA+ICAJcmV0dXJuIC1FTk9NRU07DQo+ID4gIH0NCj4gPiAtLQ0KPiA+IDIu
MjUuMQ0KPiA+IA0KPiANCj4gV2hpbGUgSSB0aGluayB0aGlzIHdvcmtzLCBhIHNsaWdodGx5IGJl
dHRlciBzb2x1dGlvbiBtaWdodCBiZSB0byByZW1vdmUNCj4gYWxsIGNhbGxzIHRvIGtmcmVlKGlu
Zm8tPmFwZXJ0dXJlcykgaW4gaHZmYl9nZXRtZW0oKSwgIGFuZCBqdXN0IGxldA0KPiBmcmFtZWJ1
ZmZlcl9yZWxlYXNlKCkgaGFuZGxlIGZyZWVpbmcgdGhlIG1lbW9yeS4gIFRoYXQncyB3aGF0IGlz
DQo+IGRvbmUgaW4gb3RoZXIgZHJpdmVycyB0aGF0IGZvbGxvdyB0aGUgZmJkZXYgcGF0dGVybiwg
YW5kIGl0J3MgbGVzcw0KPiBjb2RlIG92ZXJhbGwuICANCj4gDQo+IE1pY2hhZWwNCg0KT2ssIGkg
YWdyZWUgd2l0aCB5b3UuIFJlbW92ZSBhbGwgY2FsbHMgdG8ga2ZyZWUoaW5mby0+YXBlcnR1cmVz
KQ0KaW4gaHZmYl9nZXRtZW0oKSBpcyBhIGJldHRlciBzb2x1dGlvbi4NCg0KSSB3aWxsIHN1Ymlt
dCBhIFBBVENIIHYyIGZvciB5b3UgdG8gcmV2aWV3LiBUaGFua3MuDQo=
