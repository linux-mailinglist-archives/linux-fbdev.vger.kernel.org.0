Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF0B446172
	for <lists+linux-fbdev@lfdr.de>; Fri,  5 Nov 2021 10:39:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhKEJlw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 5 Nov 2021 05:41:52 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:50274 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhKEJlv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 5 Nov 2021 05:41:51 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D50C31FD33;
        Fri,  5 Nov 2021 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636105150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=botD9nL5X/9G6SBGBomRO546/D9/hxd94G5P/qmUqTA=;
        b=pZVx+Oe4Z2GMAWcfRx3PscGFaUgPYlMQRzsA8oKrmQvHNO1Pq565Or4zNHH37FoJBmsgoG
        UnomX/+v+w7+YwT82o0sH4MUnJJwvsYNd1dxWIBFgEo4j/zGC3mN6QH2r5r3MvrR0VAIMv
        mmCKxLaAj+RD4XPbIeVBq1prNqsCbjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636105150;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=botD9nL5X/9G6SBGBomRO546/D9/hxd94G5P/qmUqTA=;
        b=v4/EnLAwNyABGGeo5o31wIOvLgtyR0slgRzxpBfFmJ05mVYZiq6WTJkFA0ALAbIcGuFQyE
        xy1eWkajhsOtQiDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B03E13B97;
        Fri,  5 Nov 2021 09:39:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 4dZbDb77hGEyawAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 05 Nov 2021 09:39:10 +0000
Message-ID: <2698c680-6d05-f58d-d7c2-ea76aeb0bb47@suse.de>
Date:   Fri, 5 Nov 2021 10:39:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 2/2] drm: Move nomodeset kernel parameter to the DRM
 subsystem
Content-Language: en-US
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Peter Robinson <pbrobinson@gmail.com>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>, Chia-I Wu <olvaffe@gmail.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Zack Rusin <zackr@vmware.com>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, nouveau@lists.freedesktop.org,
        spice-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-3-javierm@redhat.com>
 <f2c40b22-04bf-e8f2-9839-36d6d26189a1@suse.de> <87cznf9cty.fsf@intel.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87cznf9cty.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zl0Oh59VDXN0QB6wEYp8aODT"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zl0Oh59VDXN0QB6wEYp8aODT
Content-Type: multipart/mixed; boundary="------------l4WtE5NDCwhX3Yej90putktx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Peter Robinson
 <pbrobinson@gmail.com>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Chia-I Wu <olvaffe@gmail.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <2698c680-6d05-f58d-d7c2-ea76aeb0bb47@suse.de>
Subject: Re: [PATCH v2 2/2] drm: Move nomodeset kernel parameter to the DRM
 subsystem
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-3-javierm@redhat.com>
 <f2c40b22-04bf-e8f2-9839-36d6d26189a1@suse.de> <87cznf9cty.fsf@intel.com>
In-Reply-To: <87cznf9cty.fsf@intel.com>

