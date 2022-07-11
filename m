Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B633D57000E
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 Jul 2022 13:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiGKLT2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 11 Jul 2022 07:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbiGKLTF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 11 Jul 2022 07:19:05 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CE488F3C
        for <linux-fbdev@vger.kernel.org>; Mon, 11 Jul 2022 03:42:31 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id CA6402282D;
        Mon, 11 Jul 2022 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1657536149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2bDwa0u0rGlUl0/dnv5t720FB+v7SYszA5Qm6d7pJP0=;
        b=Pfr4IIFoR+MyKQub1SJwe6rrWC7z/8o0/fu9pfjGZk/NeNMsOrD0TvJXJ1wa5H+gry59z7
        XkLgagGjhbbVJahjc1+K+ZTRDilcV2wt47u/Xs42d5atZ/Ul32RKaHeT6Urxa+o8H8Ae9j
        /flppW5NUdvNvAFeIsSvpEfsoeVLwNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1657536149;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2bDwa0u0rGlUl0/dnv5t720FB+v7SYszA5Qm6d7pJP0=;
        b=OYG2xIfLDPWbe0WUIPaQq4gSY3gyIpQ8m4bDNyr8p5Nq2zzenlGTLBmIZdsJk0fkdDD8eB
        HcxX4k8rr3SBHbCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 996EC13322;
        Mon, 11 Jul 2022 10:42:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 2OlzJJX+y2IxXwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 10:42:29 +0000
Message-ID: <fafde6fb-17ee-1c18-9e5f-96e60a08d98e@suse.de>
Date:   Mon, 11 Jul 2022 12:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/11] fbdev/vga16fb: Create EGA/VGA devices in sysfb code
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
        daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech
Cc:     linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
        dri-devel@lists.freedesktop.org
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-3-tzimmermann@suse.de>
 <fec8dcc1-c490-3bb6-2d2f-805d690d3f95@redhat.com>
 <95302954-76bc-3da6-70ad-25a8a22a37f0@suse.de>
 <253d0bea-f197-4208-b5e6-39c22ab91833@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <253d0bea-f197-4208-b5e6-39c22ab91833@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4kNrhVXJZiCScVRQUOL09XO0"
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
--------------4kNrhVXJZiCScVRQUOL09XO0
Content-Type: multipart/mixed; boundary="------------PJ4Jg0LWXXCZmoP3EtrAdcrW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Message-ID: <fafde6fb-17ee-1c18-9e5f-96e60a08d98e@suse.de>
Subject: Re: [PATCH 02/11] fbdev/vga16fb: Create EGA/VGA devices in sysfb code
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-3-tzimmermann@suse.de>
 <fec8dcc1-c490-3bb6-2d2f-805d690d3f95@redhat.com>
 <95302954-76bc-3da6-70ad-25a8a22a37f0@suse.de>
 <253d0bea-f197-4208-b5e6-39c22ab91833@redhat.com>
In-Reply-To: <253d0bea-f197-4208-b5e6-39c22ab91833@redhat.com>

