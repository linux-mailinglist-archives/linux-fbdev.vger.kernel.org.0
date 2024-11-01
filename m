Return-Path: <linux-fbdev+bounces-3350-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2295F9B8CE6
	for <lists+linux-fbdev@lfdr.de>; Fri,  1 Nov 2024 09:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A8B81C214ED
	for <lists+linux-fbdev@lfdr.de>; Fri,  1 Nov 2024 08:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A55156649;
	Fri,  1 Nov 2024 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gqgw7vnA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0D0wII3W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gqgw7vnA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0D0wII3W"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F131527A7
	for <linux-fbdev@vger.kernel.org>; Fri,  1 Nov 2024 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449167; cv=none; b=ehnqtBhRgEdGD9cr9xHOHleOHuooPswY2I9kCqSue87wsRlI9b+p5TrHpn6FvLrUzQib915wTlIWdBGOIyJdLq1KuSSfTH7x5Op6m8gPfdM328LO233moVWUCYef3ot6iDYOHJFlVPxhlgXlR+zgi6qeWnPd7K6LqDaj5TVymKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449167; c=relaxed/simple;
	bh=cbKzx0Yql/LN3mNUXdqcyk6hcxrRFg55+IOXXF3II7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P2eeyvSTRidmcyhFZHqBkGpu0yIUY9w7Hb6tRPKocR29NFL+kfw0NwJ13cr1LuB5FwP1oyPjcktNJnz6iC8nsKNyZ54C6wpqBIq7aLK9ND9qOu0v5LGEfHv9r6O3sFhvxbnSl9piflYbamubA5/MJvYan2cDmSFSOlDmkgYubOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gqgw7vnA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0D0wII3W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gqgw7vnA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0D0wII3W; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 818F521CC4;
	Fri,  1 Nov 2024 08:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730449163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0E7fd5qsqCk48gjzGghBrw3NvcCrYTJndGsrk6dTQdw=;
	b=Gqgw7vnALpJA7oIfeFKQiZEu2myb0onpjQefr/hF9mg6nW0P6SVRwih9NJtcj1ShaA2xhl
	8eW1udUg6zMEhbiIJ125luW6il+dvf7U/StwQLPcwsbydqCNzdkJ28QpaJoWkqVIWHpjUr
	RBntqjbUVPS+xJCAB4pjDSDKQpLSBXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730449163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0E7fd5qsqCk48gjzGghBrw3NvcCrYTJndGsrk6dTQdw=;
	b=0D0wII3WFYmXTHSZWwGaZlhRTS5iiI57jVjc/ZjpDeqUI1NC7Nbx2KTb9eMNX2GitOdjou
	F/Hx8xyAQ0Fu4vCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Gqgw7vnA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0D0wII3W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730449163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0E7fd5qsqCk48gjzGghBrw3NvcCrYTJndGsrk6dTQdw=;
	b=Gqgw7vnALpJA7oIfeFKQiZEu2myb0onpjQefr/hF9mg6nW0P6SVRwih9NJtcj1ShaA2xhl
	8eW1udUg6zMEhbiIJ125luW6il+dvf7U/StwQLPcwsbydqCNzdkJ28QpaJoWkqVIWHpjUr
	RBntqjbUVPS+xJCAB4pjDSDKQpLSBXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730449163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0E7fd5qsqCk48gjzGghBrw3NvcCrYTJndGsrk6dTQdw=;
	b=0D0wII3WFYmXTHSZWwGaZlhRTS5iiI57jVjc/ZjpDeqUI1NC7Nbx2KTb9eMNX2GitOdjou
	F/Hx8xyAQ0Fu4vCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EA3413722;
	Fri,  1 Nov 2024 08:19:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gA6eFQuPJGeeKAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 01 Nov 2024 08:19:23 +0000
Message-ID: <fe074ca8-b330-42b3-ab1c-83cfab3a7ded@suse.de>
Date: Fri, 1 Nov 2024 09:19:23 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
To: Helge Deller <deller@gmx.de>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
 <7aabca78-dd34-4819-8a63-105d1a4cb4ba@gmx.de>
 <7e33bfa5-1444-4152-b240-946a51e12b26@suse.de>
 <5b4bfeaf-d9b4-4196-b1e8-ef58b1b6607e@gmx.de>
 <46712e5b-701b-41c5-82f0-d6b41f5947af@suse.de>
 <3f655f6f-58a7-4526-91ae-6dc4793eeefb@gmx.de>
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
In-Reply-To: <3f655f6f-58a7-4526-91ae-6dc4793eeefb@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 818F521CC4
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmx.de,gmail.com,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,bootlin.com:url,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Hi

Am 30.10.24 um 10:30 schrieb Helge Deller:

>>>
>>> I'm happy to get rid of the fbdev drivers, but for that DRM really 
>>> needs
>>> to allow some sort of native fillrect, copyarea and imageblt 
>>> operations so
>>> that we can get performance back on the old cards when implementing 
>>> them
>>> as DRM driver.
>>
>> This is unrelated to udl.
>
> No, it's not.
> The udl fbdev driver implements those functions (like the other fbdev 
> drivers)
> and as such fbcon on top of udl is accelerated, while fbcon on drm 
> drivers
> is unaccelerated.

Udlfb uses the regular software implementations to draw into its shadow 
buffer. It then schedules an update to copy the update over USB to the 
adapter's internal framebuffer memory. [1] Udl uses exactly the same 
code pattern and most of the involved helpers. [2]

[1] 
https://elixir.bootlin.com/linux/v6.11.5/source/drivers/video/fbdev/udlfb.c#L1145
[2] 
https://elixir.bootlin.com/linux/v6.11.5/source/drivers/gpu/drm/drm_fbdev_shmem.c#L39

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


