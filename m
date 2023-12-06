Return-Path: <linux-fbdev+bounces-345-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A10A806A27
	for <lists+linux-fbdev@lfdr.de>; Wed,  6 Dec 2023 09:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C82BB2819F1
	for <lists+linux-fbdev@lfdr.de>; Wed,  6 Dec 2023 08:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466B4199A3;
	Wed,  6 Dec 2023 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qj2L+oNH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GtZKpC6E"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D32C386E
	for <linux-fbdev@vger.kernel.org>; Wed,  6 Dec 2023 00:50:37 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C01961FB8D;
	Wed,  6 Dec 2023 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1701852633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4G5btkfl0NCKp0Uc/dQ0ZY7HVWzjMtgeQM36eIvZnow=;
	b=Qj2L+oNH1hDjZ/gscEznKIJ4xUAT9JVn6vLdb6UURKXCK2qfG+ibK8hQBs9IDQfFiLWDp8
	csN3HC/FQHDK5E14qQgKe+R686dnCENTVY9sV9ar4zv7pTg+qPU44SvzfhT++ChnO4GOBC
	xyLTKIvGU22In3TWvXEGyJ6NsGnux+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701852633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4G5btkfl0NCKp0Uc/dQ0ZY7HVWzjMtgeQM36eIvZnow=;
	b=GtZKpC6EvwNlz18Mpym8M3YHmCYKk+6ZTP+Or6bgSugcV3So/kanzqPlXqtcK7UZXQli7D
	PY5Q3UtFJMlWSlDw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 87B4813403;
	Wed,  6 Dec 2023 08:50:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id XH2qHtk1cGUbKQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 06 Dec 2023 08:50:33 +0000
Message-ID: <79a1748d-e3ef-47e6-a9fd-a514a3974c55@suse.de>
Date: Wed, 6 Dec 2023 09:50:31 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2, 1/4] fbdev/efifb: Replace references to global screen_info
 by local pointer
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com, deller@gmx.de,
 pjones@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20231204092812.2612-2-tzimmermann@suse.de>
 <2f6909a7-21a2-4ffc-84bf-962132a9f9b4@linux.dev>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <2f6909a7-21a2-4ffc-84bf-962132a9f9b4@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RtkiQoezC6rbLfURESsNMxLX"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.28
X-Spamd-Result: default: False [-5.28 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.19)[-0.944];
	 MIME_BASE64_TEXT(0.10)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,loongson.cn:email];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[linux.dev,redhat.com,gmx.de];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RtkiQoezC6rbLfURESsNMxLX
Content-Type: multipart/mixed; boundary="------------NCIzK9o0Pc5MvenHvKMU9ZQQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com, deller@gmx.de,
 pjones@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <79a1748d-e3ef-47e6-a9fd-a514a3974c55@suse.de>
Subject: Re: [v2, 1/4] fbdev/efifb: Replace references to global screen_info
 by local pointer
References: <20231204092812.2612-2-tzimmermann@suse.de>
 <2f6909a7-21a2-4ffc-84bf-962132a9f9b4@linux.dev>
In-Reply-To: <2f6909a7-21a2-4ffc-84bf-962132a9f9b4@linux.dev>

