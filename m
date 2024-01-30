Return-Path: <linux-fbdev+bounces-802-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0538E8420DE
	for <lists+linux-fbdev@lfdr.de>; Tue, 30 Jan 2024 11:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 298481C23F47
	for <lists+linux-fbdev@lfdr.de>; Tue, 30 Jan 2024 10:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683F960897;
	Tue, 30 Jan 2024 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C5c7WTPa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MqE1UgB2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C5c7WTPa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MqE1UgB2"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C18C60885
	for <linux-fbdev@vger.kernel.org>; Tue, 30 Jan 2024 10:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706609557; cv=none; b=qtj8C4bbhVCMJaiMym8Tpe0/16f1H910bNtklrK/GBBdgR4OhNCZHjJPmHgALQRQ5+KSZa2lcY8lH71Pc2S2xWcqiAVH4bTABJw3hOc+U3LHZkOPwX2Jxt65EvUY2U0ud5EANPG3+bgglbZTyb21tQtRS2a/QBmgv+phpOrHS80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706609557; c=relaxed/simple;
	bh=64pv8abktHG8NipVXB5axvDB8o9A4ZSip99pPH7LHVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TS0SPKYq7r8Psx0E0ShTvv7zTR1VNual4i517G5ZNe0p9kHY14qL0XuQvYWm2BA21OaE3C5se2ABESPTlH7AvQsa5epw9t0uldBotZNdRNG3mINCbNsouo1jLIN+klDTtQdHXLqt64Jbjp8sZDCUaxxdX+BusjDgYXmYF/X0JC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C5c7WTPa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MqE1UgB2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C5c7WTPa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MqE1UgB2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 70205222D5;
	Tue, 30 Jan 2024 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706609553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=64pv8abktHG8NipVXB5axvDB8o9A4ZSip99pPH7LHVI=;
	b=C5c7WTPaf2E6fljSrg76WwaF78D2qJI3PmAV8r3nRFOS9uI18yWJ0rspZCnuQDcVvsZ1TW
	FfXvGHeAkK6TWCnYkxbvvg0o5F6znjeoVYt5/bgKJl1XVm+T9RQcFoqfFFlQ5oDyZsknMu
	kK/t3qBYMQKwLprMnsQ05I6JfnrTYPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706609553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=64pv8abktHG8NipVXB5axvDB8o9A4ZSip99pPH7LHVI=;
	b=MqE1UgB2vcwNaKv+W8iDJbChrsy1zT61U7welWwoOt+iN+3KEvog+05kW0Lb0VKm/v/t55
	8N3PEsMhPdP52CBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706609553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=64pv8abktHG8NipVXB5axvDB8o9A4ZSip99pPH7LHVI=;
	b=C5c7WTPaf2E6fljSrg76WwaF78D2qJI3PmAV8r3nRFOS9uI18yWJ0rspZCnuQDcVvsZ1TW
	FfXvGHeAkK6TWCnYkxbvvg0o5F6znjeoVYt5/bgKJl1XVm+T9RQcFoqfFFlQ5oDyZsknMu
	kK/t3qBYMQKwLprMnsQ05I6JfnrTYPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706609553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=64pv8abktHG8NipVXB5axvDB8o9A4ZSip99pPH7LHVI=;
	b=MqE1UgB2vcwNaKv+W8iDJbChrsy1zT61U7welWwoOt+iN+3KEvog+05kW0Lb0VKm/v/t55
	8N3PEsMhPdP52CBA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 4741B13462;
	Tue, 30 Jan 2024 10:12:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id hGr9D5HLuGVUdQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:12:33 +0000
