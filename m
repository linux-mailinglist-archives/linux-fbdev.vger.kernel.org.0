Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771005EDBC4
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Sep 2022 13:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbiI1LaI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 28 Sep 2022 07:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbiI1LaF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 28 Sep 2022 07:30:05 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E35026C4
        for <linux-fbdev@vger.kernel.org>; Wed, 28 Sep 2022 04:30:03 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0593021E87;
        Wed, 28 Sep 2022 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1664364602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ayvMD9up8Ep08QfYACN4jFRMKjXiM4M9B5sySzaFaIU=;
        b=erD3GNfeSH/MJAdIKuyYIg8CmBx9fTjRwEAXbzIJUF1q2oONJw67K3kgHeo7j7+UG1GU12
        XYWle78U5sPFa5R2yY3bf4Kl5C9nFYfXwLzbUjdKpbk6+oySXt21IuOXqOYqZUIbeof3EP
        A+wGHYtt7J1zfi0hWF2yPZuCErUMhqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1664364602;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ayvMD9up8Ep08QfYACN4jFRMKjXiM4M9B5sySzaFaIU=;
        b=ijfAGKSyVzu0+lALUmkeNg/onT5XjZp6Lb2zj2FLFvwzIUUIjOBPwxIlok6MGxj/8NIyI3
        kTJG1o512qeBLYCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA8BD13677;
        Wed, 28 Sep 2022 11:30:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id R3EUKDkwNGMRJQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 28 Sep 2022 11:30:01 +0000
Message-ID: <a1354fef-f03b-2b43-cf2e-a50dee28bf59@suse.de>
Date:   Wed, 28 Sep 2022 13:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
To:     =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
Cc:     javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
        deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk,
        linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <20220928111231.GO28810@kitsune.suse.cz>
Content-Language: en-US
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220928111231.GO28810@kitsune.suse.cz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZB9WIPJXlHulGrPV3engfOdt"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZB9WIPJXlHulGrPV3engfOdt
Content-Type: multipart/mixed; boundary="------------zrVeAn3BvchnrFFPnF0eg9Dd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
Cc: javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
 maxime@cerno.tech, sam@ravnborg.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, geert@linux-m68k.org,
 mark.cave-ayland@ilande.co.uk, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Message-ID: <a1354fef-f03b-2b43-cf2e-a50dee28bf59@suse.de>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <20220928111231.GO28810@kitsune.suse.cz>
In-Reply-To: <20220928111231.GO28810@kitsune.suse.cz>

