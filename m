Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE2F35FC1F9
	for <lists+linux-fbdev@lfdr.de>; Wed, 12 Oct 2022 10:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiJLI1l (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 12 Oct 2022 04:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiJLI1k (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 12 Oct 2022 04:27:40 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358B550FB8
        for <linux-fbdev@vger.kernel.org>; Wed, 12 Oct 2022 01:27:40 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D45071F37C;
        Wed, 12 Oct 2022 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1665563258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BRuyBuK4w++fJHkzxuAd13vQkh9RqoAGNTH0ooLKJp0=;
        b=CCYk7sYtWxgJLTva7a0y52lzrNnbNl3xYPB+HEgtQlatAs8PmNZnClMfnYdGYNHFeXepJ4
        vECzxO+9UXiQYFw1HfSlYX/BZqXHgLeckChfF+8xGK584rjXuqDpjbc5MmOm2kwbv9Youz
        LzP8trpfmfEbEadixQp8qsh04vJhy10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1665563258;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BRuyBuK4w++fJHkzxuAd13vQkh9RqoAGNTH0ooLKJp0=;
        b=RKYFq4XKzQUpL639ZDnB0yPfWq2iYMbEsIZ21ulEpUAefK4XMVW62vHj2urL8G6VXZz8OB
        S0cwLf3Z3VpCPDAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B4A013ACD;
        Wed, 12 Oct 2022 08:27:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id LI4eHXp6RmMCWgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 12 Oct 2022 08:27:38 +0000
Message-ID: <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
Date:   Wed, 12 Oct 2022 10:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
        maxime@cerno.tech, sam@ravnborg.org,
        Michal Suchanek <msuchanek@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        benh@kernel.crashing.org, Paul Mackerras <paulus@samba.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        mark.cave-ayland@ilande.co.uk
Cc:     linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------q01aFk6poIKuQvh4BWG9wJZ4"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------q01aFk6poIKuQvh4BWG9wJZ4
Content-Type: multipart/mixed; boundary="------------pMJZO6Q6Q7kQwqIHJjmFDrkd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, maxime@cerno.tech, sam@ravnborg.org,
 Michal Suchanek <msuchanek@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 benh@kernel.crashing.org, Paul Mackerras <paulus@samba.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, mark.cave-ayland@ilande.co.uk
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
In-Reply-To: <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>

--------------pMJZO6Q6Q7kQwqIHJjmFDrkd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMTAuMjIgdW0gMDk6NDQgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPiBP
biBXZWQsIE9jdCAxMiwgMjAyMiwgYXQgOTo0MCBBTSwgVGhvbWFzIFppbW1lcm1hbm4gd3Jv
dGU6DQo+PiBBbSAxMi4xMC4yMiB1bSAwOToxNyBzY2hyaWViIEFybmQgQmVyZ21hbm46DQo+
Pj4gT24gV2VkLCBPY3QgMTIsIDIwMjIsIGF0IDg6NDYgQU0sIFRob21hcyBaaW1tZXJtYW5u
IHdyb3RlOg0KPj4NCj4+PiBEb2VzIHFlbXUgbWFyayB0aGUgZGV2aWNlIGhhcyBoYXZpbmcg
YSBwYXJ0aWN1bGFyIGVuZGlhbmVzcyB0aGVuLCBvcg0KPj4+IGRvZXMgaXQgc3dpdGNoIHRo
ZSBsYXlvdXQgb2YgdGhlIGZyYW1lYnVmZmVyIHRvIG1hdGNoIHdoYXQgdGhlIENQVQ0KPj4+
IGRvZXM/DQo+Pg0KPj4gVGhlIGxhdHRlci4gT24gbmVpdGhlciBhcmNoaXRlY3R1cmUgZG9l
cyBxZW11IGV4cG9zZSB0aGlzIGZsYWcuIFRoZQ0KPj4gZGVmYXVsdCBlbmRpYW5lc3MgY29y
cmVzcG9uZHMgdG8gdGhlIGhvc3QuDQo+IA0KPiAiaG9zdCIgYXMgaW4gdGhlIG1hY2hpbmUg
dGhhdCBxZW11IHJ1bnMgb24sIG9yIHRoZSBtYWNoaW5lIHRoYXQgaXMNCj4gYmVpbmcgZW11
bGF0ZWQ/IEkgc3VwcG9zZSBpdCB3b3VsZCBiZSBicm9rZW4gZWl0aGVyIHdheSwgYnV0IGlu
IHRoZQ0KPiBsYXR0ZXIgY2FzZSwgd2UgY291bGQgZ2V0IGF3YXkgd2l0aCBkZXRlY3Rpbmcg
dGhhdCB0aGUgbWFjaGluZSBpcw0KPiBydW5uaW5nIHVuZGVyIHFlbXUuDQoNClNvcnJ5LCBt
eSBtaXN0YWtlLiBJIG1lYW50ICJndWVzdCI6IHRoZSBlbmRpYW5lc3Mgb2YgdGhlIGZyYW1l
YnVmZmVyIA0KY29ycmVzcG9uZHMgdG8gdGhlIGVuZGlhbmVzcyBvZiB0aGUgZW11bGF0ZWQg
bWFjaGluZS4gIEdpdmVuIHRoYXQgbWFueSANCmdyYXBoaWNzIGNhcmRzIHN1cHBvcnQgTEUg
YW5kIEJFIG1vZGVzLCBJIGFzc3VtZSB0aGF0IHRoaXMgYmVoYXZpb3IgDQptaW1pY3MgcmVh
bC1oYXJkd2FyZSBzeXN0ZW1zLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiAg
ICAgIEFybmQNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------pMJZO6Q6Q7kQwqIHJjmFDrkd--

--------------q01aFk6poIKuQvh4BWG9wJZ4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNGenoFAwAAAAAACgkQlh/E3EQov+AS
bw/8Ct9NMRmYNmR+Lh5nVeJGZCQd2uCzQZGGkmXMoQGiH40uxmTL8dSZX+5h7hdN3elcgsQMs1mc
dxs/E3SQAEawxl7mRWxDlGHZIUkbNcG/71eHauSJ3yhKILPzUvWVLyoIWUGWAmEaKqsdIlvcG2bB
UVdQPBh2wTrZ+oea5vHDmGtkRfjHBAAc/3EoKZB3KwqfxIBY2gVZIi5GzbuMbVtrJD08SycI8QRE
i20++bNQD7erhVMB0pU6Gv0u9xe28Ev5WzZ2NcgDVkN5DGAFJR4wuKiSHbbMg2IWHHRZWriq7GXQ
vQlmJsImaHQqLrU/iP9t3ZgWJ12tgasBdUlFc6unA7tf8HO6N/AZxa2CVfMkE23xQvFd05tvFZ94
PAyoxiWNX09wVYdNjaqt+Z9+Rzrnx/LZFYSpP/M18MdAT+H6pK1WTtfpvPYB6aZ9JmzPSgzfP4fn
PK4c2QEWpWBT2oeifqXH4I6U0fWopSo3F/fh6V2aOBAjezws3nBkG3U8EJvnOj50OrYLZiWMJBhG
flNXXPrIEriA1fv8g2Si3RR6OFISEjwFPOFB16oftUykWMwU10kVnFx95HP7LWpSP7ZVM+UUsJ+o
H/lae5Tio2M7izWA0ZHHnX0k2txHz8ofIqm1kI7f0VZpb2qCQR98SQ9RlNshH0CI5umWjiTQFb++
Hyo=
=7tX/
-----END PGP SIGNATURE-----

--------------q01aFk6poIKuQvh4BWG9wJZ4--
