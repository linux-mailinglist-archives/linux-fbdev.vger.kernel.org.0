Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696AF6C0E37
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 Mar 2023 11:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbjCTKHt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 Mar 2023 06:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbjCTKHf (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 Mar 2023 06:07:35 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666F040D8;
        Mon, 20 Mar 2023 03:07:08 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 74BA721B28;
        Mon, 20 Mar 2023 10:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1679306822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=haaiIFcvPvVBP8U8qE/dcTaBXt3S1GdaqdJKTp0/vm0=;
        b=eZfpL307o91m50mQHRAx9RDsSIogf9TcvzSnXljoZGngs5ct5zF6rWIQvZrCW/aiMo6QRI
        IKyDP8hw+zKsAN7o/6EsqvZGkIDV/XuwrtUGipyyQ4DZIr7ckvDxmJ+k/Pr3sMCt3O6ak4
        D+deMOY+tG/pbsgg5AKHjJbeEvaj29A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1679306822;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=haaiIFcvPvVBP8U8qE/dcTaBXt3S1GdaqdJKTp0/vm0=;
        b=loCs+Iq4U1PDIP1YjGQ7wBH8YPfHHmLDOBEfNZ9ldX8lhgpy1yRokaffM5nOaWGe0Qg87y
        tAe3PJ9jyKz+YkBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11A9413A00;
        Mon, 20 Mar 2023 10:07:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id WD0cA0YwGGThBgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 10:07:02 +0000
Message-ID: <2d278ea0-287c-dbaf-f0c0-cd1fb5a9bc31@suse.de>
Date:   Mon, 20 Mar 2023 11:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 000/101] fbdev: Fix memory leak in option parsing
Content-Language: en-US
To:     deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
        rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
        linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
        thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
        sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
        corbet@lwn.net
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230309160201.5163-1-tzimmermann@suse.de>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230309160201.5163-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------y54XpXgntq3mcSgNbitRmaes"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------y54XpXgntq3mcSgNbitRmaes
Content-Type: multipart/mixed; boundary="------------3Ca2SuJkc43s2zEfPoN1ey0P";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <2d278ea0-287c-dbaf-f0c0-cd1fb5a9bc31@suse.de>
Subject: Re: [PATCH v2 000/101] fbdev: Fix memory leak in option parsing
References: <20230309160201.5163-1-tzimmermann@suse.de>
In-Reply-To: <20230309160201.5163-1-tzimmermann@suse.de>

--------------3Ca2SuJkc43s2zEfPoN1ey0P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

