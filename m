Return-Path: <linux-fbdev+bounces-2585-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E98912136
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Jun 2024 11:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88F761C2110F
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Jun 2024 09:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9C616F84A;
	Fri, 21 Jun 2024 09:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OqcYv/wZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sP/YZdLK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OqcYv/wZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sP/YZdLK"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C312816D9AF
	for <linux-fbdev@vger.kernel.org>; Fri, 21 Jun 2024 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718963447; cv=none; b=KQomGJXK/QRnD2RC3fuqdJhjLzEXg+ha+LJQ7PhSiDPKW7yGMxV8dIxTMI3/7cUVa3zYHjrry4J/EycgGSc/H0vmKuFI8NMHDat+Dlr0qiI+l0HUHOEuJq5quvPR3/J0gfKokpwXpCHQDW71GnunBK96op3h3GG5JkEdr0RMwJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718963447; c=relaxed/simple;
	bh=8zFk6LDzBlcCZk4lYQGYia15kHiRq9/+LHVkx1/dMDk=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=uzSpxeDFKXYcag/5/GBh4ijhsUklSWIoSNWNg8JuDXLZ6eL8wr1Li9ywruSarhFiuttEmeTEomHjFpr8hpdIGKpapdXSONzo8zYq9enNWLoY8OX+VniNBnGmQPoTxOxVRPcORdBh9F5UojsNitYYL2/k8/NGKjU3Pb5+DmeE7Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OqcYv/wZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sP/YZdLK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OqcYv/wZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sP/YZdLK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C1F67219A1;
	Fri, 21 Jun 2024 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718963441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UAZ8KuOTxt+riWhBrSDAQp6JTOsbHwQpMRNwqssM0nk=;
	b=OqcYv/wZuT8r9/9wR1X/lrelTcr5+o4Ijhfy4R3MZ+BaFVvQZjH3CHOdPrr4gKruiSxFFS
	+/1uNPKyzrFPdf8bx+ZRqs6cHCsyz5L3IEfDsnbhSUci4YGUWfjyeV59jxThm/F3PweiGI
	gU/tL7Eu9Cb5ppNRH003VSo7O8zo2yA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718963441;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UAZ8KuOTxt+riWhBrSDAQp6JTOsbHwQpMRNwqssM0nk=;
	b=sP/YZdLKZ3sufjhMwUWhMIt/lefaiQZkmmoVsD5+z7TUWLqxKkDnN4Svlqa8rLSuVrbvMY
	BITUV3/RW5nLoxDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="OqcYv/wZ";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="sP/YZdLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718963441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UAZ8KuOTxt+riWhBrSDAQp6JTOsbHwQpMRNwqssM0nk=;
	b=OqcYv/wZuT8r9/9wR1X/lrelTcr5+o4Ijhfy4R3MZ+BaFVvQZjH3CHOdPrr4gKruiSxFFS
	+/1uNPKyzrFPdf8bx+ZRqs6cHCsyz5L3IEfDsnbhSUci4YGUWfjyeV59jxThm/F3PweiGI
	gU/tL7Eu9Cb5ppNRH003VSo7O8zo2yA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718963441;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UAZ8KuOTxt+riWhBrSDAQp6JTOsbHwQpMRNwqssM0nk=;
	b=sP/YZdLKZ3sufjhMwUWhMIt/lefaiQZkmmoVsD5+z7TUWLqxKkDnN4Svlqa8rLSuVrbvMY
	BITUV3/RW5nLoxDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84E9F13AAA;
	Fri, 21 Jun 2024 09:50:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rnYDH/FMdWZ2RwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Jun 2024 09:50:41 +0000
Content-Type: multipart/mixed; boundary="------------3ukWqoE09U1BhtSerBGEb5Ns"
Message-ID: <9e55c009-d82d-4f1b-a8b3-33deb77e4f3c@suse.de>
Date: Fri, 21 Jun 2024 11:50:41 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: "firmware/sysfb: Set firmware-framebuffer parent device" breaks
 lightdm on Ubuntu 22.04 using amdgpu
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-fbdev@vger.kernel.org,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <CAAxE2A7qK1-b5g1RR-GJ+QTLEr_OxEr9vcZGEOkZY9yLOFLb5w@mail.gmail.com>
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
In-Reply-To: <CAAxE2A7qK1-b5g1RR-GJ+QTLEr_OxEr9vcZGEOkZY9yLOFLb5w@mail.gmail.com>
X-Rspamd-Queue-Id: C1F67219A1
X-Spam-Score: -5.40
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-5.40 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com,gmx.de,kernel.org,lists.freedesktop.org,vger.kernel.org,amd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,intel.com:email,suse.de:email,suse.de:dkim,linaro.org:email]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

This is a multi-part message in MIME format.
--------------3ukWqoE09U1BhtSerBGEb5Ns
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Marek

Am 13.06.24 um 07:59 schrieb Marek Olšák:
> Hi Thomas,
>
> Commit 9eac534db0013aff9b9124985dab114600df9081 as per the title
> breaks (crashes?) lightdm (login screen) such that all I get is the
> terminal. It's also reproducible with tag v6.9 where the commit is
> present.

I still cannot reproduce the problem reliably. But I've found a 
ref-counting bug on the parent device that was introduced by that 
commit. This needs to be fixed anyway. A patch is attached if you want 
to test.

Best regards
Thomas

