Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56DB6519BAE
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 May 2022 11:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347088AbiEDJau (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 4 May 2022 05:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbiEDJas (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 4 May 2022 05:30:48 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3D922B1F;
        Wed,  4 May 2022 02:27:12 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 2A8A01F749;
        Wed,  4 May 2022 09:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1651656431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VOQMHo7goqGNyx6gxrIdY/3NDoenLiOZ+sLf1B/URg8=;
        b=YGu7ulQeFscE8DOaepZh+BlO+TQwNUEOxsKkMVl30mfVRbF7Qvm8rjkeazO9x7rD+HIaHC
        sPcpVgp97ViLjpDFvV5+iwKeOmmd7e/76OgwpBSU/J6cEKFVI83E4QHlDS2kgt6Wa1pMoe
        U47lXmH5+2Qngq8XEK7Ae3semY/20qI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1651656431;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VOQMHo7goqGNyx6gxrIdY/3NDoenLiOZ+sLf1B/URg8=;
        b=9YJ0ru/9uuUq6ZVFsfnqG3CKLEzCdSQJG9Q33bl46elXrRwqat5rYiwk7Q6eCHt10/D+kF
        6qqoP52054rGD+AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00A4C131BD;
        Wed,  4 May 2022 09:27:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id bbrIOu5GcmJLCAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 04 May 2022 09:27:10 +0000
Message-ID: <e0fd35ab-40f0-be97-65fb-c3124499fc2f@suse.de>
Date:   Wed, 4 May 2022 11:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] fbdev: Use helper to get fb_info in all file
 operations
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Junxiao Chang <junxiao.chang@intel.com>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
        Sam Ravnborg <sam@ravnborg.org>
References: <20220503201934.681276-1-javierm@redhat.com>
 <YnJBGpvlViLV+0/a@phenom.ffwll.local>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YnJBGpvlViLV+0/a@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TQ8dZrWjVi6qU8b2dTrGsp8a"
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TQ8dZrWjVi6qU8b2dTrGsp8a
Content-Type: multipart/mixed; boundary="------------fVJCXKdhTJJnWaoYWTtZbIpw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Junxiao Chang <junxiao.chang@intel.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <e0fd35ab-40f0-be97-65fb-c3124499fc2f@suse.de>
Subject: Re: [PATCH v2] fbdev: Use helper to get fb_info in all file
 operations
References: <20220503201934.681276-1-javierm@redhat.com>
 <YnJBGpvlViLV+0/a@phenom.ffwll.local>
In-Reply-To: <YnJBGpvlViLV+0/a@phenom.ffwll.local>

--------------fVJCXKdhTJJnWaoYWTtZbIpw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDUuMjIgdW0gMTE6MDIgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUdWUsIE1heSAwMywgMjAyMiBhdCAxMDoxOTozNFBNICswMjAwLCBKYXZpZXIgTWFydGlu
ZXogQ2FuaWxsYXMgd3JvdGU6DQo+PiBBIHJlZmVyZW5jZSB0byB0aGUgZnJhbWVidWZmZXIg
ZGV2aWNlIHN0cnVjdCBmYl9pbmZvIGlzIHN0b3JlZCBpbiB0aGUgZmlsZQ0KPj4gcHJpdmF0
ZSBkYXRhLCBidXQgdGhpcyByZWZlcmVuY2UgY291bGQgbm8gbG9uZ2VyIGJlIHZhbGlkIGFu
ZCBtdXN0IG5vdCBiZQ0KPj4gYWNjZXNzZWQgZGlyZWN0bHkuIEluc3RlYWQsIHRoZSBmaWxl
X2ZiX2luZm8oKSBhY2Nlc3NvciBmdW5jdGlvbiBtdXN0IGJlDQo+PiB1c2VkIHNpbmNlIGl0
IGRvZXMgc2FuaXR5IGNoZWNraW5nIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBmYl9pbmZvIGlz
IHZhbGlkLg0KPj4NCj4+IFRoaXMgY2FuIGhhcHBlbiBmb3IgZXhhbXBsZSBpZiB0aGUgcmVn
aXN0ZXJlZCBmcmFtZWJ1ZmZlciBkZXZpY2UgaXMgZm9yIGENCj4+IGRyaXZlciB0aGF0IGp1
c3QgdXNlcyBhIGZyYW1lYnVmZmVyIHByb3ZpZGVkIGJ5IHRoZSBzeXN0ZW0gZmlybXdhcmUu
IEluDQo+PiB0aGF0IGNhc2UsIHRoZSBmYmRldiBjb3JlIHdvdWxkIHVucmVnaXN0ZXIgdGhl
IGZyYW1lYnVmZmVyIGRldmljZSB3aGVuIGENCj4+IHJlYWwgdmlkZW8gZHJpdmVyIGlzIHBy
b2JlZCBhbmQgYXNrIHRvIHJlbW92ZSBjb25mbGljdGluZyBmcmFtZWJ1ZmZlcnMuDQo+Pg0K
Pj4gTW9zdCBmYmRldiBmaWxlIG9wZXJhdGlvbnMgYWxyZWFkeSB1c2UgdGhlIGhlbHBlciB0
byBnZXQgdGhlIGZiX2luZm8gYnV0DQo+PiBnZXRfZmJfdW5tYXBwZWRfYXJlYSgpIGFuZCBm
Yl9kZWZlcnJlZF9pb19mc3luYygpIGRvbid0LiBGaXggdGhvc2UgdHdvLg0KPj4NCj4+IFNp
bmNlIGZiX2RlZmVycmVkX2lvX2ZzeW5jKCkgaXMgbm90IGluIGZibWVtLm8sIHRoZSBoZWxw
ZXIgaGFzIHRvIGJlDQo+PiBleHBvcnRlZC4gUmVuYW1lIGl0IGFuZCBhZGQgYSBmYl8gcHJl
Zml4IHRvIGRlbm90ZSB0aGF0IGlzIHB1YmxpYyBub3cuDQo+Pg0KPj4gUmVwb3J0ZWQtYnk6
IEp1bnhpYW8gQ2hhbmcgPGp1bnhpYW8uY2hhbmdAaW50ZWwuY29tPg0KPj4gU2lnbmVkLW9m
Zi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+
IA0KPiBOb3RlIHRoYXQgZmJfZmlsZV9pbmZvIGlzIGhpbGFyaW91c2x5IHJhY3kgc2luY2Ug
dGhlcmUncyBub3RoaW5nDQo+IHByZXZlbnRpbmcgYSBjb25jdXJyZW5jdCBmcmFtZWJ1ZmZl
cl91bnJlZ2lzdGVyLiBPciBhdCBsZWFzdCBJJ20gbm90DQo+IHNlZWluZyBhbnl0aGluZy4g
U2VlIGNmNGEzYWU0ZWYzMyAoImZiZGV2OiBsb2NrX2ZiX2luZm8gY2Fubm90IGZhaWwiKSBm
b3INCj4gY29udGV4dCwgbWF5YmUgcmVmZXJlbmNlIHRoYXQgY29tbWl0IGhlcmUgaW4geW91
ciBwYXRjaC4NCg0KQ2FuIHdlIGFjcXVpcmUgcmVnaXN0cmF0aW9uX2xvY2sgYXJvdW5kIFsx
XT8NCg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTcuNS9z
b3VyY2UvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMjTDc1Ng0KDQo+IA0KPiBF
aXRoZXIgd2F5IHRoaXMgZG9lc24ndCByZWFsbHkgbWFrZSBhbnl0aGluZyB3b3JzZSwgc28N
Cj4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+
IA0KPiBDaGVlcnMsIERhbmllbA0KPiANCj4+IC0tLQ0KPj4NCj4+IENoYW5nZXMgaW4gdjI6
DQo+PiAtIEZpeCBjb3B5ICYgcGFzdGUgZXJyb3IgcGFzc2luZyBmaWxlLT5wcml2YXRlX2Rh
dGEgaW5zdGVhZCBvZiBmaWxlDQo+PiAgICB0byBmYl9maWxlX2ZiX2luZm8oKSBmdW5jdGlv
biAoU2FtIFJhdm5ib3JnKS4NCj4+DQo+PiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9m
Yl9kZWZpby5jIHwgIDUgKysrKy0NCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zi
bWVtLmMgICAgfCAyNCArKysrKysrKysrKysrKystLS0tLS0tLS0NCj4+ICAgaW5jbHVkZS9s
aW51eC9mYi5oICAgICAgICAgICAgICAgICAgfCAgMSArDQo+PiAgIDMgZmlsZXMgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jIGIvZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2ZiX2RlZmlvLmMNCj4+IGluZGV4IDg0MmM2NmIzZTMzZC4uY2NkZjkw
M2M0OGJkIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2Rl
ZmlvLmMNCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jDQo+
PiBAQCAtNjgsMTIgKzY4LDE1IEBAIHN0YXRpYyB2bV9mYXVsdF90IGZiX2RlZmVycmVkX2lv
X2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQ0KPj4gICANCj4+ICAgaW50IGZiX2RlZmVy
cmVkX2lvX2ZzeW5jKHN0cnVjdCBmaWxlICpmaWxlLCBsb2ZmX3Qgc3RhcnQsIGxvZmZfdCBl
bmQsIGludCBkYXRhc3luYykNCj4+ICAgew0KPj4gLQlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9
IGZpbGUtPnByaXZhdGVfZGF0YTsNCj4+ICsJc3RydWN0IGZiX2luZm8gKmluZm8gPSBmYl9m
aWxlX2ZiX2luZm8oZmlsZSk7DQo+PiAgIAlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZmlsZV9p
bm9kZShmaWxlKTsNCj4+ICAgCWludCBlcnIgPSBmaWxlX3dyaXRlX2FuZF93YWl0X3Jhbmdl
KGZpbGUsIHN0YXJ0LCBlbmQpOw0KPj4gICAJaWYgKGVycikNCj4+ICAgCQlyZXR1cm4gZXJy
Ow0KPj4gICANCj4+ICsJaWYgKCFpbmZvKQ0KPj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+PiAr
DQo+PiAgIAkvKiBTa2lwIGlmIGRlZmVycmVkIGlvIGlzIGNvbXBpbGVkLWluIGJ1dCBkaXNh
YmxlZCBvbiB0aGlzIGZiZGV2ICovDQo+PiAgIAlpZiAoIWluZm8tPmZiZGVmaW8pDQo+PiAg
IAkJcmV0dXJuIDA7DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3Jl
L2ZibWVtLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYw0KPj4gaW5kZXgg
OTdlYjBkZWU0MTFjLi5iYTJjMTRhMTA4N2QgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYw0KPj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZibWVtLmMNCj4+IEBAIC03NDUsNyArNzQ1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzZXFfb3BlcmF0aW9ucyBfX21heWJlX3VudXNlZCBwcm9jX2ZiX3NlcV9vcHMgPSB7DQo+
PiAgICAqIFNvIGxvb2sgdXAgdGhlIGZiX2luZm8gdXNpbmcgdGhlIGlub2RlIG1pbm9yIG51
bWJlciwNCj4+ICAgICogYW5kIGp1c3QgdmVyaWZ5IGl0IGFnYWluc3QgdGhlIHJlZmVyZW5j
ZSB3ZSBoYXZlLg0KPj4gICAgKi8NCj4+IC1zdGF0aWMgc3RydWN0IGZiX2luZm8gKmZpbGVf
ZmJfaW5mbyhzdHJ1Y3QgZmlsZSAqZmlsZSkNCj4+ICtzdHJ1Y3QgZmJfaW5mbyAqZmJfZmls
ZV9mYl9pbmZvKHN0cnVjdCBmaWxlICpmaWxlKQ0KPj4gICB7DQo+PiAgIAlzdHJ1Y3QgaW5v
ZGUgKmlub2RlID0gZmlsZV9pbm9kZShmaWxlKTsNCj4+ICAgCWludCBmYmlkeCA9IGltaW5v
cihpbm9kZSk7DQo+PiBAQCAtNzU1LDEyICs3NTUsMTMgQEAgc3RhdGljIHN0cnVjdCBmYl9p
bmZvICpmaWxlX2ZiX2luZm8oc3RydWN0IGZpbGUgKmZpbGUpDQo+PiAgIAkJaW5mbyA9IE5V
TEw7DQo+PiAgIAlyZXR1cm4gaW5mbzsNCj4+ICAgfQ0KPj4gK0VYUE9SVF9TWU1CT0woZmJf
ZmlsZV9mYl9pbmZvKTsNCj4+ICAgDQo+PiAgIHN0YXRpYyBzc2l6ZV90DQo+PiAgIGZiX3Jl
YWQoc3RydWN0IGZpbGUgKmZpbGUsIGNoYXIgX191c2VyICpidWYsIHNpemVfdCBjb3VudCwg
bG9mZl90ICpwcG9zKQ0KPj4gICB7DQo+PiAgIAl1bnNpZ25lZCBsb25nIHAgPSAqcHBvczsN
Cj4+IC0Jc3RydWN0IGZiX2luZm8gKmluZm8gPSBmaWxlX2ZiX2luZm8oZmlsZSk7DQo+PiAr
CXN0cnVjdCBmYl9pbmZvICppbmZvID0gZmJfZmlsZV9mYl9pbmZvKGZpbGUpOw0KPj4gICAJ
dTggKmJ1ZmZlciwgKmRzdDsNCj4+ICAgCXU4IF9faW9tZW0gKnNyYzsNCj4+ICAgCWludCBj
LCBjbnQgPSAwLCBlcnIgPSAwOw0KPj4gQEAgLTgyNSw3ICs4MjYsNyBAQCBzdGF0aWMgc3Np
emVfdA0KPj4gICBmYl93cml0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3QgY2hhciBfX3Vz
ZXIgKmJ1Ziwgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpDQo+PiAgIHsNCj4+ICAgCXVu
c2lnbmVkIGxvbmcgcCA9ICpwcG9zOw0KPj4gLQlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IGZp
bGVfZmJfaW5mbyhmaWxlKTsNCj4+ICsJc3RydWN0IGZiX2luZm8gKmluZm8gPSBmYl9maWxl
X2ZiX2luZm8oZmlsZSk7DQo+PiAgIAl1OCAqYnVmZmVyLCAqc3JjOw0KPj4gICAJdTggX19p
b21lbSAqZHN0Ow0KPj4gICAJaW50IGMsIGNudCA9IDAsIGVyciA9IDA7DQo+PiBAQCAtMTE4
MSw3ICsxMTgyLDcgQEAgc3RhdGljIGxvbmcgZG9fZmJfaW9jdGwoc3RydWN0IGZiX2luZm8g
KmluZm8sIHVuc2lnbmVkIGludCBjbWQsDQo+PiAgIA0KPj4gICBzdGF0aWMgbG9uZyBmYl9p
b2N0bChzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZWQgbG9u
ZyBhcmcpDQo+PiAgIHsNCj4+IC0Jc3RydWN0IGZiX2luZm8gKmluZm8gPSBmaWxlX2ZiX2lu
Zm8oZmlsZSk7DQo+PiArCXN0cnVjdCBmYl9pbmZvICppbmZvID0gZmJfZmlsZV9mYl9pbmZv
KGZpbGUpOw0KPj4gICANCj4+ICAgCWlmICghaW5mbykNCj4+ICAgCQlyZXR1cm4gLUVOT0RF
VjsNCj4+IEBAIC0xMjkzLDcgKzEyOTQsNyBAQCBzdGF0aWMgaW50IGZiX2dldF9mc2NyZWVu
aW5mbyhzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgdW5zaWduZWQgaW50IGNtZCwNCj4+ICAgc3Rh
dGljIGxvbmcgZmJfY29tcGF0X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBp
bnQgY21kLA0KPj4gICAJCQkgICAgdW5zaWduZWQgbG9uZyBhcmcpDQo+PiAgIHsNCj4+IC0J
c3RydWN0IGZiX2luZm8gKmluZm8gPSBmaWxlX2ZiX2luZm8oZmlsZSk7DQo+PiArCXN0cnVj
dCBmYl9pbmZvICppbmZvID0gZmJfZmlsZV9mYl9pbmZvKGZpbGUpOw0KPj4gICAJY29uc3Qg
c3RydWN0IGZiX29wcyAqZmI7DQo+PiAgIAlsb25nIHJldCA9IC1FTk9JT0NUTENNRDsNCj4+
ICAgDQo+PiBAQCAtMTMzMyw3ICsxMzM0LDcgQEAgc3RhdGljIGxvbmcgZmJfY29tcGF0X2lv
Y3RsKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBpbnQgY21kLA0KPj4gICBzdGF0aWMg
aW50DQo+PiAgIGZiX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqIHZtYSkNCj4+ICAgew0KPj4gLQlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IGZpbGVf
ZmJfaW5mbyhmaWxlKTsNCj4+ICsJc3RydWN0IGZiX2luZm8gKmluZm8gPSBmYl9maWxlX2Zi
X2luZm8oZmlsZSk7DQo+PiAgIAlpbnQgKCpmYl9tbWFwX2ZuKShzdHJ1Y3QgZmJfaW5mbyAq
aW5mbywgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOw0KPj4gICAJdW5zaWduZWQgbG9u
ZyBtbWlvX3Bnb2ZmOw0KPj4gICAJdW5zaWduZWQgbG9uZyBzdGFydDsNCj4+IEBAIC0xNDM0
LDcgKzE0MzUsNyBAQCBmYl9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBm
aWxlICpmaWxlKQ0KPj4gICBfX2FjcXVpcmVzKCZpbmZvLT5sb2NrKQ0KPj4gICBfX3JlbGVh
c2VzKCZpbmZvLT5sb2NrKQ0KPj4gICB7DQo+PiAtCXN0cnVjdCBmYl9pbmZvICogY29uc3Qg
aW5mbyA9IGZpbGVfZmJfaW5mbyhmaWxlKTsNCj4+ICsJc3RydWN0IGZiX2luZm8gKiBjb25z
dCBpbmZvID0gZmJfZmlsZV9mYl9pbmZvKGZpbGUpOw0KPj4gICANCj4+ICAgCWlmICghaW5m
bykNCj4+ICAgCQlyZXR1cm4gLUVOT0RFVjsNCj4+IEBAIC0xNDUzLDggKzE0NTQsMTMgQEAg
dW5zaWduZWQgbG9uZyBnZXRfZmJfdW5tYXBwZWRfYXJlYShzdHJ1Y3QgZmlsZSAqZmlscCwN
Cj4+ICAgCQkJCSAgIHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBsZW4sDQo+
PiAgIAkJCQkgICB1bnNpZ25lZCBsb25nIHBnb2ZmLCB1bnNpZ25lZCBsb25nIGZsYWdzKQ0K
Pj4gICB7DQo+PiAtCXN0cnVjdCBmYl9pbmZvICogY29uc3QgaW5mbyA9IGZpbHAtPnByaXZh
dGVfZGF0YTsNCj4+IC0JdW5zaWduZWQgbG9uZyBmYl9zaXplID0gUEFHRV9BTElHTihpbmZv
LT5maXguc21lbV9sZW4pOw0KPj4gKwlzdHJ1Y3QgZmJfaW5mbyAqIGNvbnN0IGluZm8gPSBm
Yl9maWxlX2ZiX2luZm8oZmlscCk7DQo+PiArCXVuc2lnbmVkIGxvbmcgZmJfc2l6ZTsNCj4+
ICsNCj4+ICsJaWYgKCFpbmZvKQ0KPj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+PiArDQo+PiAr
CWZiX3NpemUgPSBQQUdFX0FMSUdOKGluZm8tPmZpeC5zbWVtX2xlbik7DQo+PiAgIA0KPj4g
ICAJaWYgKHBnb2ZmID4gZmJfc2l6ZSB8fCBsZW4gPiBmYl9zaXplIC0gcGdvZmYpDQo+PiAg
IAkJcmV0dXJuIC1FSU5WQUw7DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mYi5o
IGIvaW5jbHVkZS9saW51eC9mYi5oDQo+PiBpbmRleCA5YTc3YWI2MTVjMzYuLjMwMDRiOGI4
YzVjMiAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZmIuaA0KPj4gKysrIGIvaW5j
bHVkZS9saW51eC9mYi5oDQo+PiBAQCAtNjI0LDYgKzYyNCw3IEBAIGV4dGVybiBpbnQgZmJf
Z2V0X2NvbG9yX2RlcHRoKHN0cnVjdCBmYl92YXJfc2NyZWVuaW5mbyAqdmFyLA0KPj4gICAJ
CQkgICAgICBzdHJ1Y3QgZmJfZml4X3NjcmVlbmluZm8gKmZpeCk7DQo+PiAgIGV4dGVybiBp
bnQgZmJfZ2V0X29wdGlvbnMoY29uc3QgY2hhciAqbmFtZSwgY2hhciAqKm9wdGlvbik7DQo+
PiAgIGV4dGVybiBpbnQgZmJfbmV3X21vZGVsaXN0KHN0cnVjdCBmYl9pbmZvICppbmZvKTsN
Cj4+ICtleHRlcm4gc3RydWN0IGZiX2luZm8gKmZiX2ZpbGVfZmJfaW5mbyhzdHJ1Y3QgZmls
ZSAqZmlsZSk7DQo+PiAgIA0KPj4gICBleHRlcm4gc3RydWN0IGZiX2luZm8gKnJlZ2lzdGVy
ZWRfZmJbRkJfTUFYXTsNCj4+ICAgZXh0ZXJuIGludCBudW1fcmVnaXN0ZXJlZF9mYjsNCj4+
IC0tIA0KPj4gMi4zNS4xDQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------fVJCXKdhTJJnWaoYWTtZbIpw--

--------------TQ8dZrWjVi6qU8b2dTrGsp8a
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJyRu4FAwAAAAAACgkQlh/E3EQov+CY
JQ/9G0z3rrdjTIAjmyXbnhqqAI/q268jXmriZOdKySJ/5+RpwQ09fdkaj41pxs8KRi/TWIRHjk/V
fAAEFh1/w1sD3tKJg+hwNynliw7pEl8teu5XcCyohniiO6zx+dwkX+BkPu2DfREKTDKdw9NiYUvn
sVBKJOSET+cm0RUSnfAYAwkraRkSMcI500yMior3A12W3xGVhpa9Gop55vRVdG4fwFjJCCLp91ZC
9b+q6DTp0NDTsspYV9GMhICUjfyMKX3ZS4HQ2qinw4MW1S9xrk8XDgNP+tC8FXVYwB7oJhtk4qdO
HGyslgtU9bS4HAv4m8e6DVF4H+Wm5gz7mZjU1cyq6JSX4RsmXTP+bFuAnQ6BHgzfjEwwZ28wtCOq
WcVDiuMBk8B33mNUk0fvV+Mt6gCPOSxUX/PP2SE95qOuX5O5F7FnI887e3G+8yWEU4XRMkGXGO3J
FV+eoSYazzvvNfrf8Dy0Nf+EHFc8qeQjISjAcXJ4v6DhKtyxQUqW/UC2FTbYFk4By/syeFb0qLjQ
aeXuzNlE5z1364UsIdNtVf6x2kXWZgYZFMkTz5AqBh8F3no3inXejTzxzNmWp8qpkkoE2BPZwmMM
RQHF+nAXzew3trquRiNhjUT+cAEeeYDq/d7fOJBw7kuncvqiE0a5MrDCzT4E2yVALLNFSaWS7kyB
eIg=
=vbFR
-----END PGP SIGNATURE-----

--------------TQ8dZrWjVi6qU8b2dTrGsp8a--
