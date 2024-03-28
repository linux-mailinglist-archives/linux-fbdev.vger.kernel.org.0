Return-Path: <linux-fbdev+bounces-1476-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7887A41B
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Mar 2024 09:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E343E2830CB
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Mar 2024 08:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085D817580;
	Wed, 13 Mar 2024 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="03MWhONd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2MxIstKL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pMqtDZPO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o/7X7Noi"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF67E13ADD
	for <linux-fbdev@vger.kernel.org>; Wed, 13 Mar 2024 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710318650; cv=none; b=tEZE9js+SihqTzdNPtMT055CcpJbUsvHm7ojtW28Zzf926IZk9wQdxcehiaE6Bw6IPCLjEtL0qFds+AOI/HCYeUuTiGSqPR5OUn5wzExt+QfjsXAAa7BDmBqaNLsPdRZgSsA310isD7VuakGhxkhMWHN8IPUZ0P4lETM02jsZdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710318650; c=relaxed/simple;
	bh=DbSmIf26aAvq+UFLXxjcoiRST5/Vjo+CSq5nUHJAqZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYchtOUzMGdVOe4YdqcUPQcTbSX84KKo1+4/53b6U33gkVRz5Sku6bXZ/ehs8w018xltfNUnJ2EbcxWnoBD6k5vdSGb3L18RJ6cyGEP1MxNyII8qiJlArfZJr0JLwtuPp2BL6tFeCCsHg733pU9v7MSvBQTg4f5rK9K081nCpKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=03MWhONd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2MxIstKL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pMqtDZPO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o/7X7Noi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CA1FB21C9B;
	Wed, 13 Mar 2024 08:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710318647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=amCJkCQx10WF/61L23LvW8yBBzXXKFmrhM70x3Ir3Jc=;
	b=03MWhONd8gK7BIkDWFptVnDZYtqx2rt/oULpXXoFfw7NOwcodCVS1ouE1cvFZh5XiC1cLf
	0Fp6mR+JBLaZfTU2wnocuElRGfzBdxHQugbFRvSN7aMXHVoQOIQ9yxzOADFFkYIq5GuhwT
	Y7xcOwXJWOdYb1m+SmtujMnWJ7GeWqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710318647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=amCJkCQx10WF/61L23LvW8yBBzXXKFmrhM70x3Ir3Jc=;
	b=2MxIstKLYG8/oQNJJpG8AggSFK3BHsmPodR5DtibPceq2ZHmVr5NXtXHCpcKnEcqpzW4VD
	6LlhfkVf2llLizDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710318646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=amCJkCQx10WF/61L23LvW8yBBzXXKFmrhM70x3Ir3Jc=;
	b=pMqtDZPOTbOBxmeYJzlpnlkufduAsWYW/5msm0pC3IdPLSsIKUq1htd50T4O9UQp0ZZfjj
	t7bT0AtudF91pugYMDvkpYNlCXiO7VG52a5coEIPUiTyYgNLPwhKS4hRm7kYtQho31wXxg
	IQVuE+RCG3DsW0O25CXOqv83DpTNBwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710318646;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=amCJkCQx10WF/61L23LvW8yBBzXXKFmrhM70x3Ir3Jc=;
	b=o/7X7NoicIOgmP4jxjnZxBpvE9nOVpH0GWndsO7PBdkdtvFa9tl8pe+ZeBGfVWkmInuRrx
	2HKLUbmaRuljAyBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92A8813977;
	Wed, 13 Mar 2024 08:30:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G357IjZk8WWLYgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 13 Mar 2024 08:30:46 +0000
Message-ID: <12c6a92d-d3f5-4884-8b6d-ce20a3ade01e@suse.de>
Date: Wed, 13 Mar 2024 09:30:46 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/43] drm/renesas/rz-du: Use fbdev-dma
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "deller@gmx.de" <deller@gmx.de>, "javierm@redhat.com" <javierm@redhat.com>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-30-tzimmermann@suse.de>
 <OSBPR01MB1592F28EBCB531481479673C862B2@OSBPR01MB1592.jpnprd01.prod.outlook.com>
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
In-Reply-To: <OSBPR01MB1592F28EBCB531481479673C862B2@OSBPR01MB1592.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.29
X-Spamd-Result: default: False [-4.29 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[bp.renesas.com,ffwll.ch,gmail.com,gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

Hi

Am 12.03.24 um 20:14 schrieb Biju Das:
> Hi Thomas,
>
>> -----Original Message-----
>> From: Thomas Zimmermann <tzimmermann@suse.de>
>> Sent: Tuesday, March 12, 2024 3:45 PM
>> To: daniel@ffwll.ch; airlied@gmail.com; deller@gmx.de; javierm@redhat.com
>> Cc: linux-fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org; Thomas Zimmermann
>> <tzimmermann@suse.de>; Biju Das <biju.das.jz@bp.renesas.com>
>> Subject: [PATCH 29/43] drm/renesas/rz-du: Use fbdev-dma
>>
>> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports damage handling, which is required by
>> rz-du. Avoids the overhead of fbdev-generic's additional shadow buffering. No functional changes.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks a lot.

I just noticed that the drivers under renesas/ don't require damage 
handling, so the commit message needs a change.

Best regards
Thomas

>
> Cheers,
> Biju
>
>> Cc: Biju Das <biju.das.jz@bp.renesas.com>
>> ---
>>   drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-
>> du/rzg2l_du_drv.c
>> index 470d34da1d6c4..e5eca8691a331 100644
>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
>> @@ -14,7 +14,7 @@
>>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_drv.h>
>> -#include <drm/drm_fbdev_generic.h>
>> +#include <drm/drm_fbdev_dma.h>
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_probe_helper.h>
>>
>> @@ -149,7 +149,7 @@ static int rzg2l_du_probe(struct platform_device *pdev)
>>
>>   	drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
>>
>> -	drm_fbdev_generic_setup(&rcdu->ddev, 32);
>> +	drm_fbdev_dma_setup(&rcdu->ddev, 32);
>>
>>   	return 0;
>>
>> --
>> 2.44.0

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