--------------PJ4Jg0LWXXCZmoP3EtrAdcrW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDExLjA3LjIyIHVtIDExOjU0IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBPbiA3LzExLzIyIDA5OjU4
LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpIEphdmllciwNCj4+DQo+PiBJJ2xs
IHRyeSB0byBnaXZlIHRoZSBtb3RpdmF0aW9uIG9mIHRoaXMgcGF0Y2ggYmVsb3cuIEkga25v
d24gaXQncyByYXRoZXINCj4+IGh5cG90aGV0aWNhbCBhcyB0aGUgVkdBIGRyaXZlciBpcyBw
cm9iYWJseSBub3QgdXNlZCBtdWNoLg0KPj4NCj4+IEFtIDA4LjA3LjIyIHVtIDE1OjA5IHNj
aHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzOg0KPj4+IEhlbGxvIFRob21hcywNCj4+
Pg0KPj4+IE9uIDcvNy8yMiAxNzozOSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4+
IE1vdmUgdGhlIGRldmljZS1jcmVhdGlvbiBmcm9tIHZnYTE2ZmIgdG8gc3lzZmIgY29kZS4g
TW92ZSB0aGUgZmV3DQo+Pj4+IGV4dHJhIHZpZGVvbW9kZSBjaGVja3MgaW50byB2Z2ExNmZi
J3MgcHJvYmUgZnVuY3Rpb24uDQo+Pj4+DQo+Pj4+IFRoZSB2Z2ExNmZiIGRyaXZlciByZXF1
aXJlcyBhIHNjcmVlbl9pbmZvIGZvciB0eXBlIFZJREVPX1RZUEVfVkdBQw0KPj4+PiBvciBW
SURFT19UWVBFX0VHQUMuIFN1Y2ggY29kZSBpcyBub3doZXJlIHByZXNlbnQgaW4gdGhlIGtl
cm5lbCwgZXhjZXB0DQo+Pj4+IGZvciBzb21lIE1JUFMgc3lzdGVtcy4gSXQncyBub3QgY2xl
YXIgaWYgdGhlIHZnYTE2ZmIgZHJpdmVyIGFjdHVhbGx5DQo+Pj4+IHdvcmtzIGluIHByYWN0
aWNlLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCj4+Pj4gLS0tDQo+Pj4+ICAgIGRyaXZlcnMvZmlybXdhcmUv
c3lzZmIuYyAgICAgIHwgIDQgKysrDQo+Pj4+ICAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmdh
MTZmYi5jIHwgNTkgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4g
ICAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkN
Cj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvc3lzZmIuYyBiL2Ry
aXZlcnMvZmlybXdhcmUvc3lzZmIuYw0KPj4+PiBpbmRleCAxZjI3NmYxMDhjYzkuLjNmZDM1
NjNkOTYyYiAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jDQo+
Pj4+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvc3lzZmIuYw0KPj4+PiBAQCAtOTQsNiArOTQs
MTAgQEAgc3RhdGljIF9faW5pdCBpbnQgc3lzZmJfaW5pdCh2b2lkKQ0KPj4+PiAgICAJCW5h
bWUgPSAiZWZpLWZyYW1lYnVmZmVyIjsNCj4+Pj4gICAgCWVsc2UgaWYgKHNpLT5vcmlnX3Zp
ZGVvX2lzVkdBID09IFZJREVPX1RZUEVfVkxGQikNCj4+Pj4gICAgCQluYW1lID0gInZlc2Et
ZnJhbWVidWZmZXIiOw0KPj4+PiArCWVsc2UgaWYgKHNpLT5vcmlnX3ZpZGVvX2lzVkdBID09
IFZJREVPX1RZUEVfVkdBQykNCj4+Pj4gKwkJbmFtZSA9ICJ2Z2EtZnJhbWVidWZmZXIiOw0K
Pj4+PiArCWVsc2UgaWYgKHNpLT5vcmlnX3ZpZGVvX2lzVkdBID09IFZJREVPX1RZUEVfRUdB
QykNCj4+Pj4gKw0KPj4+DQo+Pj4gSSB3b25kZXIgaWYgd2UgcmVhbGx5IG5lZWQgdG8gZG8g
dGhpcyBkaXN0aW5jdGlvbiBvciBjb3VsZCBqdXN0IGhhdmUgYSBzaW5nbGUNCj4+PiBwbGF0
Zm9ybSBkZXZpY2UgZm9yIGJvdGggVklERU9fVFlQRV9WR0FDIGFuZCBWSURFT19UWVBFX0VH
QUMuIEFmdGVyIGFsbCwgdGhlDQo+Pj4gc2FtZSBmYmRldiBkcml2ZXIgaXMgYm91bmQgYWdh
aW5zdCBib3RoIHBsYXRmb3JtIGRldmljZXMuDQo+Pg0KPj4gV2l0aCB0aGUgY3VycmVudCBk
cml2ZXIsIHdlIGRvbid0IHN0cmljdGx5IG5lZWQgdG8gZGlzdGluZ3Vpc2guIEJ1dCB0aGUN
Cj4+IHN5c2ZiIGNvZGUgaXMgdGhlIG9uZSB3ZSBjYXJlIGFib3V0LiBTbyBJIHdhbnRlZCBp
dCB0byBiZSBjbGVhciBhbmQNCj4+IG5pY2VseSBsb29raW5nLiBBbGwgdGhlIG1vZGUgdGVz
dHMsIGV0YyBkZXBlbmQgb24gdGhlIGRyaXZlciAod2hpY2ggbm8NCj4+IG9uZSBjYXJlcyBh
Ym91dCkuDQo+Pg0KPiANCj4gUmlnaHQuIFRoYXQgaXMgYSBnb29kIHBvaW50LiBXZSBkb24n
dCB3YW50IHRvIGxlYWsgYSBkcml2ZXIgaW1wbGVtZW50YXRpb24NCj4gZGV0YWlsIGluIHRo
ZSBzeXNmYiBjb2RlLiBBbmQgaW4gdGhlb3J5IHRoZXJlIGNvdWxkIGJlIGZvciBleGFtcGxl
IGEgRFJNDQo+IGRyaXZlciBmb3IgRUdBIGFuZCBvbmUgZm9yIFZHQS4NCj4gICANCj4+IFRo
ZXJlJ3MgYWxzbyBhIGRpZmZlcmVuY2UgaW4gaGFyZHdhcmUgZmVhdHVyZXMgYmV0d2VlbiBF
R0EgYW5kIFZHQS4gTW9zdA0KPj4gbm90YWJseSwgVkdBIGhhcyBtdWNoIGJldHRlciBjb2xv
ciBzdXBwb3J0Lg0KPj4NCj4gDQo+IFllcywgSSBrbm93IHRoZSBkaWZmZXJlbmNlcy4gTXkg
cG9pbnQgd2FzIHRoYXQgdGhlIG9yaWdfdmlkZW9faXNWR0Egd2FzDQo+IHVzZWQgdG8gbWFr
ZSB0aGUgZGlzdGluY3Rpb24gYW5kIHRoYXQgdGhlIHNhbWUgZHJpdmVyIHN1cHBvcnRlZCBi
b3RoLCBidXQNCj4gYXMgeW91IHNhaWQgdGhhdCBtYXkgbm90IGJlIHRoZSBjYXNlIGFuZCBz
ZXBhcmF0ZSBkcml2ZXJzIGNvdWxkIGJlIHVzZWQuDQo+IA0KPj4+DQo+Pj4gWy4uLl0NCj4+
Pg0KPj4+PiAgICBzdGF0aWMgaW50IHZnYTE2ZmJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqZGV2KQ0KPj4+PiAgICB7DQo+Pj4+ICsJc3RydWN0IHNjcmVlbl9pbmZvICpzaTsN
Cj4+Pj4gICAgCXN0cnVjdCBmYl9pbmZvICppbmZvOw0KPj4+PiAgICAJc3RydWN0IHZnYTE2
ZmJfcGFyICpwYXI7DQo+Pj4+ICAgIAlpbnQgaTsNCj4+Pj4gICAgCWludCByZXQgPSAwOw0K
Pj4+PiAgICANCj4+Pj4gKwlzaSA9IGRldl9nZXRfcGxhdGRhdGEoJmRldi0+ZGV2KTsNCj4+
Pj4gKwlpZiAoIXNpKQ0KPj4+PiArCQlyZXR1cm4gLUVOT0RFVjsNCj4+Pj4gKw0KPj4+PiAr
CXJldCA9IGNoZWNrX21vZGVfc3VwcG9ydGVkKHNpKTsNCj4+Pj4gKwlpZiAocmV0KQ0KPj4+
PiArCQlyZXR1cm4gcmV0Ow0KPj4+PiArDQo+Pj4NCj4+PiBXaGF0IGRvIHlvdSBzZWUgYXMg
dGhlIGFkdmFudGFnZSBvZiBtb3ZpbmcgdGhlIGNoZWNrIHRvIHRoZSBkcml2ZXIncyBwcm9i
ZT8NCj4+Pg0KPj4+IEJlY2F1c2UgYWZ0ZXIgdGhpcyBjaGFuZ2UgdGhlIHBsYXRmb3JtIGRy
aXZlciB3aWxsIGJlIHJlZ2lzdGVyZWQgYnV0IGZvciBubw0KPj4+IHJlYXNvbiwgc2luY2Ug
Y2FuJ3QgZXZlbiBwcm9iZSBpZiBvcmlnX3ZpZGVvX2lzVkdBIGlzIG5laXRoZXIgVkdBQyBu
b3IgRUdBQy4NCj4+DQo+PiBUaGUgZHJpdmVyIG9ubHkgc3VwcG9ydHMgdmVyeSBzcGVjaWZp
YyBtb2Rlcywgd2hpY2ggbWF5IG5vdCBiZSB3aGF0DQo+PiBzY3JlZW5faW5mbyBkZXRlY3Rl
ZC4gTm90ZSB0aGF0IFZHQUMvRUdBQyBjYW4gYWxzbyByZWZlciB0byB0ZXh0LW1vZGUNCj4+
IGJ1ZmZlcnMuIFRoZSBjdXJyZW50IHZnYWNvbiBjb3VsZCBiZSB0dXJuZWQgaW50byBhIHBs
YXRmb3JtIGRyaXZlciB0aGF0DQo+PiBhZG9wdHMgc3VjaCBhIHRleHQgYnVmZmVyIGFuZCBp
bnRlZ3JhdGVzIGl0IHdpdGggYXBlcnR1cmUgaGVscGVycy4NCj4+DQo+IA0KPiBZZXMsIGFu
ZCBhbHNvIHRoZXJlJ3MgYWxzbyB0aGUgbW9ub2Nocm9tZSB2YXJpYW50IG9mIFZHQSBhbmQg
RUdBIChWR0FNL0VHQU0pLg0KPiANCj4gU2hvdWxkIHdlIGFsc28gbWFrZSB0aGF0IGRpc3Rp
bmN0aW9uIG9yIGZvciBleGFtcGxlICJ2Z2EtZnJhbWVidWZmZXIiIHNob3VsZA0KPiBoYW5k
bGUgYm90aCBjb2xvciBhbmQgbW9ub2Nocm9tZSB2YXJpYW50cyBpZiBhdCBzb21lIHBvaW50
IHZnYWNvbiBpcyB0dXJuZWQNCj4gaW50byBhIGZiZGV2IG9yIERSTSBkcml2ZXIgPw0KPiAN
Cj4+Pg0KPj4+IFsuLi5dDQo+Pj4NCj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlX2lkIHZnYTE2ZmJfZHJpdmVyX2lkX3RhYmxlW10gPSB7DQo+Pj4+ICsJeyJl
Z2EtZnJhbWVidWZmZXIiLCAwfSwNCj4+Pj4gKwl7InZnYS1mcmFtZWJ1ZmZlciIsIDB9LA0K
Pj4+PiArCXsgfQ0KPj4+PiArfTsNCj4+Pj4gKw0KPj4+DQo+Pj4gVGhlIGZhY3QgdGhhdCB0
aGUgdHdvIGVudHJpZXMgZG9uJ3QgaGF2ZSBhIHBsYXRmb3JtIGRhdGEgaXMgYW4gaW5kaWNh
dGlvbiBmb3INCj4+DQo+PiBUaGUgbmFtZSBpcyB0aGUgaW5kaWNhdGlvbi4gSSBrbm93IHRo
YXQgdmdhMTYgZG9lc24ndCB0cmVhdCB0aGVtDQo+PiBkaWZmZXJlbnRseS4NCj4+DQo+IA0K
PiBZZXMsIG15IHBvaW50IHdhcyB0aGF0IHRoZSBwbGF0Zm9ybSBkZXZpY2UgbmFtZSB1c2Vk
IHRvIGJpbmQgaXMgYW4gaW50ZXJuYWwNCj4gTGludXggaW50ZXJmYWNlIHRoYXQgY291bGQg
YmUgY2hhbmdlZCBsYXRlciBpZiBuZWVkZWQuIEJ1dCBJIHVuZGVyc3RhbmQgeW91cg0KPiBw
b2ludCBhbmQgc2luY2UgdGhlIHBsYXRmb3JtIGRldmljZSBuYW1lcyBhcmUgZXhwb3NlZCB0
byB1c2VyLXNwYWNlLCBtYWtlcw0KPiBtb3JlIHNlbnNlIGZvciB0aGVtIHRvIHJlZmxlY3Qg
d2hhdCBkZXZpY2VzIGFyZSBib3VuZCBldmVuIHdoZW4gdGhlIGV4aXN0aW5nDQo+IGRyaXZl
ciBkb2Vzbid0IHRyZWF0IHRoZW0gZGlmZmVyZW50bHkuDQo+ICAgDQo+Pj4gbWUgdGhhdCB3
ZSBjb3VsZCBqdXN0IGNvbnNvbGlkYXRlIGluIGEgc2luZ2xlICJ2Z2ExNi1mcmFtZWJ1ZmZl
ciIgb3Igc210LiBJDQo+Pj4ga25vdyB0aGF0IHRoaXMgd29uJ3QgYmUgY29uc2lzdGVudCB3
aXRoIGVmaSwgdmVzYSwgZXRjIGJ1dCBJIGRvbid0IHRoaW5rIGlzDQo+Pj4gdGhhdCBpbXBv
cnRhbnQgYW5kIGFsc28gcXVpdGUgbGlrZWx5IHdlIHdpbGwgZ2V0IHJpZCBvZiB0aGlzIGRy
aXZlciBhbmQgdGhlDQo+Pj4gcGxhdGZvcm0gZGV2aWNlIHJlZ2lzdHJhdGlvbiBzb29uLiBT
aW5jZSBhcyB5b3Ugc2FpZCwgaXQncyB1bmNsZWFyIHRoYXQgaXMNCj4+PiBldmVuIHVzZWQu
DQo+Pg0KPj4gVGhlcmUncyBtaXBzIGNvZGUgaW4gdGhlIGFyY2gvIGRpcmVjdG9yeSB0aGF0
IGFwcGVhcnMgdG8gc2V0dXANCj4+IHNjcmVlbl9pbmZvIGluIHRoZSBjb3JyZWN0IHdheS4g
SSBjYW4ndCBzYXkgd2hldGhlciB0aGF0J3Mgc3RpbGwgdXNlZnVsDQo+PiB0byBhbnlvbmUu
IE9uIHg4NiwgSSBjb3VsZCBzZXQgYSBWR0EgbW9kZSBvbiB0aGUga2VybmVsIGNvbW1hbmQg
bGluZSwNCj4+IGJ1dCBzY3JlZW5faW5mbydzIGlzVkdBIG9ubHkgY29udGFpbmVkICcxJy4g
SXQgbWlnaHQgYmUgcG9zc2libGUgdG8gZml4DQo+PiB0aGlzIGVhc2lseSBieSBzZXR0aW5n
IHRoZSByaWdodCB2YWx1ZXMgaW4gdmdhX3Byb2JlKCkuIFsxXSBJIHNpbXBseQ0KPj4gZG9u
J3QgaGF2ZSB0aGUgdGltZSB0byBwcm92aWRlIGEgcGF0Y2ggYW5kIGRlYWwgd2l0aCB0aGUg
cG90ZW50aWFsDQo+PiBmYWxsb3V0IG9mIHN1Y2ggYSBjaGFuZ2UuDQo+Pg0KPiANCj4gSW5k
ZWVkLiBUaGlzIHNlZW1zIHRvIGJlIGEgcmVtbmFudCBmcm9tIHRoZSB0aW1lIHdoZW4gaXNW
R0Egd2FzIGp1c3QgYSBib29sDQo+IGFuZCB0aGVuIGF0IHNvbWUgcG9pbnQgdGhlIGZpZWxk
IHNlbWFudGljcyB3YXMgZXh0ZW5kZWQgdG8gZGVub3RlIHRoZSBtb2RlDQo+IGJ1dCB0aGUg
ZXhpc3RpbmcgdXNlcnMgd2VyZW4ndCBmaXhlZCAobm9yIHRoZSBmaWVsZCBuYW1lZCB0byBy
ZWZsZWN0IHRoaXMpLg0KPiANCj4gUHJvYmFibHkgc2hvdWxkIGJlIGNsZWFuZWQgdXAgYXQg
c29tZSBwb2ludCBidXQgdW5zdXJlIGlmIHRoZSBjaHVybiB3b3VsZA0KPiBiZSB3b3J0aCBp
dC4NCj4gICANCj4+Pg0KPj4+PiAgICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciB2
Z2ExNmZiX2RyaXZlciA9IHsNCj4+Pj4gICAgCS5wcm9iZSA9IHZnYTE2ZmJfcHJvYmUsDQo+
Pj4+ICAgIAkucmVtb3ZlID0gdmdhMTZmYl9yZW1vdmUsDQo+Pj4+ICAgIAkuZHJpdmVyID0g
ew0KPj4+PiAtCQkubmFtZSA9ICJ2Z2ExNmZiIiwNCj4+Pj4gKwkJLm5hbWUgPSAidmdhLWZy
YW1lYnVmZmVyIiwNCj4+Pj4gICAgCX0sDQo+Pj4NCj4+PiBNYXliZSAidmdhMTYtZnJhbWVi
dWZmZXIiIGluc3RlYWQ/IFNpbmNlIGZvciBleGFtcGxlIFZFU0EgaXMgYWxzbyBWR0EgQUZB
SUsuDQo+Pg0KPj4gVkVTQSBpcyBzb21ldGhpbmcgZWxzZSB0aGFuIFZHQS4gU2V0dGluZyBh
IFZFU0EgbW9kZSAoZG9uZSB2aWEgSU5UIDEwaA0KPj4gSUlSQykgYW5kIHRoZW4gZmlkZGxp
bmcgd2l0aCBWR0Egc3RhdGUgd2lsbCBsaWtlbHkgcHJvZHVjZSBicm9rZW4gb3V0cHV0DQo+
PiBvbiB0aGUgc2NyZWVuLg0KPj4NCj4gDQo+IFRlY2huaWNhbGx5IGl0IGlzIHNvbWV0aGlu
ZyBlbHNlIGJ1dCBMaW51eCBjb25mbGF0ZXMgdGhlbSBpbiBtYW55IHBsYWNlcy4gRm9yDQo+
IGV4YW1wbGUsIGFzIHlvdSBtZW50aW9uZWQgb25lIGNhbiBjaGFuZ2UgdGhlIFZFU0EgbW9k
ZXMgdXNpbmcgdGhlICJ2Z2EiIHBhcmFtDQo+ICh3aGljaCBjb25mdXNpbmdseSBsZWFkcyB0
byB0aGUgdXNlIG9mIHZlc2FmYitmYmNvbiBkcml2ZXIgaW5zdGVhZCBvZiB2Z2Fjb24pLg0K
PiANCj4gVGhhdCdzIHdoeSBJIHRoaW5rIHRoYXQgInZnYS1mcmFtZWJ1ZmZlciIgYXMgZHJp
dmVyIG5hbWUgd291bGQgYmUgbWlzbGVhZGluZy4NCj4gU3BlY2lhbGx5IHNpbmNlIGl0IHdv
dWxkIGFsc28gYmluZCB0byB0aGUgImVnYS1mcmFtZWJ1ZmZlciIgcGxhdGZvcm0gZGV2aWNl
Lg0KDQpJIG1lc3NlZCB1cCBkZXZpY2UgYW5kIGRyaXZlciBuYW1lLCBzdWNoIHRoYXQgbWlz
dW5kZXJzdG9vZCB5b3VyIHJlbWFyay4NCg0KQXMgd2UgdXNlIHRoZSBpZF90YWJsZSBmaWVs
ZCBmb3IgbWF0Y2hpbmcgZGV2aWNlcywgdGhlIGRyaXZlciBuYW1lIA0KZG9lc24ndCBtYXR0
ZXIuIFsxXSBTbyBsZXQncyBrZWVwIHRoZSBkcml2ZXIgbmFtZSBhcyB2Z2ExNmZiLiBUaGUg
Y2hhbmdlIA0KYWJvdmUgbXVzdCBoYXZlIGJlZW4gbGVmdCBvdmVyIGZyb20gYW4gZWFybGll
ciBwcm90b3R5cGUgcGF0Y2gsIEkgZ3Vlc3MuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
ClsxXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE4LjEwL3NvdXJj
ZS9kcml2ZXJzL2Jhc2UvcGxhdGZvcm0uYyNMMTM2NQ0KDQo+IA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------PJ4Jg0LWXXCZmoP3EtrAdcrW--

