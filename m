Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9983256D887
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 Jul 2022 10:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbiGKInO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 11 Jul 2022 04:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiGKImo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 11 Jul 2022 04:42:44 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2AC7DE3;
        Mon, 11 Jul 2022 01:42:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 932E01FD7B;
        Mon, 11 Jul 2022 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1657528955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wo/q58ItrTOeQknoOOfwAtuSQqQiy+BSh/ifl9HiKE4=;
        b=VsRo5G1DieqhDSH5htcyswpknanIU+xxRmRkpJSbG51InZxdBovzB4eVlYD/nFsxG649CN
        fshK12X7hlBbuk0HzlTNv8hcz2k2Q5nH/XDGMKAavfanpv6DLae42DoiSnTYdW/sU3gmZx
        m02puhTUqeqqLvbBEFaJKvEjDpd8zjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1657528955;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wo/q58ItrTOeQknoOOfwAtuSQqQiy+BSh/ifl9HiKE4=;
        b=frvq+T9Y5fJgaVVTxTRdiTDlPGWA1d27IkmX3hc0SyWqmGyibrvf834vY0EWwneBFjL5rB
        ZvXZJbHP91rB3rBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58AB213322;
        Mon, 11 Jul 2022 08:42:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id weynFHviy2JJKwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 08:42:35 +0000
Message-ID: <21e514f6-4519-6c16-d93f-e35abca80d2a@suse.de>
Date:   Mon, 11 Jul 2022 10:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 06/10] drm/fb-helper: Add support for DRM_FORMAT_C[124]
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        Javier Martinez Canillas <javierm@redhat.com>
References: <cover.1657294931.git.geert@linux-m68k.org>
 <db3e80b445df661ff0cd7e698507a8d24a4c867e.1657294931.git.geert@linux-m68k.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <db3e80b445df661ff0cd7e698507a8d24a4c867e.1657294931.git.geert@linux-m68k.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Pqnep7KEKvZoHSBHWRM9ZlY3"
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
--------------Pqnep7KEKvZoHSBHWRM9ZlY3
Content-Type: multipart/mixed; boundary="------------Y3WSmdHdW0Kw8vsYDzdU29pv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <21e514f6-4519-6c16-d93f-e35abca80d2a@suse.de>
Subject: Re: [PATCH v3 06/10] drm/fb-helper: Add support for DRM_FORMAT_C[124]
References: <cover.1657294931.git.geert@linux-m68k.org>
 <db3e80b445df661ff0cd7e698507a8d24a4c867e.1657294931.git.geert@linux-m68k.org>
In-Reply-To: <db3e80b445df661ff0cd7e698507a8d24a4c867e.1657294931.git.geert@linux-m68k.org>

