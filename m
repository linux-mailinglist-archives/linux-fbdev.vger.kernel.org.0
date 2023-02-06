Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C995468B832
	for <lists+linux-fbdev@lfdr.de>; Mon,  6 Feb 2023 10:07:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjBFJGx (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 6 Feb 2023 04:06:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjBFJGt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 6 Feb 2023 04:06:49 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB921E285;
        Mon,  6 Feb 2023 01:06:28 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A927D20BAB;
        Mon,  6 Feb 2023 09:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1675674386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=o75v98pfKmR0LvegZafGd9TbXNjLWR8JOn3HV5m8E/8=;
        b=e+snpO0pCATc9XJcooIepaVZNy7raIsPDs0vGGFlzuyBOxTulv7tw3RJbBXM+YhWWdLE0L
        bUxJt1MXYDMrnvet474/uB7TQGa+2pq5EL87cNPT98wjYMfP9mttOxIHWCFK4TG2jlxA4J
        EnhwQ5TtQ0k2V5k9jece/xmiPsSZ+CU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1675674386;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=o75v98pfKmR0LvegZafGd9TbXNjLWR8JOn3HV5m8E/8=;
        b=sU8OTN15vxyKtdoWtV0L9Z/KBcPa/lGL6KVQlOD/iJjNnjdzhiqxGTLE4ZfFvoyiiCUxOq
        Dhmp/GXQDOYOPgDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8800E138E8;
        Mon,  6 Feb 2023 09:06:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id EnlhIBLD4GM4LQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 06 Feb 2023 09:06:26 +0000
Message-ID: <d76a8946-e898-2e18-a2b5-04db696040ab@suse.de>
Date:   Mon, 6 Feb 2023 10:05:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] nvidiafb: detect the hardware support before removing
 console.
Content-Language: en-US
To:     Dave Airlie <airlied@gmail.com>, linux-fbdev@vger.kernel.org
Cc:     Dave Airlie <airlied@redhat.com>, Zeno Davatz <zdavatz@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230205210751.3842103-1-airlied@gmail.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230205210751.3842103-1-airlied@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dgPVUGP2NEqfx0RUaGIvtheN"
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dgPVUGP2NEqfx0RUaGIvtheN
Content-Type: multipart/mixed; boundary="------------VUEcQaCCkLFZS1a37FQ6RJTN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, linux-fbdev@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>, Zeno Davatz <zdavatz@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <d76a8946-e898-2e18-a2b5-04db696040ab@suse.de>
Subject: Re: [PATCH] nvidiafb: detect the hardware support before removing
 console.
References: <20230205210751.3842103-1-airlied@gmail.com>
In-Reply-To: <20230205210751.3842103-1-airlied@gmail.com>

