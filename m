Return-Path: <linux-fbdev+bounces-2510-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D042A907E2E
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2024 23:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD7DE1C23FD1
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2024 21:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7063978C80;
	Thu, 13 Jun 2024 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="p15MkdbR"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC3371747;
	Thu, 13 Jun 2024 21:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718314235; cv=none; b=bOxrPuQhD/MKIR3xBn9Yj2UR0RIx11Pzta5CqRpncuKlM/kfj2BZv5ETP0CmjEpweS1WLapDAPqiDBsNoEQ2fTDB4LYfQVorTJuLds+DPr1uoGoOcYpmwhecEJrN4rLuHtc748MgXRQ3MVix48Dmg33RMvOhzHD6wuZ1GLdpnfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718314235; c=relaxed/simple;
	bh=w9PU2XazI/1wtaRpK+o/sHM1sY9+OEXCKdI/pViCadw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sp/FBVbEJckYIkvgeaiadm6QcvKmLrXilHn4nvUSfetYTAKcQ8fh5gsYsUcQpvaQ0dL3IpQa8gkq+nw5J9pY82pLFcZw0gBemh+JoOmB3QRa3An6PYgq+HEo5Zw7zg/RXSiwg1H/oA6YajoadxvSUlFWrBc5DpxAEgS4rMQ05b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=p15MkdbR; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1718314207; x=1718919007; i=deller@gmx.de;
	bh=M+FLaVcT0LhG7HPlKtaV7DfrhDySDe5fxZhV7l6aw2M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=p15MkdbRbQCACUzzzu+VWdU1QVwALK3sA+QT2DqzUR6EA4jdoRT0aqFGE1cXXMrS
	 unQuZvh5nu9/wfqJka+jzUg9qFtWaoMKoJRxQ+P26SvV+ktQ/siuk8THJfQSEZtKh
	 3uy2aIrEUiE2r80QRon+w1bRyHghKa+6AhtarT8rRo/oENblRNcxtS9lCrymY5W8v
	 9V05Fvj0odlPM6Mvkhof3WJlu+Ta7HqwGyp1Eiq/0Fkhp38Kyl+O2W6vmMhlO1bPg
	 lBOSv9k1EXPwwmu7QOuOZa9NhWBuSbFwen4gejxYLajUe4zEl0eJL13Ezz3VDDA6K
	 vqXO9p35E0v5TUdmcw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.92]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryXN-1snbsA217F-00qGBk; Thu, 13
 Jun 2024 23:30:07 +0200
Message-ID: <5d8d2efe-45dd-4033-aaae-e7f923ef9e76@gmx.de>
Date: Thu, 13 Jun 2024 23:30:06 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: vesafb: Detect VGA compatibility from screen
 info's VESA attributes
To: Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org,
 javierm@redhat.com, hpa@zytor.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20240613090240.7107-1-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240613090240.7107-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CIvh9Sq72L3aovFbBuEWTa4wKFZV9W+x9cxqUQ8VJu0dwiyxIaQ
 D0sNDRFtQ2uX2wwcTld99nDRnvqMI4nGSeeRJ6mp/PnR8E2Aui1TeHw4LQ+YAalIYT8Nle+
 F2Olcm6+bAdLwagza6TxZ04EK7t0+cTr+/IkL9kNGU1o3x9zaijtTJ6bz4wwNb4Rf9Dbc/J
 0iQ0YxVupLdgzzHy0CFBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mXuTNfgv1qc=;zGblu22QTNPoMbN62vu9nOvUy40
 Wl2fHNKqexYS2cqveLq3ZE8WMNdPifAkR2xv9uVlaLn6QSuqKDlaXT6X8qOXMGntS/vFqYpLG
 RgyHQlleIAGQiUlIcy71GNRFfWUBVZTs3Y3ZOLEePXg55EJ7CcPIFzWdOSbYLsZDNooKH8Y10
 gpcCxhVAYIU7TJbe5md19NmR6Su4uE+oXc+K/9NX1nWe1kBSiF/vk7PhYfKU1SYm7c11tBm26
 GKhJL3B/Ts2zATfB6DHtoOW9jKhmvwdvgISQGHZHfIDMfUdfYvP6ohVeJGJQNiQAJHXVjYh0V
 Ir7nbGkRnbLDCtTJUyem0pwhRhSEYQE/KwtOpXSRJxuHPcptsh9tibTJa3HC+1mga86C00lY4
 wM9EdSwhpqAbYmZGZ6Uqkc7nBiBdFeKG9CNwkVTNEjMTzmgKe5GsLCNr9P47mcAh6/tgm8FTH
 LHJv/B36VPb1BfmmZo4s6uUxBNPRRPdbmHj8HY+2dSCINCJ2D+n90vh28ZG/btbl5nYUAzRCo
 onu0ogYuSxr3y7seDMhYMkLl+2gu7nwltfpTzICZEg2pUcNfVjKwJAp8wPXM5p1Xe2e+JzV/L
 tr8HBAGHxayzNRmt/2xbJ6IywWZ7Zp39I9t1rB/yGTh6m7lrO1AKu9DZBh9vHZ2DD8hORtZe7
 VzDgpBvwfYKSaaT3Z/5OII7VR9m/T/HgqGXGtSlQR3RVuaruBe9biiyIFQjfsUE3B6sWdiDY1
 4epVM1UO2YZ7iZFfTrpzZaoj0J6o9NUZs/TjZ8ZBUnpxP7f24PsSlcigF7nlVD+s11cgkO+/x
 OXMwY/QYWqv8g4y/ZfLzdtpmyHmj6WGRsrI5WZICHI7HU=

