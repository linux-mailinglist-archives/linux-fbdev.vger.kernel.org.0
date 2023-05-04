Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8586F5A0B
	for <lists+linux-fbdev@lfdr.de>; Wed,  3 May 2023 16:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjECOa6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 3 May 2023 10:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjECOa5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 3 May 2023 10:30:57 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5B09B
        for <linux-fbdev@vger.kernel.org>; Wed,  3 May 2023 07:30:55 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 6736F2044A;
        Wed,  3 May 2023 14:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683124254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/bkdiTC32IIgs167WOA5y/odzas+QbwYr308MIbBkYY=;
        b=f4VatL6GwDExrvTkp0+BnD/VW4OS1KjZjgQ1fMBvVsQCroHKJyhLC0zLPV/n/7Smj5q6aq
        fX5uLQ+GrhpYRaR2JUeHff6cbrnVLgvRQYHFNw3LOzsy3jdMzJWv2kjLuXOUE8X2sVysbn
        puRVjru5aF56TPuRIygwpadozd29rF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683124254;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/bkdiTC32IIgs167WOA5y/odzas+QbwYr308MIbBkYY=;
        b=lyrtX7vhEDSgo9eJ2XSpmQrbaRFLcOzojZ5B8dIB5McFPzB9borMUpfvPiphyfojCeA029
        /PqjRKqL+YKoh1Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 332CF1331F;
        Wed,  3 May 2023 14:30:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id cCFbCx5wUmTRRQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 03 May 2023 14:30:54 +0000
Message-ID: <310b1de3-589d-189b-e6b7-1e146a86f185@suse.de>
Date:   Wed, 3 May 2023 16:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 17/19] fbdev: Validate info->screen_{base,buffer} in
 fb_ops implementations
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-fbdev@vger.kernel.org,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        teddy.wang@siliconmotion.com, deller@gmx.de, javierm@redhat.com,
        dri-devel@lists.freedesktop.org, sudipm.mukherjee@gmail.com
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-18-tzimmermann@suse.de>
 <CAMuHMdUgsUsNaCvSA+jUNrOvZU3O2xF0b=MnA_GyL-HvAeZy5Q@mail.gmail.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdUgsUsNaCvSA+jUNrOvZU3O2xF0b=MnA_GyL-HvAeZy5Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ymdshUxqRpDnJ4tWpcprT2k4"
X-Spam-Status: No, score=-8.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ymdshUxqRpDnJ4tWpcprT2k4
Content-Type: multipart/mixed; boundary="------------NdCe0TSxHkOgBhALqWX6jEEF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 teddy.wang@siliconmotion.com, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, sudipm.mukherjee@gmail.com
Message-ID: <310b1de3-589d-189b-e6b7-1e146a86f185@suse.de>
Subject: Re: [PATCH v2 17/19] fbdev: Validate info->screen_{base,buffer} in
 fb_ops implementations
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-18-tzimmermann@suse.de>
 <CAMuHMdUgsUsNaCvSA+jUNrOvZU3O2xF0b=MnA_GyL-HvAeZy5Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUgsUsNaCvSA+jUNrOvZU3O2xF0b=MnA_GyL-HvAeZy5Q@mail.gmail.com>

