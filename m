Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07C265530E0
	for <lists+linux-fbdev@lfdr.de>; Tue, 21 Jun 2022 13:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347946AbiFUL37 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 21 Jun 2022 07:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231866AbiFUL36 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 21 Jun 2022 07:29:58 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4027195AB;
        Tue, 21 Jun 2022 04:29:57 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id F256321B98;
        Tue, 21 Jun 2022 11:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1655810996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tbk8AY35vGZnUoGjtKiadujn177xJ0W/iFXqkD+8/0w=;
        b=t2qS+JrX3tN00xd/YYTT6zRpc0g/3RYkQxi7KclotqfWc8kTNvnCO0gc77zTngieOc8VHY
        GiLyh9OEmyOZzzvWZZv8lGsPiXNUgfoNWdngHZu13dAZqhUriQT5qMKiqPC1tmnqSQ28Ls
        ezhzGMOM8QBAbKlQGUGekLe231/mz/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1655810996;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tbk8AY35vGZnUoGjtKiadujn177xJ0W/iFXqkD+8/0w=;
        b=Ov7M6vi2AQK7LN6gG4SL/Ys0dIvNXfgUOHgXDGdUBdyljQKFcCPgKKVQVU9BtgVlB0H78V
        sxSUplswuDPAexBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC19613A88;
        Tue, 21 Jun 2022 11:29:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id UPTxKLOrsWJmaQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 21 Jun 2022 11:29:55 +0000
Message-ID: <4f6e9b63-f955-d263-e69b-6396fbe48868@suse.de>
Date:   Tue, 21 Jun 2022 13:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] drm: Implement DRM aperture helpers under video/
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>, corbet@lwn.net,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
        gregkh@linuxfoundation.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <165541020563.1955826.16350888595945658159.stgit@omen>
 <165541192621.1955826.6848784198896919390.stgit@omen>
 <e1fd76ae-a865-889f-b4f0-878c00837368@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <e1fd76ae-a865-889f-b4f0-878c00837368@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------peM3flJV2Jzk12rbQHVx9lQ9"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------peM3flJV2Jzk12rbQHVx9lQ9
Content-Type: multipart/mixed; boundary="------------yl9HI4rWqtowvfqGjuox3YP4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Message-ID: <4f6e9b63-f955-d263-e69b-6396fbe48868@suse.de>
Subject: Re: [PATCH v2 1/2] drm: Implement DRM aperture helpers under video/
References: <165541020563.1955826.16350888595945658159.stgit@omen>
 <165541192621.1955826.6848784198896919390.stgit@omen>
 <e1fd76ae-a865-889f-b4f0-878c00837368@redhat.com>
In-Reply-To: <e1fd76ae-a865-889f-b4f0-878c00837368@redhat.com>

