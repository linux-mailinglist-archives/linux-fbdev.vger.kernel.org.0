Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53B21520FCB
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 May 2022 10:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238060AbiEJIlt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 10 May 2022 04:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbiEJIlr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 10 May 2022 04:41:47 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382252370E9;
        Tue, 10 May 2022 01:37:51 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D5BB61F940;
        Tue, 10 May 2022 08:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1652171869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3xyIPOeoVElHmW8eJgZoOFzQNYtnkKUFdncoApBuweo=;
        b=CvWntJnLRmzpWgi1q5wGaKsmfK0lX2rNbAXQkOnJHjl712eOhMgf0PSnQp8nDGBYmu+xRx
        c95T/+ib7IGRbDPCJnVBu0yOF7g6C2nv/MziapI2iL77cgviqBDtfj3b2+S1RQjtj0kZAv
        +N3Af4wTX0aunqwAvJdIQwhbMkTl92I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1652171869;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3xyIPOeoVElHmW8eJgZoOFzQNYtnkKUFdncoApBuweo=;
        b=3bn8O+PgIfxf2p2QZQJ8a6TXCaxe5Qh69ME5LxEl9T6ZHbgvChsih5Vj5QqCDUQRLflwxL
        EAbbRfxZo0cp3XAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87F2713AC1;
        Tue, 10 May 2022 08:37:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0vLfH10kemLdFwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 10 May 2022 08:37:49 +0000
Message-ID: <7ffd92d7-9c07-fa9c-dc95-9e82719fd237@suse.de>
Date:   Tue, 10 May 2022 10:37:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-fbdev@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
 <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
 <79aaea41-5dab-f896-ab3d-d6bc9a5de615@suse.de>
 <2d8d8583-3a39-b826-dd83-ba5bc4c5b082@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <2d8d8583-3a39-b826-dd83-ba5bc4c5b082@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NlARKs14WTkoSxxCTf6M3wpd"
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NlARKs14WTkoSxxCTf6M3wpd
Content-Type: multipart/mixed; boundary="------------0pggphaFzbHBl5tN64yz2f2W";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <7ffd92d7-9c07-fa9c-dc95-9e82719fd237@suse.de>
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
 <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
 <79aaea41-5dab-f896-ab3d-d6bc9a5de615@suse.de>
 <2d8d8583-3a39-b826-dd83-ba5bc4c5b082@redhat.com>
In-Reply-To: <2d8d8583-3a39-b826-dd83-ba5bc4c5b082@redhat.com>

