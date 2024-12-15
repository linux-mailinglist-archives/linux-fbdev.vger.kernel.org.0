Return-Path: <linux-fbdev+bounces-3464-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 927DB9F066E
	for <lists+linux-fbdev@lfdr.de>; Fri, 13 Dec 2024 09:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22E7228252F
	for <lists+linux-fbdev@lfdr.de>; Fri, 13 Dec 2024 08:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2203A1A8F92;
	Fri, 13 Dec 2024 08:35:55 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA551A8F7E
	for <linux-fbdev@vger.kernel.org>; Fri, 13 Dec 2024 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734078955; cv=none; b=LmrIm40+o10yR0engOUr18bYSZ2LV3QpBQWsNaCccnwZ6yNhn2v4bXVAO2nQSGINmFWu2wyRCIeEQtev8rVs9QECjkVtzUiqZmC8eESb4VnHstujJmZvYIOQAw3tZVEMvGA3mL8bJG22WcnhyaEabZ/RgRgNLkuiEjWovwBkKsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734078955; c=relaxed/simple;
	bh=mSqwtfAUrQqYk7V3mV4wA/Vn17IWMHz0GGDSdTtntuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLERfEGLaSMtn/Mtr6roXgdnkQG+b1xBJyqgB9WRu6kblkIFZg9zqFQIM9VA53331s3ljUAcFPitf4c9GuJ9Ua0V/RsBdSSHenWKJLLL1FE4MbG8s9f0Pwt7naAj/yfYEYoukiLx+hUp8qI6PozgN3Ige7p9L0xkWlnsYDZflXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C9C731F394;
	Fri, 13 Dec 2024 08:35:51 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8289C13927;
	Fri, 13 Dec 2024 08:35:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9P0cHufxW2c3IgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Dec 2024 08:35:51 +0000
Message-ID: <553d1a14-f0dd-4c37-a617-d2fddf36cd0a@suse.de>
Date: Fri, 13 Dec 2024 09:35:51 +0100
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
In-Reply-To: <1248a2b6-71b0-4909-917f-a5605415a816@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: C9C731F394
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Hi


Am 13.12.24 um 09:33 schrieb Christophe Leroy:
>
>
> Le 13/12/2024 à 09:05, Thomas Zimmermann a écrit :
>> Hi
>>
>>
>> Am 13.12.24 um 08:44 schrieb Christophe Leroy:
>>>
>>>
>>> Le 12/12/2024 à 11:04, Thomas Zimmermann a écrit :
>>>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>>>> only controls backlight support within fbdev core code and data
>>>> structures.
>>>>
>>>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>>>> select it explicitly. Fixes warnings about recursive dependencies,
>>>> such as
>>>>
>>>> error: recursive dependency detected!
>>>>     symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
>>>>     symbol FB_BACKLIGHT is selected by FB_SH_MOBILE_LCDC
>>>>     symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
>>>>     symbol FB_DEVICE depends on FB_CORE
>>>>     symbol FB_CORE is selected by DRM_GEM_DMA_HELPER
>>>>     symbol DRM_GEM_DMA_HELPER is selected by DRM_PANEL_ILITEK_ILI9341
>>>>     symbol DRM_PANEL_ILITEK_ILI9341 depends on BACKLIGHT_CLASS_DEVICE
>>>>
>>>> BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
>>>> it is the correct approach in any case. For most drivers, backlight
>>>> support is also configurable separately.
>>>>
>>>> v2:
>>>> - s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
>>>> - Fix fbdev driver-dependency corner case (Arnd)
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>   drivers/auxdisplay/Kconfig       |  2 +-
>>>>   drivers/macintosh/Kconfig        |  1 +
>>>>   drivers/staging/fbtft/Kconfig    |  1 +
>>>>   drivers/video/fbdev/Kconfig      | 18 +++++++++++++-----
>>>>   drivers/video/fbdev/core/Kconfig |  3 +--
>>>>   5 files changed, 17 insertions(+), 8 deletions(-)
>>>
>>> Build fails which pmac32_defconfig :
>>>
>>>   LD      .tmp_vmlinux1
>>> powerpc64-linux-ld: drivers/macintosh/via-pmu-backlight.o: in 
>>> function `pmu_backlight_init':
>>> via-pmu-backlight.c:(.init.text+0xc0): undefined reference to 
>>> `backlight_device_register'
>>> make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
>>> make[1]: *** [/home/chleroy/linux-powerpc/Makefile:1225: vmlinux] 
>>> Error 2
>>
>> The attached patch selects backlight support in the defconfigs that 
>> also have PMAC_BACKLIGHT=y. Can you please apply it on top of the 
>> patchset and report on the results?
>>
>
> That works for the defconfig but it is still possible to change 
> CONFIG_BACKLIGHT_CLASS_DEVICE manually.
>
> If it is necessary for PMAC_BACKLIGHT then it shouldn't be possible to 
> deselect it.

If you disable CONFIG_BACKLIGHT_CLASS_DEVICE, shouldn't that 
auto-disable PMAC_BACKLIGHT as well?

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