R2VlcnQsIEhlbGdlPyAgRG8geW91IGhhdmUgZnVydGhlciBjb21tZW50cz8gIFRoZXJlJ3Mg
bm90IHJlYWxseSBtdWNoIA0KZm9yIGEgdjMgeWV0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQpBbSAwOS4wMy4yMyB1bSAxNzowMCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0K
PiBJbnRyb2R1Y2Ugc3RydWN0IG9wdGlvbl9pdGVyIGFuZCBoZWxwZXJzIHRvIHBhcnNlIGNv
bW1hbmQtbGluZQ0KPiBvcHRpb25zIHdpdGggY29tbWEtc2VwYXJhdGVkIGtleS12YWx1ZSBw
YWlycy4gVGhlbiBjb252ZXJ0IGZiZGV2DQo+IGRyaXZlcnMgdG8gdGhlIG5ldyBpbnRlcmZh
Y2UuIEZpeGVzIGEgbWVtb3J5IGxlYWsgaW4gdGhlIHBhcnNpbmcgb2YNCj4gdGhlIHZpZGVv
PSBvcHRpb24uDQo+IA0KPiBCZWZvcmUgY29tbWl0IDczY2U3M2MzMGJhOSAoImZiZGV2OiBU
cmFuc2ZlciB2aWRlbz0gb3B0aW9uIHN0cmluZ3MgdG8NCj4gY2FsbGVyOyBjbGFyaWZ5IG93
bmVyc2hpcCIpLCBhIGNhbGwgdG8gZmJfZ2V0X29wdGlvbnMoKSBlaXRoZXINCj4gcmV0dXJu
ZWQgYW4gaW50ZXJuYWwgc3RyaW5nIG9yIGEgZHVwbGljYXRlZCBzdHJpbmc7IGhlbmNlIG93
bmVyc2hpcCBvZg0KPiB0aGUgc3RyaW5nJ3MgbWVtb3J5IGJ1ZmZlciB3YXMgbm90IHdlbGwg
ZGVmaW5lZCwgYnV0IGRlcGVuZGVkIG9uIGhvdw0KPiB1c2VycyBzcGVjaWZpZWQgdGhlIHZp
ZGVvPSBvcHRpb24gb24gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUuIEZvcg0KPiBnbG9iYWwg
c2V0dGluZ3MsIHRoZSBjYWxsZXIgb3duZWQgdGhlIHJldHVybmVkIG1lbW9yeSBhbmQgZm9y
IHBlci1kcml2ZXINCj4gc2V0dGluZ3MsIGZiX2dldF9vcHRpb25zKCkgb3duZWQgdGhlIG1l
bW9yeS4gQXMgY2FsbGluZyBkcml2ZXJzIHdlcmUNCj4gdW5hYmxlIHRvIGRldGVjdCB0aGUg
Y2FzZSwgdGhleSBoYWQgbm8gb3B0aW9uIGJ1dCB0byBsZWFrIHRoZSB0aGUgbWVtb3J5Lg0K
PiANCj4gQ29tbWl0IDczY2U3M2MzMGJhOSAoImZiZGV2OiBUcmFuc2ZlciB2aWRlbz0gb3B0
aW9uIHN0cmluZ3MgdG8gY2FsbGVyOw0KPiBjbGFyaWZ5IG93bmVyc2hpcCIpIGNoYW5nZWQg
c2VtYW50aWNzIHRvIGNhbGxlci1vd25lZCBzdHJpbmdzLiBEcml2ZXJzDQo+IHN0aWxsIGxl
YWtlZCB0aGUgbWVtb3J5LCBidXQgYXQgbGVhc3Qgb3duZXJzaGlwIHdhcyBjbGVhci4NCj4g
DQo+IFRoaXMgcGF0Y2hzZXQgZml4ZXMgdGhlIG1lbW9yeSBsZWFrIGFuZCBjaGFuZ2VzIHN0
cmluZyBvd25lcnNoaXAgYmFjaw0KPiB0byBmYl9nZXRfb3B0aW9ucygpLiBQYXRjaCAxIGlu
dHJvZHVjZXMgc3RydWN0IG9wdGlvbl9pdGVyIGFuZCBhIGZldw0KPiBoZWxwZXJzLiBUaGUg
aW50ZXJmYWNlIHRha2VzIGFuIG9wdGlvbiBzdHJpbmcsIHN1Y2ggYXMgdmlkZW89LCBpbiB0
aGUNCj4gY29tbW9uIGZvcm0gdmFsdWUxLGtleTI6dmFsdWUyLHZhbHVlMyBldGMgYW5kIHJl
dHVybnMgdGhlIGluZGl2aWR1YWwNCj4gY29tbWEtc2VwYXJhdGVkIHBhaXJzLiBWYXJpb3Vz
IG1vZHVsZXMgdXNlIHRoaXMgcGF0dGVybiwgc28gdGhlIGNvZGUNCj4gaXMgbG9jYXRlZCB1
bmRlciBsaWIvLg0KPiANCj4gUGF0Y2hlcyAyIHRvIDEwMCBnbyB0aHJvdWdoIGZiZGV2IGRy
aXZlcnMgYW5kIGNvbnZlcnQgdGhlbSB0byB0aGUgbmV3DQo+IGludGVyZmFjZS4gVGhpcyBv
ZnRlbiByZXF1aXJlcyBhIG51bWJlciBvZiBjbGVhbnVwcy4gQSBkcml2ZXIgd291bGQNCj4g
dHlwaWNhbGx5IHJlZmVyIHRvIHRoZSBvcHRpb24gc3RyaW5nJ3MgdmlkZW8gbW9kZS4gU3Vj
aCBzdHJpbmdzIGFyZSBub3cNCj4gY29waWVkIHRvIGRyaXZlci1hbGxvY2F0ZWQgbWVtb3J5
IHNvIHRoYXQgZHJpdmVycyBkb24ndCByZWZlciBkaXJlY3RseQ0KPiB0byB0aGUgb3B0aW9u
IHN0cmluZydzIG1lbW9yeS4gVGhlIG9wdGlvbiBpdGVyYXRvciB0aGVuIHJlcGxhY2VzIG1h
bnVhbA0KPiBwYXJzaW5nIGxvb3BzIGJhc2VkIG9uIHN0cnNlcCgiLCIpLiBBbGwgZHJpdmVy
LWFsbG9jYXRlZCBtZW1vcnkgaXMNCj4gcmVsZWFzZWQgYnkgcmVtb3ZpbmcgdGhlIGRldmlj
ZSBvciB1bmxvYWRpbmcgdGhlIG1vZHVsZS4NCj4gDQo+IFBhdGNoIDEwMSBmaW5hbGx5IGNo
YW5nZXMgdGhlIG93bmVyc2hpcCBvZiB0aGUgb3B0aW9uIHN0cmluZyB0byBiZQ0KPiBpbnRl
cm5hbCB0byBmYl9nZXRfb3B0aW9uKCk7IHRoZXJlYnkgZml4aW5nIHRoZSBtZW1vcnkgbGVh
ay4gVGhlIG9wdGlvbg0KPiBpdGVyYXRvciBob2xkcyBpdHMgb3duIGNvcHkgb2YgdGhlIHN0
cmluZyBhbmQgaXMgbm90IGFmZmVjdGVkIGJ5IHRoZQ0KPiBjaGFuZ2UuDQo+IA0KPiBNb3N0
IGZiZGV2IGRyaXZlcnMgb25seSBzdXBwb3J0IHRvIHBhcnNlIG9wdGlvbiBzdHJpbmdzIGlm
IHRoZXkgYXJlDQo+IGJ1aWx0LWluLiBJIGFzc3VtZSB0aGF0J3MgYmVjYXVzZSBvZiB0aGUg
b3JpZ2luYWwgZnV6enkgc2VtYW50aWNzIG9mDQo+IGZiX2dldF9vcHRpb25zKCkuIEEgbGF0
ZXIgcGF0Y2hzZXQgY291bGQgY2hhbmdlIHRoZSBkcml2ZXIgdG8gcmVzcGVjdA0KPiB2aWRl
bz0gc2V0dGluZ3MgaW4gYW55IGNvbmZpZ3VyYXRpb24uDQo+IA0KPiB2MjoNCj4gCSogdXNl
IGtzdHJkdXAoKS9rZnJlZSgpIGZvciB2aWRlbyBzdHJpbmdzIChHZWVydCwgVGltdXIpDQo+
IAkqIGZpeCBpdGVyYXRvciBkb2NzIChSYW5keSkNCj4gCSogdXBkYXRlIGl0ZXJhdG9yIGlu
dGVyZmFjZQ0KPiANCj4gVGhvbWFzIFppbW1lcm1hbm4gKDEwMSk6DQo+ICAgIGxpYjogQWRk
IG9wdGlvbiBpdGVyYXRvcg0KPiAgICBmYmRldi82ODMyOGZiOiBSZW1vdmUgdHJhaWxpbmcg
d2hpdGVzcGFjZXMNCj4gICAgZmJkZXYvNjgzMjhmYjogUmVtb3ZlIHVudXNlZCBvcHRpb24g
c3RyaW5nDQo+ICAgIGZiZGV2L2Fjb3JuZmI6IE9ubHkgaW5pdCBmYl9pbmZvIG9uY2UNCj4g
ICAgZmJkZXYvYWNvcm5mYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVjdCBvcHRp
b25faXRlcg0KPiAgICBmYmRldi9hbWlmYjogRHVwbGljYXRlIHZpZGVvLW1vZGUgb3B0aW9u
IHN0cmluZw0KPiAgICBmYmRldi9hbWlmYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0
cnVjdCBvcHRpb25faXRlcg0KPiAgICBmYmRldi9hcmtmYjogRHVwbGljYXRlIHZpZGVvLW1v
ZGUgb3B0aW9uIHN0cmluZw0KPiAgICBmYmRldi9hdGFmYjogRHVwbGljYXRlIHZpZGVvLW1v
ZGUgb3B0aW9uIHN0cmluZw0KPiAgICBmYmRldi9hdGFmYjogUGFyc2Ugb3B0aW9uIHN0cmlu
ZyB3aXRoIHN0cnVjdCBvcHRpb25faXRlcg0KPiAgICBmYmRldi9hdHk6IER1cGxpY2F0ZSB2
aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4gICAgZmJkZXYvYXR5OiBQYXJzZSBvcHRpb24g
c3RyaW5nIHdpdGggc3RydWN0IG9wdGlvbl9pdGVyDQo+ICAgIGZiZGV2L2F1MTEwMGZiOiBQ
YXJzZSBvcHRpb24gc3RyaW5nIHdpdGggc3RydWN0IG9wdGlvbl9pdGVyDQo+ICAgIGZiZGV2
L2F1MTIwMGZiOiBQYXJzZSBvcHRpb24gc3RyaW5nIHdpdGggc3RydWN0IG9wdGlvbl9pdGVy
DQo+ICAgIGZiZGV2L2NpcnJ1c2ZiOiBEdXBsaWNhdGUgdmlkZW8tbW9kZSBvcHRpb24gc3Ry
aW5nDQo+ICAgIGZiZGV2L2NpcnJ1c2ZiOiBQYXJzZSBvcHRpb24gc3RyaW5nIHdpdGggc3Ry
dWN0IG9wdGlvbl9pdGVyDQo+ICAgIGZiZGV2L2NvbnRyb2xmYjogUmVtb3ZlIHRyYWlsaW5n
IHdoaXRlc3BhY2VzDQo+ICAgIGZiZGV2L2NvbnRyb2xmYjogUGFyc2Ugb3B0aW9uIHN0cmlu
ZyB3aXRoIHN0cnVjdCBvcHRpb25faXRlcg0KPiAgICBmYmRldi9jeWJlcjIwMDBmYjogUGFy
c2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVjdCBvcHRpb25faXRlcg0KPiAgICBmYmRldi9l
ZmlmYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVjdCBvcHRpb25faXRlcg0KPiAg
ICBmYmRldi9mbTJmYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVjdCBvcHRpb25f
aXRlcg0KPiAgICBmYmRldi9mc2wtZGl1LWZiOiBEdXBsaWNhdGUgdmlkZW8tbW9kZSBvcHRp
b24gc3RyaW5nDQo+ICAgIGZiZGV2L2ZzbC1kaXUtZmI6IFBhcnNlIG9wdGlvbiBzdHJpbmcg
d2l0aCBzdHJ1Y3Qgb3B0aW9uX2l0ZXINCj4gICAgZmJkZXYvZ2JlZmI6IER1cGxpY2F0ZSB2
aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4gICAgZmJkZXYvZ2JlZmI6IFBhcnNlIG9wdGlv
biBzdHJpbmcgd2l0aCBzdHJ1Y3Qgb3B0aW9uX2l0ZXINCj4gICAgZmJkZXYvZ2VvZGU6IER1
cGxpY2F0ZSB2aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4gICAgZmJkZXYvZ2VvZGU6IFBh
cnNlIG9wdGlvbiBzdHJpbmcgd2l0aCBzdHJ1Y3Qgb3B0aW9uX2l0ZXINCj4gICAgZmJkZXYv
Z3J2Z2E6IER1cGxpY2F0ZSB2aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4gICAgZmJkZXYv
Z3J2Z2E6IFBhcnNlIG9wdGlvbiBzdHJpbmcgd2l0aCBzdHJ1Y3Qgb3B0aW9uX2l0ZXINCj4g
ICAgZmJkZXYvZ3h0NDUwMDogRHVwbGljYXRlIHZpZGVvLW1vZGUgb3B0aW9uIHN0cmluZw0K
PiAgICBmYmRldi9oeXBlcnZfZmI6IER1cGxpY2F0ZSB2aWRlby1tb2RlIG9wdGlvbiBzdHJp
bmcNCj4gICAgZmJkZXYvaTc0MGZiOiBEdXBsaWNhdGUgdmlkZW8tbW9kZSBvcHRpb24gc3Ry
aW5nDQo+ICAgIGZiZGV2L2k3NDBmYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVj
dCBvcHRpb25faXRlcg0KPiAgICBmYmRldi9pODEwOiBEdXBsaWNhdGUgdmlkZW8tbW9kZSBv
cHRpb24gc3RyaW5nDQo+ICAgIGZiZGV2L2k4MTA6IFBhcnNlIG9wdGlvbiBzdHJpbmcgd2l0
aCBzdHJ1Y3Qgb3B0aW9uX2l0ZXINCj4gICAgZmJkZXYvaW1zdHRmYjogUGFyc2Ugb3B0aW9u
IHN0cmluZyB3aXRoIHN0cnVjdCBvcHRpb25faXRlcg0KPiAgICBmYmRldi9pbnRlbGZiOiBE
dXBsaWNhdGUgdmlkZW8tbW9kZSBvcHRpb24gc3RyaW5nDQo+ICAgIGZiZGV2L2ludGVsZmI6
IFBhcnNlIG9wdGlvbiBzdHJpbmcgd2l0aCBzdHJ1Y3Qgb3B0aW9uX2l0ZXINCj4gICAgZmJk
ZXYvaW14ZmI6IER1cGxpY2F0ZSB2aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4gICAgZmJk
ZXYvaW14ZmI6IFBhcnNlIG9wdGlvbiBzdHJpbmcgd2l0aCBzdHJ1Y3Qgb3B0aW9uX2l0ZXIN
Cj4gICAgZmJkZXYva3lyb2ZiOiBEdXBsaWNhdGUgdmlkZW8tbW9kZSBvcHRpb24gc3RyaW5n
DQo+ICAgIGZiZGV2L2t5cm9mYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVjdCBv
cHRpb25faXRlcg0KPiAgICBmYmRldi9tYWNmYjogUmVtb3ZlIHRyYWlsaW5nIHdoaXRlc3Bh
Y2VzDQo+ICAgIGZiZGV2L21hY2ZiOiBQYXJzZSBvcHRpb24gc3RyaW5nIHdpdGggc3RydWN0
IG9wdGlvbl9pdGVyDQo+ICAgIGZiZGV2L21hdHJveGZiOiBQYXJzZSBvcHRpb24gc3RyaW5n
IHdpdGggc3RydWN0IG9wdGlvbl9pdGVyDQo+ICAgIGZiZGV2L214M2ZiOiBEdXBsaWNhdGUg
dmlkZW8tbW9kZSBvcHRpb24gc3RyaW5nDQo+ICAgIGZiZGV2L214M2ZiOiBQYXJzZSBvcHRp
b24gc3RyaW5nIHdpdGggc3RydWN0IG9wdGlvbl9pdGVyDQo+ICAgIGZiZGV2L25lb2ZiOiBE
dXBsaWNhdGUgdmlkZW8tbW9kZSBvcHRpb24gc3RyaW5nDQo+ICAgIGZiZGV2L25lb2ZiOiBQ
YXJzZSBvcHRpb24gc3RyaW5nIHdpdGggc3RydWN0IG9wdGlvbl9pdGVyDQo+ICAgIGZiZGV2
L252aWRpYWZiOiBEdXBsaWNhdGUgdmlkZW8tbW9kZSBvcHRpb24gc3RyaW5nDQo+ICAgIGZi
ZGV2L252aWRpYWZiOiBQYXJzZSBvcHRpb24gc3RyaW5nIHdpdGggc3RydWN0IG9wdGlvbl9p
dGVyDQo+ICAgIGZiZGV2L29jZmI6IER1cGxpY2F0ZSB2aWRlby1tb2RlIG9wdGlvbiBzdHJp
bmcNCj4gICAgZmJkZXYvb2NmYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVjdCBv
cHRpb25faXRlcg0KPiAgICBmYmRldi9vbWFwZmI6IFBhcnNlIG9wdGlvbiBzdHJpbmcgd2l0
aCBzdHJ1Y3Qgb3B0aW9uX2l0ZXINCj4gICAgZmJkZXYvcGxhdGludW1mYjogUmVtb3ZlIHRy
YWlsaW5nIHdoaXRlc3BhY2VzDQo+ICAgIGZiZGV2L3BsYXRpbnVtZmI6IFBhcnNlIG9wdGlv
biBzdHJpbmcgd2l0aCBzdHJ1Y3Qgb3B0aW9uX2l0ZXINCj4gICAgZmJkZXYvcG0yZmI6IER1
cGxpY2F0ZSB2aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4gICAgZmJkZXYvcG0yZmI6IFBh
cnNlIG9wdGlvbiBzdHJpbmcgd2l0aCBzdHJ1Y3Qgb3B0aW9uX2l0ZXINCj4gICAgZmJkZXYv
cG0zZmI6IER1cGxpY2F0ZSB2aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4gICAgZmJkZXYv
cG0zZmI6IFBhcnNlIG9wdGlvbiBzdHJpbmcgd2l0aCBzdHJ1Y3Qgb3B0aW9uX2l0ZXINCj4g
ICAgZmJkZXYvcHMzZmI6IER1cGxpY2F0ZSB2aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4g
ICAgZmJkZXYvcHMzZmI6IFBhcnNlIG9wdGlvbiBzdHJpbmcgd2l0aCBzdHJ1Y3Qgb3B0aW9u
X2l0ZXINCj4gICAgZmJkZXYvcHZyMmZiOiBEdXBsaWNhdGUgdmlkZW8tbW9kZSBvcHRpb24g
c3RyaW5nDQo+ICAgIGZiZGV2L3B2cjJmYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0
cnVjdCBvcHRpb25faXRlcg0KPiAgICBmYmRldi9weGFmYjogUGFyc2Ugb3B0aW9uIHN0cmlu
ZyB3aXRoIHN0cnVjdCBvcHRpb25faXRlcg0KPiAgICBmYmRldi9yaXZhZmI6IER1cGxpY2F0
ZSB2aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4gICAgZmJkZXYvcml2YWZiOiBQYXJzZSBv
cHRpb24gc3RyaW5nIHdpdGggc3RydWN0IG9wdGlvbl9pdGVyDQo+ICAgIGZiZGV2L3MzZmI6
IER1cGxpY2F0ZSB2aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4gICAgZmJkZXYvczNmYjog
UGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVjdCBvcHRpb25faXRlcg0KPiAgICBmYmRl
di9zYXZhZ2VmYjogRHVwbGljYXRlIHZpZGVvLW1vZGUgb3B0aW9uIHN0cmluZw0KPiAgICBm
YmRldi9zYXZhZ2VmYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVjdCBvcHRpb25f
aXRlcg0KPiAgICBmYmRldi9zaXNmYjogQ29uc3RpZnkgbW9kZSBzdHJpbmcNCj4gICAgZmJk
ZXYvc2lzZmI6IFBhcnNlIG9wdGlvbiBzdHJpbmcgd2l0aCBzdHJ1Y3Qgb3B0aW9uX2l0ZXIN
Cj4gICAgZmJkZXYvc2tlbGV0b25mYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVj
dCBvcHRpb25faXRlcg0KPiAgICBmYmRldi9zbTcxMmZiOiBEdXBsaWNhdGUgdmlkZW8tbW9k
ZSBvcHRpb24gc3RyaW5nDQo+ICAgIGZiZGV2L3NzdGZiOiBEdXBsaWNhdGUgdmlkZW8tbW9k
ZSBvcHRpb24gc3RyaW5nDQo+ICAgIGZiZGV2L3NzdGZiOiBQYXJzZSBvcHRpb24gc3RyaW5n
IHdpdGggc3RydWN0IG9wdGlvbl9pdGVyDQo+ICAgIGZiZGV2L3N0aWZiOiBSZW1vdmUgdHJh
aWxpbmcgd2hpdGVzcGFjZXMNCj4gICAgZmJkZXYvc3RpZmI6IENvbnN0aWZ5IG9wdGlvbiBz
dHJpbmcNCj4gICAgZmJkZXYvdGRmeGZiOiBEdXBsaWNhdGUgdmlkZW8tbW9kZSBvcHRpb24g
c3RyaW5nDQo+ICAgIGZiZGV2L3RkZnhmYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0
cnVjdCBvcHRpb25faXRlcg0KPiAgICBmYmRldi90Z2FmYjogRHVwbGljYXRlIHZpZGVvLW1v
ZGUgb3B0aW9uIHN0cmluZw0KPiAgICBmYmRldi90Z2FmYjogUGFyc2Ugb3B0aW9uIHN0cmlu
ZyB3aXRoIHN0cnVjdCBvcHRpb25faXRlcg0KPiAgICBmYmRldi90bWlvZmI6IFJlbW92ZSB1
bnVzZWQgb3B0aW9uIHN0cmluZw0KPiAgICBmYmRldi90cmlkZW50ZmI6IER1cGxpY2F0ZSB2
aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4gICAgZmJkZXYvdHJpZGVudGZiOiBQYXJzZSBv
cHRpb24gc3RyaW5nIHdpdGggc3RydWN0IG9wdGlvbl9pdGVyDQo+ICAgIGZiZGV2L3V2ZXNh
ZmI6IER1cGxpY2F0ZSB2aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4gICAgZmJkZXYvdXZl
c2FmYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVjdCBvcHRpb25faXRlcg0KPiAg
ICBmYmRldi92YWxreXJpZWZiOiBSZW1vdmUgdHJhaWxpbmcgd2hpdGVzcGFjZXMNCj4gICAg
ZmJkZXYvdmFsa3lyaWVmYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVjdCBvcHRp
b25faXRlcg0KPiAgICBmYmRldi92ZXJtaWxpb246IFJlbW92ZSB1bnVzZWQgb3B0aW9uIHN0
cmluZw0KPiAgICBmYmRldi92ZXNhZmI6IFBhcnNlIG9wdGlvbiBzdHJpbmcgd2l0aCBzdHJ1
Y3Qgb3B0aW9uX2l0ZXINCj4gICAgZmJkZXYvdmZiOiBSZW1vdmUgdHJhaWxpbmcgd2hpdGVz
cGFjZXMNCj4gICAgZmJkZXYvdmZiOiBEdXBsaWNhdGUgdmlkZW8tbW9kZSBvcHRpb24gc3Ry
aW5nDQo+ICAgIGZiZGV2L3ZmYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRoIHN0cnVjdCBv
cHRpb25faXRlcg0KPiAgICBmYmRldi92aWFmYjogUGFyc2Ugb3B0aW9uIHN0cmluZyB3aXRo
IHN0cnVjdCBvcHRpb25faXRlcg0KPiAgICBmYmRldi92dDg2MjNmYjogRHVwbGljYXRlIHZp
ZGVvLW1vZGUgb3B0aW9uIHN0cmluZw0KPiAgICBzdGFnaW5nL3NtNzUwZmI6IFJlbGVhc2Ug
Z19zZXR0aW5ncyBpbiBtb2R1bGUtZXhpdCBmdW5jdGlvbg0KPiAgICBzdGFnaW5nL3NtNzUw
ZmI6IER1cGxpY2F0ZSB2aWRlby1tb2RlIG9wdGlvbiBzdHJpbmcNCj4gICAgc3RhZ2luZy9z
bTc1MGZiOiBQYXJzZSBvcHRpb24gc3RyaW5nIHdpdGggc3RydWN0IG9wdGlvbl9pdGVyDQo+
ICAgIGZiZGV2OiBDb25zdGlmeSBvcHRpb24gc3RyaW5ncw0KPiANCj4gICBEb2N1bWVudGF0
aW9uL2NvcmUtYXBpL2tlcm5lbC1hcGkucnN0ICAgICAgICB8ICAgOSArKw0KPiAgIGRyaXZl
cnMvc3RhZ2luZy9zbTc1MGZiL3NtNzUwLmMgICAgICAgICAgICAgIHwgIDYzICsrKystLS0t
DQo+ICAgZHJpdmVycy92aWRlby9mYmRldi82ODMyOGZiLmMgICAgICAgICAgICAgICAgfCAg
MjQgKy0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9hY29ybmZiLmMgICAgICAgICAgICAg
ICAgfCAgMjMgKystDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9hbWlmYi5jICAgICAgICAg
ICAgICAgICAgfCAgMjMgKy0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9hcmtmYi5jICAg
ICAgICAgICAgICAgICAgfCAgMTAgKy0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0YWZi
LmMgICAgICAgICAgICAgICAgICB8ICAyMSArLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L2F0eS9hdHkxMjhmYi5jICAgICAgICAgICB8ICAyMiArKy0NCj4gICBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2F0eS9hdHlmYl9iYXNlLmMgICAgICAgICB8ICAyMyArKy0NCj4gICBkcml2ZXJz
L3ZpZGVvL2ZiZGV2L2F0eS9yYWRlb25fYmFzZS5jICAgICAgICB8ICAyNiArLS0NCj4gICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2F1MTEwMGZiLmMgICAgICAgICAgICAgICB8ICAxMyArLQ0K
PiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvYXUxMjAwZmIuYyAgICAgICAgICAgICAgIHwgIDE1
ICstDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jaXJydXNmYi5jICAgICAgICAgICAgICAg
fCAgMzAgKystLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmMgICAgICAg
ICAgICAgIHwgIDQ3ICsrKy0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9j
bWRsaW5lLmMgICAgICAgIHwgIDEzICstDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3Jl
L21vZGVkYi5jICAgICAgICAgICAgfCAgIDggKy0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L2N5YmVyMjAwMGZiLmMgICAgICAgICAgICB8ICAxNyArLQ0KPiAgIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvZWZpZmIuYyAgICAgICAgICAgICAgICAgIHwgIDQ0ICsrLS0tDQo+ICAgZHJpdmVy
cy92aWRlby9mYmRldi9lcDkzeHgtZmIuYyAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2ZtMmZiLmMgICAgICAgICAgICAgICAgICB8ICAxNCArLQ0K
PiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvZnNsLWRpdS1mYi5jICAgICAgICAgICAgIHwgIDI0
ICstLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvZ2JlZmIuYyAgICAgICAgICAgICAgICAg
IHwgIDIzICstLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvZ2VvZGUvZ3gxZmJfY29yZS5j
ICAgICAgIHwgIDE2ICstDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9nZW9kZS9neGZiX2Nv
cmUuYyAgICAgICAgfCAgMjMgKy0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9nZW9kZS9s
eGZiX2NvcmUuYyAgICAgICAgfCAgMjUgKy0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9n
cnZnYS5jICAgICAgICAgICAgICAgICAgfCAgMTggKystDQo+ICAgZHJpdmVycy92aWRlby9m
YmRldi9neHQ0NTAwLmMgICAgICAgICAgICAgICAgfCAgMTMgKy0NCj4gICBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2h5cGVydl9mYi5jICAgICAgICAgICAgICB8ICAxOCArKy0NCj4gICBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L2k3NDBmYi5jICAgICAgICAgICAgICAgICB8ICAyNiArLS0NCj4g
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2k4MTAvaTgxMF9tYWluLmMgICAgICAgICB8ICAyNiAr
Ky0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2ltc3R0ZmIuYyAgICAgICAgICAgICAgICB8
ICAxNiArLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvaW14ZmIuYyAgICAgICAgICAgICAg
ICAgIHwgIDIxICstLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvaW50ZWxmYi9pbnRlbGZi
ZHJ2LmMgICAgIHwgIDIzICsrLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYva3lyby9mYmRl
di5jICAgICAgICAgICAgIHwgIDIxICsrLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvbWFj
ZmIuYyAgICAgICAgICAgICAgICAgIHwgIDI2ICstLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJk
ZXYvbWF0cm94L21hdHJveGZiX2Jhc2UuYyAgIHwgIDE5ICstLQ0KPiAgIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvbXgzZmIuYyAgICAgICAgICAgICAgICAgIHwgIDIzICsrLQ0KPiAgIGRyaXZl
cnMvdmlkZW8vZmJkZXYvbmVvZmIuYyAgICAgICAgICAgICAgICAgIHwgIDI2ICstLQ0KPiAg
IGRyaXZlcnMvdmlkZW8vZmJkZXYvbnZpZGlhL252aWRpYS5jICAgICAgICAgIHwgIDI2ICsr
LQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvb2NmYi5jICAgICAgICAgICAgICAgICAgIHwg
IDIxICsrLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcC9vbWFwZmJfbWFpbi5jICAg
ICAgIHwgIDE1ICstDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9wbGF0aW51bWZiLmMgICAg
ICAgICAgICAgfCAgNDQgKystLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3BtMmZiLmMg
ICAgICAgICAgICAgICAgICB8ICAyNSArLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Bt
M2ZiLmMgICAgICAgICAgICAgICAgICB8ICAyNyArKy0tDQo+ICAgZHJpdmVycy92aWRlby9m
YmRldi9wczNmYi5jICAgICAgICAgICAgICAgICAgfCAgMjggKystLQ0KPiAgIGRyaXZlcnMv
dmlkZW8vZmJkZXYvcHZyMmZiLmMgICAgICAgICAgICAgICAgIHwgIDMyICsrLS0NCj4gICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YWZiLmMgICAgICAgICAgICAgICAgICB8ICAxOCArKy0N
Cj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3JpdmEvZmJkZXYuYyAgICAgICAgICAgICB8ICAy
NiArKy0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3MzZmIuYyAgICAgICAgICAgICAgICAg
ICB8ICAyNyArKy0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9zYXZhZ2Uvc2F2YWdlZmJf
ZHJpdmVyLmMgfCAgMjAgKystDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9zaXMvc2lzX21h
aW4uYyAgICAgICAgICAgfCAgMjQgKy0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9za2Vs
ZXRvbmZiLmMgICAgICAgICAgICAgfCAgMTcgKy0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L3NtNzEyZmIuYyAgICAgICAgICAgICAgICB8ICAxMiArLQ0KPiAgIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvc3N0ZmIuYyAgICAgICAgICAgICAgICAgIHwgIDI1ICstLQ0KPiAgIGRyaXZlcnMv
dmlkZW8vZmJkZXYvc3RpZmIuYyAgICAgICAgICAgICAgICAgIHwgMTYyICsrKysrKysrKy0t
LS0tLS0tLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3RkZnhmYi5jICAgICAgICAgICAg
ICAgICB8ICAyMSArKy0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3RnYWZiLmMgICAgICAg
ICAgICAgICAgICB8ICAzMCArKy0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi90bWlvZmIu
YyAgICAgICAgICAgICAgICAgfCAgMjQgKy0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi90
cmlkZW50ZmIuYyAgICAgICAgICAgICAgfCAgMjcgKystLQ0KPiAgIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvdXZlc2FmYi5jICAgICAgICAgICAgICAgIHwgIDIxICsrLQ0KPiAgIGRyaXZlcnMv
dmlkZW8vZmJkZXYvdmFsa3lyaWVmYi5jICAgICAgICAgICAgIHwgIDMwICsrLS0NCj4gICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L3Zlcm1pbGlvbi92ZXJtaWxpb24uYyAgICB8ICAgNyArLQ0K
PiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmVzYWZiLmMgICAgICAgICAgICAgICAgIHwgIDE2
ICstDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi92ZmIuYyAgICAgICAgICAgICAgICAgICAg
fCAgMzUgKystLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmlhL3ZpYWZiZGV2LmMgICAg
ICAgICAgIHwgIDE1ICstDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi92dDg2MjNmYi5jICAg
ICAgICAgICAgICAgfCAgMTEgKy0NCj4gICBpbmNsdWRlL2xpbnV4L2NtZGxpbmUuaCAgICAg
ICAgICAgICAgICAgICAgICB8ICAzNiArKysrKw0KPiAgIGluY2x1ZGUvbGludXgvZmIuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstDQo+ICAgbGliL01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gICBsaWIvY21kbGlu
ZV9pdGVyLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwOSArKysrKysrKysrKysr
DQo+ICAgNzAgZmlsZXMgY2hhbmdlZCwgMTA4NyBpbnNlcnRpb25zKCspLCA2ODIgZGVsZXRp
b25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvY21kbGluZS5o
DQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9jbWRsaW5lX2l0ZXIuYw0KPiANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------3Ca2SuJkc43s2zEfPoN1ey0P--

