Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFCB4BA3D4
	for <lists+linux-fbdev@lfdr.de>; Thu, 17 Feb 2022 15:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242249AbiBQO51 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 17 Feb 2022 09:57:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233657AbiBQO50 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 17 Feb 2022 09:57:26 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7721EEEA;
        Thu, 17 Feb 2022 06:57:11 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id CF80D1F383;
        Thu, 17 Feb 2022 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1645109829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wR4P2yIjNrBLuisLEJ3HjHmHE3GuO5+6FZYx0iwYdEs=;
        b=YEs820amV/E/4qe0pR1PE0uempaKkBjfev5LSTgw/uvoPmvrN86PhwyexBMQvnUXs6Nlsc
        5CQyZb0juvkHJ/Z64PmLGnseAz1Hw5QWaDt5MUURUa+Cw8sHdQ0eor7Wlq9u8mRklO0gdj
        E8kmHNJVj1Y1oc6xedrGaVZcuSoa+2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1645109829;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wR4P2yIjNrBLuisLEJ3HjHmHE3GuO5+6FZYx0iwYdEs=;
        b=RrxnB8kc9GIyuFoqnG5fWzK4Tru+JevAAOT0N9wNR2ElH2g3w6niwvKNEp78e975TiA/pZ
        LwLMTFS8KdlqK5BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96F6213C19;
        Thu, 17 Feb 2022 14:57:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id //W6I0ViDmISTQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 17 Feb 2022 14:57:09 +0000
Message-ID: <4fff0c08-adab-c1d5-4a7e-1513cb2bf7ca@suse.de>
Date:   Thu, 17 Feb 2022 15:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/8] drm/fb-helper: Add support for DRM_FORMAT_C[124]
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
        Javier Martinez Canillas <javierm@redhat.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-3-geert@linux-m68k.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220215165226.2738568-3-geert@linux-m68k.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L0W1KBboKEUQsvSh0sZQXKF1"
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
--------------L0W1KBboKEUQsvSh0sZQXKF1
Content-Type: multipart/mixed; boundary="------------7vv3ym69EZwnysfMr4fgm00b";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <4fff0c08-adab-c1d5-4a7e-1513cb2bf7ca@suse.de>
Subject: Re: [PATCH 2/8] drm/fb-helper: Add support for DRM_FORMAT_C[124]
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-3-geert@linux-m68k.org>
In-Reply-To: <20220215165226.2738568-3-geert@linux-m68k.org>

