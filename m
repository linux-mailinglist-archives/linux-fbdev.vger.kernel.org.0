Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7846902DD
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Feb 2023 10:07:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjBIJHu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Feb 2023 04:07:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjBIJHu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Feb 2023 04:07:50 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8672682;
        Thu,  9 Feb 2023 01:07:48 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 24DFA5C540;
        Thu,  9 Feb 2023 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1675933667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mSKAq6uZWn9NnM5x0EHIP2pRYmgTV4gSEu3VVP02HCA=;
        b=xVvSJTvrvgyvAjPeQhEliuGKUT54adhe7rbrp1YAGRe1Hq6PxOcHDvK/JMJvHTfq/GlxC1
        2/Sh0MXHbPuMPqXiOmS7Z0tpJb4sSxjk0BGB+a6YC4nRVrcoSY5c6o0lflrcXKFpqCCb/3
        cgWfeiEuwFKagyGdjqM8EKLgSNra+d0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1675933667;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mSKAq6uZWn9NnM5x0EHIP2pRYmgTV4gSEu3VVP02HCA=;
        b=QgLL3wRU7zTAsjD62ER+mzdqDMEbGXM5fB+jPnCef7tE3CZsIj2ZsBVNxJn+XLBrZVj0Lo
        EQTIXqwomw3lyqBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EED1C1339E;
        Thu,  9 Feb 2023 09:07:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id cG5XOeK35GPxIgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 09:07:46 +0000
Message-ID: <2ced3174-b70c-02c9-7096-57721640a9f4@suse.de>
Date:   Thu, 9 Feb 2023 10:07:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] nvidiafb: detect the hardware support before removing
 console.
Content-Language: en-US
To:     Zeno Davatz <zdavatz@gmail.com>, David Airlie <airlied@redhat.com>
Cc:     linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
References: <20230205210751.3842103-1-airlied@gmail.com>
 <CAOkhzLWSJsDK9Gm-AzeUw7fCpkjDg7d9GuDWyF-6hDr5UZ4DZg@mail.gmail.com>
 <CAPM=9tyaCUmA2bNP1YA1B=cFZP=nKPhQoWR7UwBD2Nfj8ZTODA@mail.gmail.com>
 <CAOkhzLVLbOEp4QnJynxV3cgiqOV5Rm=+dMgexiRmyDs-bRCTPg@mail.gmail.com>
 <CAPM=9tx0D54oQ6QmjF_NxnBBxbLzhXxi5uH2p6fLWfg2L3xPFw@mail.gmail.com>
 <CAOkhzLUspmZjC0x6nJoHyc9nijqZu7BOWc8vsqHSRbQhVzd=Gw@mail.gmail.com>
 <CAMwc25q9LO0N45DAV6HeONVsWBbOxxYCkSV12Yhr3PVorrr4dg@mail.gmail.com>
 <CAOkhzLXMFwO9hYcwrr9O7xoVs_kprfv4DG8fiNyOsWNLF_VS9g@mail.gmail.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAOkhzLXMFwO9hYcwrr9O7xoVs_kprfv4DG8fiNyOsWNLF_VS9g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3oQ3G2YaCa9gbEYp8RCv2hJg"
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3oQ3G2YaCa9gbEYp8RCv2hJg
Content-Type: multipart/mixed; boundary="------------Qyy0pI3O3Ey3GkpcPDZw49W3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zeno Davatz <zdavatz@gmail.com>, David Airlie <airlied@redhat.com>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bjorn@helgaas.com>
Message-ID: <2ced3174-b70c-02c9-7096-57721640a9f4@suse.de>
Subject: Re: [PATCH] nvidiafb: detect the hardware support before removing
 console.
References: <20230205210751.3842103-1-airlied@gmail.com>
 <CAOkhzLWSJsDK9Gm-AzeUw7fCpkjDg7d9GuDWyF-6hDr5UZ4DZg@mail.gmail.com>
 <CAPM=9tyaCUmA2bNP1YA1B=cFZP=nKPhQoWR7UwBD2Nfj8ZTODA@mail.gmail.com>
 <CAOkhzLVLbOEp4QnJynxV3cgiqOV5Rm=+dMgexiRmyDs-bRCTPg@mail.gmail.com>
 <CAPM=9tx0D54oQ6QmjF_NxnBBxbLzhXxi5uH2p6fLWfg2L3xPFw@mail.gmail.com>
 <CAOkhzLUspmZjC0x6nJoHyc9nijqZu7BOWc8vsqHSRbQhVzd=Gw@mail.gmail.com>
 <CAMwc25q9LO0N45DAV6HeONVsWBbOxxYCkSV12Yhr3PVorrr4dg@mail.gmail.com>
 <CAOkhzLXMFwO9hYcwrr9O7xoVs_kprfv4DG8fiNyOsWNLF_VS9g@mail.gmail.com>