--------------y54XpXgntq3mcSgNbitRmaes
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQYMEUFAwAAAAAACgkQlh/E3EQov+DG
yA/8D5OrmX27ltxnx2nnWXLrK/YrkboZT13DL5xr9U/LvVSmrFRVlAkPqCqF5Wq+/vY4q8tn0rdM
hRvO6G3C8jxL5RUGDIRsk1LEvZMEMqGQ2gHkQfE1ytUkI5Mwi6wuVE1Vdd8PNOqnwsskaOFL3jCC
wU6Wz9e2oY/hIXHYa+txtRlbfdQkIT/dFSZxR1+h2qEih9yWNf3G+4VIJN8nAOMrTCEddljX5KXG
V/a/PUlmCQv/OoN9sUzFEAWQ90aYwW7LQtjwyzruTkmaySpbCxnQHyWg3Tw6Ds+TjKMv6FzlDoqY
aEHWsvx4uvqfgG8fFceIA1NDqawQO/XviSywo3VjLYy84qMSlqjZouZN4iFQ4M3+SZe5b2crAT41
Szqmq/1690vAraJJfAMzdEwSX81dlBNqaEv//Np1a11Pg4SpjD+aI9af3AY4vCG6eadql8/zp5u1
D2F36vcetQU14fjTTRikpGmKcyLZoU5Dp2e2cQvsvhRipty9uPgb2ZRAqgio78nkAYf9y63/PZOB
zPDeX6wxnx06Qy4vqLhQCUw9IwBxR6XRawWxO4gwoIQZywEul8v4FI+Q0P895n4L0NfHWXGITCpB
sE+m4zkmtpqODw+AvwGPJbDCEcq+pPUZTjKRZU2kBmiwInvcs52tKfjRyb97LlZtUtiaDLL9AcUK
Cjw=
=ReSf
-----END PGP SIGNATURE-----

--------------y54XpXgntq3mcSgNbitRmaes--
