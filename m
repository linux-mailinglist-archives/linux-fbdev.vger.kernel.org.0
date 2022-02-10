Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE1E4B0C20
	for <lists+linux-fbdev@lfdr.de>; Thu, 10 Feb 2022 12:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238715AbiBJLRl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 10 Feb 2022 06:17:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240741AbiBJLRk (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 10 Feb 2022 06:17:40 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0151EBB1;
        Thu, 10 Feb 2022 03:17:41 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id A3E3B21117;
        Thu, 10 Feb 2022 11:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644491860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8cZDWJbt5L6qF0rGWVkBN5UTVjbzmBbR0z7IBRsGyBo=;
        b=s4vGnrDq6el9hJEM1yqWgxR5V1J9Gi65HzyK7zSVjXHycheJHuHZi577sL0fw/OuFy00lt
        56CVIyw8dIfa/L5zOnJ5RtPTsLGmUvypmVLDae9WM1L2n8rII2ojwsd02Jh41LxMGN7iD5
        lHfMveh+w6B6IHzz8kPFDcKxms/xi9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644491860;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8cZDWJbt5L6qF0rGWVkBN5UTVjbzmBbR0z7IBRsGyBo=;
        b=o7WseCoA7h9NXkt5ZsMCUDKknAs2dRzi3n23Iye6aWRnUFtqJl6Sg/Zf66NX4e6jelLv9z
        M5oewYPDuych3cBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6199913B43;
        Thu, 10 Feb 2022 11:17:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id TcDfFlT0BGKuCAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 10 Feb 2022 11:17:40 +0000
Message-ID: <4f7bf075-6844-28c9-0b23-4789c1023a08@suse.de>
Date:   Thu, 10 Feb 2022 12:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/19] fbcon: Move fbcon_bmove(_rec) functions
Content-Language: en-US
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>,
        Du Cheng <ducheng2@gmail.com>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Claudio Suarez <cssk@net-c.es>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-3-daniel.vetter@ffwll.ch>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220208210824.2238981-3-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t8cEz0Ta0KueKhrrRnsYpLu0"
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
--------------t8cEz0Ta0KueKhrrRnsYpLu0
Content-Type: multipart/mixed; boundary="------------cNVXF0NGhwzmn3T8e7RLqhh0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>,
 Daniel Vetter <daniel@ffwll.ch>, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <4f7bf075-6844-28c9-0b23-4789c1023a08@suse.de>
Subject: Re: [PATCH v2 02/19] fbcon: Move fbcon_bmove(_rec) functions
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20220208210824.2238981-3-daniel.vetter@ffwll.ch>