>
> Reverting the commit fixes lightdm. A workaround is to bypass lightdm
> by triggering auto-login. This is a bug report.
>
> (For AMD folks: It's also reproducible with amd-staging-drm-next.)
>
> Marek

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

--------------3ukWqoE09U1BhtSerBGEb5Ns
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-firmware-sysfb-Fix-reference-count-of-syfb-parent-de.patch"
Content-Disposition: attachment;
 filename*0="0001-firmware-sysfb-Fix-reference-count-of-syfb-parent-de.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA1Y2E3MDBhMzZmYzA2ZTFlYzViM2MyYzlhMzgzYzJkMDAxMWMwZDgzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVHVlLCAxOCBKdW4gMjAyNCAxNzozNzoxMSArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIGZpcm13YXJlOiBzeXNmYjogRml4IHJlZmVyZW5jZSBjb3VudCBvZiBzeWZi
IHBhcmVudCBkZXZpY2UKClJldHJpZXZpbmcgdGhlIHN5c3RlbSBmcmFtZWJ1ZmZlcidzIHBh
cmVudCBkZXZpY2UgaW4gc3lzZmJfaW5pdCgpCmluY3JlbWVudHMgdGhlIHBhcmVudCBkZXZp
Y2UncyByZWZlcmVuY2UgY291bnQuIEhlbmNlIHJlbGVhc2UgdGhlCnJlZmVyZW5jZSBiZWZv
cmUgbGVhdmluZyB0aGUgaW5pdCBmdW5jdGlvbi4KCkFkZGluZyB0aGUgc3lzZmIgcGxhdGZv
cm0gZGV2aWNlIGFjcXVpcmVzIGFuZCBhZGRpdGlvbmFsIHJlZmVyZW5jZQpmb3IgdGhlIHBh
cmVudC4gVGhpcyBrZWVwcyB0aGUgcGFyZW50IGRldmljZSBhcm91bmQgd2hpbGUgdGhlIHN5
c3RlbQpmcmFtZWJ1ZmZlciBpcyBpbiB1c2UuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KRml4ZXM6IDllYWM1MzRkYjAwMSAoImZp
cm13YXJlL3N5c2ZiOiBTZXQgZmlybXdhcmUtZnJhbWVidWZmZXIgcGFyZW50IGRldmljZSIp
CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IEphdmll
ciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPgpDYzogSGVsZ2UgRGVs
bGVyIDxkZWxsZXJAZ214LmRlPgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4KQ2M6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4KQ2M6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CkNjOiBTdWkgSmluZ2ZlbmcgPHN1aWpp
bmdmZW5nQGxvb25nc29uLmNuPgpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjYu
OSsKLS0tCiBkcml2ZXJzL2Zpcm13YXJlL3N5c2ZiLmMgfCA5ICsrKysrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2Zpcm13YXJlL3N5c2ZiLmMgYi9kcml2ZXJzL2Zpcm13YXJlL3N5c2ZiLmMK
aW5kZXggODgwZmZjYjUwMDg4Ny4uYTMxNmJkOTJkZmVkMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9maXJtd2FyZS9zeXNmYi5jCisrKyBiL2RyaXZlcnMvZmlybXdhcmUvc3lzZmIuYwpAQCAt
MTM3LDcgKzEzNyw3IEBAIHN0YXRpYyBfX2luaXQgaW50IHN5c2ZiX2luaXQodm9pZCkKIAlp
ZiAoY29tcGF0aWJsZSkgewogCQlwZCA9IHN5c2ZiX2NyZWF0ZV9zaW1wbGVmYihzaSwgJm1v
ZGUsIHBhcmVudCk7CiAJCWlmICghSVNfRVJSKHBkKSkKLQkJCWdvdG8gdW5sb2NrX211dGV4
OworCQkJZ290byBwdXRfZGV2aWNlOwogCX0KIAogCS8qIGlmIHRoZSBGQiBpcyBpbmNvbXBh
dGlibGUsIGNyZWF0ZSBhIGxlZ2FjeSBmcmFtZWJ1ZmZlciBkZXZpY2UgKi8KQEAgLTE1NSw3
ICsxNTUsNyBAQCBzdGF0aWMgX19pbml0IGludCBzeXNmYl9pbml0KHZvaWQpCiAJcGQgPSBw
bGF0Zm9ybV9kZXZpY2VfYWxsb2MobmFtZSwgMCk7CiAJaWYgKCFwZCkgewogCQlyZXQgPSAt
RU5PTUVNOwotCQlnb3RvIHVubG9ja19tdXRleDsKKwkJZ290byBwdXRfZGV2aWNlOwogCX0K
IAogCXBkLT5kZXYucGFyZW50ID0gcGFyZW50OwpAQCAtMTcwLDkgKzE3MCwxMiBAQCBzdGF0
aWMgX19pbml0IGludCBzeXNmYl9pbml0KHZvaWQpCiAJaWYgKHJldCkKIAkJZ290byBlcnI7
CiAKLQlnb3RvIHVubG9ja19tdXRleDsKKworCWdvdG8gcHV0X2RldmljZTsKIGVycjoKIAlw
bGF0Zm9ybV9kZXZpY2VfcHV0KHBkKTsKK3B1dF9kZXZpY2U6CisJcHV0X2RldmljZShwYXJl
bnQpOwogdW5sb2NrX211dGV4OgogCW11dGV4X3VubG9jaygmZGlzYWJsZV9sb2NrKTsKIAly
ZXR1cm4gcmV0OwotLSAKMi40NS4yCgo=

--------------3ukWqoE09U1BhtSerBGEb5Ns--

