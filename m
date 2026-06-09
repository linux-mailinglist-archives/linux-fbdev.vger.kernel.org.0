Return-Path: <linux-fbdev+bounces-7555-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hJxDAmSvJ2o70gIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7555-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 09 Jun 2026 08:15:00 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8565CA6A
	for <lists+linux-fbdev@lfdr.de>; Tue, 09 Jun 2026 08:14:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qudDzkMG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WlibRiNa;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=El2rKelc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2Hws68a0;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7555-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7555-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15436300F25C
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Jun 2026 06:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F9B3CF68E;
	Tue,  9 Jun 2026 06:14:53 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9243B318BB3
	for <linux-fbdev@vger.kernel.org>; Tue,  9 Jun 2026 06:14:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985693; cv=none; b=qHrsWb8UDgUvBhvOHeWq0UFaXWa/njxZ/x0w2Gst9dSQkgwYvw98qhDO2t7/0RZsYUo1W4OuaPXwjsPxvM17QHBVx5F/URjZYwv5avEMH4lM99s8/m2bRP3stbOUIWcjD1n9NG5+JJhdLHLeC3HbrsIyMkgokI7/QO1baJ9o3gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985693; c=relaxed/simple;
	bh=o+nzNBckO/z3Jtcjnql7PVG3SN9IdI+zurOeS/NJ22A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=owsLmkfMDC7aR98XMzpYrV+tEO6SqPg+OggWDe98AirHGmmanNhmeUj97aALf9E9tkg5wHdKcyYNEvMEQFS9PPEcFD6beDq3TH2+DzwIAnNwOePgNzugfWYG29cCyxPGytG1lmvGiIQ1KfUGNTgFY1JuaoisWK0NHiRH7PMWqhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qudDzkMG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WlibRiNa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=El2rKelc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2Hws68a0; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5736067D6D;
	Tue,  9 Jun 2026 06:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780985685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6dArV38iGqF9GXJ/TV27PoGxLpG8ZojqfWws79F99Yg=;
	b=qudDzkMGLhMnB3kLZJrb2OmFoW0MxPinrB1iR8wfKdNHpczzyfM9D6QLolYGqnHWNdwnvY
	i/QclpRY3auF1vPvH5gD3pVDnN90ZinIR+AIZYr3OFkFbS8MO/8RaBTfACMRUV4Ik0A9+c
	/obk+yMCCirrDWobno4A5Hg9GTgVKI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780985685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6dArV38iGqF9GXJ/TV27PoGxLpG8ZojqfWws79F99Yg=;
	b=WlibRiNa5CwdGCtRUuRjMQjqtM/NY8Qtv8rxifl9xB/pfrACfqpcSMB8oLoAEuBtl1+I3x
	HrjfAgS/w0256sAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780985684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6dArV38iGqF9GXJ/TV27PoGxLpG8ZojqfWws79F99Yg=;
	b=El2rKelc3gdu9lt3ec1AfHViZoCiJfdCI45nLNHps1NblkCUvSY7dl5+9xErMHnmew2wpo
	gRufPkER31sLx5o76AqBinK5jGML/uYt85aSi7MpM8OgRUXBYI2lNquVcliP4REMqkyHnL
	5cvxknwD3LldG58TEny/iOdzq1C4SuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780985684;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6dArV38iGqF9GXJ/TV27PoGxLpG8ZojqfWws79F99Yg=;
	b=2Hws68a0+497qKHIUCOjpaUFOn49UeK32AiL8Dg/YjSwVVnLQta43JTgaM+Dlk5hZx+99I
	YU1xUWlgBFhwzXDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B950779A7;
	Tue,  9 Jun 2026 06:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o1PsCFSvJ2rwVQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 09 Jun 2026 06:14:44 +0000
Message-ID: <aaf75c58-c9d5-464a-9651-0021e6784e09@suse.de>
Date: Tue, 9 Jun 2026 08:14:43 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/fonts: Avoid unncessary 64-bit math in font code
To: Helge Deller <deller@kernel.org>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260607210203.229613-1-deller@gmx.de>
 <b80a379d-87e4-45c4-a078-09e84a840895@suse.de>
 <1492766a-c349-4cca-932e-bf608b922b6b@gmx.de>
 <CADkSEUg948W-XT3_ODe_6p4i5Y8AKEcP=rmJ+7qJq30Uq0d_EQ@mail.gmail.com>
 <aiclYUfQvMokMu64@carbonx1>
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
In-Reply-To: <aiclYUfQvMokMu64@carbonx1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-7555-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:deller@kernel.org,m:enelsonmoore@gmail.com,m:deller@gmx.de,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmx.de,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,suse.com:url,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03B8565CA6A

Hi,

thanks for the fix.

Am 08.06.26 um 22:26 schrieb Helge Deller:
> * Ethan Nelson-Moore <enelsonmoore@gmail.com>:
>> Hi, Helge and Thomas,
>>
>> On Mon, Jun 8, 2026 at 12:58 PM Helge Deller <deller@gmx.de> wrote:
>>> On 6/8/26 13:25, Thomas Zimmermann wrote:
>>>> Why is there a 64-bit division at all?
>>> Not sure. Might be platform specific.
>>> Maybe, because you add two integers and divide by an integer, that the
>>> compiler then chooses to use 64-bit integer division by 32-bit integer.
>> Actually, I think the real issue is that
>> arch/arm/boot/compressed/Makefile defines "static" to nothing when
>> compiling its copy of lib/fonts/font_acorn_8x8.c (via font.c), so that
>> the font array is available outside of the object file. I assume that
>> this causes various unused static inline functions in the headers it
>> includes (such as <linux/math.h>) to be included in the object file
>> because they become normal inline functions.
> Does this patch fix the issue then?
>
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index a159120d1e42..e3f550d62857 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -157,4 +157,4 @@ $(obj)/piggy_data: $(obj)/../Image FORCE
>   
>   $(obj)/piggy.o: $(obj)/piggy_data
>   
> -CFLAGS_font.o := -Dstatic=
> +CFLAGS_font.o := -DBOOTLOADER
> diff --git a/lib/fonts/font_acorn_8x8.c b/lib/fonts/font_acorn_8x8.c
> index 36c51016769d..3327aa6d161d 100644
> --- a/lib/fonts/font_acorn_8x8.c
> +++ b/lib/fonts/font_acorn_8x8.c
> @@ -5,7 +5,11 @@
>   
>   #define FONTDATAMAX 2048
>   
> +#ifndef BOOTLOADER
>   static const struct font_data acorndata_8x8 = {
> +#else
> +const struct font_data acorndata_8x8 = {
> +#endif
>   { 0, 0, FONTDATAMAX, 0 }, {
>   /* 00 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* ^@ */
>   /* 01 */  0x7e, 0x81, 0xa5, 0x81, 0xbd, 0x99, 0x81, 0x7e, /* ^A */

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

I do like this better than the other patch.

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



