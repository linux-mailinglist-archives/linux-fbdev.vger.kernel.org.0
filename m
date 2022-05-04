Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4932051996C
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 May 2022 10:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240284AbiEDITI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 4 May 2022 04:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346120AbiEDITA (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 4 May 2022 04:19:00 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA01DE2;
        Wed,  4 May 2022 01:15:24 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id BBDB5210E5;
        Wed,  4 May 2022 08:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1651652122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rVWWGHOzolrc+/az6XFt7cVviGI0vZTQRhspSxlrGts=;
        b=aCWxQ3ZxERz8HMrLyjBL5gXH63GVy1ZptdhHvviisDU+EIm5Otai+27hh8DHya7fBJpkEt
        aJkTuj5waJtDboNTAU65PclBMJ2BzWas2r+Qov/AqAuU1vfQP5UKtJTmhAKArhSQrpWyKC
        SmBTRNizsJu8lEihChqMIxPpN2BpEyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1651652122;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rVWWGHOzolrc+/az6XFt7cVviGI0vZTQRhspSxlrGts=;
        b=qhYy86+BSbnlf5ZoX8NMt2p6WE/zKFzEdkxwYfn8ehV+hOyF4GdLPiMKDP9S325usN/XgI
        kVrpC42HQ0numIBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 91B3C132C4;
        Wed,  4 May 2022 08:15:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id bRduIho2cmJYZwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 04 May 2022 08:15:22 +0000
Message-ID: <d0555181-6e36-044c-b747-c08dbeb3a89e@suse.de>
Date:   Wed, 4 May 2022 10:15:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] fbdev: Use helper to get fb_info in all file
 operations
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
        Junxiao Chang <junxiao.chang@intel.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20220503201934.681276-1-javierm@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220503201934.681276-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GiKNHzNWX5u8RvfF15fb8F9T"
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
--------------GiKNHzNWX5u8RvfF15fb8F9T
Content-Type: multipart/mixed; boundary="------------1TSaT950kiKgi3Q8goSEfWZr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
 Junxiao Chang <junxiao.chang@intel.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Message-ID: <d0555181-6e36-044c-b747-c08dbeb3a89e@suse.de>
Subject: Re: [PATCH v2] fbdev: Use helper to get fb_info in all file
 operations
References: <20220503201934.681276-1-javierm@redhat.com>
In-Reply-To: <20220503201934.681276-1-javierm@redhat.com>

