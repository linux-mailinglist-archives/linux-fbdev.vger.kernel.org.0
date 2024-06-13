Return-Path: <linux-fbdev+bounces-2481-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 814669064E7
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2024 09:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1703728571C
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2024 07:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F9A5F876;
	Thu, 13 Jun 2024 07:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="irXqdxyE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Ehw7Oh0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="irXqdxyE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Ehw7Oh0"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058B55B5D3
	for <linux-fbdev@vger.kernel.org>; Thu, 13 Jun 2024 07:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718263437; cv=none; b=l9Y+S/lZ9z8nbhdwyYU1UVTyXivO7vHb3X4tNiS/k/pC5z4rdEKrMRld1BaqO6NMpT0w2wXefm4EMuJGhZ9I+USl4bgpIyVssnHw24fKEA8AhPUJMCm0fTrAtvwxCVhl7IUhwFpd7ZQSmH64YXFB+H6tLOYvxuD/3En6nIFj0pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718263437; c=relaxed/simple;
	bh=IsDmnFcMogDHJHge7gx2SsaR9JGZnrS5QwCZTCxq3YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NsgUc7tgIPK4m3VvcNhy15ReYUV14AMbgboX1x4tmtW/slVOYg417Sd0AJXVmmY2PFXQE/hOLuXsuqZFw/ebqreNupV8kmStWo2O96a1AyK+7QpbqzVLtpMPWxaBpyMu42yyTnGw8rKLIwMmq2usTtchBemw7giMXA5qiQLk8kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=irXqdxyE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Ehw7Oh0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=irXqdxyE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Ehw7Oh0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 30C4F5CF3E;
	Thu, 13 Jun 2024 07:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718263434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SD9jJQxX850TEtY3GdfTYWxCqj11TVq0qc3FL47gbt0=;
	b=irXqdxyEc/7ea+6XgGbI9LMU3bm1j9Ll7drjhesEMoskHm60BHY5eNdy09VQjGMssSzxTQ
	jcMDTgtONWLi37m+yYcjsgkls0y5wFczUQCOFXozcRoRlEioOEAdLWWqh7dhnZFt55iDgU
	fQMVJhArDKgLc6E58woRwMtLNAqP7fU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718263434;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SD9jJQxX850TEtY3GdfTYWxCqj11TVq0qc3FL47gbt0=;
	b=3Ehw7Oh0MZ+mpHqtbR3mDpucpdpDMyzWDXYcol4HNqUsrpAdYATNB30v1F+y1dINWZNO70
	ZQVMUyGLBM1cTzDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718263434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SD9jJQxX850TEtY3GdfTYWxCqj11TVq0qc3FL47gbt0=;
	b=irXqdxyEc/7ea+6XgGbI9LMU3bm1j9Ll7drjhesEMoskHm60BHY5eNdy09VQjGMssSzxTQ
	jcMDTgtONWLi37m+yYcjsgkls0y5wFczUQCOFXozcRoRlEioOEAdLWWqh7dhnZFt55iDgU
	fQMVJhArDKgLc6E58woRwMtLNAqP7fU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718263434;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SD9jJQxX850TEtY3GdfTYWxCqj11TVq0qc3FL47gbt0=;
	b=3Ehw7Oh0MZ+mpHqtbR3mDpucpdpDMyzWDXYcol4HNqUsrpAdYATNB30v1F+y1dINWZNO70
	ZQVMUyGLBM1cTzDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E38B813A87;
	Thu, 13 Jun 2024 07:23:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zMRENomeamZXSQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 13 Jun 2024 07:23:53 +0000
Message-ID: <eb8223e2-9bea-416d-a412-0a291523a0ff@suse.de>
Date: Thu, 13 Jun 2024 09:23:53 +0200
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
References: <CAAxE2A7qK1-b5g1RR-GJ+QTLEr_OxEr9vcZGEOkZY9yLOFLb5w@mail.gmail.com>
 <CAAxE2A6971oJ3r-8UWhL0BUZBiYxq4K0-Q39MJnb7ZozX3da-A@mail.gmail.com>
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
In-Reply-To: <CAAxE2A6971oJ3r-8UWhL0BUZBiYxq4K0-Q39MJnb7ZozX3da-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.26 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-0.97)[-0.969];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com,gmx.de,kernel.org,lists.freedesktop.org,vger.kernel.org,amd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.26
X-Spam-Level: 

Hi

Am 13.06.24 um 08:00 schrieb Marek Olšák:
> +amd-gfx
>
> On Thu, Jun 13, 2024 at 1:59 AM Marek Olšák <maraeo@gmail.com> wrote:
>> Hi Thomas,
>>
>> Commit 9eac534db0013aff9b9124985dab114600df9081 as per the title
>> breaks (crashes?) lightdm (login screen) such that all I get is the
>> terminal. It's also reproducible with tag v6.9 where the commit is
>> present.
>>
>> Reverting the commit fixes lightdm. A workaround is to bypass lightdm
>> by triggering auto-login. This is a bug report.

I see. Do you know why it crashes? Or have any logs.

Best regards
Thomas

>>
>> (For AMD folks: It's also reproducible with amd-staging-drm-next.)
>>
>> Marek

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


