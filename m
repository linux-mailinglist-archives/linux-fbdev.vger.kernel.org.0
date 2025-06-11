Return-Path: <linux-fbdev+bounces-4480-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF117AD4C72
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Jun 2025 09:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79FB5167757
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Jun 2025 07:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E4D218AC7;
	Wed, 11 Jun 2025 07:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gG8HiGto";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tCjn/FG4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gG8HiGto";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tCjn/FG4"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F73A923
	for <linux-fbdev@vger.kernel.org>; Wed, 11 Jun 2025 07:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626330; cv=none; b=N1i2d+OVx9xZzuEm4XJuFoNYGzu8OgTxwOrqELhX4AHZWbGsuZteYmW7VJCGhTxv5+Mg4aovKngmAvy8fWM0gHmXfXwJTBF7BpqfsxpzRSOWv9g24Xx3QdFR55rxMLQ+r51luoBUSWp9VpvhJDIP1lPtrWdxu54aVMXUJzX6rMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626330; c=relaxed/simple;
	bh=/Fi0zvw6zBBGC9NgicSWg+lsFbDzHbzEw1oybpA0wCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jkVQX2+Xu8glVDS80tB981l/7hV/a8KeT9aRGd6XNqI5A4VcaFyvQiTqnBCHcqP17rJfuODvJFBxvsKI53HYUx8zcOmYSh9FUV9w4/jxW4kPsemsp6TzEe2bF3a+SqRPKJTCcgxkOQ1vcJfOIB3HlYVtcV+6fbjfnvEeuAFEuIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gG8HiGto; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tCjn/FG4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gG8HiGto; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tCjn/FG4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AF02F21755;
	Wed, 11 Jun 2025 07:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749626326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kiX1gBP4ZkjtcCmjALUkPX1xQ+yneT7Vi5apdcaPdW8=;
	b=gG8HiGtoAWmOKZALbwKHB0N+GBbZXuRryQibK3MTiNxDgDU0CjNqaLeSPYOI9w6Gv4mF66
	Gx/aJY9unYoQBQSs35XW+U85E+n3HTWJNRrdZg8K1s9xHbodqhfNSSPeaqfxxI/3lDdsWI
	up8TSFIGoQshxIrLFFYefE39JGZ7620=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749626326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kiX1gBP4ZkjtcCmjALUkPX1xQ+yneT7Vi5apdcaPdW8=;
	b=tCjn/FG4ewcQenwGPYCN0lxFAMEeYbbvOcPjwzhQuud3NSXQHoNvdZFvc3ESZR6cHpohCc
	WLUXsq8qOWrzNiAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749626326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kiX1gBP4ZkjtcCmjALUkPX1xQ+yneT7Vi5apdcaPdW8=;
	b=gG8HiGtoAWmOKZALbwKHB0N+GBbZXuRryQibK3MTiNxDgDU0CjNqaLeSPYOI9w6Gv4mF66
	Gx/aJY9unYoQBQSs35XW+U85E+n3HTWJNRrdZg8K1s9xHbodqhfNSSPeaqfxxI/3lDdsWI
	up8TSFIGoQshxIrLFFYefE39JGZ7620=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749626326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kiX1gBP4ZkjtcCmjALUkPX1xQ+yneT7Vi5apdcaPdW8=;
	b=tCjn/FG4ewcQenwGPYCN0lxFAMEeYbbvOcPjwzhQuud3NSXQHoNvdZFvc3ESZR6cHpohCc
	WLUXsq8qOWrzNiAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8322E139CE;
	Wed, 11 Jun 2025 07:18:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id deCmHtYtSWikVAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 11 Jun 2025 07:18:46 +0000
Message-ID: <e5708928-e562-4b2d-9f96-8e44448a9c30@suse.de>
Date: Wed, 11 Jun 2025 09:18:46 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] fbdev: Include <linux/export.h>
To: Helge Deller <deller@gmx.de>, soci@c64.rulez.org, simona@ffwll.ch
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250610105948.384540-1-tzimmermann@suse.de>
 <20250610105948.384540-3-tzimmermann@suse.de>
 <a262f5a0-ba63-4692-a84b-216c4bfe5b4d@gmx.de>
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
In-Reply-To: <a262f5a0-ba63-4692-a84b-216c4bfe5b4d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

