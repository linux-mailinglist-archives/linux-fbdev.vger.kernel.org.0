Return-Path: <linux-fbdev+bounces-2913-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3524962EF0
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Aug 2024 19:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6094F1F21149
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Aug 2024 17:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B071A705E;
	Wed, 28 Aug 2024 17:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="c2Q6hE9N"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE53F47F46;
	Wed, 28 Aug 2024 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724867441; cv=none; b=ouQzbWJ1fBFVGgyHv4i3itAjNbtlvQNfLyXGm1JPlT9NE2LWFPeHF1D9qKQ7V/DNY9W0ymKgvAizr6UzvPH1dfT5FKLYZxD+DILF/7UqK2VHqkqlDIYRJI6wBMYI4CcAwragjJqPc5WIhtBb+dOshhhA0g4vAZg2HrTlOMKklc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724867441; c=relaxed/simple;
	bh=eiLgzawHE6vKEzymJ8TrAFb+ikTgGfjCG3d6djhZyRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DmVhr2tAOimqApNWDZEbFpluWbDfjgxZh7G5FhHx5+/c8VWt3zyiUsfLdP5SdbA2HtbpAG6iFItwf/uRK5vOvPZ1Yp6QZ+UUyAGZEbZmRMTjGYIsWVsHqY+HbLBQTRa3nVWEWhQIa1mhToxcPQGgPv4nYJ8TlbpR4vDPS1BE0TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=c2Q6hE9N; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1724867430; x=1725472230; i=deller@gmx.de;
	bh=rvevHnVJVPUNKAo/siXVSaJhoxBvuskiX9A/MfIre6k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=c2Q6hE9NL/qPsAj9abJ/vMYf3fuPitRgV8Xjk+3MsmCORsQd0W1fsoyIrZuAX2b2
	 kra26hes2MJpPnjPC5rfgBR41WS1EU4jlS+NSOlA8pGPxuvpMWDFaFESGSy0OREvA
	 1Tsgrqr6Llm+FG7HvcSo97+ec9OeCVZUsCjXtpBGFpdXOP6FcBl5CcM4vUr7fquK6
	 ANR64tOywfzjMejNP1ziKXGBaWam7Hp9fK0HY3lYtGsTyENChRBbbpEN6Llqp98CY
	 eLismL3wczAm9kE5XoioPiKheLL9i7zJNGxg7Ag2vE8hWXhZVdh90ofYw3QGKdweq
	 RiDS4HpAVifp7WdSlQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.126]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6bk4-1s1yxc1wCs-011IDc; Wed, 28
 Aug 2024 19:50:30 +0200