--------------l4WtE5NDCwhX3Yej90putktx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTEuMjEgdW0gMTA6MjIgc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
RnJpLCAwNSBOb3YgMjAyMSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+IHdyb3RlOg0KPj4gSGkNCj4+DQo+PiBBbSAwNC4xMS4yMSB1bSAxNzowNyBzY2hyaWVi
IEphdmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4+PiBUaGUgIm5vbW9kZXNldCIga2VybmVs
IGNtZGxpbmUgcGFyYW1ldGVyIGlzIGhhbmRsZWQgYnkgdGhlIHZnYWNvbiBkcml2ZXINCj4+
PiBidXQgdGhlIGV4cG9ydGVkIHZnYWNvbl90ZXh0X2ZvcmNlKCkgc3ltYm9sIGlzIG9ubHkg
dXNlZCBieSBEUk0gZHJpdmVycy4NCj4+Pg0KPj4+IEl0IG1ha2VzIG11Y2ggbW9yZSBzZW5z
ZSBmb3IgdGhlIHBhcmFtZXRlciBsb2dpYyB0byBiZSBpbiB0aGUgc3Vic3lzdGVtDQo+Pj4g
b2YgdGhlIGRyaXZlcnMgdGhhdCBhcmUgbWFraW5nIHVzZSBvZiBpdC4NCj4+Pg0KPj4+IExl
dCdzIG1vdmUgdGhlIHZnYWNvbl90ZXh0X2ZvcmNlKCkgZnVuY3Rpb24gYW5kIHJlbGF0ZWQg
bG9naWMgdG8gdGhlIERSTQ0KPj4+IHN1YnN5c3RlbS4gV2hpbGUgZG9pbmcgdGhhdCwgcmVu
YW1lIHRoZSBmdW5jdGlvbiB0byBkcm1fY2hlY2tfbW9kZXNldCgpDQo+Pj4gd2hpY2ggYmV0
dGVyIHJlZmxlY3RzIHdoYXQgdGhlIGZ1bmN0aW9uIGlzIHJlYWxseSB1c2VkIHRvIHRlc3Qg
Zm9yLg0KPj4+DQo+Pj4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPg0KPj4+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5p
bGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4+IC0tLQ0KPj4+DQo+Pj4gQ2hhbmdlcyBp
biB2MjoNCj4+PiAtIENvbmRpdGlvbmFsbHkgYnVpbGQgZHJtX25vbW9kZXNldC5vIGlmIENP
TkZJR19WR0FfQ09OU09MRSBpcyBzZXQuDQo+Pj4gLSBTcXVhc2ggcGF0Y2hlcyB0byBtb3Zl
IG5vbW9kZXNldCBsb2dpYyB0byBEUk0gYW5kIGRvIHRoZSByZW5hbWluZy4NCj4+PiAtIE5h
bWUgdGhlIGZ1bmN0aW9uIGRybV9jaGVja19tb2Rlc2V0KCkgYW5kIG1ha2UgaXQgcmV0dXJu
IC1FTk9ERVYuDQo+Pj4NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAg
ICAgICAgICAgfCAgMiArKw0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYyB8ICAxIC0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYu
YyAgICAgICAgICAgfCAgMSAtDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYyAg
ICAgICAgICAgICAgIHwgIDkgKysrKystLS0tDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9ub21vZGVzZXQuYyAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfbW9kdWxlLmMgICAgICB8ICAyIC0t
DQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyAgIHwgIDEg
LQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMgICB8ICAx
IC0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYyAgICAgICAgICAgfCAg
MSAtDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgICAgIHwg
IDEgLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS90aW55L2JvY2hzLmMgICAgICAgICAgICB8
ICAxIC0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdGlueS9jaXJydXMuYyAgICAgICAgICAg
fCAgMSAtDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Rydi5jICAg
IHwgIDEgLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYyAg
ICB8ICAxIC0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyAg
ICAgfCAgMSAtDQo+Pj4gICAgZHJpdmVycy92aWRlby9jb25zb2xlL3ZnYWNvbi5jICAgICAg
ICAgIHwgMjEgLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+PiAgICBpbmNsdWRlL2RybS9kcm1f
bW9kZV9jb25maWcuaCAgICAgICAgICAgfCAgNiArKysrKysNCj4+PiAgICBpbmNsdWRlL2xp
bnV4L2NvbnNvbGUuaCAgICAgICAgICAgICAgICAgfCAgNiAtLS0tLS0NCj4+PiAgICAxOCBm
aWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkNCj4+PiAg
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9ub21vZGVzZXQuYw0K
Pj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSBiL2RyaXZl
cnMvZ3B1L2RybS9NYWtlZmlsZQ0KPj4+IGluZGV4IDFjNDExNTZkZWI1Zi4uYzc0ODEwYzI4
NWFmIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQ0KPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQ0KPj4+IEBAIC0zMyw2ICszMyw4IEBAIGRy
bS0kKENPTkZJR19EUk1fUFJJVkFDWV9TQ1JFRU4pICs9IGRybV9wcml2YWN5X3NjcmVlbi5v
IGRybV9wcml2YWN5X3NjcmVlbl94ODYuDQo+Pj4gICAgDQo+Pj4gICAgb2JqLSQoQ09ORklH
X0RSTV9EUF9BVVhfQlVTKSArPSBkcm1fZHBfYXV4X2J1cy5vDQo+Pj4gICAgDQo+Pj4gK29i
ai0kKENPTkZJR19WR0FfQ09OU09MRSkgKz0gZHJtX25vbW9kZXNldC5vDQo+Pj4gKw0KPj4N
Cj4+IFRoaXMgbm93IGRlcGVuZHMgb24gdGhlIFZHQSB0ZXh0bW9kZSBjb25zb2xlLiBFdmVu
IGlmIHlvdSBoYXZlIG5vIFZHQQ0KPj4gY29uc29sZSwgeW91J2Qgd2FudCBkcm1fbm9tb2Rl
c2V0Lm8uIFNpbXBsZWRybSBtaWdodCBiZSBidWlsdC1pbiBhbmQgY2FuDQo+PiBwcm92aWRl
IGdyYXBoaWNzLiBOb24tUEMgc3lzdGVtcyBkb24ndCBldmVuIGhhdmUgYSBWR0EgZGV2aWNl
Lg0KPiANCj4gVGhpcyB3YXMgZGlzY3Vzc2VkIGluIGFuIGVhcmxpZXIgdmVyc2lvbiwgd2hp
Y2ggaGFkIHRoaXMgYnVpbHRpbiBidXQgdGhlDQo+IGhlYWRlciBzdGlsbCBoYWQgYSBzdHVi
IGZvciBDT05GSUdfVkdBX0NPTlNPTEU9bi4NCj4gDQo+PiBJIHRoaW5rIHdlIHJlYWxseSB3
YW50IGEgc2VwYXJhdGUgYm9vbGVhbiBjb25maWcgb3B0aW9uIHRoYXQgZ2V0cw0KPj4gc2Vs
ZWN0ZWQgYnkgQ09ORklHX0RSTS4NCj4gDQo+IFBlcmhhcHMgdGhhdCBzaG91bGQgYmUgYSBz
ZXBhcmF0ZSBjaGFuZ2Ugb24gdG9wLg0KDQpTdXJlLCBtYWtlIGl0IGEgc2VwYXJhdGUgcGF0
Y2guDQoNCldlIHdhbnQgdG8gbWFrZSB0aGlzIHdvcmsgb24gQVJNIHN5c3RlbXMuIEkgZXZl
biBoYXZlIGEgcmVxdWVzdCB0byANCnJlcGxhY2Ugb2ZmYiBvbiBQb3dlciBhcmNoaXRlY3R1
cmUgYnkgc2ltcGxlZHJtLiBTbyB0aGUgZmluYWwgY29uZmlnIGhhcyANCnRvIGJlIHN5c3Rl
bSBhZ25vc3RpYy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQlIsDQo+IEph
bmkuDQo+IA0KPj4NCj4+DQo+Pj4gICAgZHJtX2NtYV9oZWxwZXIteSA6PSBkcm1fZ2VtX2Nt
YV9oZWxwZXIubw0KPj4+ICAgIG9iai0kKENPTkZJR19EUk1fR0VNX0NNQV9IRUxQRVIpICs9
IGRybV9jbWFfaGVscGVyLm8NCj4+PiAgICANCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jDQo+Pj4gaW5kZXggN2ZkZTQwZDA2MTgxLi5iNGI2OTkzODYx
ZTYgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ry
di5jDQo+Pj4gQEAgLTMxLDcgKzMxLDYgQEANCj4+PiAgICAjaW5jbHVkZSAiYW1kZ3B1X2Ry
di5oIg0KPj4+ICAgIA0KPj4+ICAgICNpbmNsdWRlIDxkcm0vZHJtX3BjaWlkcy5oPg0KPj4+
IC0jaW5jbHVkZSA8bGludXgvY29uc29sZS5oPg0KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4NCj4+PiAgICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPj4+ICAg
ICNpbmNsdWRlIDxsaW51eC92Z2Ffc3dpdGNoZXJvby5oPg0KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X2Rydi5jDQo+Pj4gaW5kZXggODAyMDYzMjc5Yjg2Li42MjIyMDgyYzMwODIgMTAwNjQ0DQo+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMNCj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYw0KPj4+IEBAIC0yNiw3ICsyNiw2IEBADQo+Pj4g
ICAgICogQXV0aG9yczogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4NCj4+PiAg
ICAgKi8NCj4+PiAgICANCj4+PiAtI2luY2x1ZGUgPGxpbnV4L2NvbnNvbGUuaD4NCj4+PiAg
ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L3Bj
aS5oPg0KPj4+ICAgIA0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYw0KPj4+IGluZGV4IDNmYjU2N2Q2Mjg4
MS4uODBiODViOGVhNzc2IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHJ2LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jDQo+Pj4gQEAgLTk4
NiwxMiArOTg2LDEzIEBAIEVYUE9SVF9TWU1CT0woZHJtX2Rldl9zZXRfdW5pcXVlKTsNCj4+
PiAgICAgKi8NCj4+PiAgICBpbnQgZHJtX2Rydl9lbmFibGVkKGNvbnN0IHN0cnVjdCBkcm1f
ZHJpdmVyICpkcml2ZXIpDQo+Pj4gICAgew0KPj4+IC0JaWYgKHZnYWNvbl90ZXh0X2ZvcmNl
KCkpIHsNCj4+PiArCWludCByZXQ7DQo+Pj4gKw0KPj4+ICsJcmV0ID0gZHJtX2NoZWNrX21v
ZGVzZXQoKTsNCj4+PiArCWlmIChyZXQpDQo+Pj4gICAgCQlEUk1fSU5GTygiJXMgZHJpdmVy
IGlzIGRpc2FibGVkXG4iLCBkcml2ZXItPm5hbWUpOw0KPj4+IC0JCXJldHVybiAtRU5PREVW
Ow0KPj4+IC0JfQ0KPj4+ICAgIA0KPj4+IC0JcmV0dXJuIDA7DQo+Pj4gKwlyZXR1cm4gcmV0
Ow0KPj4+ICAgIH0NCj4+PiAgICBFWFBPUlRfU1lNQk9MKGRybV9kcnZfZW5hYmxlZCk7DQo+
Pj4gICAgDQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbm9tb2Rlc2V0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX25vbW9kZXNldC5jDQo+Pj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjY2ODNlMzk2ZDJjNQ0KPj4+IC0t
LSAvZGV2L251bGwNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX25vbW9kZXNldC5j
DQo+Pj4gQEAgLTAsMCArMSwyNiBAQA0KPj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPj4+ICsNCj4+PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPj4+
ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4+PiArDQo+Pj4gK3N0YXRpYyBib29sIGRy
bV9ub21vZGVzZXQ7DQo+Pj4gKw0KPj4+ICtpbnQgZHJtX2NoZWNrX21vZGVzZXQodm9pZCkN
Cj4+PiArew0KPj4+ICsJcmV0dXJuIGRybV9ub21vZGVzZXQgPyAtRU5PREVWIDogMDsNCj4+
PiArfQ0KPj4+ICtFWFBPUlRfU1lNQk9MKGRybV9jaGVja19tb2Rlc2V0KTsNCj4+PiArDQo+
Pj4gK3N0YXRpYyBpbnQgX19pbml0IGRpc2FibGVfbW9kZXNldChjaGFyICpzdHIpDQo+Pj4g
K3sNCj4+PiArCWRybV9ub21vZGVzZXQgPSB0cnVlOw0KPj4+ICsNCj4+PiArCXByX3dhcm4o
IllvdSBoYXZlIGJvb3RlZCB3aXRoIG5vbW9kZXNldC4gVGhpcyBtZWFucyB5b3VyIEdQVSBk
cml2ZXJzIGFyZSBESVNBQkxFRFxuIik7DQo+Pj4gKwlwcl93YXJuKCJBbnkgdmlkZW8gcmVs
YXRlZCBmdW5jdGlvbmFsaXR5IHdpbGwgYmUgc2V2ZXJlbHkgZGVncmFkZWQsIGFuZCB5b3Ug
bWF5IG5vdCBldmVuIGJlIGFibGUgdG8gc3VzcGVuZCB0aGUgc3lzdGVtIHByb3Blcmx5XG4i
KTsNCj4+PiArCXByX3dhcm4oIlVubGVzcyB5b3UgYWN0dWFsbHkgdW5kZXJzdGFuZCB3aGF0
IG5vbW9kZXNldCBkb2VzLCB5b3Ugc2hvdWxkIHJlYm9vdCB3aXRob3V0IGVuYWJsaW5nIGl0
XG4iKTsNCj4+DQo+PiBJJ2QgdXBkYXRlIHRoaXMgdGV4dCB0byBiZSBsZXNzIHNlbnNhdGlv
bmFsLg0KPj4NCj4+PiArDQo+Pj4gKwlyZXR1cm4gMTsNCj4+PiArfQ0KPj4+ICsNCj4+PiAr
LyogRGlzYWJsZSBrZXJuZWwgbW9kZXNldHRpbmcgKi8NCj4+PiArX19zZXR1cCgibm9tb2Rl
c2V0IiwgZGlzYWJsZV9tb2Rlc2V0KTsNCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9tb2R1bGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfbW9k
dWxlLmMNCj4+PiBpbmRleCA0NWNiM2U1NDBlZmYuLmM4OTBjMWNhMjBjNCAxMDA2NDQNCj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X21vZHVsZS5jDQo+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9tb2R1bGUuYw0KPj4+IEBAIC00LDggKzQsNiBA
QA0KPj4+ICAgICAqIENvcHlyaWdodCDCqSAyMDIxIEludGVsIENvcnBvcmF0aW9uDQo+Pj4g
ICAgICovDQo+Pj4gICAgDQo+Pj4gLSNpbmNsdWRlIDxsaW51eC9jb25zb2xlLmg+DQo+Pj4g
LQ0KPj4NCj4+IFRoZXNlIGNoYW5nZXMgc2hvdWxkIGJlIGluIHBhdGNoIDE/DQo+Pg0KPj4+
ICAgICNpbmNsdWRlICJnZW0vaTkxNV9nZW1fY29udGV4dC5oIg0KPj4+ICAgICNpbmNsdWRl
ICJnZW0vaTkxNV9nZW1fb2JqZWN0LmgiDQo+Pj4gICAgI2luY2x1ZGUgImk5MTVfYWN0aXZl
LmgiDQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
ZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jDQo+Pj4gaW5k
ZXggMmE1ODEwOTRiYTJiLi44ZTAwMGNhYzExYmEgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMNCj4+PiBAQCAtNiw3ICs2LDYgQEANCj4+PiAg
ICAgKiAgICAgICAgICBEYXZlIEFpcmxpZQ0KPj4+ICAgICAqLw0KPj4+ICAgIA0KPj4+IC0j
aW5jbHVkZSA8bGludXgvY29uc29sZS5oPg0KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9tb2R1
bGUuaD4NCj4+PiAgICAjaW5jbHVkZSA8bGludXgvcGNpLmg+DQo+Pj4gICAgI2luY2x1ZGUg
PGxpbnV4L3ZtYWxsb2MuaD4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
ZHJtLmMNCj4+PiBpbmRleCA4ODQ0ZDM2MDJkODcuLmJkMTQ1NjUyMWI3YyAxMDA2NDQNCj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jDQo+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYw0KPj4+IEBAIC0yMiw3
ICsyMiw2IEBADQo+Pj4gICAgICogQXV0aG9yczogQmVuIFNrZWdncw0KPj4+ICAgICAqLw0K
Pj4+ICAgIA0KPj4+IC0jaW5jbHVkZSA8bGludXgvY29uc29sZS5oPg0KPj4+ICAgICNpbmNs
dWRlIDxsaW51eC9kZWxheS5oPg0KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4N
Cj4+PiAgICAjaW5jbHVkZSA8bGludXgvcGNpLmg+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2
LmMNCj4+PiBpbmRleCAzYWMyZWYyYmY1NDUuLmZmMDcwYWM3NjExMSAxMDA2NDQNCj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYw0KPj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9xeGwvcXhsX2Rydi5jDQo+Pj4gQEAgLTI5LDcgKzI5LDYgQEANCj4+PiAgICAN
Cj4+PiAgICAjaW5jbHVkZSAicXhsX2Rydi5oIg0KPj4+ICAgIA0KPj4+IC0jaW5jbHVkZSA8
bGludXgvY29uc29sZS5oPg0KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4+
PiAgICAjaW5jbHVkZSA8bGludXgvcGNpLmg+DQo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L3Zn
YWFyYi5oPg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jDQo+Pj4gaW5k
ZXggNTZkNjg4YzA0MzQ2Li5mNTljYzk3MWVjOTUgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9kcnYuYw0KPj4+IEBAIC0zMSw3ICszMSw2IEBADQo+Pj4gICAg
DQo+Pj4gICAgDQo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L2NvbXBhdC5oPg0KPj4+IC0jaW5j
bHVkZSA8bGludXgvY29uc29sZS5oPg0KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4NCj4+PiAgICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPj4+ICAgICNpbmNs
dWRlIDxsaW51eC92Z2Ffc3dpdGNoZXJvby5oPg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdGlueS9ib2Nocy5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9jaHMuYw0K
Pj4+IGluZGV4IGVlNmIxZmY5MTI4Yi4uNmU5YTMxZjFhMGYzIDEwMDY0NA0KPj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90aW55L2JvY2hzLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vdGlueS9ib2Nocy5jDQo+Pj4gQEAgLTEsNiArMSw1IEBADQo+Pj4gICAgLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXINCj4+PiAgICANCj4+PiAtI2lu
Y2x1ZGUgPGxpbnV4L2NvbnNvbGUuaD4NCj4+PiAgICAjaW5jbHVkZSA8bGludXgvcGNpLmg+
DQo+Pj4gICAgDQo+Pj4gICAgI2luY2x1ZGUgPGRybS9kcm1fYXBlcnR1cmUuaD4NCj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvY2lycnVzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdGlueS9jaXJydXMuYw0KPj4+IGluZGV4IDQ3MDZjNWJjMzA2Ny4uNjU5MjA4ZDVh
ZWY5IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2NpcnJ1cy5jDQo+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvY2lycnVzLmMNCj4+PiBAQCAtMTYsNyAr
MTYsNiBAQA0KPj4+ICAgICAqIENvcHlyaWdodCAxOTk5LTIwMDEgSmVmZiBHYXJ6aWsgPGpn
YXJ6aWtAcG9ib3guY29tPg0KPj4+ICAgICAqLw0KPj4+ICAgIA0KPj4+IC0jaW5jbHVkZSA8
bGludXgvY29uc29sZS5oPg0KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLW1hcC5o
Pg0KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4+PiAgICAjaW5jbHVkZSA8
bGludXgvcGNpLmg+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlk
ZW8vdmJveF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYw0K
Pj4+IGluZGV4IGU0Mzc3YzM3Y2YzMy4uYjFlNjNmZDU0M2JiIDEwMDY0NA0KPj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYw0KPj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYw0KPj4+IEBAIC03LDcgKzcsNiBAQA0K
Pj4+ICAgICAqICAgICAgICAgIE1pY2hhZWwgVGhheWVyIDxtaWNoYWVsLnRoYXllckBvcmFj
bGUuY29tLA0KPj4+ICAgICAqICAgICAgICAgIEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+DQo+Pj4gICAgICovDQo+Pj4gLSNpbmNsdWRlIDxsaW51eC9jb25zb2xlLmg+
DQo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPj4+ICAgICNpbmNsdWRlIDxs
aW51eC9wY2kuaD4NCj4+PiAgICAjaW5jbHVkZSA8bGludXgvdnRfa2Vybi5oPg0KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMNCj4+PiBpbmRleCAyODIwMGRmYmEy
ZDEuLmJhOWMwYzJmOGFlNiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfZHJ2LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfZHJ2LmMNCj4+PiBAQCAtMjcsNyArMjcsNiBAQA0KPj4+ICAgICAqLw0KPj4+ICAg
IA0KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4+PiAtI2luY2x1ZGUgPGxp
bnV4L2NvbnNvbGUuaD4NCj4+PiAgICAjaW5jbHVkZSA8bGludXgvcGNpLmg+DQo+Pj4gICAg
I2luY2x1ZGUgPGxpbnV4L3BvbGwuaD4NCj4+PiAgICAjaW5jbHVkZSA8bGludXgvd2FpdC5o
Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jDQo+Pj4gaW5kZXggMDVl
OTk0OTI5M2Q1Li4xMTVlYzk1MTgyNzcgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9kcnYuYw0KPj4+IEBAIC0yNSw3ICsyNSw2IEBADQo+Pj4gICAgICoNCj4+
PiAgICAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKiovDQo+Pj4gICAgDQo+Pj4gLSNpbmNsdWRlIDxs
aW51eC9jb25zb2xlLmg+DQo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+
DQo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPj4+ICAgICNpbmNsdWRlIDxs
aW51eC9wY2kuaD4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9jb25zb2xlL3Zn
YWNvbi5jIGIvZHJpdmVycy92aWRlby9jb25zb2xlL3ZnYWNvbi5jDQo+Pj4gaW5kZXggZWY5
YzU3Y2UwOTA2Li5kNDMyMGIxNDc5NTYgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy92aWRl
by9jb25zb2xlL3ZnYWNvbi5jDQo+Pj4gKysrIGIvZHJpdmVycy92aWRlby9jb25zb2xlL3Zn
YWNvbi5jDQo+Pj4gQEAgLTk3LDMwICs5Nyw5IEBAIHN0YXRpYyBpbnQgCQl2Z2FfdmlkZW9f
Zm9udF9oZWlnaHQ7DQo+Pj4gICAgc3RhdGljIGludCAJCXZnYV9zY2FuX2xpbmVzCQlfX3Jl
YWRfbW9zdGx5Ow0KPj4+ICAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgCXZnYV9yb2xsZWRfb3Zl
cjsgLyogbGFzdCB2Y19vcmlnaW4gb2Zmc2V0IGJlZm9yZSB3cmFwICovDQo+Pj4gICAgDQo+
Pj4gLXN0YXRpYyBib29sIHZnYWNvbl90ZXh0X21vZGVfZm9yY2U7DQo+Pj4gICAgc3RhdGlj
IGJvb2wgdmdhX2hhcmRzY3JvbGxfZW5hYmxlZDsNCj4+PiAgICBzdGF0aWMgYm9vbCB2Z2Ff
aGFyZHNjcm9sbF91c2VyX2VuYWJsZSA9IHRydWU7DQo+Pj4gICAgDQo+Pj4gLWJvb2wgdmdh
Y29uX3RleHRfZm9yY2Uodm9pZCkNCj4+PiAtew0KPj4+IC0JcmV0dXJuIHZnYWNvbl90ZXh0
X21vZGVfZm9yY2U7DQo+Pj4gLX0NCj4+PiAtRVhQT1JUX1NZTUJPTCh2Z2Fjb25fdGV4dF9m
b3JjZSk7DQo+Pj4gLQ0KPj4+IC1zdGF0aWMgaW50IF9faW5pdCB0ZXh0X21vZGUoY2hhciAq
c3RyKQ0KPj4+IC17DQo+Pj4gLQl2Z2Fjb25fdGV4dF9tb2RlX2ZvcmNlID0gdHJ1ZTsNCj4+
PiAtDQo+Pj4gLQlwcl93YXJuKCJZb3UgaGF2ZSBib290ZWQgd2l0aCBub21vZGVzZXQuIFRo
aXMgbWVhbnMgeW91ciBHUFUgZHJpdmVycyBhcmUgRElTQUJMRURcbiIpOw0KPj4+IC0JcHJf
d2FybigiQW55IHZpZGVvIHJlbGF0ZWQgZnVuY3Rpb25hbGl0eSB3aWxsIGJlIHNldmVyZWx5
IGRlZ3JhZGVkLCBhbmQgeW91IG1heSBub3QgZXZlbiBiZSBhYmxlIHRvIHN1c3BlbmQgdGhl
IHN5c3RlbSBwcm9wZXJseVxuIik7DQo+Pj4gLQlwcl93YXJuKCJVbmxlc3MgeW91IGFjdHVh
bGx5IHVuZGVyc3RhbmQgd2hhdCBub21vZGVzZXQgZG9lcywgeW91IHNob3VsZCByZWJvb3Qg
d2l0aG91dCBlbmFibGluZyBpdFxuIik7DQo+Pj4gLQ0KPj4+IC0JcmV0dXJuIDE7DQo+Pj4g
LX0NCj4+PiAtDQo+Pj4gLS8qIGZvcmNlIHRleHQgbW9kZSAtIHVzZWQgYnkga2VybmVsIG1v
ZGVzZXR0aW5nICovDQo+Pj4gLV9fc2V0dXAoIm5vbW9kZXNldCIsIHRleHRfbW9kZSk7DQo+
Pj4gLQ0KPj4+ICAgIHN0YXRpYyBpbnQgX19pbml0IG5vX3Njcm9sbChjaGFyICpzdHIpDQo+
Pj4gICAgew0KPj4+ICAgIAkvKg0KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
bW9kZV9jb25maWcuaCBiL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oDQo+Pj4gaW5k
ZXggNDhiN2RlODBkYWY1Li4xODk4MmQzNTA3ZTQgMTAwNjQ0DQo+Pj4gLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX21vZGVfY29uZmlnLmgNCj4+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fbW9k
ZV9jb25maWcuaA0KPj4+IEBAIC05NjksNCArOTY5LDEwIEBAIHN0YXRpYyBpbmxpbmUgaW50
IGRybV9tb2RlX2NvbmZpZ19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+Pj4gICAg
dm9pZCBkcm1fbW9kZV9jb25maWdfcmVzZXQoc3RydWN0IGRybV9kZXZpY2UgKmRldik7DQo+
Pj4gICAgdm9pZCBkcm1fbW9kZV9jb25maWdfY2xlYW51cChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2KTsNCj4+PiAgICANCj4+PiArI2lmZGVmIENPTkZJR19WR0FfQ09OU09MRQ0KPj4+ICtl
eHRlcm4gaW50IGRybV9jaGVja19tb2Rlc2V0KHZvaWQpOw0KPj4+ICsjZWxzZQ0KPj4+ICtz
dGF0aWMgaW5saW5lIGludCBkcm1fY2hlY2tfbW9kZXNldCh2b2lkKSB7IHJldHVybiAwOyB9
DQo+Pj4gKyNlbmRpZg0KPj4+ICsNCj4+PiAgICAjZW5kaWYNCj4+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9jb25zb2xlLmggYi9pbmNsdWRlL2xpbnV4L2NvbnNvbGUuaA0KPj4+
IGluZGV4IDIwODc0ZGI1MGJjOC4uZDRkZDgzODQ4OThiIDEwMDY0NA0KPj4+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvY29uc29sZS5oDQo+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9jb25zb2xl
LmgNCj4+PiBAQCAtMjE3LDEyICsyMTcsNiBAQCBleHRlcm4gYXRvbWljX3QgaWdub3JlX2Nv
bnNvbGVfbG9ja193YXJuaW5nOw0KPj4+ICAgICNkZWZpbmUgVkVTQV9IU1lOQ19TVVNQRU5E
ICAgICAgMg0KPj4+ICAgICNkZWZpbmUgVkVTQV9QT1dFUkRPV04gICAgICAgICAgMw0KPj4+
ICAgIA0KPj4+IC0jaWZkZWYgQ09ORklHX1ZHQV9DT05TT0xFDQo+Pj4gLWV4dGVybiBib29s
IHZnYWNvbl90ZXh0X2ZvcmNlKHZvaWQpOw0KPj4+IC0jZWxzZQ0KPj4+IC1zdGF0aWMgaW5s
aW5lIGJvb2wgdmdhY29uX3RleHRfZm9yY2Uodm9pZCkgeyByZXR1cm4gZmFsc2U7IH0NCj4+
PiAtI2VuZGlmDQo+Pj4gLQ0KPj4+ICAgIGV4dGVybiB2b2lkIGNvbnNvbGVfaW5pdCh2b2lk
KTsNCj4+PiAgICANCj4+PiAgICAvKiBGb3IgZGVmZXJyZWQgY29uc29sZSB0YWtlb3ZlciAq
Lw0KPj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8
cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------l4WtE5NDCwhX3Yej90putktx--

