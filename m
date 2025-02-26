Return-Path: <linux-fbdev+bounces-3914-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0479A4578B
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Feb 2025 09:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40338188A654
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Feb 2025 07:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E52D1E1E0F;
	Wed, 26 Feb 2025 07:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yGKdeAVa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qnFaOadQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yGKdeAVa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qnFaOadQ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5851E1E0C
	for <linux-fbdev@vger.kernel.org>; Wed, 26 Feb 2025 07:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740556471; cv=none; b=RJGNAC4rrD9ZZse6N4r3LG4gk6OsfObJ10lOj3owusvWuLHmKfamXu+QR+KtW94075/IjQvX+u1IHyOHxVigcVgow/vUyV6eUqnpVip35JJq9zSDbYE9Fkuf4VXaqIxUdsguQ/Fdt0qDsemG8ayfxQVMEcnNLWQUYv9FeD9Arjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740556471; c=relaxed/simple;
	bh=lzrzkFqtYn2XPfyVD+uYwO2Z2Ocwc3IK+Hs3ALah9Fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAs1okmM+HM97CU+07XDftyhF7jtK+XwWPYYNzWYQXa1Y14SF6aoZisc/7DZQaZhsAquKA+u7Jidj+kHgV6iztQmH3w8IO4Y/wqNfcTdc+Qx1E4Ups0bladp35djbhaYTo+TwVCyxKgCvEAmBY7K6COT7+xdR2uBboCiIfe5PWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yGKdeAVa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qnFaOadQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yGKdeAVa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qnFaOadQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9C34B1F387;
	Wed, 26 Feb 2025 07:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740556467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5VYTfqhAjaSaoouv3YNmgRttChRZ90xHDXAk/bW06pk=;
	b=yGKdeAVaVVKm46qEuA2yXDoMzbVKl/C5A5EEjmM9UnCNcsoUyL7+jrY89uhsyApt+TTP0L
	VSiHV7xzttNSbMrWPZyt1r93wuilYNtuKWrsRD1FzJl86tZIOzCDQfhrgO/pbYcES+JF6c
	NJvtGtQjUwzNbITNjKSfCxaW7XyRTxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740556467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5VYTfqhAjaSaoouv3YNmgRttChRZ90xHDXAk/bW06pk=;
	b=qnFaOadQX+Wpon5T3/5CH4vQ7MEAAtEMzcSFqAp9sdHw1poIlSxqZBqZTcUDc9DhzKHt4A
	SJ2wmKs0JD4hzjCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yGKdeAVa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qnFaOadQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740556467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5VYTfqhAjaSaoouv3YNmgRttChRZ90xHDXAk/bW06pk=;
	b=yGKdeAVaVVKm46qEuA2yXDoMzbVKl/C5A5EEjmM9UnCNcsoUyL7+jrY89uhsyApt+TTP0L
	VSiHV7xzttNSbMrWPZyt1r93wuilYNtuKWrsRD1FzJl86tZIOzCDQfhrgO/pbYcES+JF6c
	NJvtGtQjUwzNbITNjKSfCxaW7XyRTxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740556467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5VYTfqhAjaSaoouv3YNmgRttChRZ90xHDXAk/bW06pk=;
	b=qnFaOadQX+Wpon5T3/5CH4vQ7MEAAtEMzcSFqAp9sdHw1poIlSxqZBqZTcUDc9DhzKHt4A
	SJ2wmKs0JD4hzjCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6016013A53;
	Wed, 26 Feb 2025 07:54:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7pv8FbPIvmcjOwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 07:54:27 +0000
Message-ID: <4d1a50b5-aa41-4e8e-829a-5c404e2110ca@suse.de>
Date: Wed, 26 Feb 2025 08:54:27 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dummycon: fix default rows/cols
To: Arnd Bergmann <arnd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: kernel test robot <lkp@intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250225164436.56654-1-arnd@kernel.org>
 <20250225164436.56654-2-arnd@kernel.org>
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
In-Reply-To: <20250225164436.56654-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.29 / 50.00];
	RSPAMD_URIBL(4.50)[arndb.de:email];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	R_DKIM_ALLOW(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmx.de,arndb.de,redhat.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,suse.de:email,suse.de:dkim,suse.de:mid]
X-Spam-Score: 0.29
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 9C34B1F387
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO



Am 25.02.25 um 17:44 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> dummycon fails to build on ARM/footbridge when the VGA console is
> disabled, since I got the dependencies slightly wrong in a previous
> patch:
>
> drivers/video/console/dummycon.c: In function 'dummycon_init':
> drivers/video/console/dummycon.c:27:25: error: 'CONFIG_DUMMY_CONSOLE_COLUMNS' undeclared (first use in this function); did you mean 'CONFIG_DUMMY_CONSOLE'?
>     27 | #define DUMMY_COLUMNS   CONFIG_DUMMY_CONSOLE_COLUMNS
> drivers/video/console/dummycon.c:28:25: error: 'CONFIG_DUMMY_CONSOLE_ROWS' undeclared (first use in this function); did you mean 'CONFIG_DUMMY_CONSOLE'?
>     28 | #define DUMMY_ROWS      CONFIG_DUMMY_CONSOLE_ROWS
>
> This only showed up after many thousand randconfig builds on Arm, and
> doesn't matter in practice, but should still be fixed. Address it by
> using the default row/columns on footbridge after all in that corner
> case.
>
> Fixes: 4293b0925149 ("dummycon: limit Arm console size hack to footbridge")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409151512.LML1slol-lkp@intel.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/console/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> index 1c4263c164ce..ea4863919eb9 100644
> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -51,7 +51,7 @@ config DUMMY_CONSOLE
>   
>   config DUMMY_CONSOLE_COLUMNS
>   	int "Initial number of console screen columns"
> -	depends on DUMMY_CONSOLE && !ARCH_FOOTBRIDGE
> +	depends on DUMMY_CONSOLE && !(ARCH_FOOTBRIDGE && VGA_CONSOLE)
>   	default 160 if PARISC
>   	default 80
>   	help
> @@ -61,7 +61,7 @@ config DUMMY_CONSOLE_COLUMNS
>   
>   config DUMMY_CONSOLE_ROWS
>   	int "Initial number of console screen rows"
> -	depends on DUMMY_CONSOLE && !ARCH_FOOTBRIDGE
> +	depends on DUMMY_CONSOLE && !(ARCH_FOOTBRIDGE && VGA_CONSOLE)
>   	default 64 if PARISC
>   	default 30 if ARM
>   	default 25

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


