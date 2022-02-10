Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D12C4B0C37
	for <lists+linux-fbdev@lfdr.de>; Thu, 10 Feb 2022 12:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240816AbiBJLUa (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 10 Feb 2022 06:20:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240813AbiBJLU3 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 10 Feb 2022 06:20:29 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F0E1010;
        Thu, 10 Feb 2022 03:20:31 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2F443210E0;
        Thu, 10 Feb 2022 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644492030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jabapHRJumEr2GHmDK+cu6f9gWixqYl4M53ilIf/VC0=;
        b=VqnqeXQasxKpHpoW32vtjkc6V11WM3GiBtuS8VWiYBugPOnw1W4dvC08ZqA0fxIcleIFo0
        DlCc/WbWLe5Kst9v0+VLrpTZOQ+WgitbvwMx2md+oCgPNseT+uXiRQ5OGcFy/21eTGqM82
        o62hJb5aFAUm8YjibnNky4E5QRCsZaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644492030;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jabapHRJumEr2GHmDK+cu6f9gWixqYl4M53ilIf/VC0=;
        b=ayIhtrATkBDNJ1KkgfCdDyxTcfIXTUtn44GkVHOzgzVsbOI17+FxFNscG/2BCyRjRFyG2s
        vvHHD/jzt41BxqBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E7E9413B43;
        Thu, 10 Feb 2022 11:20:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 8OiuN/30BGIyCgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 10 Feb 2022 11:20:29 +0000
Message-ID: <9374fb8a-b478-3a15-dffa-12fcf5183633@suse.de>
Date:   Thu, 10 Feb 2022 12:20:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/19] fbcon: delete delayed loading code
Content-Language: en-US
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Claudio Suarez <cssk@net-c.es>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-5-daniel.vetter@ffwll.ch>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220208210824.2238981-5-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9zU9jv8hu330y24wrbhvSkya"
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
--------------9zU9jv8hu330y24wrbhvSkya
Content-Type: multipart/mixed; boundary="------------EATHeyIJ02qcnMdkqqw0MnGp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Message-ID: <9374fb8a-b478-3a15-dffa-12fcf5183633@suse.de>
Subject: Re: [PATCH v2 04/19] fbcon: delete delayed loading code
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20220208210824.2238981-5-daniel.vetter@ffwll.ch>