--------------zl0Oh59VDXN0QB6wEYp8aODT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGE+70FAwAAAAAACgkQlh/E3EQov+BH
Bw//ficIfs5und3AvRNRvqP7fYQyqGJZzZWv5yi7/7ZFMufHfnTZI34+p6Roz85l6FBTdU4Jx6wK
RwEEoKmbyaLZU6eS47P5AMuxo96Y3d51Z5TAz8fYOPIc7UHjmew3PigmFx8uYzIhOY3FE3knt9rJ
4HgjHLHEq/UlaBBY++QClyp/OuxgCdgvX0QxpgKujPaVbJR5VNqcIJz2F2fKYqyiNjh/3j6WWQt5
31hOHBE+JzRbRba6YkXyIYlOjFbAOvzERFC82WXS9oT02GkxFNLdN6X3OaszC33hBusJOYN4tNQX
vwqm9QPDMI8i6OM3k+KwCuqpkGU9tvRERvaFGQTHo3aXSMNgwN+77HLr4R1p8E5XOh3CDW4LeHOd
OpM6zduW+zeNGnUzT1tOYMzsNpO28xi175evsagMoWIQIvw8BqgA+sMDjvI1lD2+pTQ3SqVBvOhE
od/KGJfCr3nXQSq7ojiQqGJSiBIzmA+MwIcEjkIzNAmcEMD/FhT+Jr5VlZI+XSLGbIS5aMn/6elZ
QKIGIJkpR+7rR+RBIsCJPMFU00AMQfA10g67G1eo7nOBY6k4JlsojxTWE4ojqqNuvA8sAzcxZu+6
fMLld3Fb7TZ4lRugs9x/f4bCW9kY/PsBucA/W/cTkXDePbcY8A/GrqBDTR+8NrG/2sFa4Q6leag9
uro=
=B9Me
-----END PGP SIGNATURE-----

--------------zl0Oh59VDXN0QB6wEYp8aODT--
