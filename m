Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023C74441BA
	for <lists+linux-fbdev@lfdr.de>; Wed,  3 Nov 2021 13:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbhKCMnv (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 3 Nov 2021 08:43:51 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:45034 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbhKCMnu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 3 Nov 2021 08:43:50 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A52AA1FD2F;
        Wed,  3 Nov 2021 12:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635943272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cRnyTfaNhYLhs8HgDApLO7O6H73Ejpb+Xrvm1l2ew1o=;
        b=wa1F1x6qUYfevCOynRd+GmrwdW3H+ZpVJi3kKUXiHZo1sImrfwANg9wGPktB6ftItyFfmO
        quFMYkC3lk4flTCjCCYT6wsgoPgr3AKrS4RBpT0kXU8/bx1wWu2d1c0T9OvurPVcVS32Vo
        mBXTImoOcEJ3YC8G1foxoebELOu8+6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635943272;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cRnyTfaNhYLhs8HgDApLO7O6H73Ejpb+Xrvm1l2ew1o=;
        b=hO2zdHNlxVk/ntfr5r9u3KK9PAofgASg7LskAmu8lYerJwhVcPV85YdyeoqbK6dsrdGeEl
        TfgSRuIWJJUi3aAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A0ED13DEB;
        Wed,  3 Nov 2021 12:41:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id rXqBAWiDgmHKWgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 03 Nov 2021 12:41:12 +0000
Message-ID: <a95acef3-8647-9fb0-efa7-9c3a35524052@suse.de>
Date:   Wed, 3 Nov 2021 13:41:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [RESEND PATCH 2/5] drm: Move nomodeset kernel parameter handler
 to the DRM subsystem
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>,
        =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Neal Gompa <ngompa13@gmail.com>,
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
        Jani Nikula <jani.nikula@linux.intel.com>,
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
References: <20211103122809.1040754-1-javierm@redhat.com>
 <20211103122809.1040754-3-javierm@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211103122809.1040754-3-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LZZKu0R06YlOgIKNWDXaw2Ec"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LZZKu0R06YlOgIKNWDXaw2Ec
Content-Type: multipart/mixed; boundary="------------mjKOQKKz346E0GBb5eGIho0V";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Neal Gompa <ngompa13@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Chia-I Wu <olvaffe@gmail.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <a95acef3-8647-9fb0-efa7-9c3a35524052@suse.de>
Subject: Re: [RESEND PATCH 2/5] drm: Move nomodeset kernel parameter handler
 to the DRM subsystem
References: <20211103122809.1040754-1-javierm@redhat.com>
 <20211103122809.1040754-3-javierm@redhat.com>
In-Reply-To: <20211103122809.1040754-3-javierm@redhat.com>

--------------mjKOQKKz346E0GBb5eGIho0V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMTEuMjEgdW0gMTM6Mjggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZSAibm9tb2Rlc2V0IiBrZXJuZWwgY21kbGluZSBwYXJhbWV0ZXIgaXMg
aGFuZGxlZCBieSB0aGUgdmdhY29uIGRyaXZlcg0KPiBidXQgdGhlIGV4cG9ydGVkIHZnYWNv
bl90ZXh0X2ZvcmNlKCkgc3ltYm9sIGlzIG9ubHkgdXNlZCBieSBEUk0gZHJpdmVycy4NCj4g
DQo+IEl0IG1ha2VzIG11Y2ggbW9yZSBzZW5zZSBmb3IgdGhlIHBhcmFtZXRlciBsb2dpYyB0
byBiZSBpbiB0aGUgc3Vic3lzdGVtDQo+IG9mIHRoZSBkcml2ZXJzIHRoYXQgYXJlIG1ha2lu
ZyB1c2Ugb2YgaXQuIExldCdzIG1vdmUgdGhhdCB0byBEUk0uDQo+IA0KPiBTdWdnZXN0ZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+IFNpZ25lZC1v
ZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0K
PiAtLS0NCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgICAgICAg
IHwgIDIgKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMg
fCAgMyArLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyAgICAgICAgICAg
fCAgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9ub21vZGVzZXQuYyAgICAgICAgIHwg
MjYgKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfbW9kdWxlLmMgICAgICB8ICAyIC0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF9kcnYuYyAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfZHJtLmMgICB8ICAxIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9k
cnYuYyAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZHJ2LmMgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L2JvY2hzLmMg
ICAgICAgICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdGlueS9jaXJydXMuYyAg
ICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Ry
di5jICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYu
YyAgICB8ICAxIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyAg
ICAgfCAgMSAtDQo+ICAgZHJpdmVycy92aWRlby9jb25zb2xlL3ZnYWNvbi5jICAgICAgICAg
IHwgMjEgLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBpbmNsdWRlL2RybS9kcm1fbW9kZV9j
b25maWcuaCAgICAgICAgICAgfCAgNiArKysrKysNCj4gICBpbmNsdWRlL2xpbnV4L2NvbnNv
bGUuaCAgICAgICAgICAgICAgICAgfCAgNiAtLS0tLS0NCj4gICAxNyBmaWxlcyBjaGFuZ2Vk
LCAzNSBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkNCj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9ub21vZGVzZXQuYw0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmls
ZQ0KPiBpbmRleCAxYzQxMTU2ZGViNWYuLjBlMmQ2MGVhOTNjYSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9NYWtl
ZmlsZQ0KPiBAQCAtMzMsNiArMzMsOCBAQCBkcm0tJChDT05GSUdfRFJNX1BSSVZBQ1lfU0NS
RUVOKSArPSBkcm1fcHJpdmFjeV9zY3JlZW4ubyBkcm1fcHJpdmFjeV9zY3JlZW5feDg2Lg0K
PiAgIA0KPiAgIG9iai0kKENPTkZJR19EUk1fRFBfQVVYX0JVUykgKz0gZHJtX2RwX2F1eF9i
dXMubw0KPiAgIA0KPiArb2JqLXkgKz0gZHJtX25vbW9kZXNldC5vDQoNClJlcGVhdGluZyBt
eSBvdGhlciBjb21tZW50LCBzaG91bGQgdGhpcyByYXRoZXIgYmUgcHJvdGVjdGVkIGJ5IGEg
DQpzZXBhcmF0ZSBjb25maWcgc3ltYm9sIHRoYXQgaXMgc2VsZWN0ZWQgYnkgQ09ORklHX0RS
TT8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiArDQo+ICAgZHJtX2NtYV9oZWxwZXIt
eSA6PSBkcm1fZ2VtX2NtYV9oZWxwZXIubw0KPiAgIG9iai0kKENPTkZJR19EUk1fR0VNX0NN
QV9IRUxQRVIpICs9IGRybV9jbWFfaGVscGVyLm8NCj4gICANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPiBpbmRleCBjNzE4ZmI1ZjNmOGEuLjI2ODBh
MmFhYTg3NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYw0KPiBAQCAtMzEsNyArMzEsNiBAQA0KPiAgICNpbmNsdWRlICJhbWRncHVfZHJ2Lmgi
DQo+ICAgDQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcGNpaWRzLmg+DQo+IC0jaW5jbHVkZSA8
bGludXgvY29uc29sZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICAj
aW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC92Z2Ff
c3dpdGNoZXJvby5oPg0KPiBAQCAtMjUxNSw3ICsyNTE0LDcgQEAgc3RhdGljIGludCBfX2lu
aXQgYW1kZ3B1X2luaXQodm9pZCkNCj4gICAJaW50IHI7DQo+ICAgDQo+ICAgCWlmICh2Z2Fj
b25fdGV4dF9mb3JjZSgpKSB7DQo+IC0JCURSTV9FUlJPUigiVkdBQ09OIGRpc2FibGVzIGFt
ZGdwdSBrZXJuZWwgbW9kZXNldHRpbmcuXG4iKTsNCj4gKwkJRFJNX0VSUk9SKCJhbWRncHUg
a2VybmVsIG1vZGVzZXR0aW5nIGRpc2FibGVkLlxuIik7DQo+ICAgCQlyZXR1cm4gLUVJTlZB
TDsNCj4gICAJfQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYw0KPiBpbmRleCA4NmQ1
Y2Q3YjYzMTguLjA0OGJlNjA3YjE4MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMN
Cj4gQEAgLTI2LDcgKzI2LDYgQEANCj4gICAgKiBBdXRob3JzOiBEYXZlIEFpcmxpZSA8YWly
bGllZEByZWRoYXQuY29tPg0KPiAgICAqLw0KPiAgIA0KPiAtI2luY2x1ZGUgPGxpbnV4L2Nv
bnNvbGUuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICAgI2luY2x1ZGUg
PGxpbnV4L3BjaS5oPg0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9ub21vZGVzZXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbm9tb2Rlc2V0LmMNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi4xYWM5YThkNWE4ZmUN
Cj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX25vbW9kZXNl
dC5jDQo+IEBAIC0wLDAgKzEsMjYgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wDQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gKyNpbmNs
dWRlIDxsaW51eC90eXBlcy5oPg0KPiArDQo+ICtzdGF0aWMgYm9vbCB2Z2Fjb25fdGV4dF9t
b2RlX2ZvcmNlOw0KPiArDQo+ICtib29sIHZnYWNvbl90ZXh0X2ZvcmNlKHZvaWQpDQo+ICt7
DQo+ICsJcmV0dXJuIHZnYWNvbl90ZXh0X21vZGVfZm9yY2U7DQo+ICt9DQo+ICtFWFBPUlRf
U1lNQk9MKHZnYWNvbl90ZXh0X2ZvcmNlKTsNCj4gKw0KPiArc3RhdGljIGludCBfX2luaXQg
dGV4dF9tb2RlKGNoYXIgKnN0cikNCj4gK3sNCj4gKwl2Z2Fjb25fdGV4dF9tb2RlX2ZvcmNl
ID0gdHJ1ZTsNCj4gKw0KPiArCXByX3dhcm4oIllvdSBoYXZlIGJvb3RlZCB3aXRoIG5vbW9k
ZXNldC4gVGhpcyBtZWFucyB5b3VyIEdQVSBkcml2ZXJzIGFyZSBESVNBQkxFRFxuIik7DQo+
ICsJcHJfd2FybigiQW55IHZpZGVvIHJlbGF0ZWQgZnVuY3Rpb25hbGl0eSB3aWxsIGJlIHNl
dmVyZWx5IGRlZ3JhZGVkLCBhbmQgeW91IG1heSBub3QgZXZlbiBiZSBhYmxlIHRvIHN1c3Bl
bmQgdGhlIHN5c3RlbSBwcm9wZXJseVxuIik7DQo+ICsJcHJfd2FybigiVW5sZXNzIHlvdSBh
Y3R1YWxseSB1bmRlcnN0YW5kIHdoYXQgbm9tb2Rlc2V0IGRvZXMsIHlvdSBzaG91bGQgcmVi
b290IHdpdGhvdXQgZW5hYmxpbmcgaXRcbiIpOw0KPiArDQo+ICsJcmV0dXJuIDE7DQo+ICt9
DQo+ICsNCj4gKy8qIGZvcmNlIHRleHQgbW9kZSAtIHVzZWQgYnkga2VybmVsIG1vZGVzZXR0
aW5nICovDQo+ICtfX3NldHVwKCJub21vZGVzZXQiLCB0ZXh0X21vZGUpOw0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9tb2R1bGUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfbW9kdWxlLmMNCj4gaW5kZXggYzc1MDcyNjZhYTgzLi4xNGE1OTIy
NjUxOWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfbW9kdWxl
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9tb2R1bGUuYw0KPiBAQCAt
NCw4ICs0LDYgQEANCj4gICAgKiBDb3B5cmlnaHQgwqkgMjAyMSBJbnRlbCBDb3Jwb3JhdGlv
bg0KPiAgICAqLw0KPiAgIA0KPiAtI2luY2x1ZGUgPGxpbnV4L2NvbnNvbGUuaD4NCj4gLQ0K
PiAgICNpbmNsdWRlICJnZW0vaTkxNV9nZW1fY29udGV4dC5oIg0KPiAgICNpbmNsdWRlICJn
ZW0vaTkxNV9nZW1fb2JqZWN0LmgiDQo+ICAgI2luY2x1ZGUgImk5MTVfYWN0aXZlLmgiDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYw0KPiBpbmRleCA2YjkyNDM3
MTNiM2MuLjY4NWU3NjZkYjZhNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9t
Z2FnMjAwX2Rydi5jDQo+IEBAIC02LDcgKzYsNiBAQA0KPiAgICAqICAgICAgICAgIERhdmUg
QWlybGllDQo+ICAgICovDQo+ICAgDQo+IC0jaW5jbHVkZSA8bGludXgvY29uc29sZS5oPg0K
PiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvcGNp
Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2RybS5jDQo+IGluZGV4IDFmODI4YzlmNjkxYy4uMDI5OTk3ZjUw
ZDFhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Ry
bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMNCj4g
QEAgLTIyLDcgKzIyLDYgQEANCj4gICAgKiBBdXRob3JzOiBCZW4gU2tlZ2dzDQo+ICAgICov
DQo+ICAgDQo+IC0jaW5jbHVkZSA8bGludXgvY29uc29sZS5oPg0KPiAgICNpbmNsdWRlIDxs
aW51eC9kZWxheS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICAjaW5j
bHVkZSA8bGludXgvcGNpLmg+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jDQo+IGluZGV4IGZj
NDdiMGRlYjAyMS4uM2NkNmJkOWYwNTlkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcXhsL3F4bF9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYu
Yw0KPiBAQCAtMjksNyArMjksNiBAQA0KPiAgIA0KPiAgICNpbmNsdWRlICJxeGxfZHJ2Lmgi
DQo+ICAgDQo+IC0jaW5jbHVkZSA8bGludXgvY29uc29sZS5oPg0KPiAgICNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvcGNpLmg+DQo+ICAgI2luY2x1
ZGUgPGxpbnV4L3ZnYWFyYi5oPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYu
Yw0KPiBpbmRleCBiNzRjZWJjYTFmODkuLjliNjA2YzFiMTFlYyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMNCj4gQEAgLTMxLDcgKzMxLDYgQEANCj4gICAN
Cj4gICANCj4gICAjaW5jbHVkZSA8bGludXgvY29tcGF0Lmg+DQo+IC0jaW5jbHVkZSA8bGlu
dXgvY29uc29sZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICAjaW5j
bHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC92Z2Ffc3dp
dGNoZXJvby5oPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9jaHMu
YyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L2JvY2hzLmMNCj4gaW5kZXggMmNlM2JkOTAzYjcw
Li4wNDMzM2Y3OGJlNTUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2Jv
Y2hzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9jaHMuYw0KPiBAQCAtMSw2
ICsxLDUgQEANCj4gICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1s
YXRlcg0KPiAgIA0KPiAtI2luY2x1ZGUgPGxpbnV4L2NvbnNvbGUuaD4NCj4gICAjaW5jbHVk
ZSA8bGludXgvcGNpLmg+DQo+ICAgDQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fYXBlcnR1cmUu
aD4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2NpcnJ1cy5jIGIvZHJp
dmVycy9ncHUvZHJtL3RpbnkvY2lycnVzLmMNCj4gaW5kZXggNDYxMWVjNDA4NTA2Li44YmQ2
NzRmMGQ2ODIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2NpcnJ1cy5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L2NpcnJ1cy5jDQo+IEBAIC0xNiw3ICsx
Niw2IEBADQo+ICAgICogQ29weXJpZ2h0IDE5OTktMjAwMSBKZWZmIEdhcnppayA8amdhcnpp
a0Bwb2JveC5jb20+DQo+ICAgICovDQo+ICAgDQo+IC0jaW5jbHVkZSA8bGludXgvY29uc29s
ZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLW1hcC5oPg0KPiAgICNpbmNsdWRl
IDxsaW51eC9tb2R1bGUuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvcGNpLmg+DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMNCj4gaW5kZXggYTZjODFhZjM3MzQ1Li5l
NmQ5ODMxMjFkMGIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8v
dmJveF9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2
LmMNCj4gQEAgLTcsNyArNyw2IEBADQo+ICAgICogICAgICAgICAgTWljaGFlbCBUaGF5ZXIg
PG1pY2hhZWwudGhheWVyQG9yYWNsZS5jb20sDQo+ICAgICogICAgICAgICAgSGFucyBkZSBH
b2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gICAgKi8NCj4gLSNpbmNsdWRlIDxsaW51
eC9jb25zb2xlLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiAgICNpbmNs
dWRlIDxsaW51eC9wY2kuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvdnRfa2Vybi5oPg0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jDQo+IGluZGV4IDc0OWRiMThkY2Zh
Mi4uY2Q0YzE3MDIzNmYxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2Rydi5jDQo+IEBAIC0yNyw3ICsyNyw2IEBADQo+ICAgICovDQo+ICAgDQo+ICAgI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4L2NvbnNvbGUuaD4NCj4g
ICAjaW5jbHVkZSA8bGludXgvcGNpLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3BvbGwuaD4N
Cj4gICAjaW5jbHVkZSA8bGludXgvd2FpdC5oPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9kcnYuYw0KPiBpbmRleCBhYjlhMTc1MGUxZGYuLmZjYzRiNWE3ZjYzOSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gQEAgLTI1LDcgKzI1LDYg
QEANCj4gICAgKg0KPiAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8NCj4gICANCj4gLSNpbmNs
dWRlIDxsaW51eC9jb25zb2xlLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5n
Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51
eC9wY2kuaD4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vY29uc29sZS92Z2Fjb24u
YyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS92Z2Fjb24uYw0KPiBpbmRleCBlZjljNTdjZTA5
MDYuLmQ0MzIwYjE0Nzk1NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9jb25zb2xl
L3ZnYWNvbi5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS92Z2Fjb24uYw0KPiBA
QCAtOTcsMzAgKzk3LDkgQEAgc3RhdGljIGludCAJCXZnYV92aWRlb19mb250X2hlaWdodDsN
Cj4gICBzdGF0aWMgaW50IAkJdmdhX3NjYW5fbGluZXMJCV9fcmVhZF9tb3N0bHk7DQo+ICAg
c3RhdGljIHVuc2lnbmVkIGludCAJdmdhX3JvbGxlZF9vdmVyOyAvKiBsYXN0IHZjX29yaWdp
biBvZmZzZXQgYmVmb3JlIHdyYXAgKi8NCj4gICANCj4gLXN0YXRpYyBib29sIHZnYWNvbl90
ZXh0X21vZGVfZm9yY2U7DQo+ICAgc3RhdGljIGJvb2wgdmdhX2hhcmRzY3JvbGxfZW5hYmxl
ZDsNCj4gICBzdGF0aWMgYm9vbCB2Z2FfaGFyZHNjcm9sbF91c2VyX2VuYWJsZSA9IHRydWU7
DQo+ICAgDQo+IC1ib29sIHZnYWNvbl90ZXh0X2ZvcmNlKHZvaWQpDQo+IC17DQo+IC0JcmV0
dXJuIHZnYWNvbl90ZXh0X21vZGVfZm9yY2U7DQo+IC19DQo+IC1FWFBPUlRfU1lNQk9MKHZn
YWNvbl90ZXh0X2ZvcmNlKTsNCj4gLQ0KPiAtc3RhdGljIGludCBfX2luaXQgdGV4dF9tb2Rl
KGNoYXIgKnN0cikNCj4gLXsNCj4gLQl2Z2Fjb25fdGV4dF9tb2RlX2ZvcmNlID0gdHJ1ZTsN
Cj4gLQ0KPiAtCXByX3dhcm4oIllvdSBoYXZlIGJvb3RlZCB3aXRoIG5vbW9kZXNldC4gVGhp
cyBtZWFucyB5b3VyIEdQVSBkcml2ZXJzIGFyZSBESVNBQkxFRFxuIik7DQo+IC0JcHJfd2Fy
bigiQW55IHZpZGVvIHJlbGF0ZWQgZnVuY3Rpb25hbGl0eSB3aWxsIGJlIHNldmVyZWx5IGRl
Z3JhZGVkLCBhbmQgeW91IG1heSBub3QgZXZlbiBiZSBhYmxlIHRvIHN1c3BlbmQgdGhlIHN5
c3RlbSBwcm9wZXJseVxuIik7DQo+IC0JcHJfd2FybigiVW5sZXNzIHlvdSBhY3R1YWxseSB1
bmRlcnN0YW5kIHdoYXQgbm9tb2Rlc2V0IGRvZXMsIHlvdSBzaG91bGQgcmVib290IHdpdGhv
dXQgZW5hYmxpbmcgaXRcbiIpOw0KPiAtDQo+IC0JcmV0dXJuIDE7DQo+IC19DQo+IC0NCj4g
LS8qIGZvcmNlIHRleHQgbW9kZSAtIHVzZWQgYnkga2VybmVsIG1vZGVzZXR0aW5nICovDQo+
IC1fX3NldHVwKCJub21vZGVzZXQiLCB0ZXh0X21vZGUpOw0KPiAtDQo+ICAgc3RhdGljIGlu
dCBfX2luaXQgbm9fc2Nyb2xsKGNoYXIgKnN0cikNCj4gICB7DQo+ICAgCS8qDQo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCBiL2luY2x1ZGUvZHJtL2Ry
bV9tb2RlX2NvbmZpZy5oDQo+IGluZGV4IDQ4YjdkZTgwZGFmNS4uZTFkMjA0MmE3Yjc3IDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaA0KPiArKysgYi9p
bmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaA0KPiBAQCAtOTY5LDQgKzk2OSwxMCBAQCBz
dGF0aWMgaW5saW5lIGludCBkcm1fbW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2KQ0KPiAgIHZvaWQgZHJtX21vZGVfY29uZmlnX3Jlc2V0KHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYpOw0KPiAgIHZvaWQgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoc3RydWN0IGRy
bV9kZXZpY2UgKmRldik7DQo+ICAgDQo+ICsjaWZkZWYgQ09ORklHX1ZHQV9DT05TT0xFDQo+
ICtleHRlcm4gYm9vbCB2Z2Fjb25fdGV4dF9mb3JjZSh2b2lkKTsNCj4gKyNlbHNlDQo+ICtz
dGF0aWMgaW5saW5lIGJvb2wgdmdhY29uX3RleHRfZm9yY2Uodm9pZCkgeyByZXR1cm4gZmFs
c2U7IH0NCj4gKyNlbmRpZg0KPiArDQo+ICAgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2NvbnNvbGUuaCBiL2luY2x1ZGUvbGludXgvY29uc29sZS5oDQo+IGluZGV4
IDIwODc0ZGI1MGJjOC4uZDRkZDgzODQ4OThiIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L2NvbnNvbGUuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2NvbnNvbGUuaA0KPiBAQCAt
MjE3LDEyICsyMTcsNiBAQCBleHRlcm4gYXRvbWljX3QgaWdub3JlX2NvbnNvbGVfbG9ja193
YXJuaW5nOw0KPiAgICNkZWZpbmUgVkVTQV9IU1lOQ19TVVNQRU5EICAgICAgMg0KPiAgICNk
ZWZpbmUgVkVTQV9QT1dFUkRPV04gICAgICAgICAgMw0KPiAgIA0KPiAtI2lmZGVmIENPTkZJ
R19WR0FfQ09OU09MRQ0KPiAtZXh0ZXJuIGJvb2wgdmdhY29uX3RleHRfZm9yY2Uodm9pZCk7
DQo+IC0jZWxzZQ0KPiAtc3RhdGljIGlubGluZSBib29sIHZnYWNvbl90ZXh0X2ZvcmNlKHZv
aWQpIHsgcmV0dXJuIGZhbHNlOyB9DQo+IC0jZW5kaWYNCj4gLQ0KPiAgIGV4dGVybiB2b2lk
IGNvbnNvbGVfaW5pdCh2b2lkKTsNCj4gICANCj4gICAvKiBGb3IgZGVmZXJyZWQgY29uc29s
ZSB0YWtlb3ZlciAqLw0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------mjKOQKKz346E0GBb5eGIho0V--

--------------LZZKu0R06YlOgIKNWDXaw2Ec
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGCg2cFAwAAAAAACgkQlh/E3EQov+C2
EA//fM/vJsGELDdVcUKftuIo/Y0XZ6Bajf7QA8plPLlN5+6BJuQRR4jML+uyKXhP59J0UdVqkr02
Te1Waf0jg2qlHBfrKY7bjPjiOum9RLihcPsG6IVM+akVs9t/jOzH18zHokP3atN40wVeKCnc4hUk
oW1tnfiTVHahvwyaXaFLkYxSuoX1Law32fEELcMmVpiWQc2+OsF+Dki1MHGQwZrz2LheMTxdFLdB
CMfk4D3/AlQMejkM6l7eN3oShCL/V+hPWY2N1Md3K2GEDTw8TPAIiuBb3cgxbAne4B7LrOBts1r2
7+7OWB7FJt56JvIh38+L6h3pZo6W6lt/zw4+t2qcGsMeuBMCIJWZscVeSXbMECN0kFC+v+dfc6dT
0Dv8unWpbnL0aMapIrd9jhdPbNw21qG6kESKBckNskCZF3WPU++SYKHzq8+a+YCanFjzdruzUO4I
vbYEyM+Z6t+7sCQpFG16OuJLR+AC4wQBm9Jc0hnSyMRpEM4E7UssK8mEoLrDa9bDmjWEAwK7qLVy
ddTC+kb/4H6K/165SkFtzxI1rS4rChNOnu2iFGYLyUinrZBR5md9ataJwfCweKpRzfHv4TGvyYlo
v+KElHeRmGGSCF0pZOBoaPR56cVn2ZlxDN9kNk6vvQaF2zzEGsNWmbl4y/9/cOaBjaQXGZgNQqtn
Bv4=
=sR6L
-----END PGP SIGNATURE-----

--------------LZZKu0R06YlOgIKNWDXaw2Ec--
