Return-Path: <linux-fbdev+bounces-7651-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QC5DDupfMmrDzAUAu9opvQ
	(envelope-from <linux-fbdev+bounces-7651-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 17 Jun 2026 10:50:50 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF4697A97
	for <lists+linux-fbdev@lfdr.de>; Wed, 17 Jun 2026 10:50:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=UcyjAeZJ;
	dkim=pass header.d=redhat.com header.s=google header.b="gW0h/+RY";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7651-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7651-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54737309A15D
	for <lists+linux-fbdev@lfdr.de>; Wed, 17 Jun 2026 08:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF713C9EE5;
	Wed, 17 Jun 2026 08:46:22 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432FB3D5246
	for <linux-fbdev@vger.kernel.org>; Wed, 17 Jun 2026 08:46:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781685982; cv=none; b=tBIjsFOPqCqC8z9xFQWrmwsIdl47KGOilkM6OiGAf61Z133JhhwosI31pbAcs0NQqdEC6quIMoCjcjDmYQiud4kB6Vn28tp2wtn2oqfnOS3z/5TNMe0NHzpJw0E296dmIC23/8F75Lf8TP5rQruGWgjd6Cu5egrFAd2+GSvb5gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781685982; c=relaxed/simple;
	bh=M8n6TOYWeE2TOo2qJP8VGCj1PD0g0HwUbxjKbcvo5I0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hLvjsXkpOJ4sgzisFV4F93HpEzPd9MBB6bze5YgAs/WuM1GrCzfo66mduTqDa+1E8Kkf3eOLv1oO8Ym1c3mFn+GMHSB1hTSuTQTD2WQNX5ueJK9g6GNogdunjHKDTRgZJ315GoZFElmJVF/S06relzV7LIJ6ZvZVZ7LMOmlWoDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UcyjAeZJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gW0h/+RY; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781685973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pFhQQHKU3t1hnJ/IuHZdwIg4ogrFO0iWtKlJaJoc+2M=;
	b=UcyjAeZJkN3AbJ0NRn0DIj+RhSE/J9HfP2v8p8aMkXQTc33Ce6E/lVBOMZwkI1g3bVuAUY
	WOB5bPOVpzn3rG2zldKoem58KGtr7Eril67s3OApirsapU7cdom8Tm3UIb+mHGz5oc4aFf
	hefvUt2/rBertbihMMW7pYsbic57DBc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-YiaGcU4LOaOAWOQ-cl4dQg-1; Wed, 17 Jun 2026 04:46:11 -0400
X-MC-Unique: YiaGcU4LOaOAWOQ-cl4dQg-1
X-Mimecast-MFC-AGG-ID: YiaGcU4LOaOAWOQ-cl4dQg_1781685970
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-462d8ccf553so233387f8f.1
        for <linux-fbdev@vger.kernel.org>; Wed, 17 Jun 2026 01:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781685970; x=1782290770; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pFhQQHKU3t1hnJ/IuHZdwIg4ogrFO0iWtKlJaJoc+2M=;
        b=gW0h/+RYXEZrDQ2D/WQecjo7GGJCOEBuKRgG8goOYvsp8P3myWodCTirDGZR/APndR
         LmyWztALL26lplia3q/vxwLzMSbCTLbVu76A6Zkq+XVekuS3DEisagLVclVesOrPt2Pp
         xoKWDAF0CR1Nm8TBh73CG2qmBOWTaBgSU5uamAwK0tsp+oJNzYjVh1Mb4KpVE728auhZ
         Z0dQxmUSPwLdFIpZnatZG8femOmgb9WzvHYAH/WV38nqTirok9HcuL+dP8VmkepUUsV8
         IqBtOCiKIuQjcerD+Vdc/i5AeZ0fUbXf+Hvnit+JIHlrLfUNX8ge/sScFPqh1aygJZXG
         Xq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781685970; x=1782290770;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFhQQHKU3t1hnJ/IuHZdwIg4ogrFO0iWtKlJaJoc+2M=;
        b=fOujaIg2mx9BMnkjoJGtHyF65/Ln79+iGgVt4FHN3RAht/R6CTtbMMAo5/+qNVNkIL
         3aWPix4r7Gv/9fon12MjtwKMArI55qoRL8/3KeS7ebFQr7BCKQVXYH2iVnWZDfYhfowm
         ZUArAtGaImxsqe1Qot1Mu/A7bUMRQl+UPHtBl2EtvcJYkAbY+g2LY6S58NF8DSd4fINr
         85asSzkyqjbywH4LhIKbAKmBFESrItqAF1E+4lrRbx2dRmhD3Q7ZUBUYPXpt5k38IdhI
         1VpEfswbXkhbs5UA79UVnBd3wRZAi4QhfmCtsqEMCTb6OnPWkhIH7BKCoDI9zuplzKik
         3/lg==
X-Forwarded-Encrypted: i=1; AFNElJ8fOGjKLJObNPy6s6JqzbZKszgs/SinxjZ30Dlqcx5DYcelPxcD6X7dTz6x8mw/gUEYF/6243LcRyc+UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Fl/H5UGtAgvkzIpIk3rqWZMTPsfbmJZ/AND6HoA491uXKwHH
	KTWVHaPXHGPYCgaHxbzAHX7CQ9ZfVhaTeSkpzpZ1KjdfhZujhMQ4uv1Llav9jfHPbJRl/0DkkoZ
	tAqiNzHlInsL8mY0+kaLJXLzSt10vTkEudQB8q8YhsQfuzU8+J2nPutwf+mELwthO
X-Gm-Gg: AfdE7cnGOvSwM7rfKqetNgdNTGfbPpqu800Y8ElxkpMJS/YbMeaH1cqifV5Wx6gN/J/
	mLPhw/Mg/9c4jvT5L0EAe/JwE3thqKFdwhRvZmUEUP/BRkoIXUm4ZePHRCBJf05CnNaqlUI66Wp
	wvvJEVjp4eBhoQpb4zEBwOBZqdQC10+i3e527exFY722G1apn9imnkDtv9Bi7h+lnPXH0Lz5whU
	VNHpmY3fKTgVgU6gzDZZUajdgICQLStmvlOdZFXk0zn9lgQJS1Ulg60DIs/DDyl+55hMe2lpIwA
	dM/SGOS9gg3qI1J2zj+u8sDYJPIHJmLd6C2rC5VGPkOJtqsfhagm++WG8pP7kBs2s65TlukjE64
	cR3PgmZwqnDRUi+jviW+x8buLhdhq8gMHZGiGFh/bTFc+i09YC8vKbNKd/fgmSno4CXT/Ow==
X-Received: by 2002:a05:6000:4206:b0:462:d07e:4bc4 with SMTP id ffacd0b85a97d-462d07e4dd6mr2154252f8f.7.1781685970419;
        Wed, 17 Jun 2026 01:46:10 -0700 (PDT)
X-Received: by 2002:a05:6000:4206:b0:462:d07e:4bc4 with SMTP id ffacd0b85a97d-462d07e4dd6mr2154194f8f.7.1781685969953;
        Wed, 17 Jun 2026 01:46:09 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f726sm49513436f8f.15.2026.06.17.01.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:46:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, sima@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] firmware: sysfb: Mark CONFIG_SYSFB_SIMPLEFB as deprecated
In-Reply-To: <20260617081810.218168-1-tzimmermann@suse.de>
References: <20260617081810.218168-1-tzimmermann@suse.de>
Date: Wed, 17 Jun 2026 10:46:07 +0200
Message-ID: <877bnxzh9s.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7651-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[suse.de,ffwll.ch,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[javierm@redhat.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:sima@ffwll.ch,m:airlied@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ocarina.mail-host-address-is-not-set:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,suse.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EBF4697A97

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

Thanks for the patch.

> Mark CONFIG_SYSFB_SIMPLEFB as deprecated. Enabling it allows to
> run simpledrm and simplefb on EFI/VESA framebuffers. Doing this
> is discouraged in favor of using efidrm and vesadrm.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Do you know what the policy is for removal? For example,
how many Linux releases should we wait for this to go away?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


