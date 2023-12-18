Return-Path: <linux-fbdev+bounces-405-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ABA816C1D
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 Dec 2023 12:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C030228407F
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 Dec 2023 11:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E956B19459;
	Mon, 18 Dec 2023 11:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j03WO0qq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ld3EpcBc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j03WO0qq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ld3EpcBc"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D79719BD8
	for <linux-fbdev@vger.kernel.org>; Mon, 18 Dec 2023 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 20C8C1F365;
	Mon, 18 Dec 2023 11:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702898625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=toFAEAYBtyhJzELXYUMrUPxMI5rYXOLGkNuJ0+vNTjc=;
	b=j03WO0qqaSTZVMmh6QuGpl6WpnfJ2nt1j/xYGNIbuefZjN/glWx5jMpcJydwopSYvOsqhx
	Ls2ovnysFa3oS9E2PeZ0apxjcH4BVWmQbGeTOVOGJjG6LnytwZGH+Kc/hrbvhKUEeGCv4K
	yKJEx22+ML95G9trmDGc5udKBcFXRk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702898625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=toFAEAYBtyhJzELXYUMrUPxMI5rYXOLGkNuJ0+vNTjc=;
	b=ld3EpcBcyUgsE8nvs1S2tl696YK2g55AXaV0pSiulAMxnbfrNXx60HGN8TwTCDOf/ZIghO
	Ekyt/ki4jXHnhaAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702898625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=toFAEAYBtyhJzELXYUMrUPxMI5rYXOLGkNuJ0+vNTjc=;
	b=j03WO0qqaSTZVMmh6QuGpl6WpnfJ2nt1j/xYGNIbuefZjN/glWx5jMpcJydwopSYvOsqhx
	Ls2ovnysFa3oS9E2PeZ0apxjcH4BVWmQbGeTOVOGJjG6LnytwZGH+Kc/hrbvhKUEeGCv4K
	yKJEx22+ML95G9trmDGc5udKBcFXRk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702898625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=toFAEAYBtyhJzELXYUMrUPxMI5rYXOLGkNuJ0+vNTjc=;
	b=ld3EpcBcyUgsE8nvs1S2tl696YK2g55AXaV0pSiulAMxnbfrNXx60HGN8TwTCDOf/ZIghO
	Ekyt/ki4jXHnhaAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E814A13BC8;
	Mon, 18 Dec 2023 11:23:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id E0F7N8ArgGVNNQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 18 Dec 2023 11:23:44 +0000
