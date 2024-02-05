Return-Path: <linux-fbdev+bounces-926-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CC5849769
	for <lists+linux-fbdev@lfdr.de>; Mon,  5 Feb 2024 11:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CC0828A488
	for <lists+linux-fbdev@lfdr.de>; Mon,  5 Feb 2024 10:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BD513AE9;
	Mon,  5 Feb 2024 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LLMZv2uJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yt3Ui7rg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LLMZv2uJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yt3Ui7rg"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37CD13FE4
	for <linux-fbdev@vger.kernel.org>; Mon,  5 Feb 2024 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707127893; cv=none; b=Krmi++8BEO1RUGd/DeAeWZ0s5fCRLWT4t4BXhgVEUWAV5bYrMTM+TKMOH9htPQBz66czpl2iDZeumMgyPKM7bk9APDXBfyyrQIY4XHJhK+rFOZXMBXjLV+aFbSHGH3X76XfkiZm1LsE5P2AfA/wjFz7hWUgc0khClyaMMXdXmvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707127893; c=relaxed/simple;
	bh=I6av5r6bA6Mk6UhPnxmP0wURFq/g25v97gECO2TqOxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvKdfZUNLCsiH2mno5KKAIpH/9DHvovzeV06/O71Kl6H4s0Kf2Q8ASob2pdPC39WNzSILz2R9eagjM1oS/UyTHTE6oa99+kVC1z4rTTuqkq/84+kbCIL+/R73T2reHF9Dq7bWkTHnLz2NygLKIsy1mcmnifqj6UkWRimttspruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LLMZv2uJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Yt3Ui7rg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LLMZv2uJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Yt3Ui7rg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 46FE01F8AE;
	Mon,  5 Feb 2024 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707127889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I6av5r6bA6Mk6UhPnxmP0wURFq/g25v97gECO2TqOxs=;
	b=LLMZv2uJ1dGOdMIrw6MrXC2xLUQb8XYP4p/hhX+CBpSU/K4dkdNsb9sPQeR5HTXkoBYIDe
	4XFZGkcmtuwNge2baj6esnnU2qWzobi+c4VF/4UlAEposcAHfRV5IcnrpJNshqUTFPKmB4
	k+28MqL/FLcXCGDt5BgwTRtwLLrlFH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707127889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I6av5r6bA6Mk6UhPnxmP0wURFq/g25v97gECO2TqOxs=;
	b=Yt3Ui7rgEaZAfw0/KMtjKCSBicUez354stPUdeYDdV6X4QXxzCp0gvcBVuTE+b+pxbCPya
	ZFRuWat37/HedyAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707127889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I6av5r6bA6Mk6UhPnxmP0wURFq/g25v97gECO2TqOxs=;
	b=LLMZv2uJ1dGOdMIrw6MrXC2xLUQb8XYP4p/hhX+CBpSU/K4dkdNsb9sPQeR5HTXkoBYIDe
	4XFZGkcmtuwNge2baj6esnnU2qWzobi+c4VF/4UlAEposcAHfRV5IcnrpJNshqUTFPKmB4
	k+28MqL/FLcXCGDt5BgwTRtwLLrlFH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707127889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I6av5r6bA6Mk6UhPnxmP0wURFq/g25v97gECO2TqOxs=;
	b=Yt3Ui7rgEaZAfw0/KMtjKCSBicUez354stPUdeYDdV6X4QXxzCp0gvcBVuTE+b+pxbCPya
	ZFRuWat37/HedyAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C754136F5;
	Mon,  5 Feb 2024 10:11:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V2fiBVG0wGVGKgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 05 Feb 2024 10:11:29 +0000
Message-ID: <1d357eeb-1bac-45bd-bda9-075671714cec@suse.de>
Date: Mon, 5 Feb 2024 11:11:28 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,7/8] firmware/sysfb: Update screen_info for relocated EFI
 framebuffers
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-8-tzimmermann@suse.de>
 <0fffeeba-b5b5-4ead-92ef-ae0fa7696d17@linux.dev>
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
In-Reply-To: <0fffeeba-b5b5-4ead-92ef-ae0fa7696d17@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iUGQRAPXbW02kd0B8Y2DQNyP"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-3.43 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 BAYES_HAM(-1.34)[90.43%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[linux.dev,redhat.com,gmx.de,kernel.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.43

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iUGQRAPXbW02kd0B8Y2DQNyP
Content-Type: multipart/mixed; boundary="------------J7vRNjbcJe1qv0iQ64HhCJpw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <1d357eeb-1bac-45bd-bda9-075671714cec@suse.de>
Subject: Re: [v2,7/8] firmware/sysfb: Update screen_info for relocated EFI
 framebuffers
