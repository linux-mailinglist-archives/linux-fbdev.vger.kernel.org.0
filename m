Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 903FF4AA147
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Feb 2022 21:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239617AbiBDUfY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 4 Feb 2022 15:35:24 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:46430 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239890AbiBDUfH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 4 Feb 2022 15:35:07 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 5BEB1210ED;
        Fri,  4 Feb 2022 20:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644006906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4XLvxFjk3vfoV26zPMkeC1hWae135E+dxL0ihTcmG8s=;
        b=kKtLDOM3c2iJBCAgTydS3JGT4h5uzdrmgM2YhX5x/kWnrwTHtzqs/ZlsKAC7VKg6qbcjaM
        AmGGPxtOdY2ssV1PVYqAYZYDvytIzmXEDAwQNFfr2j6AWkR3rQLdmb6OJRwKwIZvf4b0sR
        h2EVDuPy664cl1icjkkX346/DHxUM1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644006906;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4XLvxFjk3vfoV26zPMkeC1hWae135E+dxL0ihTcmG8s=;
        b=kvAPU0FQJ4RJxefwLOYfFm23CYWa/SK7N5Y0QpJOBQ3VTafGO0Wj4OEDcoqNsMVwuyMSft
        lEQ69FTPwda2vbAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1577913AE7;
        Fri,  4 Feb 2022 20:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id mCdABPqN/WGFIAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 04 Feb 2022 20:35:06 +0000
Message-ID: <de99712a-55d1-8910-e8a6-6a6254f58724@suse.de>
Date:   Fri, 4 Feb 2022 21:35:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] drm/format-helper: Add
 drm_fb_{xrgb8888,gray8}_to_mono_reversed()
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-fbdev@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-2-javierm@redhat.com>
 <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
 <b388f295-920a-b4fc-41ef-d090bdcd69e2@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b388f295-920a-b4fc-41ef-d090bdcd69e2@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DEQR8zn2W8WC7kLL1kyzY0X3"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DEQR8zn2W8WC7kLL1kyzY0X3
Content-Type: multipart/mixed; boundary="------------t6O902HTgJVaGCMs1dEndN9V";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Message-ID: <de99712a-55d1-8910-e8a6-6a6254f58724@suse.de>
Subject: Re: [PATCH v2 1/4] drm/format-helper: Add
 drm_fb_{xrgb8888,gray8}_to_mono_reversed()
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-2-javierm@redhat.com>
 <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
 <b388f295-920a-b4fc-41ef-d090bdcd69e2@redhat.com>
In-Reply-To: <b388f295-920a-b4fc-41ef-d090bdcd69e2@redhat.com>

