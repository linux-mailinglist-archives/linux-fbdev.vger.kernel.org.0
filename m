Return-Path: <linux-fbdev+bounces-1297-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 946F686FF41
	for <lists+linux-fbdev@lfdr.de>; Mon,  4 Mar 2024 11:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03CDCB22492
	for <lists+linux-fbdev@lfdr.de>; Mon,  4 Mar 2024 10:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E9C3715F;
	Mon,  4 Mar 2024 10:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tMQRSYoM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XYQeC44N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tMQRSYoM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XYQeC44N"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643D422636;
	Mon,  4 Mar 2024 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709548860; cv=none; b=jVhhSObys8tBAd/kohArbiNJ73771j9mT+m2Ljqj0TDgZBV6CIKtjLZIbwyt2OgZAfzk47TxNT5JNtFpE22DSjXHrjT/Zhcwk21nHZqFg+YUuRpQhGeEXNduRgyf72SyJTlafz9p2Xu4Cwc+vALOiaAPXHylynrdhVQw8mZfMuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709548860; c=relaxed/simple;
	bh=YSv/vn+Qe1BEooirO1LMLOLSxAjr6tnKnU55t6IIK/Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uV1PnZm3UllFk5qzUEVmaBCckIya/57sz6NGLOT3OfHpc0L8f45GdvZP5ORv4ctRYto9dJmNzg1ZZRf4D2r2IU80LIueiG7nnBTvi5CcC7PgdKnIsLZ3G7H32sZLJjEGNG0TiWxrr0qvuavjRU0a55nuitR+sQl7n7HYX918zbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tMQRSYoM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XYQeC44N; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tMQRSYoM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XYQeC44N; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9800175A87;
	Mon,  4 Mar 2024 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709548856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xyWx20EEGeDMum1IHBg2EeZSNR0w31fc1tpXGqJtQNk=;
	b=tMQRSYoMZwwxLQmOsunR9LbreJVo7yKTxNNxlmQOGHkSBWmI1PvbG5zXTguWFSDQLJq0i3
	MOqPJUaTcoELchNjk6HIKN2FSBl7qT5UlFU98V8WHMfPmeO51I+JoPfHVgU16MEipiefK0
	eTlPhNO4uOQ0UqfdAvuE6RhTf9Ml04U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709548856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xyWx20EEGeDMum1IHBg2EeZSNR0w31fc1tpXGqJtQNk=;
	b=XYQeC44NCF+x0+On5sr8Omo3VlkU3bsl5zlYnVK8CdTdYol+yqwHmbHyLrByJ2LbGLOvYt
	CSmCpRIG7JdfqSBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709548856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xyWx20EEGeDMum1IHBg2EeZSNR0w31fc1tpXGqJtQNk=;
	b=tMQRSYoMZwwxLQmOsunR9LbreJVo7yKTxNNxlmQOGHkSBWmI1PvbG5zXTguWFSDQLJq0i3
	MOqPJUaTcoELchNjk6HIKN2FSBl7qT5UlFU98V8WHMfPmeO51I+JoPfHVgU16MEipiefK0
	eTlPhNO4uOQ0UqfdAvuE6RhTf9Ml04U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709548856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xyWx20EEGeDMum1IHBg2EeZSNR0w31fc1tpXGqJtQNk=;
	b=XYQeC44NCF+x0+On5sr8Omo3VlkU3bsl5zlYnVK8CdTdYol+yqwHmbHyLrByJ2LbGLOvYt
	CSmCpRIG7JdfqSBg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 567F113419;
	Mon,  4 Mar 2024 10:40:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id ST6mEzil5WXWHAAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 04 Mar 2024 10:40:56 +0000
Message-ID: <e6839678-c801-4186-9c95-52747c80a3aa@suse.de>
Date: Mon, 4 Mar 2024 11:40:55 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: include linux/backlight.h from asm/backlight.h
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@intel.com>, Michael Ellerman
 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org,
 linux-kernel@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org
References: <CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com>
 <20240304095512.742348-1-jani.nikula@intel.com>
 <eed9bb0f-486f-47f3-b4b5-c07adda4a1c7@suse.de>
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
In-Reply-To: <eed9bb0f-486f-47f3-b4b5-c07adda4a1c7@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.75
X-Spamd-Result: default: False [-1.75 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 BAYES_HAM(-0.46)[79.13%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linaro.org,vger.kernel.org,linaro.org,gmx.de];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO



Am 04.03.24 um 11:32 schrieb Thomas Zimmermann:
[...]
>> ---
>>   arch/powerpc/include/asm/backlight.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/powerpc/include/asm/backlight.h 
>> b/arch/powerpc/include/asm/backlight.h
>> index 1b5eab62ed04..275d5bb9aa04 100644
>> --- a/arch/powerpc/include/asm/backlight.h
>> +++ b/arch/powerpc/include/asm/backlight.h
>> @@ -10,6 +10,7 @@
>>   #define __ASM_POWERPC_BACKLIGHT_H
>>   #ifdef __KERNEL__
>>   +#include <linux/backlight.h>
>
> Thanks, but I think this should go directly into chipsfb.c. I would 
> have provided a patch already, if our mail server didn't have issues 
> this morning. Let me try again.

Posted at

https://lore.kernel.org/dri-devel/20240304103820.16708-1-tzimmermann@suse.de/T/#u

>
> Best regards
> Thomas
>
>>   #include <linux/fb.h>
>>   #include <linux/mutex.h>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