--------------EATHeyIJ02qcnMdkqqw0MnGp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA4LjAyLjIyIHVtIDIyOjA4IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gQmVm
b3JlDQo+IA0KPiBjb21taXQgNjEwNGMzNzA5NGU3MjlmM2Q0Y2U2NTc5NzAwMjExMjczNWQ0
OWNkMQ0KPiBBdXRob3I6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
DQo+IERhdGU6ICAgVHVlIEF1ZyAxIDE3OjMyOjA3IDIwMTcgKzAyMDANCj4gDQo+ICAgICAg
ZmJjb246IE1ha2UgZmJjb24gYSBidWlsdC10aW1lIGRlcGVuY3kgZm9yIGZiZGV2DQo+IA0K
PiBpdCB3YXMgcG9zc2libGUgdG8gbG9hZCBmYmNvbiBhbmQgZmJkZXYgZHJpdmVycyBpbiBh
bnkgb3JkZXIsIHdoaWNoDQo+IG1lYW5zIHRoYXQgZmJjb24gaW5pdCBoYWQgdG8gaGFuZGxl
IHRoZSBjYXNlIHdoZXJlIGZiZGV2IGRyaXZlcnMgd2hlcmUNCj4gYWxyZWFkeSByZWdpc3Rl
cmVkLg0KPiANCj4gVGhpcyBpcyBubyBsb25nZXIgcG9zc2libGUsIGhlbmNlIGRlbGV0ZSB0
aGF0IGNvZGUuDQo+IA0KPiBOb3RlIHRoYXQgdGhlIGV4aXQgY2FzZSBpcyBhIGJpdCBtb3Jl
IGNvbXBsZXggYW5kIHdpbGwgYmUgZG9uZSBpbiBhDQo+IHNlcGFyYXRlIHBhdGNoLg0KPiAN
Cj4gU2luY2UgSSBoYWQgdG8gYXVkaXQgdGhlIGVudGlyZSBmYmNvbiBsb2FkIGNvZGUgSSBh
bHNvIHNwb3R0ZWQgYSB3cm9uZw0KPiBmdW5jdGlvbiBuYW1lIGluIGEgY29tbWVudCBpbiBm
YmNvbl9zdGFydHVwKCksIHdoaWNoIHRoaXMgcGF0Y2ggYWxzbw0KPiBmaXhlcy4NCj4gDQo+
IHYyOiBFeHBsYWluIHdoeSB3ZSBhbHNvIGZpeCB0aGUgY29tbWVudCAoU2FtKQ0KPiANCj4g
QWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+IENjOiBI
ZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+DQo+IENjOiBDbGF1ZGlvIFN1YXJleiA8Y3Nza0BuZXQtYy5lcz4NCj4g
Q2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+
IENjOiBUZXRzdW8gSGFuZGEgPHBlbmd1aW4ta2VybmVsQEktbG92ZS5TQUtVUkEubmUuanA+
DQo+IENjOiBEdSBDaGVuZyA8ZHVjaGVuZzJAZ21haWwuY29tPg0KDQpBY2tlZC1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgfCAxMyArLS0tLS0tLS0tLS0tDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyBiL2RyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jDQo+IGluZGV4IGI3NWU2MzhjYjgzZC4uODNm
MDIyM2Y1MzMzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJj
b24uYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYw0KPiBAQCAt
OTQ0LDcgKzk0NCw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpmYmNvbl9zdGFydHVwKHZvaWQp
DQo+ICAgCQlyZXR1cm4gZGlzcGxheV9kZXNjOw0KPiAgIAkvKg0KPiAgIAkgKiBJbnN0ZWFk
IG9mIGJsaW5kbHkgdXNpbmcgcmVnaXN0ZXJlZF9mYlswXSwgd2UgdXNlIGluZm9faWR4LCBz
ZXQgYnkNCj4gLQkgKiBmYl9jb25zb2xlX2luaXQoKTsNCj4gKwkgKiBmYmNvbl9mYl9yZWdp
c3RlcmVkKCk7DQo+ICAgCSAqLw0KPiAgIAlpbmZvID0gcmVnaXN0ZXJlZF9mYltpbmZvX2lk
eF07DQo+ICAgCWlmICghaW5mbykNCj4gQEAgLTMyOTksMTcgKzMyOTksNiBAQCBzdGF0aWMg
dm9pZCBmYmNvbl9zdGFydCh2b2lkKQ0KPiAgIAkJcmV0dXJuOw0KPiAgIAl9DQo+ICAgI2Vu
ZGlmDQo+IC0NCj4gLQlpZiAobnVtX3JlZ2lzdGVyZWRfZmIpIHsNCj4gLQkJaW50IGk7DQo+
IC0NCj4gLQkJZm9yX2VhY2hfcmVnaXN0ZXJlZF9mYihpKSB7DQo+IC0JCQlpbmZvX2lkeCA9
IGk7DQo+IC0JCQlicmVhazsNCj4gLQkJfQ0KPiAtDQo+IC0JCWRvX2ZiY29uX3Rha2VvdmVy
KDApOw0KPiAtCX0NCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHZvaWQgZmJjb25fZXhpdCh2
b2lkKQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------EATHeyIJ02qcnMdkqqw0MnGp--

--------------9zU9jv8hu330y24wrbhvSkya
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIE9P0FAwAAAAAACgkQlh/E3EQov+Bf
AA/8C+Aj/IVHkG8BMDGnlpbVj5gQreB49R4hWybvObvIAfsK41iFHQm/9enOLPeFLoGI60/ba3CN
Z2cAt5d9FTb+YdoSvxjvtbYdEFQ39lsGsS/6yO0Ogu/p+hjCuOv9xdAL8PqPs7/NjVoOFNGQYY7V
m/g+oP1gBv3XIG4ZI/k8uILkarmToG5QTe+CvwvujrmXtt2eowhT7lX/7Zr6FOgHCckbDjLFJ/bH
BteiQDPpu/rB8aVZsqy4SDyszDVeEjwoGdjn3RmBZZlk83TuF1HrcW1KWIJU4UhKoDlA+ZkrCS/4
tMXgCNz8ao8+VAY7QaPSbx5csqjP0jm9qJTVbo3H5Mavin4TsuH1aC6uMgBdDiasPHlUvJf0Hhj7
upv1ulTgP9Jbe/3FvFAkMq4hWeGvQxsSeN9tEIvcR94fUZH51hfPg60Gv+HddE32eVm9ptmuTx56
KLQWHjzzqzl8c3RStMBoi2n/XzkgKPotG+fF6ern9mV/jNSxBDHPgmex5VsUGE91GCuzFYSiI+9v
aA1hDXQp299kFAJju3Wg5qRrzlZa1502AefsZMNSV65UGsXKGLgc15cPGW634MeEwsmPmBJ/sX1e
nSrxKtytM13s4ilK+ps6aJO9ChECcgBYKJ9iQp7A3djMQi8iCcMOnlP1BLM0xXRPOSvDzdPH74V8
dqE=
=t/ic
-----END PGP SIGNATURE-----

--------------9zU9jv8hu330y24wrbhvSkya--