--------------cNVXF0NGhwzmn3T8e7RLqhh0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA4LjAyLjIyIHVtIDIyOjA4IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gQXZv
aWRzIHR3byBmb3J3YXJkIGRlY2xhcmF0aW9ucywgYW5kIG1vcmUgaW1wb3J0YW50bHksIG1h
dGNoZXMgd2hhdA0KPiBJJ3ZlIGRvbmUgaW4gbXkgZmJjb24gc2Nyb2xsaW5nIHJlc3RvcmUg
cGF0Y2hlcyAtIHNvIEkgbmVlZCB0aGlzIHRvDQo+IGF2b2lkIGEgYnVuY2ggb2YgY29uZmxp
Y3RzIGluIHJlYmFzaW5nIHNpbmNlIHdlIGVuZGVkIHVwIG1lcmdpbmcNCj4gSGVsZ2UncyBz
ZXJpZXMgaW5zdGVhZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBDYzogSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214
LmRlPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPiBDYzogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IENjOiBEdSBDaGVuZyA8
ZHVjaGVuZzJAZ21haWwuY29tPg0KPiBDYzogVGV0c3VvIEhhbmRhIDxwZW5ndWluLWtlcm5l
bEBJLWxvdmUuU0FLVVJBLm5lLmpwPg0KPiBDYzogQ2xhdWRpbyBTdWFyZXogPGNzc2tAbmV0
LWMuZXM+DQo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMg
fCAxMzQgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA2NSBpbnNlcnRpb25zKCspLCA2OSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYmNvbi5jDQo+IGluZGV4IDIzNWVhYWIzN2Q4NC4uZTkyNWJiNjA4ZTI1
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYw0KPiAr
KysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYw0KPiBAQCAtMTY0LDE1ICsx
NjQsMTEgQEAgc3RhdGljIGludCBmYmNvbl9jdXJzb3Jfbm9ibGluazsNCj4gICAgKi8NCj4g
ICANCj4gICBzdGF0aWMgdm9pZCBmYmNvbl9jbGVhcl9tYXJnaW5zKHN0cnVjdCB2Y19kYXRh
ICp2YywgaW50IGJvdHRvbV9vbmx5KTsNCj4gLXN0YXRpYyB2b2lkIGZiY29uX2Jtb3ZlKHN0
cnVjdCB2Y19kYXRhICp2YywgaW50IHN5LCBpbnQgc3gsIGludCBkeSwgaW50IGR4LA0KPiAt
CQkJaW50IGhlaWdodCwgaW50IHdpZHRoKTsNCj4gICBzdGF0aWMgdm9pZCBmYmNvbl9zZXRf
cGFsZXR0ZShzdHJ1Y3QgdmNfZGF0YSAqdmMsIGNvbnN0IHVuc2lnbmVkIGNoYXIgKnRhYmxl
KTsNCj4gICANCj4gICAvKg0KPiAgICAqICBJbnRlcm5hbCByb3V0aW5lcw0KPiAgICAqLw0K
PiAtc3RhdGljIHZvaWQgZmJjb25fYm1vdmVfcmVjKHN0cnVjdCB2Y19kYXRhICp2Yywgc3Ry
dWN0IGZiY29uX2Rpc3BsYXkgKnAsIGludCBzeSwgaW50IHN4LA0KPiAtCQkJICAgIGludCBk
eSwgaW50IGR4LCBpbnQgaGVpZ2h0LCBpbnQgd2lkdGgsIHVfaW50IHlfYnJlYWspOw0KPiAg
IHN0YXRpYyB2b2lkIGZiY29uX3NldF9kaXNwKHN0cnVjdCBmYl9pbmZvICppbmZvLCBzdHJ1
Y3QgZmJfdmFyX3NjcmVlbmluZm8gKnZhciwNCj4gICAJCQkgICBpbnQgdW5pdCk7DQo+ICAg
c3RhdGljIHZvaWQgZmJjb25fcmVkcmF3X21vdmUoc3RydWN0IHZjX2RhdGEgKnZjLCBzdHJ1
Y3QgZmJjb25fZGlzcGxheSAqcCwNCj4gQEAgLTE2NjcsNiArMTY2Myw3MSBAQCBzdGF0aWMg
dm9pZCBmYmNvbl9yZWRyYXcoc3RydWN0IHZjX2RhdGEgKnZjLCBzdHJ1Y3QgZmJjb25fZGlz
cGxheSAqcCwNCj4gICAJfQ0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyB2b2lkIGZiY29uX2Jt
b3ZlX3JlYyhzdHJ1Y3QgdmNfZGF0YSAqdmMsIHN0cnVjdCBmYmNvbl9kaXNwbGF5ICpwLCBp
bnQgc3ksIGludCBzeCwNCj4gKwkJCSAgICBpbnQgZHksIGludCBkeCwgaW50IGhlaWdodCwg
aW50IHdpZHRoLCB1X2ludCB5X2JyZWFrKQ0KPiArew0KPiArCXN0cnVjdCBmYl9pbmZvICpp
bmZvID0gcmVnaXN0ZXJlZF9mYltjb24yZmJfbWFwW3ZjLT52Y19udW1dXTsNCj4gKwlzdHJ1
Y3QgZmJjb25fb3BzICpvcHMgPSBpbmZvLT5mYmNvbl9wYXI7DQo+ICsJdV9pbnQgYjsNCj4g
Kw0KPiArCWlmIChzeSA8IHlfYnJlYWsgJiYgc3kgKyBoZWlnaHQgPiB5X2JyZWFrKSB7DQo+
ICsJCWIgPSB5X2JyZWFrIC0gc3k7DQo+ICsJCWlmIChkeSA8IHN5KSB7CS8qIEF2b2lkIHRy
YXNoaW5nIHNlbGYgKi8NCj4gKwkJCWZiY29uX2Jtb3ZlX3JlYyh2YywgcCwgc3ksIHN4LCBk
eSwgZHgsIGIsIHdpZHRoLA0KPiArCQkJCQl5X2JyZWFrKTsNCj4gKwkJCWZiY29uX2Jtb3Zl
X3JlYyh2YywgcCwgc3kgKyBiLCBzeCwgZHkgKyBiLCBkeCwNCj4gKwkJCQkJaGVpZ2h0IC0g
Yiwgd2lkdGgsIHlfYnJlYWspOw0KPiArCQl9IGVsc2Ugew0KPiArCQkJZmJjb25fYm1vdmVf
cmVjKHZjLCBwLCBzeSArIGIsIHN4LCBkeSArIGIsIGR4LA0KPiArCQkJCQloZWlnaHQgLSBi
LCB3aWR0aCwgeV9icmVhayk7DQo+ICsJCQlmYmNvbl9ibW92ZV9yZWModmMsIHAsIHN5LCBz
eCwgZHksIGR4LCBiLCB3aWR0aCwNCj4gKwkJCQkJeV9icmVhayk7DQo+ICsJCX0NCj4gKwkJ
cmV0dXJuOw0KPiArCX0NCj4gKw0KPiArCWlmIChkeSA8IHlfYnJlYWsgJiYgZHkgKyBoZWln
aHQgPiB5X2JyZWFrKSB7DQo+ICsJCWIgPSB5X2JyZWFrIC0gZHk7DQo+ICsJCWlmIChkeSA8
IHN5KSB7CS8qIEF2b2lkIHRyYXNoaW5nIHNlbGYgKi8NCj4gKwkJCWZiY29uX2Jtb3ZlX3Jl
Yyh2YywgcCwgc3ksIHN4LCBkeSwgZHgsIGIsIHdpZHRoLA0KPiArCQkJCQl5X2JyZWFrKTsN
Cj4gKwkJCWZiY29uX2Jtb3ZlX3JlYyh2YywgcCwgc3kgKyBiLCBzeCwgZHkgKyBiLCBkeCwN
Cj4gKwkJCQkJaGVpZ2h0IC0gYiwgd2lkdGgsIHlfYnJlYWspOw0KPiArCQl9IGVsc2Ugew0K
PiArCQkJZmJjb25fYm1vdmVfcmVjKHZjLCBwLCBzeSArIGIsIHN4LCBkeSArIGIsIGR4LA0K
PiArCQkJCQloZWlnaHQgLSBiLCB3aWR0aCwgeV9icmVhayk7DQo+ICsJCQlmYmNvbl9ibW92
ZV9yZWModmMsIHAsIHN5LCBzeCwgZHksIGR4LCBiLCB3aWR0aCwNCj4gKwkJCQkJeV9icmVh
ayk7DQo+ICsJCX0NCj4gKwkJcmV0dXJuOw0KPiArCX0NCj4gKwlvcHMtPmJtb3ZlKHZjLCBp
bmZvLCByZWFsX3kocCwgc3kpLCBzeCwgcmVhbF95KHAsIGR5KSwgZHgsDQo+ICsJCSAgIGhl
aWdodCwgd2lkdGgpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBmYmNvbl9ibW92ZShz
dHJ1Y3QgdmNfZGF0YSAqdmMsIGludCBzeSwgaW50IHN4LCBpbnQgZHksIGludCBkeCwNCj4g
KwkJCWludCBoZWlnaHQsIGludCB3aWR0aCkNCj4gK3sNCj4gKwlzdHJ1Y3QgZmJfaW5mbyAq
aW5mbyA9IHJlZ2lzdGVyZWRfZmJbY29uMmZiX21hcFt2Yy0+dmNfbnVtXV07DQo+ICsJc3Ry
dWN0IGZiY29uX2Rpc3BsYXkgKnAgPSAmZmJfZGlzcGxheVt2Yy0+dmNfbnVtXTsNCj4gKw0K
PiArCWlmIChmYmNvbl9pc19pbmFjdGl2ZSh2YywgaW5mbykpDQo+ICsJCXJldHVybjsNCj4g
Kw0KPiArCWlmICghd2lkdGggfHwgIWhlaWdodCkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJ
LyogIFNwbGl0IGJsaXRzIHRoYXQgY3Jvc3MgcGh5c2ljYWwgeV93cmFwIGNhc2UuDQo+ICsJ
ICogIFBhdGhvbG9naWNhbCBjYXNlIGludm9sdmVzIDQgYmxpdHMsIGJldHRlciB0byB1c2Ug
cmVjdXJzaXZlDQo+ICsJICogIGNvZGUgcmF0aGVyIHRoYW4gdW5yb2xsZWQgY2FzZQ0KPiAr
CSAqDQo+ICsJICogIFJlY3Vyc2l2ZSBpbnZvY2F0aW9ucyBkb24ndCBuZWVkIHRvIGVyYXNl
IHRoZSBjdXJzb3Igb3ZlciBhbmQNCj4gKwkgKiAgb3ZlciBhZ2Fpbiwgc28gd2UgdXNlIGZi
Y29uX2Jtb3ZlX3JlYygpDQo+ICsJICovDQo+ICsJZmJjb25fYm1vdmVfcmVjKHZjLCBwLCBz
eSwgc3gsIGR5LCBkeCwgaGVpZ2h0LCB3aWR0aCwNCj4gKwkJCXAtPnZyb3dzIC0gcC0+eXNj
cm9sbCk7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgYm9vbCBmYmNvbl9zY3JvbGwoc3RydWN0
IHZjX2RhdGEgKnZjLCB1bnNpZ25lZCBpbnQgdCwgdW5zaWduZWQgaW50IGIsDQo+ICAgCQll
bnVtIGNvbl9zY3JvbGwgZGlyLCB1bnNpZ25lZCBpbnQgY291bnQpDQo+ICAgew0KPiBAQCAt
MTg2Nyw3MSArMTkyOCw2IEBAIHN0YXRpYyBib29sIGZiY29uX3Njcm9sbChzdHJ1Y3QgdmNf
ZGF0YSAqdmMsIHVuc2lnbmVkIGludCB0LCB1bnNpZ25lZCBpbnQgYiwNCj4gICB9DQo+ICAg
DQo+ICAgDQo+IC1zdGF0aWMgdm9pZCBmYmNvbl9ibW92ZShzdHJ1Y3QgdmNfZGF0YSAqdmMs
IGludCBzeSwgaW50IHN4LCBpbnQgZHksIGludCBkeCwNCj4gLQkJCWludCBoZWlnaHQsIGlu
dCB3aWR0aCkNCj4gLXsNCj4gLQlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IHJlZ2lzdGVyZWRf
ZmJbY29uMmZiX21hcFt2Yy0+dmNfbnVtXV07DQo+IC0Jc3RydWN0IGZiY29uX2Rpc3BsYXkg
KnAgPSAmZmJfZGlzcGxheVt2Yy0+dmNfbnVtXTsNCj4gLQ0KPiAtCWlmIChmYmNvbl9pc19p
bmFjdGl2ZSh2YywgaW5mbykpDQo+IC0JCXJldHVybjsNCj4gLQ0KPiAtCWlmICghd2lkdGgg
fHwgIWhlaWdodCkNCj4gLQkJcmV0dXJuOw0KPiAtDQo+IC0JLyogIFNwbGl0IGJsaXRzIHRo
YXQgY3Jvc3MgcGh5c2ljYWwgeV93cmFwIGNhc2UuDQo+IC0JICogIFBhdGhvbG9naWNhbCBj
YXNlIGludm9sdmVzIDQgYmxpdHMsIGJldHRlciB0byB1c2UgcmVjdXJzaXZlDQo+IC0JICog
IGNvZGUgcmF0aGVyIHRoYW4gdW5yb2xsZWQgY2FzZQ0KPiAtCSAqDQo+IC0JICogIFJlY3Vy
c2l2ZSBpbnZvY2F0aW9ucyBkb24ndCBuZWVkIHRvIGVyYXNlIHRoZSBjdXJzb3Igb3ZlciBh
bmQNCj4gLQkgKiAgb3ZlciBhZ2Fpbiwgc28gd2UgdXNlIGZiY29uX2Jtb3ZlX3JlYygpDQo+
IC0JICovDQo+IC0JZmJjb25fYm1vdmVfcmVjKHZjLCBwLCBzeSwgc3gsIGR5LCBkeCwgaGVp
Z2h0LCB3aWR0aCwNCj4gLQkJCXAtPnZyb3dzIC0gcC0+eXNjcm9sbCk7DQo+IC19DQo+IC0N
Cj4gLXN0YXRpYyB2b2lkIGZiY29uX2Jtb3ZlX3JlYyhzdHJ1Y3QgdmNfZGF0YSAqdmMsIHN0
cnVjdCBmYmNvbl9kaXNwbGF5ICpwLCBpbnQgc3ksIGludCBzeCwNCj4gLQkJCSAgICBpbnQg
ZHksIGludCBkeCwgaW50IGhlaWdodCwgaW50IHdpZHRoLCB1X2ludCB5X2JyZWFrKQ0KPiAt
ew0KPiAtCXN0cnVjdCBmYl9pbmZvICppbmZvID0gcmVnaXN0ZXJlZF9mYltjb24yZmJfbWFw
W3ZjLT52Y19udW1dXTsNCj4gLQlzdHJ1Y3QgZmJjb25fb3BzICpvcHMgPSBpbmZvLT5mYmNv
bl9wYXI7DQo+IC0JdV9pbnQgYjsNCj4gLQ0KPiAtCWlmIChzeSA8IHlfYnJlYWsgJiYgc3kg
KyBoZWlnaHQgPiB5X2JyZWFrKSB7DQo+IC0JCWIgPSB5X2JyZWFrIC0gc3k7DQo+IC0JCWlm
IChkeSA8IHN5KSB7CS8qIEF2b2lkIHRyYXNoaW5nIHNlbGYgKi8NCj4gLQkJCWZiY29uX2Jt
b3ZlX3JlYyh2YywgcCwgc3ksIHN4LCBkeSwgZHgsIGIsIHdpZHRoLA0KPiAtCQkJCQl5X2Jy
ZWFrKTsNCj4gLQkJCWZiY29uX2Jtb3ZlX3JlYyh2YywgcCwgc3kgKyBiLCBzeCwgZHkgKyBi
LCBkeCwNCj4gLQkJCQkJaGVpZ2h0IC0gYiwgd2lkdGgsIHlfYnJlYWspOw0KPiAtCQl9IGVs
c2Ugew0KPiAtCQkJZmJjb25fYm1vdmVfcmVjKHZjLCBwLCBzeSArIGIsIHN4LCBkeSArIGIs
IGR4LA0KPiAtCQkJCQloZWlnaHQgLSBiLCB3aWR0aCwgeV9icmVhayk7DQo+IC0JCQlmYmNv
bl9ibW92ZV9yZWModmMsIHAsIHN5LCBzeCwgZHksIGR4LCBiLCB3aWR0aCwNCj4gLQkJCQkJ
eV9icmVhayk7DQo+IC0JCX0NCj4gLQkJcmV0dXJuOw0KPiAtCX0NCj4gLQ0KPiAtCWlmIChk
eSA8IHlfYnJlYWsgJiYgZHkgKyBoZWlnaHQgPiB5X2JyZWFrKSB7DQo+IC0JCWIgPSB5X2Jy
ZWFrIC0gZHk7DQo+IC0JCWlmIChkeSA8IHN5KSB7CS8qIEF2b2lkIHRyYXNoaW5nIHNlbGYg
Ki8NCj4gLQkJCWZiY29uX2Jtb3ZlX3JlYyh2YywgcCwgc3ksIHN4LCBkeSwgZHgsIGIsIHdp
ZHRoLA0KPiAtCQkJCQl5X2JyZWFrKTsNCj4gLQkJCWZiY29uX2Jtb3ZlX3JlYyh2YywgcCwg
c3kgKyBiLCBzeCwgZHkgKyBiLCBkeCwNCj4gLQkJCQkJaGVpZ2h0IC0gYiwgd2lkdGgsIHlf
YnJlYWspOw0KPiAtCQl9IGVsc2Ugew0KPiAtCQkJZmJjb25fYm1vdmVfcmVjKHZjLCBwLCBz
eSArIGIsIHN4LCBkeSArIGIsIGR4LA0KPiAtCQkJCQloZWlnaHQgLSBiLCB3aWR0aCwgeV9i
cmVhayk7DQo+IC0JCQlmYmNvbl9ibW92ZV9yZWModmMsIHAsIHN5LCBzeCwgZHksIGR4LCBi
LCB3aWR0aCwNCj4gLQkJCQkJeV9icmVhayk7DQo+IC0JCX0NCj4gLQkJcmV0dXJuOw0KPiAt
CX0NCj4gLQlvcHMtPmJtb3ZlKHZjLCBpbmZvLCByZWFsX3kocCwgc3kpLCBzeCwgcmVhbF95
KHAsIGR5KSwgZHgsDQo+IC0JCSAgIGhlaWdodCwgd2lkdGgpOw0KPiAtfQ0KPiAtDQo+ICAg
c3RhdGljIHZvaWQgdXBkYXRlc2Nyb2xsbW9kZV9hY2NlbChzdHJ1Y3QgZmJjb25fZGlzcGxh
eSAqcCwNCj4gICAJCQkJCXN0cnVjdCBmYl9pbmZvICppbmZvLA0KPiAgIAkJCQkJc3RydWN0
IHZjX2RhdGEgKnZjKQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------cNVXF0NGhwzmn3T8e7RLqhh0--

