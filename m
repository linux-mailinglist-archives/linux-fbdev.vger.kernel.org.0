Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 189AD6A2B39
	for <lists+linux-fbdev@lfdr.de>; Sat, 25 Feb 2023 19:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjBYSKW (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 25 Feb 2023 13:10:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjBYSKV (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 25 Feb 2023 13:10:21 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF06815572;
        Sat, 25 Feb 2023 10:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1677348610; i=deller@gmx.de;
        bh=8AQPQfQvL5G8QfEl/0wQoBLSYF1PPBCUMr84ExrRXjc=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=Rs/zwFqTIQpeJW/174ocjrPK5VhCZbFVtO8gueyaCq23vwb0qqjCJZ5g7nGeY6PLf
         vSKuKmBJ2jgtMAPJ53vJ5qs38sf6tTXcrdFC38NbiH/7lzWiJ8MwdKbObCIG8a+fsJ
         19Hx2xW4ozPokmsW35ewlZeP+Eyj/F01JUbxOxiR6iDzdfUy7LCyWKo3USKpo4RZC3
         x0YtZVNyDNIgPn9JQ3PjDf0mzovBKtjzXIJQnWuA8kfeXQLS1IEDSZl+SWCsFmI9l9
         /ToTw5wgdsNtsWmc+CmBvOm30Ag5KpECGn78rRBhxBJr2eCGy7hKtirIH9IZJHd2AI
         3C+tFbY17eZQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.139.251]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTABT-1p49xF1WSl-00UXkG; Sat, 25
 Feb 2023 19:10:10 +0100
Message-ID: <97334439-5332-69e5-b36e-9f89e7b511bb@gmx.de>
Date:   Sat, 25 Feb 2023 19:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] fbdev: omapfb: cleanup inconsistent indentation
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     Lucy Mielke <mielkesteven@icloud.com>, linux-fbdev@vger.kernel.org,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, arnd@arndb.de
References: <20230207100630.11644-1-mielkesteven@icloud.com>
 <eb6900d5-148f-85cb-eebc-c20d99802c75@gmx.de>
In-Reply-To: <eb6900d5-148f-85cb-eebc-c20d99802c75@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:55AUYxC/gCo9Z8HrgVELUyMNGoIXLiZZlRJWj+20rZxhkk6T3Vy
 8HigZ+zPDnF9ioyGxjtIzeeQ1kaqk2XGJDvgfNafCbWLH9AkwCfvjrs2GIMEEerU7xoYjae
 IATZnpbu77a4L6T3AflJqvA4mEGOWfLu1ejKty/Dc2YqklVqZy7zsrnSV5e2sWoiddXMOR0
 A4St7WcsBA8JCXpHWkTVQ==
UI-OutboundReport: notjunk:1;M01:P0:0D5CXkyzZSk=;QUZ8EkUZsyoD7rl9N5P+yZOd/7A
 JgWK4OznnIPj3jcQiuvnhmtaEerOFX8FYyUo4MXhTQwZne4dCMAIoJYnLsEF/WFQ/vGATEnPf
 FKUZvsdw/xWSbkr3TbPFyeLY88qbNOrJNUF6RLiUWcKpGG8vRSZps+JWaeTCt45L1eXXidoF5
 gEIs6LXgfjAuwp/PjL610LL1RCU7V9YYvPEZmVXFpMbOCov+6LjuCi1QECxjwTL7AYvXqWD4i
 AQVsznofSvcU1/UIhN2+WBd6benFGrRFrF09ukYl60mNnpnOXVkrdP0BtX2Hj5lejMU7p+4dc
 2aHnntlKqi+ssyc8XylAgrOHltrdIo4roKS2SEC2uuGKDjKZCr4gY9KwYoulgF1HEdN3UyxMi
 6wH1m0oLPuweNjOKDyH/7B/UUh95PKIQ0X4YRM8+UIKSGdrYXHDd+irkkEZTEWjb5lmL8+5Yq
 UhJX2EI1NOkZ8z+FFnHeSB1BThQjgzVaHm+L6BOqJZwtv8DY6u8uxXOfZVfi0Xgds1GBfRwiB
 VWN98lw9MhFsPNKq0zV4oG4ZKp6YWzLP4UAVq9YVAdORhhmeQ7AKv4imia2g1jOuFkp7uO/L4
 k2et98kMrtVRubu6KJWF1tCz1LaMqSF4vzfUOoh+A5VP4Z5CN1Cic7ynbf3rSxYN8sazgCUNX
 cwsiHHzyshPTtwIsF5c7o5W3zL7H1HF0kutdcpqiA/9OkEuqO6y5IcZDCmjb3zFjLUI7YQh8D
 Q3hfEwEhbIGebNEMLhwwe0qGAViSUo2l3u5wNbpRnXWyhRUfsa+lPxS0+2aIBB3JGhSeriZsA
 VGEcAuPrwIFNLDP1OT05F/H3U7ZnkDUcbUl/fKd5o7yGAOqkmAOaPl9hCm8T2umGq9dM08/x9
 v3nxVPIqfVRzcMGpKHaUhVVN8LWJZuY/fTJHrR+m4iU08Lp5n/94/x7aJ0HRgtqGQtumy9wTd
 PvQ/hZ/NRH7rrnulQvPTb+dv3SU=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