--------------zrVeAn3BvchnrFFPnF0eg9Dd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDkuMjIgdW0gMTM6MTIgc2NocmllYiBNaWNoYWwgU3VjaMOhbmVrOg0K
PiBIZWxsbywNCj4gDQo+IE9uIFdlZCwgU2VwIDI4LCAyMDIyIGF0IDEyOjUwOjEwUE0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gQWxsIERSTSBmb3JtYXRzIGFzc3Vt
ZSBsaXR0bGUtZW5kaWFuIGJ5dGUgb3JkZXIuIE9uIGJpZy1lbmRpYW4gc3lzdGVtcywNCj4+
IGl0IGlzIGxpa2VseSB0aGF0IHRoZSBzY2Fub3V0IGJ1ZmZlciBpcyBpbiBiaWcgZW5kaWFu
IGFzIHdlbGwuIFVwZGF0ZQ0KPj4gdGhlIGZvcm1hdCBhY2NvcmRpbmdseSBhbmQgYWRkIGVu
ZGlhbmVzcyBjb252ZXJzaW9uIHRvIHRoZSBmb3JtYXQtaGVscGVyDQo+PiBsaWJyYXJ5LiBB
bHNvIG9wdC1pbiB0byBhbGxvY2F0ZWQgYnVmZmVycyBpbiBob3N0IGZvcm1hdCBieSBkZWZh
dWx0Lg0KPiANCj4gVGhpcyBzb3VuZHMgYmFja3dhcmRzIHRvIG1lLg0KDQpJbiB3aGljaCB3
YXk/DQoNCj4gDQo+IFNraW1taW5nIHRocm91Z2ggdGhlIGNvZGUgaXQgc291bmRzIGxpa2Ug
dGhlIGJ1ZmZlciBpcyBpbiBmYWN0IGluIHRoZQ0KPiBzYW1lIGZvcm1hdCBhbGwgdGhlIHRp
bWUgYnV0IHdoZW4gdGhlIENQVSBpcyBzd2l0Y2hlZCB0byBCRSBpdCBzZWVzIHRoZQ0KPiBk
YXRhIGxvYWRlZCBmcm9tIGl0IGRpZmZlcmVudGx5Lg0KPiANCj4gT3IgYW0gSSBtaXNzaW5n
IHNvbWV0aGluZz8NCg0KV2hpY2ggYnVmZmVyIGRvIHlvdSBtZWFuPyBUaGUgc2Nhbm91dCBi
dWZmZXIgY29taW5nIGZyb20gdGhlIGZpcm13YXJlLCANCm9yIHRoZSBHRU0gQk9zIHRoYXQg
YXJlIGFsbG9jYXRlZCBieSByZW5kZXJlcnM/DQoNClRoZSBzY2Fub3V0IGJ1ZmZlciBpcyBl
aXRoZXIgaW4gQkUgb3IgTEUgZm9ybWF0LiBBY2NvcmRpbmcgdG8gdGhlIGNvZGUgDQppbiBv
ZmZiLCBpdCdzIHNpZ25hbGVkIGJ5IGEgbm9kZSBpbiB0aGUgZGV2aWNlIHRyZWUuIEkgdG9v
ayB0aGF0IGNvZGUgDQppbnRvIG9mZHJtIGFuZCBzZXQgdGhlIHNjYW5vdXQgZm9ybWF0IGFj
Y29yZGluZ2x5Lg0KDQpUaGUgR0VNIEJPIGNhbiBiZSBpbiBhbnkgZm9ybWF0LiBJZiBuZWNl
c3NhcnksIG9mZHJtIGNvbnZlcnRzIGludGVybmFsbHkgDQp3aGlsZSBjb3B5aW5nIGl0IHRv
IHRoZSBzY2Fub3V0IGJ1ZmZlci4gVGhlIHF1aXJrIHdlIG9wdCBpbiwgbWFrZXMgRFJNIA0K
cHJlZmVyIHdoYXRldmVyIGRlZmF1bHQgYnl0ZW9yZGVyIHRoZSBob3N0IHByZWZlcnMgKEJF
IG9yIExFKS4gQWNjb3JkaW5nIA0KdG8gdGhlIGRvY3MsIGl0J3MgdGhlIHJpZ2h0IHRoaW5n
IHRvIGRvLiBCdXQgdGhhdCBvbmx5IGFmZmVjdHMgdGhlIEdFTSANCmNvZGUsIG5vdCB0aGUg
c2Nhbm91dCBidWZmZXIuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFRoYW5r
cw0KPiANCj4gTWljaGFsDQo+IA0KPj4NCj4+IFN1Z2dlc3RlZC1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jIHwgMTAgKysrKysrDQo+PiAgIGRyaXZl
cnMvZ3B1L2RybS90aW55L29mZHJtLmMgICAgICAgIHwgNTUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2Zvcm1hdF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hlbHBlci5j
DQo+PiBpbmRleCA0YWZjNGFjMjczNDIuLmZjYTc5MzZkYjA4MyAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jDQo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPj4gQEAgLTY1OSw2ICs2NTksMTEgQEAg
aW50IGRybV9mYl9ibGl0KHN0cnVjdCBpb3N5c19tYXAgKmRzdCwgY29uc3QgdW5zaWduZWQg
aW50ICpkc3RfcGl0Y2gsIHVpbnQzMl90IGQNCj4+ICAgCQkJZHJtX2ZiX3hyZ2I4ODg4X3Rv
X3JnYjU2NShkc3QsIGRzdF9waXRjaCwgc3JjLCBmYiwgY2xpcCwgZmFsc2UpOw0KPj4gICAJ
CQlyZXR1cm4gMDsNCj4+ICAgCQl9DQo+PiArCX0gZWxzZSBpZiAoZHN0X2Zvcm1hdCA9PSAo
RFJNX0ZPUk1BVF9SR0I1NjUgfCBEUk1fRk9STUFUX0JJR19FTkRJQU4pKSB7DQo+PiArCQlp
ZiAoZmJfZm9ybWF0ID09IERSTV9GT1JNQVRfUkdCNTY1KSB7DQo+PiArCQkJZHJtX2ZiX3N3
YWIoZHN0LCBkc3RfcGl0Y2gsIHNyYywgZmIsIGNsaXAsIGZhbHNlKTsNCj4+ICsJCQlyZXR1
cm4gMDsNCj4+ICsJCX0NCj4+ICAgCX0gZWxzZSBpZiAoZHN0X2Zvcm1hdCA9PSBEUk1fRk9S
TUFUX1JHQjg4OCkgew0KPj4gICAJCWlmIChmYl9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9YUkdC
ODg4OCkgew0KPj4gICAJCQlkcm1fZmJfeHJnYjg4ODhfdG9fcmdiODg4KGRzdCwgZHN0X3Bp
dGNoLCBzcmMsIGZiLCBjbGlwKTsNCj4+IEBAIC02NzcsNiArNjgyLDExIEBAIGludCBkcm1f
ZmJfYmxpdChzdHJ1Y3QgaW9zeXNfbWFwICpkc3QsIGNvbnN0IHVuc2lnbmVkIGludCAqZHN0
X3BpdGNoLCB1aW50MzJfdCBkDQo+PiAgIAkJCWRybV9mYl94cmdiODg4OF90b194cmdiMjEw
MTAxMChkc3QsIGRzdF9waXRjaCwgc3JjLCBmYiwgY2xpcCk7DQo+PiAgIAkJCXJldHVybiAw
Ow0KPj4gICAJCX0NCj4+ICsJfSBlbHNlIGlmIChkc3RfZm9ybWF0ID09IERSTV9GT1JNQVRf
QkdSWDg4ODgpIHsNCj4+ICsJCWlmIChmYl9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9YUkdCODg4
OCkgew0KPj4gKwkJCWRybV9mYl9zd2FiKGRzdCwgZHN0X3BpdGNoLCBzcmMsIGZiLCBjbGlw
LCBmYWxzZSk7DQo+PiArCQkJcmV0dXJuIDA7DQo+PiArCQl9DQo+PiAgIAl9DQo+PiAgIA0K
Pj4gICAJZHJtX3dhcm5fb25jZShmYi0+ZGV2LCAiTm8gY29udmVyc2lvbiBoZWxwZXIgZnJv
bSAlcDRjYyB0byAlcDRjYyBmb3VuZC5cbiIsDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3Rpbnkvb2Zkcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmMNCj4+
IGluZGV4IDBiZjVlZWJmNjY3OC4uNmUxMDBhN2Y1ZGI3IDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3Rpbnkvb2Zkcm0uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rp
bnkvb2Zkcm0uYw0KPj4gQEAgLTk0LDcgKzk0LDcgQEAgc3RhdGljIGludCBkaXNwbGF5X2dl
dF92YWxpZGF0ZWRfaW50MChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBjb25zdCBjaGFyICpu
YW1lLA0KPj4gICB9DQo+PiAgIA0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9mb3Jt
YXRfaW5mbyAqZGlzcGxheV9nZXRfdmFsaWRhdGVkX2Zvcm1hdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LA0KPj4gLQkJCQkJCQkJICB1MzIgZGVwdGgpDQo+PiArCQkJCQkJCQkgIHUzMiBk
ZXB0aCwgYm9vbCBiaWdfZW5kaWFuKQ0KPj4gICB7DQo+PiAgIAljb25zdCBzdHJ1Y3QgZHJt
X2Zvcm1hdF9pbmZvICppbmZvOw0KPj4gICAJdTMyIGZvcm1hdDsNCj4+IEBAIC0xMTUsNiAr
MTE1LDI5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpkaXNwbGF5
X2dldF92YWxpZGF0ZWRfZm9ybWF0KHN0cnVjdCBkcm1fZGV2DQo+PiAgIAkJcmV0dXJuIEVS
Ul9QVFIoLUVJTlZBTCk7DQo+PiAgIAl9DQo+PiAgIA0KPj4gKwkvKg0KPj4gKwkgKiBEUk0g
Zm9ybWF0cyBhc3N1bWUgbGl0dGxlLWVuZGlhbiBieXRlIG9yZGVyLiBVcGRhdGUgdGhlIGZv
cm1hdA0KPj4gKwkgKiBpZiB0aGUgc2Nhbm91dCBidWZmZXIgdXNlcyBiaWctZW5kaWFuIG9y
ZGVyaW5nLg0KPj4gKwkgKi8NCj4+ICsJaWYgKGJpZ19lbmRpYW4pIHsNCj4+ICsJCXN3aXRj
aCAoZm9ybWF0KSB7DQo+PiArCQljYXNlIERSTV9GT1JNQVRfWFJHQjg4ODg6DQo+PiArCQkJ
Zm9ybWF0ID0gRFJNX0ZPUk1BVF9CR1JYODg4ODsNCj4+ICsJCQlicmVhazsNCj4+ICsJCWNh
c2UgRFJNX0ZPUk1BVF9BUkdCODg4ODoNCj4+ICsJCQlmb3JtYXQgPSBEUk1fRk9STUFUX0JH
UkE4ODg4Ow0KPj4gKwkJCWJyZWFrOw0KPj4gKwkJY2FzZSBEUk1fRk9STUFUX1JHQjU2NToN
Cj4+ICsJCQlmb3JtYXQgPSBEUk1fRk9STUFUX1JHQjU2NSB8IERSTV9GT1JNQVRfQklHX0VO
RElBTjsNCj4+ICsJCQlicmVhazsNCj4+ICsJCWNhc2UgRFJNX0ZPUk1BVF9YUkdCMTU1NToN
Cj4+ICsJCQlmb3JtYXQgPSBEUk1fRk9STUFUX1hSR0IxNTU1IHwgRFJNX0ZPUk1BVF9CSUdf
RU5ESUFOOw0KPj4gKwkJCWJyZWFrOw0KPj4gKwkJZGVmYXVsdDoNCj4+ICsJCQlicmVhazsN
Cj4+ICsJCX0NCj4+ICsJfQ0KPj4gKw0KPj4gICAJaW5mbyA9IGRybV9mb3JtYXRfaW5mbyhm
b3JtYXQpOw0KPj4gICAJaWYgKCFpbmZvKSB7DQo+PiAgIAkJZHJtX2VycihkZXYsICJjYW5u
b3QgZmluZCBmcmFtZWJ1ZmZlciBmb3JtYXQgZm9yIGRlcHRoICV1XG4iLCBkZXB0aCk7DQo+
PiBAQCAtMTM0LDYgKzE1NywyMyBAQCBzdGF0aWMgaW50IGRpc3BsYXlfcmVhZF91MzJfb2Yo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpvZl9ubw0KPj4g
ICAJcmV0dXJuIHJldDsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgYm9vbCBkaXNwbGF5
X2dldF9iaWdfZW5kaWFuX29mKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqb2Zfbm9kZSkNCj4+ICt7DQo+PiArCWJvb2wgYmlnX2VuZGlhbjsNCj4+ICsN
Cj4+ICsjaWZkZWYgX19CSUdfRU5ESUFODQo+PiArCWJpZ19lbmRpYW4gPSB0cnVlOw0KPj4g
KwlpZiAob2ZfZ2V0X3Byb3BlcnR5KG9mX25vZGUsICJsaXR0bGUtZW5kaWFuIiwgTlVMTCkp
DQo+PiArCQliaWdfZW5kaWFuID0gZmFsc2U7DQo+PiArI2Vsc2UNCj4+ICsJYmlnX2VuZGlh
biA9IGZhbHNlOw0KPj4gKwlpZiAob2ZfZ2V0X3Byb3BlcnR5KG9mX25vZGUsICJiaWctZW5k
aWFuIiwgTlVMTCkpDQo+PiArCQliaWdfZW5kaWFuID0gdHJ1ZTsNCj4+ICsjZW5kaWYNCj4+
ICsNCj4+ICsJcmV0dXJuIGJpZ19lbmRpYW47DQo+PiArfQ0KPj4gKw0KPj4gICBzdGF0aWMg
aW50IGRpc3BsYXlfZ2V0X3dpZHRoX29mKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVj
dCBkZXZpY2Vfbm9kZSAqb2Zfbm9kZSkNCj4+ICAgew0KPj4gICAJdTMyIHdpZHRoOw0KPj4g
QEAgLTYxMyw2ICs2NTMsNyBAQCBzdGF0aWMgdm9pZCBvZmRybV9kZXZpY2Vfc2V0X2dhbW1h
X2xpbmVhcihzdHJ1Y3Qgb2Zkcm1fZGV2aWNlICpvZGV2LA0KPj4gICANCj4+ICAgCXN3aXRj
aCAoZm9ybWF0LT5mb3JtYXQpIHsNCj4+ICAgCWNhc2UgRFJNX0ZPUk1BVF9SR0I1NjU6DQo+
PiArCWNhc2UgRFJNX0ZPUk1BVF9SR0I1NjUgfCBEUk1fRk9STUFUX0JJR19FTkRJQU46DQo+
PiAgIAkJLyogVXNlIGJldHRlciBpbnRlcnBvbGF0aW9uLCB0byB0YWtlIDMyIHZhbHVlcyBm
cm9tIDAgdG8gMjU1ICovDQo+PiAgIAkJZm9yIChpID0gMDsgaSA8IE9GRFJNX0dBTU1BX0xV
VF9TSVpFIC8gODsgaSsrKSB7DQo+PiAgIAkJCXVuc2lnbmVkIGNoYXIgciA9IGkgKiA4ICsg
aSAvIDQ7DQo+PiBAQCAtNjMxLDYgKzY3Miw3IEBAIHN0YXRpYyB2b2lkIG9mZHJtX2Rldmlj
ZV9zZXRfZ2FtbWFfbGluZWFyKHN0cnVjdCBvZmRybV9kZXZpY2UgKm9kZXYsDQo+PiAgIAkJ
fQ0KPj4gICAJCWJyZWFrOw0KPj4gICAJY2FzZSBEUk1fRk9STUFUX1hSR0I4ODg4Og0KPj4g
KwljYXNlIERSTV9GT1JNQVRfQkdSWDg4ODg6DQo+PiAgIAkJZm9yIChpID0gMDsgaSA8IE9G
RFJNX0dBTU1BX0xVVF9TSVpFOyBpKyspDQo+PiAgIAkJCW9kZXYtPmZ1bmNzLT5jbWFwX3dy
aXRlKG9kZXYsIGksIGksIGksIGkpOw0KPj4gICAJCWJyZWFrOw0KPj4gQEAgLTY1MCw2ICs2
OTIsNyBAQCBzdGF0aWMgdm9pZCBvZmRybV9kZXZpY2Vfc2V0X2dhbW1hKHN0cnVjdCBvZmRy
bV9kZXZpY2UgKm9kZXYsDQo+PiAgIA0KPj4gICAJc3dpdGNoIChmb3JtYXQtPmZvcm1hdCkg
ew0KPj4gICAJY2FzZSBEUk1fRk9STUFUX1JHQjU2NToNCj4+ICsJY2FzZSBEUk1fRk9STUFU
X1JHQjU2NSB8IERSTV9GT1JNQVRfQklHX0VORElBTjoNCj4+ICAgCQkvKiBVc2UgYmV0dGVy
IGludGVycG9sYXRpb24sIHRvIHRha2UgMzIgdmFsdWVzIGZyb20gbHV0WzBdIHRvIGx1dFsy
NTVdICovDQo+PiAgIAkJZm9yIChpID0gMDsgaSA8IE9GRFJNX0dBTU1BX0xVVF9TSVpFIC8g
ODsgaSsrKSB7DQo+PiAgIAkJCXVuc2lnbmVkIGNoYXIgciA9IGx1dFtpICogOCArIGkgLyA0
XS5yZWQgPj4gODsNCj4+IEBAIC02NjgsNiArNzExLDcgQEAgc3RhdGljIHZvaWQgb2Zkcm1f
ZGV2aWNlX3NldF9nYW1tYShzdHJ1Y3Qgb2Zkcm1fZGV2aWNlICpvZGV2LA0KPj4gICAJCX0N
Cj4+ICAgCQlicmVhazsNCj4+ICAgCWNhc2UgRFJNX0ZPUk1BVF9YUkdCODg4ODoNCj4+ICsJ
Y2FzZSBEUk1fRk9STUFUX0JHUlg4ODg4Og0KPj4gICAJCWZvciAoaSA9IDA7IGkgPCBPRkRS
TV9HQU1NQV9MVVRfU0laRTsgaSsrKSB7DQo+PiAgIAkJCXVuc2lnbmVkIGNoYXIgciA9IGx1
dFtpXS5yZWQgPj4gODsNCj4+ICAgCQkJdW5zaWduZWQgY2hhciBnID0gbHV0W2ldLmdyZWVu
ID4+IDg7DQo+PiBAQCAtNzE4LDYgKzc2Miw5IEBAIHN0YXRpYyBjb25zdCB1aW50MzJfdCBv
ZmRybV9wcmltYXJ5X3BsYW5lX2Zvcm1hdHNbXSA9IHsNCj4+ICAgCURSTV9GT1JNQVRfUkdC
NTY1LA0KPj4gICAJLy9EUk1fRk9STUFUX1hSR0IxNTU1LA0KPj4gICAJLy9EUk1fRk9STUFU
X0M4LA0KPj4gKwkvKiBCaWctZW5kaWFuIGZvcm1hdHMgYmVsb3cgKi8NCj4+ICsJRFJNX0ZP
Uk1BVF9CR1JYODg4OCwNCj4+ICsJRFJNX0ZPUk1BVF9SR0I1NjUgfCBEUk1fRk9STUFUX0JJ
R19FTkRJQU4sDQo+PiAgIH07DQo+PiAgIA0KPj4gICBzdGF0aWMgY29uc3QgdWludDY0X3Qg
b2Zkcm1fcHJpbWFyeV9wbGFuZV9mb3JtYXRfbW9kaWZpZXJzW10gPSB7DQo+PiBAQCAtMTA0
OCw2ICsxMDk1LDcgQEAgc3RhdGljIHN0cnVjdCBvZmRybV9kZXZpY2UgKm9mZHJtX2Rldmlj
ZV9jcmVhdGUoc3RydWN0IGRybV9kcml2ZXIgKmRydiwNCj4+ICAgCXN0cnVjdCBvZmRybV9k
ZXZpY2UgKm9kZXY7DQo+PiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2Ow0KPj4gICAJZW51
bSBvZmRybV9tb2RlbCBtb2RlbDsNCj4+ICsJYm9vbCBiaWdfZW5kaWFuOw0KPj4gICAJaW50
IHdpZHRoLCBoZWlnaHQsIGRlcHRoLCBsaW5lYnl0ZXM7DQo+PiAgIAljb25zdCBzdHJ1Y3Qg
ZHJtX2Zvcm1hdF9pbmZvICpmb3JtYXQ7DQo+PiAgIAl1NjQgYWRkcmVzczsNCj4+IEBAIC0x
MTA5LDYgKzExNTcsOCBAQCBzdGF0aWMgc3RydWN0IG9mZHJtX2RldmljZSAqb2Zkcm1fZGV2
aWNlX2NyZWF0ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LA0KPj4gICAJCWJyZWFrOw0KPj4g
ICAJfQ0KPj4gICANCj4+ICsJYmlnX2VuZGlhbiA9IGRpc3BsYXlfZ2V0X2JpZ19lbmRpYW5f
b2YoZGV2LCBvZl9ub2RlKTsNCj4+ICsNCj4+ICAgCXdpZHRoID0gZGlzcGxheV9nZXRfd2lk
dGhfb2YoZGV2LCBvZl9ub2RlKTsNCj4+ICAgCWlmICh3aWR0aCA8IDApDQo+PiAgIAkJcmV0
dXJuIEVSUl9QVFIod2lkdGgpOw0KPj4gQEAgLTExMjIsNyArMTE3Miw3IEBAIHN0YXRpYyBz
dHJ1Y3Qgb2Zkcm1fZGV2aWNlICpvZmRybV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBkcm1fZHJp
dmVyICpkcnYsDQo+PiAgIAlpZiAobGluZWJ5dGVzIDwgMCkNCj4+ICAgCQlyZXR1cm4gRVJS
X1BUUihsaW5lYnl0ZXMpOw0KPj4gICANCj4+IC0JZm9ybWF0ID0gZGlzcGxheV9nZXRfdmFs
aWRhdGVkX2Zvcm1hdChkZXYsIGRlcHRoKTsNCj4+ICsJZm9ybWF0ID0gZGlzcGxheV9nZXRf
dmFsaWRhdGVkX2Zvcm1hdChkZXYsIGRlcHRoLCBiaWdfZW5kaWFuKTsNCj4+ICAgCWlmIChJ
U19FUlIoZm9ybWF0KSkNCj4+ICAgCQlyZXR1cm4gRVJSX0NBU1QoZm9ybWF0KTsNCj4+ICAg
CWlmICghbGluZWJ5dGVzKSB7DQo+PiBAQCAtMTIzNCw2ICsxMjg0LDcgQEAgc3RhdGljIHN0
cnVjdCBvZmRybV9kZXZpY2UgKm9mZHJtX2RldmljZV9jcmVhdGUoc3RydWN0IGRybV9kcml2
ZXIgKmRydiwNCj4+ICAgCQlkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IGRl
cHRoOw0KPj4gICAJCWJyZWFrOw0KPj4gICAJfQ0KPj4gKwlkZXYtPm1vZGVfY29uZmlnLnF1
aXJrX2FkZGZiX3ByZWZlcl9ob3N0X2J5dGVfb3JkZXIgPSB0cnVlOw0KPj4gICANCj4+ICAg
CS8qIFByaW1hcnkgcGxhbmUgKi8NCj4+ICAgDQo+PiAtLSANCj4+IDIuMzcuMw0KPj4NCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------zrVeAn3BvchnrFFPnF0eg9Dd--