In-Reply-To: <CAOkhzLXMFwO9hYcwrr9O7xoVs_kprfv4DG8fiNyOsWNLF_VS9g@mail.gmail.com>

--------------Qyy0pI3O3Ey3GkpcPDZw49W3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDIuMjMgdW0gMDk6NTQgc2NocmllYiBaZW5vIERhdmF0ejoNCj4gRGVh
ciBEYXZlDQo+IA0KPiBPbiBNb24sIEZlYiA2LCAyMDIzIGF0IDk6NDAgQU0gRGF2aWQgQWly
bGllIDxhaXJsaWVkQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIE1vbiwgRmViIDYs
IDIwMjMgYXQgNjozOCBQTSBaZW5vIERhdmF0eiA8emRhdmF0ekBnbWFpbC5jb20+IHdyb3Rl
Og0KPj4+DQo+Pj4gRGVhciBEYXZlDQo+Pj4NCj4+PiBPbiBNb24sIEZlYiA2LCAyMDIzIGF0
IDk6MTAgQU0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToNCj4+Pj4N
Cj4+Pj4gT24gTW9uLCA2IEZlYiAyMDIzIGF0IDE4OjAxLCBaZW5vIERhdmF0eiA8emRhdmF0
ekBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4NCj4+Pj4+IERlYXIgRGF2ZQ0KPj4+Pj4NCj4+
Pj4+IE9uIE1vbiwgRmViIDYsIDIwMjMgYXQgODo1NCBBTSBEYXZlIEFpcmxpZSA8YWlybGll
ZEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4+DQo+Pj4+Pj4gT24gTW9uLCA2IEZlYiAyMDIz
IGF0IDE3OjUyLCBaZW5vIERhdmF0eiA8emRhdmF0ekBnbWFpbC5jb20+IHdyb3RlOg0KPj4+
Pj4+Pg0KPj4+Pj4+PiBEZWFyIERhdmUNCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhhbmsgeW91IGZv
ciB5b3VyIHBhdGNoLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBPbiBTdW4sIEZlYiA1LCAyMDIzIGF0
IDEwOjA3IFBNIERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4N
Cj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBUaGlzIGRyaXZlciByZW1vdmVkIHRoZSBjb25zb2xlLCBi
dXQgaGFzbid0IHlldCBkZWNpZGVkIGlmIGl0IGNvdWxkDQo+Pj4+Pj4+PiB0YWtlIG92ZXIg
dGhlIGNvbnNvbGUgeWV0LiBJbnN0ZWFkIG9mIGRvaW5nIHRoYXQsIHByb2JlIHRoZSBodyBm
b3INCj4+Pj4+Pj4+IHN1cHBvcnQgYW5kIHRoZW4gcmVtb3ZlIHRoZSBjb25zb2xlIGFmdGVy
d2FyZHMuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4NCj4+Pj4+Pj4+IEZpeGVzOiBodHRwczovL2J1Z3ppbGxh
Lmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNjg1OQ0KPj4+Pj4+Pj4gUmVwb3J0ZWQt
Ynk6IFplbm8gRGF2YXR6IDx6ZGF2YXR6QGdtYWlsLmNvbT4NCj4+Pj4+Pj4+IC0tLQ0KPj4+
Pj4+Pj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udmlkaWEuYyB8IDgxICsrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tDQo+Pj4+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0
MiBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZpZGlhLmMgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udmlkaWEuYw0KPj4+Pj4+Pj4gaW5kZXggMTk2MDkx
NjA5OGQ0Li5lNjBhMjc2YjQ4NTUgMTAwNjQ0DQo+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L252aWRpYS9udmlkaWEuYw0KPj4+Pj4+Pj4gKysrIGIvZHJpdmVycy92aWRl
by9mYmRldi9udmlkaWEvbnZpZGlhLmMNCj4+Pj4+Pj4+IEBAIC0xMTk3LDE3ICsxMTk3LDE3
IEBAIHN0YXRpYyBpbnQgbnZpZGlhX3NldF9mYmluZm8oc3RydWN0IGZiX2luZm8gKmluZm8p
DQo+Pj4+Pj4+PiAgICAgICAgICByZXR1cm4gbnZpZGlhZmJfY2hlY2tfdmFyKCZpbmZvLT52
YXIsIGluZm8pOw0KPj4+Pj4+Pj4gICB9DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gLXN0YXRpYyB1
MzIgbnZpZGlhX2dldF9jaGlwc2V0KHN0cnVjdCBmYl9pbmZvICppbmZvKQ0KPj4+Pj4+Pj4g
K3N0YXRpYyB1MzIgbnZpZGlhX2dldF9jaGlwc2V0KHN0cnVjdCBwY2lfZGV2ICpwY2lfZGV2
LA0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9sYXRpbGUgdTMy
IF9faW9tZW0gKlJFR1MpDQo+Pj4+Pj4+PiAgIHsNCj4+Pj4+Pj4+IC0gICAgICAgc3RydWN0
IG52aWRpYV9wYXIgKnBhciA9IGluZm8tPnBhcjsNCj4+Pj4+Pj4+IC0gICAgICAgdTMyIGlk
ID0gKHBhci0+cGNpX2Rldi0+dmVuZG9yIDw8IDE2KSB8IHBhci0+cGNpX2Rldi0+ZGV2aWNl
Ow0KPj4+Pj4+Pj4gKyAgICAgICB1MzIgaWQgPSAocGNpX2Rldi0+dmVuZG9yIDw8IDE2KSB8
IHBjaV9kZXYtPmRldmljZTsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAgICAgICAgICBwcmludGso
S0VSTl9JTkZPIFBGWCAiRGV2aWNlIElEOiAleCBcbiIsIGlkKTsNCj4+Pj4+Pj4+DQo+Pj4+
Pj4+PiAgICAgICAgICBpZiAoKGlkICYgMHhmZmYwKSA9PSAweDAwZjAgfHwNCj4+Pj4+Pj4+
ICAgICAgICAgICAgICAoaWQgJiAweGZmZjApID09IDB4MDJlMCkgew0KPj4+Pj4+Pj4gICAg
ICAgICAgICAgICAgICAvKiBwY2ktZSAqLw0KPj4+Pj4+Pj4gLSAgICAgICAgICAgICAgIGlk
ID0gTlZfUkQzMihwYXItPlJFR1MsIDB4MTgwMCk7DQo+Pj4+Pj4+PiArICAgICAgICAgICAg
ICAgaWQgPSBOVl9SRDMyKFJFR1MsIDB4MTgwMCk7DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gICAg
ICAgICAgICAgICAgICBpZiAoKGlkICYgMHgwMDAwZmZmZikgPT0gMHgwMDAwMTBERSkNCj4+
Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBpZCA9IDB4MTBERTAwMDAgfCAoaWQg
Pj4gMTYpOw0KPj4+Pj4+Pj4gQEAgLTEyMjAsMTIgKzEyMjAsMTEgQEAgc3RhdGljIHUzMiBu
dmlkaWFfZ2V0X2NoaXBzZXQoc3RydWN0IGZiX2luZm8gKmluZm8pDQo+Pj4+Pj4+PiAgICAg
ICAgICByZXR1cm4gaWQ7DQo+Pj4+Pj4+PiAgIH0NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAtc3Rh
dGljIHUzMiBudmlkaWFfZ2V0X2FyY2goc3RydWN0IGZiX2luZm8gKmluZm8pDQo+Pj4+Pj4+
PiArc3RhdGljIHUzMiBudmlkaWFfZ2V0X2FyY2godTMyIENoaXBzZXQpDQo+Pj4+Pj4+PiAg
IHsNCj4+Pj4+Pj4+IC0gICAgICAgc3RydWN0IG52aWRpYV9wYXIgKnBhciA9IGluZm8tPnBh
cjsNCj4+Pj4+Pj4+ICAgICAgICAgIHUzMiBhcmNoID0gMDsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+
PiAtICAgICAgIHN3aXRjaCAocGFyLT5DaGlwc2V0ICYgMHgwZmYwKSB7DQo+Pj4+Pj4+PiAr
ICAgICAgIHN3aXRjaCAoQ2hpcHNldCAmIDB4MGZmMCkgew0KPj4+Pj4+Pj4gICAgICAgICAg
Y2FzZSAweDAxMDA6ICAgICAgICAgICAgLyogR2VGb3JjZSAyNTYgKi8NCj4+Pj4+Pj4+ICAg
ICAgICAgIGNhc2UgMHgwMTEwOiAgICAgICAgICAgIC8qIEdlRm9yY2UyIE1YICovDQo+Pj4+
Pj4+PiAgICAgICAgICBjYXNlIDB4MDE1MDogICAgICAgICAgICAvKiBHZUZvcmNlMiAqLw0K
Pj4+Pj4+Pj4gQEAgLTEyNzgsMTYgKzEyNzcsNDQgQEAgc3RhdGljIGludCBudmlkaWFmYl9w
cm9iZShzdHJ1Y3QgcGNpX2RldiAqcGQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICpl
bnQpDQo+Pj4+Pj4+PiAgICAgICAgICBzdHJ1Y3QgZmJfaW5mbyAqaW5mbzsNCj4+Pj4+Pj4+
ICAgICAgICAgIHVuc2lnbmVkIHNob3J0IGNtZDsNCj4+Pj4+Pj4+ICAgICAgICAgIGludCBy
ZXQ7DQo+Pj4+Pj4+PiArICAgICAgIHZvbGF0aWxlIHUzMiBfX2lvbWVtICpSRUdTOw0KPj4+
Pj4+Pj4gKyAgICAgICBpbnQgQ2hpcHNldDsNCj4+Pj4+Pj4+ICsgICAgICAgdTMyIEFyY2hp
dGVjdHVyZTsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAgICAgICAgICBOVlRSQUNFX0VOVEVSKCk7
DQo+Pj4+Pj4+PiAgICAgICAgICBhc3NlcnQocGQgIT0gTlVMTCk7DQo+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4gKyAgICAgICBpZiAocGNpX2VuYWJsZV9kZXZpY2UocGQpKSB7DQo+Pj4+Pj4+PiAr
ICAgICAgICAgICAgICAgcHJpbnRrKEtFUk5fRVJSIFBGWCAiY2Fubm90IGVuYWJsZSBQQ0kg
ZGV2aWNlXG4iKTsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsN
Cj4+Pj4+Pj4+ICsgICAgICAgfQ0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICAgICAvKiBl
bmFibGUgSU8gYW5kIG1lbSBpZiBub3QgYWxyZWFkeSBkb25lICovDQo+Pj4+Pj4+PiArICAg
ICAgIHBjaV9yZWFkX2NvbmZpZ193b3JkKHBkLCBQQ0lfQ09NTUFORCwgJmNtZCk7DQo+Pj4+
Pj4+PiArICAgICAgIGNtZCB8PSAoUENJX0NPTU1BTkRfSU8gfCBQQ0lfQ09NTUFORF9NRU1P
UlkpOw0KPj4+Pj4+Pj4gKyAgICAgICBwY2lfd3JpdGVfY29uZmlnX3dvcmQocGQsIFBDSV9D
T01NQU5ELCBjbWQpOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICAgICBudmlkaWFmYl9m
aXgubW1pb19zdGFydCA9IHBjaV9yZXNvdXJjZV9zdGFydChwZCwgMCk7DQo+Pj4+Pj4+PiAr
ICAgICAgIG52aWRpYWZiX2ZpeC5tbWlvX2xlbiA9IHBjaV9yZXNvdXJjZV9sZW4ocGQsIDAp
Ow0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICAgICBSRUdTID0gaW9yZW1hcChudmlkaWFm
Yl9maXgubW1pb19zdGFydCwgbnZpZGlhZmJfZml4Lm1taW9fbGVuKTsNCj4+Pj4+Pj4+ICsg
ICAgICAgaWYgKCFSRUdTKSB7DQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgcHJpbnRrKEtF
Uk5fRVJSIFBGWCAiY2Fubm90IGlvcmVtYXAgTU1JTyBiYXNlXG4iKTsNCj4+Pj4+Pj4+ICsg
ICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4+Pj4+Pj4+ICsgICAgICAgfQ0KPj4+
Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICAgICBDaGlwc2V0ID0gbnZpZGlhX2dldF9jaGlwc2V0
KHBkLCBSRUdTKTsNCj4+Pj4+Pj4+ICsgICAgICAgQXJjaGl0ZWN0dXJlID0gbnZpZGlhX2dl
dF9hcmNoKENoaXBzZXQpOw0KPj4+Pj4+Pj4gKyAgICAgICBpZiAoQXJjaGl0ZWN0dXJlID09
IDApIHsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICBwcmludGsoS0VSTl9FUlIgUEZYICJ1
bmtub3duIE5WX0FSQ0hcbiIpOw0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJy
X291dDsNCj4+Pj4+Pj4+ICsgICAgICAgfQ0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gICAgICAg
ICAgcmV0ID0gYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9kZXZpY2VzKHBkLCAi
bnZpZGlhZmIiKTsNCj4+Pj4+Pj4+ICAgICAgICAgIGlmIChyZXQpDQo+Pj4+Pj4+PiAtICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICBnb3Rv
IGVycl9vdXQ7DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gICAgICAgICAgaW5mbyA9IGZyYW1lYnVm
ZmVyX2FsbG9jKHNpemVvZihzdHJ1Y3QgbnZpZGlhX3BhciksICZwZC0+ZGV2KTsNCj4+Pj4+
Pj4+IC0NCj4+Pj4+Pj4+ICAgICAgICAgIGlmICghaW5mbykNCj4+Pj4+Pj4+ICAgICAgICAg
ICAgICAgICAgZ290byBlcnJfb3V0Ow0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEBAIC0xMjk4LDEx
ICsxMzI1LDYgQEAgc3RhdGljIGludCBudmlkaWFmYl9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
cGQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpDQo+Pj4+Pj4+PiAgICAgICAg
ICBpZiAoaW5mby0+cGl4bWFwLmFkZHIgPT0gTlVMTCkNCj4+Pj4+Pj4+ICAgICAgICAgICAg
ICAgICAgZ290byBlcnJfb3V0X2tmcmVlOw0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IC0gICAgICAg
aWYgKHBjaV9lbmFibGVfZGV2aWNlKHBkKSkgew0KPj4+Pj4+Pj4gLSAgICAgICAgICAgICAg
IHByaW50ayhLRVJOX0VSUiBQRlggImNhbm5vdCBlbmFibGUgUENJIGRldmljZVxuIik7DQo+
Pj4+Pj4+PiAtICAgICAgICAgICAgICAgZ290byBlcnJfb3V0X2VuYWJsZTsNCj4+Pj4+Pj4+
IC0gICAgICAgfQ0KPj4+Pj4+Pj4gLQ0KPj4+Pj4+Pj4gICAgICAgICAgaWYgKHBjaV9yZXF1
ZXN0X3JlZ2lvbnMocGQsICJudmlkaWFmYiIpKSB7DQo+Pj4+Pj4+PiAgICAgICAgICAgICAg
ICAgIHByaW50ayhLRVJOX0VSUiBQRlggImNhbm5vdCByZXF1ZXN0IFBDSSByZWdpb25zXG4i
KTsNCj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgZ290byBlcnJfb3V0X2VuYWJsZTsNCj4+
Pj4+Pj4+IEBAIC0xMzE4LDM0ICsxMzQwLDE3IEBAIHN0YXRpYyBpbnQgbnZpZGlhZmJfcHJv
YmUoc3RydWN0IHBjaV9kZXYgKnBkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50
KQ0KPj4+Pj4+Pj4gICAgICAgICAgcGFyLT5wYW5lbHR3ZWFrID0gcGFuZWx0d2VhazsNCj4+
Pj4+Pj4+ICAgICAgICAgIHBhci0+cmV2ZXJzZV9pMmMgPSByZXZlcnNlX2kyYzsNCj4+Pj4+
Pj4+DQo+Pj4+Pj4+PiAtICAgICAgIC8qIGVuYWJsZSBJTyBhbmQgbWVtIGlmIG5vdCBhbHJl
YWR5IGRvbmUgKi8NCj4+Pj4+Pj4+IC0gICAgICAgcGNpX3JlYWRfY29uZmlnX3dvcmQocGQs
IFBDSV9DT01NQU5ELCAmY21kKTsNCj4+Pj4+Pj4+IC0gICAgICAgY21kIHw9IChQQ0lfQ09N
TUFORF9JTyB8IFBDSV9DT01NQU5EX01FTU9SWSk7DQo+Pj4+Pj4+PiAtICAgICAgIHBjaV93
cml0ZV9jb25maWdfd29yZChwZCwgUENJX0NPTU1BTkQsIGNtZCk7DQo+Pj4+Pj4+PiAtDQo+
Pj4+Pj4+PiAtICAgICAgIG52aWRpYWZiX2ZpeC5tbWlvX3N0YXJ0ID0gcGNpX3Jlc291cmNl
X3N0YXJ0KHBkLCAwKTsNCj4+Pj4+Pj4+ICAgICAgICAgIG52aWRpYWZiX2ZpeC5zbWVtX3N0
YXJ0ID0gcGNpX3Jlc291cmNlX3N0YXJ0KHBkLCAxKTsNCj4+Pj4+Pj4+IC0gICAgICAgbnZp
ZGlhZmJfZml4Lm1taW9fbGVuID0gcGNpX3Jlc291cmNlX2xlbihwZCwgMCk7DQo+Pj4+Pj4+
PiAtDQo+Pj4+Pj4+PiAtICAgICAgIHBhci0+UkVHUyA9IGlvcmVtYXAobnZpZGlhZmJfZml4
Lm1taW9fc3RhcnQsIG52aWRpYWZiX2ZpeC5tbWlvX2xlbik7DQo+Pj4+Pj4+Pg0KPj4+Pj4+
Pj4gLSAgICAgICBpZiAoIXBhci0+UkVHUykgew0KPj4+Pj4+Pj4gLSAgICAgICAgICAgICAg
IHByaW50ayhLRVJOX0VSUiBQRlggImNhbm5vdCBpb3JlbWFwIE1NSU8gYmFzZVxuIik7DQo+
Pj4+Pj4+PiAtICAgICAgICAgICAgICAgZ290byBlcnJfb3V0X2ZyZWVfYmFzZTA7DQo+Pj4+
Pj4+PiAtICAgICAgIH0NCj4+Pj4+Pj4+ICsgICAgICAgcGFyLT5SRUdTID0gUkVHUzsNCj4+
Pj4+Pj4+DQo+Pj4+Pj4+PiAtICAgICAgIHBhci0+Q2hpcHNldCA9IG52aWRpYV9nZXRfY2hp
cHNldChpbmZvKTsNCj4+Pj4+Pj4+IC0gICAgICAgcGFyLT5BcmNoaXRlY3R1cmUgPSBudmlk
aWFfZ2V0X2FyY2goaW5mbyk7DQo+Pj4+Pj4+PiAtDQo+Pj4+Pj4+PiAtICAgICAgIGlmIChw
YXItPkFyY2hpdGVjdHVyZSA9PSAwKSB7DQo+Pj4+Pj4+PiAtICAgICAgICAgICAgICAgcHJp
bnRrKEtFUk5fRVJSIFBGWCAidW5rbm93biBOVl9BUkNIXG4iKTsNCj4+Pj4+Pj4+IC0gICAg
ICAgICAgICAgICBnb3RvIGVycl9vdXRfYXJjaDsNCj4+Pj4+Pj4+IC0gICAgICAgfQ0KPj4+
Pj4+Pj4gKyAgICAgICBwYXItPkNoaXBzZXQgPSBDaGlwc2V0Ow0KPj4+Pj4+Pj4gKyAgICAg
ICBwYXItPkFyY2hpdGVjdHVyZSA9IEFyY2hpdGVjdHVyZTsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+
PiAgICAgICAgICBzcHJpbnRmKG52aWRpYWZiX2ZpeC5pZCwgIk5WJXgiLCAocGQtPmRldmlj
ZSAmIDB4MGZmMCkgPj4gNCk7DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gICAgICAgICAgaWYgKE5W
Q29tbW9uU2V0dXAoaW5mbykpDQo+Pj4+Pj4+PiAtICAgICAgICAgICAgICAgZ290byBlcnJf
b3V0X2FyY2g7DQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgZ290byBlcnJfb3V0X2ZyZWVf
YmFzZTA7DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gICAgICAgICAgcGFyLT5GYkFkZHJlc3MgPSBu
dmlkaWFmYl9maXguc21lbV9zdGFydDsNCj4+Pj4+Pj4+ICAgICAgICAgIHBhci0+RmJNYXBT
aXplID0gcGFyLT5SYW1BbW91bnRLQnl0ZXMgKiAxMDI0Ow0KPj4+Pj4+Pj4gQEAgLTE0MDEs
NyArMTQwNiw2IEBAIHN0YXRpYyBpbnQgbnZpZGlhZmJfcHJvYmUoc3RydWN0IHBjaV9kZXYg
KnBkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQ0KPj4+Pj4+Pj4gICAgICAg
ICAgICAgICAgICBnb3RvIGVycl9vdXRfaW91bm1hcF9mYjsNCj4+Pj4+Pj4+ICAgICAgICAg
IH0NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAtDQo+Pj4+Pj4+PiAgICAgICAgICBwcmludGsoS0VS
Tl9JTkZPIFBGWA0KPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICJQQ0kgblZpZGlhICVzIGZy
YW1lYnVmZmVyICglZE1CIEAgMHglbFgpXG4iLA0KPj4+Pj4+Pj4gICAgICAgICAgICAgICAg
IGluZm8tPmZpeC5pZCwNCj4+Pj4+Pj4+IEBAIC0xNDE1LDE1ICsxNDE5LDE0IEBAIHN0YXRp
YyBpbnQgbnZpZGlhZmJfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkLCBjb25zdCBzdHJ1Y3Qg
cGNpX2RldmljZV9pZCAqZW50KQ0KPj4+Pj4+Pj4gICBlcnJfb3V0X2ZyZWVfYmFzZTE6DQo+
Pj4+Pj4+PiAgICAgICAgICBmYl9kZXN0cm95X21vZGVkYihpbmZvLT5tb25zcGVjcy5tb2Rl
ZGIpOw0KPj4+Pj4+Pj4gICAgICAgICAgbnZpZGlhX2RlbGV0ZV9pMmNfYnVzc2VzKHBhcik7
DQo+Pj4+Pj4+PiAtZXJyX291dF9hcmNoOg0KPj4+Pj4+Pj4gLSAgICAgICBpb3VubWFwKHBh
ci0+UkVHUyk7DQo+Pj4+Pj4+PiAtIGVycl9vdXRfZnJlZV9iYXNlMDoNCj4+Pj4+Pj4+ICtl
cnJfb3V0X2ZyZWVfYmFzZTA6DQo+Pj4+Pj4+PiAgICAgICAgICBwY2lfcmVsZWFzZV9yZWdp
b25zKHBkKTsNCj4+Pj4+Pj4+ICAgZXJyX291dF9lbmFibGU6DQo+Pj4+Pj4+PiAgICAgICAg
ICBrZnJlZShpbmZvLT5waXhtYXAuYWRkcik7DQo+Pj4+Pj4+PiAgIGVycl9vdXRfa2ZyZWU6
DQo+Pj4+Pj4+PiAgICAgICAgICBmcmFtZWJ1ZmZlcl9yZWxlYXNlKGluZm8pOw0KPj4+Pj4+
Pj4gICBlcnJfb3V0Og0KPj4+Pj4+Pj4gKyAgICAgICBpb3VubWFwKFJFR1MpOw0KPj4+Pj4+
Pj4gICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+Pj4+Pj4+PiAgIH0NCj4+Pj4+Pj4+DQo+
Pj4+Pj4+PiAtLQ0KPj4+Pj4+Pj4gMi4zOC4xDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoaXMgcGF0
Y2ggZmFpbHMgZm9yIG1lLg0KPj4+Pj4+DQo+Pj4+Pj4gSSd2ZSBiYXNlZCB0aGUgcGF0Y2gg
b24gNi4yLXJjNywgcGxlYXNlIG1ha2Ugc3VyZSB0byBub3QgaGF2ZSB0aGUNCj4+Pj4+PiBw
cmV2aW91cyByZXZlcnQgY29tbWl0dGVkLCB0aGlzIGlzIHRvIHJlcGxhY2UgdGhhdCBwYXRj
aC4NCj4+Pj4+DQo+Pj4+PiBDYW4geW91IGd1aWRlIG1lIHRocm91Z2ggdGhlIHN0ZXBzIHBs
ZWFzZT8NCj4+Pj4+DQo+Pj4+PiBJIGRvbmU6DQo+Pj4+Pg0KPj4+Pj4gMS4gY2QgL3Vzci9z
cmMvbGludXgNCj4+Pj4+IDIuIHN1ZG8gZ2l0IHB1bGwNCj4+Pj4+IDMuIHRoZW4gSSBhcHBs
aWVkIHlvdXIgcGF0Y2guDQo+Pj4+Pg0KPj4+Pj4gQW0gSSBkb2luZyBzb21ldGhpbmcgd3Jv
bmc/DQo+Pj4+DQo+Pj4+IFdoYXQgaXMgeW91ciB0b3Agb2YgdHJlZSBjb21taXQ/IChnaXQg
bG9nKQ0KPj4+Pg0KPj4+PiBoYXZlIHlvdSBnb3QgYW55IGNvbW1pdHMgb24gdG9wPw0KPj4+
Pg0KPj4+PiBnaXQgcmVzZXQgLS1oYXJkIG9yaWdpbi9tYXN0ZXIgc2hvdWxkIHJlc2V0IHlv
dXIgdHJlZSB0byBMaW51cyB0b3AuDQo+Pj4NCj4+PiAxLiBnaXQgbG9nIHNob3dzICJkMmQx
MWYzNDJiMTc5ZjE4OTRhOTAxZjE0M2VjN2MwMDhjYWJhNDNlIg0KPj4+IDIuIE5vLCBubyBw
YXRjaGVzIG9uIHRvcC4NCj4+PiAzLiBJIGFtIGRvaW5nIHRoZSBmb2xsb3dpbmcgc3RlcHM6
DQo+Pj4gL3Vzci9zcmMvbGludXg+IHN1ZG8gZ2l0IHJlc2V0IC0taGFyZCBvcmlnaW4vbWFz
dGVyDQo+Pj4gUGFzc3dvcnQ6DQo+Pj4gSEVBRCBpc3QgamV0enQgYmVpIGQyZDExZjM0MmIx
NyBNZXJnZSBicmFuY2ggJ2ZpeGVzJyBvZg0KPj4+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC92aXJvL3Zmcw0KPj4+IC91c3Ivc3JjL2xpbnV4PiBz
dWRvIHBhdGNoIC1wMSA8IC90bXAvcGF0Y2gNCj4+PiBwYXRjaGluZyBmaWxlIGRyaXZlcnMv
dmlkZW8vZmJkZXYvbnZpZGlhL252aWRpYS5jDQo+Pj4gSHVuayAjMSBGQUlMRUQgYXQgMTE5
Ny4NCj4+PiBIdW5rICMyIEZBSUxFRCBhdCAxMjIwLg0KPj4+IEh1bmsgIzMgRkFJTEVEIGF0
IDEyNzguDQo+Pj4gSHVuayAjNCBGQUlMRUQgYXQgMTI5OC4NCj4+PiBIdW5rICM1IEZBSUxF
RCBhdCAxMzE4Lg0KPj4+IEh1bmsgIzYgRkFJTEVEIGF0IDE0MDEuDQo+Pj4gSHVuayAjNyBG
QUlMRUQgYXQgMTQxNS4NCj4+PiA3IG91dCBvZiA3IGh1bmtzIEZBSUxFRCAtLSBzYXZpbmcg
cmVqZWN0cyB0byBmaWxlDQo+Pj4gZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZpZGlh
LmMucmVqDQo+Pj4NCj4+IEFyZSB5b3UgcHVsbGluZyB0aGUgcGF0Y2ggZnJvbSBlbWFpbD8g
SSBndWVzcyB5b3VyIGVtYWlsIHNlcnZpY2Ugb3INCj4+IHNvbWV0aGluZyBpcyBtYW5nbGlu
ZyBpdC4NCj4+DQo+PiBJJ3ZlIGF0dGFjaGVkIGl0IHRvIHNlZSBpZiB0aGF0IGhlbHBzLg0K
PiANCj4gVGhhbmsgeW91ISBUaGlzIHBhdGNoIHdvcmtzIGFuZCBJIGFtIGJvb3RpbmcgcGVy
ZmVjdGx5IHdlbGwgbm93IQ0KPiANCj4gfi8uYmFja3VwPiB1bmFtZSAtYQ0KPiBMaW51eCB6
ZW5vZ2VudG9vIDYuMi4wLXJjNy0wMDAwMi1nZDJkMTFmMzQyYjE3LWRpcnR5ICMxNDQgU01Q
DQo+IFBSRUVNUFRfRFlOQU1JQyBNb24gRmViICA2IDA5OjQyOjU4IENFVCAyMDIzIHg4Nl82
NCBJbnRlbChSKSBDb3JlKFRNKQ0KPiBpNyBDUFUgOTYwIEAgMy4yMEdIeiBHZW51aW5lSW50
ZWwgR05VL0xpbnV4DQo+IA0KPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlIHBhdGNoIG1h
a2VzIGl0IGludG8gbWFpbmxpbmUgZm9yIHRoZSA2LjIgcmVsZWFzZSA7KS4NCg0KUXVldWVk
IHVwIGluIGRybS1taXNjLWZpeGVzLiBUaGUgcGF0Y2ggc2hvdWxkIGJlIGluIDYuMSBhbmQg
Ni4yIHNvb24uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEJlc3QNCj4gWmVu
bw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Qyy0pI3O3Ey3GkpcPDZw49W3--

