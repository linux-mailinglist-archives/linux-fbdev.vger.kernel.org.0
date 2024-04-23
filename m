Return-Path: <linux-fbdev+bounces-2127-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D68AE3DB
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Apr 2024 13:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D78E61F23F63
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Apr 2024 11:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD0D7E59F;
	Tue, 23 Apr 2024 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SSeaQMW8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6+AlQIsL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pklb+EGt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5xYLAUg2"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E296E6E617;
	Tue, 23 Apr 2024 11:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713871633; cv=none; b=Xybbv7pwgA9F5GAYCI3X7lQUV/MViSUpO2m7vsQU7zzLzLWAMOpK4Kk9t10iUyBldfFrl4qF/03KlSbFkkFEUeBKaFOGY5yhcwCmSI9OFTRSKoLT2EIcGI2EbHUpVpxtP/TKj8dEUMfIzNnLl8WYWOZBikbsTpPep1ttBihHNhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713871633; c=relaxed/simple;
	bh=ueYji0xidRGXvo2rPszEPUmQZsK73RJ6pImfZ3Yo0cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhT9lMgS2nw7AMJK0WgzliZVluOqBdEf2ic8+CDC9TYD45jQeiWPHQraRNFc1YMnL88daho+4BCdewtw1rzgNTtJnX5hWLHLg866ic9ModjrDblI88qbWl3sdExSDjcsoEXQZ9RUXMBtepK89wDovHA/Ic75bdtXVUsatUobNvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SSeaQMW8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6+AlQIsL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pklb+EGt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5xYLAUg2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C8A0237E5E;
	Tue, 23 Apr 2024 11:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713871630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mzLNT4UJJ35qwBy06Z65wFSAnrbvdPTohIJO40vB644=;
	b=SSeaQMW8OkbhmbqLKVc3CAKufCTgOK/Y0+QT4OEbQWPiKQL2cqTyXulNuBtVvDPiK8w7Fo
	SqQrIvc0+/iLMiIsTPn0NkEf06f6/c3oZXDLg1QNhyz/P9inDR2nbVQP8oE02xm4nX+0Bc
	HIdU75SVQAEHDVO4BKXtQ7hlCcVVE5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713871630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mzLNT4UJJ35qwBy06Z65wFSAnrbvdPTohIJO40vB644=;
	b=6+AlQIsLUrniKK5AGxHJkoB/hG5FPYIpWGf9QRTOoqZG8XLVFC/sFHdTwE1OKH2YF5C2xa
	9Rw1eeJZX9WRo5DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713871629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mzLNT4UJJ35qwBy06Z65wFSAnrbvdPTohIJO40vB644=;
	b=pklb+EGt1joraBB6x8D9MNGHJQ0w8k1K/9Q1TRLbVnFVmBbZfTbOUzIOKtU4Gm3wQxW6bv
	lCJGR8+KK+732ArQASXd1lm7Kl/5/F9jgobi5M6QT6VbWsp2nvLZfDY/KZVSuZNv0DDh/x
	T61ZjdBETOfe0H8I+PNGnMJwRcMUoxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713871629;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mzLNT4UJJ35qwBy06Z65wFSAnrbvdPTohIJO40vB644=;
	b=5xYLAUg2xvsgoF6kB3Fmkh6KR+70IjZyvvldJPuNciuU2ifqw5RIwAjOlg5CvtsPW6FJpY
	CWq1dSWHRb8z01AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7ED991399F;
	Tue, 23 Apr 2024 11:27:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zT2gHQ2bJ2YdQQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 23 Apr 2024 11:27:09 +0000
Message-ID: <64c1585d-70e0-47d4-9d78-405b483b433c@suse.de>
Date: Tue, 23 Apr 2024 13:27:09 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: fix incorrect address computation in deferred IO
To: Nam Cao <namcao@linutronix.de>
Cc: Jaya Kumar <jayalk@intworks.biz>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tiwai@suse.de, bigeasy@linutronix.de,
 patrik.r.jakobsson@gmail.com, Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 stable@vger.kernel.org
References: <20240419190032.40490-1-namcao@linutronix.de>
 <666d986e-5227-4b6d-829c-95ff16115488@suse.de>
 <20240423095538.m79ML6a0@linutronix.de>
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
In-Reply-To: <20240423095538.m79ML6a0@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	FREEMAIL_CC(0.00)[intworks.biz,ffwll.ch,gmx.de,redhat.com,vger.kernel.org,lists.freedesktop.org,suse.de,linutronix.de,gmail.com,oracle.com,intel.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: -2.79
X-Spam-Flag: NO

Hi

Am 23.04.24 um 11:55 schrieb Nam Cao:
[...]
>>> Fix this by taking the mapping offset into account.
>>>
>>> Reported-and-tested-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
>>> Closes: https://lore.kernel.org/linux-fbdev/271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com
>>> Fixes: 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref struct")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Nam Cao <namcao@linutronix.de>
>>> ---
>>>    drivers/video/fbdev/core/fb_defio.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
>>> index dae96c9f61cf..d5d6cd9e8b29 100644
>>> --- a/drivers/video/fbdev/core/fb_defio.c
>>> +++ b/drivers/video/fbdev/core/fb_defio.c
>>> @@ -196,7 +196,8 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
>>>     */
>>>    static vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, struct vm_fault *vmf)
>>>    {
>>> -	unsigned long offset = vmf->address - vmf->vma->vm_start;
>>> +	unsigned long offset = vmf->address - vmf->vma->vm_start
>>> +			+ (vmf->vma->vm_pgoff << PAGE_SHIFT);
>> The page-fault handler at [1] use vm_fault.pgoff to retrieve the page
>> structure. Can we do the same here and avoid that computation?
> Yes, thanks for the suggestion.
>
> It will change things a bit: offset will not be the exact value anymore,
> but will be rounded down to multiple of PAGE_SIZE. But that doesn't matter,
> because it will only be used to calculate the page offset later on.
>
> We can clean this up and rename this "offset" to "pg_offset". But that's
> for another day.

But can't we use struct vm_fault.pgoff directly? The page-fault handler 
has used it since forever. The look-up code for the pageref should 
probably do the same, because there's a 1:1 connection between the page 
and the pageref. The pageref structure only exists because we cannot 
store its data in struct page directly.

AFAICT pgoff is exactly the value want to compute. See [1] and  the 
calculation at [2].

[1] https://elixir.bootlin.com/linux/v6.8/source/mm/memory.c#L5222
[2] 
https://elixir.bootlin.com/linux/v6.8/source/include/linux/pagemap.h#L957

Best regards
Thomas

>
> Best regards,
> Nam

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