--------------ZB9WIPJXlHulGrPV3engfOdt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM0MDgFAwAAAAAACgkQlh/E3EQov+AD
zA//aVf+ePw6D7uCh2FjY8fIbNXhHzaZnMbpIyEJeExOn1AFae+3kEiS7aT7x2XeuoevyO/3QusD
WujLInCaV46Ykxf4VeTwiP4/5eqL5vQq5Mpv03KYj9G04MIzrvNNQP3TA9ZbQyFHghOGUh4w303a
p3Mxci/8sFcBW77ip/rj92iBnGzJQsZkmD3AEOBG9BLIusA/FjQDTuITV3NYHUZR8zwYcWkB+Ars
CZxIsUeH7V2FOdo6n/gUdAQ0pQZwdgPQjQYeCqOfYwWlr+pTM9fooUeAgiQUCFgUOVrs0OVkyD3f
u/h/ZA3FJNEPpj3bX4FbE713QHLMJVX5zAO4eix4NhxZ9m8dUR7ppBGXc76G229TyWeMY1x7aLSO
7CnLwUcWB7q3fSLrDN8YP4zjkou2r7Sg+D1PTHRuVwU0cgJSBK3rSQWUY/XVa/Mv4xqfLf5dIBhV
cVXbPTom0RfXAlTVo1V/dPXQ7T6N9KzZMI+m2IC/+b6KWuidng1uHo1hLwwZgIyb1ctPdQbTg2Wh
6Jjp2BY3Zozf9CcCQ8oACMrIVc268psOFdYPJmGNR/Mlhs791CjAgdh6bqV9VWzFJ0IY2PJfG7C5
MUwfTEPOsp0A6V9tZy0GIW7nox+0MRY6AMrGe8M2ilmtAPRIQyoP7Zqe2cqFFKwz793x6ERMK3+W
gEs=
=9kOX
-----END PGP SIGNATURE-----

--------------ZB9WIPJXlHulGrPV3engfOdt--
