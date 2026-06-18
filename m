Return-Path: <linux-fbdev+bounces-7657-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /wZGAGicM2r6EAYAu9opvQ
	(envelope-from <linux-fbdev+bounces-7657-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jun 2026 09:21:12 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 431DF69E0B4
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jun 2026 09:21:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tlM+QPup;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mgTl60Bw;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tlM+QPup;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mgTl60Bw;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7657-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7657-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F08CB300BDB6
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jun 2026 07:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0D73C5826;
	Thu, 18 Jun 2026 07:21:08 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8FD3A8736
	for <linux-fbdev@vger.kernel.org>; Thu, 18 Jun 2026 07:21:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767268; cv=none; b=GLUQ88/xbysbnnJtRoiFNeFOtYrwguw8iWUm/YhZehWRScTJLUxW2RPIqYemdEqobRqnrgOD4CMqup3NWaH6aEUCb6cDtwDc75h5gsFmkkh8OVRC2+2pWOGOO6kMogxwNW4CwASUW/7stz5RjaTYJ/jDO6lsuOnohJ9ZPhBRM3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767268; c=relaxed/simple;
	bh=nmAvwoXoC+LM2DCI6VdozPb8YMqyeiALv1uLCf+ZrRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXXADFnjBJ7Rpt6dfn8sU9a5Jl4Ewh/HuJmSXhOvlYcb+0SD69TCsvwlykSUuPEdTFAiH2kszSYuuXFxRgq1aG4UCS/hUQS7oNZshLTjJwd3qRKRF/BRN22GeMmfa37YUEJXiqxeI9yp8W9MeJIs3hVq6X8TAAeY38L99M0bIW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tlM+QPup; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mgTl60Bw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tlM+QPup; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mgTl60Bw; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5760275EE2;
	Thu, 18 Jun 2026 07:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781767265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SCi9F1ns4cl45Fk4TqHGu6Ax28aQgPnFbqHpo5+blms=;
	b=tlM+QPup870Bkz9uXcx9hTH0abiMImWVq0iB4snZBqneEb6BFpei6edtnxgXVUw+t0IiKE
	320ubZYx7DhC/kq1+JaWEHbYidurl6+wS4U23Q/t2bRRZuCHfl5aHEmYWynyTMhQL9l/Pe
	rxQpn0KeG3Y8qLFWfP2qNHbwZv6uCpw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781767265;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SCi9F1ns4cl45Fk4TqHGu6Ax28aQgPnFbqHpo5+blms=;
	b=mgTl60BwbVEoavRFIpUqCXNtKhQP3j5JvDmluvyjb5dbRKZ6YY805U01CBYkQgYU6n8Tt4
	DxVaSMisoKLDD9CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781767265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SCi9F1ns4cl45Fk4TqHGu6Ax28aQgPnFbqHpo5+blms=;
	b=tlM+QPup870Bkz9uXcx9hTH0abiMImWVq0iB4snZBqneEb6BFpei6edtnxgXVUw+t0IiKE
	320ubZYx7DhC/kq1+JaWEHbYidurl6+wS4U23Q/t2bRRZuCHfl5aHEmYWynyTMhQL9l/Pe
	rxQpn0KeG3Y8qLFWfP2qNHbwZv6uCpw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781767265;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SCi9F1ns4cl45Fk4TqHGu6Ax28aQgPnFbqHpo5+blms=;
	b=mgTl60BwbVEoavRFIpUqCXNtKhQP3j5JvDmluvyjb5dbRKZ6YY805U01CBYkQgYU6n8Tt4
	DxVaSMisoKLDD9CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C48C779A8;
	Thu, 18 Jun 2026 07:21:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RJp+BWGcM2o+awAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 07:21:05 +0000
Message-ID: <1ec067ee-a8ab-4249-95df-280eba42fef4@suse.de>
Date: Thu, 18 Jun 2026 09:21:04 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: sysfb: Mark CONFIG_SYSFB_SIMPLEFB as deprecated
To: Julian Braha <julianbraha@gmail.com>, javierm@redhat.com, sima@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260617081810.218168-1-tzimmermann@suse.de>
 <7da7d892-3b3c-4f83-b3b0-93eafe14e15e@gmail.com>
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
In-Reply-To: <7da7d892-3b3c-4f83-b3b0-93eafe14e15e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7657-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:javierm@redhat.com,m:sima@ffwll.ch,m:airlied@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 431DF69E0B4

Hi

Am 17.06.26 um 18:45 schrieb Julian Braha:
> Hi Thomas,
>
> On 6/17/26 09:17, Thomas Zimmermann wrote:
>> Mark CONFIG_SYSFB_SIMPLEFB as deprecated. Enabling it allows to
>>   config SYSFB_SIMPLEFB
>> -	bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
>> +	bool "Mark VGA/VBE/EFI FB as generic system framebuffer (deprecated)"
> In v2, I think it also makes sense to add the 'transitional' attribute
> to the Kconfig entry to help phase it out.
>
> Also see this patch message for an explanation of 'transitional':
> https://lore.kernel.org/all/20250923213422.1105654-2-kees@kernel.org/

Thanks for this pointer; I wasn't aware of this feature. This will be 
really useful to not accidentally leave users without display output.

I've played with the option, but it does not work are purely as shown in 
the example. I think it's because EFIDRM and VESADRM are existing 
options. So they already have a value.

What I did instead was to add new internal config options. They depend 
on the now-transitional SYSFB_SIMPLEFB and select the correct drivers. 
Once SYSFB_SIMPLEFB goes away, these options can go away as well.

Best regards
Thomas

>
> - Julian Braha
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



