Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8365BFD1E
	for <lists+linux-fbdev@lfdr.de>; Wed, 21 Sep 2022 13:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiIULpV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 21 Sep 2022 07:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiIULpQ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 21 Sep 2022 07:45:16 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFE8883D3
        for <linux-fbdev@vger.kernel.org>; Wed, 21 Sep 2022 04:45:14 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 54FFE21AB3;
        Wed, 21 Sep 2022 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1663760713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=idEXkueM5dC+SdaLjxK4VFV+c2cSRzdpu/DUyStVyLw=;
        b=QLHjMVjMI0trQkmtixjQSBwCnfh/2m55XWaJYsnTZupAQRBzkewNWjsnICU4q4nPFfxXSg
        c4Wdn7i4Mg2iwmkl2ioCk+7tWBBSBFEveLsTCnQOYXzPt4AuuNDfWrG7tPJe2ru7z8p7RW
        Xyox63PfYDG2ZPYSaDxYhZshY7uBICE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1663760713;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=idEXkueM5dC+SdaLjxK4VFV+c2cSRzdpu/DUyStVyLw=;
        b=G0hIRewB4OoaWpntTqOsb4SdkIJb8UDZP+ZXM4d4Fbj3GAQ82Sb/Hb1DgFs31ul+45XzgU
        mO/3otFzEfaiEUCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D47F13A00;
        Wed, 21 Sep 2022 11:45:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id dsJlBkn5KmP4CgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 21 Sep 2022 11:45:13 +0000
Message-ID: <1946b9c3-f90d-a521-40e9-dfcde2b96950@suse.de>
Date:   Wed, 21 Sep 2022 13:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 08/10] drm/ofdrm: Add CRTC state
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
        daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech,
        sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org, geert@linux-m68k.org,
        mark.cave-ayland@ilande.co.uk
Cc:     linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-9-tzimmermann@suse.de>
 <3fb4d471-2653-07a6-8fbd-f59da6c113e0@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3fb4d471-2653-07a6-8fbd-f59da6c113e0@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FlUm8BeuCnLB3E0sIdPKAcvW"
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FlUm8BeuCnLB3E0sIdPKAcvW
Content-Type: multipart/mixed; boundary="------------CBRzefQJQXLs6PLdW0uG9NrQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <1946b9c3-f90d-a521-40e9-dfcde2b96950@suse.de>
Subject: Re: [PATCH v2 08/10] drm/ofdrm: Add CRTC state
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-9-tzimmermann@suse.de>
 <3fb4d471-2653-07a6-8fbd-f59da6c113e0@redhat.com>
In-Reply-To: <3fb4d471-2653-07a6-8fbd-f59da6c113e0@redhat.com>

