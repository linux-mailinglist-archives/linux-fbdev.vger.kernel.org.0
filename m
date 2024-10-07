Return-Path: <linux-fbdev+bounces-3221-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FD49927A3
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Oct 2024 10:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25B76B207CD
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Oct 2024 08:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BEE188703;
	Mon,  7 Oct 2024 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a2otHmi2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uI1thzhO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kESJIvxz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DrFG43nT"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AB0136354
	for <linux-fbdev@vger.kernel.org>; Mon,  7 Oct 2024 08:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728291394; cv=none; b=WD54SZTausjhZrEsEsE5mXFt8r6LL+rD2/Ss5SrLlJ3VM1WUXLhDdUXf5Y0JpvuAncu5RfwwgtK2Dk4Cie/ZkD6WgntI1UowodIBfekcA3cxd3lewfZ87VfKBUxjToxpXi7olx0tH5Im4ZkaGmxsH4JsYBD9xEy/rcFj4fEGylo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728291394; c=relaxed/simple;
	bh=tIOPUBah8iirasko/YlR38akLoaK4hjfIx5BFqJO9Q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QgY8WUMi/rU5JMrozocEManUw6cfwUrmro5/7g2mFQD8245BQEvm6sPNFSqIjcRoMDx/qprM+gkJlzVwaCimDeBCXRuyFkyflc7qHUKDmY+ncfznLnFWwpqzluXM1dI9Xei7le0Ygk15A5aPXVUFAHiwgNHQJywzXyKZskmadbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a2otHmi2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uI1thzhO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kESJIvxz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DrFG43nT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F1FEB1FC9E;
	Mon,  7 Oct 2024 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728291390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xdrkP6UP+vE1XTuVh8aRuKYM4L8agqbEUJHIKnHpODQ=;
	b=a2otHmi2b91T50K/gBWjMEUegvUO9WzGH9UJ8Fj4CFePXWVI3NGgNF3wGkEby1cPbaHXXW
	GrqaleMNg1OpZGePiTj6CPTvhAlfk2k1N2ZmTsJGCdiJBqZaWooa1toLz2OpzLwp1ylS69
	FmWStsjo/5a8stR2UDtuw6gVpfbCCyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728291390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xdrkP6UP+vE1XTuVh8aRuKYM4L8agqbEUJHIKnHpODQ=;
	b=uI1thzhONW8wM3Q2wPD07vdZ5gfHquf0QJdr/WC3eK3xUIlEruGmLKr31ol02uhhv88my/
	Sm+G0SWzptQU7cDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728291389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xdrkP6UP+vE1XTuVh8aRuKYM4L8agqbEUJHIKnHpODQ=;
	b=kESJIvxzMTNZ54+F5n4pFic1sBwC3trt82El4HEZks4PacuOBF7gn5ReDoEoYGYvZrqm3L
	JoFUPCtf11xVBDaZRoFwpA8/tcpxZl1UE21+KlAO+o+Tjw+eRCTURKoIIWiTJLkMSw4Sbh
	ZlzMzNRZTd5eMWtFi5KTtNncxsMFkFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728291389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xdrkP6UP+vE1XTuVh8aRuKYM4L8agqbEUJHIKnHpODQ=;
	b=DrFG43nTpkvCrJuJVx033NJYHkNNox3ax+TGOdIBpfUSp5AK3m9vjVG4fwHT+HQibHTx73
	YrUSkX856jQrd7Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D173B13786;
	Mon,  7 Oct 2024 08:56:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sJ6TMT2iA2fQCQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 07 Oct 2024 08:56:29 +0000
Message-ID: <18c5cd42-080d-4e1d-b34f-f3fed750ef8f@suse.de>
Date: Mon, 7 Oct 2024 10:56:29 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: sstfb: Make CONFIG_FB_DEVICE optional
To: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, thomas.zimmermann@suse.de
References: <1db0e2db-97e0-492f-ba89-0a1f49ca4498@suse.de>
 <20241004152429.4329-1-gonzalo.silvalde@gmail.com>
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
In-Reply-To: <20241004152429.4329-1-gonzalo.silvalde@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

Hi

Am 04.10.24 um 17:24 schrieb Gonzalo Silvalde Blanco:
> The sstfb driver currently depends on CONFIG_FB_DEVICE to create sysfs
> entries and access info->dev. This patch wraps the relevant code blocks
> with #ifdef CONFIG_FB_DEVICE, allowing the driver to be built and used
> even if CONFIG_FB_DEVICE is not selected.
>
> The sysfs setting only controls the VGA pass-through state and is not
> required for the display to work correctly.
> (See: http://vogonswiki.com/index.php/VGA_passthrough_cable
> for more information.)
>
> Tested by building with and without CONFIG_FB_DEVICE, both of which
> compiled without issues.
>
> Signed-off-by: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

One thing I forgot, is that you also have to remove the dependency from 
the Kconfig option. [1] Otherwise, it won't be possible to select the 
driver.

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.11.2/source/drivers/video/fbdev/Kconfig#L1239

> ---
>   drivers/video/fbdev/sstfb.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
> index f8ae54ca0cc3..8d2e9d1f8d80 100644
> --- a/drivers/video/fbdev/sstfb.c
> +++ b/drivers/video/fbdev/sstfb.c
> @@ -716,6 +716,7 @@ static void sstfb_setvgapass( struct fb_info *info, int enable )
>   	pci_write_config_dword(sst_dev, PCI_INIT_ENABLE, tmp);
>   }
>   
> +#ifdef CONFIG_FB_DEVICE
>   static ssize_t store_vgapass(struct device *device, struct device_attribute *attr,
>   			const char *buf, size_t count)
>   {
> @@ -736,10 +737,10 @@ static ssize_t show_vgapass(struct device *device, struct device_attribute *attr
>   	struct sstfb_par *par = info->par;
>   	return sprintf(buf, "%d\n", par->vgapass);
>   }
> -
>   static struct device_attribute device_attrs[] = {
>   	__ATTR(vgapass, S_IRUGO|S_IWUSR, show_vgapass, store_vgapass)
>   	};
> +#endif
>   
>   static int sstfb_ioctl(struct fb_info *info, unsigned int cmd,
>   			unsigned long arg)
> @@ -1435,10 +1436,10 @@ static int sstfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	}
>   
>   	sstfb_clear_screen(info);
> -
> +#fdef CONFIG_FB_DEVICE
>   	if (device_create_file(info->dev, &device_attrs[0]))
>   		printk(KERN_WARNING "sstfb: can't create sysfs entry.\n");
> -
> +#endif
>   
>   	fb_info(info, "%s frame buffer device at 0x%p\n",
>   		fix->id, info->screen_base);
> @@ -1467,8 +1468,9 @@ static void sstfb_remove(struct pci_dev *pdev)
>   
>   	info = pci_get_drvdata(pdev);
>   	par = info->par;
> -
> +#ifdef CONFIG_FB_DEVICE
>   	device_remove_file(info->dev, &device_attrs[0]);
> +#endif
>   	sst_shutdown(info);
>   	iounmap(info->screen_base);
>   	iounmap(par->mmio_vbase);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