Message-ID: <7c33dd4c-d178-4b46-b859-f228391e4d44@suse.de>
Date: Tue, 30 Jan 2024 11:12:32 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
To: Javier Martinez Canillas <javierm@redhat.com>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-3-tzimmermann@suse.de>
 <87ttmwv1ry.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87ttmwv1ry.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------o2KmWoG0qjDTjjI17qiRaQeP"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.09 / 50.00];
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
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MIME_BASE64_TEXT(0.10)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[redhat.com,gmx.de,kernel.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.09

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------o2KmWoG0qjDTjjI17qiRaQeP
Content-Type: multipart/mixed; boundary="------------xq8VIfiBPl6PBwRtnpiYks2r";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <7c33dd4c-d178-4b46-b859-f228391e4d44@suse.de>
Subject: Re: [PATCH 2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-3-tzimmermann@suse.de>
 <87ttmwv1ry.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87ttmwv1ry.fsf@minerva.mail-host-address-is-not-set>

--------------xq8VIfiBPl6PBwRtnpiYks2r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDEuMjQgdW0gMTI6MDQgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPj4gQWRkIHNjcmVlbl9pbmZvX2dldF9wY2lfZGV2KCkgdG8gZmluZCB0aGUg
UENJIGRldmljZSBvZiBhbiBpbnN0YW5jZQ0KPj4gb2Ygc2NyZWVuX2luZm8uIERvZXMgbm90
aGluZyBvbiBzeXN0ZW1zIHdpdGhvdXQgUENJIGJ1cy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPiAN
Cj4gWy4uLl0NCj4gDQo+PiArc3RydWN0IHBjaV9kZXYgKnNjcmVlbl9pbmZvX3BjaV9kZXYo
Y29uc3Qgc3RydWN0IHNjcmVlbl9pbmZvICpzaSkNCj4+ICt7DQo+PiArCXN0cnVjdCByZXNv
dXJjZSByZXNbU0NSRUVOX0lORk9fTUFYX1JFU09VUkNFU107DQo+PiArCXNpemVfdCBpLCBu
dW1yZXM7DQo+PiArCWludCByZXQ7DQo+PiArDQo+PiArCXJldCA9IHNjcmVlbl9pbmZvX3Jl
c291cmNlcyhzaSwgcmVzLCBBUlJBWV9TSVpFKHJlcykpOw0KPj4gKwlpZiAocmV0IDwgMCkN
Cj4+ICsJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+PiArCW51bXJlcyA9IHJldDsNCj4+ICsN
Cj4gDQo+IEkgd291bGQganVzdCBkcm9wIHRoZSByZXQgdmFyaWFibGUgYW5kIGFzc2lnbiB0
aGUgc2NyZWVuX2luZm9fcmVzb3VyY2VzKCkNCj4gcmV0dXJuIHZhbHVlIHRvIG51bXJlcy4g
SSB0aGluayB0aGF0IG1ha2VzIHRoZSBjb2RlIGVhc2llciB0byBmb2xsb3cuDQoNClRoZSB2
YWx1ZSBvZiByZXQgY291bGQgYmUgYW4gZXJybm8gY29kZS4gV2Ugd291bGQgZWZmZWN0aXZl
bHkgcmV0dXJuIA0KTlVMTCBmb3IgZXJyb3JzLiBBbmQgSSBqdXN0IG5vdGljZWQgdGhhdCB0
aGUgZnVuY3Rpb24gZG9jcyBpbXBseSB0aGlzLiANCkJ1dCBOVUxMIGlzIGFsc28gYSB2YWxp
ZCB2YWx1ZSBpZiB0aGVyZSBpcyBubyBQQ0kgZGV2aWNlLiBJJ2QgcHJlZmVyIHRvIA0Ka2Vl
cCB0aGUgZXJybm8tcG9pbnRlciBhcm91bmQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1A
cmVkaGF0LmNvbT4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
RnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8g
VG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4N
CkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------xq8VIfiBPl6PBwRtnpiYks2r--

--------------o2KmWoG0qjDTjjI17qiRaQeP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmW4y5AFAwAAAAAACgkQlh/E3EQov+Dj
1w/+I96OOWNxDc1iJ195N6fBygqUmiv8hG4avWeY5ueSz/DQ0u//lNhdLt87fMpzKCFEAoD+I9E0
bOcZpqnUkwre8lwkviZsQPredGmmw4JW92gHDb2LNKF6rDJRCl/FAmb3nmQBom6ownxK4USAbOj5
ilasje0vZ9CoNJ4MJhsZikWC/d9lsZ1xB0Csas5YidT44g+kHmJ2KlEzUhnT2lmmKS+1FbfryI9Q
tCbLUZuvLYDq62ryfJ8EIf4eUG3wVXEq53sjxF3ZLa/euwdKiMMJSWFf+ndkMBulvSI0jJ5JJj2h
frAjF1tardNXOtM0hZloPOhrAjWb4OMEkMDG7tdjdmjYYBRJFyKGe+7sWzq+4IWYmqimOgQYFmCz
Q4ixMkMghvj7QA/UaGPvtcxyx+qyYq8mB08IXF540YkL8IUaQYCKxMIAS+7aHv3wqij9api7OyZO
MaCh7H1B6q0D9IehiVqEAhlDHQwoNZuCcHBv7JltqQFeE4FyMr1KWTmX8Li4fzUi6n6tzI7tUzGB
rUBwkji6decFPN4nNKFyxtcRR79DCGDtlYcrLn8mSRfL0VwOPQ1spUeAOXXqOnlHwAqiCUsVnr0o
jFYfYOntzaKIYasRTQFZLooz6W76NAz8lvG+qtJ0Xs8NWq0SYWh9jiNUPjnKIjMKMyNIIK0HrbHK
vbY=
=Bo1w
-----END PGP SIGNATURE-----

--------------o2KmWoG0qjDTjjI17qiRaQeP--