--------------7vv3ym69EZwnysfMr4fgm00b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR2VlcnQNCg0KQW0gMTUuMDIuMjIgdW0gMTc6NTIgc2NocmllYiBHZWVydCBVeXR0ZXJo
b2V2ZW46DQo+IEFkZCBzdXBwb3J0IGZvciBjb2xvci1pbmRleGVkIGZyYW1lIGJ1ZmZlciBm
b3JtYXRzIHdpdGggdHdvLCBmb3VyLCBhbmQNCj4gc2l4dGVlbiBjb2xvcnMgdG8gdGhlIERS
TSBmcmFtZWJ1ZmZlciBoZWxwZXIgZnVuY3Rpb25zOg0KPiAgICAxLiBBZGQgc3VwcG9ydCBm
b3IgZGVwdGhzIDEvMi80IHRvIHRoZSBkYW1hZ2UgaGVscGVyLA0KPiAgICAyLiBGb3IgY29s
b3ItaW5kZXhlZCBtb2RlcywgdGhlIGxlbmd0aCBvZiB0aGUgY29sb3IgYml0ZmllbGRzIG11
c3QgYmUNCj4gICAgICAgc2V0IHRvIHRoZSBjb2xvciBkZXB0aCwgZWxzZSB0aGUgbG9nbyBj
b2RlIG1heSBwaWNrIGEgbG9nbyB3aXRoIHRvbw0KPiAgICAgICBtYW55IGNvbG9ycy4gIERy
b3AgdGhlIGluY29ycmVjdCBEQUMgd2lkdGggY29tbWVudCwgd2hpY2gNCj4gICAgICAgb3Jp
Z2luYXRlcyBmcm9tIHRoZSBpOTE1IGRyaXZlci4NCj4gICAgMy4gQWNjZXB0IENbMTI0XSBt
b2RlcyB3aGVuIHZhbGlkYXRpbmcgb3IgZmlsbGluZyBpbiBzdHJ1Y3QNCj4gICAgICAgZmJf
dmFyX3NjcmVlbmluZm8sIGFuZCAgdXNlIHRoZSBjb3JyZWN0IG51bWJlciBvZiBiaXRzIHBl
ciBwaXhlbC4NCj4gICAgNC4gU2V0IHRoZSB2aXN1YWwgdG8gRkJfVklTVUFMX1BTRVVET0NP
TE9SIGZvciBhbGwgc3VwcG9ydGVkDQo+ICAgICAgIGNvbG9yLWluZGV4ZWQgbW9kZXMuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwg
MTIwICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDkzIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiX2hlbHBlci5jDQo+IGluZGV4IGVkNDNiOTg3ZDMwNmFmY2UuLmE0YWZlZDBkZTE1
NzA4NDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiBAQCAtMzc2LDEy
ICszNzYsMzQgQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9kYW1hZ2VfYmxpdF9yZWFs
KHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIsDQo+ICAgCQkJCQkgICBzdHJ1Y3Qg
aW9zeXNfbWFwICpkc3QpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpm
YiA9IGZiX2hlbHBlci0+ZmI7DQo+IC0JdW5zaWduZWQgaW50IGNwcCA9IGZiLT5mb3JtYXQt
PmNwcFswXTsNCj4gLQlzaXplX3Qgb2Zmc2V0ID0gY2xpcC0+eTEgKiBmYi0+cGl0Y2hlc1sw
XSArIGNsaXAtPngxICogY3BwOw0KPiAtCXZvaWQgKnNyYyA9IGZiX2hlbHBlci0+ZmJkZXYt
PnNjcmVlbl9idWZmZXIgKyBvZmZzZXQ7DQo+IC0Jc2l6ZV90IGxlbiA9IChjbGlwLT54MiAt
IGNsaXAtPngxKSAqIGNwcDsNCj4gKwlzaXplX3Qgb2Zmc2V0ID0gY2xpcC0+eTEgKiBmYi0+
cGl0Y2hlc1swXTsNCj4gKwlzaXplX3QgbGVuID0gY2xpcC0+eDIgLSBjbGlwLT54MTsNCj4g
ICAJdW5zaWduZWQgaW50IHk7DQo+ICsJdm9pZCAqc3JjOw0KPiAgIA0KPiArCXN3aXRjaCAo
ZmItPmZvcm1hdC0+ZGVwdGgpIHsNCg0KVGhlIGRlcHRoIGZpZWxkIGlzIGRlcHJlY2F0ZWQu
IEl0J3MgcHJvYmFibHkgYmV0dGVyIHRvIHVzZSANCmZiLT5mb3JtYXQtPmZvcm1hdCBhbmQg
dGVzdCBhZ2FpbnN0IDRDQyBjb2Rlcy4NCg0KPiArCWNhc2UgMToNCj4gKwkJb2Zmc2V0ICs9
IGNsaXAtPngxIC8gODsNCj4gKwkJbGVuID0gRElWX1JPVU5EX1VQKGxlbiArIGNsaXAtPngx
ICUgOCwgOCk7DQo+ICsJCWJyZWFrOw0KPiArDQoNClN0eWxlOiBubyBlbXB0eSBsaW5lcyBo
ZXJlLg0KDQo+ICsJY2FzZSAyOg0KPiArCQlvZmZzZXQgKz0gY2xpcC0+eDEgLyA0Ow0KPiAr
CQlsZW4gPSBESVZfUk9VTkRfVVAobGVuICsgY2xpcC0+eDEgJSA0LCA0KTsNCj4gKwkJYnJl
YWs7DQo+ICsNCj4gKwljYXNlIDQ6DQo+ICsJCW9mZnNldCArPSBjbGlwLT54MSAvIDI7DQo+
ICsJCWxlbiA9IERJVl9ST1VORF9VUChsZW4gKyBjbGlwLT54MSAlIDIsIDIpOw0KPiArCQli
cmVhazsNCj4gKw0KDQpDYW4gd2UgaGFuZGxlIGNhc2UgQzggbGlrZSBDWzEyNF0/IFNlZW1z
IGNsZWFuZXIgdG8gbWUuDQoNCj4gKwlkZWZhdWx0Og0KPiArCQlvZmZzZXQgKz0gY2xpcC0+
eDEgKiBmYi0+Zm9ybWF0LT5jcHBbMF07DQo+ICsJCWxlbiAqPSBmYi0+Zm9ybWF0LT5jcHBb
MF07DQo+ICsJCWJyZWFrOw0KPiArCX0NCj4gKw0KPiArCXNyYyA9IGZiX2hlbHBlci0+ZmJk
ZXYtPnNjcmVlbl9idWZmZXIgKyBvZmZzZXQ7DQo+ICAgCWlvc3lzX21hcF9pbmNyKGRzdCwg
b2Zmc2V0KTsgLyogZ28gdG8gZmlyc3QgcGl4ZWwgd2l0aGluIGNsaXAgcmVjdCAqLw0KPiAg
IA0KPiAgIAlmb3IgKHkgPSBjbGlwLT55MTsgeSA8IGNsaXAtPnkyOyB5KyspIHsNCj4gQEAg
LTEyMzEsMTkgKzEyNTMsMzAgQEAgc3RhdGljIGJvb2wgZHJtX2ZiX3BpeGVsX2Zvcm1hdF9l
cXVhbChjb25zdCBzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8gKnZhcl8xLA0KPiAgIH0NCj4g
ICANCj4gICBzdGF0aWMgdm9pZCBkcm1fZmJfaGVscGVyX2ZpbGxfcGl4ZWxfZm10KHN0cnVj
dCBmYl92YXJfc2NyZWVuaW5mbyAqdmFyLA0KPiAtCQkJCQkgdTggZGVwdGgpDQo+IC17DQo+
IC0Jc3dpdGNoIChkZXB0aCkgew0KPiAtCWNhc2UgODoNCj4gKwkJCQkJIGNvbnN0IHN0cnVj
dCBkcm1fZm9ybWF0X2luZm8gKmZvcm1hdCkNCj4gK3sNCj4gKwl1OCBkZXB0aCA9IGZvcm1h
dC0+ZGVwdGg7DQo+ICsNCj4gKwlzd2l0Y2ggKGZvcm1hdC0+Zm9ybWF0KSB7DQo+ICsJLy8g
RklYTUUgUGVyaGFwcw0KPiArCS8vICNkZWZpbmUgRFJNX0ZPUk1BVF9DMCBmb3VyY2NfY29k
ZSgnQycsICcwJywgJyAnLCAnICcpDQoNCldoYXQgaXMgQzA/DQoNCj4gKwkvLyBpZiAoKGZv
cm1hdCAmIGZvdXJjY19jb2RlKDB4ZmYsIDB4ZjgsIDB4ZmYsIDB4ZmYpID09IERSTV9GT1JN
QVRfQzApIC4uLg0KPiArCWNhc2UgRFJNX0ZPUk1BVF9DMToNCj4gKwljYXNlIERSTV9GT1JN
QVRfQzI6DQo+ICsJY2FzZSBEUk1fRk9STUFUX0M0Og0KPiArCWNhc2UgRFJNX0ZPUk1BVF9D
ODoNCj4gICAJCXZhci0+cmVkLm9mZnNldCA9IDA7DQo+ICAgCQl2YXItPmdyZWVuLm9mZnNl
dCA9IDA7DQo+ICAgCQl2YXItPmJsdWUub2Zmc2V0ID0gMDsNCj4gLQkJdmFyLT5yZWQubGVu
Z3RoID0gODsgLyogOGJpdCBEQUMgKi8NCj4gLQkJdmFyLT5ncmVlbi5sZW5ndGggPSA4Ow0K
PiAtCQl2YXItPmJsdWUubGVuZ3RoID0gODsNCj4gKwkJdmFyLT5yZWQubGVuZ3RoID0gZGVw
dGg7DQo+ICsJCXZhci0+Z3JlZW4ubGVuZ3RoID0gZGVwdGg7DQo+ICsJCXZhci0+Ymx1ZS5s
ZW5ndGggPSBkZXB0aDsNCj4gICAJCXZhci0+dHJhbnNwLm9mZnNldCA9IDA7DQo+ICAgCQl2
YXItPnRyYW5zcC5sZW5ndGggPSAwOw0KPiAtCQlicmVhazsNCj4gKwkJcmV0dXJuOw0KPiAr
CX0NCj4gKw0KPiArCXN3aXRjaCAoZGVwdGgpIHsNCj4gICAJY2FzZSAxNToNCj4gICAJCXZh
ci0+cmVkLm9mZnNldCA9IDEwOw0KPiAgIAkJdmFyLT5ncmVlbi5vZmZzZXQgPSA1Ow0KPiBA
QCAtMTI5OCw3ICsxMzMxLDkgQEAgaW50IGRybV9mYl9oZWxwZXJfY2hlY2tfdmFyKHN0cnVj
dCBmYl92YXJfc2NyZWVuaW5mbyAqdmFyLA0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9mYl9o
ZWxwZXIgKmZiX2hlbHBlciA9IGluZm8tPnBhcjsNCj4gICAJc3RydWN0IGRybV9mcmFtZWJ1
ZmZlciAqZmIgPSBmYl9oZWxwZXItPmZiOw0KPiArCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0
X2luZm8gKmZvcm1hdCA9IGZiLT5mb3JtYXQ7DQo+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYgPSBmYl9oZWxwZXItPmRldjsNCj4gKwl1bnNpZ25lZCBpbnQgYnBwOw0KPiAgIA0KPiAg
IAlpZiAoaW5fZGJnX21hc3RlcigpKQ0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+IEBAIC0x
MzA4LDIyICsxMzQzLDM0IEBAIGludCBkcm1fZmJfaGVscGVyX2NoZWNrX3ZhcihzdHJ1Y3Qg
ZmJfdmFyX3NjcmVlbmluZm8gKnZhciwNCj4gICAJCXZhci0+cGl4Y2xvY2sgPSAwOw0KPiAg
IAl9DQo+ICAgDQo+IC0JaWYgKChkcm1fZm9ybWF0X2luZm9fYmxvY2tfd2lkdGgoZmItPmZv
cm1hdCwgMCkgPiAxKSB8fA0KPiAtCSAgICAoZHJtX2Zvcm1hdF9pbmZvX2Jsb2NrX2hlaWdo
dChmYi0+Zm9ybWF0LCAwKSA+IDEpKQ0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwlzd2l0
Y2ggKGZvcm1hdC0+Zm9ybWF0KSB7DQo+ICsJY2FzZSBEUk1fRk9STUFUX0MxOg0KPiArCWNh
c2UgRFJNX0ZPUk1BVF9DMjoNCj4gKwljYXNlIERSTV9GT1JNQVRfQzQ6DQo+ICsJCWJwcCA9
IGZvcm1hdC0+ZGVwdGg7DQo+ICsJCWJyZWFrOw0KDQpBZGRlZCBDOCBoZXJlIHdvdWxkIGJl
IG1vcmUgY29uc2lzdGVudC4NCg0KPiArDQo+ICsJZGVmYXVsdDoNCj4gKwkJaWYgKChkcm1f
Zm9ybWF0X2luZm9fYmxvY2tfd2lkdGgoZm9ybWF0LCAwKSA+IDEpIHx8DQo+ICsJCSAgICAo
ZHJtX2Zvcm1hdF9pbmZvX2Jsb2NrX2hlaWdodChmb3JtYXQsIDApID4gMSkpDQo+ICsJCQly
ZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCQlicHAgPSBmb3JtYXQtPmNwcFswXSAqIDg7DQo+
ICsJCWJyZWFrOw0KPiArCX0NCj4gICANCj4gICAJLyoNCj4gICAJICogQ2hhbmdlcyBzdHJ1
Y3QgZmJfdmFyX3NjcmVlbmluZm8gYXJlIGN1cnJlbnRseSBub3QgcHVzaGVkIGJhY2sNCj4g
ICAJICogdG8gS01TLCBoZW5jZSBmYWlsIGlmIGRpZmZlcmVudCBzZXR0aW5ncyBhcmUgcmVx
dWVzdGVkLg0KPiAgIAkgKi8NCj4gLQlpZiAodmFyLT5iaXRzX3Blcl9waXhlbCA+IGZiLT5m
b3JtYXQtPmNwcFswXSAqIDggfHwNCj4gKwlpZiAodmFyLT5iaXRzX3Blcl9waXhlbCA+IGJw
cCB8fA0KPiAgIAkgICAgdmFyLT54cmVzID4gZmItPndpZHRoIHx8IHZhci0+eXJlcyA+IGZi
LT5oZWlnaHQgfHwNCj4gICAJICAgIHZhci0+eHJlc192aXJ0dWFsID4gZmItPndpZHRoIHx8
IHZhci0+eXJlc192aXJ0dWFsID4gZmItPmhlaWdodCkgew0KPiAgIAkJZHJtX2RiZ19rbXMo
ZGV2LCAiZmIgcmVxdWVzdGVkIHdpZHRoL2hlaWdodC9icHAgY2FuJ3QgZml0IGluIGN1cnJl
bnQgZmIgIg0KPiAgIAkJCSAgInJlcXVlc3QgJWR4JWQtJWQgKHZpcnR1YWwgJWR4JWQpID4g
JWR4JWQtJWRcbiIsDQo+ICAgCQkJICB2YXItPnhyZXMsIHZhci0+eXJlcywgdmFyLT5iaXRz
X3Blcl9waXhlbCwNCj4gICAJCQkgIHZhci0+eHJlc192aXJ0dWFsLCB2YXItPnlyZXNfdmly
dHVhbCwNCj4gLQkJCSAgZmItPndpZHRoLCBmYi0+aGVpZ2h0LCBmYi0+Zm9ybWF0LT5jcHBb
MF0gKiA4KTsNCj4gKwkJCSAgZmItPndpZHRoLCBmYi0+aGVpZ2h0LCBicHApOw0KPiAgIAkJ
cmV0dXJuIC1FSU5WQUw7DQo+ICAgCX0NCj4gICANCj4gQEAgLTEzMzgsMTMgKzEzODUsMTMg
QEAgaW50IGRybV9mYl9oZWxwZXJfY2hlY2tfdmFyKHN0cnVjdCBmYl92YXJfc2NyZWVuaW5m
byAqdmFyLA0KPiAgIAkgICAgIXZhci0+Ymx1ZS5sZW5ndGggICAgJiYgIXZhci0+dHJhbnNw
Lmxlbmd0aCAgICYmDQo+ICAgCSAgICAhdmFyLT5yZWQubXNiX3JpZ2h0ICAmJiAhdmFyLT5n
cmVlbi5tc2JfcmlnaHQgJiYNCj4gICAJICAgICF2YXItPmJsdWUubXNiX3JpZ2h0ICYmICF2
YXItPnRyYW5zcC5tc2JfcmlnaHQpIHsNCj4gLQkJZHJtX2ZiX2hlbHBlcl9maWxsX3BpeGVs
X2ZtdCh2YXIsIGZiLT5mb3JtYXQtPmRlcHRoKTsNCj4gKwkJZHJtX2ZiX2hlbHBlcl9maWxs
X3BpeGVsX2ZtdCh2YXIsIGZvcm1hdCk7DQo+ICAgCX0NCj4gICANCj4gICAJLyoNCj4gICAJ
ICogTGlrZXdpc2UsIGJpdHNfcGVyX3BpeGVsIHNob3VsZCBiZSByb3VuZGVkIHVwIHRvIGEg
c3VwcG9ydGVkIHZhbHVlLg0KPiAgIAkgKi8NCj4gLQl2YXItPmJpdHNfcGVyX3BpeGVsID0g
ZmItPmZvcm1hdC0+Y3BwWzBdICogODsNCj4gKwl2YXItPmJpdHNfcGVyX3BpeGVsID0gYnBw
Ow0KPiAgIA0KPiAgIAkvKg0KPiAgIAkgKiBkcm0gZmJkZXYgZW11bGF0aW9uIGRvZXNuJ3Qg
c3VwcG9ydCBjaGFuZ2luZyB0aGUgcGl4ZWwgZm9ybWF0IGF0IGFsbCwNCj4gQEAgLTE2ODAs
MTEgKzE3MjcsMjAgQEAgc3RhdGljIGludCBkcm1fZmJfaGVscGVyX3NpbmdsZV9mYl9wcm9i
ZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLA0KPiAgIH0NCj4gICANCj4gICBz
dGF0aWMgdm9pZCBkcm1fZmJfaGVscGVyX2ZpbGxfZml4KHN0cnVjdCBmYl9pbmZvICppbmZv
LCB1aW50MzJfdCBwaXRjaCwNCj4gLQkJCQkgICB1aW50MzJfdCBkZXB0aCkNCj4gKwkJCQkg
ICB1aW50MzJfdCBmb3JtYXQpDQo+ICAgew0KPiAgIAlpbmZvLT5maXgudHlwZSA9IEZCX1RZ
UEVfUEFDS0VEX1BJWEVMUzsNCj4gLQlpbmZvLT5maXgudmlzdWFsID0gZGVwdGggPT0gOCA/
IEZCX1ZJU1VBTF9QU0VVRE9DT0xPUiA6DQo+IC0JCUZCX1ZJU1VBTF9UUlVFQ09MT1I7DQo+
ICsJc3dpdGNoIChmb3JtYXQpIHsNCj4gKwljYXNlIERSTV9GT1JNQVRfQzE6DQo+ICsJY2Fz
ZSBEUk1fRk9STUFUX0MyOg0KPiArCWNhc2UgRFJNX0ZPUk1BVF9DNDoNCj4gKwljYXNlIERS
TV9GT1JNQVRfQzg6DQo+ICsJCWluZm8tPmZpeC52aXN1YWwgPSBGQl9WSVNVQUxfUFNFVURP
Q09MT1I7DQo+ICsJCWJyZWFrOw0KPiArCWRlZmF1bHQ6DQo+ICsJCWluZm8tPmZpeC52aXN1
YWwgPSBGQl9WSVNVQUxfVFJVRUNPTE9SOw0KPiArCQlicmVhazsNCj4gKwl9DQo+ICAgCWlu
Zm8tPmZpeC5tbWlvX3N0YXJ0ID0gMDsNCj4gICAJaW5mby0+Zml4Lm1taW9fbGVuID0gMDsN
Cj4gICAJaW5mby0+Zml4LnR5cGVfYXV4ID0gMDsNCj4gQEAgLTE3MDEsMTkgKzE3NTcsMjkg
QEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9maWxsX3ZhcihzdHJ1Y3QgZmJfaW5mbyAq
aW5mbywNCj4gICAJCQkJICAgdWludDMyX3QgZmJfd2lkdGgsIHVpbnQzMl90IGZiX2hlaWdo
dCkNCj4gICB7DQo+ICAgCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gZmJfaGVscGVy
LT5mYjsNCj4gKwljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpmb3JtYXQgPSBmYi0+
Zm9ybWF0Ow0KPiAgIA0KPiAtCVdBUk5fT04oKGRybV9mb3JtYXRfaW5mb19ibG9ja193aWR0
aChmYi0+Zm9ybWF0LCAwKSA+IDEpIHx8DQo+IC0JCShkcm1fZm9ybWF0X2luZm9fYmxvY2tf
aGVpZ2h0KGZiLT5mb3JtYXQsIDApID4gMSkpOw0KPiAgIAlpbmZvLT5wc2V1ZG9fcGFsZXR0
ZSA9IGZiX2hlbHBlci0+cHNldWRvX3BhbGV0dGU7DQo+ICAgCWluZm8tPnZhci54cmVzX3Zp
cnR1YWwgPSBmYi0+d2lkdGg7DQo+ICAgCWluZm8tPnZhci55cmVzX3ZpcnR1YWwgPSBmYi0+
aGVpZ2h0Ow0KPiAtCWluZm8tPnZhci5iaXRzX3Blcl9waXhlbCA9IGZiLT5mb3JtYXQtPmNw
cFswXSAqIDg7DQo+ICsJc3dpdGNoIChmb3JtYXQtPmZvcm1hdCkgew0KPiArCWNhc2UgRFJN
X0ZPUk1BVF9DMToNCj4gKwljYXNlIERSTV9GT1JNQVRfQzI6DQo+ICsJY2FzZSBEUk1fRk9S
TUFUX0M0Og0KPiArCQlpbmZvLT52YXIuYml0c19wZXJfcGl4ZWwgPSBmb3JtYXQtPmRlcHRo
Ow0KPiArCQlicmVhazsNCg0KQzguDQoNCg0KVGhlIGZiZGV2IGhlbHBlcnMgbG9vayBjb3Jy
ZWN0IHRvIG1lLiAgSSdtIG5vdCBzbyBzdXJlIGFib3V0IHRoZSB1c2FnZSANCm9mIHRoZSBm
b3JtYXQgaW5mbzsgZXNwZWNpYWxseSB0aGUgZGVwdGggZmllbGQuICBUaGUgZG9jcyBzYXkg
dGhhdCB0aGUgDQpmaWVsZCBpcyBkZXByZWNhdGVkIGFuZCBzaG91bGQgYmUgMC4gTWF5YmUg
ZGVwdGggY2FuIGJlIGhhbmRsZWQgd2l0aGluIA0KZmJkZXY/DQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gKw0KPiArCWRlZmF1bHQ6DQo+ICsJCVdBUk5fT04oKGRybV9mb3JtYXRf
aW5mb19ibG9ja193aWR0aChmb3JtYXQsIDApID4gMSkgfHwNCj4gKwkJCShkcm1fZm9ybWF0
X2luZm9fYmxvY2tfaGVpZ2h0KGZvcm1hdCwgMCkgPiAxKSk7DQo+ICsJCWluZm8tPnZhci5i
aXRzX3Blcl9waXhlbCA9IGZvcm1hdC0+Y3BwWzBdICogODsNCj4gKwl9DQo+ICAgCWluZm8t
PnZhci5hY2NlbF9mbGFncyA9IEZCX0FDQ0VMRl9URVhUOw0KPiAgIAlpbmZvLT52YXIueG9m
ZnNldCA9IDA7DQo+ICAgCWluZm8tPnZhci55b2Zmc2V0ID0gMDsNCj4gICAJaW5mby0+dmFy
LmFjdGl2YXRlID0gRkJfQUNUSVZBVEVfTk9XOw0KPiAgIA0KPiAtCWRybV9mYl9oZWxwZXJf
ZmlsbF9waXhlbF9mbXQoJmluZm8tPnZhciwgZmItPmZvcm1hdC0+ZGVwdGgpOw0KPiArCWRy
bV9mYl9oZWxwZXJfZmlsbF9waXhlbF9mbXQoJmluZm8tPnZhciwgZm9ybWF0KTsNCj4gICAN
Cj4gICAJaW5mby0+dmFyLnhyZXMgPSBmYl93aWR0aDsNCj4gICAJaW5mby0+dmFyLnlyZXMg
PSBmYl9oZWlnaHQ7DQo+IEBAIC0xNzM4LDcgKzE4MDQsNyBAQCB2b2lkIGRybV9mYl9oZWxw
ZXJfZmlsbF9pbmZvKHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPiAgIHsNCj4gICAJc3RydWN0
IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBmYl9oZWxwZXItPmZiOw0KPiAgIA0KPiAtCWRybV9m
Yl9oZWxwZXJfZmlsbF9maXgoaW5mbywgZmItPnBpdGNoZXNbMF0sIGZiLT5mb3JtYXQtPmRl
cHRoKTsNCj4gKwlkcm1fZmJfaGVscGVyX2ZpbGxfZml4KGluZm8sIGZiLT5waXRjaGVzWzBd
LCBmYi0+Zm9ybWF0LT5mb3JtYXQpOw0KPiAgIAlkcm1fZmJfaGVscGVyX2ZpbGxfdmFyKGlu
Zm8sIGZiX2hlbHBlciwNCj4gICAJCQkgICAgICAgc2l6ZXMtPmZiX3dpZHRoLCBzaXplcy0+
ZmJfaGVpZ2h0KTsNCj4gICANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------7vv3ym69EZwnysfMr4fgm00b--