--------------3oQ3G2YaCa9gbEYp8RCv2hJg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPkt+IFAwAAAAAACgkQlh/E3EQov+CH
AA//SGr3SecNEagMDppkEpGHWmkQt6wccQBECr8RG0OM8Xvz8ho9PtRvgPvwxaQodVSKyMZP8Vpj
Dw2C8Zws92t4djpOQb0vVDxQ5X1Kc1GfBMwaHCdRCn9+WybaQdIxUFI4VXVqiEC8RwXm2lgpYuih
nNKOYqoyl9TdQSWUO9mU7uiR+U8tDuC0+jldrBOEQ+IaMuMjoVXXVueJy5r8+qDb1wd+1wkvWsw7
Hf7x0SUtr/IDQTyIwaFTkFrwxrHDMrthk8B4xXspElkM/mtSRwy+V2nGJyPgTJWIid6VPPJpMZDl
SSEZ5E0w6H/tubU6xh98ZUp/HKd6z2sz1nSvFSn4JUNCy+nXUhBZT+v47OgLiVNTmiz00Lkqf1uF
NYMjLwW00KNaZgPTjRmcgZVXxhIGlClQ57V86B4PACtccIzgL7ysDRirO/77PpKc8/nZSq8P2HXA
8R1CF689JZKn10sE2F4sLu2DOPss1A3A165KlVs9vEXGCCdzN/I4n9dGZx1jVvLSFtUkQ+4uGlNB
1xbH+V01Uh/lUSE3bZeL8bDp9B+8vTSZLNgPB1xQEvp4+S+I+a/S6MkiVRv33g1wDIudrWSmvP6U
CTzrpiJRnpxz+BELUYLx1B3+zjAHuHzEGRr5jgxtrco+5+vryR0b0cixRadtlJ4fkxGBM01Uwg6F
xQs=
=moJk
-----END PGP SIGNATURE-----

--------------3oQ3G2YaCa9gbEYp8RCv2hJg--