SGkgTHVjeSwNCg0KdGhlcmUgd2VyZSBzb21lIG1vcmUgdGhpbmdzIHdyb25nIGluIHlvdXIgcGF0
Y2g6DQoNCk9uIDIvMjUvMjMgMTg6MjMsIEhlbGdlIERlbGxlciB3cm90ZToNCj4gT24gMi83LzIz
IDExOjA2LCBMdWN5IE1pZWxrZSB3cm90ZToNCj4+IFRoaXMgY2xlYW5zIHVwIHRoZSBpbmRlbnRh
dGlvbiBhY2NvcmRpbmcgdG8gdGhlIExpbnV4IGtlcm5lbCBjb2RpbmcNCj4+IHN0eWxlLCBhbmQg
c2hvdWxkIGZpeCB0aGUgd2FybmluZyBjcmVhdGVkIGJ5IHRoZSBrZXJuZWwgdGVzdCByb2JvdC4N
Cj4+DQo+PiBGaXhlczogOGIwOGNmMmI2NGY1YTYwNTk0YjA3Nzk1YjJhZDUxOGM2ZDA0NDU2NiAo
Ik9NQVA6IGFkZCBUSSBPTUFQwqBmcmFtZWJ1ZmZlciBkcml2ZXIiKQ0KDQpQbGVhc2UgdXNlIG9u
bHkgMTIgY2hhcnMgb2YgdGhlIHNoYTEgaW4gdGhlIEZpeGVzIHRhZy4NCg0KPj4gUmVwb3J0ZWQt
Ynk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTog
THVjeSBNaWVsa2UgPG1pZWxrZXN0ZXZlbkBpY2xvdWQuY29tPg0KPj4gLS0tDQo+PiDCoCBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L29tYXAvb21hcGZiX21haW4uYyB8IDMyICsrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTMgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcC9v
bWFwZmJfbWFpbi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmMNCj4+
IGluZGV4IDFmM2RmMjA1NWZmMC4uNGI2NzNkYWEzMmNiIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmMNCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvb21hcC9vbWFwZmJfbWFpbi5jDQo+PiBAQCAtNzgsNyArNzgsNyBAQCBzdGF0aWMgc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSBvbWFwZHNzX2RldmljZSA9IHsNCj4+IMKgwqDCoMKgwqAgLm5h
bWXCoMKgwqDCoMKgwqDCoCA9ICJvbWFwZHNzX2RzcyIsDQo+PiDCoMKgwqDCoMKgIC5pZMKgwqDC
oMKgwqDCoMKgID0gLTEsDQo+PiDCoMKgwqDCoMKgIC5kZXbCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ID0gew0KPj4gLcKgwqDCoMKgwqDCoMKgIC5yZWxlYXNlID0gb21hcGRzc19yZWxlYXNlLA0KPj4g
K8KgwqDCoCAucmVsZWFzZcKgwqDCoCA9IG9tYXBkc3NfcmVsZWFzZSw+wqDCoMKgwqDCoMKgIH0s
DQo+IA0KPiBUaGlzIGlzIHdyb25nLiAicmVsZWFzZSIgYmVsb25ncyBpbnNpZGUgdGhlIC5kZXYN
Cj4gdmFyaWFibGUsIHNvIHRoZSBwcmV2aW91cyBpbmRlbnRpbmcgaXMgY29ycmVjdC4NCj4gDQo+
IFRoZSBjaGFuZ2VzIGJlbG93IHNlZW0gY29ycmVjdC4NCj4gDQo+IEhlbGdlDQo+IA0KPj4gwqAg
fTsNCj4+DQo+PiBAQCAtNTQ0LDE5ICs1NDQsMjUgQEAgc3RhdGljIGludCBzZXRfZmJfdmFyKHN0
cnVjdCBmYl9pbmZvICpmYmksDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdmFyLT55b2Zmc2V0ID0g
dmFyLT55cmVzX3ZpcnR1YWwgLSB2YXItPnlyZXM7DQo+Pg0KPj4gwqDCoMKgwqDCoCBpZiAocGxh
bmUtPmNvbG9yX21vZGUgPT0gT01BUEZCX0NPTE9SX1JHQjQ0NCkgew0KPj4gLcKgwqDCoMKgwqDC
oMKgIHZhci0+cmVkLm9mZnNldMKgwqDCoMKgwqAgPSA4OyB2YXItPnJlZC5sZW5ndGjCoMKgwqDC
oCA9IDQ7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB2YXItPnJlZC5tc2JfcmlnaHTCoMKgID0gMDsNCj4+IC3CoMKgwqDCoMKgwqDCoCB2YXItPmdy
ZWVuLm9mZnNldCA9IDQ7IHZhci0+Z3JlZW4ubGVuZ3RoID0gNDsNCj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhci0+Z3JlZW4ubXNiX3JpZ2h0ID0g
MDsNCj4+IC3CoMKgwqDCoMKgwqDCoCB2YXItPmJsdWUub2Zmc2V0wqAgPSAwOyB2YXItPmJsdWUu
bGVuZ3RowqAgPSA0Ow0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdmFyLT5ibHVlLm1zYl9yaWdodMKgID0gMDsNCj4+ICvCoMKgwqDCoMKgwqDCoCB2
YXItPnJlZC5vZmZzZXTCoMKgwqDCoMKgwqDCoCA9IDg7DQo+PiArwqDCoMKgwqDCoMKgwqAgdmFy
LT5yZWQubGVuZ3RowqDCoMKgwqDCoMKgwqAgPSA0Ow0KDQpBdCB2YXJpb3VzIG9mIHRob3NlIGxp
bmVzIHlvdSBoYXZlIHRyYWlsaW5nIHdoaXRlc3BhY2VzLg0KDQoNCkkgZml4ZWQgdXAgdGhvc2Ug
aXNzdWVzLCBkcm9wcGVkIHRoZSBmaXJzdCBwYXJ0IG9mIHlvdXIgcGF0Y2gNCmFuZCBhZGRlZCBp
dCB0byB0aGUgZmJkZXYgdHJlZS4NCg0KSGVsZ2UNCg0KDQo+PiArwqDCoMKgwqDCoMKgwqAgdmFy
LT5yZWQubXNiX3JpZ2h0wqDCoMKgID0gMDsNCj4+ICvCoMKgwqDCoMKgwqDCoCB2YXItPmdyZWVu
Lm9mZnNldMKgwqDCoCA9IDQ7DQo+PiArwqDCoMKgwqDCoMKgwqAgdmFyLT5ncmVlbi5sZW5ndGjC
oMKgwqAgPSA0Ow0KPj4gK8KgwqDCoMKgwqDCoMKgIHZhci0+Z3JlZW4ubXNiX3JpZ2h0wqDCoMKg
ID0gMDsNCj4+ICvCoMKgwqDCoMKgwqDCoCB2YXItPmJsdWUub2Zmc2V0wqDCoMKgID0gMDsNCj4+
ICvCoMKgwqDCoMKgwqDCoCB2YXItPmJsdWUubGVuZ3RowqDCoMKgID0gNDsNCj4+ICvCoMKgwqDC
oMKgwqDCoCB2YXItPmJsdWUubXNiX3JpZ2h0wqDCoMKgID0gMDsNCj4+IMKgwqDCoMKgwqAgfSBl
bHNlIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCB2YXItPnJlZC5vZmZzZXTCoMKgwqDCoCA9IDExOyB2
YXItPnJlZC5sZW5ndGjCoMKgwqDCoCA9IDU7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YXItPnJlZC5tc2JfcmlnaHTCoMKgID0gMDsNCj4+IC3C
oMKgwqDCoMKgwqDCoCB2YXItPmdyZWVuLm9mZnNldCA9IDU7wqAgdmFyLT5ncmVlbi5sZW5ndGgg
PSA2Ow0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dmFyLT5ncmVlbi5tc2JfcmlnaHQgPSAwOw0KPj4gLcKgwqDCoMKgwqDCoMKgIHZhci0+Ymx1ZS5v
ZmZzZXQgPSAwO8KgIHZhci0+Ymx1ZS5sZW5ndGjCoCA9IDU7DQo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YXItPmJsdWUubXNiX3JpZ2h0wqAgPSAw
Ow0KPj4gK8KgwqDCoMKgwqDCoMKgIHZhci0+cmVkLm9mZnNldMKgwqDCoMKgwqDCoMKgID0gMTE7
DQo+PiArwqDCoMKgwqDCoMKgwqAgdmFyLT5yZWQubGVuZ3RowqDCoMKgwqDCoMKgwqAgPSA1Ow0K
Pj4gK8KgwqDCoMKgwqDCoMKgIHZhci0+cmVkLm1zYl9yaWdodMKgwqDCoCA9IDA7DQo+PiArwqDC
oMKgwqDCoMKgwqAgdmFyLT5ncmVlbi5vZmZzZXTCoMKgwqAgPSA1Ow0KPj4gK8KgwqDCoMKgwqDC
oMKgIHZhci0+Z3JlZW4ubGVuZ3RowqDCoMKgID0gNjsNCj4+ICvCoMKgwqDCoMKgwqDCoCB2YXIt
PmdyZWVuLm1zYl9yaWdodMKgwqDCoCA9IDA7DQo+PiArwqDCoMKgwqDCoMKgwqAgdmFyLT5ibHVl
Lm9mZnNldMKgwqDCoCA9IDA7DQo+PiArwqDCoMKgwqDCoMKgwqAgdmFyLT5ibHVlLmxlbmd0aMKg
wqDCoCA9IDU7DQo+PiArwqDCoMKgwqDCoMKgwqAgdmFyLT5ibHVlLm1zYl9yaWdodMKgwqDCoCA9
IDA7DQo+PiDCoMKgwqDCoMKgIH0NCj4+DQo+PiDCoMKgwqDCoMKgIHZhci0+aGVpZ2h0wqDCoMKg
wqDCoMKgwqAgPSAtMTsNCj4gDQoNCg==