--------------0pggphaFzbHBl5tN64yz2f2W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDUuMjIgdW0gMTA6MzAgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDUvMTAvMjIgMTA6MDQsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkNCj4+DQo+PiBBbSAxMC4wNS4yMiB1bSAwMDo0
MiBzY2hyaWViIEphdmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4+PiBPbiA1LzEwLzIyIDAw
OjIyLCBBbmRyemVqIEhhamRhIHdyb3RlOg0KPj4+DQo+Pj4gW3NuaXBdDQo+Pj4NCj4+Pj4+
ICAgICBzdGF0aWMgdm9pZCBkcm1fZmJkZXZfZmJfZGVzdHJveShzdHJ1Y3QgZmJfaW5mbyAq
aW5mbykNCj4+Pj4+ICAgICB7DQo+Pj4+PiArICAgICAgIGlmIChpbmZvLT5jbWFwLmxlbikN
Cj4+Pj4+ICsgICAgICAgICAgICAgICBmYl9kZWFsbG9jX2NtYXAoJmluZm8tPmNtYXApOw0K
Pj4+Pj4gKw0KPj4+Pj4gICAgICAgICAgICBkcm1fZmJkZXZfcmVsZWFzZShpbmZvLT5wYXIp
Ow0KPj4+Pj4gKyAgICAgICBmcmFtZWJ1ZmZlcl9yZWxlYXNlKGluZm8pOw0KPj4+Pg0KPj4+
PiBJIHdvdWxkIHB1dCBkcm1fZmJkZXZfcmVsZWFzZSBhdCB0aGUgYmVnaW5uaW5nIC0gaXQg
Y2FuY2VscyB3b3JrZXJzDQo+Pj4+IHdoaWNoIGNvdWxkIGV4cGVjdCBjbWFwIHRvIGJlIHN0
aWxsIHZhbGlkLg0KPj4+Pg0KPj4+DQo+Pj4gSW5kZWVkLCB5b3UgYXJlIGNvcnJlY3QgYWdh
aW4uIFswXSBpcyB0aGUgZmluYWwgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggSSd2ZQ0KPj4+IGJ1
dCBkb24ndCBoYXZlIGFuIGk5MTUgdGVzdCBtYWNoaW5lIHRvIGdpdmUgaXQgYSB0cnkuIEkn
bGwgdGVzdCB0b21vcnJvdw0KPj4+IG9uIG15IHRlc3Qgc3lzdGVtcyB0byB2ZXJpZnkgdGhh
dCBpdCBkb2Vzbid0IGNhdXNlIGFueSByZWdyZXNzaW9ucyBzaW5jZQ0KPj4+IHdpdGggb3Ro
ZXIgRFJNIGRyaXZlcnMuDQo+Pg0KPj4gWW91IGhhdmUgdG8gZ28gdGhyb3VnaCBhbGwgRFJN
IGRyaXZlcnMgdGhhdCBjYWxsIGRybV9mYl9oZWxwZXJfZmluaSgpDQo+PiBhbmQgbWFrZSBz
dXJlIHRoYXQgdGhleSBmcmVlIGZiX2luZm8uIEZvciBleGFtcGxlIGFybWFkYSBhcHBlYXJz
IHRvIGJlDQo+PiBsZWFraW5nIG5vdy4gWzFdDQo+Pg0KPiANCj4gQnV0IHNob3VsZG4ndCBm
Yl9pbmZvIGJlIGZyZWVkIHdoZW4gdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcigpIGlzIGNhbGxl
ZA0KPiB0aHJvdWdoIGRybV9kZXZfdW5yZWdpc3RlcigpID8gQUZBSUNUIHRoZSBjYWxsIGNo
YWluIGlzIHRoZSBmb2xsb3dpbmc6DQo+IA0KPiBkcm1fcHV0X2RldigpDQo+ICAgIGRybV9k
ZXZfdW5yZWdpc3RlcigpDQo+ICAgICAgZHJtX2NsaWVudF9kZXZfdW5yZWdpc3RlcigpDQo+
ICAgICAgICBkcm1fZmJkZXZfY2xpZW50X3VucmVnaXN0ZXIoKQ0KPiAgICAgICAgICBkcm1f
ZmJfaGVscGVyX3VucmVnaXN0ZXJfZmJpKCkNCj4gICAgICAgICAgICB1bnJlZ2lzdGVyX2Zy
YW1lYnVmZmVyKCkNCj4gICAgICAgICAgICAgIGRvX3VucmVnaXN0ZXJfZnJhbWVidWZmZXIo
KQ0KPiAgICAgICAgICAgICAgICBwdXRfZmJfaW5mbygpDQo+ICAgICAgICAgICAgICAgICAg
ZHJtX2ZiZGV2X2ZiX2Rlc3Ryb3koKQ0KPiAgICAgICAgICAgICAgICAgICAgZnJhbWVidWZm
ZXJfcmVsZWFzZSgpDQo+IA0KPiB3aGljaCBpcyB0aGUgcmVhc29uIHdoeSBJIGJlbGlldmUg
dGhhdCBkcm1fZmJfaGVscGVyX2ZpbmkoKSBzaG91bGQgYmUNCj4gYW4gaW50ZXJuYWwgc3Rh
dGljIGZ1bmN0aW9uIGFuZCBvbmx5IGNhbGxlZCBmcm9tIGRybV9mYmRldl9mYl9kZXN0cm95
KCkuDQo+IA0KPiBEcml2ZXJzIHNob3VsZG4ndCByZWFsbHkgZXhwbGljaXRseSBjYWxsIHRo
aXMgaGVscGVyIGluIG15IG9waW5pb24uDQoNClRoYW5rcy4gIFRoYXQgbWFrZXMgc2Vuc2Uu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------0pggphaFzbHBl5tN64yz2f2W--

--------------NlARKs14WTkoSxxCTf6M3wpd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ6JF0FAwAAAAAACgkQlh/E3EQov+CE
Fw/8CYOK9HIvdYD6X/dNihbHDHDQJx7Crk+D/8vxm9ddXW/mlCtw+7PvkoUODZJIofHEOySGNeOn
BWYbZ4JARMnQOjpa5+nPnpXYHLvkFEph3ox+l8QkrlFet6Vmu7yOHHLSnWfeYwWKKld0u+q0NSqR
L9I0yIpZa35ZuFUvDRm8xtlG+EmdtF3mr9Nob9Q61W1R3zlcZYWEtJkv8J8uXHsR6qhcu/fX8EMv
TsorM5iBhysd45K7EJftGyvy/5Ys3UCzqj+9DjCfvIjUokskNIJAUt+vnfWfooJTsHUUmYTffoKH
AVN/9YbcgpWJ0g18NS6s434G4TllZr6rEMYHYqA4s43KzEX9RLFQlUHCRMcUaBbDal64ubD8yUcW
2gtNgo2TUvH8QazIUmu3JYldt7Otr2fCIsZ6dYJo5xGsHVenURcoB4GZboJUP4FO1nETVXgcb9UV
vZPoXnsQx4viJgR3da1nzqz8Wzjd5bYgjYoKBKK1dq45GZ7LR1S+vdYqhtQ9HiJ5zDYbSfPE9DLc
0Y+A04aSfBu4YOlHT7Bgd429FS+S0WPpa6ImbcdbLjvK7rmPEoikOg5iVbSgn7B+e2C+zHAQayAI
8vycTpPJ7tecYH9aEul+eSclGF/XQMoSvUpmho018w2vnM6D5nH98t/6SynbwLGFZmqdS0hGhmvh
ETU=
=yGVf
-----END PGP SIGNATURE-----

--------------NlARKs14WTkoSxxCTf6M3wpd--
