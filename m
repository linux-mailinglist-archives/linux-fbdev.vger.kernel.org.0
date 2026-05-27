Return-Path: <linux-fbdev+bounces-7390-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCaBBXL0Fmo6ygcAu9opvQ
	(envelope-from <linux-fbdev+bounces-7390-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 May 2026 15:41:06 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C925E5327
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 May 2026 15:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9343E3024298
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 May 2026 13:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2942B403E97;
	Wed, 27 May 2026 13:26:24 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B800C40759D
	for <linux-fbdev@vger.kernel.org>; Wed, 27 May 2026 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888384; cv=none; b=i5W72tyOBk876OGTkz9aSoEOSzME+mYmt66Fd25CUenQcc5lUiGaFrzDxlONThQjCwY5W8xujzJT0u8ZUpQHefe+yV82oTC85tJsI8vfRFu2BO5s4dWq9qzZga/QtfC4752Axh3uGSVtu5Oe05tgA0veieGsB5fT634AAIIMISg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888384; c=relaxed/simple;
	bh=tmDU4VguE+cwpfpInPS+PXjfh3XEe4XV+vkqOU8kHK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nosZSedkHAuSIscuUZ0I594aB35gGFJHBFLpXL3c7lVihSblIKaaSPJxgAcdqoQe6oxkCCLtF/Oq17xAwRTaniLOPFaBgxye+MzG+5/xCWwewhBKwcGS+z7ah2LwJ00kT6w0w0dNi0QhmQppl0EQVeOc/ASPkcMguR3rLTy3kKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e36bb16a92so6082380a34.2
        for <linux-fbdev@vger.kernel.org>; Wed, 27 May 2026 06:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779888381; x=1780493181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9MuSPc8y576tayBCaWdrNcab8/lH09ziazVq9lwM/2k=;
        b=gFh2wLUc7nHUidjMYG+fGGYnujAzNFYON7shsxTlAgrsdBpxvHeMyky6s9vDk11aJ7
         u/HeecRyqcj5Gnue5uNweJzNaXx8JAYtWOa5oredxq7LV2pLnOWiekL3E4fu+QBS/PIn
         xmfjwndAaN5fG1VcxYxkRXH2jOsPuqlexxwmjrTKUjBg1bOx5vlQRNft3GyEydZLIzYy
         e0Hkw82AiAp0r6mAmnUDuQF4gTgIsVGMRQvnuUcxvR6GAkFdzkMKs9nObLfpUW/0d701
         3nIBOIHy668tqix6PabiFDylqY85eheNoRCccE6sxgrjcrNM0Q4MlQf3Rm2bT5CAsepE
         QU2g==
X-Forwarded-Encrypted: i=1; AFNElJ/7D2tR/7GCuE4Z+wT91dD9Lkm5ekuNZEwaEr9t3bu/5V2TU7DVAEcwYmXohu72gJKF8eLP3CDCH0Ry0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr6XFfgny5Kk3JA1MbYrT4Vyrkf0Vgxweihy7T+xxDTV3yivJP
	j37MKqbIWCi459FZqLj711xvtzVIy5Sdf3Ys9vKYha5IS4fifAND1zXtu8wj/F7gkEg=
X-Gm-Gg: Acq92OHJHWLRYvwLEHEa6zrq2UVKar7x43Vw6qhMwJfNg8mgnsBDI3IPXDo+C7ju1Vd
	C0mKrBfrM93M8lJP81RK8F31E07aScmytNLBH9hxhQkd1+hNu3GDV3t5XBwZqlRix0jaN93DluH
	aECCq3rXB/zTmSOMWgMn5WgW/Z5Uw7GlkfMRX3QPuE+tFwqp5VbpBy/BJbyJSCBoh4UGAzEklOL
	LZou6CnZXhyGsUldYWKnJk+Ii26r7FCgyY/ldct3sS39PsKtiNn24dg5VlZ1/dzaz4Y43oXo8Jk
	1dniV20ylf2OwezbLRS1UWdQouwSXO+l2pMuGLXjnTMoE3Hz+D5IYmK6aNIH1q6DnUMZgbicM97
	SviWfjwKWwBEh9Ot3/KdxvDZqdWWCJs/HSuf44Wg1r1fItNcVT2eJQGHNNuKeQ8gNLQ57wHK3An
	1yrHPMufbBLQq0FWwnVjHK0BBDRGYYGX0/dzKs5vC50a23FsFd7rgzW+UsUw2w
X-Received: by 2002:a05:6830:610d:b0:7dc:e30d:6498 with SMTP id 46e09a7af769-7e5fec0fbddmr12513587a34.1.1779888381510;
        Wed, 27 May 2026 06:26:21 -0700 (PDT)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com. [209.85.160.43])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6064828e6sm11641569a34.7.2026.05.27.06.26.21
        for <linux-fbdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:26:21 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-43b6f19b7d4so3645185fac.0
        for <linux-fbdev@vger.kernel.org>; Wed, 27 May 2026 06:26:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/UmRGwXbtgk7QhdLEvyz3CJREEZMqnccZBUVUlRppvclF2hNC4ATY2mx4F2mVPVxANid7fX7yq96WIkg==@vger.kernel.org
X-Received: by 2002:a05:6122:3102:b0:56e:e9cf:7134 with SMTP id
 71dfb90a1353d-5865ee6c055mr11675886e0c.3.1779887909452; Wed, 27 May 2026
 06:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com> <49576a7501128c93ef318566ed7faefce163f1fd.1779803053.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <49576a7501128c93ef318566ed7faefce163f1fd.1779803053.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 15:18:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFCGKUCDBLiX70bLBUGxU7iZRGT0hEipkrM2FkjE3v6Q@mail.gmail.com>
X-Gm-Features: AVHnY4K9MKooRiuSGEh5fNQ2eTKctG0rOT_zroLTx4bk0lQkHEgucmZG57_gNvg
Message-ID: <CAMuHMdUFCGKUCDBLiX70bLBUGxU7iZRGT0hEipkrM2FkjE3v6Q@mail.gmail.com>
Subject: Re: [PATCH v1 6/8] zorro: Simplify storing pointers in device id struct
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Max Staudt <max@enpas.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Helge Deller <deller@gmx.de>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, "Christian A. Ehrhardt" <lk@c--e.de>, linux-ide@vger.kernel.org, 
	linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,hansenpartnership.com,oracle.com,lunn.ch,davemloft.net,google.com,redhat.com,enpas.org,gmx.de,lists.linux-m68k.org,vger.kernel.org,codasip.com,c--e.de,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-7390-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-fbdev@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.940];
	TAGGED_RCPT(0.00)[linux-fbdev,netdev];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux-m68k.org:email]
X-Rspamd-Queue-Id: 27C925E5327
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 at 16:18, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> Technically it is fine (on all current Linux architectures) to store a
> pointer in an unsigned long variable. However this needs explicit
> casting which is an easy source for type mismatches.
>
> By replacing the plain unsigned long .driver_data in struct
> zorro_device_id by an anonymous union, most of the casting can be
> dropped. There is still some implicit casting involved (between a void *
> and a driver specific pointer type), but that's better than the approach
> to store a pointer in an unsigned long variable as this doesn't lose the
> information that the data being pointed to is const.
>
> All users of struct zorro_device_id are initialized in a way that is
> compatible with the new definition, so no adaptions are needed there.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

