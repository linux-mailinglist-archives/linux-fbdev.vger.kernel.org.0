Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBB5F4B4413
	for <lists+linux-fbdev@lfdr.de>; Mon, 14 Feb 2022 09:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237946AbiBNI3B (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 14 Feb 2022 03:29:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233127AbiBNI3A (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 14 Feb 2022 03:29:00 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3659725C61
        for <linux-fbdev@vger.kernel.org>; Mon, 14 Feb 2022 00:28:53 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 567EC1F37C;
        Mon, 14 Feb 2022 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644827331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=csf2c85ZpeogGj2peNxurRHZTgb4VyZ58KRMwsGWiks=;
        b=yTih74fZa5Ucb+r/ZOsPo4htSrgUhyla9OM5JSd7DtuUz7WBsDaxtrLXYuhmvkAil/UhSw
        Gn/1Iqck1S6V1K0RHJJslS0UVt8yVmsbesfY/bzizmtAmrHnhZ2ttPduqDvxtZcjBqsTjs
        p8MTPtzREKUXjiMZXSnJxhgjvnPGuwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644827331;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=csf2c85ZpeogGj2peNxurRHZTgb4VyZ58KRMwsGWiks=;
        b=qahSnl0DlnH2B8WC6gCZAEFaUGvaqH2KTttIcatqnQaKhYBcemt+bXn9Oa12wIg3Uc/9EU
        u7LBpDYNUWWYmHAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0193713780;
        Mon, 14 Feb 2022 08:28:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id gr/YOcISCmIcBQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 14 Feb 2022 08:28:50 +0000
Message-ID: <9b2e2649-1511-66a3-b346-60863de788fc@suse.de>
Date:   Mon, 14 Feb 2022 09:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-fbdev@vger.kernel.org, deller@gmx.de,
        linux-staging@lists.linux.dev, javierm@redhat.com,
        dri-devel@lists.freedesktop.org, bernie@plugable.com,
        noralf@tronnes.org, andriy.shevchenko@linux.intel.com,
        jayalk@intworks.biz
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-3-tzimmermann@suse.de>
 <CAMuHMdVb1JjZkEo-PM6DTXOywcmJDRr0a=Ci94DJCj7dXbbihw@mail.gmail.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdVb1JjZkEo-PM6DTXOywcmJDRr0a=Ci94DJCj7dXbbihw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qYMNiK15GhO0yeXxBpcrmaK0"
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
--------------qYMNiK15GhO0yeXxBpcrmaK0
Content-Type: multipart/mixed; boundary="------------Vb7tM0DJwTuwo2KBwi32W4CF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de,
 linux-staging@lists.linux.dev, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, bernie@plugable.com, noralf@tronnes.org,
 andriy.shevchenko@linux.intel.com, jayalk@intworks.biz
Message-ID: <9b2e2649-1511-66a3-b346-60863de788fc@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-3-tzimmermann@suse.de>
 <CAMuHMdVb1JjZkEo-PM6DTXOywcmJDRr0a=Ci94DJCj7dXbbihw@mail.gmail.com>
In-Reply-To: <CAMuHMdVb1JjZkEo-PM6DTXOywcmJDRr0a=Ci94DJCj7dXbbihw@mail.gmail.com>

--------------Vb7tM0DJwTuwo2KBwi32W4CF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDIuMjIgdW0gMDk6MDUgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFRodSwgRmViIDEwLCAyMDIyIGF0IDQ6MjQgUE0g
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4gRmJk
ZXYncyBkZWZlcnJlZCBJL08gc29ydHMgYWxsIGRpcnR5IHBhZ2VzIGJ5IGRlZmF1bHQsIHdo
aWNoIGluY3VycyBhDQo+PiBzaWduaWZpY2FudCBvdmVyaGVhZC4gTWFrZSB0aGUgc29ydGlu
ZyBzdGVwIG9wdGlvbmFsIGFuZCB1cGRhdGUgdGhlIGZldw0KPj4gZHJpdmVycyB0aGF0IHJl
cXVpcmUgaXQuIFVzZSBhIEZJRk8gbGlzdCBieSBkZWZhdWx0Lg0KPj4NCj4+IFNvcnRpbmcg
cGFnZXMgYnkgbWVtb3J5IG9mZnNldCBmb3IgZGVmZXJyZWQgSS9PIHBlcmZvcm1zIGFuIGlt
cGxpY2l0DQo+PiBidWJibGUtc29ydCBzdGVwIG9uIHRoZSBsaXN0IG9mIGRpcnR5IHBhZ2Vz
LiBUaGUgYWxnb3JpdGhtIGdvZXMgdGhyb3VnaA0KPj4gdGhlIGxpc3Qgb2YgZGlydHkgcGFn
ZXMgYW5kIGluc2VydHMgZWFjaCBuZXcgcGFnZSBhY2NvcmRpbmcgdG8gaXRzDQo+PiBpbmRl
eCBmaWVsZC4gRXZlbiB3b3JzZSwgbGlzdCB0cmF2ZXJzYWwgYWx3YXlzIHN0YXJ0cyBhdCB0
aGUgZmlyc3QNCj4+IGVudHJ5LiBBcyB2aWRlbyBtZW1vcnkgaXMgbW9zdCBsaWtlbHkgdXBk
YXRlZCBzY2FubGluZSBieSBzY2FubGluZSwgdGhlDQo+PiBhbGdvcml0aG0gdHJhdmVyc2Vz
IHRocm91Z2ggdGhlIGNvbXBsZXRlIGxpc3QgZm9yIGVhY2ggdXBkYXRlZCBwYWdlLg0KPj4N
Cj4+IEZvciBleGFtcGxlLCB3aXRoIDEwMjR4NzY4eDMyYnBwIGEgcGFnZSBjb3ZlcnMgZXhh
Y3RseSBvbmUgc2NhbmxpbmUuDQo+PiBXcml0aW5nIGEgc2luZ2xlIHNjcmVlbiB1cGRhdGUg
ZnJvbSB0b3AgdG8gYm90dG9tIHJlcXVpcmVzIHVwZGF0aW5nDQo+PiA3NjggcGFnZXMuIFdp
dGggYW4gYXZlcmFnZSBsaXN0IGxlbmd0aCBvZiAzODQgZW50cmllcywgYSBzY3JlZW4gdXBk
YXRlDQo+PiBjcmVhdGVzICg3NjggKiAzODQgPSkgMjk0OTEyIGNvbXBhcmUgb3BlcmF0aW9u
Lg0KPiANCj4gV2hhdCBhYm91dCB1c2luZyBmb2xpb3M/DQo+IElmIGNvbnNlY3V0aXZlIHBh
Z2VzIGFyZSBtZXJnZWQgaW50byBhIHNpbmdsZSBlbnRyeSwgdGhlcmUncyBtdWNoIGxlc3MN
Cj4gKG9yIG5vdGhpbmcgaW4gdGhlIGV4YW1wbGUgYWJvdmUpIHRvIHNvcnQuDQoNCkhvdyB3
b3VsZCB0aGUgY29kZSBrbm93IHRoYXQ/IENhbGxzIHRvIHBhZ2VfbWt3cml0ZSBoYXBwZW4g
DQpwYWdlZmF1bHQtYnktcGFnZWZhdWx0IGluIGFueSBvcmRlciBBRkFJQ1QuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y1LjE2Ljkvc291cmNlL2luY2x1ZGUvbGludXgvbW1fdHlwZXMuaCNMMjU4DQoNCg0K
PiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxv
dHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+
IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFs
aXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Vb7tM0DJwTuwo2KBwi32W4CF--

--------------qYMNiK15GhO0yeXxBpcrmaK0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIKEsEFAwAAAAAACgkQlh/E3EQov+C7
XhAAwt9OK9hvrCNCOjQVXo3sqB8EOXZqNe6p8AgD7gaRORuOGAkn+ZUYwYvpd45jizTViKlJk91m
OCaS+r3UOrVlsMTGOh6IgTxyaeNOwSXE24vjhmEe1gTO1BHj2fD5Qj95XWY7/IzQCNfcBes1WtUq
w37x1I8nGug+DWMf7KWQxGGDBu+8xaLW/E08kqcHN0l1rpkCTbEu0XYpY25qwbyYr6QZmZXxUjpH
xJeYqcUiMaEycaXlIxeMyBqbFRIgRXLre9KKQ7VKYihjnjezzu/NzE08kWbSl7/Yn2BlIE0fQtpn
xvyieoZ8+vugz1GF1I84I4rCk3HwlWppvgxAa04f+OxksHH40PfITsG/g0oGO+9vzWOOWbCEh/uj
AcV1IYl/zxAemR9fwVVlYvXOsHqaU1cyhfZndHC9m89HW2V5+Pm/ZiXVd/PVg0t0wTLFbRn4odGJ
Fp8FCQf3Ls/rC+ll1rOuwUOlVa8eaqzrIGDgDbuIHc6LT3LRB5KysaMruE7fQjPLGAp90RQyxzT7
b7Dq/0CsU99Z1ih3H2haeaevHGr2fLnosuWUasVNOc7KTARq4rjDPbTBseYTRdgfOpSFnbk1bSeT
SyoOvxNtkCZGnCJma5LhUC7fxldJ+9FQb/vdg4CeAndssax442Hqm8EtR0Sb8cEJp4+Uzh9chUu7
1/I=
=+XfN
-----END PGP SIGNATURE-----

--------------qYMNiK15GhO0yeXxBpcrmaK0--