--------------NCIzK9o0Pc5MvenHvKMU9ZQQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMTIuMjMgdW0gMjA6NTMgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gDQo+IE9uIDIwMjMvMTIvNCAxNzoyNywgVGhvbWFzIFppbW1lcm1hbm4gd3Jv
dGU6DQo+PiBHZXQgdGhlIGdsb2JhbCBzY3JlZW5faW5mbydzIGFkZHJlc3Mgb25jZSBhbmQg
YWNjZXNzIHRoZSBkYXRhIHZpYQ0KPj4gdGhpcyBwb2ludGVyLiBMaW1pdHMgdGhlIHVzZSBv
ZiBnbG9iYWwgc3RhdGUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTog
U3VpIEppbmdmZW5nIDxzdWlqaW5nZmVuZ0Bsb29uZ3Nvbi5jbj4NCj4gDQo+IA0KPiBJIGhh
dmUgYXBwbGllZCB0aGUgd2hvbGUgc2VyaWVzIGFuZCBkbyBhIHNpbXBsZSB0ZXN0IHdpdGgg
ZWZpZmI6DQo+IFllYWgsIHN0aWxsIHdvcmtzIQ0KPiANCj4gJCBkbWVzZyB8IGdyZXAgZWZp
ZmINCj4gDQo+IFvCoMKgwqAgMC4zNzM4MDBdIGVmaWZiOiBwcm9iaW5nIGZvciBlZmlmYg0K
PiBbwqDCoMKgIDAuMzczODE2XSBlZmlmYjogZnJhbWVidWZmZXIgYXQgMHhlMDAzMDAwMDAw
MCwgdXNpbmcgNTEyMGssIHRvdGFsIA0KPiA1MTIwaw0KPiBbwqDCoMKgIDAuMzczODE4XSBl
ZmlmYjogbW9kZSBpcyAxMjgweDEwMjR4MzIsIGxpbmVsZW5ndGg9NTEyMCwgcGFnZXM9MQ0K
PiBbwqDCoMKgIDAuMzczODIwXSBlZmlmYjogc2Nyb2xsaW5nOiByZWRyYXcNCj4gW8KgwqDC
oCAwLjM3MzgyMV0gZWZpZmI6IFRydWVjb2xvcjogc2l6ZT04Ojg6ODo4LCBzaGlmdD0yNDox
Njo4OjANCj4gDQo+IA0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZi
LmMgfCAxMTMgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0pDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvZWZpZmIuYw0KPj4gaW5kZXggZjliNGRkZDU5MmNlNC4uNmNiYjY1YmJl
MTExMCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYw0KPj4g
KysrIGIvZHJpdmVycy92aWRlby9mYmRldi9lZmlmYi5jDQo+PiBAQCAtMTQ3LDEwICsxNDcs
OSBAQCBzdGF0aWMgYm9vbCBlZmlmYl9iZ3J0X3Nhbml0eV9jaGVjayhzdHJ1Y3QgDQo+PiBz
Y3JlZW5faW5mbyAqc2ksIHUzMiBibXBfd2lkdGgpDQo+PiDCoCB9DQo+PiDCoCAjZW5kaWYN
Cj4+IC1zdGF0aWMgdm9pZCBlZmlmYl9zaG93X2Jvb3RfZ3JhcGhpY3Moc3RydWN0IGZiX2lu
Zm8gKmluZm8pDQo+PiArc3RhdGljIHZvaWQgZWZpZmJfc2hvd19ib290X2dyYXBoaWNzKHN0
cnVjdCBmYl9pbmZvICppbmZvLCBzdHJ1Y3QgDQo+PiBzY3JlZW5faW5mbyAqc2kpDQo+IA0K
PiBJIHRoaW5rLCB3ZSBwcm9iYWJseSBjYW4gYWRkIGEgY29uc3QgbW9kaWZpZXIgZm9yIHRo
ZSBmdW5jdGlvbg0KPiB3aGljaCBkb2Vzbid0IG1vZGlmeSBvdXIgbG9jYWwgdGhlIHNjcmVl
bl9pbmZvIGluc3RhbmNlIGluIHRoZSBmdXR1cmUuDQoNCkdvb2QgcG9pbnQuIEFsbCBvdXIg
c291cmNlIGNvZGUgaXMgdHJhZGl0aW9uYWxseSBzbG9wcHkgd2l0aCBjb25zdCANCmNvcnJl
Y3RuZXNzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBzdGF0aWMgdm9pZCBl
ZmlmYl9zaG93X2Jvb3RfZ3JhcGhpY3Moc3RydWN0IGZiX2luZm8gKmluZm8sIGNvbnN0IHN0
cnVjdCANCj4gc2NyZWVuX2luZm8gKnNpKQ0KPiANCj4gU2luY2Ugc2NyZWVuX2luZm8gaXMg
bW9zdGx5IHVzZWQgdG8gcHJvdmlkZSBpbmZvcm1hdGlvbi4NCj4gDQo+IA0KPj4gwqAgew0K
Pj4gwqDCoMKgwqDCoCB1MzIgYm1wX3dpZHRoLCBibXBfaGVpZ2h0LCBibXBfcGl0Y2gsIGRz
dF94LCB5LCBzcmNfeTsNCj4+IC3CoMKgwqAgc3RydWN0IHNjcmVlbl9pbmZvICpzaSA9ICZz
Y3JlZW5faW5mbzsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGJtcF9maWxlX2hlYWRlciAqZmls
ZV9oZWFkZXI7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBibXBfZGliX2hlYWRlciAqZGliX2hl
YWRlcjsNCj4+IMKgwqDCoMKgwqAgdm9pZCAqYmdydF9pbWFnZSA9IE5VTEw7DQo+PiBAQCAt
MjgyLDcgKzI4MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmJfb3BzIGVmaWZiX29wcyA9
IHsNCj4+IMKgwqDCoMKgwqAgLmZiX3NldGNvbHJlZ8KgwqDCoCA9IGVmaWZiX3NldGNvbHJl
ZywNCj4+IMKgIH07DQo+PiAtc3RhdGljIGludCBlZmlmYl9zZXR1cChjaGFyICpvcHRpb25z
KQ0KPj4gK3N0YXRpYyBpbnQgZWZpZmJfc2V0dXAoc3RydWN0IHNjcmVlbl9pbmZvICpzaSwg
Y2hhciAqb3B0aW9ucykNCj4+IMKgIHsNCj4+IMKgwqDCoMKgwqAgY2hhciAqdGhpc19vcHQ7
DQo+PiBAQCAtMjkwLDE2ICsyODksMTYgQEAgc3RhdGljIGludCBlZmlmYl9zZXR1cChjaGFy
ICpvcHRpb25zKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHdoaWxlICgodGhpc19vcHQgPSBz
dHJzZXAoJm9wdGlvbnMsICIsIikpICE9IE5VTEwpIHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICghKnRoaXNfb3B0KSBjb250aW51ZTsNCj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGVmaWZiX3NldHVwX2Zyb21fZG1pKCZzY3JlZW5faW5mbywgdGhpc19vcHQp
Ow0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWZpZmJfc2V0dXBfZnJvbV9kbWkoc2ks
IHRoaXNfb3B0KTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghc3RybmNt
cCh0aGlzX29wdCwgImJhc2U6IiwgNSkpDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNjcmVlbl9pbmZvLmxmYl9iYXNlID0gc2ltcGxlX3N0cnRvdWwodGhpc19vcHQr
NSwgDQo+PiBOVUxMLCAwKTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c2ktPmxmYl9iYXNlID0gc2ltcGxlX3N0cnRvdWwodGhpc19vcHQrNSwgTlVMTCwgMCk7DQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlmICghc3RybmNtcCh0aGlzX29w
dCwgInN0cmlkZToiLCA3KSkNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c2NyZWVuX2luZm8ubGZiX2xpbmVsZW5ndGggPSANCj4+IHNpbXBsZV9zdHJ0b3VsKHRoaXNf
b3B0KzcsIE5VTEwsIDApICogNDsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc2ktPmxmYl9saW5lbGVuZ3RoID0gc2ltcGxlX3N0cnRvdWwodGhpc19vcHQrNywgTlVM
TCwgDQo+PiAwKSAqIDQ7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlm
ICghc3RybmNtcCh0aGlzX29wdCwgImhlaWdodDoiLCA3KSkNCj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc2NyZWVuX2luZm8ubGZiX2hlaWdodCA9IHNpbXBsZV9zdHJ0
b3VsKHRoaXNfb3B0KzcsIA0KPj4gTlVMTCwgMCk7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNpLT5sZmJfaGVpZ2h0ID0gc2ltcGxlX3N0cnRvdWwodGhpc19vcHQr
NywgTlVMTCwgMCk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlmICgh
c3RybmNtcCh0aGlzX29wdCwgIndpZHRoOiIsIDYpKQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzY3JlZW5faW5mby5sZmJfd2lkdGggPSBzaW1wbGVfc3RydG91bCh0
aGlzX29wdCs2LCANCj4+IE5VTEwsIDApOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzaS0+bGZiX3dpZHRoID0gc2ltcGxlX3N0cnRvdWwodGhpc19vcHQrNiwgTlVM
TCwgMCk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlmICghc3RyY21w
KHRoaXNfb3B0LCAibm93YyIpKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBtZW1fZmxhZ3MgJj0gfkVGSV9NRU1PUllfV0M7DQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlbHNlIGlmICghc3RyY21wKHRoaXNfb3B0LCAibm9iZ3J0IikpDQo+PiBA
QCAtMzEwLDE1ICszMDksMTUgQEAgc3RhdGljIGludCBlZmlmYl9zZXR1cChjaGFyICpvcHRp
b25zKQ0KPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+IMKgIH0NCj4+IC1zdGF0aWMgaW5s
aW5lIGJvb2wgZmJfYmFzZV9pc192YWxpZCh2b2lkKQ0KPj4gK3N0YXRpYyBpbmxpbmUgYm9v
bCBmYl9iYXNlX2lzX3ZhbGlkKHN0cnVjdCBzY3JlZW5faW5mbyAqc2kpDQo+PiDCoCB7DQo+
PiAtwqDCoMKgIGlmIChzY3JlZW5faW5mby5sZmJfYmFzZSkNCj4+ICvCoMKgwqAgaWYgKHNp
LT5sZmJfYmFzZSkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsNCj4+IC3C
oMKgwqAgaWYgKCEoc2NyZWVuX2luZm8uY2FwYWJpbGl0aWVzICYgVklERU9fQ0FQQUJJTElU
WV82NEJJVF9CQVNFKSkNCj4+ICvCoMKgwqAgaWYgKCEoc2ktPmNhcGFiaWxpdGllcyAmIFZJ
REVPX0NBUEFCSUxJVFlfNjRCSVRfQkFTRSkpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIGZhbHNlOw0KPj4gLcKgwqDCoCBpZiAoc2NyZWVuX2luZm8uZXh0X2xmYl9iYXNlKQ0K
Pj4gK8KgwqDCoCBpZiAoc2ktPmV4dF9sZmJfYmFzZSkNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gdHJ1ZTsNCj4+IMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOw0KPj4gQEAgLTMy
OSw3ICszMjgsMTAgQEAgc3RhdGljIHNzaXplX3QgbmFtZSMjX3Nob3coc3RydWN0IGRldmlj
ZSANCj4+ICpkZXYswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICph
dHRyLMKgwqDCoMKgwqDCoMKgIFwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNoYXIgKmJ1ZinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
DQo+PiDCoCB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+PiAtwqDCoMKgIHJldHVybiBzcHJpbnRm
KGJ1ZiwgZm10ICJcbiIsIChzY3JlZW5faW5mby5sZmJfIyNuYW1lKSk7wqDCoMKgIFwNCj4+
ICvCoMKgwqAgc3RydWN0IHNjcmVlbl9pbmZvICpzaSA9IGRldl9nZXRfcGxhdGRhdGEoZGV2
KTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+ICvCoMKgwqAgaWYgKCFzaSnCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gK8KgwqDCoCByZXR1cm4gc3ByaW50Zihi
dWYsIGZtdCAiXG4iLCAoc2ktPmxmYl8jI25hbWUpKTvCoMKgwqDCoMKgwqDCoCBcDQo+PiDC
oCB9wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+PiDCoCBzdGF0aWMgREVWSUNFX0FUVFJfUk8obmFt
ZSkNCj4+IEBAIC0zNTYsNiArMzU4LDcgQEAgc3RhdGljIHU2NCBiYXJfb2Zmc2V0Ow0KPj4g
wqAgc3RhdGljIGludCBlZmlmYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYp
DQo+PiDCoCB7DQo+PiArwqDCoMKgIHN0cnVjdCBzY3JlZW5faW5mbyAqc2kgPSAmc2NyZWVu
X2luZm87DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBmYl9pbmZvICppbmZvOw0KPj4gwqDCoMKg
wqDCoCBzdHJ1Y3QgZWZpZmJfcGFyICpwYXI7DQo+PiDCoMKgwqDCoMKgIGludCBlcnIsIG9y
aWVudGF0aW9uOw0KPj4gQEAgLTM2NSw0OCArMzY4LDQ4IEBAIHN0YXRpYyBpbnQgZWZpZmJf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0KPj4gwqDCoMKgwqDCoCBjaGFy
ICpvcHRpb24gPSBOVUxMOw0KPj4gwqDCoMKgwqDCoCBlZmlfbWVtb3J5X2Rlc2NfdCBtZDsN
Cj4+IC3CoMKgwqAgaWYgKHNjcmVlbl9pbmZvLm9yaWdfdmlkZW9faXNWR0EgIT0gVklERU9f
VFlQRV9FRkkgfHwgDQo+PiBwY2lfZGV2X2Rpc2FibGVkKQ0KPj4gK8KgwqDCoCBpZiAoc2kt
Pm9yaWdfdmlkZW9faXNWR0EgIT0gVklERU9fVFlQRV9FRkkgfHwgcGNpX2Rldl9kaXNhYmxl
ZCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsNCj4+IMKgwqDCoMKg
wqAgaWYgKGZiX2dldF9vcHRpb25zKCJlZmlmYiIsICZvcHRpb24pKQ0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRU5PREVWOw0KPj4gLcKgwqDCoCBlZmlmYl9zZXR1cChvcHRp
b24pOw0KPj4gK8KgwqDCoCBlZmlmYl9zZXR1cChzaSwgb3B0aW9uKTsNCj4+IMKgwqDCoMKg
wqAgLyogV2UgZG9uJ3QgZ2V0IGxpbmVsZW5ndGggZnJvbSBVR0EgRHJhdyBQcm90b2NvbCwg
b25seSBmcm9tDQo+PiDCoMKgwqDCoMKgwqAgKiBFRkkgR3JhcGhpY3MgUHJvdG9jb2wuwqAg
U28gaWYgaXQncyBub3QgaW4gRE1JLCBhbmQgaXQncyBub3QNCj4+IMKgwqDCoMKgwqDCoCAq
IHBhc3NlZCBpbiBmcm9tIHRoZSB1c2VyLCB3ZSByZWFsbHkgY2FuJ3QgdXNlIHRoZSBmcmFt
ZWJ1ZmZlci4NCj4+IMKgwqDCoMKgwqDCoCAqLw0KPj4gLcKgwqDCoCBpZiAoIXNjcmVlbl9p
bmZvLmxmYl9saW5lbGVuZ3RoKQ0KPj4gK8KgwqDCoCBpZiAoIXNpLT5sZmJfbGluZWxlbmd0
aCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsNCj4+IC3CoMKgwqAg
aWYgKCFzY3JlZW5faW5mby5sZmJfZGVwdGgpDQo+PiAtwqDCoMKgwqDCoMKgwqAgc2NyZWVu
X2luZm8ubGZiX2RlcHRoID0gMzI7DQo+PiAtwqDCoMKgIGlmICghc2NyZWVuX2luZm8ucGFn
ZXMpDQo+PiAtwqDCoMKgwqDCoMKgwqAgc2NyZWVuX2luZm8ucGFnZXMgPSAxOw0KPj4gLcKg
wqDCoCBpZiAoIWZiX2Jhc2VfaXNfdmFsaWQoKSkgew0KPj4gK8KgwqDCoCBpZiAoIXNpLT5s
ZmJfZGVwdGgpDQo+PiArwqDCoMKgwqDCoMKgwqAgc2ktPmxmYl9kZXB0aCA9IDMyOw0KPj4g
K8KgwqDCoCBpZiAoIXNpLT5wYWdlcykNCj4+ICvCoMKgwqDCoMKgwqDCoCBzaS0+cGFnZXMg
PSAxOw0KPj4gK8KgwqDCoCBpZiAoIWZiX2Jhc2VfaXNfdmFsaWQoc2kpKSB7DQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgcHJpbnRrKEtFUk5fREVCVUcgImVmaWZiOiBpbnZhbGlkIGZyYW1l
YnVmZmVyIGFkZHJlc3NcbiIpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5P
REVWOw0KPj4gwqDCoMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKgIHByaW50ayhLRVJOX0lORk8g
ImVmaWZiOiBwcm9iaW5nIGZvciBlZmlmYlxuIik7DQo+PiDCoMKgwqDCoMKgIC8qIGp1c3Qg
YXNzdW1lIHRoZXkncmUgYWxsIHVuc2V0IGlmIGFueSBhcmUgKi8NCj4+IC3CoMKgwqAgaWYg
KCFzY3JlZW5faW5mby5ibHVlX3NpemUpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCBzY3JlZW5f
aW5mby5ibHVlX3NpemUgPSA4Ow0KPj4gLcKgwqDCoMKgwqDCoMKgIHNjcmVlbl9pbmZvLmJs
dWVfcG9zID0gMDsNCj4+IC3CoMKgwqDCoMKgwqDCoCBzY3JlZW5faW5mby5ncmVlbl9zaXpl
ID0gODsNCj4+IC3CoMKgwqDCoMKgwqDCoCBzY3JlZW5faW5mby5ncmVlbl9wb3MgPSA4Ow0K
Pj4gLcKgwqDCoMKgwqDCoMKgIHNjcmVlbl9pbmZvLnJlZF9zaXplID0gODsNCj4+IC3CoMKg
wqDCoMKgwqDCoCBzY3JlZW5faW5mby5yZWRfcG9zID0gMTY7DQo+PiAtwqDCoMKgwqDCoMKg
wqAgc2NyZWVuX2luZm8ucnN2ZF9zaXplID0gODsNCj4+IC3CoMKgwqDCoMKgwqDCoCBzY3Jl
ZW5faW5mby5yc3ZkX3BvcyA9IDI0Ow0KPj4gK8KgwqDCoCBpZiAoIXNpLT5ibHVlX3NpemUp
IHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBzaS0+Ymx1ZV9zaXplID0gODsNCj4+ICvCoMKgwqDC
oMKgwqDCoCBzaS0+Ymx1ZV9wb3MgPSAwOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHNpLT5ncmVl
bl9zaXplID0gODsNCj4+ICvCoMKgwqDCoMKgwqDCoCBzaS0+Z3JlZW5fcG9zID0gODsNCj4+
ICvCoMKgwqDCoMKgwqDCoCBzaS0+cmVkX3NpemUgPSA4Ow0KPj4gK8KgwqDCoMKgwqDCoMKg
IHNpLT5yZWRfcG9zID0gMTY7DQo+PiArwqDCoMKgwqDCoMKgwqAgc2ktPnJzdmRfc2l6ZSA9
IDg7DQo+PiArwqDCoMKgwqDCoMKgwqAgc2ktPnJzdmRfcG9zID0gMjQ7DQo+PiDCoMKgwqDC
oMKgIH0NCj4gDQo+IA0KPiBZZWFoLCBIZXJlIHRoZSBlZmlmYiBtb2RpZmllZCBvdXIgbG9j
YWwgc2NyZWVuX2luZm8gaW5zdGFuY2UsIGJ1dCB0aGlzIA0KPiBpcyBub3QgcmVsZXZhbnQg
dG8geW91ciBwYXRjaC4NCj4gDQo+IA0KPj4gLcKgwqDCoCBlZmlmYl9maXguc21lbV9zdGFy
dCA9IHNjcmVlbl9pbmZvLmxmYl9iYXNlOw0KPj4gK8KgwqDCoCBlZmlmYl9maXguc21lbV9z
dGFydCA9IHNpLT5sZmJfYmFzZTsNCj4+IC3CoMKgwqAgaWYgKHNjcmVlbl9pbmZvLmNhcGFi
aWxpdGllcyAmIFZJREVPX0NBUEFCSUxJVFlfNjRCSVRfQkFTRSkgew0KPj4gK8KgwqDCoCBp
ZiAoc2ktPmNhcGFiaWxpdGllcyAmIFZJREVPX0NBUEFCSUxJVFlfNjRCSVRfQkFTRSkgew0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHU2NCBleHRfbGZiX2Jhc2U7DQo+PiAtwqDCoMKgwqDC
oMKgwqAgZXh0X2xmYl9iYXNlID0gKHU2NCkodW5zaWduZWQgbG9uZylzY3JlZW5faW5mby5l
eHRfbGZiX2Jhc2UgDQo+PiA8PCAzMjsNCj4+ICvCoMKgwqDCoMKgwqDCoCBleHRfbGZiX2Jh
c2UgPSAodTY0KSh1bnNpZ25lZCBsb25nKXNpLT5leHRfbGZiX2Jhc2UgPDwgMzI7DQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgZWZpZmJfZml4LnNtZW1fc3RhcnQgfD0gZXh0X2xmYl9iYXNl
Ow0KPj4gwqDCoMKgwqDCoCB9DQo+PiBAQCAtNDE3LDEwICs0MjAsMTAgQEAgc3RhdGljIGlu
dCBlZmlmYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZWZpZmJfZml4LnNtZW1fc3RhcnQgPSBiYXJfcmVzb3VyY2UtPnN0YXJ0
ICsgYmFyX29mZnNldDsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gLcKgwqDCoCBlZmlmYl9kZWZp
bmVkLmJpdHNfcGVyX3BpeGVsID0gc2NyZWVuX2luZm8ubGZiX2RlcHRoOw0KPj4gLcKgwqDC
oCBlZmlmYl9kZWZpbmVkLnhyZXMgPSBzY3JlZW5faW5mby5sZmJfd2lkdGg7DQo+PiAtwqDC
oMKgIGVmaWZiX2RlZmluZWQueXJlcyA9IHNjcmVlbl9pbmZvLmxmYl9oZWlnaHQ7DQo+PiAt
wqDCoMKgIGVmaWZiX2ZpeC5saW5lX2xlbmd0aCA9IHNjcmVlbl9pbmZvLmxmYl9saW5lbGVu
Z3RoOw0KPj4gK8KgwqDCoCBlZmlmYl9kZWZpbmVkLmJpdHNfcGVyX3BpeGVsID0gc2ktPmxm
Yl9kZXB0aDsNCj4+ICvCoMKgwqAgZWZpZmJfZGVmaW5lZC54cmVzID0gc2ktPmxmYl93aWR0
aDsNCj4+ICvCoMKgwqAgZWZpZmJfZGVmaW5lZC55cmVzID0gc2ktPmxmYl9oZWlnaHQ7DQo+
PiArwqDCoMKgIGVmaWZiX2ZpeC5saW5lX2xlbmd0aCA9IHNpLT5sZmJfbGluZWxlbmd0aDsN
Cj4+IMKgwqDCoMKgwqAgLyrCoMKgIHNpemVfdm1vZGUgLS0gdGhhdCBpcyB0aGUgYW1vdW50
IG9mIG1lbW9yeSBuZWVkZWQgZm9yIHRoZQ0KPj4gwqDCoMKgwqDCoMKgICrCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1c2VkIHZpZGVvIG1vZGUsIGkuZS4gdGhlIG1pbmlt
dW0gYW1vdW50IG9mDQo+PiBAQCAtNDMwLDcgKzQzMyw3IEBAIHN0YXRpYyBpbnQgZWZpZmJf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0KPj4gwqDCoMKgwqDCoCAvKsKg
wqAgc2l6ZV90b3RhbCAtLSBhbGwgdmlkZW8gbWVtb3J5IHdlIGhhdmUuIFVzZWQgZm9yDQo+
PiDCoMKgwqDCoMKgwqAgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudHJp
ZXMsIHJlc3NvdXJjZSBhbGxvY2F0aW9uIGFuZCBib3VuZHMNCj4+IMKgwqDCoMKgwqDCoCAq
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2hlY2tpbmcuICovDQo+PiAtwqDC
oMKgIHNpemVfdG90YWwgPSBzY3JlZW5faW5mby5sZmJfc2l6ZTsNCj4+ICvCoMKgwqAgc2l6
ZV90b3RhbCA9IHNpLT5sZmJfc2l6ZTsNCj4+IMKgwqDCoMKgwqAgaWYgKHNpemVfdG90YWwg
PCBzaXplX3Ztb2RlKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVfdG90YWwgPSBzaXpl
X3Ztb2RlOw0KPj4gQEAgLTUxMiw3ICs1MTUsNyBAQCBzdGF0aWMgaW50IGVmaWZiX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikNCj4+IMKgwqDCoMKgwqAgcHJfaW5mbygi
ZWZpZmI6IG1vZGUgaXMgJWR4JWR4JWQsIGxpbmVsZW5ndGg9JWQsIHBhZ2VzPSVkXG4iLA0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVmaWZiX2RlZmluZWQueHJlcywgZWZpZmJf
ZGVmaW5lZC55cmVzLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVmaWZiX2RlZmlu
ZWQuYml0c19wZXJfcGl4ZWwsIGVmaWZiX2ZpeC5saW5lX2xlbmd0aCwNCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoCBzY3JlZW5faW5mby5wYWdlcyk7DQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc2ktPnBhZ2VzKTsNCj4+IMKgwqDCoMKgwqAgZWZpZmJfZGVmaW5lZC54cmVzX3Zp
cnR1YWwgPSBlZmlmYl9kZWZpbmVkLnhyZXM7DQo+PiDCoMKgwqDCoMKgIGVmaWZiX2RlZmlu
ZWQueXJlc192aXJ0dWFsID0gZWZpZmJfZml4LnNtZW1fbGVuIC8NCj4+IEBAIC01MjYsMjYg
KzUyOSwyNiBAQCBzdGF0aWMgaW50IGVmaWZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKmRldikNCj4+IMKgwqDCoMKgwqAgZWZpZmJfZGVmaW5lZC5sZWZ0X21hcmdpbsKgID0g
KGVmaWZiX2RlZmluZWQueHJlcyAvIDgpICYgMHhmODsNCj4+IMKgwqDCoMKgwqAgZWZpZmJf
ZGVmaW5lZC5oc3luY19sZW7CoMKgwqAgPSAoZWZpZmJfZGVmaW5lZC54cmVzIC8gOCkgJiAw
eGY4Ow0KPj4gLcKgwqDCoCBlZmlmYl9kZWZpbmVkLnJlZC5vZmZzZXTCoMKgwqAgPSBzY3Jl
ZW5faW5mby5yZWRfcG9zOw0KPj4gLcKgwqDCoCBlZmlmYl9kZWZpbmVkLnJlZC5sZW5ndGjC
oMKgwqAgPSBzY3JlZW5faW5mby5yZWRfc2l6ZTsNCj4+IC3CoMKgwqAgZWZpZmJfZGVmaW5l
ZC5ncmVlbi5vZmZzZXTCoCA9IHNjcmVlbl9pbmZvLmdyZWVuX3BvczsNCj4+IC3CoMKgwqAg
ZWZpZmJfZGVmaW5lZC5ncmVlbi5sZW5ndGjCoCA9IHNjcmVlbl9pbmZvLmdyZWVuX3NpemU7
DQo+PiAtwqDCoMKgIGVmaWZiX2RlZmluZWQuYmx1ZS5vZmZzZXTCoMKgID0gc2NyZWVuX2lu
Zm8uYmx1ZV9wb3M7DQo+PiAtwqDCoMKgIGVmaWZiX2RlZmluZWQuYmx1ZS5sZW5ndGjCoMKg
ID0gc2NyZWVuX2luZm8uYmx1ZV9zaXplOw0KPj4gLcKgwqDCoCBlZmlmYl9kZWZpbmVkLnRy
YW5zcC5vZmZzZXQgPSBzY3JlZW5faW5mby5yc3ZkX3BvczsNCj4+IC3CoMKgwqAgZWZpZmJf
ZGVmaW5lZC50cmFuc3AubGVuZ3RoID0gc2NyZWVuX2luZm8ucnN2ZF9zaXplOw0KPj4gK8Kg
wqDCoCBlZmlmYl9kZWZpbmVkLnJlZC5vZmZzZXTCoMKgwqAgPSBzaS0+cmVkX3BvczsNCj4+
ICvCoMKgwqAgZWZpZmJfZGVmaW5lZC5yZWQubGVuZ3RowqDCoMKgID0gc2ktPnJlZF9zaXpl
Ow0KPj4gK8KgwqDCoCBlZmlmYl9kZWZpbmVkLmdyZWVuLm9mZnNldMKgID0gc2ktPmdyZWVu
X3BvczsNCj4+ICvCoMKgwqAgZWZpZmJfZGVmaW5lZC5ncmVlbi5sZW5ndGjCoCA9IHNpLT5n
cmVlbl9zaXplOw0KPj4gK8KgwqDCoCBlZmlmYl9kZWZpbmVkLmJsdWUub2Zmc2V0wqDCoCA9
IHNpLT5ibHVlX3BvczsNCj4+ICvCoMKgwqAgZWZpZmJfZGVmaW5lZC5ibHVlLmxlbmd0aMKg
wqAgPSBzaS0+Ymx1ZV9zaXplOw0KPj4gK8KgwqDCoCBlZmlmYl9kZWZpbmVkLnRyYW5zcC5v
ZmZzZXQgPSBzaS0+cnN2ZF9wb3M7DQo+PiArwqDCoMKgIGVmaWZiX2RlZmluZWQudHJhbnNw
Lmxlbmd0aCA9IHNpLT5yc3ZkX3NpemU7DQo+PiDCoMKgwqDCoMKgIHByX2luZm8oImVmaWZi
OiAlczogIg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJzaXplPSVkOiVkOiVkOiVk
LCBzaGlmdD0lZDolZDolZDolZFxuIiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAi
VHJ1ZWNvbG9yIiwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoCBzY3JlZW5faW5mby5yc3Zk
X3NpemUsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2NyZWVuX2luZm8ucmVkX3NpemUs
DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2NyZWVuX2luZm8uZ3JlZW5fc2l6ZSwNCj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoCBzY3JlZW5faW5mby5ibHVlX3NpemUsDQo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc2NyZWVuX2luZm8ucnN2ZF9wb3MsDQo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc2NyZWVuX2luZm8ucmVkX3BvcywNCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoCBzY3JlZW5faW5mby5ncmVlbl9wb3MsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c2NyZWVuX2luZm8uYmx1ZV9wb3MpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIHNpLT5y
c3ZkX3NpemUsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2ktPnJlZF9zaXplLA0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgIHNpLT5ncmVlbl9zaXplLA0KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgIHNpLT5ibHVlX3NpemUsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2kt
PnJzdmRfcG9zLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIHNpLT5yZWRfcG9zLA0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgIHNpLT5ncmVlbl9wb3MsDQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc2ktPmJsdWVfcG9zKTsNCj4+IMKgwqDCoMKgwqAgZWZpZmJfZml4LnlwYW5z
dGVwwqAgPSAwOw0KPj4gwqDCoMKgwqDCoCBlZmlmYl9maXgueXdyYXBzdGVwID0gMDsNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYs
IDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJz
LCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVy
bmJlcmcpDQo=

