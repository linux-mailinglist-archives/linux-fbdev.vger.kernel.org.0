Return-Path: <linux-fbdev+bounces-7598-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zb95NZ6oKmoeugMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7598-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 Jun 2026 14:22:54 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F969671C81
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 Jun 2026 14:22:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Rl5QdRzU;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7598-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7598-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DFC430816C9
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 Jun 2026 12:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C671F3F54D9;
	Thu, 11 Jun 2026 12:22:15 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF213E44E6
	for <linux-fbdev@vger.kernel.org>; Thu, 11 Jun 2026 12:22:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180535; cv=none; b=PFBOWkJQiA0jietT+CpL1FtpGOvPiKGRUno0bs5xEXs3LYcQoZln8lnJWt++aicFCL04HD/iJbKZDNvXr2S4Z6CpeFMKEftiHXl1NHumLtm0trwr7h/P/ACkVNjKMychipYsGPRbfNWWXSG4eSeTdRhLX+FHesABfnteKkIm7DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180535; c=relaxed/simple;
	bh=6+fL2BPGQeOG72B1oxvEVeT/7UrpbAqXAUb99d70qpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhRcCEdgx1yHGqN453uHcrMjUDawps8S5XEkrgj9Uoc15sr9qTONDNa8TcX3kMA+9ANLbckB/10e8QPxeuuYm4KAeqfHR9fC33zK/8SU5bU6fDPXkyrx9cOnpgpZ6kvdkG7LcppBsnuNSmv0ZMrjU49vP1u5fltAhfiAPLSpS70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rl5QdRzU; arc=none smtp.client-ip=209.85.219.54
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ce9df49c5fso108367286d6.1
        for <linux-fbdev@vger.kernel.org>; Thu, 11 Jun 2026 05:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781180533; x=1781785333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OetJ/hLRU1JZtsBJPzrmV8acCOAe8IH+hKBZOGdqGTI=;
        b=Rl5QdRzUkdfQmULu+IhIxQV+RDHbOccbjwIe8nhNtlgaS/rXzHNxoPSRaH31KwBoeF
         OBTKUzL+PLsCK5DgiHVGIC1qc2eGHS9Aa5b9vBlECHvr/DcJTRCaZDvIu0PgM5Xkd380
         0R2ume8VMHY+H20vMN1ZIAqKzjPicAF06Tkkyyg5RJi6nUEgO2Lk7/WFCDShBbCpXpnm
         7QFdktut/wiHMFcfJIMSuaUdydDbbe4XHtI9FEvB0ek8BYUU2JawOSvwKjnFclA/6Ba8
         F873uxMG5OHOKsjI5quV0myQ/Y1dk/jpzzezCNH98wcZvQmgMLe0VtOuOf3fxDi9TWpJ
         bN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180533; x=1781785333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OetJ/hLRU1JZtsBJPzrmV8acCOAe8IH+hKBZOGdqGTI=;
        b=pojY/hQ683ibHge7Nh+UAUX/+Atp8xB1IR5IrQMozXX0KNQs1zRURG93SzQvH3Gjmg
         w3CAIK2aqBhRB5ipgwAr4XOjypvn8+nNx3jsqklRBY0C15agBCykZb1eVZfTQaAm/j7T
         Td1yTS5lcaCX26qDOmShOHxndnFHHNxpzBPggWQj4f4HU+4GEaiyFR31TVvGWZakW6pr
         5XhBtE8jcV4TsmHjS6NZt6jhZ5MMWL4BYs949PGi7cBqHPIBiNCuby4w8+IOlXqPqFa+
         PMeZNwV0BunI8ykRmPVztRcpXlBnuIcR2RPmvQ9GpnuJWD/N+lVRP5hkzNwp9GO6f6Kw
         +nXw==
X-Forwarded-Encrypted: i=1; AFNElJ+ECocIMOEYqxbz9fRyaqod2aJ0xL8jwHUkDAyrcdoDn162Kl+KT/JfHRA6LmD3mWi11+nqRaJfXCkyfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDiAJOuCgZ/HrIBrCuSTO9bqfLeHGLoPQbtXNyeUADvSnhdifh
	nrjM0ZdzMQOoC3OnXyXSioVmrOlmZCmRDwCc8/DbUFjpsEYbX4tn7MN1
X-Gm-Gg: Acq92OF4JLyyjEEmOVvtPlY02xEBLjxQsBmYFeiFvfo4b360FKDw8ldqEtVQmxzNhCI
	EqBUYZ42N33gx1GvOLeZvDA8jCWDMBUgHUMvOzTuo6xaeseLkVxJnKeOOSOSpybg2h4+3sXaCtD
	aAlaLxk7jDV2SL3wP+65ENCyP7Td/soUg5TcaZ7LDUkqHRbh/rCt47WF3To8zfjmrflcN7dR8rG
	psigPzUbqT4OzQVVO34+PNTcktQLwx1EKG0bWMojPuXoxIY7BkmEUwMONt+KR/yAlyZUekEuqQP
	zWio//+Jtn35sXFKUtHz/c8CTcCcShZtO9pPkkSkPF0XImWIix7peN+ufAhbRFoHQ+BT1S+y4Hp
	Ck0jvZmHH5JGNde1Dx759u7jXuHrMhl73yDXYnA+o2TU/w9FfHyapUvkcFoEn5AZ0jfYgsHzzjK
	V4sAYfd95qe35dO820YGEHOS8Fc9w=
X-Received: by 2002:a05:6214:5a0a:b0:8ce:b018:89ff with SMTP id 6a1803df08f44-8d1dc1a5122mr43035196d6.36.1781180533295;
        Thu, 11 Jun 2026 05:22:13 -0700 (PDT)
Received: from localhost ([149.40.50.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d1eaf99e53sm16296606d6.41.2026.06.11.05.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:22:12 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:22:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Siddhesh Sable <ixebec777@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix CamelCase variable name Bpp to bpp
Message-ID: <aiqob86eyiauQz2M@stanley.mountain>
References: <20260611103748.29584-1-ixebec777@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611103748.29584-1-ixebec777@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7598-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ixebec777@gmail.com,m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-fbdev@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F969671C81

On Thu, Jun 11, 2026 at 04:07:48PM +0530, Siddhesh Sable wrote:
> CamelCase variable names violate the kernel coding style guidelines.
> Rename all occurrences of 'Bpp' to 'bpp' to fix checkpatch warnings.
> 
> Signed-off-by: Siddhesh Sable <ixebec777@gmail.com>
> ---

You're working against an old tree.  Work against linux-next or
staging-next.

regards,
dan carpenter