--------------4kNrhVXJZiCScVRQUOL09XO0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLL/pUFAwAAAAAACgkQlh/E3EQov+A3
wg//YWO2NM7yP2DGR46QfmCHdrUO36X/fX8BzJqb70Usyvzleai65hB3FBuhPfANJa463mkcc+GQ
sUfn7X8V27UmQveY4HbYiiKM6cXpWS4bFT1CWEhXmaX6NzGoVVIpx4AVX0ZlC44JV74qZPtVgDVO
IRzgs48mQq4lFCAuY2Q+kO2jxmzIBJEjMIOUT/GA6zLsiuo6klw/epi9zoRtCbSzqVsRd9tQJsCR
feV1a5HNQr1t+r9gizSc7cCE2t/LzCXMsXQmarTgjaeue+ykG1lw9S+mSpvcbzyOjshYCixbUsYG
AKALTDHy1L60VrXIoZVUtzeFZ2Td83Xe2MQmw/OJkkeg7Tz0O9PTcBTNAaaK2vWU5hkf+NpPhFUC
MWmrvVao2x1WD/EjDqu14A2AxuhQgCkag6oW7cYHxu4HGDNv6NjEohfDQYgJ8appe3BChc6cTz9p
8rc7KBb9LJ6BI/620dFpDG0EmxAYEWh4SOUUVjpEb0hxkD8BU9N0Smqem0sUTwVXxyKSeHIfTvAM
z5B+AvmEpIUXeRnatqHaSG7x7lm1OSWXvD0Tj2R6o/d9NnLAYOse9z6btlVMZe80a5zC1PJyKWvu
AJF4tY05cpaAZKCjRhtJC6gCnAXIbl9OkJe/lmHk8EXY3Iotl/MEgRWsI3N8FNl91FpgZ2rDMeJ7
7aU=
=1l+i
-----END PGP SIGNATURE-----

--------------4kNrhVXJZiCScVRQUOL09XO0--
