Return-Path: <linux-fbdev+bounces-3434-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 805349EB53F
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Dec 2024 16:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D89E18859C1
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Dec 2024 15:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6602E1BB6A0;
	Tue, 10 Dec 2024 15:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P2nOYqBe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Y5aPObW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P2nOYqBe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Y5aPObW"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C421BBBC0
	for <linux-fbdev@vger.kernel.org>; Tue, 10 Dec 2024 15:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733845314; cv=none; b=O4g6phzKdcFlq5muXoVn8RQyKmVNvo+VKz3xoHLMUyL6MBy9gT6i4dv7Q5aQvwBYBsHoahGv7rZ8WD3LjY5LDrfezZAI5TipTWY9g46s8nK62qQYYtlfg5fxpRDF5frGHG/VhQ7nQL+zFJTmk+VZkVCLx0hU+hlXu5U5flPN/cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733845314; c=relaxed/simple;
	bh=kUO7gTsYOC8QlnFqmUzzXlHIrBM9zN0oit1MCaIN1Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWNB0LWVGLW7eQOARX6KQF28Jf275S1XIcvuBiGhkQf9jTOC+LplaZgYPyy+cPnK44tAvdziw+wWYvoLs1PYmKa6UPvhN0hvfoJOo/UjxDfznK1voQxMX90JjAy8USa9PCgg0KQNsQDk4i6U+mNrmQT/Yz4OkT4QLsMXo6Of430=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P2nOYqBe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2Y5aPObW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P2nOYqBe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2Y5aPObW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4AD1E21164;
	Tue, 10 Dec 2024 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733845310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ljEsm7TJ4xl65gPnIZTPCRWNux1vbeYnS1rz3s1AzDY=;
	b=P2nOYqBeFwO5+FaM82+YysPWHUh+Yo+y8TN6OOg4BLh2d0p0Z2uEjVUM+pgwQkhDO4MYpZ
	q94MdCMPWgtPmy6aErgOJpu4iQzRyhY4SioRNkOe2am6vmXRVbzdUazpNPlAcjVhYKVnv9
	tUN4idgn5IhjMyoFDQWkbJ5ljeaVHnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733845310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ljEsm7TJ4xl65gPnIZTPCRWNux1vbeYnS1rz3s1AzDY=;
	b=2Y5aPObW2Ia0vD5qtdbh9wtGfFcdLnygTv5iP4uyGWNhuku7DP11HgZSg9usy93tl6Nfeq
	cUUyO9a/P+YsaiBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P2nOYqBe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2Y5aPObW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733845310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ljEsm7TJ4xl65gPnIZTPCRWNux1vbeYnS1rz3s1AzDY=;
	b=P2nOYqBeFwO5+FaM82+YysPWHUh+Yo+y8TN6OOg4BLh2d0p0Z2uEjVUM+pgwQkhDO4MYpZ
	q94MdCMPWgtPmy6aErgOJpu4iQzRyhY4SioRNkOe2am6vmXRVbzdUazpNPlAcjVhYKVnv9
	tUN4idgn5IhjMyoFDQWkbJ5ljeaVHnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733845310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ljEsm7TJ4xl65gPnIZTPCRWNux1vbeYnS1rz3s1AzDY=;
	b=2Y5aPObW2Ia0vD5qtdbh9wtGfFcdLnygTv5iP4uyGWNhuku7DP11HgZSg9usy93tl6Nfeq
	cUUyO9a/P+YsaiBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3085138D2;
	Tue, 10 Dec 2024 15:41:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mqSqOT1hWGe8LAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Dec 2024 15:41:49 +0000
Message-ID: <e7d5fba5-7ecd-4ed3-be7a-56bf82030e67@suse.de>
Date: Tue, 10 Dec 2024 16:41:49 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Helge Deller <deller@gmx.de>, javierm@redhat.com, arnd@arndb.de,
 simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241210142329.660801-1-tzimmermann@suse.de>
 <20241210142329.660801-2-tzimmermann@suse.de>
 <b5136312-e18c-46cb-9a01-3efc61d6fd9a@gmx.de>
 <de810def-84ac-4d55-b625-536b5781a20f@gmx.de>
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
In-Reply-To: <de810def-84ac-4d55-b625-536b5781a20f@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4AD1E21164
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmx.de,redhat.com,arndb.de,ffwll.ch,gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

Hi


Am 10.12.24 um 15:34 schrieb Helge Deller:
> On 12/10/24 15:29, Helge Deller wrote:
>> On 12/10/24 15:09, Thomas Zimmermann wrote:
>>> diff --git a/drivers/staging/fbtft/Kconfig 
>>> b/drivers/staging/fbtft/Kconfig
>>> index 77ab44362f16..577e91ff7bf6 100644
>>> --- a/drivers/staging/fbtft/Kconfig
>>> +++ b/drivers/staging/fbtft/Kconfig
>>> @@ -3,6 +3,7 @@ menuconfig FB_TFT
>>>       tristate "Support for small TFT LCD display modules"
>>>       depends on FB && SPI
>>>       depends on FB_DEVICE
>>> +    depends on BACKLIGHT_DEVICE_CLASS
>>
>> Typo. Should be BACKLIGHT_CLASS_DEVICE...

Ah, thanks. I'll better check the rest of the series for similar mistakes.

>
> Beside the typo:
> In this case, doesn't it make sense to "select BACKLIGHT_DEVICE_CLASS" 
> instead?

That causes the dependency error mentioned in the commit message. This 
time it's just for fbtft instead of shmobilefb.

> If people want the fbtft, backlight support should be enabled too.

As a user-visible option, it should not be auto-selected unnecessarily. 
The DRM panel drivers already depend on the backlight instead of 
selecting it. It's the correct approach. As I mentioned in the cover 
letter, the few remaining driver that select it should probably be updated.

Best regards
Thomas

>
> Helge
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