--------------NdCe0TSxHkOgBhALqWX6jEEF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDUuMjMgdW0gMTE6NTEgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IE9uIEZyaSwgQXByIDI4LCAyMDIzIGF0IDI6MjbigK9QTSBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+PiBQdXNoIHRoZSB0ZXN0IGZvciBp
bmZvLT5zY3JlZW5fYmFzZSBmcm9tIGZiX3JlYWQoKSBhbmQgZmJfd3JpdGUoKSBpbnRvDQo+
PiB0aGUgaW1wbGVtZW50YXRpb25zIG9mIHN0cnVjdCBmYl9vcHMue2ZiX3JlYWQsZmJfd3Jp
dGV9LiBJbiBjYXNlcyB3aGVyZQ0KPj4gdGhlIGRyaXZlciBvcGVyYXRlcyBvbiBpbmZvLT5z
Y3JlZW5fYnVmZmVyLCB0ZXN0IHRoaXMgZmllbGQgaW5zdGVhZC4NCj4+DQo+PiBXaGlsZSBi
b3RoaSBmaWVsZHMsIHNjcmVlbl9iYXNlIGFuZCBzY3JlZW5fYnVmZmVyLCBhcmUgc3RvcmVk
IGluIHRoZQ0KPiANCj4gYm90aA0KPiANCj4+IHNhbWUgbG9jYXRpb24sIHRoZXkgcmVmZXIg
dG8gZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzLiBGb3IgY29ycmVjdG5lc3MsDQo+PiB3ZSB3
YW50IHRvIHRlc3QgZWFjaCBmaWVsZCBpbiBleGFjdGx5IHRoZSBjb2RlIHRoYXQgdXNlcyBp
dC4NCj4gDQo+IE5vdCBhIGRpcmVjdCBjb21tZW50IGZvciB0aGlzIHBhdGNoOiBhbmQgbGF0
ZXIgdGhlIHVuaW9uIGNhbiBiZSBzcGxpdA0KPiBpbiB0d28gc2VwYXJhdGUgZmllbGRzLCB0
byBwcm90ZWN0IGFnYWluc3QgbWlzdXNlPw0KDQpObyBpZGVhLiBDdXJyZW50bHkgd2UgaGF2
ZSBzcGFyc2UgdGhhdCB3YXJucyBhYm91dCBtaXNtYXRjaGluZyBhZGRyZXNzIA0Kc3BhY2Vz
IGlmIHRoZSBmaWVsZHMgYXJlIG1peGVkIHVwLiBUaGF0J3MgZ29vZCBlbm91Z2gsIGFzIGZh
ciBJJ20gY29uY2VybmVkLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBHcntv
ZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0K
PiANCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0
NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFu
ZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVy
ZykNCg==

--------------NdCe0TSxHkOgBhALqWX6jEEF--

--------------ymdshUxqRpDnJ4tWpcprT2k4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRScB0FAwAAAAAACgkQlh/E3EQov+D8
ARAAyfozrbOIJq37xDo8gKTrtn/buuTl7izbvZa8gL3j0pMBpOpjfTu3ObucOlUuroYLLdRZq+Be
s+6v/7uKtUH2mOmdw5zy3/dR3g3KkZBZnfoe1vN2UVTtnvNYdGnAtaPIm8pGYNN73F6T0rx0NcQa
bn5JKmwv0twpcKWeHhok3Q2UIdPO17g4jRBQNWiguVdJf98Q6a/YjQBXkUp4DeGihOyozm0piGks
paJmt7D+HHWO07WTZ8VYuniDU4LmiAXyIHFxpJo0kPZfA/MfUwuQuRJBk/kWpEIRE9ncQmvGUHLS
6S2e5EOIxyCYxIKn+0VNAp+AmIxRNUFLF7m0UtGEVT/U+0GKT6/Ex6xSrVWVGk6+8r/77la7ugIi
1aayd3i0k5CCqj2UdVQCpyt4uWXaQ7Wc0P+ZCs/314AEo71pqNcN8ZM9sjvKddGlZ/l3TfMAB5k9
l47NJuWTV8SFxrOuwtZUEvf3xK2jl61nZl/0lsBUezk49DcPdJTLFaHpjfrcgNU0mZxT3khdZtXg
/ASgf9ITrkYTCzXlDm46s9gOvGc7rI2EZTT/I/YksqnN88VKB6B2Q5h3T+xwbuoPuQwQR6X0hxhT
nfKeLFlp56otiXD2KptUzQucsYcCbviI6K93w/olh5dXVThTm/aGTJD74QdD2QUmZljKM18mF5ZR
dyE=
=mUFs
-----END PGP SIGNATURE-----

--------------ymdshUxqRpDnJ4tWpcprT2k4--