--------------L0W1KBboKEUQsvSh0sZQXKF1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIOYkUFAwAAAAAACgkQlh/E3EQov+Dh
xRAAlt2vLFvie9FGLCEjntUJwsGaprb4j4h/5zxfo6aGFBnMhRQZixsueE384zL6qkTYJNBCqvgr
08xMux8L5wNUwKjzngah3I7mh2FsY6GcuxMWxF5BZJIacDD9Kfq/h5uzPX/epH+t11yLAHzsdP1R
5buXgzk/o4GAXnV55zanE+q1aeXVTAqhQwyIKE9NnH7z1k4lh1IW/D7tA5Xy49zrmxTu8joN9/OM
+61B5p22v+v0eH/g3g1hxunfF3vY3ZbYm+USo0G9Ql5naH2HaD6g7wlqTcP5eHD/SFwae/le/4g4
C+u4hLe0kPk1C2oCFAYFq04n5KXe0ZzdivVbDWa33SL5jZX17XvMxh0hpaYHQLDJAF6g4mZuxrwc
RkOxkP0bwoNPms/jVzmj6Rh4LampL64TQQNsgyYCQmCbU/d2RMekhlJbXwGL7qPK2C66rQLTWis/
ysSjt5Vi04en8Cj2TL3bZAmcdLsLR1mma0R3EWiX9X5hZYOeHmcr6HqNTkJRUMZE+m+Vok1eAkNo
fBjn+MPe1gXamXLl2zJu/hWVnCdtG3yeWCKTpk31sLms41yVgPRQl6oBWRNiNO3RwyRNhGsKKPmI
33BV1sfBaHLdivP7XR7P6XddW8pS0cB5HecMN6BukvKjhndpxxjyz9v4lpoZnwd7nv4RP4iEr6ku
NVY=
=gvqz
-----END PGP SIGNATURE-----

--------------L0W1KBboKEUQsvSh0sZQXKF1--
