Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E964927FA
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jan 2022 15:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243112AbiAROGD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jan 2022 09:06:03 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:36570 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243067AbiAROGC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jan 2022 09:06:02 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E26AC1F3C0;
        Tue, 18 Jan 2022 14:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1642514760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xqqizyVth8QE6GcR+beSGMgvC3rxC2rPWzN1nTgoWUY=;
        b=z1pFeee6N2y3meOKnagXoYywjFkfX5Ma4uPFedHyqjsCuR5xCtjr4lgH5soq71/QgYRZgR
        xHYFqHk3EI3H4aPK+JYMiWoRGwd3eQFSX39uqP8uZZTKWegP9wBf++gkjS+5n83HLbRgS7
        bvGhwrcsbGLCq6x+CBbID/73x+xco9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1642514760;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xqqizyVth8QE6GcR+beSGMgvC3rxC2rPWzN1nTgoWUY=;
        b=y86GxDamZTAZLkANDo7sdT91KuqYk4Ad0efuqopDMsi8103FI05PIcv9l64A+pcDJn45B8
        hxTnncqAbP0fMUAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C186913AAB;
        Tue, 18 Jan 2022 14:06:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0j4tLkjJ5mE4LgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 18 Jan 2022 14:06:00 +0000
Message-ID: <ca5c9eec-fbfd-8f2e-bf70-1d7ce3d7cc6f@suse.de>
Date:   Tue, 18 Jan 2022 15:06:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>
Cc:     Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87bl0amc6s.fsf@x1.stackframe.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FErHTBa50EUfWbOT7y8qREEK"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FErHTBa50EUfWbOT7y8qREEK
Content-Type: multipart/mixed; boundary="------------3Xg6ANbRF05J01BVVXFnqXXI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sven Schnelle <svens@stackframe.org>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <ca5c9eec-fbfd-8f2e-bf70-1d7ce3d7cc6f@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org>
In-Reply-To: <87bl0amc6s.fsf@x1.stackframe.org>