--------------yl9HI4rWqtowvfqGjuox3YP4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDYuMjIgdW0gMDI6MTQgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQpbLi4uXQ0KPiANCj4gU2luY2Ugd2UgYXJlIHRhbGtpbmcgYWJvdXQgcmVtb3Zl
X2NvbmZsaWN0aW5nX2RldmljZXMoKSBoZXJlLCBhIGJldHRlciBjb2RlDQo+IGV4YW1wbGUg
Y291bGQgYmUgZm9yIGEgcGxhdGZvcm0gZGV2aWNlIGluc3RlYWQgb2YgYSBQQ0kgZGV2aWNl
LCBsaWtlIHRoaXM6DQo+IA0KPiAqCXN0YXRpYyBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIGV4YW1wbGVfZHJpdmVyID0gew0KPiAqCQkubmFtZSA9ICJleGFtcGxlIiwNCj4gKgkJ
Li4uDQo+ICoJfTsNCj4gKg0KPiAqCXN0YXRpYyBpbnQgcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gKgl7DQo+ICoJCXN0cnVjdCByZXNvdXJjZSAqbWVtOw0KPiAq
CQlyZXNvdXJjZV9zaXplX3QgYmFzZSwgc2l6ZTsNCj4gKg0KPiAqCQltZW0gPSBwbGF0Zm9y
bV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0KPiAqCQlpZiAoIW1l
bSkNCj4gKgkJCXJldHVybiAtRUlOVkFMOw0KPiAqCQliYXNlID0gbWVtLT5zdGFydDsNCj4g
KgkJc2l6ZSA9IHJlc291cmNlX3NpemUobWVtKTsNCj4gKg0KPiAqCQlyZXQgPSByZW1vdmVf
Y29uZmxpY3RpbmdfZGV2aWNlcyhiYXNlLCBzaXplLCBmYWxzZSwgJmV4YW1wbGVfZHJpdmVy
LT5uYW1lKTsNCj4gKgkJaWYgKHJldCkNCj4gKgkJCXJldHVybiByZXQ7DQo+ICoNCj4gKgkJ
Ly8gLi4uIGFuZCBpbml0aWFsaXplIHRoZSBoYXJkd2FyZS4NCj4gKgkJLi4uDQo+ICoNCj4g
KgkJcmV0dXJuIDA7DQo+ICoJfQ0KPiANCj4+ICsgKglzdGF0aWMgaW50IHByb2JlKHN0cnVj
dCBwY2lfZGV2ICpwZGV2KQ0KPj4gKyAqCXsNCj4+ICsgKgkJaW50IHJldDsNCj4+ICsgKg0K
Pj4gKyAqCQkvLyBSZW1vdmUgYW55IGdlbmVyaWMgZHJpdmVycy4uLg0KPj4gKyAqCQlyZXQg
PSByZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKHBkZXYpOw0KPiANCj4gQW5kIGhl
cmUgd2UgY2FuIGp1c3QgdXNlIHJlbW92ZV9jb25mbGljdGluZ19wY2lfZGV2aWNlcyhwZGV2
KSB3aXRob3V0IHRoZQ0KPiB1bm5lY2Vzc2FyeSBsZXZlbCBvZiBpbmRpcmVjdGlvbi4gSXQg
bWFrZXMgdGhlIGV4YW1wbGUgbW9yZSBjbGVhciBJTU8gYW5kDQo+IGl0IGNvdWxkIGJlIG1v
dmVkIGFzIGFuIGV4YW1wbGUgZm9yIHRoZSByZW1vdmVfY29uZmxpY3RpbmdfcGNpX2Rldmlj
ZXMoKS4NCg0KSSdsbCBzZWUgaWYgSSBjYW4gc2ltcGxpZnkgdGhlIGV4YW1wbGVzLg0KDQo+
IA0KPiBBbm90aGVyIG9wdGlvbiBpcyB0byBoYXZlIGhlcmUgYW4gZXhhbXBsZSBmb3IgcGxh
dGZvcm0gZGV2aWNlcyBpbnN0ZWFkIG9mDQo+IGEgUENJIGRldmljZSAoYW5kIG1vdmUgdGhp
cyBleGFtcGxlIHdoZW4gdGFsa2luZyBhYm91dCByZW1vdmUNCj4gDQo+IFsuLi5dDQo+IA0K
Pj4gKyAqIFBDSSBkZXZpY2UgZHJpdmVycyBjYW4gYWxzbyBjYWxsIHJlbW92ZV9jb25mbGlj
dGluZ19wY2lfZGV2aWNlcygpIGFuZCBsZXQgdGhlDQo+PiArICogZnVuY3Rpb24gZGV0ZWN0
IHRoZSBhcGVydHVyZXMgYXV0b21hdGljYWxseS4gRGV2aWNlIGRyaXZlcnMgd2l0aG91dCBr
bm93bGVkZ2Ugb2YNCj4+ICsgKiB0aGUgZnJhbWVidWZmZXIncyBsb2NhdGlvbiBzaGFsbCBj
YWxsIHJlbW92ZV9hbGxfY29uZmxpY3RpbmdfZGV2aWNlcygpLA0KPj4gKyAqIHdoaWNoIHJl
bW92ZXMgYWxsIGtub3duIGRldmljZXMuDQo+PiArICoNCj4gDQo+IENhbiB3ZSBnZXQgYWxs
IHRoZSBwdWJsaWMgYXBlcnR1cmUgZnVuY3Rpb25zIGJlIGluIHRoZSBhcGVydHVyZSBuYW1l
c3BhY2U/IGkuZToNCj4gYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2RldmljZXMoKSwg
YXBlcnR1cmVfcmVtb3ZlX2FsbF9jb25mbGljdGluZ19kZXZpY2VzKCkNCj4gYW5kIHNvIG9u
LiBUaGF0IG1ha2VzIGVhc2llciB0byBncmVwLCBmdHJhY2UgYW5kIGFsc28gcmVhZCB0aGUg
ZHJpdmVycycgY29kZS4NCg0KT2suDQoNCj4gDQo+PiArICogRHJpdmVycyB0aGF0IGFyZSBz
dXNjZXB0aWJsZSB0byBiZWluZyByZW1vdmVkIGJ5IG90aGVyIGRyaXZlcnMsIHN1Y2ggYXMN
Cj4+ICsgKiBnZW5lcmljIEVGSSBvciBWRVNBIGRyaXZlcnMsIGhhdmUgdG8gcmVnaXN0ZXIg
dGhlbXNlbHZlcyBhcyBvd25lcnMgb2YgdGhlaXINCj4+ICsgKiBmcmFtZWJ1ZmZlciBhcGVy
dHVyZXMuIE93bmVyc2hpcCBvZiB0aGUgZnJhbWVidWZmZXIgbWVtb3J5IGlzIGFjaGlldmVk
DQo+PiArICogYnkgY2FsbGluZyBkZXZtX2FjcXVpcmVfYXBlcnR1cmVfb2ZfcGxhdGZvcm1f
ZGV2aWNlKCkuIE9uIHN1Y2Nlc3MsIHRoZSBkcml2ZXINCj4gDQo+IEFGQUlDVCB0aGUgYXBl
cnR1cmUgaW5mcmFzdHJ1Y3R1cmUgb25seSBhbGxvd3MgdG8gcmVtb3ZlIHBsYXRmb3JtIGRl
dmljZXMsIGV2ZW4NCj4gd2hlbiBpdCBjYW4gY2hlY2sgaWYgdGhlIHJlcXVlc3RlZCBJL08g
cmVzb3VyY2Ugb3ZlcmxhcHMgd2l0aCBhIFBDSSBCQVIgcmFuZ2UsDQo+IHNvIG1heWJlIGFs
bCBmdW5jdGlvbnMgYWxzbyBzaG91bGQgdXNlIF9wbGF0Zm9ybV9kZXZpY2UoKSBhcyBzdWZm
aXggaW5zdGVhZCBvZg0KPiBqdXN0IF9kZXZpY2UoKSA/IE9yIG1heWJlIHRoZSBfcGxhdGZv
cm0gaXMganVzdCB2ZXJib3NlIGJ1dCBJIHRoaW5rIHRoYXQgdGhlDQo+IGZ1bmN0aW9ucyBz
aG91bGQgYmUgbmFtZWQgY29uc2lzdGVudGx5IGFuZCBvbmx5IHVzZSBlaXRoZXIgX2Rldmlj
ZSBvciBfcGxhdGZvcm0uDQoNClRoYXQgbmFtZWluZyBtYWtlcyBzZW5zZS4gRmlybXdhcmUg
ZHJpdmVycyByZWdpc3RlciBhIHBsYXRmb3JtIGRldmljZS4gDQpCdXQgbmF0aXZlIGRyaXZl
cnMgdW5yZWdpc3RlciBhbnkgZGV2aWNlLiBJZiB3ZSBldmVyIGhhdmUgYSBnZW5lcmljIA0K
ZHJpdmVyIHRoYXQgZG9lcyBub3QgdXNlIHBsYXRmb3JtIGRldmljZXMsIHdlJ2QgbmVlZCBh
bm90aGVyIHZhcmlhbnQgb2YgDQpkZXZtX2FjcXVpcmVfYXBlcnR1cmVfb2ZfKl9kZXZpY2Uo
KS4NCg0KDQo+IA0KPiBbLi4uXQ0KPiANCj4+ICsgKglzdGF0aWMgaW50IGFjcXVpcmVfZnJh
bWVidWZmZXJzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+PiArICoJew0KPj4gKyAqCQlyZXNvdXJjZV9zaXplX3QgYmFzZSwgc2l6
ZTsNCj4+ICsgKg0KPiANCj4gVGhpcyBleGFtcGxlIGlzIG1pc3NpbmcgYSBzdHJ1Y3QgcmVz
b3VyY2UgKm1lbSBkZWNsYXJhdGlvbi4NCj4gDQo+PiArICogVGhlIGdlbmVyaWMgZHJpdmVy
IGlzIG5vdyBzdWJqZWN0IHRvIGZvcmNlZCByZW1vdmFsIGJ5IG90aGVyIGRyaXZlcnMuIFRo
aXMNCj4+ICsgKiBvbmx5IHdvcmtzIGZvciBwbGF0Zm9ybSBkcml2ZXJzIHRoYXQgc3VwcG9y
dCBob3QgdW5wbHVnZ2luZy4NCj4+ICsgKiBXaGVuIGEgZHJpdmVyIGNhbGxzIHJlbW92ZV9j
b25mbGljdGluZ19kZXZpY2VzKCkgZXQgYWwNCj4+ICsgKiBmb3IgdGhlIHJlZ2lzdGVyZWQg
ZnJhbWVidWZmZXIgcmFuZ2UsIHRoZSBhcGVydHVyZSBoZWxwZXJzIGNhbGwNCj4+ICsgKiBw
bGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3RlcigpIGFuZCB0aGUgZ2VuZXJpYyBkcml2ZXIgdW5s
b2FkcyBpdHNlbGYuIEl0DQo+PiArICogbWF5IG5vdCBhY2Nlc3MgdGhlIGRldmljZSdzIHJl
Z2lzdGVycywgZnJhbWVidWZmZXIgbWVtb3J5LCBST00sIGV0Yw0KPj4gKyAqIGFmdGVyd2Fy
ZHMuDQo+PiArICovDQo+PiArDQo+PiArc3RydWN0IGRldl9hcGVydHVyZSB7DQo+PiArCXN0
cnVjdCBkZXZpY2UgKmRldjsNCj4gDQo+IEFuZCBoZXJlIHdlIGNvdWxkIGp1c3QgdXNlIGEg
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiBzaW5jZSBjdXJyZW50bHkgd2UNCj4gb25s
eSBzdXBwb3J0IHBsYXRmb3JtIGRldmljZXMuIEl0IHNlZW1zIHRvIG1lIHRoYXQgdGhpcyBp
cyBhIERSTS1pc20gdGhhdCB3ZQ0KPiBhcmUgY2Fycnlpbmcgc2luY2UgZm9yIERSTSBkcml2
ZXJzIG1hZGUgc2Vuc2UgdG8gdXNlIHN0cnVjdCBkZXZpY2UuDQo+IA0KPiBEb2luZyB0aGF0
IHdvdWxkIGFsc28gYWxsb3cgZ2V0IHJpZCBvZiBpbmRpcmVjdGlvbnMgbGlrZSB0aGUgbmVl
ZCBvZiBib3RoIGENCj4gZGV2bV9hY3F1aXJlX2FwZXJ0dXJlX29mX3BsYXRmb3JtX2Rldmlj
ZSgpIGFuZCBkZXZtX2FwZXJ0dXJlX2FjcXVpcmUoKSBqdXN0DQo+IHRvIGRvIGEgJnBkZXYt
PmRldi4NCj4gDQo+IEFuZCBhbHNvIHNvbWUgdG9fcGxhdGZvcm1fZGV2aWNlKCkgaW4gZHJt
X2FwZXJ0dXJlX2RldGFjaF9maXJtd2FyZSgpIGFuZA0KPiBkZXRhY2hfcGxhdGZvcm1fZGV2
aWNlKCkuDQo+IA0KPiBJZiB3ZSBldmVyIHN1cHBvcnQgbm9uLXBsYXRmb3JtIGRldmljZXMg
dGhlbiB3ZSBjYW4gcmVmYWN0b3IgaXQsIGJ1dCBJIGRvbid0DQo+IHRoaW5rIHRoYXQgaXMg
d29ydGggdG8gY29tcGxpY2F0ZSBqdXN0IGluIGNhc2Ugd2UgZXZlciBzdXBwb3J0IHN0cnVj
dCBkZXZpY2UuDQo+IA0KPj4gKwlyZXNvdXJjZV9zaXplX3QgYmFzZTsNCj4+ICsJcmVzb3Vy
Y2Vfc2l6ZV90IHNpemU7DQo+PiArCXN0cnVjdCBsaXN0X2hlYWQgbGg7DQo+PiArCXZvaWQg
KCpkZXRhY2gpKHN0cnVjdCBkZXZpY2UgKmRldik7DQo+IA0KPiBTYW1lIGhlcmUsIGp1c3QJ
dm9pZCAoKmRldGFjaCkoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgaWYgeW91IGFn
cmVlIHdpdGgNCj4gdGhhdCBJIG1lbnRpb25lZCBhYm92ZS4NCg0KSSB0b29rIHRoYXQgY29k
ZSBmcm9tIERSTS4gTm8gbmVlZCB0byBjaGFuZ2UgaXQgZm9yIGxlc3MgZmxleGliaWxpdHku
DQoNCj4gDQo+PiArfTsNCj4+ICsNCj4+ICtzdGF0aWMgTElTVF9IRUFEKGFwZXJ0dXJlcyk7
DQo+PiArc3RhdGljIERFRklORV9NVVRFWChhcGVydHVyZXNfbG9jayk7DQo+PiArDQo+PiAr
c3RhdGljIGJvb2wgb3ZlcmxhcChyZXNvdXJjZV9zaXplX3QgYmFzZTEsIHJlc291cmNlX3Np
emVfdCBlbmQxLA0KPj4gKwkJICAgIHJlc291cmNlX3NpemVfdCBiYXNlMiwgcmVzb3VyY2Vf
c2l6ZV90IGVuZDIpDQo+PiArew0KPj4gKwlyZXR1cm4gKGJhc2UxIDwgZW5kMikgJiYgKGVu
ZDEgPiBiYXNlMik7DQo+PiArfQ0KPiANCj4gVGhlcmUncyBhIHJlc291cmNlX292ZXJsYXBz
KCkgaGVscGVyIGluIGluY2x1ZGUvbGludXgvaW9wb3J0LmgsIEkgd29uZGVyIGlmIGl0DQo+
IGNvdWxkIGp1c3QgYmUgdXNlZCwgbWF5YmUgZGVjbGFyaW5nIGFuZCBmaWxsaW5nIGEgc3Ry
dWN0IHJlc291cmNlIGp1c3QgdG8gY2FsbA0KPiB0aGF0IGhlbHBlci4gTGF0ZXIgYXMgYW4g
b3B0aW1pemF0aW9uIGEgcmVzb3VyY2VfcmFuZ2Vfb3ZlcmxhcCgpIG9yIHNvbWV0aGluZw0K
PiBjb3VsZCBiZSBwcm9wb3NlZCBmb3IgaW5jbHVkZS9saW51eC9pb3BvcnQuaC4NCg0KQnUg
dGhlbiB3ZSdkIGhhdmUgdG8gZGVjbGFyZSBzdHJ1Y3QgcmVzb3VyY2UtZXMgZm9yIHVzaW5n
IGFuIGludGVyZmFjZS4gDQpUaGlzIGhlbHBlciBpcyB0cml2aWFsLiBJZiBhbnl0aGluZywg
cmVzb3VyY2Vfb3ZlcmxhcHMoKSBzaG91bGQgYmUgDQpnZW5lcmFsaXplZC4NCg0KPiANCj4g
QWxzbywgSSBub3RpY2VkIHRoYXQgcmVzb3VyY2Vfb3ZlcmxhcHMoKSB1c2VzIDw9IGFuZCA+
PSBidXQgdGhpcyBoZWxwZXIgdXNlcw0KPiA8IGFuZCA+LiBJdCBzZWVtcyB0aGVyZSdzIGFu
IG9mZi1ieS1vbmUgZXJyb3IgaGVyZSBidXQgbWF5YmUgSSdtIHdyb25nIG9uIHRoaXMuDQoN
CnN0cnVjdCByZXNvdXJjZSBzdG9yZXMgdGhlIGZpbmFsIGJ5dGUgb2YgdGhlIHJlc291cmNl
LiBJbiBvdXIgY2FzZSAnZW5kJyANCmlzIHRoZSBieXRlIGFmdGVyIHRoYXQuIFNvIHRoZSBj
b2RlIGlzIGNvcnJlY3QuDQoNCkRvIHdlIGV2ZXIgaGF2ZSByZXNvdXJjZXMgdGhhdCBlbmQg
YXQgdGhlIHRvcC1tb3N0IGJ5dGUgb2YgdGhlIGFkZHJlc3MgDQpzcGFjZT8NCg0KPiANCj4g
Wy4uLl0NCj4gDQo+PiArc3RhdGljIHZvaWQgZGV0YWNoX3BsYXRmb3JtX2RldmljZShzdHJ1
Y3QgZGV2aWNlICpkZXYpDQo+PiArew0KPj4gKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7DQo+PiArDQo+PiArCS8qDQo+PiArCSAq
IFJlbW92ZSB0aGUgZGV2aWNlIGZyb20gdGhlIGRldmljZSBoaWVyYXJjaHkuIFRoaXMgaXMg
dGhlIHJpZ2h0IHRoaW5nDQo+PiArCSAqIHRvIGRvIGZvciBmaXJtd2FyZS1iYXNlZCBEUk0g
ZHJpdmVycywgc3VjaCBhcyBFRkksIFZFU0Egb3IgVkdBLiBBZnRlcg0KPj4gKwkgKiB0aGUg
bmV3IGRyaXZlciB0YWtlcyBvdmVyIHRoZSBoYXJkd2FyZSwgdGhlIGZpcm13YXJlIGRldmlj
ZSdzIHN0YXRlDQo+PiArCSAqIHdpbGwgYmUgbG9zdC4NCj4+ICsJICoNCj4+ICsJICogRm9y
IG5vbi1wbGF0Zm9ybSBkZXZpY2VzLCBhIG5ldyBjYWxsYmFjayB3b3VsZCBiZSByZXF1aXJl
ZC4NCj4+ICsJICoNCj4gDQo+IEkgd29uZGVyIGlmIHdlIGV2ZXIgYXJlIGdvaW5nIHRvIG5l
ZWQgdGhpcy4gQUZBSUNUIHRoZSBwcm9ibGVtIG9ubHkgaGFwcGVucyBmb3INCj4gcGxhdGZv
cm0gZGV2aWNlcy4gT3IgZG8geW91IGVudmlzaW9uIGEgY2FzZSB3aGVuIHNvbWUgYSBidXMg
Y291bGQgbmVlZCB0aGlzIGFuZA0KPiB0aGUgYXBlcnR1cmUgdW5yZWdpc3RlciB0aGUgZGV2
aWNlIGluc3RlYWQgb2YgdGhlIExpbnV4IGtlcm5lbCBkZXZpY2UgbW9kZWwgPw0KPiANCg0K
SW4gdGhlIGN1cnJlbnQgY29kZSwgd2UgY2xlYXJseSBkaXN0aW5ndWlzaCBiZXR3ZWVuIHRo
ZSBkZXZpY2UgYW5kIHRoZSANCnBsYXRmb3JtIGRldmljZS4gVGhlIGxhdHRlciBpcyBvbmx5
IHVzZWQgaW4gYSBmZXcgcGxhY2VzIHdoZXJlIGl0J3MgDQphYnNvbHV0ZWx5IG5lY2Vzc2Fy
eSwgYmVjYXVzZSB0aGVyZSdzIG5vIGdlbmVyaWMgZXF1aXZhbGVudCB0byANCnBsYXRmb3Jt
X2RldmljZV91bnJlZ2lzdGVyKCkuIChkZXZpY2VfdW5yZWdpc3RlcigpIGlzIHNvbWV0aGlu
ZyBlbHNlIA0KQUZBSUNULikgIEF0IHNvbWUgcG9pbnQsIEknZCBsaWtlIHRvIHNlZSB0aGUg
YXBlcnR1cmUgY29kZSBiZWluZyBoYW5kbGVkIA0KaW4gYSBtb3JlIHByb21pbmVudCBwbGFj
ZSB3aXRoaW4gcmVzb3VyY2UgbWFuYWdlbWVudC4gVGhhdCB3b3VsZCBuZWVkIGl0IA0KdG8g
dXNlIHN0cnVjdCBkZXZpY2UuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------yl9HI4rWqtowvfqGjuox3YP4--