--------------NCIzK9o0Pc5MvenHvKMU9ZQQ--

--------------RtkiQoezC6rbLfURESsNMxLX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVwNdgFAwAAAAAACgkQlh/E3EQov+An
2g//bd4GoqgeLFXFcMIZlpUhhRK1oE4nM7XAB4UOv9adZYhquPRlpFXXwmtHT10PhLE431AtnIQT
UULh5tx+h1VlfxpFDA4NMcDpVwGfJp15ctuquhmBYt6pa/5pOWJl32r9VAj+5zUx+a/orDlFdr3J
/ijZqeh3TsHI6bMDBe48XS24ehi6rvisd+5l9z8VlCdqj4oc5uwXPs37A0Mf7y4qh8+R/9GY6ggt
FAoRvkQcWr5Fd8Aawasy5qjkjLXBJUMIzTmu2WJtnqH8R4mFzjKAKFuukj48z+hhKkHIB0Sh/9Ax
Polo326V7u21jsy8ggi94U5SSgERAZ5uLofLskC9VROKRyEZcJ86ZEYqYu1gsg2jSXcHJ8qHK6I8
ueRwn8XKcUTJ+DcaSeOP+SN6+DzhRj1bnd0XJZRFscQyA8zPVMXduYHyoDjUfS+k+gvrXwoHai9j
KQYpTDb2XH38JdR3GAEuXQEtI+cqpNAAHmqVQP9BUwzEh6ti6Z1fmZDzE5DfK01rgALKYhtLcgKI
03fLw8494XXdC76y/DE775k74ht+vaHaj67HipgnD219SnFBxIQdZSxGUypAKRh2rOY2XoasTX/Z
G1ZdyikdH7qeQFhQf6fROXYgKDKI/evTsp8H41YoheYP0fR5Xw+B6G2HJvLY0gh/y7hIjVkzCcJw
99s=
=yxi3
-----END PGP SIGNATURE-----

--------------RtkiQoezC6rbLfURESsNMxLX--