--------------1TSaT950kiKgi3Q8goSEfWZr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDUuMjIgdW0gMjI6MTkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEEgcmVmZXJlbmNlIHRvIHRoZSBmcmFtZWJ1ZmZlciBkZXZpY2Ugc3RydWN0
IGZiX2luZm8gaXMgc3RvcmVkIGluIHRoZSBmaWxlDQo+IHByaXZhdGUgZGF0YSwgYnV0IHRo
aXMgcmVmZXJlbmNlIGNvdWxkIG5vIGxvbmdlciBiZSB2YWxpZCBhbmQgbXVzdCBub3QgYmUN
Cj4gYWNjZXNzZWQgZGlyZWN0bHkuIEluc3RlYWQsIHRoZSBmaWxlX2ZiX2luZm8oKSBhY2Nl
c3NvciBmdW5jdGlvbiBtdXN0IGJlDQo+IHVzZWQgc2luY2UgaXQgZG9lcyBzYW5pdHkgY2hl
Y2tpbmcgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGZiX2luZm8gaXMgdmFsaWQuDQo+IA0KPiBU
aGlzIGNhbiBoYXBwZW4gZm9yIGV4YW1wbGUgaWYgdGhlIHJlZ2lzdGVyZWQgZnJhbWVidWZm
ZXIgZGV2aWNlIGlzIGZvciBhDQo+IGRyaXZlciB0aGF0IGp1c3QgdXNlcyBhIGZyYW1lYnVm
ZmVyIHByb3ZpZGVkIGJ5IHRoZSBzeXN0ZW0gZmlybXdhcmUuIEluDQo+IHRoYXQgY2FzZSwg
dGhlIGZiZGV2IGNvcmUgd291bGQgdW5yZWdpc3RlciB0aGUgZnJhbWVidWZmZXIgZGV2aWNl
IHdoZW4gYQ0KPiByZWFsIHZpZGVvIGRyaXZlciBpcyBwcm9iZWQgYW5kIGFzayB0byByZW1v
dmUgY29uZmxpY3RpbmcgZnJhbWVidWZmZXJzLg0KPiANCj4gTW9zdCBmYmRldiBmaWxlIG9w
ZXJhdGlvbnMgYWxyZWFkeSB1c2UgdGhlIGhlbHBlciB0byBnZXQgdGhlIGZiX2luZm8gYnV0
DQo+IGdldF9mYl91bm1hcHBlZF9hcmVhKCkgYW5kIGZiX2RlZmVycmVkX2lvX2ZzeW5jKCkg
ZG9uJ3QuIEZpeCB0aG9zZSB0d28uDQo+IA0KPiBTaW5jZSBmYl9kZWZlcnJlZF9pb19mc3lu
YygpIGlzIG5vdCBpbiBmYm1lbS5vLCB0aGUgaGVscGVyIGhhcyB0byBiZQ0KPiBleHBvcnRl
ZC4gUmVuYW1lIGl0IGFuZCBhZGQgYSBmYl8gcHJlZml4IHRvIGRlbm90ZSB0aGF0IGlzIHB1
YmxpYyBub3cuDQo+IA0KPiBSZXBvcnRlZC1ieTogSnVueGlhbyBDaGFuZyA8anVueGlhby5j
aGFuZ0BpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5p
bGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNClBsZWFzZSBzZWUgbXkgY29tbWVudCBi
ZWxvdy4NCg0KPiAtLS0NCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gRml4IGNvcHkgJiBw
YXN0ZSBlcnJvciBwYXNzaW5nIGZpbGUtPnByaXZhdGVfZGF0YSBpbnN0ZWFkIG9mIGZpbGUN
Cj4gICAgdG8gZmJfZmlsZV9mYl9pbmZvKCkgZnVuY3Rpb24gKFNhbSBSYXZuYm9yZykuDQo+
IA0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jIHwgIDUgKysrKy0N
Cj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyAgICB8IDI0ICsrKysrKysr
KysrKysrKy0tLS0tLS0tLQ0KPiAgIGluY2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAg
ICAgIHwgIDEgKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZiX2RlZmlvLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVmaW8uYw0K
PiBpbmRleCA4NDJjNjZiM2UzM2QuLmNjZGY5MDNjNDhiZCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMNCj4gKysrIGIvZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2ZiX2RlZmlvLmMNCj4gQEAgLTY4LDEyICs2OCwxNSBAQCBzdGF0aWMg
dm1fZmF1bHRfdCBmYl9kZWZlcnJlZF9pb19mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikN
Cj4gICANCj4gICBpbnQgZmJfZGVmZXJyZWRfaW9fZnN5bmMoc3RydWN0IGZpbGUgKmZpbGUs
IGxvZmZfdCBzdGFydCwgbG9mZl90IGVuZCwgaW50IGRhdGFzeW5jKQ0KPiAgIHsNCj4gLQlz
dHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IGZpbGUtPnByaXZhdGVfZGF0YTsNCj4gKwlzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbyA9IGZiX2ZpbGVfZmJfaW5mbyhmaWxlKTsNCj4gICAJc3RydWN0IGlu
b2RlICppbm9kZSA9IGZpbGVfaW5vZGUoZmlsZSk7DQo+ICAgCWludCBlcnIgPSBmaWxlX3dy
aXRlX2FuZF93YWl0X3JhbmdlKGZpbGUsIHN0YXJ0LCBlbmQpOw0KPiAgIAlpZiAoZXJyKQ0K
PiAgIAkJcmV0dXJuIGVycjsNCj4gICANCj4gKwlpZiAoIWluZm8pDQo+ICsJCXJldHVybiAt
RU5PREVWOw0KPiArDQoNClRoaXMgaXMgY29uc2lzdGVudCB3aXRoIG90aGVyIGZ1bmN0aW9u
cywgYnV0IGl0J3MgcHJvYmFibHkgbm90IHRoZSANCmNvcnJlY3QgZXJybm8gY29kZS4gSXQg
bWVhbnMgdGhhdCBhIGRldmljZSBpcyBub3QgYXZhaWxhYmxlIGZvciBvcGVuaW5nLg0KDQpC
dXQgdGhlIHNpdHVhdGlvbiBoZXJlIGlzIHJhdGhlciBhcyB3aXRoIGNsb3NlKCkgb24gYSAN
CmRpc2Nvbm5lY3RlZC1uZXR3b3JrIGZpbGUuIFRoZSBjYWxsIHRvIGNsb3NlKCkgcmV0dXJu
cyBFSU8gaW4gdGhpcyBjYXNlLiANCk1heWJlIHdlIHNob3VsZCBjb25zaWRlciBjaGFuZ2lu
ZyB0aGlzIGluIGEgc2VwYXJhdGUgcGF0Y2guDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gICAJLyogU2tpcCBpZiBkZWZlcnJlZCBpbyBpcyBjb21waWxlZC1pbiBidXQgZGlzYWJs
ZWQgb24gdGhpcyBmYmRldiAqLw0KPiAgIAlpZiAoIWluZm8tPmZiZGVmaW8pDQo+ICAgCQly
ZXR1cm4gMDsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1l
bS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMNCj4gaW5kZXggOTdlYjBk
ZWU0MTFjLi5iYTJjMTRhMTA4N2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYm1lbS5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1l
bS5jDQo+IEBAIC03NDUsNyArNzQ1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzZXFfb3Bl
cmF0aW9ucyBfX21heWJlX3VudXNlZCBwcm9jX2ZiX3NlcV9vcHMgPSB7DQo+ICAgICogU28g
bG9vayB1cCB0aGUgZmJfaW5mbyB1c2luZyB0aGUgaW5vZGUgbWlub3IgbnVtYmVyLA0KPiAg
ICAqIGFuZCBqdXN0IHZlcmlmeSBpdCBhZ2FpbnN0IHRoZSByZWZlcmVuY2Ugd2UgaGF2ZS4N
Cj4gICAgKi8NCj4gLXN0YXRpYyBzdHJ1Y3QgZmJfaW5mbyAqZmlsZV9mYl9pbmZvKHN0cnVj
dCBmaWxlICpmaWxlKQ0KPiArc3RydWN0IGZiX2luZm8gKmZiX2ZpbGVfZmJfaW5mbyhzdHJ1
Y3QgZmlsZSAqZmlsZSkNCj4gICB7DQo+ICAgCXN0cnVjdCBpbm9kZSAqaW5vZGUgPSBmaWxl
X2lub2RlKGZpbGUpOw0KPiAgIAlpbnQgZmJpZHggPSBpbWlub3IoaW5vZGUpOw0KPiBAQCAt
NzU1LDEyICs3NTUsMTMgQEAgc3RhdGljIHN0cnVjdCBmYl9pbmZvICpmaWxlX2ZiX2luZm8o
c3RydWN0IGZpbGUgKmZpbGUpDQo+ICAgCQlpbmZvID0gTlVMTDsNCj4gICAJcmV0dXJuIGlu
Zm87DQo+ICAgfQ0KPiArRVhQT1JUX1NZTUJPTChmYl9maWxlX2ZiX2luZm8pOw0KPiAgIA0K
PiAgIHN0YXRpYyBzc2l6ZV90DQo+ICAgZmJfcmVhZChzdHJ1Y3QgZmlsZSAqZmlsZSwgY2hh
ciBfX3VzZXIgKmJ1Ziwgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpDQo+ICAgew0KPiAg
IAl1bnNpZ25lZCBsb25nIHAgPSAqcHBvczsNCj4gLQlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9
IGZpbGVfZmJfaW5mbyhmaWxlKTsNCj4gKwlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IGZiX2Zp
bGVfZmJfaW5mbyhmaWxlKTsNCj4gICAJdTggKmJ1ZmZlciwgKmRzdDsNCj4gICAJdTggX19p
b21lbSAqc3JjOw0KPiAgIAlpbnQgYywgY250ID0gMCwgZXJyID0gMDsNCj4gQEAgLTgyNSw3
ICs4MjYsNyBAQCBzdGF0aWMgc3NpemVfdA0KPiAgIGZiX3dyaXRlKHN0cnVjdCBmaWxlICpm
aWxlLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLCBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBv
cykNCj4gICB7DQo+ICAgCXVuc2lnbmVkIGxvbmcgcCA9ICpwcG9zOw0KPiAtCXN0cnVjdCBm
Yl9pbmZvICppbmZvID0gZmlsZV9mYl9pbmZvKGZpbGUpOw0KPiArCXN0cnVjdCBmYl9pbmZv
ICppbmZvID0gZmJfZmlsZV9mYl9pbmZvKGZpbGUpOw0KPiAgIAl1OCAqYnVmZmVyLCAqc3Jj
Ow0KPiAgIAl1OCBfX2lvbWVtICpkc3Q7DQo+ICAgCWludCBjLCBjbnQgPSAwLCBlcnIgPSAw
Ow0KPiBAQCAtMTE4MSw3ICsxMTgyLDcgQEAgc3RhdGljIGxvbmcgZG9fZmJfaW9jdGwoc3Ry
dWN0IGZiX2luZm8gKmluZm8sIHVuc2lnbmVkIGludCBjbWQsDQo+ICAgDQo+ICAgc3RhdGlj
IGxvbmcgZmJfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsIHVu
c2lnbmVkIGxvbmcgYXJnKQ0KPiAgIHsNCj4gLQlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IGZp
bGVfZmJfaW5mbyhmaWxlKTsNCj4gKwlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IGZiX2ZpbGVf
ZmJfaW5mbyhmaWxlKTsNCj4gICANCj4gICAJaWYgKCFpbmZvKQ0KPiAgIAkJcmV0dXJuIC1F
Tk9ERVY7DQo+IEBAIC0xMjkzLDcgKzEyOTQsNyBAQCBzdGF0aWMgaW50IGZiX2dldF9mc2Ny
ZWVuaW5mbyhzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgdW5zaWduZWQgaW50IGNtZCwNCj4gICBz
dGF0aWMgbG9uZyBmYl9jb21wYXRfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVk
IGludCBjbWQsDQo+ICAgCQkJICAgIHVuc2lnbmVkIGxvbmcgYXJnKQ0KPiAgIHsNCj4gLQlz
dHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IGZpbGVfZmJfaW5mbyhmaWxlKTsNCj4gKwlzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbyA9IGZiX2ZpbGVfZmJfaW5mbyhmaWxlKTsNCj4gICAJY29uc3Qgc3Ry
dWN0IGZiX29wcyAqZmI7DQo+ICAgCWxvbmcgcmV0ID0gLUVOT0lPQ1RMQ01EOw0KPiAgIA0K
PiBAQCAtMTMzMyw3ICsxMzM0LDcgQEAgc3RhdGljIGxvbmcgZmJfY29tcGF0X2lvY3RsKHN0
cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBpbnQgY21kLA0KPiAgIHN0YXRpYyBpbnQNCj4g
ICBmYl9tbWFwKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiB2
bWEpDQo+ICAgew0KPiAtCXN0cnVjdCBmYl9pbmZvICppbmZvID0gZmlsZV9mYl9pbmZvKGZp
bGUpOw0KPiArCXN0cnVjdCBmYl9pbmZvICppbmZvID0gZmJfZmlsZV9mYl9pbmZvKGZpbGUp
Ow0KPiAgIAlpbnQgKCpmYl9tbWFwX2ZuKShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEpOw0KPiAgIAl1bnNpZ25lZCBsb25nIG1taW9fcGdvZmY7
DQo+ICAgCXVuc2lnbmVkIGxvbmcgc3RhcnQ7DQo+IEBAIC0xNDM0LDcgKzE0MzUsNyBAQCBm
Yl9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlKQ0KPiAg
IF9fYWNxdWlyZXMoJmluZm8tPmxvY2spDQo+ICAgX19yZWxlYXNlcygmaW5mby0+bG9jaykN
Cj4gICB7DQo+IC0Jc3RydWN0IGZiX2luZm8gKiBjb25zdCBpbmZvID0gZmlsZV9mYl9pbmZv
KGZpbGUpOw0KPiArCXN0cnVjdCBmYl9pbmZvICogY29uc3QgaW5mbyA9IGZiX2ZpbGVfZmJf
aW5mbyhmaWxlKTsNCj4gICANCj4gICAJaWYgKCFpbmZvKQ0KPiAgIAkJcmV0dXJuIC1FTk9E
RVY7DQo+IEBAIC0xNDUzLDggKzE0NTQsMTMgQEAgdW5zaWduZWQgbG9uZyBnZXRfZmJfdW5t
YXBwZWRfYXJlYShzdHJ1Y3QgZmlsZSAqZmlscCwNCj4gICAJCQkJICAgdW5zaWduZWQgbG9u
ZyBhZGRyLCB1bnNpZ25lZCBsb25nIGxlbiwNCj4gICAJCQkJICAgdW5zaWduZWQgbG9uZyBw
Z29mZiwgdW5zaWduZWQgbG9uZyBmbGFncykNCj4gICB7DQo+IC0Jc3RydWN0IGZiX2luZm8g
KiBjb25zdCBpbmZvID0gZmlscC0+cHJpdmF0ZV9kYXRhOw0KPiAtCXVuc2lnbmVkIGxvbmcg
ZmJfc2l6ZSA9IFBBR0VfQUxJR04oaW5mby0+Zml4LnNtZW1fbGVuKTsNCj4gKwlzdHJ1Y3Qg
ZmJfaW5mbyAqIGNvbnN0IGluZm8gPSBmYl9maWxlX2ZiX2luZm8oZmlscCk7DQo+ICsJdW5z
aWduZWQgbG9uZyBmYl9zaXplOw0KPiArDQo+ICsJaWYgKCFpbmZvKQ0KPiArCQlyZXR1cm4g
LUVOT0RFVjsNCj4gKw0KPiArCWZiX3NpemUgPSBQQUdFX0FMSUdOKGluZm8tPmZpeC5zbWVt
X2xlbik7DQo+ICAgDQo+ICAgCWlmIChwZ29mZiA+IGZiX3NpemUgfHwgbGVuID4gZmJfc2l6
ZSAtIHBnb2ZmKQ0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2ZiLmggYi9pbmNsdWRlL2xpbnV4L2ZiLmgNCj4gaW5kZXggOWE3N2FiNjE1
YzM2Li4zMDA0YjhiOGM1YzIgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvZmIuaA0K
PiArKysgYi9pbmNsdWRlL2xpbnV4L2ZiLmgNCj4gQEAgLTYyNCw2ICs2MjQsNyBAQCBleHRl
cm4gaW50IGZiX2dldF9jb2xvcl9kZXB0aChzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8gKnZh
ciwNCj4gICAJCQkgICAgICBzdHJ1Y3QgZmJfZml4X3NjcmVlbmluZm8gKmZpeCk7DQo+ICAg
ZXh0ZXJuIGludCBmYl9nZXRfb3B0aW9ucyhjb25zdCBjaGFyICpuYW1lLCBjaGFyICoqb3B0
aW9uKTsNCj4gICBleHRlcm4gaW50IGZiX25ld19tb2RlbGlzdChzdHJ1Y3QgZmJfaW5mbyAq
aW5mbyk7DQo+ICtleHRlcm4gc3RydWN0IGZiX2luZm8gKmZiX2ZpbGVfZmJfaW5mbyhzdHJ1
Y3QgZmlsZSAqZmlsZSk7DQo+ICAgDQo+ICAgZXh0ZXJuIHN0cnVjdCBmYl9pbmZvICpyZWdp
c3RlcmVkX2ZiW0ZCX01BWF07DQo+ICAgZXh0ZXJuIGludCBudW1fcmVnaXN0ZXJlZF9mYjsN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------1TSaT950kiKgi3Q8goSEfWZr--

