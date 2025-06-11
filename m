Return-Path: <linux-fbdev+bounces-4481-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3186FAD4C74
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Jun 2025 09:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C567C1895CF9
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Jun 2025 07:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5852144A2;
	Wed, 11 Jun 2025 07:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UbFDuONn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e9P/61h6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UbFDuONn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e9P/61h6"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB31A923
	for <linux-fbdev@vger.kernel.org>; Wed, 11 Jun 2025 07:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626386; cv=none; b=HTsIal88UfNOWbtkS0cERXLaeVzFUsxGp7Esj2gx/6cNJm0Rku2f9tqoupUWMOgj914wyKi6vNq3QPVFRaJf5fSX/l7GkNNaX+7S42mZ7UsXaoVHlNA/sfTPQFUmF6qvn8/kXPUusEp51kG87c9lLiXxN6nL2iGFr0mBvvA/dY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626386; c=relaxed/simple;
	bh=E6IOE6xpudIBjIlSApvTRHP6zS0JuWEGyoFJfjn8vB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwJwqR2StTgvFtCPvtCWWN96JxiVYEA263yRWY6HWj/xbQ9WVx+9BpQjuIgrJrwMNWNfeRPnYeTjAD4QW34ycB/pxNmcJj4911KgaDupvGa1xovkAZLKFWO6hWQEABK6MXnVaBHTQNL5Ft5MirefmTmLDb3fSLOQXMEUS/flZ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UbFDuONn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e9P/61h6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UbFDuONn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e9P/61h6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF2871F766;
	Wed, 11 Jun 2025 07:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749626382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CZ5BQktB6JiV0FnWi9nQ7rwGkB2UwahoOlBgBu4kiZg=;
	b=UbFDuONn90TxulA/TsEB5Or0z3DHu3mRSKGWotPjdrSP5AqXCPl/O4Di0UElVV4pqLjyDk
	0AODzhEzG/tTjCed/SZdTZdhDcI/DWYMEmyCSQpy40QLderMU8/gTj4QXEwmE9lRYQDwm8
	blEMPjmgyyZP0uPV3tG9PGVanm29Ugc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749626382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CZ5BQktB6JiV0FnWi9nQ7rwGkB2UwahoOlBgBu4kiZg=;
	b=e9P/61h6dELyLz57LDyrfq+zOqs8WWi62EOm4SRVmtlOfiHhUZtvveCbAawSTQh432N4Bi
	ZhOpmwTyqVH08ICQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UbFDuONn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="e9P/61h6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749626382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CZ5BQktB6JiV0FnWi9nQ7rwGkB2UwahoOlBgBu4kiZg=;
	b=UbFDuONn90TxulA/TsEB5Or0z3DHu3mRSKGWotPjdrSP5AqXCPl/O4Di0UElVV4pqLjyDk
	0AODzhEzG/tTjCed/SZdTZdhDcI/DWYMEmyCSQpy40QLderMU8/gTj4QXEwmE9lRYQDwm8
	blEMPjmgyyZP0uPV3tG9PGVanm29Ugc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749626382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CZ5BQktB6JiV0FnWi9nQ7rwGkB2UwahoOlBgBu4kiZg=;
	b=e9P/61h6dELyLz57LDyrfq+zOqs8WWi62EOm4SRVmtlOfiHhUZtvveCbAawSTQh432N4Bi
	ZhOpmwTyqVH08ICQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87372139CE;
	Wed, 11 Jun 2025 07:19:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0GhHHQ4uSWgAVQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 11 Jun 2025 07:19:42 +0000
Message-ID: <c60bc49c-c578-4822-8898-46d8f4493e27@suse.de>
Date: Wed, 11 Jun 2025 09:19:42 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] fbdev/cyber2000fb: Unexport symbols
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250610105948.384540-1-tzimmermann@suse.de>
 <20250610105948.384540-5-tzimmermann@suse.de>
 <7928576a-dffb-4d27-a04b-8257d7f25383@gmx.de>
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
In-Reply-To: <7928576a-dffb-4d27-a04b-8257d7f25383@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AF2871F766
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
X-Spam-Level: 

Hi

Am 10.06.25 um 22:10 schrieb Helge Deller:
> On 6/10/25 12:56, Thomas Zimmermann wrote:
>> Fix the compile-time warning
>>
>>    drivers/video/fbdev/cyber2000fb.c: warning: EXPORT_SYMBOL() is 
>> used, but #include <linux/export.h> is missing
>>
>> The affected symbols are not used outside of their module.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/video/fbdev/cyber2000fb.c | 4 ----
>>   1 file changed, 4 deletions(-)
>
>
> Seems those functions were used for some capture card/tv driver
> functionality in the past.
> Maybe we should simply remove those functions today?

Good point. I'll go through the series again and remove any unused code.

Best regards
Thomas

>
> Helge
>
>>
>> diff --git a/drivers/video/fbdev/cyber2000fb.c 
>> b/drivers/video/fbdev/cyber2000fb.c
>> index 986760b90465..fcc565b2d98c 100644
>> --- a/drivers/video/fbdev/cyber2000fb.c
>> +++ b/drivers/video/fbdev/cyber2000fb.c
>> @@ -1089,7 +1089,6 @@ void cyber2000fb_enable_extregs(struct cfb_info 
>> *cfb)
>>           cyber2000_grphw(EXT_FUNC_CTL, old, cfb);
>>       }
>>   }
>> -EXPORT_SYMBOL(cyber2000fb_enable_extregs);
>>     /*
>>    * Disable access to the extended registers
>> @@ -1109,7 +1108,6 @@ void cyber2000fb_disable_extregs(struct 
>> cfb_info *cfb)
>>       else
>>           cfb->func_use_count -= 1;
>>   }
>> -EXPORT_SYMBOL(cyber2000fb_disable_extregs);
>>     /*
>>    * Attach a capture/tv driver to the core CyberX0X0 driver.
>> @@ -1135,7 +1133,6 @@ int cyber2000fb_attach(struct cyberpro_info 
>> *info, int idx)
>>         return int_cfb_info != NULL;
>>   }
>> -EXPORT_SYMBOL(cyber2000fb_attach);
>>     /*
>>    * Detach a capture/tv driver from the core CyberX0X0 driver.
>> @@ -1143,7 +1140,6 @@ EXPORT_SYMBOL(cyber2000fb_attach);
>>   void cyber2000fb_detach(int idx)
>>   {
>>   }
>> -EXPORT_SYMBOL(cyber2000fb_detach);
>>     #ifdef CONFIG_FB_CYBER2000_DDC
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