--------------Y3WSmdHdW0Kw8vsYDzdU29pv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDcuMjIgdW0gMjA6MjAgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEFkZCBzdXBwb3J0IGZvciBjb2xvci1pbmRleGVkIGZyYW1lIGJ1ZmZlciBmb3JtYXRz
IHdpdGggdHdvLCBmb3VyLCBhbmQNCj4gc2l4dGVlbiBjb2xvcnMgdG8gdGhlIERSTSBmcmFt
ZWJ1ZmZlciBoZWxwZXIgZnVuY3Rpb25zOg0KPiAgICAxLiBBZGQgc3VwcG9ydCBmb3IgMSwg
MiwgYW5kIDQgYml0cyBwZXIgcGl4ZWwgdG8gdGhlIGRhbWFnZSBoZWxwZXIsDQo+ICAgIDIu
IEZvciBjb2xvci1pbmRleGVkIG1vZGVzLCB0aGUgbGVuZ3RoIG9mIHRoZSBjb2xvciBiaXRm
aWVsZHMgbXVzdCBiZQ0KPiAgICAgICBzZXQgdG8gdGhlIGNvbG9yIGRlcHRoLCBlbHNlIHRo
ZSBsb2dvIGNvZGUgbWF5IHBpY2sgYSBsb2dvIHdpdGggdG9vDQo+ICAgICAgIG1hbnkgY29s
b3JzLiAgRHJvcCB0aGUgaW5jb3JyZWN0IERBQyB3aWR0aCBjb21tZW50LCB3aGljaA0KPiAg
ICAgICBvcmlnaW5hdGVzIGZyb20gdGhlIGk5MTUgZHJpdmVyLg0KPiAgICAzLiBBY2NlcHQg
Q1sxMjRdIG1vZGVzIHdoZW4gdmFsaWRhdGluZyBvciBmaWxsaW5nIGluIHN0cnVjdA0KPiAg
ICAgICBmYl92YXJfc2NyZWVuaW5mbywgYW5kIHVzZSB0aGUgY29ycmVjdCBudW1iZXIgb2Yg
Yml0cyBwZXIgcGl4ZWwuDQo+ICAgIDQuIFNldCB0aGUgdmlzdWFsIHRvIEZCX1ZJU1VBTF9Q
U0VVRE9DT0xPUiBmb3IgYWxsIGNvbG9yLWluZGV4ZWQNCj4gICAgICAgbW9kZXMuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsu
b3JnPg0KPiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJt
QHJlZGhhdC5jb20+DQo+IC0tLQ0KPiBJZiAiW1BBVENIXSBkcm0vZmItaGVscGVyOiBSZW1v
dmUgaGVscGVycyB0byBjaGFuZ2UgZnJhbWUgYnVmZmVyDQo+IGNvbmZpZyJbMV0gaXMgYWNj
ZXB0ZWQsIHRoZSBjaGFuZ2VzIHRvIGRybV9mYl9oZWxwZXJfY2hlY2tfdmFyKCkgY2FuDQo+
IGp1c3QgYmUgcmVtb3ZlZC4NCj4gDQo+IHYzOg0KPiAgICAtIEZpeCBGQl9WSVNVQUxfVFJV
RUNPTE9SLA0KPiAgICAtIEFkZCBSZXZpZXdlZC1ieSwNCj4gDQo+IHYyOg0KPiAgICAtIFVz
ZSBkcm1fZm9ybWF0X2luZm9fYnBwKCkgaGVscGVyIGluc3RlYWQgb2YgZGVwcmVjYXRlZCAu
ZGVwdGggZmllbGQNCj4gICAgICBvciBmb3JtYXQtZGVwZW5kZW50IGNhbGN1bGF0aW9ucywN
Cj4gICAgLSBVc2UgbmV3IC5pc19jb2xvcl9pbmRleGVkIGZpZWxkIGluc3RlYWQgb2YgY2hl
Y2tpbmcgYWdhaW5zdCBhIGxpc3QNCj4gICAgICBvZiBmb3JtYXRzLg0KPiANCj4gWzFdIExp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMjA2MjkxMDU2NTguMTM3Mzc3MC0x
LWdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZmJfaGVscGVyLmMgfCAxMDEgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4g
ICAxIGZpbGUgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4gaW5kZXggMTcwNWU4ZDM0NWFiYTUw
YS4uNTA5OGVmYjM3NGZlNjRlZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9mYl9oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
DQo+IEBAIC0zNzYsMTIgKzM3NiwzMSBAQCBzdGF0aWMgdm9pZCBkcm1fZmJfaGVscGVyX2Rh
bWFnZV9ibGl0X3JlYWwoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4gICAJ
CQkJCSAgIHN0cnVjdCBpb3N5c19tYXAgKmRzdCkNCj4gICB7DQo+ICAgCXN0cnVjdCBkcm1f
ZnJhbWVidWZmZXIgKmZiID0gZmJfaGVscGVyLT5mYjsNCj4gLQl1bnNpZ25lZCBpbnQgY3Bw
ID0gZmItPmZvcm1hdC0+Y3BwWzBdOw0KPiAtCXNpemVfdCBvZmZzZXQgPSBjbGlwLT55MSAq
IGZiLT5waXRjaGVzWzBdICsgY2xpcC0+eDEgKiBjcHA7DQo+IC0Jdm9pZCAqc3JjID0gZmJf
aGVscGVyLT5mYmRldi0+c2NyZWVuX2J1ZmZlciArIG9mZnNldDsNCj4gLQlzaXplX3QgbGVu
ID0gKGNsaXAtPngyIC0gY2xpcC0+eDEpICogY3BwOw0KPiArCXNpemVfdCBvZmZzZXQgPSBj
bGlwLT55MSAqIGZiLT5waXRjaGVzWzBdOw0KPiArCXNpemVfdCBsZW4gPSBjbGlwLT54MiAt
IGNsaXAtPngxOw0KDQpkcm1fcmVjdF93aWR0aCgpIHBsZWFzZS4NCg0KPiAgIAl1bnNpZ25l
ZCBpbnQgeTsNCj4gKwl2b2lkICpzcmM7DQo+ICAgDQo+ICsJc3dpdGNoIChkcm1fZm9ybWF0
X2luZm9fYnBwKGZiLT5mb3JtYXQsIDApKSB7DQo+ICsJY2FzZSAxOg0KPiArCQlvZmZzZXQg
Kz0gY2xpcC0+eDEgLyA4Ow0KPiArCQlsZW4gPSBESVZfUk9VTkRfVVAobGVuICsgY2xpcC0+
eDEgJSA4LCA4KTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSAyOg0KPiArCQlvZmZzZXQgKz0g
Y2xpcC0+eDEgLyA0Ow0KPiArCQlsZW4gPSBESVZfUk9VTkRfVVAobGVuICsgY2xpcC0+eDEg
JSA0LCA0KTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSA0Og0KPiArCQlvZmZzZXQgKz0gY2xp
cC0+eDEgLyAyOw0KPiArCQlsZW4gPSBESVZfUk9VTkRfVVAobGVuICsgY2xpcC0+eDEgJSAy
LCAyKTsNCj4gKwkJYnJlYWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJb2Zmc2V0ICs9IGNsaXAt
PngxICogZmItPmZvcm1hdC0+Y3BwWzBdOw0KPiArCQlsZW4gKj0gZmItPmZvcm1hdC0+Y3Bw
WzBdOw0KPiArCQlicmVhazsNCj4gKwl9DQo+ICsNCj4gKwlzcmMgPSBmYl9oZWxwZXItPmZi
ZGV2LT5zY3JlZW5fYnVmZmVyICsgb2Zmc2V0Ow0KPiAgIAlpb3N5c19tYXBfaW5jcihkc3Qs
IG9mZnNldCk7IC8qIGdvIHRvIGZpcnN0IHBpeGVsIHdpdGhpbiBjbGlwIHJlY3QgKi8NCj4g
ICANCj4gICAJZm9yICh5ID0gY2xpcC0+eTE7IHkgPCBjbGlwLT55MjsgeSsrKSB7DQo+IEBA
IC0xMjczLDE5ICsxMjkyLDIzIEBAIHN0YXRpYyBib29sIGRybV9mYl9waXhlbF9mb3JtYXRf
ZXF1YWwoY29uc3Qgc3RydWN0IGZiX3Zhcl9zY3JlZW5pbmZvICp2YXJfMSwNCj4gICB9DQo+
ICAgDQo+ICAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9maWxsX3BpeGVsX2ZtdChzdHJ1
Y3QgZmJfdmFyX3NjcmVlbmluZm8gKnZhciwNCj4gLQkJCQkJIHU4IGRlcHRoKQ0KPiArCQkJ
CQkgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0KQ0KPiAgIHsNCj4gLQlz
d2l0Y2ggKGRlcHRoKSB7DQo+IC0JY2FzZSA4Og0KPiArCXU4IGRlcHRoID0gZm9ybWF0LT5k
ZXB0aDsNCj4gKw0KPiArCWlmIChmb3JtYXQtPmlzX2NvbG9yX2luZGV4ZWQpIHsNCj4gICAJ
CXZhci0+cmVkLm9mZnNldCA9IDA7DQo+ICAgCQl2YXItPmdyZWVuLm9mZnNldCA9IDA7DQo+
ICAgCQl2YXItPmJsdWUub2Zmc2V0ID0gMDsNCj4gLQkJdmFyLT5yZWQubGVuZ3RoID0gODsg
LyogOGJpdCBEQUMgKi8NCj4gLQkJdmFyLT5ncmVlbi5sZW5ndGggPSA4Ow0KPiAtCQl2YXIt
PmJsdWUubGVuZ3RoID0gODsNCj4gKwkJdmFyLT5yZWQubGVuZ3RoID0gZGVwdGg7DQo+ICsJ
CXZhci0+Z3JlZW4ubGVuZ3RoID0gZGVwdGg7DQo+ICsJCXZhci0+Ymx1ZS5sZW5ndGggPSBk
ZXB0aDsNCj4gICAJCXZhci0+dHJhbnNwLm9mZnNldCA9IDA7DQo+ICAgCQl2YXItPnRyYW5z
cC5sZW5ndGggPSAwOw0KPiAtCQlicmVhazsNCj4gKwkJcmV0dXJuOw0KPiArCX0NCj4gKw0K
PiArCXN3aXRjaCAoZGVwdGgpIHsNCj4gICAJY2FzZSAxNToNCj4gICAJCXZhci0+cmVkLm9m
ZnNldCA9IDEwOw0KPiAgIAkJdmFyLT5ncmVlbi5vZmZzZXQgPSA1Ow0KPiBAQCAtMTM0MCw3
ICsxMzYzLDkgQEAgaW50IGRybV9mYl9oZWxwZXJfY2hlY2tfdmFyKHN0cnVjdCBmYl92YXJf
c2NyZWVuaW5mbyAqdmFyLA0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9mYl9oZWxwZXIgKmZi
X2hlbHBlciA9IGluZm8tPnBhcjsNCj4gICAJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIg
PSBmYl9oZWxwZXItPmZiOw0KPiArCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmZv
cm1hdCA9IGZiLT5mb3JtYXQ7DQo+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBmYl9o
ZWxwZXItPmRldjsNCj4gKwl1bnNpZ25lZCBpbnQgYnBwOw0KPiAgIA0KPiAgIAlpZiAoaW5f
ZGJnX21hc3RlcigpKQ0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+IEBAIC0xMzUwLDIyICsx
Mzc1LDMzIEBAIGludCBkcm1fZmJfaGVscGVyX2NoZWNrX3ZhcihzdHJ1Y3QgZmJfdmFyX3Nj
cmVlbmluZm8gKnZhciwNCj4gICAJCXZhci0+cGl4Y2xvY2sgPSAwOw0KPiAgIAl9DQo+ICAg
DQo+IC0JaWYgKChkcm1fZm9ybWF0X2luZm9fYmxvY2tfd2lkdGgoZmItPmZvcm1hdCwgMCkg
PiAxKSB8fA0KPiAtCSAgICAoZHJtX2Zvcm1hdF9pbmZvX2Jsb2NrX2hlaWdodChmYi0+Zm9y
bWF0LCAwKSA+IDEpKQ0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwlzd2l0Y2ggKGZvcm1h
dC0+Zm9ybWF0KSB7DQo+ICsJY2FzZSBEUk1fRk9STUFUX0MxOg0KPiArCWNhc2UgRFJNX0ZP
Uk1BVF9DMjoNCj4gKwljYXNlIERSTV9GT1JNQVRfQzQ6DQo+ICsJCS8qIHN1cHBvcnRlZCBm
b3JtYXQgd2l0aCBzdWItYnl0ZSBwaXhlbHMgKi8NCj4gKwkJYnJlYWs7DQo+ICsNCj4gKwlk
ZWZhdWx0Og0KPiArCQlpZiAoKGRybV9mb3JtYXRfaW5mb19ibG9ja193aWR0aChmb3JtYXQs
IDApID4gMSkgfHwNCj4gKwkJICAgIChkcm1fZm9ybWF0X2luZm9fYmxvY2tfaGVpZ2h0KGZv
cm1hdCwgMCkgPiAxKSkNCj4gKwkJCXJldHVybiAtRUlOVkFMOw0KPiArCQlicmVhazsNCj4g
Kwl9DQo+ICAgDQo+ICAgCS8qDQo+ICAgCSAqIENoYW5nZXMgc3RydWN0IGZiX3Zhcl9zY3Jl
ZW5pbmZvIGFyZSBjdXJyZW50bHkgbm90IHB1c2hlZCBiYWNrDQo+ICAgCSAqIHRvIEtNUywg
aGVuY2UgZmFpbCBpZiBkaWZmZXJlbnQgc2V0dGluZ3MgYXJlIHJlcXVlc3RlZC4NCj4gICAJ
ICovDQo+IC0JaWYgKHZhci0+Yml0c19wZXJfcGl4ZWwgPiBmYi0+Zm9ybWF0LT5jcHBbMF0g
KiA4IHx8DQo+ICsJYnBwID0gZHJtX2Zvcm1hdF9pbmZvX2JwcChmb3JtYXQsIDApOw0KPiAr
CWlmICh2YXItPmJpdHNfcGVyX3BpeGVsID4gYnBwIHx8DQo+ICAgCSAgICB2YXItPnhyZXMg
PiBmYi0+d2lkdGggfHwgdmFyLT55cmVzID4gZmItPmhlaWdodCB8fA0KPiAgIAkgICAgdmFy
LT54cmVzX3ZpcnR1YWwgPiBmYi0+d2lkdGggfHwgdmFyLT55cmVzX3ZpcnR1YWwgPiBmYi0+
aGVpZ2h0KSB7DQo+ICAgCQlkcm1fZGJnX2ttcyhkZXYsICJmYiByZXF1ZXN0ZWQgd2lkdGgv
aGVpZ2h0L2JwcCBjYW4ndCBmaXQgaW4gY3VycmVudCBmYiAiDQo+ICAgCQkJICAicmVxdWVz
dCAlZHglZC0lZCAodmlydHVhbCAlZHglZCkgPiAlZHglZC0lZFxuIiwNCj4gICAJCQkgIHZh
ci0+eHJlcywgdmFyLT55cmVzLCB2YXItPmJpdHNfcGVyX3BpeGVsLA0KPiAgIAkJCSAgdmFy
LT54cmVzX3ZpcnR1YWwsIHZhci0+eXJlc192aXJ0dWFsLA0KPiAtCQkJICBmYi0+d2lkdGgs
IGZiLT5oZWlnaHQsIGZiLT5mb3JtYXQtPmNwcFswXSAqIDgpOw0KPiArCQkJICBmYi0+d2lk
dGgsIGZiLT5oZWlnaHQsIGJwcCk7DQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICAJfQ0K
PiAgIA0KPiBAQCAtMTM4MCwxMyArMTQxNiwxMyBAQCBpbnQgZHJtX2ZiX2hlbHBlcl9jaGVj
a192YXIoc3RydWN0IGZiX3Zhcl9zY3JlZW5pbmZvICp2YXIsDQo+ICAgCSAgICAhdmFyLT5i
bHVlLmxlbmd0aCAgICAmJiAhdmFyLT50cmFuc3AubGVuZ3RoICAgJiYNCj4gICAJICAgICF2
YXItPnJlZC5tc2JfcmlnaHQgICYmICF2YXItPmdyZWVuLm1zYl9yaWdodCAmJg0KPiAgIAkg
ICAgIXZhci0+Ymx1ZS5tc2JfcmlnaHQgJiYgIXZhci0+dHJhbnNwLm1zYl9yaWdodCkgew0K
PiAtCQlkcm1fZmJfaGVscGVyX2ZpbGxfcGl4ZWxfZm10KHZhciwgZmItPmZvcm1hdC0+ZGVw
dGgpOw0KPiArCQlkcm1fZmJfaGVscGVyX2ZpbGxfcGl4ZWxfZm10KHZhciwgZm9ybWF0KTsN
Cj4gICAJfQ0KPiAgIA0KPiAgIAkvKg0KPiAgIAkgKiBMaWtld2lzZSwgYml0c19wZXJfcGl4
ZWwgc2hvdWxkIGJlIHJvdW5kZWQgdXAgdG8gYSBzdXBwb3J0ZWQgdmFsdWUuDQo+ICAgCSAq
Lw0KPiAtCXZhci0+Yml0c19wZXJfcGl4ZWwgPSBmYi0+Zm9ybWF0LT5jcHBbMF0gKiA4Ow0K
PiArCXZhci0+Yml0c19wZXJfcGl4ZWwgPSBicHA7DQo+ICAgDQo+ICAgCS8qDQo+ICAgCSAq
IGRybSBmYmRldiBlbXVsYXRpb24gZG9lc24ndCBzdXBwb3J0IGNoYW5naW5nIHRoZSBwaXhl
bCBmb3JtYXQgYXQgYWxsLA0KPiBAQCAtMTcyMiwxMSArMTc1OCwxMSBAQCBzdGF0aWMgaW50
IGRybV9mYl9oZWxwZXJfc2luZ2xlX2ZiX3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpm
Yl9oZWxwZXIsDQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJf
ZmlsbF9maXgoc3RydWN0IGZiX2luZm8gKmluZm8sIHVpbnQzMl90IHBpdGNoLA0KPiAtCQkJ
CSAgIHVpbnQzMl90IGRlcHRoKQ0KPiArCQkJCSAgIGJvb2wgaXNfY29sb3JfaW5kZXhlZCkN
Cj4gICB7DQo+ICAgCWluZm8tPmZpeC50eXBlID0gRkJfVFlQRV9QQUNLRURfUElYRUxTOw0K
PiAtCWluZm8tPmZpeC52aXN1YWwgPSBkZXB0aCA9PSA4ID8gRkJfVklTVUFMX1BTRVVET0NP
TE9SIDoNCj4gLQkJRkJfVklTVUFMX1RSVUVDT0xPUjsNCj4gKwlpbmZvLT5maXgudmlzdWFs
ID0gaXNfY29sb3JfaW5kZXhlZCA/IEZCX1ZJU1VBTF9QU0VVRE9DT0xPUg0KPiArCQkJCQkg
ICAgOiBGQl9WSVNVQUxfVFJVRUNPTE9SOw0KPiAgIAlpbmZvLT5maXgubW1pb19zdGFydCA9
IDA7DQo+ICAgCWluZm8tPmZpeC5tbWlvX2xlbiA9IDA7DQo+ICAgCWluZm8tPmZpeC50eXBl
X2F1eCA9IDA7DQo+IEBAIC0xNzQzLDE5ICsxNzc5LDMxIEBAIHN0YXRpYyB2b2lkIGRybV9m
Yl9oZWxwZXJfZmlsbF92YXIoc3RydWN0IGZiX2luZm8gKmluZm8sDQo+ICAgCQkJCSAgIHVp
bnQzMl90IGZiX3dpZHRoLCB1aW50MzJfdCBmYl9oZWlnaHQpDQo+ICAgew0KPiAgIAlzdHJ1
Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IGZiX2hlbHBlci0+ZmI7DQo+ICsJY29uc3Qgc3Ry
dWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0ID0gZmItPmZvcm1hdDsNCj4gKw0KPiArCXN3
aXRjaCAoZm9ybWF0LT5mb3JtYXQpIHsNCj4gKwljYXNlIERSTV9GT1JNQVRfQzE6DQo+ICsJ
Y2FzZSBEUk1fRk9STUFUX0MyOg0KPiArCWNhc2UgRFJNX0ZPUk1BVF9DNDoNCj4gKwkJLyog
c3VwcG9ydGVkIGZvcm1hdCB3aXRoIHN1Yi1ieXRlIHBpeGVscyAqLw0KPiArCQlicmVhazsN
Cj4gKw0KPiArCWRlZmF1bHQ6DQo+ICsJCVdBUk5fT04oKGRybV9mb3JtYXRfaW5mb19ibG9j
a193aWR0aChmb3JtYXQsIDApID4gMSkgfHwNCj4gKwkJCShkcm1fZm9ybWF0X2luZm9fYmxv
Y2tfaGVpZ2h0KGZvcm1hdCwgMCkgPiAxKSk7DQo+ICsJCWJyZWFrOw0KPiArCX0NCj4gICAN
Cj4gLQlXQVJOX09OKChkcm1fZm9ybWF0X2luZm9fYmxvY2tfd2lkdGgoZmItPmZvcm1hdCwg
MCkgPiAxKSB8fA0KPiAtCQkoZHJtX2Zvcm1hdF9pbmZvX2Jsb2NrX2hlaWdodChmYi0+Zm9y
bWF0LCAwKSA+IDEpKTsNCj4gICAJaW5mby0+cHNldWRvX3BhbGV0dGUgPSBmYl9oZWxwZXIt
PnBzZXVkb19wYWxldHRlOw0KPiAgIAlpbmZvLT52YXIueHJlc192aXJ0dWFsID0gZmItPndp
ZHRoOw0KPiAgIAlpbmZvLT52YXIueXJlc192aXJ0dWFsID0gZmItPmhlaWdodDsNCj4gLQlp
bmZvLT52YXIuYml0c19wZXJfcGl4ZWwgPSBmYi0+Zm9ybWF0LT5jcHBbMF0gKiA4Ow0KPiAr
CWluZm8tPnZhci5iaXRzX3Blcl9waXhlbCA9IGRybV9mb3JtYXRfaW5mb19icHAoZm9ybWF0
LCAwKTsNCj4gICAJaW5mby0+dmFyLmFjY2VsX2ZsYWdzID0gRkJfQUNDRUxGX1RFWFQ7DQo+
ICAgCWluZm8tPnZhci54b2Zmc2V0ID0gMDsNCj4gICAJaW5mby0+dmFyLnlvZmZzZXQgPSAw
Ow0KPiAgIAlpbmZvLT52YXIuYWN0aXZhdGUgPSBGQl9BQ1RJVkFURV9OT1c7DQo+ICAgDQo+
IC0JZHJtX2ZiX2hlbHBlcl9maWxsX3BpeGVsX2ZtdCgmaW5mby0+dmFyLCBmYi0+Zm9ybWF0
LT5kZXB0aCk7DQo+ICsJZHJtX2ZiX2hlbHBlcl9maWxsX3BpeGVsX2ZtdCgmaW5mby0+dmFy
LCBmb3JtYXQpOw0KPiAgIA0KPiAgIAlpbmZvLT52YXIueHJlcyA9IGZiX3dpZHRoOw0KPiAg
IAlpbmZvLT52YXIueXJlcyA9IGZiX2hlaWdodDsNCj4gQEAgLTE3ODAsNyArMTgyOCw4IEBA
IHZvaWQgZHJtX2ZiX2hlbHBlcl9maWxsX2luZm8oc3RydWN0IGZiX2luZm8gKmluZm8sDQo+
ICAgew0KPiAgIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IGZiX2hlbHBlci0+ZmI7
DQo+ICAgDQo+IC0JZHJtX2ZiX2hlbHBlcl9maWxsX2ZpeChpbmZvLCBmYi0+cGl0Y2hlc1sw
XSwgZmItPmZvcm1hdC0+ZGVwdGgpOw0KPiArCWRybV9mYl9oZWxwZXJfZmlsbF9maXgoaW5m
bywgZmItPnBpdGNoZXNbMF0sDQo+ICsJCQkgICAgICAgZmItPmZvcm1hdC0+aXNfY29sb3Jf
aW5kZXhlZCk7DQo+ICAgCWRybV9mYl9oZWxwZXJfZmlsbF92YXIoaW5mbywgZmJfaGVscGVy
LA0KPiAgIAkJCSAgICAgICBzaXplcy0+ZmJfd2lkdGgsIHNpemVzLT5mYl9oZWlnaHQpOw0K
PiAgIA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Y3WSmdHdW0Kw8vsYDzdU29pv--