--------------peM3flJV2Jzk12rbQHVx9lQ9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKxq7MFAwAAAAAACgkQlh/E3EQov+Dh
YxAAl6MW/ypNgBVFZtNtfnnggSL2vyOfDVf9C50uVDGzWj7ry0iH90GDu1MvJEEiqry9CAP87Iga
ra6JHjMfT8mck45OEj8jrkmdzHI5NlvwiaIz9pqHi5g1oWkqCFz93xquTIC1U4xB/jzAxGP5jeLC
8n31XR+Qpr5nOIuTYiznz23NJLThIPxTQ4d/m1R+G2vndD/+sf1vMbnKTWr38DBOMw3znCddncyg
6oaDlns7xRoDnECF2T9rByx/6/jVDkWnwZbB2jTSQ2vUR9Ee9QxCdvdV55r5K1aaE0TVZ86Wq/Sn
UkgXi82/3f4gxIq1My1TWtadDuk40eRdTFN5e8T50SiQQv7Qd4RW3fpXUAz724QbG/+ktmc+b28q
T6+NU1ZIn3AZlxjK88AIIZUrZeg2vlKm+PVEuRmDyR0v0ho4OZTMbNUI4e4qZ/lXfn5vEBlbYd4q
W8arS00M/VAiS5yrrTUv8O1dGpocQslwHQxDKGA/AkA0+0hmnTB/oigMB3jucTl9J2Hf4hX3ipJ4
YmjeUyhfZOVX7Ws6zHpCUeIEjjbYGlc+q4vWfEkKbzf/BenYCvAllqbNC8H7PfWlY0XHneBMq/nb
bAPjvJGTX643VZcn23rchcGHh1oPkY5u0QNv7G/UzeLK97ns2DfKGrJvdAktlN6GM0lDwZLY1HKB
ev0=
=hUoR
-----END PGP SIGNATURE-----

--------------peM3flJV2Jzk12rbQHVx9lQ9--
