Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14A9E6FF119
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 May 2023 14:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237926AbjEKMIp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 11 May 2023 08:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237548AbjEKMIm (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 11 May 2023 08:08:42 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E0B30F7
        for <linux-fbdev@vger.kernel.org>; Thu, 11 May 2023 05:08:37 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 469161FE61;
        Thu, 11 May 2023 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683806916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5MGkVsgnhs8IWI9sfEAa7kwgPCjf/d/kSbX6xJ66Ln0=;
        b=htKpn0oBhvlAqMRhw/46x4kkkkR/GMqnoqjLoEplq+CLkVVwvE3RRr3BUnAp1Ot6Mxo1eB
        /QSTYcUWYLfAg4jq2srWTOkXdeOQR+9yTDVx/jBa3z8JhYYNm6f+JNBSIy8RVp/BZKfoZ1
        LIvURqH3UNQ242r7MPgxrS9YYBdrFt0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683806916;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5MGkVsgnhs8IWI9sfEAa7kwgPCjf/d/kSbX6xJ66Ln0=;
        b=KC2jQdIFIdCMrdu99oT39tR+6Z/n/xZeRgEGI3VgyDUJEWlVOYKU6G1Y8HAC/dluhJt4fX
        3pfIT8motglS5MBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FAA0134B2;
        Thu, 11 May 2023 12:08:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id vHHJBsTaXGTNdwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 11 May 2023 12:08:36 +0000
Message-ID: <e2f54d17-debc-62f4-3644-8baea4a88b10@suse.de>
Date:   Thu, 11 May 2023 14:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 00/15] fbdev: Remove trailing whitespaces
Content-Language: en-US
To:     deller@gmx.de, Javier Martinez Canillas <javierm@redhat.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230331092314.2209-1-tzimmermann@suse.de>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230331092314.2209-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uKqNAYd4TEMJEyo6lLFdO5r0"
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uKqNAYd4TEMJEyo6lLFdO5r0
Content-Type: multipart/mixed; boundary="------------gmalK9ZbmC0i5kFea2aAG9me";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <e2f54d17-debc-62f4-3644-8baea4a88b10@suse.de>
Subject: Re: [PATCH 00/15] fbdev: Remove trailing whitespaces
References: <20230331092314.2209-1-tzimmermann@suse.de>
In-Reply-To: <20230331092314.2209-1-tzimmermann@suse.de>