--------------GiKNHzNWX5u8RvfF15fb8F9T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJyNhoFAwAAAAAACgkQlh/E3EQov+AS
og/9FKRqad07tiPTp3+i/DQ/g30Ihh6ESlVOsR8VoB+aXdmZ+ImgHn3vNEzdl1vsDtGqRWw6rxSN
CdpkxtVWHdO0FET7q0SIbrLVJtarggUh2TLGfxWf2/DLWz6G+brsWcvkUPoO1s+iNm4MpHWF3RAO
odH+CpuOnZ7fxH6ZWlN574Kp33Hwl7XdyQ8YaeQdVIZTaohNJ+h+NbtPX/uCcejdpZvdu4RhPQgU
+Al1ja3y+hpKzjW91hspyCB5MT/TZapUj+F//2vsRqRaQpngL200hTmHJjG/AM2cHulWJYE9+G/d
zLTeluH0bxc1Ke3htUO4ZB4CCFtYL0BEjrKgwTwa4JB9/C2WW1+cGtYTPprgHGLwr3kuaSZB9gt2
UqhiYjV1g4eM8w6bmQTq1qT146mJKY6pY0RIt8UQQVnFgyIjdJDq1SfEIAeLPThcJagDw+x5TXAi
yc3yN+p/lFmhrURNa14iKhBSYqUQ2hD8jeSdatDHhbPrxea0JfOFqt94pCsPEItGrzD+pJGXhv4g
ibbs89mP5DGz4p7Q0nXcvh4LS2rAbU3cS8RcaU5F4CjJR3hOuY5+slePw9e+s3L9bph4AVfgt1oK
qIeme5kZGKyN/fjXYVObVTwszZ1x1KTB9lLvDpcXu01RuF6zBlSyYcDjMbsVyquobewWovkUFmkp
tI0=
=5Fcr
-----END PGP SIGNATURE-----

--------------GiKNHzNWX5u8RvfF15fb8F9T--
