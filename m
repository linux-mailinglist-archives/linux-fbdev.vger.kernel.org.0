Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82174AF21C
	for <lists+linux-fbdev@lfdr.de>; Wed,  9 Feb 2022 13:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbiBIMvh (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 9 Feb 2022 07:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiBIMve (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 9 Feb 2022 07:51:34 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B42FC0613CA;
        Wed,  9 Feb 2022 04:51:36 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id F1BA821106;
        Wed,  9 Feb 2022 12:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644411095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=b9UHe93tgNYnspqm08cX6wI5H+KF88pVVMNLdtASdnU=;
        b=lBuJiayWjZUajss65SPZVX9C5+Gb2e9jMmW9oQpIY7XJ8TKpFCekids3E7V1PMffJHYEZq
        Z3CKj4kp6HuBL4R9B27wgZTtcyUK1f8Q+PI6w/0LFpttkwqkvY/W9BZyL482LWrvJtdxGu
        qdTN+cTapeukfpU6KIZf2EmUhQhsoHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644411095;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=b9UHe93tgNYnspqm08cX6wI5H+KF88pVVMNLdtASdnU=;
        b=gTjc0fzmGkZimAStgbut645/iPBLoblVVuZy3tZaof4Q0vayLWF8CDH/MYKzZlMgLhslaF
        L1yZ1JgoVBCPFkBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B86D113D2F;
        Wed,  9 Feb 2022 12:51:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id llomLNa4A2I1NAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 09 Feb 2022 12:51:34 +0000
Message-ID: <6df9c28d-968d-ff16-988e-8e88e4734e49@suse.de>
Date:   Wed, 9 Feb 2022 13:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/7] drm/format-helper: Add drm_fb_{xrgb8888,
 gray8}_to_mono_reversed()
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-3-javierm@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220209090314.2511959-3-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YGZ0GQbF7oDY0dWSVnCpC2js"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YGZ0GQbF7oDY0dWSVnCpC2js
Content-Type: multipart/mixed; boundary="------------Qnltmz2sNMWw7XQRlEOHhRJ8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <maxime@cerno.tech>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <6df9c28d-968d-ff16-988e-8e88e4734e49@suse.de>
Subject: Re: [PATCH v3 2/7] drm/format-helper: Add drm_fb_{xrgb8888,
 gray8}_to_mono_reversed()
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-3-javierm@redhat.com>
In-Reply-To: <20220209090314.2511959-3-javierm@redhat.com>

--------------Qnltmz2sNMWw7XQRlEOHhRJ8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDIuMjIgdW0gMTA6MDMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEFkZCBzdXBwb3J0IHRvIGNvbnZlcnQgWFIyNCBhbmQgOC1iaXQgZ3JheXNj
YWxlIHRvIHJldmVyc2VkIG1vbm9jaHJvbWUgZm9yDQo+IGRyaXZlcnMgdGhhdCBjb250cm9s
IG1vbm9jaHJvbWF0aWMgcGFuZWxzLCB0aGF0IG9ubHkgaGF2ZSAxIGJpdCBwZXIgcGl4ZWwu
DQo+IA0KPiBUaGUgZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2ZXJzZWQoKSBoZWxwZXIgd2Fz
IGJhc2VkIG9uIHRoZSBmdW5jdGlvbiB0aGF0DQo+IGRvZXMgdGhlIHNhbWUgaW4gdGhlIGRy
aXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYyBkcml2ZXIuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4g
LS0tDQo+IA0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIEFsc28gYWRkIGEgZHJtX2ZiX3hyZ2I4
ODg4X3RvX21vbm9fcmV2ZXJzZWQoKSBoZWxwZXIgKFRob21hcyBaaW1tZXJtYW5uKQ0KPiAt
IFNwbGl0IGxpbmVzIGNvcHkgdG8gZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2ZXJzZWRfbGlu
ZSgpIChUaG9tYXMgWmltbWVybWFubikNCj4gLSBIYW5kbGUgY2FzZSB3aGVyZSB0aGUgc291
cmNlIGJ1ZmZlciBpcyBub3QgYWxpZ25lZCB0byA4IChUaG9tYXMgWmltbWVybWFubikNCj4g
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMgfCAxNTcgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiAgIGluY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVs
cGVyLmggICAgIHwgICA4ICsrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNjUgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMNCj4gaW5kZXgg
Yjk4MTcxMjYyM2QzLi4xOTcxMDM0MmMwZGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Zm9ybWF0X2hlbHBlci5jDQo+IEBAIC01OTEsMyArNTkxLDE2MCBAQCBpbnQgZHJtX2ZiX2Js
aXRfdG9pbyh2b2lkIF9faW9tZW0gKmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwgdWlu
dDMyX3QgZHN0X2Zvcg0KPiAgIAlyZXR1cm4gLUVJTlZBTDsNCj4gICB9DQo+ICAgRVhQT1JU
X1NZTUJPTChkcm1fZmJfYmxpdF90b2lvKTsNCj4gKw0KPiArc3RhdGljIHZvaWQgZHJtX2Zi
X2dyYXk4X3RvX21vbm9fcmV2ZXJzZWRfbGluZSh1OCAqZHN0LCBjb25zdCB1OCAqc3JjLCB1
bnNpZ25lZCBpbnQgcGl4ZWxzLA0KPiArCQkJCQkgICAgICAgdW5zaWduZWQgaW50IHN0YXJ0
X29mZnNldCwgdW5zaWduZWQgaW50IGVuZF9vZmZzZXQpDQo+ICt7DQo+ICsJdW5zaWduZWQg
aW50IHhiLCBpOw0KPiArDQo+ICsJZm9yICh4YiA9IDA7IHhiIDwgcGl4ZWxzOyB4YisrKSB7
DQo+ICsJCXVuc2lnbmVkIGludCBzdGFydCA9IDAsIGVuZCA9IDg7DQo+ICsJCXU4IGJ5dGUg
PSAweDAwOw0KPiArDQo+ICsJCWlmICh4YiA9PSAwICYmIHN0YXJ0X29mZnNldCkNCj4gKwkJ
CXN0YXJ0ID0gc3RhcnRfb2Zmc2V0Ow0KPiArDQo+ICsJCWlmICh4YiA9PSBwaXhlbHMgLSAx
ICYmIGVuZF9vZmZzZXQpDQo+ICsJCQllbmQgPSBlbmRfb2Zmc2V0Ow0KDQplbmRfb2Zmc2V0
IHNob3VsZCBiZSBjYWxsZWQgZW5kX2xlbiwgYmVjYXVzZSBpdCBpcyB0aGUgbnVtYmVyIG9m
IGJpdHMgaW4NCnRoZSBmaW5hbCBieXRlOyBidXQgbm90IHRoZSBvZmZzZXQgb2YgdGhlIGZp
bmFsIGJpdC4NCg0KPiArDQo+ICsJCWZvciAoaSA9IHN0YXJ0OyBpIDwgZW5kOyBpKyspIHsN
Cj4gKwkJCXVuc2lnbmVkIGludCB4ID0geGIgKiA4ICsgaTsNCj4gKw0KPiArCQkJYnl0ZSA+
Pj0gMTsNCj4gKwkJCWlmIChzcmNbeF0gPj4gNykNCj4gKwkJCQlieXRlIHw9IEJJVCg3KTsN
Cj4gKwkJfQ0KPiArCQkqZHN0KysgPSBieXRlOw0KPiArCX0NCj4gK30NCj4gKw0KPiArLyoq
DQo+ICsgKiBkcm1fZmJfZ3JheThfdG9fbW9ub19yZXZlcnNlZCAtIENvbnZlcnQgZ3JheXNj
YWxlIHRvIHJldmVyc2VkIG1vbm9jaHJvbWUNCj4gKyAqIEBkc3Q6IHJldmVyc2VkIG1vbm9j
aHJvbWUgZGVzdGluYXRpb24gYnVmZmVyDQo+ICsgKiBAZHN0X3BpdGNoOiBOdW1iZXIgb2Yg
Ynl0ZXMgYmV0d2VlbiB0d28gY29uc2VjdXRpdmUgc2NhbmxpbmVzIHdpdGhpbiBkc3QNCj4g
KyAqIEBzcmM6IDgtYml0IGdyYXlzY2FsZSBzb3VyY2UgYnVmZmVyDQo+ICsgKiBAZmI6IERS
TSBmcmFtZWJ1ZmZlcg0KPiArICogQGNsaXA6IENsaXAgcmVjdGFuZ2xlIGFyZWEgdG8gY29w
eQ0KPiArICoNCj4gKyAqIERSTSBkb2Vzbid0IGhhdmUgbmF0aXZlIG1vbm9jaHJvbWUgb3Ig
Z3JheXNjYWxlIHN1cHBvcnQuDQo+ICsgKiBTdWNoIGRyaXZlcnMgY2FuIGFubm91bmNlIHRo
ZSBjb21tb25seSBzdXBwb3J0ZWQgWFIyNCBmb3JtYXQgdG8gdXNlcnNwYWNlDQo+ICsgKiBh
bmQgdXNlIGRybV9mYl94cmdiODg4OF90b19ncmF5OCgpIHRvIGNvbnZlcnQgdG8gZ3JheXNj
YWxlIGFuZCB0aGVuIHRoaXMNCj4gKyAqIGhlbHBlciBmdW5jdGlvbiB0byBjb252ZXJ0IHRv
IHRoZSBuYXRpdmUgZm9ybWF0Lg0KPiArICovDQo+ICt2b2lkIGRybV9mYl9ncmF5OF90b19t
b25vX3JldmVyc2VkKHZvaWQgKmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwgY29uc3Qg
dm9pZCAqdmFkZHIsDQo+ICsJCQkJICAgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAq
ZmIsDQo+ICsJCQkJICAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKQ0KPiArew0KPiAr
DQo+ICsJdW5zaWduZWQgaW50IGxpbmVwaXhlbHMgPSBkcm1fcmVjdF93aWR0aChjbGlwKTsN
Cj4gKwl1bnNpZ25lZCBpbnQgbGluZXMgPSBkcm1fcmVjdF9oZWlnaHQoY2xpcCk7DQo+ICsJ
dW5zaWduZWQgaW50IHN0YXJ0X29mZnNldCwgZW5kX29mZnNldDsNCj4gKwl1bnNpZ25lZCBp
bnQgeTsNCj4gKwljb25zdCB1OCAqZ3JheTggPSB2YWRkcjsNCj4gKwl1OCAqbW9ubyA9IGRz
dDsNCj4gKw0KPiArCS8qDQo+ICsJICogVGhlIHJldmVyc2VkIG1vbm8gZGVzdGluYXRpb24g
YnVmZmVyIGNvbnRhaW5zIDEgYml0IHBlciBwaXhlbA0KPiArCSAqIGFuZCBkZXN0aW5hdGlv
biBzY2FubGluZXMgaGF2ZSB0byBiZSBpbiBtdWx0aXBsZSBvZiA4IHBpeGVscy4NCj4gKwkg
Ki8NCj4gKwlpZiAoIWRzdF9waXRjaCkNCj4gKwkJZHN0X3BpdGNoID0gRElWX1JPVU5EX1VQ
KGxpbmVwaXhlbHMsIDgpOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBGb3IgZGFtYWdlIGhhbmRs
aW5nLCBpdCBpcyBwb3NzaWJsZSB0aGF0IG9ubHkgcGFydHMgb2YgdGhlIHNvdXJjZQ0KPiAr
CSAqIGJ1ZmZlciBpcyBjb3BpZWQgYW5kIHRoaXMgY291bGQgbGVhZCB0byBzdGFydCBhbmQg
ZW5kIHBpeGVscyB0aGF0DQo+ICsJICogYXJlIG5vdCBhbGlnbmVkIHRvIG11bHRpcGxlIG9m
IDguDQo+ICsJICoNCj4gKwkgKiBDYWxjdWxhdGUgaWYgdGhlIHN0YXJ0IGFuZCBlbmQgcGl4
ZWxzIGFyZSBub3QgYWxpZ25lZCBhbmQgc2V0IHRoZQ0KPiArCSAqIG9mZnNldHMgZm9yIHRo
ZSByZXZlcnNlZCBtb25vIGxpbmUgY29udmVyc2lvbiBmdW5jdGlvbiB0byBhZGp1c3QuDQo+
ICsJICovDQo+ICsJc3RhcnRfb2Zmc2V0ID0gY2xpcC0+eDEgJSA4Ow0KPiArCWVuZF9vZmZz
ZXQgPSBjbGlwLT54MiAlIDg7DQo+ICsNCj4gKwlmb3IgKHkgPSAwOyB5IDwgbGluZXM7IHkr
Kykgew0KPiArCQlkcm1fZmJfZ3JheThfdG9fbW9ub19yZXZlcnNlZF9saW5lKG1vbm8sIGdy
YXk4LCBkc3RfcGl0Y2gsDQo+ICsJCQkJCQkgICBzdGFydF9vZmZzZXQsIGVuZF9vZmZzZXQp
Ow0KPiArCQlncmF5OCArPSBmYi0+cGl0Y2hlc1swXTsNCj4gKwkJbW9ubyArPSBkc3RfcGl0
Y2g7DQo+ICsJfQ0KPiArfQ0KDQpEbyB5b3UgcmVhbGx5IG5lZWQgdGhhdCBmdW5jdGlvbi4g
SXQncyBub3QgZXhwb3J0ZWQgYW5kIGlmIGl0J3Mgbm90IA0Kb3RoZXJ3aXNlIHVzZWQsIEkn
ZCBqdXN0IHJlbW92ZSBpdC4gIFdlIGRvbid0IGtlZXAgdW51c2VkIGludGVyZmFjZXMgYXJv
dW5kLg0KDQo+ICsNCj4gKy8qKg0KPiArICogZHJtX2ZiX3hyZ2I4ODg4X3RvX21vbm9fcmV2
ZXJzZWQgLSBDb252ZXJ0IFhSR0I4ODg4IHRvIHJldmVyc2VkIG1vbm9jaHJvbWUNCj4gKyAq
IEBkc3Q6IHJldmVyc2VkIG1vbm9jaHJvbWUgZGVzdGluYXRpb24gYnVmZmVyDQo+ICsgKiBA
ZHN0X3BpdGNoOiBOdW1iZXIgb2YgYnl0ZXMgYmV0d2VlbiB0d28gY29uc2VjdXRpdmUgc2Nh
bmxpbmVzIHdpdGhpbiBkc3QNCj4gKyAqIEBzcmM6IFhSR0I4ODg4IHNvdXJjZSBidWZmZXIN
Cj4gKyAqIEBmYjogRFJNIGZyYW1lYnVmZmVyDQo+ICsgKiBAY2xpcDogQ2xpcCByZWN0YW5n
bGUgYXJlYSB0byBjb3B5DQo+ICsgKg0KPiArICogRFJNIGRvZXNuJ3QgaGF2ZSBuYXRpdmUg
bW9ub2Nocm9tZSBzdXBwb3J0Lg0KPiArICogU3VjaCBkcml2ZXJzIGNhbiBhbm5vdW5jZSB0
aGUgY29tbW9ubHkgc3VwcG9ydGVkIFhSMjQgZm9ybWF0IHRvIHVzZXJzcGFjZQ0KPiArICog
YW5kIHVzZSB0aGlzIGZ1bmN0aW9uIHRvIGNvbnZlcnQgdG8gdGhlIG5hdGl2ZSBmb3JtYXQu
DQo+ICsgKg0KPiArICogVGhpcyBmdW5jdGlvbiB1c2VzIGRybV9mYl94cmdiODg4OF90b19n
cmF5OCgpIHRvIGNvbnZlcnQgdG8gZ3JheXNjYWxlIGFuZA0KPiArICogdGhlbiB0aGUgcmVz
dWx0IGlzIGNvbnZlcnRlZCBmcm9tIGdyYXlzY2FsZSB0byByZXZlcnNlZCBtb25vaHJvbWUu
DQo+ICsgKi8NCj4gK3ZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX21vbm9fcmV2ZXJzZWQodm9p
ZCAqZHN0LCB1bnNpZ25lZCBpbnQgZHN0X3BpdGNoLCBjb25zdCB2b2lkICp2YWRkciwNCj4g
KwkJCQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwgY29uc3Qgc3Ry
dWN0IGRybV9yZWN0ICpjbGlwKQ0KPiArew0KPiArCXVuc2lnbmVkIGludCBsaW5lcGl4ZWxz
ID0gZHJtX3JlY3Rfd2lkdGgoY2xpcCk7DQo+ICsJdW5zaWduZWQgaW50IGxpbmVzID0gY2xp
cC0+eTIgLSBjbGlwLT55MTsNCj4gKwl1bnNpZ25lZCBpbnQgY3BwID0gZmItPmZvcm1hdC0+
Y3BwWzBdOw0KPiArCXVuc2lnbmVkIGludCBsZW5fc3JjMzIgPSBsaW5lcGl4ZWxzICogY3Bw
Ow0KPiArCXVuc2lnbmVkIGludCBzdGFydF9vZmZzZXQsIGVuZF9vZmZzZXQ7DQo+ICsJdW5z
aWduZWQgaW50IHk7DQo+ICsJdTggKm1vbm8gPSBkc3QsICpncmF5ODsNCj4gKwl1MzIgKnNy
YzMyOw0KPiArDQo+ICsJaWYgKFdBUk5fT04oZmItPmZvcm1hdC0+Zm9ybWF0ICE9IERSTV9G
T1JNQVRfWFJHQjg4ODgpKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwkvKg0KPiArCSAqIFRo
ZSByZXZlcnNlZCBtb25vIGRlc3RpbmF0aW9uIGJ1ZmZlciBjb250YWlucyAxIGJpdCBwZXIg
cGl4ZWwNCj4gKwkgKiBhbmQgZGVzdGluYXRpb24gc2NhbmxpbmVzIGhhdmUgdG8gYmUgaW4g
bXVsdGlwbGUgb2YgOCBwaXhlbHMuDQo+ICsJICovDQo+ICsJaWYgKCFkc3RfcGl0Y2gpDQo+
ICsJCWRzdF9waXRjaCA9IERJVl9ST1VORF9VUChsaW5lcGl4ZWxzLCA4KTsNCg0KSSdkIGRv
IGEgd2Fybl9vbmNlIGlmIChkc3RfcGl0Y2ggJSA4ICE9IDApLg0KDQoNCj4gKw0KPiArCS8q
DQo+ICsJICogVGhlIGNtYSBtZW1vcnkgaXMgd3JpdGUtY29tYmluZWQgc28gcmVhZHMgYXJl
IHVuY2FjaGVkLg0KPiArCSAqIFNwZWVkIHVwIGJ5IGZldGNoaW5nIG9uZSBsaW5lIGF0IGEg
dGltZS4NCg0KSSBvbmNlIGhhZCBhIHBhdGNoc2V0IHRoYXQgYWRkcyBjYWNoaW5nIGluZm9y
bWF0aW9uIHRvIHN0cnVjdCANCmRtYV9idWZfbWFwIChzb29uIHRvIGJlIG5hbWVkIHN0cnVj
dCBpb3N5c19tYXApLiAgQmxpdHRpbmcgaGVscGVycyB3b3VsZCANCmJlIGFibGUgdG8gZW5h
YmxlL2Rpc2FibGUgdGhpcyBvcHRpbWl6YXRpb24gYXMgbmVlZGVkLg0KDQpIb3dldmVyLCB5
b3VyIGRyaXZlciBkb2Vzbid0IHVzZSBDTUEuIEl0J3MgYmFja2VkIGJ5IFNITUVNLiBEbyB5
b3UgDQpyZWFsbHkgd2FudCB0byBrZWVwIHRoYXQgY29kZSBpbj8NCg0KDQo+ICsJICovDQo+
ICsJc3JjMzIgPSBrbWFsbG9jKGxlbl9zcmMzMiwgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFz
cmMzMikNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBDb3BpZXMgYXJlIGRv
bmUgbGluZS1ieS1saW5lLCBhbGxvY2F0ZSBhbiBpbnRlcm1lZGlhdGUNCj4gKwkgKiBidWZm
ZXIgdG8gY29weSB0aGUgZ3JheTggbGluZXMgYW5kIHRoZW4gY29udmVydCB0byBtb25vLg0K
PiArCSAqLw0KPiArCWdyYXk4ID0ga21hbGxvYyhsaW5lcGl4ZWxzLCBHRlBfS0VSTkVMKTsN
Cj4gKwlpZiAoIWdyYXk4KQ0KPiArCQlnb3RvIGZyZWVfc3JjMzI7DQoNCklmIG1pZ2h0IGJl
IGZhc3RlciB0byBhbGxvY2F0ZSBib3RoIGJ1ZmZlcnMgaW4gb25lIHN0ZXAgYW5kIHNldCB0
aGUgDQpwb2ludGVycyBpbnRvIHRoZSBhbGxvY2F0ZWQgYnVmZmVyLg0KDQo+ICsNCj4gKwkv
Kg0KPiArCSAqIEZvciBkYW1hZ2UgaGFuZGxpbmcsIGl0IGlzIHBvc3NpYmxlIHRoYXQgb25s
eSBwYXJ0cyBvZiB0aGUgc291cmNlDQo+ICsJICogYnVmZmVyIGlzIGNvcGllZCBhbmQgdGhp
cyBjb3VsZCBsZWFkIHRvIHN0YXJ0IGFuZCBlbmQgcGl4ZWxzIHRoYXQNCj4gKwkgKiBhcmUg
bm90IGFsaWduZWQgdG8gbXVsdGlwbGUgb2YgOC4NCj4gKwkgKg0KPiArCSAqIENhbGN1bGF0
ZSBpZiB0aGUgc3RhcnQgYW5kIGVuZCBwaXhlbHMgYXJlIG5vdCBhbGlnbmVkIGFuZCBzZXQg
dGhlDQo+ICsJICogb2Zmc2V0cyBmb3IgdGhlIHJldmVyc2VkIG1vbm8gbGluZSBjb252ZXJz
aW9uIGZ1bmN0aW9uIHRvIGFkanVzdC4NCj4gKwkgKi8NCj4gKwlzdGFydF9vZmZzZXQgPSBj
bGlwLT54MSAlIDg7DQo+ICsJZW5kX29mZnNldCA9IGNsaXAtPngyICUgODsNCg0KZW5kX2xl
biwgYWdhaW4uIElmIHlvdSBoYXZlIDEgc2luZ2xlIGJpdCBzZXQgaW4gdGhlIGZpbmFsIGJ5
dGUsIHRoZQ0Kb2Zmc2V0IGlzIDAsIGJ1dCB0aGUgbGVuZ3RoIGlzIDEuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gKw0KPiArCXZhZGRyICs9IGNsaXBfb2Zmc2V0KGNsaXAsIGZi
LT5waXRjaGVzWzBdLCBjcHApOw0KPiArCWZvciAoeSA9IDA7IHkgPCBsaW5lczsgeSsrKSB7
DQo+ICsJCXNyYzMyID0gbWVtY3B5KHNyYzMyLCB2YWRkciwgbGVuX3NyYzMyKTsNCj4gKwkJ
ZHJtX2ZiX3hyZ2I4ODg4X3RvX2dyYXk4X2xpbmUoZ3JheTgsIHNyYzMyLCBsaW5lcGl4ZWxz
KTsNCj4gKwkJZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2ZXJzZWRfbGluZShtb25vLCBncmF5
OCwgZHN0X3BpdGNoLA0KPiArCQkJCQkJICAgc3RhcnRfb2Zmc2V0LCBlbmRfb2Zmc2V0KTsN
Cj4gKwkJdmFkZHIgKz0gZmItPnBpdGNoZXNbMF07DQo+ICsJCW1vbm8gKz0gZHN0X3BpdGNo
Ow0KPiArCX0NCj4gKw0KPiArCWtmcmVlKGdyYXk4KTsNCj4gK2ZyZWVfc3JjMzI6DQo+ICsJ
a2ZyZWUoc3JjMzIpOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTChkcm1fZmJfeHJnYjg4ODhf
dG9fbW9ub19yZXZlcnNlZCk7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZm9y
bWF0X2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaA0KPiBpbmRl
eCBiMzBlZDVkZTBhMzMuLjY2MzhkYTllOTc3NCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9k
cm0vZHJtX2Zvcm1hdF9oZWxwZXIuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZm9ybWF0
X2hlbHBlci5oDQo+IEBAIC00Myw0ICs0MywxMiBAQCBpbnQgZHJtX2ZiX2JsaXRfdG9pbyh2
b2lkIF9faW9tZW0gKmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwgdWludDMyX3QgZHN0
X2Zvcg0KPiAgIAkJICAgICBjb25zdCB2b2lkICp2bWFwLCBjb25zdCBzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYiwNCj4gICAJCSAgICAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpyZWN0
KTsNCj4gICANCj4gK3ZvaWQgZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2ZXJzZWQodm9pZCAq
ZHN0LCB1bnNpZ25lZCBpbnQgZHN0X3BpdGNoLCBjb25zdCB2b2lkICpzcmMsDQo+ICsJCQkJ
ICAgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+ICsJCQkJICAgY29uc3Qg
c3RydWN0IGRybV9yZWN0ICpjbGlwKTsNCj4gKw0KPiArdm9pZCBkcm1fZmJfeHJnYjg4ODhf
dG9fbW9ub19yZXZlcnNlZCh2b2lkICpkc3QsIHVuc2lnbmVkIGludCBkc3RfcGl0Y2gsIGNv
bnN0IHZvaWQgKnNyYywNCj4gKwkJCQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyICpmYiwNCj4gKwkJCQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApOw0K
PiArDQo+ICAgI2VuZGlmIC8qIF9fTElOVVhfRFJNX0ZPUk1BVF9IRUxQRVJfSCAqLw0KDQot
LSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5
IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jD
pGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Qnltmz2sNMWw7XQRlEOHhRJ8--

--------------YGZ0GQbF7oDY0dWSVnCpC2js
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIDuNYFAwAAAAAACgkQlh/E3EQov+CV
NRAAm8rjskRJt2/O5ppqxyuclKv/bF/kdgpCJFTntNqJpTb+SmvpicBIv1z7PBA9RGc3H3Lg9P7R
uRt6ejhl9+71vzxurpn+N+KMYO95FZvnyVEUdWozukVsgcgOhZMq4UVyLdkGx1dQM+gzD6m5jRMQ
yBrVZhdLiYdU1uvaBbK/oqksS8xOXjYh8SPTOsQifbC7Bu3t3JLk3295H8A111uCQq/Syv3iNdm6
Yq9AOuiN88YBXTkRYNQE4ycBEYbz2u+q1YITA1DtzCau1CZrUZrw/QELnZX8uGZylkyJwqRbiFX1
M1mlF8d+Xkyh+Aq3brC+vwYZ/DMsbSU5vMgdQ0/aEz5VhqWk2JBNHLr32HXp9822AKWk3D19aSYz
Z6VMUk2rQTAHvox1R3ryFz9yMjPrdbwQpvfaP2g6nvFN98RkSzfumeBF87522oyNYgtin2to1XBz
vo8ztyg66F+C6oJtntbpo0p3ikmA0tMOzop06NSC40fk1hHbT4zgfucuMTbqBCxlTgR/Bf2ynw54
lyahWOcoMkhScOWetNjXU2Czx/vlT7iFgA2eaqdKjoQXG8FM7YDD4zUIeHZYWtq/FzobQeBw5nZY
I6g+zCPqZbqs0NdsPfZJj2rT4CKCMbGJxbq5WTniBmB+iPLGLgrDd4BPvtlgvR+8iq6hWEbYse20
L3Q=
=K0l4
-----END PGP SIGNATURE-----

--------------YGZ0GQbF7oDY0dWSVnCpC2js--