Message-ID: <1a5863ee-eeb8-4802-8f68-8e3558e4a5fd@suse.de>
Date: Mon, 18 Dec 2023 12:23:44 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] fbdev: Remove global screen_info in efifb/vesafb
To: javierm@redhat.com, deller@gmx.de, pjones@redhat.com,
 sui.jingfeng@linux.dev
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20231206135153.2599-1-tzimmermann@suse.de>
Content-Language: en-US
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
In-Reply-To: <20231206135153.2599-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oUkTpVfBWb60k5hZMQBjmIJd"
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-5.46 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 HAS_ATTACHMENT(0.00)[];
	 TO_DN_NONE(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MIME_BASE64_TEXT(0.10)[];
	 MX_GOOD(-0.01)[];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[redhat.com,gmx.de,linux.dev];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-2.16)[95.99%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=j03WO0qq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ld3EpcBc
X-Spam-Score: -5.46
X-Rspamd-Queue-Id: 20C8C1F365

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oUkTpVfBWb60k5hZMQBjmIJd
Content-Type: multipart/mixed; boundary="------------E6IuG4RBqLR2jdRD0a9jbesY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, pjones@redhat.com,
 sui.jingfeng@linux.dev
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <1a5863ee-eeb8-4802-8f68-8e3558e4a5fd@suse.de>
Subject: Re: [PATCH v3 0/4] fbdev: Remove global screen_info in efifb/vesafb
References: <20231206135153.2599-1-tzimmermann@suse.de>
In-Reply-To: <20231206135153.2599-1-tzimmermann@suse.de>

--------------E6IuG4RBqLR2jdRD0a9jbesY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSdtIGdvaW5nIHRvIG1lcmdlIHRoaXMgcGF0Y2hzZXQgdGhyb3VnaCBkcm0tbWlzYy1uZXh0
DQoNCkFtIDA2LjEyLjIzIHVtIDE0OjUwIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IFJlcGxhY2UgdGhlIGdsb2JhbCBpbnN0YW5jZSBvZiBzY3JlZW5faW5mbyB3aXRoIHRoZSBw
ZXItZGV2aWNlIGluc3RhbmNlDQo+IHRoYXQgaXMgc2V0IGJ5IHRoZSBzeXNmYiBjb2RlLiBU
aGUgdXNlIG9mIHRoZSBnbG9iYWwgc2NyZWVuX2luZm8gc2hvdWxkDQo+IGJlIGxpbWl0ZWQg
YW5kIGlkZWFsbHkgYmUgcHVzaGVkIGludG8gcGVyLWFyY2hpdGVjdHVyZSBjb2RlLg0KPiAN
Cj4gdjM6DQo+IAkqIGJldHRlciBjb25zdCBjb3JyZWN0bmVzcyBpbiBlZmlmYiAoU3VpKQ0K
PiAJKiBmaXggYnVpbGQgZm9yIGRlZmVycmVkIHRha2VvdmVyIChrZXJuZWwgdGVzdCByb2Jv
dCkNCj4gdjI6DQo+IAkqIGNvbW1lbnQgb24gZGV2bV9rbWVtZHVwKCkgdXNhZ2UgKEphdmll
cikNCj4gDQo+IFRob21hcyBaaW1tZXJtYW5uICg0KToNCj4gICAgZmJkZXYvZWZpZmI6IFJl
cGxhY2UgcmVmZXJlbmNlcyB0byBnbG9iYWwgc2NyZWVuX2luZm8gYnkgbG9jYWwgcG9pbnRl
cg0KPiAgICBmYmRldi9lZmlmYjogVXNlIHNjcmVlbl9pbmZvIHBvaW50ZXIgZnJvbSBkZXZp
Y2UNCj4gICAgZmJkZXYvdmVzYWZiOiBSZXBsYWNlIHJlZmVyZW5jZXMgdG8gZ2xvYmFsIHNj
cmVlbl9pbmZvIGJ5IGxvY2FsDQo+ICAgICAgcG9pbnRlcg0KPiAgICBmYmRldi92ZXNhZmI6
IFVzZSBzY3JlZW5faW5mbyBwb2ludGVyIGZyb20gZGV2aWNlDQo+IA0KPiAgIGRyaXZlcnMv
dmlkZW8vZmJkZXYvZWZpZmIuYyAgfCAxMzYgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Zlc2FmYi5jIHwgIDc4ICsrKysr
KysrKysrKy0tLS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMjMgaW5zZXJ0aW9ucygr
KSwgOTEgZGVsZXRpb25zKC0pDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpH
RjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBN
b2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------E6IuG4RBqLR2jdRD0a9jbesY--

--------------oUkTpVfBWb60k5hZMQBjmIJd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWAK8AFAwAAAAAACgkQlh/E3EQov+DI
Pw//dC3DJosqyIIEKMOjdwtHVwrP7iHkt1EwrK/L+MCGHIGMUqdsJ6L1S1m7n2OOUsu/k10mXb5q
8eC0Do51P1guggpUrvR6g6+oSUxC/+nP/QmvKGDuh1OlZs47kWP+baN5fbp8j/v/f76UqhzK58Qp
TyV6JP3GbfMcMm3reT7TSWdbckCHqOg8xobvS/NdYrMOBOrDUehSUf4ywDwyVMMehRpD44ORagM4
aO7UtREpXYUYwWkA4p8Ez1pnC+W8WgztNyQNB5eyHvJwAbIkvI0kO92Wjtbo/1a42k2/lzV92O2v
HRDotbkMNB1xdQ7nsjYsgKsSu5s3PRvehqfG3o8noLmsd+MmVQ//P1yq73yzmTsKsMUetmbKTL+v
a2nA/Bf/KZb9vnSSk5aonGvBOOGASrZ4bgtqZoh6N0bMliDeR6XPxmncgh6UihEHi27W0U8SpBX8
TZC4wxD9Ta1ECBTVfyx2wOYsbVi14uCPRosmrpQZSZ2pXNu1zYdDfIvFJKrSJ9p2WGqxsMM6u/fM
9rDzDI7MeU6tm70WyIkxxfBVlodJsGRMARHYu+dJE6CYO0NQhL+fCttJP7yL8J9HpS/sjx6zg24A
bGmCrV5iq88mvgwk0iLaP48NdPPAlRkRha6lc5/KRHPsbbK6QbEsPy1yk9UmwKW9SAD5d1iW4eI1
JMU=
=OEnz
-----END PGP SIGNATURE-----

--------------oUkTpVfBWb60k5hZMQBjmIJd--