--------------3Xg6ANbRF05J01BVVXFnqXXI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDEuMjIgdW0gMTk6NDcgc2NocmllYiBTdmVuIFNjaG5lbGxlOg0KPiBI
aSBUaG9tYXMsDQo+IA0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4+IEhpDQo+Pg0KPj4gQW0gMTQuMDEuMjIgdW0gMTk6MTEgc2No
cmllYiBIZWxnZSBEZWxsZXI6DQo+Pj4gVGhlIGZiZGV2IGxheWVyIGlzIG9ycGhhbmVkLCBi
dXQgc2VlbXMgdG8gbmVlZCBzb21lIGNhcmUuDQo+Pj4gU28gSSdkIGxpa2UgdG8gc3RlcCB1
cCBhcyBuZXcgbWFpbnRhaW5lci4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBIZWxnZSBEZWxsZXIg
PGRlbGxlckBnbXguZGU+DQo+Pg0KPj4gRmlyc3Qgb2YgYWxsLCB0aGFuayB5b3UgZm9yIHN0
ZXBwaW5nIHVwIHRvIG1haW50YWluIHRoZSBmYmRldg0KPj4gY29kZWJhc2UuIEl0IHJlYWxs
eSBuZWVkcyBzb21lb25lIGFjdGl2ZWx5IGxvb2tpbmcgYWZ0ZXIgaXQuDQo+Pg0KPj4gQW5k
IG5vdyBjb21lcyB0aGUgQlVULg0KPj4NCj4+IEkgd2FudCB0byBzZWNvbmQgZXZlcnl0aGlu
ZyBzYWlkIGJ5IERhbmlhbCBhbmQgSmF2aWVyLiBJbiBhZGRpdGlvbiB0bw0KPj4gcHVyZWx5
IG9yZ2FuaXphdGlvbmFsIHRvcGljcyAodHJlZXMsIFBScywgZXRjKSwgdGhlcmUgYXJlIGEg
bnVtYmVyIG9mDQo+PiBpbmhlcml0IHByb2JsZW1zIHdpdGggZmJkZXYuDQo+Pg0KPj4gICAq
IEl0J3MgOTBzIHRlY2hub2xvZ3kuIE5laXRoZXIgZG9lcyBpdCBmaXQgdG9kYXkncyB1c2Vy
c3BhY2UsIG5vdA0KPj4gICAgIGhhcmR3YXJlLiBJZiB5b3UgaGF2ZSBtb3JlIHRoYW4ganVz
dCB0aGUgbW9zdCB0cml2aWFsIG9mIGdyYXBoaWNhbA0KPj4gICAgIG91dHB1dCBmYmRldiBp
c24ndCBmb3IgeW91Lg0KPj4NCj4+ICAgKiBUaGVyZSdzIG5vIG5ldyBkZXZlbG9wbWVudCBp
biBmYmRldiBhbmQgdGhlcmUgYXJlIG5vIG5ldw0KPj4gICAgIGRyaXZlcnMuIEV2ZXJ5b25l
IHdvcmtzIG9uIERSTSwgd2hpY2ggaXMgYmV0dGVyIGluIG1vc3QNCj4+ICAgICByZWdhcmRz
LiBUaGUgY29uc2VxdWVuY2UgaXMgdGhhdCB1c2Vyc3BhY2UgaXMgc2xvd2x5IGxvb3Npbmcg
dGhlDQo+PiAgICBhYmlsaXR5IHRvIHVzZSBmYmRldi4NCj4gDQo+IFRoYXQgbWlnaHQgYmUg
Y2F1c2VkIGJ5IHRoZSBmYWN0IHRoYXQgbm8gbmV3IGRyaXZlcnMgYXJlIGFjY2VwdGVkIGZv
cg0KDQpBbmQgdGhhdCBpcyBjYXVzZWQgYnkgdGhlIGZhY3QgdGhhdCBmYmRldiBpcyBub3do
ZXJlIHVwIHRvIHRvZGF5cyANCnJlcXVpcmVtZW50cy4NCg0KPiBmYmRldi4gSSB3cm90ZSBh
IGRyaXZlciBmb3IgdGhlIEhQIFZpc3VhbGl6ZSBGWDUvMTAgY2FyZHMgZW5kIG9mIGxhc3QN
Cj4geWVhciB3aGljaCB3YXMgcmVqZWN0ZWQgZm9yIGluY2x1c2lvbiBpbnRvIGZiZGV2WzFd
Lg0KDQpZZXAsIEkgd2FzIGhvcGluZyBmb3IgYSByZXBseS4NCg0KPiANCj4gQmFzZWQgb24g
eW91ciByZWNvbW1lbmRhdGlvbiBpIHJlLXdyb3RlIHRoZSB3aG9sZSB0aGluZyBpbiBEUk0u
IFRoaXMNCj4gd29ya3MgYnV0IGhhcyBzZXZlcmFsIGRyYXdiYWNrczoNCj4gDQo+IC0gbm8g
bW9kZXNldHRpbmcuIFdpdGggZmJkZXYsIGkgY2FuIG5pY2VseSBzd2l0Y2ggcmVzb2x1dGlv
bnMgd2l0aA0KPiAgICBmYnNldC4gVGhhdCBkb2Vzbid0IHdvcmssIGFuZCBpJ3ZlIGJlZW4g
dG9sZCB0aGF0IHRoaXMgaXMgbm90IHN1cHBvcnRlZFsyXQ0KDQpJIGRpZG4ndCBzYXkgdGhh
dCB3ZSdyZSBub3QgZ29pbmcgdG8gc3VwcG9ydCBpdCBhdCBhbGwuIEl0J3MganVzdCBub3Qg
DQpzdXBwb3J0ZWQgYXQgdGhlIG1vbW9udC4gdm13Z2Z4IGhhcyBtb2Rlc2V0dGluZyBjb2Rl
IHRoYXQgY2FuIHNlcnZlIGFzIA0Kc3RhcnRpbmcgcG9pbnQuDQoNCj4gDQo+IC0gSXQgaXMg
Km11Y2gqIHNsb3dlciB0aGFuIGZic2V0IHdpdGggaGFyZHdhcmUgYmxpdHRpbmcuIEkgd291
bGQgaGF2ZSB0bw0KPiAgICBkaWcgb3V0IHRoZSBudW1iZXJzLCBidXQgaXQncyBpbiB0aGUg
cmF0aW8gb2YgMToxNS4gVGhlIG5pY2UgdGhpbmcNCj4gICAgd2l0aCBmYmRldiBibGl0dGlu
ZyBpcyB0aGF0IGkgZ2V0IGFuIGFycmF5IG9mIHBpeGVscyBhbmQgdGhlDQo+ICAgIGZvcmVn
cm91bmQvYmFja2dyb3VuZCBjb2xvcnMgYWxsIG9mIHRoZXNlIHRoZXNlIHBpeGVscyBzaG91
bGQgaGF2ZS4NCj4gICAgV2l0aCB0aGUgaGVscCBvZiB0aGUgaGFyZHdhcmUgYmxpdHRpbmcs
IGkgY2FuIHdyaXRlIDMyIHBpeGVscyBhdCBvbmNlDQo+ICAgIHdpdGggZXZlcnkgMzItYml0
IHRyYW5zZmVyLg0KDQpGb3IgY29tcGFyaXNvbiwgaG93IGZhc3QgaXMgZmJkZXYgd2l0aCBw
bGFpbiBtZW1jcHkoKSBhbmQgbWVtc2V0KCk/DQoNCg0KPiANCj4gICAgV2l0aCBEUk0sIHRo
ZSBjbG9zZXN0IGkgY291bGQgZmluZCB3YXMgRFJNX0ZPUk1BVF9DOCwgd2hpY2ggbWVhbnMg
b25lDQo+ICAgIGJ5dGUgcGVyIHBpeGVsLiBTbyBpIGNhbiBwdXQgNCBwaXhlbHMgaW50byBv
bmUgMzItYml0IHRyYW5zZmVyLg0KDQpJSVJDIHRoZSBoYXJkd2FyZSBvbmx5IHN1cHBvcnRl
ZCA4LWJpdCBwYWxldHRlIGNvbG9ycywgc28gQzggd2FzIHRoZSANCmNvcnJlY3QgY2hvaWNl
LiBPdGhlcndpc2UsIHlvdSBjYW4gYWRkIG5ldyBmb3JtYXRzIGFuZCBhZGQgdGhlbSB0byB0
aGUgDQpjb25zb2xlLg0KDQo+IA0KPiAgICBmYmRldiBhbHNvIGNsZWFycyB0aGUgbGluZXMg
d2l0aCBoYXJkd2FyZSBibGl0dGluZywgd2hpY2ggaXMgbXVjaA0KPiAgICBmYXN0ZXIgdGhh
biBjbGVhcmluZyBpdCB3aXRoIG1lbWNweS4NCj4gDQo+ICAgIEJhc2VkIG9uIHlvdXIgcmVj
b21tZW5kYXRpb24gaSBhbHNvIHZlcmlmaWVkIHRoYXQgcGNpIGNvYWxlc2NpbmcgaXMNCj4g
ICAgZW5hYmxlZC4NCj4gDQo+ICAgIFRoZXNlIG51bWJlcnMgYXJlIHdpdGggRFJNJ3MgdW5u
YXR1cmFsIHNjcm9sbGluZyBiZWhhdmlvdXIgLSBpdCBzZWVtcw0KPiAgICB0byBzY3JvbGwg
c2V2ZXJhbCAodGV4dClsaW5lcyBhdCBvbmNlIGlmIGl0IHRha2VzIHRvIG11Y2ggdGltZS4g
SQ0KPiAgICBndWVzcyBpZiBEUk0gd291bGQgc2Nyb2xsIGxpbmUgYnkgbGluZSBpdCB3b3Vs
ZCBiZSBldmVuIHNsb3dlci4NCj4gDQo+ICAgIElmIERSTSB3b3VsZCBhZGQgdGhvc2UgdGhp
bmdzIC0gaGFyZHdhcmUgY2xlYXJpbmcgb2YgbWVtb3J5IHJlZ2lvbnMsDQo+ICAgIGh3IGJs
aXR0aW5nIGZvciB0ZXh0IHdpdGggYSBGRy9CRyBjb2xvciBhbmQgbW9kZXNldHRpbmcgaSB3
b3VsZG4ndA0KPiAgICBjYXJlIGFib3V0IGZiZGV2IGF0IGFsbC4gQnV0IHJpZ2h0IG5vdywg
aXQncyB3b3JraW5nIHdheSBmYXN0ZXIgZm9yIG1lLg0KDQpJIGFkbWl0IHRoYXQgeW91ciBo
YXJkd2FyZSBpcyBhdCB0aGUgZWRnZSBvZiB3aGF0IERSTSBjdXJyZW50bHkgDQpzdXBwb3J0
cy4gQnV0IEkndmUgdXNlZCBzb21lIG9mIHRoZSBEUk0gc3R1ZmYgb24gQXRobG9uIFhQcyB3
aXRoIFBDSSANCmdyYXBoaWNzLiBXaGlsZSB0aGUgcGVyZm9ybWFuY2Ugd2Fzbid0IGdvb2Qs
IGl0IHdhcyBmYXIgZnJvbSB1bnVzYWJsZS4NCg0KSSBndWVzcyB5b3UgdXNlZCBHRU0gU0hN
RU0gZm9yIG1lbW9yeSBidWZmZXJzLiBmYmRldiBhbmQgbW1hcCB3aXRoIHNobWVtIA0KcGFn
ZXMgdXNlIHNvbWUgb2YgdGhlIHNhbWUgYml0cyBpbiBzdHJ1Y3QgcGFnZSwgc28gc2htZW0g
Y2Fubm90IG1tYXAgDQppdCdzIHBhZ2VzIGRpcmVjdGx5LiBXZSBoYXZlIHRvIHVzZSBhbiBh
ZGRpdGlvbmFsIHNoYWRvdyBidWZmZXIuIEFueSANCmRpc3BsYXkgdXBkYXRlIGdvZXMgZnJv
bSB0aGUgc2hhZG93IGJ1ZmZlciBpbnRvIHRoZSBzaG1lbSBidWZmZXIgYW5kIA0KaW50byB0
aGUgdmlkZW9yYW0uIFRoYXQncyB0d28gbWVtY3B5cy4gVGhpcyBjYW4gYmUgcmVkdWNlZCB0
byBvbmUgDQptZW1jcHksIGJ1dCB3ZSBuZXZlciBoYWQgdGhlIHJlcXVpcmVtZW50IHRvIGRv
IHNvLg0KDQpUaGVyZSdzIGFsc28gcG90ZW50aWFsIGZvciByZWR1Y2luZyB0aGUgYW1vdW50
IG9mIHBhZ2UgDQptYXBwaW5ncy91bm1hcHBpbmdzIHdpdGggZ2VtIHNobWVtLg0KDQpBbmQg
RFJNIHN1cHBvcnRzIHNoYWRvdyBidWZmZXJzLCB2aXJ0dWFsIHNjcmVlbiBzaXplcyBhbmQg
ZGFtYWdlIA0KaGFuZGxpbmcgaW4gRFJNLiBBIHNvcGhpc3RpY2F0ZWQgZHJpdmVyIG1pZ2h0
IGJlIGFibGUgdG8gdXNlIHNoYWRvdyANCmJ1ZmZlcmluZywgZGFtYWdlIGhhbmRsaW5nIGFu
ZCBoYXJkd2FyZSBwYW5uaW5nIHRvIHJlZHVjZSB0aGUgYW1vdW50IG9mIA0Kc2NyZWVuIHVw
ZGF0ZXMgdG8gYSBtaW5pbXVtLg0KDQpVbnRpbCB0aGVzZSB0aGluZ3MgYXJlIGZpeGVkLCBh
ZGRpbmcgaGFyZHdhcmUgYmxpdHRpbmcgZG9lc24ndCByZWFsbHkgDQptYWtlIHNlbnNlIElN
SE8uDQoNCkFzIHdpdGggb3RoZXIgdGhpbmdzLCB3ZSBkaWRuJ3QgaGF2ZSBhIHJlcXVpcmVt
ZW50IGZvciBhbGwgdGhlc2UgDQpvcHRpbWl6YXRpb25zIHNvIGZhci4gQSB1c3VhbGx5IGdv
b2QgYXBwcm9hY2ggdG8gaW1wcm92ZSB0aGUgc2l0dXRpb24gaXMgDQp0byBnZXQgYSBiYXNp
YyBkcml2ZXIgbWVyZ2VkIGFuZCB0aGVuIGFkZHJlc3MgdGhlIHByb2JsZW1zIG9uZSBieSBv
bmUuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KDQo+IA0KPiBJIGFsc28gdGVzdGVk
IHRoZSBzcGVlZCBvbiBteSBUaGlua3BhZCBYMSB3aXRoIEludGVsIGdyYXBoaWNzLCBhbmQg
dGhlcmUNCj4gYSBkbWVzZyB3aXRoIDkxOSBsaW5lcyBvbmUgdGhlIHRleHQgY29uc29sZSB0
b29rIGFib3V0IDJzIHRvIGRpc3BsYXkuIEluDQo+IHgxMSwgaSBtZWFzdXJlIDIybXMuIFRo
aXMgbWlnaHQgYmUgdW5mYWlyIGJlY2F1c2UgZW5jb2RpbmcgbWlnaHQgYmUNCj4gZGlmZmVy
ZW50LCBidXQgaSBjYW5ub3QgY29uZmlybSB0aGUgJ21lbWNweScgaXMgZmFzdGVyIHRoYW4g
aGFyZHdhcmUNCj4gYmxpdHRpbmcnIHBvaW50LiBJIHRoaW5rIGlmIHRoYXQgd291bGQgYmUg
dGhlIGNhc2UsIG5vLW9uZSB3b3VsZCBjYXJlDQo+IGFib3V0IDJEIGFjY2VsZXJhdGlvbi4N
Cj4gDQo+IERvbid0IGdldCBtZSB3cm9uZywgaSdtIG5vdCBzYXlpbmcgdGhlcmUncyBubyBy
ZWFzb24gZm9yIERSTS4gSSBmdWxseQ0KPiB1bmRlcnN0YW5kIHdoeSBpdCBleGlzdHMgYW5k
IHRoaW5rIGl0J3MgYSBnb29kIHdheSB0byBnby4gQnV0IGZvciBzeXN0ZW0NCj4gd2hlcmUg
YSAoZmFzdCkgbG9jYWwgY29uc29sZSBpcyByZXF1aXJlZCB3aXRob3V0IFgxMSwgZmJkZXYg
bWlnaHQgYmUgdGhlDQo+IGJldHRlciBjaG9pY2UgYXQgdGhlIG1vbWVudC4NCj4gDQo+IFJl
Z2FyZHMNCj4gU3Zlbg0KPiANCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC84
N2VlN3F2Y2M3LmZzZkB4MS5zdGFja2ZyYW1lLm9yZy9ULyNtNTdjZGVhODM2MDhmYzc4YmZj
NmMyZTc2ZWIwMzdiZjgyMDE3YjMwMg0KPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzg3ZWU3cXZjYzcuZnNmQHgxLnN0YWNrZnJhbWUub3JnL1QvI200NmE1MjgxNTAzNmE5
NThmNmExMWQyZjNmNjJlMTM0MGEwOWJkOTgxDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------3Xg6ANbRF05J01BVVXFnqXXI--

