Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A944665FA0
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Jan 2023 16:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238657AbjAKPt1 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 11 Jan 2023 10:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239724AbjAKPsv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 11 Jan 2023 10:48:51 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01436D9;
        Wed, 11 Jan 2023 07:48:41 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 78AF04D04;
        Wed, 11 Jan 2023 15:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1673452120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7HolUeqhNdLsoAqq440YRlEf0YkiRssG6oTl1lqBFrg=;
        b=C+zxCwUNikDpo2qRee8qzrB745zGChCzwn2Np8x+h3RBAZa0Jk/9j/s6/jaXs8hNmuGQ3H
        pUYIDJeOOI+lTy3o0BKGPdGz6aGwXUKeRf2JRniFP+yP/zfQuBysjlxAGSdR6xLZoGtIDP
        lEksvLVCq6z/8E+73pEP0w8HOJCczUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1673452120;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7HolUeqhNdLsoAqq440YRlEf0YkiRssG6oTl1lqBFrg=;
        b=2pwoWD/zi/ZqD0lHNS6wtg9IzlPJoyWeFGnlilzIlnggDnqBSy/Ygsjttir11u/xaihtnz
        0uWhyZ+49DDjz4Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40B081358A;
        Wed, 11 Jan 2023 15:48:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id qO6pDljavmOmPgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 15:48:40 +0000
Message-ID: <1118bbfc-16f2-a65c-0dd0-ccc0e42e13c1@suse.de>
Date:   Wed, 11 Jan 2023 16:48:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/11] drm/ast: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Dave Airlie <airlied@redhat.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------P5RX26hFj9D7bORUwnr1Td7e"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------P5RX26hFj9D7bORUwnr1Td7e
Content-Type: multipart/mixed; boundary="------------2yw32F0NFA2IWrkrE62RBQUY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter
 <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org
Message-ID: <1118bbfc-16f2-a65c-0dd0-ccc0e42e13c1@suse.de>
Subject: Re: [PATCH 01/11] drm/ast: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230111154112.90575-1-daniel.vetter@ffwll.ch>

--------------2yw32F0NFA2IWrkrE62RBQUY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDEuMjMgdW0gMTY6NDEgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBJ
dCdzIGp1c3Qgb3BlbiBjb2RlZCBhbmQgbWF0Y2hlcy4NCj4gDQo+IE5vdGUgdGhhdCBUaG9t
YXMgc2FpZCB0aGF0IGhpcyB2ZXJzaW9uIGFwcGFyZW50bHkgZmFpbGVkIGZvciBzb21lDQo+
IHJlYXNvbiwgYnV0IGhleSBtYXliZSB3ZSBzaG91bGQgdHJ5IGFnYWluLg0KDQpJJ2xsIGdp
dmUgdGhpcyBwYXRjaCBhIHRlc3QgdG9tb3Jyb3cuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
aW50ZWwuY29tPg0KPiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4NCj4g
Q2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzogSmF2
aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IENjOiBIZWxn
ZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5l
bC5vcmcNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMgfCAxNiAr
LS0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
NSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jDQo+IGluZGV4IDQy
MGZjNzVjMjQwZS4uM2FjMjRhNzgwZjUwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYu
Yw0KPiBAQCAtOTAsMjcgKzkwLDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2Rldmlj
ZV9pZCBhc3RfcGNpaWRsaXN0W10gPSB7DQo+ICAgDQo+ICAgTU9EVUxFX0RFVklDRV9UQUJM
RShwY2ksIGFzdF9wY2lpZGxpc3QpOw0KPiAgIA0KPiAtc3RhdGljIGludCBhc3RfcmVtb3Zl
X2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4gLXsN
Cj4gLQlib29sIHByaW1hcnkgPSBmYWxzZTsNCj4gLQlyZXNvdXJjZV9zaXplX3QgYmFzZSwg
c2l6ZTsNCj4gLQ0KPiAtCWJhc2UgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgMCk7DQo+
IC0Jc2l6ZSA9IHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCk7DQo+IC0jaWZkZWYgQ09ORklH
X1g4Ng0KPiAtCXByaW1hcnkgPSBwZGV2LT5yZXNvdXJjZVtQQ0lfUk9NX1JFU09VUkNFXS5m
bGFncyAmIElPUkVTT1VSQ0VfUk9NX1NIQURPVzsNCj4gLSNlbmRpZg0KPiAtDQo+IC0JcmV0
dXJuIGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKGJhc2Us
IHNpemUsIHByaW1hcnksICZhc3RfZHJpdmVyKTsNCj4gLX0NCj4gLQ0KPiAgIHN0YXRpYyBp
bnQgYXN0X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBj
aV9kZXZpY2VfaWQgKmVudCkNCj4gICB7DQo+ICAgCXN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0
Ow0KPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2Ow0KPiAgIAlpbnQgcmV0Ow0KPiAgIA0K
PiAtCXJldCA9IGFzdF9yZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKHBkZXYpOw0K
PiArCXJldCA9IGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfcGNpX2ZyYW1lYnVm
ZmVycyhwZGV2LCAmYXN0X2RyaXZlcik7DQo+ICAgCWlmIChyZXQpDQo+ICAgCQlyZXR1cm4g
cmV0Ow0KPiAgIA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8
cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------2yw32F0NFA2IWrkrE62RBQUY--

--------------P5RX26hFj9D7bORUwnr1Td7e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO+2lcFAwAAAAAACgkQlh/E3EQov+Ca
uQ/9GSAJvfal3trQzlRz8EJNpTeK4TmCFv2te06DIQbCpAFE08aG6FlB6BEFxazYJ+pyeNqkq4+N
KlRUVIGbpn8gaioCShe63dwOXmC5PgSQsMaX49bRfPvWx8luJu0rNFY2NuFox3iuRuhut91rTowF
ySJRJ14kmxGc0N0Y7ymLQFIvXCYV/Qr+bXp2Y0ma+YioDqf5dDrp+8vdJo0cfK9Hm0W1G4EjkjmF
TxhFri+30yG1TIke/7OjrcAXuD8XuY0AbzIYEkP1XImW0nGU7IhXILyPsGKD0K7Vi7c0X4nOYd9D
g9QY9yuRcDDK7JC2mHEIXoI7mEbsNQraVu9H3xW3bhOaBOFxKAHtOJICUn4+9WZkHD56snakiuyh
1hxGqD+dshgNOQl7ZCNFQA7eW+cGXIjd0bf54gnGwwQL/RGXITbQ5hG/GMCZLXvOlO0YRS5K+/77
sYaHZPsikDJ1m2/N6Gm1eVkC4kVMcN2Xy2k7VSzdX/O9lV3kl3XwE17fzeTScnR39hbUmstvCEke
I3FHaogKCpK8INDYHbrQCU34MwRZwgfxPjNfgCgr/wgT1zhN1twM70vbogV7+HZVqwVyglFIqEud
IWM8jmQUYlki/Dzf4J+GCsVdGav5pGalaa/YgHae/OCzwInanS5PWNu/1HhpQMQe1WcQ/8o2zk2k
6hk=
=GC3z
-----END PGP SIGNATURE-----

--------------P5RX26hFj9D7bORUwnr1Td7e--
