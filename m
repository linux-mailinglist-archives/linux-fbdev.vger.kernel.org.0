Return-Path: <linux-fbdev+bounces-7245-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIeHF+PIBmoCoAIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7245-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 15 May 2026 09:18:59 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E46DE54A75B
	for <lists+linux-fbdev@lfdr.de>; Fri, 15 May 2026 09:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A0E8300CBDE
	for <lists+linux-fbdev@lfdr.de>; Fri, 15 May 2026 07:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC8D3E3D87;
	Fri, 15 May 2026 07:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CwP2ZJJl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b5Zcvl2D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CwP2ZJJl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b5Zcvl2D"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BE83C81B4
	for <linux-fbdev@vger.kernel.org>; Fri, 15 May 2026 07:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829152; cv=none; b=bOQCTNjuffOJKpFfMn/IzXTJyZi2Gr0C5tc9zlpWGqDWhKFRJK2Qv95mY8b2FOIKHfd2T84ULxY0zb3A3ECwcd6yoTGHhDcr6y63G/D3pvEwfaLPmj41xrCEs2azX4SCiL9QKPTnBCEBJEDgakaYuRUDQcsEeDluvbuUV1F5wys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829152; c=relaxed/simple;
	bh=9FysWmROLn9XdSQjUq3G0Ng1De6tgFgTsTAC9vFORrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcbLKVMEzbr1AT6nKi0Gw+AU1slHnLoDANCVeZ+f6xIlPMgemGrQZleyEUZbdaNVpZkNjOzJ3lhQ/D15ZMIOHrdFhtZUwOiOjDC8UuGQ7WUgYI8ym9oiJl1yswstI5Hzj8K/3klNeov85s3n1yFAzim6S3RyYp1wzmqOWkSjuzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CwP2ZJJl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b5Zcvl2D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CwP2ZJJl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b5Zcvl2D; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 13D1A6B474;
	Fri, 15 May 2026 07:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778829144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U+XFnAkklitDpwwmpsIV1R+6a7RRmhxLwfNsCgcCvKQ=;
	b=CwP2ZJJlRb3rRakSJ9u4YHNEceRIWixQl1kugLm/1PNK+YxH70Mk3q/b071ZAoN2ds3A3u
	g9+MdYoziLpinmNWiKk4YpiJn3xFPIgR28wu5VGXQLsp/BaUCmjhvOSe7pzwhJW34ql+m6
	7XgHhUU5IrJn5LYBZgGUdAbmFq1hXIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778829144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U+XFnAkklitDpwwmpsIV1R+6a7RRmhxLwfNsCgcCvKQ=;
	b=b5Zcvl2DixjfrGbgFkFEYDmwMaU7m3N+n5cFw/a4Qjp4/bB5JK2VDsB9zDp1XudAxbu+Oz
	K8zzbRuy2SYYXMAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778829144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U+XFnAkklitDpwwmpsIV1R+6a7RRmhxLwfNsCgcCvKQ=;
	b=CwP2ZJJlRb3rRakSJ9u4YHNEceRIWixQl1kugLm/1PNK+YxH70Mk3q/b071ZAoN2ds3A3u
	g9+MdYoziLpinmNWiKk4YpiJn3xFPIgR28wu5VGXQLsp/BaUCmjhvOSe7pzwhJW34ql+m6
	7XgHhUU5IrJn5LYBZgGUdAbmFq1hXIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778829144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U+XFnAkklitDpwwmpsIV1R+6a7RRmhxLwfNsCgcCvKQ=;
	b=b5Zcvl2DixjfrGbgFkFEYDmwMaU7m3N+n5cFw/a4Qjp4/bB5JK2VDsB9zDp1XudAxbu+Oz
	K8zzbRuy2SYYXMAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C111E593A9;
	Fri, 15 May 2026 07:12:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7yhvLVfHBmpjYwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 15 May 2026 07:12:23 +0000
Message-ID: <40ec54e6-78fb-400f-bb10-c277287162fb@suse.de>
Date: Fri, 15 May 2026 09:12:23 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: Use correct type for vc_resize() return value
To: Jiacheng Yu <yujiacheng3@huawei.com>, deller@gmx.de, simona@ffwll.ch
Cc: sravankumarlpu@gmail.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 liuyongqiang13@huawei.com
References: <20260514091918.1607234-1-yujiacheng3@huawei.com>
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
In-Reply-To: <20260514091918.1607234-1-yujiacheng3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Rspamd-Queue-Id: E46DE54A75B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org,huawei.com];
	TAGGED_FROM(0.00)[bounces-7245-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[huawei.com,gmx.de,ffwll.ch];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:email,suse.de:mid,suse.de:dkim,huawei.com:email]
X-Rspamd-Action: no action



Am 14.05.26 um 11:19 schrieb Jiacheng Yu:
> The return value of vc_resize() is int, but fbcon_set_disp() stores it
> in an unsigned long variable. While the !ret check happens to work
> correctly by coincidence (negative values become large positive values),
> the types should match. Use int instead.
>
> Eliminates the following W=3 warning:
>
>    drivers/video/fbdev/core/fbcon.c: In function 'fbcon_set_disp':
>    drivers/video/fbdev/core/fbcon.c:1494:14: warning: implicit conversion from 'int' to 'unsigned long' [-Wconversion]
>
> Fixes: af0db3c1f898 ("fbdev: Fix vmalloc out-of-bounds write in fast_imageblit")
> Signed-off-by: Jiacheng Yu <yujiacheng3@huawei.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the patch.

> ---
>   drivers/video/fbdev/core/fbcon.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index b0e3e765360d..641687a734d5 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1440,8 +1440,7 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
>   	struct vc_data **default_mode, *vc;
>   	struct vc_data *svc;
>   	struct fbcon_par *par = info->fbcon_par;
> -	int rows, cols;
> -	unsigned long ret = 0;
> +	int rows, cols, ret;
>   
>   	p = &fb_display[unit];
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