Message-ID: <d1cab5f1-2b3a-413a-8ccf-3152fd8b95df@gmx.de>
Date: Wed, 28 Aug 2024 19:50:29 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] fbdev/efifb: Register sysfs groups through driver
 core
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Peter Jones <pjones@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240827-efifb-sysfs-v1-0-c9cc3e052180@weissschuh.net>
 <20240827-efifb-sysfs-v1-2-c9cc3e052180@weissschuh.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240827-efifb-sysfs-v1-2-c9cc3e052180@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UUws2WnyAMehh5YxIGqAiQ2bYs6Lzb/SO1HfUM2VbDjm8ZVcJED
 Pem8akMcbRb/mamA+rMVRXQQ79tTViDSaA5dHgsnsKUXM5zdPDY3dxdjfugfyR9U4vDChSl
 5pAMMJAR5WmxRlTpc8CBuZ0LFKu9zijvaT1Do2ADXqTFC6FYx0SqzBglmLSovpMUsYsXNiA
 GuPRWBzMZPkW0ogLHe6VA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/XN+vNesJQs=;tQi9Xyt/rjuFbIz5Kk5DnQOEUeB
 XsFbA8GRdhhnup2UTUabNZYycIdyR5Nc7PCkDBdpw48U9/GO4/1NDUUPK4XvNhY1BS5yeqYEV
 irTYeMZVar0uox4FNzUm5y6r43UCRLMlnALX61M6mvijrbOSGEszIxtFOG+8n48GKBjHNiQAC
 25EqkyBsaaTHXhqbeH+QSbnrdfPy1k/U6wseipRCfvluDPMpmBknmNp9HAbOuwWJ3Vsk2IxNG
 Dt4Ncrb+J2mOCMeKF2bV14cv1k98nnG4E+zgivKsO3aGicTkC8Hjg+uhn+kS8aLPey6S8PVme
 CyZfqOXN0ja5ay3JnajqRvSm2hK4JNF50yVTCngx+r1CLjRyBfgooPoxL63Sa7b62KOjb0Yu7
 IfvonAQKGdPYjl0EXbm6Z3kZhW6W9cYvZN0/Muw7QAmYMuIDfrMhwwXVCThNDEIT4pZ4oGUeQ
 4vRW7RNAlKmlKZLdC8swQQQz6/gRY7xE/aBqbyfscYpNpdp/rNaAeoAu4C9dhIdy3rEzFFo7Z
 tG/I75e6XD/Oe5jsxyUMR/ZsMXnvezYwZLcVtyvNgLXnH4klqYTD+V+H1J+c+Ixc1z4o3TNB9
 54xgCaaJh70/9iWI8PDWMZwp9BYn+QEqjE3OQBjaGE/Kabz35aKlfG4x4hgrVvnJcaaePfnX4
 VDb6TD2K1VBuHg7LJgAMQfsEmBSb7oA6TEnTDjICsGNc7uVBBaAVh+fWiHF7H+hSdREF1rNsX
 XOJDSJyeFS+S5IiSnVbGAKcoOUQQuUdUV4q+uDBGkXRjL12hBDKBt41OUm+F2NXzTbog/vMDF
 ZBQxl6G9K0U9TS0qdxsIITHg==

On 8/27/24 17:25, Thomas Wei=C3=9Fschuh wrote:
> The driver core can register and cleanup sysfs groups already.
> Make use of that functionality to simplify the error handling and
> cleanup.
>
> Also avoid a UAF race during unregistering where the sysctl attributes
> were usable after the info struct was freed.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

I've added your patches #2, #3, #4 and #5 of this series to the fbdev git =
tree.
I tend to not take patch #1 as already explained there...

Thanks!
Helge



> ---
>   drivers/video/fbdev/efifb.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> index 8bfe0ccbc67a..d36b95856dd0 100644
> --- a/drivers/video/fbdev/efifb.c
> +++ b/drivers/video/fbdev/efifb.c
> @@ -561,15 +561,10 @@ static int efifb_probe(struct platform_device *dev=
)
>   		break;
>   	}
>
> -	err =3D sysfs_create_groups(&dev->dev.kobj, efifb_groups);
> -	if (err) {
> -		pr_err("efifb: cannot add sysfs attrs\n");
> -		goto err_unmap;
> -	}
>   	err =3D fb_alloc_cmap(&info->cmap, 256, 0);
>   	if (err < 0) {
>   		pr_err("efifb: cannot allocate colormap\n");
> -		goto err_groups;
> +		goto err_unmap;
>   	}
>
>   	err =3D devm_aperture_acquire_for_platform_device(dev, par->base, par=
->size);
> @@ -587,8 +582,6 @@ static int efifb_probe(struct platform_device *dev)
>
>   err_fb_dealloc_cmap:
>   	fb_dealloc_cmap(&info->cmap);
> -err_groups:
> -	sysfs_remove_groups(&dev->dev.kobj, efifb_groups);
>   err_unmap:
>   	if (mem_flags & (EFI_MEMORY_UC | EFI_MEMORY_WC))
>   		iounmap(info->screen_base);
> @@ -608,12 +601,12 @@ static void efifb_remove(struct platform_device *p=
dev)
>
>   	/* efifb_destroy takes care of info cleanup */
>   	unregister_framebuffer(info);
> -	sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
>   }
>
>   static struct platform_driver efifb_driver =3D {
>   	.driver =3D {
>   		.name =3D "efi-framebuffer",
> +		.dev_groups =3D efifb_groups,
>   	},
>   	.probe =3D efifb_probe,
>   	.remove_new =3D efifb_remove,
>