--------------CBRzefQJQXLs6PLdW0uG9NrQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDcuMjIgdW0gMTU6MzYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDcvMjAvMjIgMTY6MjcsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gQWRkIGEgZGVkaWNhdGVkIENSVEMgc3RhdGUgdG8gb2Zkcm0gdG8gbGF0ZXIgc3RvcmUg
aW5mb3JtYXRpb24gZm9yDQo+PiBwYWxldHRlIHVwZGF0ZXMuDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0N
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvb2Zkcm0uYyB8IDYyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLQ0KPj4gICANCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZp
ZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQo+IFsuLi5d
DQo+IA0KPj4gK3N0YXRpYyB2b2lkIG9mZHJtX2NydGNfcmVzZXQoc3RydWN0IGRybV9jcnRj
ICpjcnRjKQ0KPj4gK3sNCj4+ICsJc3RydWN0IG9mZHJtX2NydGNfc3RhdGUgKm9mZHJtX2Ny
dGNfc3RhdGU7DQo+PiArDQo+PiArCWlmIChjcnRjLT5zdGF0ZSkgew0KPj4gKwkJb2Zkcm1f
Y3J0Y19zdGF0ZV9kZXN0cm95KHRvX29mZHJtX2NydGNfc3RhdGUoY3J0Yy0+c3RhdGUpKTsN
Cj4+ICsJCWNydGMtPnN0YXRlID0gTlVMTDsgLyogbXVzdCBiZSBzZXQgdG8gTlVMTCBoZXJl
ICovDQo+PiArCX0NCj4+ICsNCj4+ICsJb2Zkcm1fY3J0Y19zdGF0ZSA9IGt6YWxsb2Moc2l6
ZW9mKCpvZmRybV9jcnRjX3N0YXRlKSwgR0ZQX0tFUk5FTCk7DQo+PiArCWlmICghb2Zkcm1f
Y3J0Y19zdGF0ZSkNCj4+ICsJCXJldHVybjsNCj4+ICsJX19kcm1fYXRvbWljX2hlbHBlcl9j
cnRjX3Jlc2V0KGNydGMsICZvZmRybV9jcnRjX3N0YXRlLT5iYXNlKTsNCj4+ICt9DQo+PiAr
DQo+IA0KPiBJTU8gdGhpcyBmdW5jdGlvbiBpcyBoYXJkIHRvIHJlYWQsIEkgd291bGQgaW5z
dGVhZCB3cml0ZSBpdCBhcyBmb2xsb3dpbmc6DQo+IA0KPiBzdGF0aWMgdm9pZCBvZmRybV9j
cnRjX3Jlc2V0KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykNCj4gew0KPiAgICAgICAgICBzdHJ1
Y3Qgb2Zkcm1fY3J0Y19zdGF0ZSAqb2Zkcm1fY3J0Y19zdGF0ZSA9IGt6YWxsb2Moc2l6ZW9m
KCpvZmRybV9jcnRjX3N0YXRlKSwgR0ZQX0tFUk5FTCk7DQo+IA0KPiAJaWYgKCFvZmRybV9j
cnRjX3N0YXRlKQ0KPiAJCXJldHVybjsNCj4gDQo+ICAgICAgICAgIGlmIChjcnRjLT5zdGF0
ZSkgew0KPiAgICAgICAgICAgICAgICAgIG9mZHJtX2NydGNfc3RhdGVfZGVzdHJveSh0b19v
ZmRybV9jcnRjX3N0YXRlKGNydGMtPnN0YXRlKSk7DQo+IAkJY3J0Yy0+c3RhdGUgPSBOVUxM
OyAvKiBtdXN0IGJlIHNldCB0byBOVUxMIGhlcmUgKi8NCj4gCX0NCj4gDQo+ICAgICAgICAg
IF9fZHJtX2F0b21pY19oZWxwZXJfY3J0Y19yZXNldChjcnRjLCAmb2Zkcm1fY3J0Y19zdGF0
ZS0+YmFzZSk7DQo+IH0NCj4gDQo+IEFsc28gd2l0aCB0aGF0IGZvcm0gSSB0aGluayB0aGF0
IHRoZSBjcnRjLT5zdGF0ZSA9IE5VTEwgY291bGQganVzdCBiZSBkcm9wcGVkID8NCg0KSSBv
bmNlIGhhZCB0byBhZGQgdGhpcyBsaW5lIHRvIGEgZHJpdmVyIHRvIG1ha2UgdGhlIERSTSBo
ZWxwZXJzIHdvcmsuIA0KQnV0IEkgY2Fubm90IGZpbmQgYW55IGxvbmdlciB3aHkuIE1heWJl
IGl0J3MgYmVlbiByZXNvbHZlZCBtZWFud2hpbGUuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------CBRzefQJQXLs6PLdW0uG9NrQ--

--------------FlUm8BeuCnLB3E0sIdPKAcvW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMq+UgFAwAAAAAACgkQlh/E3EQov+CH
ng/9GJR9WyP08CLQ+u7aFDk/QkDScbHixaIUwb89p9KC2hbg2lQLuLEkYAGRcg5chRnIPOVmCLyf
1jlKDsGdd7H/WjwJMDMxzNjrX6AyGCYpuBa0iXGPeZ2ErpgQqyH0UUPUQvugqCHXSpoc+qRaKutP
6ITjNmN+M6F2NgNzwAduhNUwQ8SbdZQp1AmNwjWn2zbeJJ0ambEJD0qRChayq/2ackWdRMDCU/hS
pt3sMhVtvtCZrblJZ7nfx9+O295zWDCYeEKrYBJ0XEO5T8jqrHllqdbiKLF//ke/qMIBzZ6wN2Yf
ZNxe4weyCJdPkUXLxGzt6aJrk1KWhj6d6aswyj22ucbsjZZZaHmPYXiXQGWM01J6v80hTmYuL1Ii
RDw8myDNZQCGdJ2aXor9dzN1prJ/yUeQ09Cm5Rp+fcZAuBRXyXvxuh5XErMQA9urLWAPORSN38Ra
/W7J2YyUJTzst+crA69RyxeJp4H9ZHNLRjCKbt2uuxCQdqr/puR3/A4pOBvMgfns/yswdPztiTG8
dtaJDHU55NCUwJSEarMolF3VI8e3qzAsCXWMMA3+gptyat07oxQ4h6wzEmF6ZbH3vmRaxIAZvIPv
Ll0Kb2D9dlerldXbIBMCsU/mZjg73WJXGkYMTViJM9M/8SayMvXdt03Th7fGld3l7Ivu2pv8e8HD
fs8=
=Frl4
-----END PGP SIGNATURE-----

--------------FlUm8BeuCnLB3E0sIdPKAcvW--
