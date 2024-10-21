Return-Path: <linux-fbdev+bounces-3305-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAB39A5C92
	for <lists+linux-fbdev@lfdr.de>; Mon, 21 Oct 2024 09:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 310792857F4
	for <lists+linux-fbdev@lfdr.de>; Mon, 21 Oct 2024 07:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AD91D0F7E;
	Mon, 21 Oct 2024 07:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N4sLP3Db";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ojJIMs13";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JeLSDvhW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+v9IQr9J"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3CF1CF285;
	Mon, 21 Oct 2024 07:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495190; cv=none; b=WZxLfgO1qb5NyNqdKaMe7KX4H/saWrLWSSrTRVCUwkrZHqjwp+6YJzrkKASXpOaIVxd4XKn7kxaC4XhsmGK7nJNhG+Q+/Q42jIm4yby76KvDumtx4Ynuj2RPeTjA+JBoyIfGmkOMr64kyGVy7VsI3K7MDy2gSXOCLb6qPkuc96M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495190; c=relaxed/simple;
	bh=uStAmyv1r5apZvzg/5ML41NTizeoju5fIASRJCJOx6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqwFHzRp0Y6TU32HINdBwtiq2YOYdgVYce+o2KTSU7GjiO4R02Ces4epXbYobbEoFeFEF7m/AFQ07DuMXdOlAXiwg2S3BzHgSlrEP+vKfIY+M+3+FnK/BQCTuh5iiPRfadA9cIjWzzm4OE4a3IbreGmWTH9BoyJLtLEhpg6vQxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N4sLP3Db; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ojJIMs13; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JeLSDvhW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+v9IQr9J; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D1C1321E2E;
	Mon, 21 Oct 2024 07:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729495187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O2ThtaP5CEMEZzFoNZqSCrAmaJFSNOxp8ul6vPHCchk=;
	b=N4sLP3DbtuWsIqtmHnW9I6KBesXFmyCO3lAZCvONTvFbqlR+fqYSrtTcoH4MDC6KX6zw9V
	2Hk5+TJ6to0xKaeMpUK9qOUT3kMFKnuKPy/s+OjMv0DVZqg37LXf4GJoRPCKRQSm6ijVX8
	Z7Bcb4lTpNL0sFhiTxhAjVrpEa+lByM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729495187;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O2ThtaP5CEMEZzFoNZqSCrAmaJFSNOxp8ul6vPHCchk=;
	b=ojJIMs13RwBAz2U0maPeQZKXORwSeIa7eh9zDnldxaMmuQj33nMHpbytJpcSx4ZkkVsTli
	zVYMp2MDXoe/l0CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JeLSDvhW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+v9IQr9J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729495186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O2ThtaP5CEMEZzFoNZqSCrAmaJFSNOxp8ul6vPHCchk=;
	b=JeLSDvhWXtSrtE7pEK8qu+yLgcemLU1kV0xa9pcedvJwpeFOrtgCKyeTiW2ShFPAdZ7nBD
	PkrkJxuhyUYiIAmL3Np1Z9FYUqwWlI97Hg9uqW02dyXUwcvpHBQF/PbGrq3YnTdY7ZDKmu
	h1Zy+g++S36KKajJWDyUIOEUfpN9Vbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729495186;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O2ThtaP5CEMEZzFoNZqSCrAmaJFSNOxp8ul6vPHCchk=;
	b=+v9IQr9JYOb2XfApVCY5rFIVxnyGQJM+Q+Mlvw1Ygm8//Cff+ubVVB2HKyhh7Oqnpt6fHZ
	7GVkOGkm7jRnauCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9BF57136DC;
	Mon, 21 Oct 2024 07:19:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MW2bJJIAFmc7TQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 21 Oct 2024 07:19:46 +0000
Message-ID: <0cda71c5-a3c7-46de-a12f-c9c8b2f6de64@suse.de>
Date: Mon, 21 Oct 2024 09:19:46 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/wm8505fb: select CONFIG_FB_IOMEM_FOPS
To: Arnd Bergmann <arnd@kernel.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241018151258.3574617-1-arnd@kernel.org>
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
In-Reply-To: <20241018151258.3574617-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D1C1321E2E
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmx.de,redhat.com];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 



Am 18.10.24 um 17:12 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The fb_io_mmap() function is used in the file operations but
> not enabled in all configurations unless FB_IOMEM_FOPS gets
> selected:
>
> ld.lld-20: error: undefined symbol: fb_io_mmap
>>>> referenced by wm8505fb.c
>>>>                drivers/video/fbdev/wm8505fb.o:(wm8505fb_ops) in archive vmlinux.a
> Fixes: 11754a504608 ("fbdev/wm8505fb: Initialize fb_ops to fbdev I/O-memory helpers")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 9957dde4a3f6..961d7f5bbbc2 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1388,6 +1388,7 @@ config FB_VT8500
>   config FB_WM8505
>   	bool "Wondermedia WM8xxx-series frame buffer support"
>   	depends on (FB = y) && HAS_IOMEM && (ARCH_VT8500 || COMPILE_TEST)
> +	select FB_IOMEM_FOPS
>   	select FB_SYS_FILLRECT if (!FB_WMT_GE_ROPS)
>   	select FB_SYS_COPYAREA if (!FB_WMT_GE_ROPS)
>   	select FB_SYS_IMAGEBLIT

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


