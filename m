Return-Path: <linux-fbdev+bounces-5976-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCjBNJxGemkp5AEAu9opvQ
	(envelope-from <linux-fbdev+bounces-5976-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 18:25:48 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F7A6D17
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 18:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CBD53029AEA
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 17:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C897031DD97;
	Wed, 28 Jan 2026 17:05:32 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E8330FC12
	for <linux-fbdev@vger.kernel.org>; Wed, 28 Jan 2026 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769619932; cv=none; b=Bz01l3Ao59fBOPeQ6Ij6Qk2ZaXxUm99mYadVLIuJo/tSgFYrs93cEN5PQGx3drCEe3GOGm9iSKnN0CK8dMDY4SFhDT4fQA2Nmb7puo4BTAEuubleyUdhS2RfjZHySu74MP/tg9etbEu35u1fH9rsrxxJ5rSXkfR3gCZ7jbSIyv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769619932; c=relaxed/simple;
	bh=WBawgXF2Firksq1njt36Zcv/jqw+Xr+TkngaIBAaJE4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tkwQHUdfYyFpyr3EsGYfNA1Rxgvc4h64NI5jeBoJasAbIlIUFZBk/6/pQYY6RvaY3m1cG5+RZ66T4jvICqLruEU6GBvU4VBYt4qYbSrXVWY92E605xZIcYHdM/e7p5mypHVTDYWUm/dcj4Fmr+7QvstSpzg2JLV4mPU+lIXfrhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
From: Nam Cao <namcaov@gmail.com>
To: ChanSoo Shin <csshin9928@gmail.com>, andy@kernel.org
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, ChanSoo Shin
 <csshin9928@gmail.com>
Subject: Re: [PATCH] fbtft: Improve damage_range to mark only changed rows
In-Reply-To: <20260128130503.868466-1-csshin9928@gmail.com>
References: <20260128130503.868466-1-csshin9928@gmail.com>
Date: Wed, 28 Jan 2026 18:05:26 +0100
Message-ID: <87h5s5r7l5.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5976-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namcaov@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,yellow.woof:mid]
X-Rspamd-Queue-Id: 5F7F7A6D17
X-Rspamd-Action: no action

ChanSoo Shin <csshin9928@gmail.com> writes:
> Instead of marking the entire display as dirty, calculate
> start_row and end_row based on off/len and mark only those rows.
> This improves performance for partial framebuffer updates.
>
> Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 8a5ccc8ae0a1..0fbdfdaaa94d 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -415,8 +415,11 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
>  {
>  	struct fbtft_par *par = info->par;
>  
> -	/* TODO: only mark changed area update all for now */
> -	par->fbtftops.mkdirty(info, -1, 0);
> +	__u32 width = info->var.xres;
> +	__u32 start_row = off / width;
> +	__u32 end_row = (off + len - 1) / width;
> +
> +	par->fbtftops.mkdirty(info, start_row, end_row);

This doesn't look right: mkdirty() takes start row and number of rows,
not start row and end row. Don't be fooled by how mkdirty() is declared,
look at how it is implemented.

Nam