--------------Pqnep7KEKvZoHSBHWRM9ZlY3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLL4noFAwAAAAAACgkQlh/E3EQov+C+
kw/7Bo6lgUAEsX2WBYJOArNrRLNpf9csqFq2PIGE9OMpvn935i4NbFgEWZv3fuChZgFEJdZe9EJn
Zdg26kvS8Z+N8hIK2CqWeH6uo/yRC7/qnAqQtpzWFlJSXSJNdx04kxBsSMyt105TnMjdB5169v1a
pxqAkCm46iUBOmHg6/LcmiyrUk7odejXcMipsedO5qH8xCb98tzJAA65U0lmPu+l1mCE9y1Ibtdp
F6TylOtWr1rbXxhk/k7kCIvtrj0p4/Q/d9H6Bs8KIkl5UzyNApUKlTzUlRQbCR5+ZbRxBdr9vT9v
8/A5nn+JJ8kDRo9K3DmDCnNei7sW4BSY8rbRMBCl0ttLsEVY4gAF8aOb+2CYPjGvQgNyw+W36Oeo
ec5TcEAqTZ7LXWs4nouVyPl/zfZ1z3ky49SJH+YcNRRXlpGchJMpQa2laZh4uy+l+zGEDLtB4kp+
XADMG6acjajq09wftj4tbZCJ89xbQMU192awhHOQHD0j/FSvCBrq9IT07wmOPCWLa45c0NWEkIlT
DKNgi1gsv0eyKioO9beHTRk2N8ZIIoQoPbDDYz2tw3nCjq4DdwWzJWP0m6XylZmNyTdf1Os0oid3
3cX0AvhDkiHPnuI4GQEClupbhQVSvgwzpiiEt4BWEqlb/HlvaxdWzNqRkBc3YHv4SR/TpRPDXYmW
E6g=
=sS7l
-----END PGP SIGNATURE-----

--------------Pqnep7KEKvZoHSBHWRM9ZlY3--