References: <20240202120140.3517-8-tzimmermann@suse.de>
 <0fffeeba-b5b5-4ead-92ef-ae0fa7696d17@linux.dev>
In-Reply-To: <0fffeeba-b5b5-4ead-92ef-ae0fa7696d17@linux.dev>

--------------J7vRNjbcJe1qv0iQ64HhCJpw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDIuMjQgdW0gMTg6NTQgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gDQo+IE9uIDIwMjQvMi8yIDE5OjU4LCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19zY3JlZW5faW5mb19zZXRfbGZiX2Jhc2Uo
c3RydWN0IHNjcmVlbl9pbmZvICpzaSwgDQo+PiB1NjQgbGZiX2Jhc2UpDQo+PiArew0KPj4g
K8KgwqDCoCBzaS0+bGZiX2Jhc2UgPSBsZmJfYmFzZSAmIEdFTk1BU0tfVUxMKDMxLCAwKTsN
Cj4+ICvCoMKgwqAgc2ktPmV4dF9sZmJfYmFzZSA9IChsZmJfYmFzZSAmIEdFTk1BU0tfVUxM
KDYzLCAzMikpID4+IDMyOw0KPj4gKw0KPj4gK8KgwqDCoCBpZiAoc2ktPmV4dF9sZmJfYmFz
ZSkNCj4+ICvCoMKgwqDCoMKgwqDCoCBzaS0+Y2FwYWJpbGl0aWVzIHw9IFZJREVPX0NBUEFC
SUxJVFlfNjRCSVRfQkFTRTsNCj4+ICvCoMKgwqAgZWxzZQ0KPj4gK8KgwqDCoMKgwqDCoMKg
IHNpLT5jYXBhYmlsaXRpZXMgJj0gflZJREVPX0NBUEFCSUxJVFlfNjRCSVRfQkFTRTsNCj4+
ICt9DQo+PiArDQo+IA0KPiBEbyB3ZSByZWFsbHkgaGFzIGEgbmVlZCB0byBtb2RpZnkgdGhl
IHNpLT5jYXBhYmlsaXRpZXMgYXQgaGVyZT8NCg0KV2UgbmVlZCB0byBzZXQgb3IgY2xlYXIg
dGhlIGZsYWcgZGVwZW5kaW5nIG9uIHRoZSB2YWx1ZSBvZiBleHRfbGZiX2Jhc2UuIA0KV2l0
aG91dCB0aGUgZmxhZywgZGVjb2RlcnMgd2lsbCBpZ25vcmUgdGhlIHZhbHVlIGluIGV4dF9s
ZmJfYmFzZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJu
YmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNE
b25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------J7vRNjbcJe1qv0iQ64HhCJpw--

--------------iUGQRAPXbW02kd0B8Y2DQNyP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmXAtFAFAwAAAAAACgkQlh/E3EQov+DT
HQ//Qf0hznPz5FSs6kQyMC/pKiFZlq5K1rdAJhE0H7MV8DGzveFSn3MKUM9n4Om9jD3+dcXr1rbI
EXD96/gfHxMCdmklIjXjd1DD/wPCsb3OG8Cgk9NhPrwiMaxZt9+WvSBabvamdPnU595A33GZhAdD
nPbo2fkmblbCArQaMvhQM38mBqdfd6lKUtbeoAlHZZqyKONMJWE0Znamc9thH6jiB36Clb3fnYeQ
PI4UNGPvgVshAN1/ZdTBRmGEzDzHKiWKrnmI0OTL4FwESwGg8xFXWdwaYEyGVNNBprkZ4fPXyRqd
5+R31uLY3xP0a7+Pel/rflVFtWj9+87BZxhAKO+3SE/rxhc5VsAm3GVGMdLjL0UnZikf9UGj0gjQ
le5O8qjx76O9Evv8sbLDEwOlL1pRa39wmxrEMqhssy1wreASC3Bdsit3puBvQ8kelTtbhyzG7Sx8
nK+XQGOB2zBYmDqaiYVlDk5a+Oz21jnEive4qhvLHhc4yHc0J090Fx8/Pof/XOrVs3U0NF1yl6oS
NoY2L0aGtCbZ2KlA+zChC8uFfH05KhCkM0oW3yo3WP2hUk6h66ADfTU9KXHzOnww2+oIs9VhdA/J
gzKM2phYIINea/171CkJcdv8HsBAg+TIVmP5uHWgNwH2raO7pEpJbKo3J5mRz2REaGGMhhzw56EE
56A=
=Larw
-----END PGP SIGNATURE-----

--------------iUGQRAPXbW02kd0B8Y2DQNyP--

