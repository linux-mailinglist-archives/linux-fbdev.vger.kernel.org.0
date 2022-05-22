Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28242530576
	for <lists+linux-fbdev@lfdr.de>; Sun, 22 May 2022 21:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239543AbiEVTfX (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 22 May 2022 15:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiEVTfX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 22 May 2022 15:35:23 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8919B140D0
        for <linux-fbdev@vger.kernel.org>; Sun, 22 May 2022 12:35:21 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 80F4A1F890;
        Sun, 22 May 2022 19:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1653248118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mYdTf6H1hjLl+qWPSwTcmYiJ4fJCbaIFsrkR72wlCoA=;
        b=b09Yj1e+dAHIkoKmiQde6znippdlZu28vw8n4b5jKctqTM/cv1Dz4yi4cqPmzlbiV5sr/I
        smS6vycUqZUmS2JN2aUNs2gBy+uyoRXgW2L/M8h8TdIApSqnYiEDXSCybQKENEIzeKJeHo
        TInCExSUcXAz6qygWwMek+RwVkQgcjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1653248118;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mYdTf6H1hjLl+qWPSwTcmYiJ4fJCbaIFsrkR72wlCoA=;
        b=+s16Y4tNd5KR0ZbkgfjrKP/ZXc3gfr5P28/7VMM6fBAjyeI2qtgRMqFXHm0n43OatzBMjn
        I4C5+iQGK07MkgCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25CF213B1E;
        Sun, 22 May 2022 19:35:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id C8AECHaQimKcZAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Sun, 22 May 2022 19:35:18 +0000
Message-ID: <8cd53439-46f1-117c-7aae-7630a6466ab8@suse.de>
Date:   Sun, 22 May 2022 21:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
        daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech,
        sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
 <84a550c3-dcef-17ac-0ae5-666cdf0fb67e@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <84a550c3-dcef-17ac-0ae5-666cdf0fb67e@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aUQEZ0gKSr0lY4EsEfa1bN0R"
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aUQEZ0gKSr0lY4EsEfa1bN0R
Content-Type: multipart/mixed; boundary="------------0NygFJil9kbLOVOXHLlrS5aa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Message-ID: <8cd53439-46f1-117c-7aae-7630a6466ab8@suse.de>
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
 <84a550c3-dcef-17ac-0ae5-666cdf0fb67e@redhat.com>
In-Reply-To: <84a550c3-dcef-17ac-0ae5-666cdf0fb67e@redhat.com>

--------------0NygFJil9kbLOVOXHLlrS5aa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDIwLjA1LjIyIHVtIDA4OjE5IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBPbiA1LzE4LzIyIDIwOjMw
LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4gDQo+PiAgIA0KPj4gK2NvbmZpZyBEUk1f
T0ZEUk0NCj4+ICsJdHJpc3RhdGUgIk9wZW4gRmlybXdhcmUgZGlzcGxheSBkcml2ZXIiDQo+
PiArCWRlcGVuZHMgb24gRFJNICYmIE1NVSAmJiBQUEMNCj4gDQo+IFNob3VsZG4ndCBkZXBl
bmQgb24gT0Y/IEkgbWVhbiwgaXMgYSBEUk0gZHJpdmVyIGZvciBPcGVuIEZpcm13YXJlIGFm
dGVyIGFsbCA6KQ0KPiANCj4gSSBrbm93IHRoYXQgdGhlIG9sZCBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L29mZmIuYyBkb2Vzbid0LCBidXQgSSB0aGluayB0aGF0IGlzIGENCj4gYnV0IGFuZCBz
aG91bGQgYGRlcGVuZHMgb24gT0YgfHwgQ09NUElMRV9URVNUYA0KDQpJIGhhdmUgdG8gbG9v
ayBmb3IgcG9zc2libGUgcGl0ZmFsbHMsIGJ1dCB0aGF0IHNlZW1zIHRvIG1ha2VzIHNlbnNl
Lg0KDQo+IA0KPj4gKw0KPj4gKy8qDQo+PiArICogSGVscGVycyBmb3IgZGlzcGxheSBub2Rl
cw0KPj4gKyAqLw0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgZGlzcGxheV9nZXRfdmFsaWRhdGVk
X2ludChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBjb25zdCBjaGFyICpuYW1lLCB1aW50MzJf
dCB2YWx1ZSkNCj4+ICt7DQo+PiArCWlmICh2YWx1ZSA+IElOVF9NQVgpIHsNCj4+ICsJCWRy
bV9lcnIoZGV2LCAiaW52YWxpZCBmcmFtZWJ1ZmZlciAlcyBvZiAldVxuIiwgbmFtZSwgdmFs
dWUpOw0KPj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+PiArCX0NCj4+ICsJcmV0dXJuIChpbnQp
dmFsdWU7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgZGlzcGxheV9nZXRfdmFsaWRh
dGVkX2ludDAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbmFtZSwgdWlu
dDMyX3QgdmFsdWUpDQo+PiArew0KPj4gKwlpZiAoIXZhbHVlKSB7DQo+PiArCQlkcm1fZXJy
KGRldiwgImludmFsaWQgZnJhbWVidWZmZXIgJXMgb2YgJXVcbiIsIG5hbWUsIHZhbHVlKTsN
Cj4+ICsJCXJldHVybiAtRUlOVkFMOw0KPj4gKwl9DQo+PiArCXJldHVybiBkaXNwbGF5X2dl
dF92YWxpZGF0ZWRfaW50KGRldiwgbmFtZSwgdmFsdWUpOw0KPj4gK30NCj4+ICsNCj4gDQo+
IFRoZXNlIHR3byBoZWxwZXJzIGFyZSB0aGUgc2FtZSB0aGF0IHdlIGFscmVhZHkgaGF2ZSBp
biBzaW1wbGVkcm0uYywgbWF5YmUgY291bGQNCj4gaW5jbHVkZSBhIHByZXBhcmF0b3J5IHBh
dGNoIHRoYXQgbW92ZXMgdG8gZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMN
Cj4gYW5kIG1ha2UgdGhlbSBwdWJsaWMgZm9yIGRyaXZlcnMgdG8gdXNlID8gT3IgbWF5YmUg
ZXZlbiBhcyBzdGF0aWMgaW5saW5lIGluDQo+IGluY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVs
cGVyLmggPw0KDQpUbyBtZSBpdCBzZWVtcyB0aGF0IHRoZXNlIGhlbHBlcnMgYXJlIHNvIHNt
YWxsIHRoYXQgdGhleSByZWFsbHkgZG9uJ3QgDQpuZWVkIHRvIGJlIHNoYXJlZC4gSWYgYW55
dGhpbmcsIHdlIGNvdWxkIGFkZCB0aGVtIGRpcmVjdGx5IHRvIHRoZSBPRiANCm1vZHVsZS4g
U29tZXRoaW5nIGxpa2Ugb2ZfcHJvcGVydHlfcmVhZF91MzJfcmFuZ2UoKSB0aGF0IHRha2Vz
IGFkZGl0aW9ucyANCm1pbi9tYXggdmFsdWVzLg0KDQo+IA0KPj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpkaXNwbGF5X2dldF92YWxpZGF0ZWRfZm9ybWF0KHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+PiArCQkJCQkJCQkgIHUzMiBkZXB0aCkNCj4+ICt7
DQo+PiArCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmluZm87DQo+PiArCXUzMiBm
b3JtYXQ7DQo+PiArDQo+PiArCXN3aXRjaCAoZGVwdGgpIHsNCj4+ICsJY2FzZSA4Og0KPj4g
KwkJZm9ybWF0ID0gZHJtX21vZGVfbGVnYWN5X2ZiX2Zvcm1hdCg4LCA4KTsNCj4+ICsJCWJy
ZWFrOw0KPj4gKwljYXNlIDE1Og0KPiANCj4gSSB0aGluayBpcyBjdXN0b21hcnkgbm93IHRv
IGFkZCAvKiBmYWxsIHRocm91Z2ggKi8gaGVyZSB0byBzaWxlbmNlIEdDQyB3YXJucyA/DQoN
ClRoZXJlIHNob3VsZCBiZSBubyB3YXJuaW5ncyBpZiBtdWx0aXBsZSBjYXNlIHN0YXRlbWVu
dHMgYXJlIGRpcmVjdGx5IA0KbmV4dCB0byBlYWNoIG90aGVyLg0KDQo+IA0KPj4gK30NCj4+
ICsNCj4+ICtzdGF0aWMgaW50IGRpc3BsYXlfcmVhZF91MzJfb2Yoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpvZl9ub2RlLA0KPj4gKwkJCSAgICAgICBj
b25zdCBjaGFyICpuYW1lLCB1MzIgKnZhbHVlKQ0KPj4gK3sNCj4+ICsJaW50IHJldCA9IG9m
X3Byb3BlcnR5X3JlYWRfdTMyKG9mX25vZGUsIG5hbWUsIHZhbHVlKTsNCj4+ICsNCj4+ICsJ
aWYgKHJldCkNCj4+ICsJCWRybV9lcnIoZGV2LCAiY2Fubm90IHBhcnNlIGZyYW1lYnVmZmVy
ICVzOiBlcnJvciAlZFxuIiwgbmFtZSwgcmV0KTsNCj4+ICsJcmV0dXJuIHJldDsNCj4+ICt9
DQo+PiArDQo+IA0KPiBbc25pcF0NCj4gDQo+PiArc3RhdGljIHU2NCBkaXNwbGF5X2dldF9h
ZGRyZXNzX29mKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
b2Zfbm9kZSkNCj4+ICt7DQo+PiArCXUzMiBhZGRyZXNzOw0KPj4gKwlpbnQgcmV0Ow0KPj4g
Kw0KPj4gKwkvKg0KPj4gKwkgKiBOb3QgYWxsIGRldmljZXMgcHJvdmlkZSBhbiBhZGRyZXNz
IHByb3BlcnR5LCBpdCdzIG5vdA0KPj4gKwkgKiBhIGJ1ZyBpZiB0aGlzIGZhaWxzLiBUaGUg
ZHJpdmVyIHdpbGwgdHJ5IHRvIGZpbmQgdGhlDQo+PiArCSAqIGZyYW1lYnVmZmVyIGJhc2Ug
YWRkcmVzcyBmcm9tIHRoZSBkZXZpY2UncyBtZW1vcnkgcmVnaW9ucy4NCj4+ICsJICovDQo+
PiArCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG9mX25vZGUsICJhZGRyZXNzIiwgJmFk
ZHJlc3MpOw0KPj4gKwlpZiAocmV0KQ0KPj4gKwkJcmV0dXJuIE9GX0JBRF9BRERSOw0KPj4g
Kw0KPj4gKwlyZXR1cm4gYWRkcmVzczsNCj4+ICt9DQo+PiArDQo+IA0KPiBBbGwgdGhlc2Ug
aGVscGVycyBzZWVtcyB0byBiZSBxdWl0ZSBnZW5lcmljIGFuZCBzb21ldGhpbmcgdGhhdCBv
dGhlciBPRg0KPiBkcml2ZXJzIGNvdWxkIGJlbmVmaXQgZnJvbS4gTWF5YmUgYWRkIHRoZW0g
dG8gZHJpdmVycy9ncHUvZHJtL2RybV9vZi5jID8NCg0KTm8gcG9pbnQgaW4gZXhwb3J0aW5n
IHRoZW0gQUZBSUNULiBUaGV5IGxvb2sgbGlrZSB0aGUgY29kZSBpbiBzaW1wbGVkcm0sIA0K
YnV0IHRoZXkgYXJlIHNwZWNpZmljIHRvIHRoaXMgc2luZ2xlIGRyaXZlci4gSW4gdGhpcyBj
b250ZXh0ICdPRicgaXMgbm90IA0KT0YgaW4gZ2VuZXJhbCwgYnV0IHRoZSBzcGVjaWZpYyBn
ZW5lcmljIGRpc3BsYXkgb2YgUFBDJ3MgT0YgZGV2aWNlIHRyZWUuIA0KTm8gb3RoZXIgRFJN
IGRyaXZlciBzaG91bGQgdXNlIHRoaXMuDQoNCj4gDQo+PiArI2lmIGRlZmluZWQoQ09ORklH
X1BDSSkNCj4+ICtzdGF0aWMgc3RydWN0IHBjaV9kZXYgKmRpc3BsYXlfZ2V0X3BjaV9kZXZf
b2Yoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpvZl9ub2Rl
KQ0KPj4gK3sNCj4+ICsJY29uc3QgX19iZTMyICp2ZW5kb3JfcCwgKmRldmljZV9wOw0KPj4g
Kwl1MzIgdmVuZG9yLCBkZXZpY2U7DQo+PiArCXN0cnVjdCBwY2lfZGV2ICpwY2lkZXY7DQo+
PiArDQo+PiArCXZlbmRvcl9wID0gb2ZfZ2V0X3Byb3BlcnR5KG9mX25vZGUsICJ2ZW5kb3It
aWQiLCBOVUxMKTsNCj4+ICsJaWYgKCF2ZW5kb3JfcCkNCj4+ICsJCXJldHVybiBFUlJfUFRS
KC1FTk9ERVYpOw0KPj4gKwl2ZW5kb3IgPSBiZTMyX3RvX2NwdXAodmVuZG9yX3ApOw0KPj4g
Kw0KPj4gKwlkZXZpY2VfcCA9IG9mX2dldF9wcm9wZXJ0eShvZl9ub2RlLCAiZGV2aWNlLWlk
IiwgTlVMTCk7DQo+PiArCWlmICghZGV2aWNlX3ApDQo+PiArCQlyZXR1cm4gRVJSX1BUUigt
RU5PREVWKTsNCj4+ICsJZGV2aWNlID0gYmUzMl90b19jcHVwKGRldmljZV9wKTsNCj4+ICsN
Cj4+ICsJcGNpZGV2ID0gcGNpX2dldF9kZXZpY2UodmVuZG9yLCBkZXZpY2UsIE5VTEwpOw0K
Pj4gKwlpZiAoIXBjaWRldikNCj4+ICsJCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOw0KPj4g
Kw0KPj4gKwlyZXR1cm4gcGNpZGV2Ow0KPj4gK30NCj4+ICsjZWxzZQ0KPj4gK3N0YXRpYyBz
dHJ1Y3QgcGNpX2RldiAqZGlzcGxheV9nZXRfcGNpX2Rldl9vZihzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm9mX25vZGUpDQo+PiArew0KPj4gKwlyZXR1
cm4gRVJSX1BUUigtRU5PREVWKTsNCj4+ICt9DQo+PiArI2VuZGlmDQo+PiArDQo+IA0KPiBV
bnN1cmUgYWJvdXQgdGhpcyBvbmUsIEkgZG9uJ3Qgc2VlIG90aGVyIGRpc3BsYXkgZHJpdmVy
IHVzaW5nIGEgInZlbmRvci1pZCINCj4gb3IgImRldmljZS1pZCIgd2hlbiBsb29raW5nIGF0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy8sIHNvIGd1ZXNzDQo+IHRoaXMg
b25lIHdvdWxkIGhhdmUgdG8gcmVtYWluIGluIHRoZSBkcml2ZXIgYW5kIG5vdCBpbiBhIGhl
bHBlciBsaWJyYXJ5Lg0KPiANCj4gQnV0IHNpbmNlIHlvdSBoYXZlICNpZmRlZmVyeSBoZXJl
LCBtYXliZSB3b3VsZCBiZSBjbGVhbmVyIHRvIGhhdmUgdGhhdCBzdHViDQo+IGRlZmluZWQg
YXMgc3RhdGljIGlubGluZSBpbiBpbmNsdWRlL2RybS9kcm1fb2YuaCA/DQo+IA0KPiANCj4+
ICtzdGF0aWMgc3RydWN0IG9mZHJtX2RldmljZSAqb2Zkcm1fZGV2aWNlX29mX2RldihzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4gK3sNCj4+ICsJcmV0dXJuIGNvbnRhaW5lcl9vZihk
ZXYsIHN0cnVjdCBvZmRybV9kZXZpY2UsIGRldik7DQo+PiArfQ0KPj4gKw0KPj4gKy8qDQo+
PiArICogIE9GIGRpc3BsYXkgc2V0dGluZ3MNCj4+ICsgKi8NCj4+ICsNCj4gDQo+IFRoaXMg
c2VlbXMgbGlrZSBhbm90aGVyIGNhbmRpZGF0ZSB0byBtb3ZlIHRvIHRoZSBpbmNsdWRlL2Ry
bS9kcm1fb2YuaCBoZWFkZXIuDQo+IA0KPj4gK3N0YXRpYyBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSBvZmRybV9tb2RlKHVuc2lnbmVkIGludCB3aWR0aCwgdW5zaWduZWQgaW50IGhlaWdo
dCkNCj4+ICt7DQo+PiArCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG1vZGUgPSB7IE9GRFJN
X01PREUod2lkdGgsIGhlaWdodCkgfTsNCj4+ICsNCj4+ICsJbW9kZS5jbG9jayA9IG1vZGUu
aGRpc3BsYXkgKiBtb2RlLnZkaXNwbGF5ICogNjAgLyAxMDAwIC8qIGtIeiAqLzsNCj4gDQo+
IE1heWJlIGEgY29tbWVudCBoZXJlIGFib3V0IHRoZSBjbG9jayB2YWx1ZSBjaG9zZW4gPw0K
PiANCj4+ICsJZHJtX21vZGVfc2V0X25hbWUoJm1vZGUpOw0KPj4gKw0KPj4gKwlyZXR1cm4g
bW9kZTsNCj4+ICt9DQo+PiArDQo+IA0KPiBbc25pcF0NCj4gDQo+PiArDQo+PiArCS8qDQo+
PiArCSAqIE5ldmVyIHVzZSBwY2ltXyBvciBvdGhlciBtYW5hZ2VkIGhlbHBlcnMgb24gdGhl
IHJldHVybmVkIFBDSQ0KPj4gKwkgKiBkZXZpY2UuIE90aGVyd2lzZSwgcHJvYmluZyB0aGUg
bmF0aXZlIGRyaXZlciB3aWxsIGZhaWwgZm9yDQo+PiArCSAqIHJlc291cmNlIGNvbmZsaWN0
cy4gUENJLWRldmljZSBtYW5hZ2VtZW50IGhhcyB0byBiZSB0aWVkIHRvDQo+PiArCSAqIHRo
ZSBsaWZldGltZSBvZiB0aGUgcGxhdGZvcm0gZGV2aWNlIHVudGlsIHRoZSBuYXRpdmUgZHJp
dmVyDQo+PiArCSAqIHRha2VzIG92ZXIuDQo+PiArCSAqLw0KPiANCj4gQWgsIHdhcyB0aGlz
IHRoZSBpc3N1ZSB0aGF0IHlvdSBtZW50aW9uZWQgdGhlIG90aGVyIGRheT8gSG93IGludGVy
ZXN0aW5nLg0KDQpUaGF0IHdhcyBvbmUgb2YgdGhlIHByb2JsZW1zLCBidXQgbm90IHRoZSBv
bmUgSSBtZW50aW9uZWQuIDopIFRoYXQgb25lIA0Kd2FzIHJlbGF0ZWQgdG8gdGhlIHNldHRp
bmcgb2YgcHJlZmVycmVkX2NvbG9yX2RlcHRoLg0KDQo+IA0KPiANCj4+ICsvKg0KPj4gKyAq
IFN1cHBvcnQgYWxsIGZvcm1hdHMgb2YgT0YgZGlzcGxheSBhbmQgbWF5YmUgbW9yZTsgaW4g
b3JkZXINCj4+ICsgKiBvZiBwcmVmZXJlbmNlLiBUaGUgZGlzcGxheSdzIHVwZGF0ZSBmdW5j
dGlvbiB3aWxsIGRvIGFueQ0KPj4gKyAqIGNvbnZlcnNpb24gbmVjZXNzYXJ5Lg0KPj4gKyAq
DQo+PiArICogVE9ETzogQWRkIGJsaXQgaGVscGVycyBmb3IgcmVtYWluaW5nIGZvcm1hdHMg
YW5kIHVuY29tbWVudA0KPj4gKyAqICAgICAgIGNvbnN0YW50cy4NCj4+ICsgKi8NCj4+ICtz
dGF0aWMgY29uc3QgdWludDMyX3Qgb2Zkcm1fZGVmYXVsdF9mb3JtYXRzW10gPSB7DQo+PiAr
CURSTV9GT1JNQVRfWFJHQjg4ODgsDQo+PiArCURSTV9GT1JNQVRfUkdCNTY1LA0KPj4gKwkv
L0RSTV9GT1JNQVRfWFJHQjE1NTUsDQo+IA0KPiBXb25kZXIgaWYgbWFrZXMgc2Vuc2UgdG8g
a2VlcCB0aGlzIGNvbW1lbnRlZCBhbmQgdGhlIFRPRE8sIHdoeSBub3QNCj4gbGVhdmUgdGhh
dCBmb3JtYXQgZnJvbSBmaXJzdCB2ZXJzaW9uIGFuZCBqdXN0IGRvIGl0IGFzIGZvbGxvdy11
cCA/DQo+IA0KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBv
ZmRybV9jb25uZWN0b3JfZnVuY3MgPSB7DQo+PiArCS5yZXNldCA9IGRybV9hdG9taWNfaGVs
cGVyX2Nvbm5lY3Rvcl9yZXNldCwNCj4+ICsJLmZpbGxfbW9kZXMgPSBkcm1faGVscGVyX3By
b2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMsDQo+PiArCS5kZXN0cm95ID0gZHJtX2Nvbm5l
Y3Rvcl9jbGVhbnVwLA0KPj4gKwkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGRybV9hdG9t
aWNfaGVscGVyX2Nvbm5lY3Rvcl9kdXBsaWNhdGVfc3RhdGUsDQo+PiArCS5hdG9taWNfZGVz
dHJveV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kZXN0cm95X3N0YXRl
LA0KPj4gK307DQo+IA0KPiBBbGwgb2YgdGhlIGNhbGxiYWNrcyB1c2VkIGNvbWVzIGZyb20g
aGVscGVyIGxpYnJhcmllcyBzbyBJIG1heWJlIHdlDQo+IGNvdWxkIGhhdmUgYSBtYWNybyBv
ciBzb21ldGhpbmcgdG8gc2V0IHRob3NlID8gSXQncyB0aGUgc2FtZSBzZXQgdGhhdA0KPiBh
cmUgdXNlZCBpbiBzaW1wbGVkcm0gc28gaXQgd291bGQgbWFrZSBzZW5zZSB0byBoYXZlIHRo
ZW0gZGVmaW5lZCBpbg0KPiB0aGUgc2FtZSBwbGFjZS4NCg0KRXZlbiBiZXR0ZXIsIEkgbWVh
bndoaWxlIG1hZGUgYSBsaXR0bGUgaGVscGVyIGxpYnJhcnkgZm9yIHRoZSB3aG9sZSANCm1v
ZGVzZXR0aW5nIHBpcGVsaW5lIGFuZCBpbXBsZW1lbnRlZCBzaW1wbGVkcm0gYW5kIG9mZHJt
IG9uIHRvcCBvZiBpdC4gDQpJdCBvbmx5IG5lZWRzIHRoZSBpbmZvcm1hdGlvbiBhYm91dCB0
aGUgbmF0aXZlIGJ1ZmZlciBhbmQgZG9lcyB0aGUgcmVzdC4NCg0KPiANCj4+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyBvZmRybV9tb2RlX2NvbmZpZ19m
dW5jcyA9IHsNCj4+ICsJLmZiX2NyZWF0ZSA9IGRybV9nZW1fZmJfY3JlYXRlX3dpdGhfZGly
dHksDQo+PiArCS5hdG9taWNfY2hlY2sgPSBkcm1fYXRvbWljX2hlbHBlcl9jaGVjaywNCj4+
ICsJLmF0b21pY19jb21taXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXQsDQo+PiArfTsN
Cj4+ICsNCj4gDQo+IFNhbWUgZm9yIHRoZXNlLiBXZSBjb3VsZCBhbHNvIGhhdmUgYSBtYWNy
byB0byBkZWZpbmUgdGhpcyBmb3IgYm90aA0KPiBzaW1wbGVkcm0gYW5kIG9mZHJtLg0KPiAN
Cj4+ICtzdGF0aWMgY29uc3QgdWludDMyX3QgKm9mZHJtX2RldmljZV9mb3JtYXRzKHN0cnVj
dCBvZmRybV9kZXZpY2UgKm9kZXYsIHNpemVfdCAqbmZvcm1hdHNfb3V0KQ0KPj4gK3sNCj4+
ICsJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9ICZvZGV2LT5kZXY7DQo+PiArCXNpemVfdCBp
Ow0KPj4gKw0KPj4gKwlpZiAob2Rldi0+bmZvcm1hdHMpDQo+PiArCQlnb3RvIG91dDsgLyog
ZG9uJ3QgcmVidWlsZCBsaXN0IG9uIHJlY3VycmluZyBjYWxscyAqLw0KPj4gKw0KPiANCj4g
TmljZSBvcHRpbWl6YXRpb24gdG8gY2FjaGUgdGhpcy4NCj4gDQo+PiArCS8qDQo+PiArCSAq
IFRPRE86IFRoZSBvZmRybSBkcml2ZXIgY29udmVydHMgZnJhbWVidWZmZXJzIHRvIHRoZSBu
YXRpdmUNCj4+ICsJICogZm9ybWF0IHdoZW4gY29weWluZyB0aGVtIHRvIGRldmljZSBtZW1v
cnkuIElmIHRoZXJlIGFyZSBtb3JlDQo+PiArCSAqIGZvcm1hdHMgbGlzdGVkIHRoYW4gc3Vw
cG9ydGVkIGJ5IHRoZSBkcml2ZXIsIHRoZSBuYXRpdmUgZm9ybWF0DQo+PiArCSAqIGlzIG5v
dCBzdXBwb3J0ZWQgYnkgdGhlIGNvbnZlcnNpb24gaGVscGVycy4gVGhlcmVmb3JlICpvbmx5
Kg0KPj4gKwkgKiBzdXBwb3J0IHRoZSBuYXRpdmUgZm9ybWF0IGFuZCBhZGQgYSBjb252ZXJz
aW9uIGhlbHBlciBBU0FQLg0KPj4gKwkgKi8NCj4+ICsJaWYgKGRybV9XQVJOX09OQ0UoZGV2
LCBpICE9IG9kZXYtPm5mb3JtYXRzLA0KPj4gKwkJCSAgImZvcm1hdCBjb252ZXJzaW9uIGhl
bHBlcnMgcmVxdWlyZWQgZm9yICVwNGNjIiwNCj4+ICsJCQkgICZvZGV2LT5mb3JtYXQtPmZv
cm1hdCkpIHsNCj4+ICsJCW9kZXYtPm5mb3JtYXRzID0gMTsNCj4+ICsJfQ0KPj4gKw0KPiAN
Cj4gSW50ZXJlc3RpbmcuIERpZCB5b3UgZmluZCBzb21lIGZvcm1hdHMgdGhhdCB3ZXJlIG5v
dCBzdXBwb3J0ZWQgPw0KDQpXZSBzdGlsbCBkb24ndCBzdXBwb3J0IFhSR0IxNTU1LiBJZiB0
aGUgbmF0aXZlIGJ1ZmZlciB1c2VzIHRoaXMgZm9ybWF0LCANCndlJ2QgaGF2ZSBubyBjb252
ZXJzaW9uIGhlbHBlci4gSW4gdGhpcyBjYXNlLCB3ZSByZWx5IG9uIHVzZXJzcGFjZS9mYmNv
biANCnRvIHVzZSB0aGUgbmF0aXZlIGZvcm1hdCBleGNsdXNpdmVseS4gIChCVFcsIEkgYXNr
ZWQgb25lIG9mIG15IGNvd29ya2VycyANCnRvIGltcGxlbWVudCBYUkdCMTU1NSB0byBtYWtl
IGhlciBmYW1pbGlhciB3aXRoIERSTS4gVGhhdCdzIHdoeSBJIA0KaGF2ZW4ndCBzZW50IGEg
cGF0Y2ggeWV0LikNCg0KPiANCj4gVGhlIHJlc3Qgb2YgdGhlIHBhdGNoIGxvb2tzIGdvb2Qg
dG8gbWUsIHRoYW5rcyBhIGxvdCBmb3Igd3JpdGluZyB0aGlzLg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiAN
Cg0KVGhhbmtzIGEgbG90Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------0NygFJil9kbLOVOXHLlrS5aa--

--------------aUQEZ0gKSr0lY4EsEfa1bN0R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKKkHUFAwAAAAAACgkQlh/E3EQov+DT
PxAAzcuuv65s5FQZqCHmYF3mwMa6knoCMg7yc3xr9yOKhoARc/VlI5VZLictattJQUXcS+64wdSB
RFeT59eIPchyT49TcILyPVbiHbWa3fZj4JsxPGa3A+lMeL+rzE8Qh/+uPTmULmZR9utoish8VcRy
BzQsLgHoxD0VCWSpzg8/uee9g/K2Y6nSkA2R/CGerEMRjbis3IRgmxDVrdn1Gm7/Q2Yf4DomeDHf
D1xvsdqJhmuvvDgJH6k15PahM7HFpGf8RrNd8ulsVUDvCWPWE63v1kDo7cOCPhuopr/miczEzCYz
Z/hSs7KGGUagasRm4MuPrNxRhEYhX7ju3omBFiRN0b//QbxH+UTbIHN4Os6adC8ICfpjuZdBgInz
2+sB+aUJsFMZSsBNqQtLQYC+Qhq2G0+KVeCiWC1Jo9iDgTtcDm4qM2FhxbVVgJs9caCG8/rV2YN4
as1RLi72L/gHzN9gZyCXxA5WZGt1hrJ/8jkc2cJe7YHoA3t+Ddpxgb12a3MHzv4H7eNHBsNL9DGC
Anzw2lx10nzKRg223TcMR8avnc3826OONUhoa31/ubNKAqfkPHGfaiFHM4MAqJ+AlzVdVrHGJCfe
rngjUGKTH1bwiRvPkSM5UhOSxJzlOge5bZq8HZ9fiZ3JnNXiZFW/kg7cb1ujijCvOVjPV5Jn0YRO
XnM=
=7+qe
-----END PGP SIGNATURE-----

--------------aUQEZ0gKSr0lY4EsEfa1bN0R--