--------------t6O902HTgJVaGCMs1dEndN9V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDIuMjIgdW0gMjA6MzEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBm
ZWVkYmFjay4NCj4gDQo+IE9uIDIvNC8yMiAxNjo1MiwgVGhvbWFzIFppbW1lcm1hbm4gd3Jv
dGU6DQo+IA0KPiBbc25pcF0NCj4gDQo+Pj4gK3N0YXRpYyB2b2lkIGRybV9mYl9ncmF5OF90
b19tb25vX3JldmVyc2VkX2xpbmUodTggKmRzdCwgY29uc3QgdTggKnNyYywgc2l6ZV90IHBp
eGVscykNCj4+PiArew0KPj4+ICsJdW5zaWduZWQgaW50IHhiLCBpOw0KPj4+ICsNCj4+PiAr
CWZvciAoeGIgPSAwOyB4YiA8IHBpeGVscyAvIDg7IHhiKyspIHsNCj4+DQo+PiBJbiBwcmFj
dGljZSwgYWxsIG1vZGUgd2lkdGhzIGFyZSBtdWx0aXBsZXMgb2YgOCBiZWNhdXNlIFZHQSBt
YW5kYXRlZCBpdC4NCj4+IFNvIGl0J3Mgb2staXNoIHRvIGFzc3VtZSB0aGlzIGhlcmUuIFlv
dSBzaG91bGQgcHJvYmFibHkgYXQgbGVhc3QgcHJpbnQgYQ0KPj4gd2FybmluZyBzb21ld2hl
cmUgaWYgKHBpeGVscyAlIDggIT0gMCkNCj4+DQo+IA0KPiBBZ3JlZWQuDQoNCkFmdGVyIHNl
bmRpbmcgdGhlIG1haWwsIEkgcmVhbGl6ZWQgdGhhdCBzb21lIGNvZGUgY29waWVzIG9ubHkg
cGFydHMgb2YgDQp0aGUgc291cmNlIGFyb3VuZDsgc3BlY2lmaWNhbGx5IGZvciBkYW1hZ2Ug
aGFuZGxpbmcuIE5vbmUgb2YgdGhpcyBpcyANCmFsaWduZWQgdG8gbXVsdGlwbGUgb2YgOC4g
U28gdGhlIGNvcHlpbmcgY291bGQgc3RhcnQgYW5kIGVuZCBpbiB0aGUgDQptaWRkbGUgb2Yg
Ynl0ZXMuIFlvdSdkIG5lZWQgYSBwaXhlbC1vZmZzZXQgdmFsdWUgb2Ygc29tZSBzb3J0Lg0K
DQpJZiB5b3UgZG9uJ3Qgd2FudCB0byBoYW5kbGUgdGhpcyBub3csIG1heWJlIGF0IGxlYXN0
IGRldGVjdCB0aGlzIGNhc2UgDQphbmQgcHV0IGEgd2FybmluZyBzb21ld2hlcmUuDQoNCj4g
ICANCj4gW3NuaXBdDQo+IA0KPj4+ICsgKiBEUk0gZG9lc24ndCBoYXZlIG5hdGl2ZSBtb25v
Y2hyb21lIG9yIGdyYXlzY2FsZSBzdXBwb3J0Lg0KPj4+ICsgKiBTdWNoIGRyaXZlcnMgY2Fu
IGFubm91bmNlIHRoZSBjb21tb25seSBzdXBwb3J0ZWQgWFIyNCBmb3JtYXQgdG8gdXNlcnNw
YWNlDQo+Pj4gKyAqIGFuZCB1c2UgZHJtX2ZiX3hyZ2I4ODg4X3RvX2dyYXk4KCkgdG8gY29u
dmVydCB0byBncmF5c2NhbGUgYW5kIHRoZW4gdGhpcw0KPj4+ICsgKiBoZWxwZXIgZnVuY3Rp
b24gdG8gY29udmVydCB0byB0aGUgbmF0aXZlIGZvcm1hdC4NCj4+PiArICovDQo+Pj4gK3Zv
aWQgZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2ZXJzZWQodm9pZCAqZHN0LCB1bnNpZ25lZCBp
bnQgZHN0X3BpdGNoLCBjb25zdCB2b2lkICpzcmMsDQo+Pj4gKwkJCQkgICBjb25zdCBzdHJ1
Y3QgZHJtX3JlY3QgKmNsaXApDQo+Pg0KPj4gVGhlcmUncyBhIGJ1ZyBoZXJlLiBZb3Ugd2Fu
dCB0byBwYXNzIGluIGEgZHJtX2ZyYW1lYnVmZmVyIGFzIGZvdXJ0aA0KPj4gYXJndW1lbnQu
DQo+Pg0KPj4+ICt7DQo+Pj4gKw0KPj4+ICsJc2l6ZV90IGhlaWdodCA9IGRybV9yZWN0X2hl
aWdodChjbGlwKTsNCj4+PiArCXNpemVfdCB3aWR0aCA9IGRybV9yZWN0X3dpZHRoKGNsaXAp
Ow0KPj4+ICsJdW5zaWduZWQgaW50IHk7DQo+Pj4gKwljb25zdCB1OCAqZ3JheTggPSBzcmM7
DQo+Pj4gKwl1OCAqbW9ubyA9IGRzdDsNCj4+PiArDQo+Pj4gKwlpZiAoIWRzdF9waXRjaCkN
Cj4+PiArCQlkc3RfcGl0Y2ggPSB3aWR0aDsNCj4+DQo+PiBUaGUgZHN0X3BpdGNoIGlzIGdp
dmVuIGluIGJ5dGVzLiBZb3UgaGF2ZSB0byBkZXZpY2UgYnkgOC4gSGVyZSB3b3VsZCBiZQ0K
Pj4gYSBnb29kIHBsYWNlIHRvIHdhcm4gaWYgKHdpZHRoICUgOCAhPSAwKS4NCj4+DQo+IA0K
PiBPay4NCj4gICANCj4+PiArDQo+Pj4gKwlmb3IgKHkgPSAwOyB5IDwgaGVpZ2h0OyB5Kysp
IHsNCj4+PiArCQlkcm1fZmJfZ3JheThfdG9fbW9ub19yZXZlcnNlZF9saW5lKG1vbm8sIGdy
YXk4LCBkc3RfcGl0Y2gpOw0KPj4+ICsJCW1vbm8gKz0gKGRzdF9waXRjaCAvIDgpOw0KPj4N
Cj4+IFRoZSBkc3RfcGl0Y2ggaXMgYWxyZWFkeSBnaXZlbiBpbiBieXRlcy4NCj4+DQo+IA0K
PiBZZXMsIEkga25vdyBidXQgZm9yIHJldmVyc2VkIG1vbm8gd2Ugd2FudCBvbmx5IDEvOCBv
ZiB0aGUgd2lkdGggc2luY2Ugd2UNCj4gYXJlIGNvbnZlcnRpbmcgZnJvbSA4IGJpdHMgcGVy
IHBpeGVsIGdyZXlzY2FsZSB0byAxIGJpdCBwZXIgcGl4ZWwgbW9uby4NCj4gDQo+IE9yIGFt
IEkgbWlzdW5kZXJzdGFuZGluZyB3aGF0IHlvdSBtZWFudCA/DQoNCkkgbWVhbiB0aGF0IGlm
IHRoZXJlIGFyZSA4MCBwaXhlbCBvbiBhIHNjYW5saW5lLCB0aGUgdmFsdWUgb2YgZHN0X3Bp
dGNoIA0KaXMgYWxyZWFkeSAxMC4gVGhlc2UgcGl0Y2ggdmFsdWVzIGFyZSBhbHdheXMgZ2l2
ZW4gaW4gYnl0ZXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+Pj4gKwkJZ3Jh
eTggKz0gZHN0X3BpdGNoOw0KPj4NCj4+ICdncmF5OCArPSBmYi0+cGl0Y2hlc1swXScgd291
bGQgYmUgY29ycmVjdC4NCj4+DQo+IA0KPiBPay4NCj4gICANCj4gW3NuaXBdDQo+IA0KPj4+
ICsgKi8NCj4+PiArdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9fbW9ub19yZXZlcnNlZCh2b2lk
ICpkc3QsIHVuc2lnbmVkIGludCBkc3RfcGl0Y2gsIGNvbnN0IHZvaWQgKnNyYywNCj4+PiAr
CQkJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPj4+ICsJCQkJ
ICAgICAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKQ0KPj4+ICt7DQo+Pj4gKwlpZiAo
V0FSTl9PTihmYi0+Zm9ybWF0LT5mb3JtYXQgIT0gRFJNX0ZPUk1BVF9YUkdCODg4OCkpDQo+
Pj4gKwkJcmV0dXJuOw0KPj4+ICsNCj4+PiArCWlmICghZHN0X3BpdGNoKQ0KPj4+ICsJCWRz
dF9waXRjaCA9IGRybV9yZWN0X3dpZHRoKGNsaXApOw0KPj4+ICsNCj4+PiArCWRybV9mYl94
cmdiODg4OF90b19ncmF5OChkc3QsIGRzdF9waXRjaCwgc3JjLCBmYiwgY2xpcCk7DQo+Pj4g
Kwlkcm1fZmJfZ3JheThfdG9fbW9ub19yZXZlcnNlZChkc3QsIGRzdF9waXRjaCwgZHN0LCBm
YiwgY2xpcCk7DQo+Pg0KPj4gQ29udmVydGluZyBmcm9tIGRzdCBpbnRvIGRzdCBjYW4gZ2l2
ZSBpbmNvcnJlY3QgcmVzdWx0cy4gQXQgc29tZSBwb2ludA0KPj4gd2UgcHJvYmFibHkgd2Fu
dCB0byBhZGQgcmVzdHJpY3QgcXVhbGlmaWVycyB0byB0aGVzZSBwb2ludGVycywgdG8gaGVs
cA0KPj4gdGhlIGNvbXBpbGVyIHdpdGggb3B0aW1pemluZy4NCj4+DQo+PiBBIGJldHRlciBh
cHByb2FjaCBoZXJlIGlzIHRvIHB1bGwgdGhlIHBlci1saW5lIGNvbnZlcnNpb24gZnJvbQ0K
Pj4gZHJtX2ZiX3hyZ2I4ODg4X3RvX2dyYXk4KCkgaW50byBhIHNlcGFyYXRlIGhlbHBlciBh
bmQgaW1wbGVtZW50IGENCj4+IGxpbmUtYnktbGluZSBjb252ZXJzaW9uIGhlcmUuIHNvbWV0
aGluZyBsaWtlIHRoaXM6DQo+Pg0KPj4gICAgIGRybV9mYl94cmdiODg4OF90b19tb25vX3Jl
dmVyc2VkKCkNCj4+ICAgICB7DQo+PiAgICAgICBjaGFyICp0bXAgPSBrbWFsbG9jKHNpemUg
b2YgYSBzaW5nbGUgbGluZSBvZiBncmF5OCkNCj4+DQo+PiAgICAgICBmb3IgKGhlaWd0aCkg
ew0KPj4gICAgICAgICAgZHJtX2ZiX3hyZ2I4ODg4X3RvX2dyYXk4X2xpbmUodG1wLCAuLi4s
IHNyYywgLi4uKTsNCj4+ICAgICAgICAgIGRybV9mYl9ncmF5OF90b19tb25vX3JldmVyc2Vk
KGRzdCwgLi4uLCB0bXAsIC4uLik7DQo+Pg0KPj4gICAgICAgICAgc3JjICs9IGZiLT5waXRj
aGVzWzBdDQo+PiAgICAgICAgICBkc3QgKz0gZHN0X3BpdGNoOw0KPj4gICAgICAgfQ0KPj4N
Cj4+ICAgICAgIGtmcmVlKHRtcCk7DQo+PiAgICAgfQ0KPj4NCj4gDQo+IEkgc2VlLiBZZXMs
IHRoYXQgc291bmRzIGEgbXVjaCBiZXR0ZXIgYXBwcm9hY2guIEknbGwgY2hhbmdlIGl0IGlu
IHYzLg0KPiAgIA0KPiBCZXN0IHJlZ2FyZHMsDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------t6O902HTgJVaGCMs1dEndN9V--

