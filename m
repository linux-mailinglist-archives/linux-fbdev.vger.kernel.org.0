Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D42E72B94E
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Jun 2023 09:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236025AbjFLH4t (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 12 Jun 2023 03:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233555AbjFLH4a (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 12 Jun 2023 03:56:30 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB6C35B6;
        Mon, 12 Jun 2023 00:55:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5548820462;
        Mon, 12 Jun 2023 07:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686553206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UV3AQ5I4rJAi/cohzl/LknONjCknfyy15Z0t6isEVpE=;
        b=ctG2FOYHdlOVSfQdtfJ4twaXkHMzPs4hnrFZeCWIHqpbeTOz69HxV2MTa3zqmENhzw0AGO
        EuvBmiLA22YPsBGJGS+Q17i50QcKh3sOgYv4WRiglKDLXp27AxllJLW99/7LTjwsOoAqEf
        NUUjTtE2QYqS4Th3+dXCB0/Hh6zubLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686553206;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UV3AQ5I4rJAi/cohzl/LknONjCknfyy15Z0t6isEVpE=;
        b=jKvCvcDQCALqfjBt9P8i/tb8dgCyGn0aEkKYnacqK94kbBUBixz8/ANkFQwNP8WcuvmaU4
        0/RY4ufm/srgAdDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CD4D1357F;
        Mon, 12 Jun 2023 07:00:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id MMoXAnbChmQ2VwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 07:00:06 +0000
Message-ID: <c1b6f1e2-3a95-67ab-b361-af5997bdb2b2@suse.de>
Date:   Mon, 12 Jun 2023 09:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
Content-Language: en-US
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de,
        geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <20230611163716.GA1139759@ravnborg.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230611163716.GA1139759@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------H9eNiOblPZoKsuUT0WHkP1tw"
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------H9eNiOblPZoKsuUT0WHkP1tw
Content-Type: multipart/mixed; boundary="------------cSSE3sTDb5YEik4NHeAnKOoi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-staging@lists.linux.dev
Message-ID: <c1b6f1e2-3a95-67ab-b361-af5997bdb2b2@suse.de>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <20230611163716.GA1139759@ravnborg.org>
In-Reply-To: <20230611163716.GA1139759@ravnborg.org>

--------------cSSE3sTDb5YEik4NHeAnKOoi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDYuMjMgdW0gMTg6Mzcgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIE1vbiwgSnVuIDA1LCAyMDIzIGF0IDA0OjQ4OjEyUE0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gQWRkIEtjb25maWcgb3B0aW9uIENP
TkZJR19GQl9ERVZJQ0UgYW5kIG1ha2UgdGhlIHZpcnR1YWwgZmJkZXYNCj4+IGRldmljZSBv
cHRpb25hbC4gSWYgdGhlIG5ldyBvcHRpb24gaGFzIG5vdCBiZWVuIHNlbGVjdGVkLCBmYmRl
dg0KPj4gZG9lcyBub3QgY3JlYXRlIGEgZmlsZXMgaW4gZGV2ZnMgb3Igc3lzZnMuDQo+IHMv
IGEvLw0KPj4NCj4+IE1vc3QgbW9kZXJuIExpbnV4IHN5c3RlbXMgcnVuIGEgRFJNLWJhc2Vk
IGdyYXBoaWNzIHN0YWNrIHRoYXQgdXNlcw0KPj4gdGhlIGtlcm5lbCdzIGZyYW1lYnVmZmVy
IGNvbnNvbGUsIGJ1dCBoYXMgb3RoZXJ3aXNlIGRlcHJlY2F0ZWQgZmJkZXYNCj4+IHN1cHBv
cnQuIFlldCBmYmRldiB1c2Vyc3BhY2UgaW50ZXJmYWNlcyBhcmUgc3RpbGwgcHJlc2VudC4N
Cj4+DQo+PiBUaGUgb3B0aW9uIG1ha2VzIGl0IHBvc3NpYmxlIHRvIHVzZSB0aGUgZmJkZXYg
c3Vic3lzdGVtIGFzIGNvbnNvbGUNCj4+IGltcGxlbWVudGF0aW9uIHdpdGhvdXQgc3VwcG9y
dCBmb3IgdXNlcnNwYWNlLiBUaGlzIGNsb3NlcyBwb3RlbnRpYWwNCj4+IGVudHJ5IHBvaW50
cyB0byBtYW5pcHVsYXRlIGtlcm5lbCBvciBJL08gbWVtb3J5IHZpYSBmcmFtZWJ1ZmZlcnMu
IEl0DQo+PiBhbHNvIHByZXZlbnRzIHRoZSBleGVjdXRpb24gb2YgZHJpdmVyIGNvZGUgdmlh
IGlvY3RsIG9yIHN5c2ZzLCBib3RoDQo+PiBvZiB3aGljaCBtaWdodCBhbGxvdyBtYWxpY2lv
dXMgc29mdHdhcmUgdG8gZXhwbG9pdCBidWdzIGluIHRoZSBmYmRldg0KPj4gY29kZS4NCj4+
DQo+PiBBIHNtYWxsIG51bWJlciBvZiBmYmRldiBkcml2ZXJzIHJlcXVpcmUgc3RydWN0IGZi
aW5mby5kZXYgdG8gYmUNCj4+IGluaXRpYWxpemVkLCB1c3VhbGx5IGZvciB0aGUgc3VwcG9y
dCBvZiBzeXNmcyBpbnRlcmZhY2UuIE1ha2UgdGhlc2UNCj4+IGRyaXZlcnMgZGVwZW5kIG9u
IEZCX0RFVklDRS4gVGhleSBjYW4gbGF0ZXIgYmUgZml4ZWQgaWYgbmVjZXNzYXJ5Lg0KPiBT
aG91bGQgdGhhdCBiZSBhIFRPRE8gaW4gZ3B1L3RvZG8ucnN0Pw0KPiBPdGhlcndpc2UgdGhl
IGFtb3VudCBvZiBwZW9wbGUga25vd2luZyBhYm91dCB0aGlzDQo+IGlzIHZlcnkgY2xvc2Ug
dG8gMS4NCj4gQXMgYW4gYWx0ZXJuYXRpdmUgYWRkIGEgVE9ETyB0byBlYWNoIEtjb25maWcg
ZmlsZS4NCj4gDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9zdGFnaW5nL2ZidGZ0
L0tjb25maWcgICAgICAgICAgICB8ICAxICsNCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9L
Y29uZmlnICAgICAgICAgICAgICB8IDEyICsrKysrKysrKw0KPj4gICBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvTWFrZWZpbGUgICAgICAgIHwgIDcgKysrLS0tDQo+PiAgIGRyaXZlcnMv
dmlkZW8vZmJkZXYvY29yZS9mYl9pbnRlcm5hbC5oICAgfCAzMiArKysrKysrKysrKysrKysr
KysrKysrKysNCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvS2NvbmZp
ZyB8ICAyICstDQo+PiAgIGluY2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArKw0KPj4gICA2IGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9mYnRm
dC9LY29uZmlnIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L0tjb25maWcNCj4+IGluZGV4IDRk
MjllOGMxMDE0ZS4uNWRkYTNjNjVhMzhlIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9zdGFn
aW5nL2ZidGZ0L0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9LY29u
ZmlnDQo+PiBAQCAtMiw2ICsyLDcgQEANCj4+ICAgbWVudWNvbmZpZyBGQl9URlQNCj4+ICAg
CXRyaXN0YXRlICJTdXBwb3J0IGZvciBzbWFsbCBURlQgTENEIGRpc3BsYXkgbW9kdWxlcyIN
Cj4+ICAgCWRlcGVuZHMgb24gRkIgJiYgU1BJDQo+PiArCWRlcGVuZHMgb24gRkJfREVWSUNF
DQo+PiAgIAlkZXBlbmRzIG9uIEdQSU9MSUIgfHwgQ09NUElMRV9URVNUDQo+PiAgIAlzZWxl
Y3QgRkJfU1lTX0ZJTExSRUNUDQo+PiAgIAlzZWxlY3QgRkJfU1lTX0NPUFlBUkVBDQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnIGIvZHJpdmVycy92aWRl
by9mYmRldi9LY29uZmlnDQo+PiBpbmRleCA2ZGY5YmQwOTQ1NGEuLjQ4ZDlhMTRmODg5YyAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZw0KPj4gKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+PiBAQCAtNTcsNiArNTcsMTUgQEAgY29u
ZmlnIEZJUk1XQVJFX0VESUQNCj4+ICAgCSAgY29tYmluYXRpb24gd2l0aCBjZXJ0YWluIG1v
dGhlcmJvYXJkcyBhbmQgbW9uaXRvcnMgYXJlIGtub3duIHRvDQo+PiAgIAkgIHN1ZmZlciBm
cm9tIHRoaXMgcHJvYmxlbS4NCj4+ICAgDQo+PiArY29uZmlnIEZCX0RFVklDRQ0KPj4gKyAg
ICAgICAgYm9vbCAiUHJvdmlkZSBsZWdhY3kgL2Rldi9mYiogZGV2aWNlIg0KPj4gKyAgICAg
ICAgZGVwZW5kcyBvbiBGQg0KPj4gKyAgICAgICAgaGVscA0KPj4gKwkgIFNheSBZIGhlcmUg
aWYgeW91IHdhbnQgdGhlIGxlZ2FjeSAvZGV2L2ZiKiBkZXZpY2UgZmlsZS4gSXQncw0KPj4g
KwkgIG9ubHkgcmVxdWlyZWQgaWYgeW91IGhhdmUgdXNlcnNwYWNlIHByb2dyYW1zIHRoYXQg
ZGVwZW5kIG9uDQo+PiArCSAgZmJkZXYgZm9yIGdyYXBoaWNzIG91dHB1dC4gVGhpcyBkb2Vz
IG5vdCBlZmZlY3QgdGhlIGZyYW1lYnVmZmVyDQo+PiArCSAgY29uc29sZS4NCj4gdGFicyB0
byBzcGFjZXMgdG8gaW5kZW50IHRoZSBhYm92ZSBjb3JyZWN0Lg0KPiANCj4+ICsNCj4+ICAg
Y29uZmlnIEZCX0REQw0KPj4gICAJdHJpc3RhdGUNCj4+ICAgCWRlcGVuZHMgb24gRkINCj4+
IEBAIC0xNTQ1LDYgKzE1NTQsNyBAQCBjb25maWcgRkJfM0RGWF9JMkMNCj4+ICAgY29uZmln
IEZCX1ZPT0RPTzENCj4+ICAgCXRyaXN0YXRlICIzRGZ4IFZvb2RvbyBHcmFwaGljcyAoc3N0
MSkgc3VwcG9ydCINCj4+ICAgCWRlcGVuZHMgb24gRkIgJiYgUENJDQo+PiArCWRlcGVuZHMg
b24gRkJfREVWSUNFDQo+PiAgIAlzZWxlY3QgRkJfQ0ZCX0ZJTExSRUNUDQo+PiAgIAlzZWxl
Y3QgRkJfQ0ZCX0NPUFlBUkVBDQo+PiAgIAlzZWxlY3QgRkJfQ0ZCX0lNQUdFQkxJVA0KPj4g
QEAgLTE4NjIsNiArMTg3Miw3IEBAIGNvbmZpZyBGQl9TSF9NT0JJTEVfTENEQw0KPj4gICAJ
dHJpc3RhdGUgIlN1cGVySCBNb2JpbGUgTENEQyBmcmFtZWJ1ZmZlciBzdXBwb3J0Ig0KPj4g
ICAJZGVwZW5kcyBvbiBGQiAmJiBIQVZFX0NMSyAmJiBIQVNfSU9NRU0NCj4+ICAgCWRlcGVu
ZHMgb24gU1VQRVJIIHx8IEFSQ0hfUkVORVNBUyB8fCBDT01QSUxFX1RFU1QNCj4+ICsJZGVw
ZW5kcyBvbiBGQl9ERVZJQ0UNCj4+ICAgCXNlbGVjdCBGQl9TWVNfRklMTFJFQ1QNCj4+ICAg
CXNlbGVjdCBGQl9TWVNfQ09QWUFSRUENCj4+ICAgCXNlbGVjdCBGQl9TWVNfSU1BR0VCTElU
DQo+PiBAQCAtMTkzMCw2ICsxOTQxLDcgQEAgY29uZmlnIEZCX1NNU0NVRlgNCj4+ICAgY29u
ZmlnIEZCX1VETA0KPj4gICAJdHJpc3RhdGUgIkRpc3BsYXlsaW5rIFVTQiBGcmFtZWJ1ZmZl
ciBzdXBwb3J0Ig0KPj4gICAJZGVwZW5kcyBvbiBGQiAmJiBVU0INCj4+ICsJZGVwZW5kcyBv
biBGQl9ERVZJQ0UNCj4+ICAgCXNlbGVjdCBGQl9NT0RFX0hFTFBFUlMNCj4+ICAgCXNlbGVj
dCBGQl9TWVNfRklMTFJFQ1QNCj4+ICAgCXNlbGVjdCBGQl9TWVNfQ09QWUFSRUENCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvTWFrZWZpbGUgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvcmUvTWFrZWZpbGUNCj4+IGluZGV4IDEyNWQyNGY1MGMzNi4uZDVl
ODc3MjYyMGY4IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL01h
a2VmaWxlDQo+PiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvTWFrZWZpbGUNCj4+
IEBAIC0yLDEyICsyLDEzIEBADQo+PiAgIG9iai0kKENPTkZJR19GQl9OT1RJRlkpICAgICAg
ICAgICArPSBmYl9ub3RpZnkubw0KPj4gICBvYmotJChDT05GSUdfRkIpICAgICAgICAgICAg
ICAgICAgKz0gZmIubw0KPj4gICBmYi15ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Oj0gZmJfYmFja2xpZ2h0Lm8gXA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmYl9kZXZmcy5vIFwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGZiX2luZm8ubyBcDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGZiX3Byb2Nmcy5vIFwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZmJtZW0ubyBmYm1vbi5vIGZiY21hcC5vIGZic3lzZnMubyBcDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZibWVtLm8gZmJtb24ubyBm
YmNtYXAubyBcDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
b2RlZGIubyBmYmN2dC5vIGZiX2NtZGxpbmUubyBmYl9pb19mb3BzLm8NCj4+ICAgZmItJChD
T05GSUdfRkJfREVGRVJSRURfSU8pICAgICAgICs9IGZiX2RlZmlvLm8NCj4+ICtmYi0kKENP
TkZJR19GQl9ERVZJQ0UpICAgICAgICAgICAgKz0gZmJfZGV2ZnMubyBcDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZiX3Byb2Nmcy5vIFwNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmJzeXNmcy5vDQo+IE1heWJlIGNo
YW5nZSB0aGlzIHRvIG9uZSBsaW5lIHRvIGF2b2lkICdcJz8NCj4gDQo+PiAgIA0KPj4gICBp
ZmVxICgkKENPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFKSx5KQ0KPj4gICBmYi15CQkJCSAg
Kz0gZmJjb24ubyBiaXRibGl0Lm8gc29mdGN1cnNvci5vDQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2ludGVybmFsLmggYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJfaW50ZXJuYWwuaA0KPj4gaW5kZXggMGI0M2MwY2Q1MDk2Li5iOGEyODQ2
NmRiNzkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfaW50
ZXJuYWwuaA0KPj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2ludGVybmFs
LmgNCj4+IEBAIC0zLDEyICszLDIyIEBADQo+PiAgICNpZm5kZWYgX0ZCX0lOVEVSTkFMX0gN
Cj4+ICAgI2RlZmluZSBfRkJfSU5URVJOQUxfSA0KPj4gICANCj4+ICsjaW5jbHVkZSA8bGlu
dXgvZGV2aWNlLmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9mYi5oPg0KPj4gICAjaW5jbHVk
ZSA8bGludXgvbXV0ZXguaD4NCj4+ICAgDQo+PiAgIC8qIGZiX2RldmZzLmMgKi8NCj4+ICsj
aWYgZGVmaW5lZChDT05GSUdfRkJfREVWSUNFKQ0KPj4gICBpbnQgZmJfcmVnaXN0ZXJfY2hy
ZGV2KHZvaWQpOw0KPj4gICB2b2lkIGZiX3VucmVnaXN0ZXJfY2hyZGV2KHZvaWQpOw0KPj4g
KyNlbHNlDQo+PiArc3RhdGljIGlubGluZSBpbnQgZmJfcmVnaXN0ZXJfY2hyZGV2KHZvaWQp
DQo+PiArew0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArc3RhdGljIGlubGluZSB2b2lk
IGZiX3VucmVnaXN0ZXJfY2hyZGV2KHZvaWQpDQo+PiAreyB9DQo+PiArI2VuZGlmDQo+PiAg
IA0KPj4gICAvKiBmYm1lbS5jICovDQo+PiAgIGV4dGVybiBzdHJ1Y3QgY2xhc3MgKmZiX2Ns
YXNzOw0KPj4gQEAgLTE5LDExICsyOSwzMyBAQCBzdHJ1Y3QgZmJfaW5mbyAqZ2V0X2ZiX2lu
Zm8odW5zaWduZWQgaW50IGlkeCk7DQo+PiAgIHZvaWQgcHV0X2ZiX2luZm8oc3RydWN0IGZi
X2luZm8gKmZiX2luZm8pOw0KPj4gICANCj4+ICAgLyogZmJfcHJvY2ZzLmMgKi8NCj4+ICsj
aWYgZGVmaW5lZChDT05GSUdfRkJfREVWSUNFKQ0KPj4gICBpbnQgZmJfaW5pdF9wcm9jZnMo
dm9pZCk7DQo+PiAgIHZvaWQgZmJfY2xlYW51cF9wcm9jZnModm9pZCk7DQo+PiArI2Vsc2UN
Cj4+ICtzdGF0aWMgaW5saW5lIGludCBmYl9pbml0X3Byb2Nmcyh2b2lkKQ0KPj4gK3sNCj4+
ICsJcmV0dXJuIDA7DQo+PiArfQ0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBmYl9jbGVhbnVw
X3Byb2Nmcyh2b2lkKQ0KPj4gK3sgfQ0KPj4gKyNlbmRpZg0KPj4gICANCj4+ICAgLyogZmJz
eXNmcy5jICovDQo+PiArI2lmIGRlZmluZWQoQ09ORklHX0ZCX0RFVklDRSkNCj4+ICAgaW50
IGZiX2RldmljZV9jcmVhdGUoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pOw0KPj4gICB2b2lk
IGZiX2RldmljZV9kZXN0cm95KHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvKTsNCj4+ICsjZWxz
ZQ0KPj4gK3N0YXRpYyBpbmxpbmUgaW50IGZiX2RldmljZV9jcmVhdGUoc3RydWN0IGZiX2lu
Zm8gKmZiX2luZm8pDQo+PiArew0KPj4gKwlnZXRfZGV2aWNlKGZiX2luZm8tPmRldmljZSk7
IC8vIGFzIGluIGRldmljZV9hZGQoKQ0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+
PiArc3RhdGljIGlubGluZSB2b2lkIGZiX2RldmljZV9kZXN0cm95KHN0cnVjdCBmYl9pbmZv
ICpmYl9pbmZvKQ0KPj4gK3sNCj4+ICsJcHV0X2RldmljZShmYl9pbmZvLT5kZXZpY2UpOyAv
LyBhcyBpbiBkZXZpY2VfZGVsKCkNCj4+ICt9DQo+PiArI2VuZGlmDQo+IEkgZG8gbm90IHNl
ZSB3aHkgZmJfZGV2aWNlX3tjcmVhdGUsZGVzdHJveX0gbmVlZHMgdG8gY2FsbA0KPiB7Z2V0
LHB1dH1fZGV2aWNlIC0gYW5kIGl0IGlzIG5vdCBleHBsYWluZWQuDQo+IEEgc2hvcnQgZXhw
bGFuYXRpb24gaW4gdGhlIGNvbW1pdCBtYXliZT8NCg0KT2ssIEknbGwgZG8gdGhhdC4NCg0K
VGhpcyBnZXRfZGV2aWNlKCkgaXMgbm9ybWFsbHkgZG9uZSB3aXRoaW4gZGV2aWNlX2NyZWF0
ZSgpIGZyb20gd2l0aGluIA0KcmVnaXN0ZXJfZnJhbWVidWZmZXIoKS4gVGhlIHB1dCBpcyB3
aXRoaW4gdW5yZWdpc3Rlcl9mcmFtYnVmZmVyKCkuIA0KV2l0aG91dCwgc29tZW9uZSBjb3Vs
ZCBhdHRlbXB0IHRvIHVucGx1ZyB0aGUgTGludXggaGFyZHdhcmUgZGV2aWNlIGFuZCANCm91
ciBwb2ludGVyIHdvdWxkIGdvIHN0YWxlLiBTbyB3ZSBoYXZlIHRvIGhvbGQgdGhlIHJlZmVy
ZW5jZSB3aXRoaW4gZmJkZXYuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFdp
dGggbXkgY29tbWVudHMgYWRkcmVzc2VkOg0KPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPg0KPiANCj4gTm90ZTogSSBkbyBub3QgZW5nYWdlIGluIHRo
ZSB0aHJlYWQgYWJvdXQgdGhlIGJlc3QgS2NvbmZpZw0KPiBzb2x1dGlvbiAtIEkgdHJ1c3Qg
dGhlIGludm9sdmVkIHBlb3BsZSB3aWxsIGZpbmQgYSBnb29kIHNvbHV0aW9uLg0KPiANCj4g
CVNhbQ0KPiANCj4+ICAgDQo+PiAgICNlbmRpZg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL0tjb25maWcgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L29tYXAyL29tYXBmYi9LY29uZmlnDQo+PiBpbmRleCA2OWY5Y2IwMzUwN2UuLjIxMDY5ZmRi
N2NjMiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZi
L0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL0tj
b25maWcNCj4+IEBAIC01LDkgKzUsOSBAQCBjb25maWcgT01BUDJfVlJGQg0KPj4gICBtZW51
Y29uZmlnIEZCX09NQVAyDQo+PiAgIAl0cmlzdGF0ZSAiT01BUDIrIGZyYW1lIGJ1ZmZlciBz
dXBwb3J0Ig0KPj4gICAJZGVwZW5kcyBvbiBGQg0KPj4gKwlkZXBlbmRzIG9uIEZCX0RFVklD
RQ0KPj4gICAJZGVwZW5kcyBvbiBEUk1fT01BUCA9IG4NCj4+ICAgCWRlcGVuZHMgb24gR1BJ
T0xJQg0KPj4gLQ0KPj4gICAJc2VsZWN0IEZCX09NQVAyX0RTUw0KPj4gICAJc2VsZWN0IE9N
QVAyX1ZSRkIgaWYgQVJDSF9PTUFQMiB8fCBBUkNIX09NQVAzDQo+PiAgIAlzZWxlY3QgRkJf
Q0ZCX0ZJTExSRUNUDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mYi5oIGIvaW5j
bHVkZS9saW51eC9mYi5oDQo+PiBpbmRleCA1NDFhMGUzY2UyMWYuLjQwZWQxMDI4MTYwYyAx
MDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZmIuaA0KPj4gKysrIGIvaW5jbHVkZS9s
aW51eC9mYi5oDQo+PiBAQCAtNDgxLDcgKzQ4MSw5IEBAIHN0cnVjdCBmYl9pbmZvIHsNCj4+
ICAgDQo+PiAgIAljb25zdCBzdHJ1Y3QgZmJfb3BzICpmYm9wczsNCj4+ICAgCXN0cnVjdCBk
ZXZpY2UgKmRldmljZTsJCS8qIFRoaXMgaXMgdGhlIHBhcmVudCAqLw0KPj4gKyNpZiBkZWZp
bmVkKENPTkZJR19GQl9ERVZJQ0UpDQo+PiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXY7CQkvKiBU
aGlzIGlzIHRoaXMgZmIgZGV2aWNlICovDQo+PiArI2VuZGlmDQo+PiAgIAlpbnQgY2xhc3Nf
ZmxhZzsgICAgICAgICAgICAgICAgICAgIC8qIHByaXZhdGUgc3lzZnMgZmxhZ3MgKi8NCj4+
ICAgI2lmZGVmIENPTkZJR19GQl9USUxFQkxJVFRJTkcNCj4+ICAgCXN0cnVjdCBmYl90aWxl
X29wcyAqdGlsZW9wczsgICAgLyogVGlsZSBCbGl0dGluZyAqLw0KPj4gLS0gDQo+PiAyLjQw
LjENCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNz
ZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3
IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChB
RyBOdWVybmJlcmcpDQo=

--------------cSSE3sTDb5YEik4NHeAnKOoi--

--------------H9eNiOblPZoKsuUT0WHkP1tw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSGwnUFAwAAAAAACgkQlh/E3EQov+AH
5w/+JqIFoJuY7DBqiEzAZ0pVqhieL9c8LYFx7ZfajAapy3ss++E196vv0smxWja3zCOFnY01xy4u
4m/hn4NoRCkOuKTpgh3kDrmGOt8Z/caT+WlJu1ZLtyOUjbiMJY3uFIyRP+uBGi4LI637BGDAIf+4
RcPXoioAM3oo9OGPITXzCYFi7osrZ7pMHvLvZzOOlws85YjjZbpKoQXUsjnzC3CMgdkdaXbM5utN
MJ902kSK8TYSvsBVrZwCwocFZrFpyr/yLvFUMvtpTJxXmYCGFED6FbKnuZqqANwD8OHSh/kfkZYG
KNAw9lVrhVRV415a2b8uS63ZucqrYm+TLESxLvhw5x4+XTr1/zgEQCfJoeyvdb9DRLEUgqpClCJf
8IgkEUdWZv2KreFK4t2/UhiTLoXNLW3uQk1UA3ss9ydHH6McggmQ0YPWlxKmupsgoHa1LtqoNwKB
V+rJjbvYjCvjXJ1Y62exyr4miGyuxEU08A74mclgpjH3QvTNsKcfdARCNENVy3/alBrCZv8mvjXI
MnmGuZRvI24tpGjhB5/xXJvtzs/KfXj9/xDz7glXd9aQv1Gxt0x0R4EICiVeiBCSK38e6rXR/K9/
3CkWA34JiIva4j4ir0H7ACyCGw0TJm6s+udTzLOMJY8D/hvvmCcyRL28XzSZSrfN70RRAmoWObbq
We0=
=RzYV
-----END PGP SIGNATURE-----

--------------H9eNiOblPZoKsuUT0WHkP1tw--
