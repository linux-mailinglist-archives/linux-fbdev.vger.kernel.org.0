Return-Path: <linux-fbdev+bounces-3468-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE80B9F0957
	for <lists+linux-fbdev@lfdr.de>; Fri, 13 Dec 2024 11:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D50018838CF
	for <lists+linux-fbdev@lfdr.de>; Fri, 13 Dec 2024 10:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF97C1B85D0;
	Fri, 13 Dec 2024 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QB3BAAvl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j6UBVK3e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tPrPshOR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F35EiPjf"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287D91B6D18
	for <linux-fbdev@vger.kernel.org>; Fri, 13 Dec 2024 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085465; cv=none; b=mzq/u+HvFjmTgsY9kv+6HO9TjUJWNUPbdYa/ZPUYOQDjrqkwjN9JoiKVxyeXLXqfjVqDkBAABOHWlWVcX9Oux1afu+dRd9Tsx916faMRobJfHTE5lJITudz6ez/h5Wf5RYGBD12+YiP+kwDe2TMBuIq+4cHxM5l5WXblveObk9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085465; c=relaxed/simple;
	bh=Aw6JHmCl1VWLKX2/sE4YgAqjtp7IoTiRAOMRCD0BNl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ji+9RYs1s+EJX5PwZEHQtZGYSXYtq83SCtWu61PompA49/7yhys5aYe/UlFuptGLHByDOx9Xj4qR/cieYUIHtGclFjComNvcQ+HDhAiou0d8D1lPSar2ArxG+KXmM93j58iyWrDrCwPdMMUMFdsE5h9LrHPqAM9LUDkTvAmxfrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QB3BAAvl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j6UBVK3e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tPrPshOR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F35EiPjf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4AE222115C;
	Fri, 13 Dec 2024 10:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734085462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wj3FQ4EHvuZ3Loo4qRwR0MhYvA8lZqwuoXZj5chSjlA=;
	b=QB3BAAvlMjSbem64YecmVjJGmws8bfOvUTD+KKvi7kRCMKvWOApY0uIfCet5lxrNDfoDUF
	kYKima0XfjJ//cp6X9aPRpiv/cXNNNy+DfGwJ7aRzfdpnBl+Q98kMFgLY0/8dCj8FH7Eso
	yySpVrlwNrq43Uq6G/B7E43pyz64j4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734085462;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wj3FQ4EHvuZ3Loo4qRwR0MhYvA8lZqwuoXZj5chSjlA=;
	b=j6UBVK3eUBa8uR6nex3nUMjcfXl1CQPkSFrZPH8x2W8kQHDeRo1nrlthyHhnPsC73eZWWs
	xJe2M8NkIDdXsJAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tPrPshOR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=F35EiPjf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734085461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wj3FQ4EHvuZ3Loo4qRwR0MhYvA8lZqwuoXZj5chSjlA=;
	b=tPrPshOR8OGskNXqtHG5zsWfTFtAWkW2VMrNqELtJBW6l/2NFdcLs1OxedCw7R6xiZ51m7
	h9tq3+U4I4rCuekR9CMWLRcbws6ajAhE5g6ncB3sCzZigANSiWhCZINWRagT/etWKBQbFJ
	69sP2Jse0IoReokkrtrtOL0MchDeYg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734085461;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wj3FQ4EHvuZ3Loo4qRwR0MhYvA8lZqwuoXZj5chSjlA=;
	b=F35EiPjf6rljhpNclFMv1DDqnxhLuSBOgjJzXGatSr0F1Y6LNmfwdq48C8L2640wlOpX+G
	v8fzZgkVV3eOKTCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8DF813939;
	Fri, 13 Dec 2024 10:24:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +v76KVQLXGdsSAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Dec 2024 10:24:20 +0000
Message-ID: <eea7e1f0-cdcf-49ca-b50b-cac9bb320f4e@suse.de>
Date: Fri, 13 Dec 2024 11:24:20 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Christophe Leroy <christophe.leroy@csgroup.eu>, javierm@redhat.com,
 arnd@arndb.de, deller@gmx.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <8403f989-c1de-48c9-ab48-83c1abb9e6f2@csgroup.eu>
 <5484d576-d63e-4166-85ea-0b508b0cb865@suse.de>
 <1248a2b6-71b0-4909-917f-a5605415a816@csgroup.eu>
 <690acce6-3e57-4731-9949-f8bb06d9cb58@suse.de>
 <941b3560-6572-476b-9e9f-c0a6df3e9ff4@csgroup.eu>
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
In-Reply-To: <941b3560-6572-476b-9e9f-c0a6df3e9ff4@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4AE222115C
X-Spam-Score: -4.51
X-Rspamd-Action: no action
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
	FREEMAIL_TO(0.00)[csgroup.eu,redhat.com,arndb.de,gmx.de,ffwll.ch,gmail.com];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Hi


Am 13.12.24 um 11:15 schrieb Christophe Leroy:
>
>
> Le 13/12/2024 à 09:41, Thomas Zimmermann a écrit :
>> Hi
>>
>>
>> Am 13.12.24 um 09:33 schrieb Christophe Leroy:
>>>
>>>>
>>>> The attached patch selects backlight support in the defconfigs that 
>>>> also have PMAC_BACKLIGHT=y. Can you please apply it on top of the 
>>>> patchset and report on the results?
>>>>
>>>
>>> That works for the defconfig but it is still possible to change 
>>> CONFIG_BACKLIGHT_CLASS_DEVICE manually.
>>>
>>> If it is necessary for PMAC_BACKLIGHT then it shouldn't be possible 
>>> to deselect it.
>>
>> Here's another patch that make it depend on BACKLIGHT_CLASS_DEVICE=y. 
>> Can you please try this as well?
>
> That looks good, no build failure anymore with BACKLIGHT_CLASS_DEVICE=m

Great, I'll add this change to the next iteration.

Best regards
Thomas

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


