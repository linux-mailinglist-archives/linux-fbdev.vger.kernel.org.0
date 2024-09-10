Return-Path: <linux-fbdev+bounces-3018-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5517972ABA
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Sep 2024 09:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46E7B282019
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Sep 2024 07:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13BE171671;
	Tue, 10 Sep 2024 07:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZHJtm0Sg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iYY32GUH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZHJtm0Sg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iYY32GUH"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207B81531F8;
	Tue, 10 Sep 2024 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953374; cv=none; b=SHoM9RRyQ8oWdfoqib5EgPnDIDWMXn3C19VtoVtenbnL9iVt1rZpO/iIQyBezSwx9zJvz/TBkTXonFk2T36ZA7C5Mp0L+8UNIQF5n1woYPsHBCMYi8nsZowd1XOfdsfFKpeOX/NwkZf1tuRc71UygXG3RmQPJ8xiuHwNwbtutdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953374; c=relaxed/simple;
	bh=jlgnBxyZIgIZ5LdYawJQETwr/n1jW0Va7pZEDRoYe2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOyeVRH6/p4Jf1JfcE3TKouJDcnS01QDm42RLqeRcLepcLFRwGNOmc7AdI1ZQOG27Z3lwAvs6eEGssd38xeoAi2Eh5k7ld8D0bwWuNlLpVAiH1sJhGsedokjAsCvSfwR7bP8qJ/LmPGYwONyBWfOQ2amMTNO1j6EIes/vbCrEKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZHJtm0Sg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iYY32GUH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZHJtm0Sg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iYY32GUH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3BFAB219FB;
	Tue, 10 Sep 2024 07:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725953371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MiDi2FHA9vw0R48kbGJoZgqTSRc3ZSboY8rVX/ccVPU=;
	b=ZHJtm0SgubpIDNQVqhNDd4qeu16fDkdq1hs9xlRV+iLvxqrUdWbsxiauuD/ipALIv3AbeJ
	JAlyn4gECJXQd1NUvCaQwuQ/GmocrLlCb3Kh1E86/L+GNQFKOIkZM1/YMd4Yy+mG4bmDwP
	klGCXjqhQmC9n+1Tq0FkKCoNzp8sV4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725953371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MiDi2FHA9vw0R48kbGJoZgqTSRc3ZSboY8rVX/ccVPU=;
	b=iYY32GUHw+AubQO8jsoZje/xUgexavsARV3esphtazmJSVfQZMdQPucZcUwTx7jX/Xxxqj
	+TOJ/XsVC4ngw7CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725953371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MiDi2FHA9vw0R48kbGJoZgqTSRc3ZSboY8rVX/ccVPU=;
	b=ZHJtm0SgubpIDNQVqhNDd4qeu16fDkdq1hs9xlRV+iLvxqrUdWbsxiauuD/ipALIv3AbeJ
	JAlyn4gECJXQd1NUvCaQwuQ/GmocrLlCb3Kh1E86/L+GNQFKOIkZM1/YMd4Yy+mG4bmDwP
	klGCXjqhQmC9n+1Tq0FkKCoNzp8sV4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725953371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MiDi2FHA9vw0R48kbGJoZgqTSRc3ZSboY8rVX/ccVPU=;
	b=iYY32GUHw+AubQO8jsoZje/xUgexavsARV3esphtazmJSVfQZMdQPucZcUwTx7jX/Xxxqj
	+TOJ/XsVC4ngw7CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E133313A3A;
	Tue, 10 Sep 2024 07:29:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id t5SwNVr132boJgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Sep 2024 07:29:30 +0000
Message-ID: <ad9e19af-fabd-4ce0-a9ac-741149f9aab3@suse.de>
Date: Tue, 10 Sep 2024 09:29:30 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/xen-fbfront: Assign fb_info->device
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
 Sam Ravnborg <sam@ravnborg.org>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>,
 Arthur Borsboom <arthurborsboom@gmail.com>, stable@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240910020919.5757-1-jandryuk@gmail.com>
 <Zt_zvt3VXwim_DwS@macbook.local>
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
In-Reply-To: <Zt_zvt3VXwim_DwS@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[citrix.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,arndb.de,ravnborg.org,lists.xenproject.org,amd.com,gmail.com,vger.kernel.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

Hi

Am 10.09.24 um 09:22 schrieb Roger Pau Monné:
> On Mon, Sep 09, 2024 at 10:09:16PM -0400, Jason Andryuk wrote:
>> From: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Probing xen-fbfront faults in video_is_primary_device().  The passed-in
>> struct device is NULL since xen-fbfront doesn't assign it and the
>> memory is kzalloc()-ed.  Assign fb_info->device to avoid this.
>>
>> This was exposed by the conversion of fb_is_primary_device() to
>> video_is_primary_device() which dropped a NULL check for struct device.
>>
>> Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video helpers")
>> Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
>> Closes: https://lore.kernel.org/xen-devel/CALUcmUncX=LkXWeiSiTKsDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com/
>> Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
>> CC: stable@vger.kernel.org
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>
>> ---
>> The other option would be to re-instate the NULL check in
>> video_is_primary_device()
> I do think this is needed, or at least an explanation.  The commit
> message in f178e96de7f0 doesn't mention anything about
> video_is_primary_device() not allowing being passed a NULL device
> (like it was possible with fb_is_primary_device()).
>
> Otherwise callers of video_is_primary_device() would need to be
> adjusted to check for device != NULL.

The helper expects a non-NULL pointer. We might want to document this.

Best regards
Thomas

>
> Thanks, Roger.
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