Hi

Am 10.06.25 um 21:58 schrieb Helge Deller:
> On 6/10/25 12:56, Thomas Zimmermann wrote:
>> Fix the compile-time warnings
>>
>>    drivers/video/fbdev/core/cfbcopyarea.c: warning: EXPORT_SYMBOL() 
>> is used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/cfbfillrect.c: warning: EXPORT_SYMBOL() 
>> is used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/cfbimgblt.c: warning: EXPORT_SYMBOL() is 
>> used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/fb_ddc.c: warning: EXPORT_SYMBOL() is 
>> used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/fb_defio.c: warning: EXPORT_SYMBOL() is 
>> used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/fb_io_fops.c: warning: EXPORT_SYMBOL() is 
>> used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/fb_sys_fops.c: warning: EXPORT_SYMBOL() 
>> is used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/fbcmap.c: warning: EXPORT_SYMBOL() is 
>> used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/fbcon.c: warning: EXPORT_SYMBOL() is 
>> used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/fbmon.c: warning: EXPORT_SYMBOL() is 
>> used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/modedb.c: warning: EXPORT_SYMBOL() is 
>> used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/svgalib.c: warning: EXPORT_SYMBOL() is 
>> used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/syscopyarea.c: warning: EXPORT_SYMBOL() 
>> is used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/sysfillrect.c: warning: EXPORT_SYMBOL() 
>> is used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/core/sysimgblt.c: warning: EXPORT_SYMBOL() is 
>> used, but #include <linux/export.h> is missing
>>    drivers/video/fbdev/macmodes.c: warning: EXPORT_SYMBOL() is used, 
>> but #include <linux/export.h> is missing
>>    drivers/video/fbdev/sbuslib.c: warning: EXPORT_SYMBOL() is used, 
>> but #include <linux/export.h> is missing
>>    drivers/video/fbdev/wmt_ge_rops.c: warning: EXPORT_SYMBOL() is 
>> used, but #include <linux/export.h> is missing
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/video/fbdev/core/cfbcopyarea.c | 2 ++
>>   drivers/video/fbdev/core/cfbfillrect.c | 2 ++
>>   drivers/video/fbdev/core/cfbimgblt.c   | 2 ++
>>   drivers/video/fbdev/core/fb_ddc.c      | 1 +
>>   drivers/video/fbdev/core/fb_defio.c    | 1 +
>>   drivers/video/fbdev/core/fb_io_fops.c  | 1 +
>>   drivers/video/fbdev/core/fb_sys_fops.c | 2 ++
>>   drivers/video/fbdev/core/fbcmap.c      | 1 +
>>   drivers/video/fbdev/core/fbcon.c       | 1 +
>>   drivers/video/fbdev/core/fbmon.c       | 2 ++
>>   drivers/video/fbdev/core/modedb.c      | 1 +
>>   drivers/video/fbdev/core/svgalib.c     | 1 +
>>   drivers/video/fbdev/core/syscopyarea.c | 2 ++
>>   drivers/video/fbdev/core/sysfillrect.c | 2 ++
>>   drivers/video/fbdev/core/sysimgblt.c   | 2 ++
>>   drivers/video/fbdev/macmodes.c         | 1 +
>>   drivers/video/fbdev/sbuslib.c          | 1 +
>>   drivers/video/fbdev/wmt_ge_rops.c      | 1 +
>>   18 files changed, 26 insertions(+)
>
> Reviewed-by: Helge Deller <deller@gmx.de>
>
> I wonder why this shows up for you but not for me...

They show up with v6.16-rc1 when I build with W=1. IDK if there's an 
additional config option involved. It's not just fbdev, the kernel is 
full of them.

Best regards
Thomas

>
> Helge

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