On 6/13/24 11:02, Thomas Zimmermann wrote:
> Test the vesa_attributes field in struct screen_info for compatibility
> with VGA hardware. Vesafb currently tests bit 1 in screen_info's
> capabilities field, It sets the framebuffer address size and is
> unrelated to VGA.
>
> Section 4.4 of the Vesa VBE 2.0 specifications defines that bit 5 in
> the mode's attributes field signals VGA compatibility. The mode is
> compatible with VGA hardware if the bit is clear. In that case, the
> driver can access VGA state of the VBE's underlying hardware. The
> vesafb driver uses this feature to program the color LUT in palette
> modes. Without, colors might be incorrect.
>
> The problem got introduced in commit 89ec4c238e7a ("[PATCH] vesafb: Fix
> incorrect logo colors in x86_64"). It incorrectly stores the mode
> attributes in the screen_info's capabilities field and updates vesafb
> accordingly. Later, commit 5e8ddcbe8692 ("Video mode probing support for
> the new x86 setup code") fixed the screen_info, but did not update vesaf=
b.
> Color output still tends to work, because bit 1 in capabilities is
> usually 0.
>
> Besides fixing the bug in vesafb, this commit introduces a helper that
> reads the correct bit from screen_info.

Nice catch, Thomas!

But do we really need this additional helper?


>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 5e8ddcbe8692 ("Video mode probing support for the new x86 setup c=
ode")
> Cc: <stable@vger.kernel.org> # v2.6.23+

> ---
>   drivers/video/fbdev/vesafb.c | 2 +-
>   include/linux/screen_info.h  | 5 +++++
>   2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
> index 8ab64ae4cad3e..5a161750a3aee 100644
> --- a/drivers/video/fbdev/vesafb.c
> +++ b/drivers/video/fbdev/vesafb.c
> @@ -271,7 +271,7 @@ static int vesafb_probe(struct platform_device *dev)
>   	if (si->orig_video_isVGA !=3D VIDEO_TYPE_VLFB)
>   		return -ENODEV;
>
> -	vga_compat =3D (si->capabilities & 2) ? 0 : 1;
> +	vga_compat =3D !__screen_info_vbe_mode_nonvga(si);

Instead maybe just this: ?
  +	/* mode is VGA-compatible if BIT 5 is _NOT_ set */
  +	vga_compat =3D (si->vesa_attributes & BIT(5)) =3D=3D 0;

I suggest to make patch small, esp. if you ask for backport to v2.6.23+.

Helge

>   	vesafb_fix.smem_start =3D si->lfb_base;
>   	vesafb_defined.bits_per_pixel =3D si->lfb_depth;
>   	if (15 =3D=3D vesafb_defined.bits_per_pixel)
> diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
> index 75303c126285a..95f2a339de329 100644
> --- a/include/linux/screen_info.h
> +++ b/include/linux/screen_info.h
> @@ -49,6 +49,11 @@ static inline u64 __screen_info_lfb_size(const struct=
 screen_info *si, unsigned
>   	return lfb_size;
>   }
>
> +static inline bool __screen_info_vbe_mode_nonvga(const struct screen_in=
fo *si)
> +{
> +	return si->vesa_attributes & BIT(5); // VGA if _not_ set
> +}
> +
>   static inline unsigned int __screen_info_video_type(unsigned int type)
>   {
>   	switch (type) {