--------------FErHTBa50EUfWbOT7y8qREEK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHmyUgFAwAAAAAACgkQlh/E3EQov+D8
cBAA0SatFQLUmy3bbcozi7Ubbmg/dGQneg/RLqi1CRQNKts753pA3sz9KQ9Vy9BkcefCbH+AjdUq
PiObPcr7RAy+6GR1jqG+Ygp9sFv/At+JkTyAvJBdHm1GTtikimp6NtKvVMcb3ng3J5kwruJvWh3T
SVqTDBOkhwL64d/gu5CKdonBi/G/5FkkLLNZzvIRCEv2wzlyWzQwzTCMoyO8w4UMzqIr5sBQeJIA
xirGGnAGu/MkV9NqhGEHVscvdZLNGrqVfLarCAGJbw2nwcLbICl07AMJBnheZ+UHki4BQKageEcn
TELZoKoMORyf/HrQKtyFeMyoQmOGGPdWRF+nEWCRha30mDgfHwBuiz5iMDfv0XbCnYY7WTNds61L
rBq31vDx7esKqou7qczotuv3Z+RkqG9kaVRRQcwkLvHlpHbWXxKiedYPwsWKpkuAkSlXOPsokhP6
ui4rlYu504URUdp7NRnTckE0/lcOfSkAe7CnnMcbj6lCNX0xEsQGRylnT5XAXe8mS5iru5hFX+4C
khmSgO9L53JVG+N3L5isuHwo1B2Sme1YvLCvHKpRY1SxV0XngpcPsMR0v4Dl6AokNGXT5Dxp24W9
veWnrvCUKj3J94bmci6OT5MmZQU3prjWJmSLtA3lcaujru1TkEbVMj6oWGcwQojbAEg8Y0iUry8f
qm0=
=7Wbi
-----END PGP SIGNATURE-----

--------------FErHTBa50EUfWbOT7y8qREEK--