--------------DEQR8zn2W8WC7kLL1kyzY0X3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH9jfkFAwAAAAAACgkQlh/E3EQov+BB
lRAAlInAUUc/WwDPMBSE2um3OnFOi3PF13U+MPJR9eoVCoFQyrFdnw4ZlQwxcOUGUnZy+6rob2PD
yfMIyc84C8SjPLOlTwtAgwYd+9JXeH8OvCZeu/YfyzNzBeAPttEdra1ZwKYjXC1zjKfvDfvqSZLW
N7agz34xOQ25AnJxi8z3++PN6BSqOx/EzikLMbQibbH7OiryfTBuwbZbaBxGSynClyo4lL3lge+C
PE0FURQI1aqU2wTeNknU8n1jS2dDZgxfiNOHwais3FoDTPUZb4cCZFp1NWGNXqCnKpKpgi9iZhmp
daLSEfwrOHa9YLUIdvqQ0RxT2YCVMP/jVgUBAvKcozX7WDSGsVjEhSzJe8YDjxbZjxBwIXmB+2HD
LPx8su3Ak7sg2xuMfx7OdCY/DLWGDBL1DJHpwtjAlvCeGXgehYdb/5cGWGgFpJHXw5r+XqeRkdBA
just2aGa+hagltBJM4rZmW9woAxWIUfB7rflf8Rlp36U1UuEZyiicNTRPEk3pudWrPgiRHmgc8j+
DoKOKZyToWF7NMXbBxnD1h0/dfPzLYYJK/Tlq8U5F1z/xYHF35MU3/IvXVREmqJz9wCejw9m5aqu
8sj9Wf5dAIj18YuYOAJSU8cGZA1hoeyZcteC6QO2fKy3l76oyb9Rq8jmfDTZUBgi+fU1B7o3pApT
r7A=
=UUW9
-----END PGP SIGNATURE-----

--------------DEQR8zn2W8WC7kLL1kyzY0X3--