--------------VUEcQaCCkLFZS1a37FQ6RJTN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRGF2ZSwNCg0KdGhhbmtzIGEgbG90LiBJIHdhcyBhYmxlIHRvIHJlcHJvZHVjZSB0aGUg
cHJvYmxlbSBhbmQgZ2V0IGl0IGZpeGVkIGJ5IA0KdGhlIHBhdGNoLiBBcyBleHBlY3RlZCwg
dGhlcmUncyBzdGlsbCB0aGUgd2FybmluZyBhYm91dCAndW5rbm93biANCk5WX0FSQ0gnLCBi
dXQgdGhlIGZpcm13YXJlIGRpc3BsYXkgcmVtYWlucyBhY3RpdmUuICBBcHBsaWVzIGNsZWFu
bHkgdG8gDQpkcm0tdGlwIEJUVy4NCg0KQW0gMDUuMDIuMjMgdW0gMjI6MDcgc2NocmllYiBE
YXZlIEFpcmxpZToNCj4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4N
Cj4gDQo+IFRoaXMgZHJpdmVyIHJlbW92ZWQgdGhlIGNvbnNvbGUsIGJ1dCBoYXNuJ3QgeWV0
IGRlY2lkZWQgaWYgaXQgY291bGQNCj4gdGFrZSBvdmVyIHRoZSBjb25zb2xlIHlldC4gSW5z
dGVhZCBvZiBkb2luZyB0aGF0LCBwcm9iZSB0aGUgaHcgZm9yDQo+IHN1cHBvcnQgYW5kIHRo
ZW4gcmVtb3ZlIHRoZSBjb25zb2xlIGFmdGVyd2FyZHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPg0KPiBGaXhlczogaHR0cHM6Ly9i
dWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTY4NTkNCj4gUmVwb3J0ZWQt
Ynk6IFplbm8gRGF2YXR6IDx6ZGF2YXR6QGdtYWlsLmNvbT4NCg0KVGVzdGVkLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NClJldmlld2VkLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCkZpeGVzOiAxNDVlZWQ0OGRl
MjcgKCJmYmRldjogUmVtb3ZlIGNvbmZsaWN0aW5nIGRldmljZXMgb24gUENJIGJ1cyIpDQoN
Cg0KPiAtLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udmlkaWEuYyB8IDgx
ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQy
IGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvbnZpZGlhL252aWRpYS5jIGIvZHJpdmVycy92aWRlby9mYmRl
di9udmlkaWEvbnZpZGlhLmMNCj4gaW5kZXggMTk2MDkxNjA5OGQ0Li5lNjBhMjc2YjQ4NTUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbnZpZGlhL252aWRpYS5jDQo+
ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbnZpZGlhL252aWRpYS5jDQo+IEBAIC0xMTk3
LDE3ICsxMTk3LDE3IEBAIHN0YXRpYyBpbnQgbnZpZGlhX3NldF9mYmluZm8oc3RydWN0IGZi
X2luZm8gKmluZm8pDQo+ICAgCXJldHVybiBudmlkaWFmYl9jaGVja192YXIoJmluZm8tPnZh
ciwgaW5mbyk7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIHUzMiBudmlkaWFfZ2V0X2NoaXBz
ZXQoc3RydWN0IGZiX2luZm8gKmluZm8pDQo+ICtzdGF0aWMgdTMyIG52aWRpYV9nZXRfY2hp
cHNldChzdHJ1Y3QgcGNpX2RldiAqcGNpX2RldiwNCj4gKwkJCSAgICAgIHZvbGF0aWxlIHUz
MiBfX2lvbWVtICpSRUdTKQ0KPiAgIHsNCj4gLQlzdHJ1Y3QgbnZpZGlhX3BhciAqcGFyID0g
aW5mby0+cGFyOw0KPiAtCXUzMiBpZCA9IChwYXItPnBjaV9kZXYtPnZlbmRvciA8PCAxNikg
fCBwYXItPnBjaV9kZXYtPmRldmljZTsNCj4gKwl1MzIgaWQgPSAocGNpX2Rldi0+dmVuZG9y
IDw8IDE2KSB8IHBjaV9kZXYtPmRldmljZTsNCj4gICANCj4gICAJcHJpbnRrKEtFUk5fSU5G
TyBQRlggIkRldmljZSBJRDogJXggXG4iLCBpZCk7DQo+ICAgDQo+ICAgCWlmICgoaWQgJiAw
eGZmZjApID09IDB4MDBmMCB8fA0KPiAgIAkgICAgKGlkICYgMHhmZmYwKSA9PSAweDAyZTAp
IHsNCj4gICAJCS8qIHBjaS1lICovDQo+IC0JCWlkID0gTlZfUkQzMihwYXItPlJFR1MsIDB4
MTgwMCk7DQo+ICsJCWlkID0gTlZfUkQzMihSRUdTLCAweDE4MDApOw0KPiAgIA0KPiAgIAkJ
aWYgKChpZCAmIDB4MDAwMGZmZmYpID09IDB4MDAwMDEwREUpDQo+ICAgCQkJaWQgPSAweDEw
REUwMDAwIHwgKGlkID4+IDE2KTsNCj4gQEAgLTEyMjAsMTIgKzEyMjAsMTEgQEAgc3RhdGlj
IHUzMiBudmlkaWFfZ2V0X2NoaXBzZXQoc3RydWN0IGZiX2luZm8gKmluZm8pDQo+ICAgCXJl
dHVybiBpZDsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgdTMyIG52aWRpYV9nZXRfYXJjaChz
dHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gK3N0YXRpYyB1MzIgbnZpZGlhX2dldF9hcmNoKHUz
MiBDaGlwc2V0KQ0KPiAgIHsNCj4gLQlzdHJ1Y3QgbnZpZGlhX3BhciAqcGFyID0gaW5mby0+
cGFyOw0KPiAgIAl1MzIgYXJjaCA9IDA7DQo+ICAgDQo+IC0Jc3dpdGNoIChwYXItPkNoaXBz
ZXQgJiAweDBmZjApIHsNCj4gKwlzd2l0Y2ggKENoaXBzZXQgJiAweDBmZjApIHsNCj4gICAJ
Y2FzZSAweDAxMDA6CQkvKiBHZUZvcmNlIDI1NiAqLw0KPiAgIAljYXNlIDB4MDExMDoJCS8q
IEdlRm9yY2UyIE1YICovDQo+ICAgCWNhc2UgMHgwMTUwOgkJLyogR2VGb3JjZTIgKi8NCj4g
QEAgLTEyNzgsMTYgKzEyNzcsNDQgQEAgc3RhdGljIGludCBudmlkaWFmYl9wcm9iZShzdHJ1
Y3QgcGNpX2RldiAqcGQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpDQo+ICAg
CXN0cnVjdCBmYl9pbmZvICppbmZvOw0KPiAgIAl1bnNpZ25lZCBzaG9ydCBjbWQ7DQo+ICAg
CWludCByZXQ7DQo+ICsJdm9sYXRpbGUgdTMyIF9faW9tZW0gKlJFR1M7DQo+ICsJaW50IENo
aXBzZXQ7DQo+ICsJdTMyIEFyY2hpdGVjdHVyZTsNCj4gICANCj4gICAJTlZUUkFDRV9FTlRF
UigpOw0KPiAgIAlhc3NlcnQocGQgIT0gTlVMTCk7DQo+ICAgDQo+ICsJaWYgKHBjaV9lbmFi
bGVfZGV2aWNlKHBkKSkgew0KPiArCQlwcmludGsoS0VSTl9FUlIgUEZYICJjYW5ub3QgZW5h
YmxlIFBDSSBkZXZpY2VcbiIpOw0KPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gKwl9DQo+ICsN
Cj4gKwkvKiBlbmFibGUgSU8gYW5kIG1lbSBpZiBub3QgYWxyZWFkeSBkb25lICovDQo+ICsJ
cGNpX3JlYWRfY29uZmlnX3dvcmQocGQsIFBDSV9DT01NQU5ELCAmY21kKTsNCj4gKwljbWQg
fD0gKFBDSV9DT01NQU5EX0lPIHwgUENJX0NPTU1BTkRfTUVNT1JZKTsNCj4gKwlwY2lfd3Jp
dGVfY29uZmlnX3dvcmQocGQsIFBDSV9DT01NQU5ELCBjbWQpOw0KPiArDQo+ICsJbnZpZGlh
ZmJfZml4Lm1taW9fc3RhcnQgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGQsIDApOw0KPiArCW52
aWRpYWZiX2ZpeC5tbWlvX2xlbiA9IHBjaV9yZXNvdXJjZV9sZW4ocGQsIDApOw0KPiArDQo+
ICsJUkVHUyA9IGlvcmVtYXAobnZpZGlhZmJfZml4Lm1taW9fc3RhcnQsIG52aWRpYWZiX2Zp
eC5tbWlvX2xlbik7DQo+ICsJaWYgKCFSRUdTKSB7DQo+ICsJCXByaW50ayhLRVJOX0VSUiBQ
RlggImNhbm5vdCBpb3JlbWFwIE1NSU8gYmFzZVxuIik7DQo+ICsJCXJldHVybiAtRU5PREVW
Ow0KPiArCX0NCj4gKw0KPiArCUNoaXBzZXQgPSBudmlkaWFfZ2V0X2NoaXBzZXQocGQsIFJF
R1MpOw0KPiArCUFyY2hpdGVjdHVyZSA9IG52aWRpYV9nZXRfYXJjaChDaGlwc2V0KTsNCj4g
KwlpZiAoQXJjaGl0ZWN0dXJlID09IDApIHsNCj4gKwkJcHJpbnRrKEtFUk5fRVJSIFBGWCAi
dW5rbm93biBOVl9BUkNIXG4iKTsNCj4gKwkJZ290byBlcnJfb3V0Ow0KPiArCX0NCj4gKw0K
PiAgIAlyZXQgPSBhcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfcGNpX2RldmljZXMocGQs
ICJudmlkaWFmYiIpOw0KPiAgIAlpZiAocmV0KQ0KPiAtCQlyZXR1cm4gcmV0Ow0KPiArCQln
b3RvIGVycl9vdXQ7DQo+ICAgDQo+ICAgCWluZm8gPSBmcmFtZWJ1ZmZlcl9hbGxvYyhzaXpl
b2Yoc3RydWN0IG52aWRpYV9wYXIpLCAmcGQtPmRldik7DQo+IC0NCj4gICAJaWYgKCFpbmZv
KQ0KPiAgIAkJZ290byBlcnJfb3V0Ow0KPiAgIA0KPiBAQCAtMTI5OCwxMSArMTMyNSw2IEBA
IHN0YXRpYyBpbnQgbnZpZGlhZmJfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkLCBjb25zdCBz
dHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQ0KPiAgIAlpZiAoaW5mby0+cGl4bWFwLmFkZHIg
PT0gTlVMTCkNCj4gICAJCWdvdG8gZXJyX291dF9rZnJlZTsNCj4gICANCj4gLQlpZiAocGNp
X2VuYWJsZV9kZXZpY2UocGQpKSB7DQo+IC0JCXByaW50ayhLRVJOX0VSUiBQRlggImNhbm5v
dCBlbmFibGUgUENJIGRldmljZVxuIik7DQo+IC0JCWdvdG8gZXJyX291dF9lbmFibGU7DQo+
IC0JfQ0KPiAtDQo+ICAgCWlmIChwY2lfcmVxdWVzdF9yZWdpb25zKHBkLCAibnZpZGlhZmIi
KSkgew0KPiAgIAkJcHJpbnRrKEtFUk5fRVJSIFBGWCAiY2Fubm90IHJlcXVlc3QgUENJIHJl
Z2lvbnNcbiIpOw0KPiAgIAkJZ290byBlcnJfb3V0X2VuYWJsZTsNCj4gQEAgLTEzMTgsMzQg
KzEzNDAsMTcgQEAgc3RhdGljIGludCBudmlkaWFmYl9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
cGQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpDQo+ICAgCXBhci0+cGFuZWx0
d2VhayA9IHBhbmVsdHdlYWs7DQo+ICAgCXBhci0+cmV2ZXJzZV9pMmMgPSByZXZlcnNlX2ky
YzsNCj4gICANCj4gLQkvKiBlbmFibGUgSU8gYW5kIG1lbSBpZiBub3QgYWxyZWFkeSBkb25l
ICovDQo+IC0JcGNpX3JlYWRfY29uZmlnX3dvcmQocGQsIFBDSV9DT01NQU5ELCAmY21kKTsN
Cj4gLQljbWQgfD0gKFBDSV9DT01NQU5EX0lPIHwgUENJX0NPTU1BTkRfTUVNT1JZKTsNCj4g
LQlwY2lfd3JpdGVfY29uZmlnX3dvcmQocGQsIFBDSV9DT01NQU5ELCBjbWQpOw0KPiAtDQo+
IC0JbnZpZGlhZmJfZml4Lm1taW9fc3RhcnQgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGQsIDAp
Ow0KPiAgIAludmlkaWFmYl9maXguc21lbV9zdGFydCA9IHBjaV9yZXNvdXJjZV9zdGFydChw
ZCwgMSk7DQo+IC0JbnZpZGlhZmJfZml4Lm1taW9fbGVuID0gcGNpX3Jlc291cmNlX2xlbihw
ZCwgMCk7DQo+IC0NCj4gLQlwYXItPlJFR1MgPSBpb3JlbWFwKG52aWRpYWZiX2ZpeC5tbWlv
X3N0YXJ0LCBudmlkaWFmYl9maXgubW1pb19sZW4pOw0KPiAgIA0KPiAtCWlmICghcGFyLT5S
RUdTKSB7DQo+IC0JCXByaW50ayhLRVJOX0VSUiBQRlggImNhbm5vdCBpb3JlbWFwIE1NSU8g
YmFzZVxuIik7DQo+IC0JCWdvdG8gZXJyX291dF9mcmVlX2Jhc2UwOw0KPiAtCX0NCj4gKwlw
YXItPlJFR1MgPSBSRUdTOw0KPiAgIA0KPiAtCXBhci0+Q2hpcHNldCA9IG52aWRpYV9nZXRf
Y2hpcHNldChpbmZvKTsNCj4gLQlwYXItPkFyY2hpdGVjdHVyZSA9IG52aWRpYV9nZXRfYXJj
aChpbmZvKTsNCj4gLQ0KPiAtCWlmIChwYXItPkFyY2hpdGVjdHVyZSA9PSAwKSB7DQo+IC0J
CXByaW50ayhLRVJOX0VSUiBQRlggInVua25vd24gTlZfQVJDSFxuIik7DQo+IC0JCWdvdG8g
ZXJyX291dF9hcmNoOw0KPiAtCX0NCj4gKwlwYXItPkNoaXBzZXQgPSBDaGlwc2V0Ow0KPiAr
CXBhci0+QXJjaGl0ZWN0dXJlID0gQXJjaGl0ZWN0dXJlOw0KPiAgIA0KPiAgIAlzcHJpbnRm
KG52aWRpYWZiX2ZpeC5pZCwgIk5WJXgiLCAocGQtPmRldmljZSAmIDB4MGZmMCkgPj4gNCk7
DQo+ICAgDQo+ICAgCWlmIChOVkNvbW1vblNldHVwKGluZm8pKQ0KPiAtCQlnb3RvIGVycl9v
dXRfYXJjaDsNCj4gKwkJZ290byBlcnJfb3V0X2ZyZWVfYmFzZTA7DQo+ICAgDQo+ICAgCXBh
ci0+RmJBZGRyZXNzID0gbnZpZGlhZmJfZml4LnNtZW1fc3RhcnQ7DQo+ICAgCXBhci0+RmJN
YXBTaXplID0gcGFyLT5SYW1BbW91bnRLQnl0ZXMgKiAxMDI0Ow0KPiBAQCAtMTQwMSw3ICsx
NDA2LDYgQEAgc3RhdGljIGludCBudmlkaWFmYl9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGQs
IGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpDQo+ICAgCQlnb3RvIGVycl9vdXRf
aW91bm1hcF9mYjsNCj4gICAJfQ0KPiAgIA0KPiAtDQo+ICAgCXByaW50ayhLRVJOX0lORk8g
UEZYDQo+ICAgCSAgICAgICAiUENJIG5WaWRpYSAlcyBmcmFtZWJ1ZmZlciAoJWRNQiBAIDB4
JWxYKVxuIiwNCj4gICAJICAgICAgIGluZm8tPmZpeC5pZCwNCj4gQEAgLTE0MTUsMTUgKzE0
MTksMTQgQEAgc3RhdGljIGludCBudmlkaWFmYl9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGQs
IGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpDQo+ICAgZXJyX291dF9mcmVlX2Jh
c2UxOg0KPiAgIAlmYl9kZXN0cm95X21vZGVkYihpbmZvLT5tb25zcGVjcy5tb2RlZGIpOw0K
PiAgIAludmlkaWFfZGVsZXRlX2kyY19idXNzZXMocGFyKTsNCj4gLWVycl9vdXRfYXJjaDoN
Cj4gLQlpb3VubWFwKHBhci0+UkVHUyk7DQo+IC0gZXJyX291dF9mcmVlX2Jhc2UwOg0KPiAr
ZXJyX291dF9mcmVlX2Jhc2UwOg0KPiAgIAlwY2lfcmVsZWFzZV9yZWdpb25zKHBkKTsNCj4g
ICBlcnJfb3V0X2VuYWJsZToNCj4gICAJa2ZyZWUoaW5mby0+cGl4bWFwLmFkZHIpOw0KPiAg
IGVycl9vdXRfa2ZyZWU6DQo+ICAgCWZyYW1lYnVmZmVyX3JlbGVhc2UoaW5mbyk7DQo+ICAg
ZXJyX291dDoNCj4gKwlpb3VubWFwKFJFR1MpOw0KPiAgIAlyZXR1cm4gLUVOT0RFVjsNCj4g
ICB9DQo+ICAgDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------VUEcQaCCkLFZS1a37FQ6RJTN--