--------------gmalK9ZbmC0i5kFea2aAG9me
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KHBpbmcpDQoNCkhpLA0KDQpJIHRob3VnaHQgdGhlc2UgcGF0Y2hlcyB3b3VsZCBnbyB0aHJv
dWdoIHRoZSBmYmRldiB0cmVlLCBidXQgSSBjb3VsZCBub3QgDQpmaW5kIHRoZW0gdjYuNC1y
YzEuIFBsZWFzZSByZXZpZXcgdGhlIHJlbWFpbmluZyBvbmVzLCBzbyB0aGF0IEkgY2FuIA0K
bWVyZ2UgdGhlbSB2aWEgZHJtLW1pc2MuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCkFt
IDMxLjAzLjIzIHVtIDExOjIyIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+IFRoZSB0
cmFpbGluZyB3aGl0ZXNwYWNlcyBhcmUgYW5ub3lpbmcuIFNvIHJlbW92ZSB0aGVtLiBObw0K
PiBmdW5jdGlvbmFsIGNoYW5nZXMuIFNvbWUgb2YgdGhlIHBhdGNoZXMgaGFzIGFscmVhZHkg
YmVlbg0KPiBhY2tlZCBieSBIZWxnZS4NCj4gDQo+IFRob21hcyBaaW1tZXJtYW5uICgxNSk6
DQo+ICAgIGZiZGV2LzY4MzI4ZmI6IFJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNlcw0KPiAg
ICBmYmRldi9hdG1lbF9sY2RmYjogUmVtb3ZlIHRyYWlsaW5nIHdoaXRlc3BhY2VzDQo+ICAg
IGZiZGV2L2NnMTQ6IFJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNlcw0KPiAgICBmYmRldi9j
b250cm9sZmI6IFJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNlcw0KPiAgICBmYmRldi9nMzY0
ZmI6IFJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNlcw0KPiAgICBmYmRldi9oZ2FmYjogUmVt
b3ZlIHRyYWlsaW5nIHdoaXRlc3BhY2VzDQo+ICAgIGZiZGV2L2hwZmI6IFJlbW92ZSB0cmFp
bGluZyB3aGl0ZXNwYWNlcw0KPiAgICBmYmRldi9tYWNmYjogUmVtb3ZlIHRyYWlsaW5nIHdo
aXRlc3BhY2VzDQo+ICAgIGZiZGV2L21heGluZWZiOiBSZW1vdmUgdHJhaWxpbmcgd2hpdGVz
cGFjZXMNCj4gICAgZmJkZXYvcDkxMDA6IFJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNlcw0K
PiAgICBmYmRldi9wbGF0aW51bWZiOiBSZW1vdmUgdHJhaWxpbmcgd2hpdGVzcGFjZXMNCj4g
ICAgZmJkZXYvc2ExMTAwZmI6IFJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNlcw0KPiAgICBm
YmRldi9zdGlmYjogUmVtb3ZlIHRyYWlsaW5nIHdoaXRlc3BhY2VzDQo+ICAgIGZiZGV2L3Zh
bGt5cmllZmI6IFJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNlcw0KPiAgICBmYmRldi92ZmI6
IFJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNlcw0KPiANCj4gICBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2LzY4MzI4ZmIuYyAgICAgfCAgMTIgKy0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9h
dG1lbF9sY2RmYi5jIHwgICAyICstDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jZzE0LmMg
ICAgICAgIHwgICAyICstDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb250cm9sZmIuYyAg
IHwgIDM0ICsrKy0tLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2czNjRmYi5jICAgICAg
fCAgIDYgKy0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2hnYWZiLmMgICAgICAgfCAgMzYg
KysrLS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvaHBmYi5jICAgICAgICB8ICAgOCAr
LQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvbWFjZmIuYyAgICAgICB8ICAxMCArLQ0KPiAg
IGRyaXZlcnMvdmlkZW8vZmJkZXYvbWF4aW5lZmIuYyAgICB8ICAgMiArLQ0KPiAgIGRyaXZl
cnMvdmlkZW8vZmJkZXYvcDkxMDAuYyAgICAgICB8ICAgNCArLQ0KPiAgIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvcGxhdGludW1mYi5jICB8ICAzMCArKystLS0NCj4gICBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L3NhMTEwMGZiLmMgICAgfCAgMzIgKysrLS0tDQo+ICAgZHJpdmVycy92aWRlby9m
YmRldi9zdGlmYi5jICAgICAgIHwgMTU2ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmFsa3lyaWVmYi5jICB8ICAxNCArLS0NCj4g
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZmYi5jICAgICAgICAgfCAgMTAgKy0NCj4gICAxNSBm
aWxlcyBjaGFuZ2VkLCAxNzkgaW5zZXJ0aW9ucygrKSwgMTc5IGRlbGV0aW9ucygtKQ0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAx
NDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15
ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBO
dWVybmJlcmcpDQo=

--------------gmalK9ZbmC0i5kFea2aAG9me--

--------------uKqNAYd4TEMJEyo6lLFdO5r0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRc2sMFAwAAAAAACgkQlh/E3EQov+AX
eA//URXSljl9D6RTDAOddCWG1gAUaAjCIlBu6oe1ZjSlDX4pgvBwEFIsKrkMJ8opHUsl16CZsJqW
4u+sU5BIVxFd4mLnNUMYjW9AOokkMYCtJQAtrFB6w5i9VIH4OgowYAEGOqQ/v8/mXbYtbgNQIA+P
hA49afD2qrkhaZumfDMd6YI6nI1cjC3h5JEfw0IhyrmcLphYT9ooMwFug/X5fs4OLI9xE0YITy9W
ztU5L2mVWCjp9ktoqcfNxfbYPq69Ras/bBluseM+o02NbCNoJV6hLFkWOEOxcjy2VIMqelCwCaFb
VOS7s+5/IpMWXgcxGpkBskEQ1mi5pJDPLnl4XaJrJQ35ajMZeCwAL4qNM4UaXwhsagfjiOF5SYAx
LxLrHXulITYEr7tUVhFTGuEUlYjyLXNklMgEIKitxtlKnmtXrUw5gakmqqlZW/KGzGg3z5d6eurR
w6KA/6n1YBDoJykzxDlSOa7x5S2CjjNEC7Sg8TkDrbbjxzo0G/u5MvoFF/eFXYKniNfC7A/D8LtW
ERVdmQD0gravajiLPz01N0UsxKGCmSFUpi66yGovHR86+giRM2s1GN8vJvPkPfGh0LMIaY9RKitK
IHpewqrTn2tHFIaoZhSbrz1JbmJIKeiNpoGkPPVIqKd9A5Kp8IJZMpeHhowgyxZZlaVQ2vzJx18N
xPQ=
=DE55
-----END PGP SIGNATURE-----

--------------uKqNAYd4TEMJEyo6lLFdO5r0--
