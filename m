Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9FF2582187
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Jul 2022 09:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiG0HvE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Jul 2022 03:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiG0HvE (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Jul 2022 03:51:04 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD1433A05
        for <linux-fbdev@vger.kernel.org>; Wed, 27 Jul 2022 00:51:00 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D75FD34022;
        Wed, 27 Jul 2022 07:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1658908258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VkPPdPg9l08G6rTxR0Amp2eEJUDiyiJ+XCbfgMfmcf0=;
        b=pSOwH3UQ1GykO2CkjY6BnDYqSqT26ESlHsKlE6ixlzPMgbHOAi3TO3YIuieCJZC8C8tf7V
        ZUGZK66gpcCr4xujqHnyUAgAWZH4zcigbNgQ0UOM4plYcU+Utz1v0KiDxUEV7eILkA3Rdc
        SerclFto1GRmumiZqAFyQ4MJaSAOv9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1658908258;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VkPPdPg9l08G6rTxR0Amp2eEJUDiyiJ+XCbfgMfmcf0=;
        b=lFtvx+NlIv3pwCq7tJj85YJWdWXPRu9zttewJ6Izwg9KL4X9wfsPHEJN8PQLiKv2XcxTpu
        W8pE1oBCLZyvJ7CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9496A13AD7;
        Wed, 27 Jul 2022 07:50:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id y94uI2Lu4GI6HAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 07:50:58 +0000
Message-ID: <314820f8-3609-9182-97eb-ee30e240d114@suse.de>
Date:   Wed, 27 Jul 2022 09:50:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/10] drm/simpledrm: Inline device-init helpers
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
        daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech,
        sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org, geert@linux-m68k.org,
        mark.cave-ayland@ilande.co.uk
Cc:     linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-3-tzimmermann@suse.de>
 <be24a47c-c41a-411a-da63-c699b53cb459@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <be24a47c-c41a-411a-da63-c699b53cb459@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FqnZyTFIFO1nN8YZ5bYipchu"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FqnZyTFIFO1nN8YZ5bYipchu
Content-Type: multipart/mixed; boundary="------------TTbiymSWAJL5BwQsESE497su";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <314820f8-3609-9182-97eb-ee30e240d114@suse.de>
Subject: Re: [PATCH v2 02/10] drm/simpledrm: Inline device-init helpers
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-3-tzimmermann@suse.de>
 <be24a47c-c41a-411a-da63-c699b53cb459@redhat.com>
In-Reply-To: <be24a47c-c41a-411a-da63-c699b53cb459@redhat.com>

--------------TTbiymSWAJL5BwQsESE497su
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDcuMjIgdW0gMTc6MDEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDcvMjAvMjIgMTY6MjcsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSW5saW5lIHRoZSBoZWxwZXJzIGZvciBpbml0aWFs
aXppbmcgdGhlIGhhcmR3YXJlIEZCLCB0aGUgbWVtb3J5DQo+PiBtYW5hZ2VtZW50IGFuZCB0
aGUgbW9kZXNldHRpbmcgaW50byB0aGUgZGV2aWNlLWNyZWF0aW9uIGZ1bmN0aW9uLg0KPj4g
Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPj4NCj4gDQo+IENvdWxkIHlvdSBwbGVhc2UgZWxh
Ym9yYXRlIGluIHRoZSBjb21taXQgbWVzc2FnZSB3aHkgdGhpcyBjaGFuZ2UgaXMNCj4gZGVz
aXJhYmxlPyAgV2l0aG91dCB0aGlzIGFkZGl0aW9uYWwgY29udGV4dCwgdGhpcyBmZWVscyBs
aWtlIGdvaW5nDQo+IGJhY2t3YXJkcywgc2luY2UgeW91IGFyZSBkcm9wcGluZyBmZXcgaGVs
cGVycyB0aGF0IGhhdmUgcXVpdGUgc2VsZg0KPiBjb250YWluZWQgY29kZSBhbmQgbWFraW5n
IHNpbXBsZWRybV9kZXZpY2VfY3JlYXRlKCkgbXVjaCBsYXJnZXIuDQoNClRvIGNsYXJpZnk6
IEkgd2FudCB0byBtYWtlIHRoZSBpbml0IGNvZGUgbW9yZSBlYXN5IHRvIGZvbGxvdy4gVGhl
c2Ugb2xkIA0KaW5pdCBmdW5jdGlvbnMgc3RpbGwgaGFkIHRvIGJlIGNhbGxlZCBpbiB0aGUg
cmlnaHQgb3JkZXIgYXMgZWFjaCANCnBvc3NpYmx5IGRlcGVuZHMgb24gc2V0dGluZ3MgZnJv
bSB0aGUgb3RoZXJzLiBJdCBhbHNvIGZlZWxzIGxpa2UgaXQncyANCmVhc2llciB0byBleHRy
YWN0IGNvbW1vbiBjb2RlIGZvciBvZmRybS4gQW5kIHRoZSBwaXBlbGluZSBpcyBzdGF0aWMs
IHNvIA0KaXQgZG9lc24ndCByZXF1aXJlIGNvbXBsZXggY2hhaW5zIG9mIGhlbHBlciBjYWxs
cy4gSGF2aW5nIGV2ZXJ5dGhpbmcgaW4gDQpvbmUgaGVscGVyIHNlZW1zIGJlbmVmaWNpYWwu
IChJdCdzIGEgdHJhZGUtb2ZmLCBJIGtub3cuKQ0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------TTbiymSWAJL5BwQsESE497su--

--------------FqnZyTFIFO1nN8YZ5bYipchu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLg7mIFAwAAAAAACgkQlh/E3EQov+CZ
Ew/+JHVF3ax69iHxR1wxHDuSKB9WwNFOPt4cKk6WEN177vLjqPkh4VI5HCpLAbZVuAhWgWyQ1Kju
UABttdmJJWp1KlV659Zu02qh1PW6qcDZhKkj5el5IWA6ZsmyFuN8u5B3qwuMg5mCcPQQPBrpEPVq
2NDDSv/drBTqXtUAAZ4cbGjvOKyO7qtUw/S+0GNZUkdALza0o6liBBExFoS4+UdGapW4bstnbKQo
vAES9a6A65t0H0H5tKoswjAipA7A846WjXcbMiiiBlCbdhEeRl7nK7yDKNInv6NH/uMsBVH+Ke2Q
AJA9yZmwwztYF/56YNOQCISq9qp+7ABB3IvHxwikJg+j31xtpoe9S/OoNMwI9L9JBk/ah8LTXb+q
va6OMD1Y9nQD2abXActM0wcIa+v9sEFydG9ih4txtluQjqAvGnzu4lqUAIe9FKnbYH28x4Cec0nM
qEJuJCZjk59xKbgvnZ4+BstNpOwQnE2FX3z/yzoNJwF7SgaWMvQzMJUHuY3qUMAEDy4bMgwCviMJ
aSmmcmuZn2S3cAIVrj14oeyNWinx68XwsbWwC8auCoxA7J15mGZ7xejMRLqOO2nutXT7nXYDs32w
45tBzqmZ653lE+/DMooixhdE7FFtoKdq5nvCg0kgIAj/qvowCulXOge6Wt3EieLMOvaq3zWdKdHr
3sI=
=zxgi
-----END PGP SIGNATURE-----

--------------FqnZyTFIFO1nN8YZ5bYipchu--
