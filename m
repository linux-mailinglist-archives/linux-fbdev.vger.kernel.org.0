Return-Path: <linux-fbdev+bounces-3458-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3089F057D
	for <lists+linux-fbdev@lfdr.de>; Fri, 13 Dec 2024 08:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26E46169729
	for <lists+linux-fbdev@lfdr.de>; Fri, 13 Dec 2024 07:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106E4192D7B;
	Fri, 13 Dec 2024 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dsLLdgfY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WGZmmgRI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dsLLdgfY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WGZmmgRI"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EA0192D83
	for <linux-fbdev@vger.kernel.org>; Fri, 13 Dec 2024 07:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734074919; cv=none; b=PF5a3+rT4AAmHv/lgoubaQBoZJYEwhBJq2gwufhiLzj7CXuBddWJ7mID/dLDW8SErdltW1ZeuEdVxHAAKQJX9wbVZMj0J2A6zznzXDlIdq3XdCSpJ9YP9tWIQYUUKQXXi9uQt5ML7ERwjk/Rn+UIpCtnn7/Oe5L08RjtMA2xYTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734074919; c=relaxed/simple;
	bh=AhyLgAEE136UInbFR6gzYtxun0zGxbi9VtzSijzrTeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azfXqVjBP9APF3W9wUwvJjF0Y7eruLgVSCvg3Z6z/UQSlQx0Ygi11kBjz/8zK1sUkJngMN1L8BuFbMQ0mRGFPubvAOEeOwdNfBflqq7EJXToiGKzwYqtEN0cSS1XtRi3AtXYCS+joyIXUhmamtw3JqXQRYNnhIDlVrknhxCE03k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dsLLdgfY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WGZmmgRI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dsLLdgfY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WGZmmgRI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 537AC21165;
	Fri, 13 Dec 2024 07:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734074916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=itLMReNMeluLZhgza4d7O84w8Q+y2cT/bNHvd7G+cSA=;
	b=dsLLdgfY/l6iED+0HkvFxNs9wxqWdx8AtfwtjfNKv7z2eYPE4Vz73U/2MgqMopJqgfiC1w
	JU/Ea4ethrydfjbg/iPxyCsJV3nexoBlyx6OlhVKuuO6X6QulQ58wo4dbXuaxrItoarAq3
	wE518vIkIXon/AJbFQHiIW8aqm55PHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734074916;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=itLMReNMeluLZhgza4d7O84w8Q+y2cT/bNHvd7G+cSA=;
	b=WGZmmgRIhSaBtMjC21GcD69fni6WHPuOx2NfRKQXAl9mxWazkpwLfw/c1GXvwjf/wqA+uN
	nnmUsHLTbV2lUACg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734074916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=itLMReNMeluLZhgza4d7O84w8Q+y2cT/bNHvd7G+cSA=;
	b=dsLLdgfY/l6iED+0HkvFxNs9wxqWdx8AtfwtjfNKv7z2eYPE4Vz73U/2MgqMopJqgfiC1w
	JU/Ea4ethrydfjbg/iPxyCsJV3nexoBlyx6OlhVKuuO6X6QulQ58wo4dbXuaxrItoarAq3
	wE518vIkIXon/AJbFQHiIW8aqm55PHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734074916;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=itLMReNMeluLZhgza4d7O84w8Q+y2cT/bNHvd7G+cSA=;
	b=WGZmmgRIhSaBtMjC21GcD69fni6WHPuOx2NfRKQXAl9mxWazkpwLfw/c1GXvwjf/wqA+uN
	nnmUsHLTbV2lUACg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12A6713927;
	Fri, 13 Dec 2024 07:28:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vEXRAiTiW2euDQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Dec 2024 07:28:36 +0000
Message-ID: <11d71f56-853b-47b2-b430-658343aac665@suse.de>
Date: Fri, 13 Dec 2024 08:28:35 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <09edb59a-527a-4ddb-bfaf-ea74fb5a3023@gmx.de>
 <88ce6863-4458-47cb-9b28-274c91bd8764@app.fastmail.com>
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
In-Reply-To: <88ce6863-4458-47cb-9b28-274c91bd8764@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -8.30
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_TO(0.00)[arndb.de,gmx.de,redhat.com,ffwll.ch,gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

Hi


Am 12.12.24 um 22:04 schrieb Arnd Bergmann:
> On Thu, Dec 12, 2024, at 19:44, Helge Deller wrote:
>> On 12/12/24 11:04, Thomas Zimmermann wrote:
>>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>>> only controls backlight support within fbdev core code and data
>>> structures.
>>>
>>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>>> select it explicitly. Fixes warnings about recursive dependencies,
>>> such as [...]
>> I think in the fbdev drivers themselves you should do:
>> 	select BACKLIGHT_CLASS_DEVICE
>> instead of "depending" on it.
>> This is the way as it's done in the DRM tiny and the i915/gma500 DRM drivers.
>>
>> So, something like:
>>
>> --- a/drivers/staging/fbtft/Kconfig
>>          tristate "Support for small TFT LCD display modules"
>>          depends on FB && SPI
>>          depends on FB_DEVICE
>>     +    select BACKLIGHT_DEVICE_CLASS
>>          depends on GPIOLIB || COMPILE_TEST
>>          select FB_BACKLIGHT
>>
>> config FB_BACKLIGHT
>>             tristate
>>             depends on FB
>>     -	  select BACKLIGHT_CLASS_DEVICE
>>     +       depends on BACKLIGHT_CLASS_DEVICE
>>
>>
>> Would that fix the dependency warning?
> The above is generally a mistake and the root cause of the
> dependency loops. With very few exceptions, the solution in
> these cases is to find the inconsistent 'select' and change
> it into 'depends on'.
>
> I actually have a few more patches like this that I've
> been carrying for years now, e.g. one that changes all the
> 'select I2C' into appropriate dependencies.

Thanks! If you have something for DRM, please submit. In the case of 
i2c, it might happen that the driver is useful without i2c support. But 
that's a discussion for the individual reviews.

Best regards
Thomas

>
>         Arnd

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