--------------dgPVUGP2NEqfx0RUaGIvtheN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPgwuwFAwAAAAAACgkQlh/E3EQov+As
VRAAxDHvhCvR7AProl2HIn59tMHvbqGPG+5dRCPZKxGtJ88JA9SiPRN90+/dRLvyhep33XzI99XN
s6Wnpdcp7piOrgDHZpBIeF1v9n6qfUxlrvUsja4jISXsTLSskBr1NtB0kecP0ijKmOIdm4FyJHM+
zWjIlbhQgypHQFLHrKpuZP7t7uJw15unw53zwS4izlR7NXnlthYbMUQb/Wr8AH6olkPlD2iTvo5Q
JACWt4DDrsJ/34hDlISGxuN8iABXEbfiCBPOTYNF4N+Y26TR6+wWXg6+oiiLciUF3fbEEAGWumT8
uWGku87ch26aXZTF3JcYRmm0noAGmglSA+ww50XoKOhhSZfayAAMw//meQykjykBmi84ZCJALd4Q
pZBf6Tk2I5Y66q/IANV7TxhMOniJbmOudRA6UzQyR9vj1lKFPzZj2t8hL8e+pcWk+cxcDcCRsL+P
nQ+Px3QAnbm/l/wjmShE5uqn3wlMAMsBRFrV5tYfZ4u/79ZNACXe8FQYyAk0SXkSwA9Z2wQ2o/Ns
ODORwhSxPfNJ3bPAmwTizXPsw9WTJBLu6nAjw25tk6UR100caADju4S9cMzNg+dbqVSsqzXXrlyT
e5aMqqhRWb64LmIjbXhqg6qriilGhVUN1b12jEC0SlmNMRhy/o0RcJecCWZE4U+R1xzq/AkSP4HP
qrQ=
=mhS7
-----END PGP SIGNATURE-----

--------------dgPVUGP2NEqfx0RUaGIvtheN--