--------------t8cEz0Ta0KueKhrrRnsYpLu0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIE9FMFAwAAAAAACgkQlh/E3EQov+Cj
sRAAvEq0nTJ3HKdRxAk3TwaJBUamORFWX4z2vU0oirjwviX3ysylIj8cHA3+GyrSTnS4msY33+8+
mkVs/61FAGDX4gjFN90cA0alKcK7oOOY0BzhW5QN2BstjibsVCIhLfhtiSwxkDU+9Oj6Mq6GEznY
et+zkWGAt6AgtKw3vhYnKYj9MxFNMBeW5cXRwTqQPmiLAq98E5D92uJ23ANDO7yBq7ttO4yvveQ5
bQ99L07deDnN4bEfW+W72oRNhZK1D6XELTIyl6JIQ5WgTHC7fyPgNv+SyU+MKktTEMlxgtz4fmf9
29aM4DlFS4UzwOSRWuD6oRI6xluxciMaVlkPlHIq9SfQh34uQJ7gEgnkhE0jDyHgHxVYS6Ar+DYZ
2vH0DVeKT+HZ+InV/8l56N5f/dSu4m4+W3ZmTE2VX2cvK729lF7oQuppzcjF4Am9Da69rb2zJlKH
a0nC6pvgruN8rdZUkas4+t2PQVwg9Jl8TdTxWeNElMokdlOW6JpK2oJs8GbjT3zmrgI1T6a5KFdA
yUWO3mwjw7uTWJf8O7OmJiPan3mx0IdMRjDfHb6NOhs0dCdmwXawhSYipOB0VRn6TVUb4Bde2Lko
8HJ+wrKg9hljBdSaPgyX++BhRGdrPQkjM4YzgV9PGNTaJMFuG9sZrPGi1gL8qRqHi0dLBY+UpTct
N8E=
=lgdA
-----END PGP SIGNATURE-----

--------------t8cEz0Ta0KueKhrrRnsYpLu0--
