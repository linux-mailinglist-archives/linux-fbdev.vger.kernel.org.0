Return-Path: <linux-fbdev+bounces-6498-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDZRMcfjqWl1HAEAu9opvQ
	(envelope-from <linux-fbdev+bounces-6498-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 05 Mar 2026 21:12:55 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 489BB2180BA
	for <lists+linux-fbdev@lfdr.de>; Thu, 05 Mar 2026 21:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7484F300D90D
	for <lists+linux-fbdev@lfdr.de>; Thu,  5 Mar 2026 20:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71583E51C5;
	Thu,  5 Mar 2026 20:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTvd9k5g"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7740C3E123D;
	Thu,  5 Mar 2026 20:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772741552; cv=none; b=Pf9Hs4xTY+g4ZJahSxGPrETo/PPDOQXDiKO/SxSndXgTHZhLZ2riK9zhaMlkENDmzQV8wRMzjDJoPAK1hIgs2fibL8rYGYpodQ1kmeKDDchid9P3861jBRrMnAMUx6m63eIVyav9TKV8flpEfRCSCZqM/uKIneyccToLuu7tzJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772741552; c=relaxed/simple;
	bh=hbIbkllAiEN/fkhFtcDGuL0eZPTE8FI1rQITQKYrNMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+JQDAVtJjU4Vj0KH1z7MkWTtbaeP2kFhuB6/kg8i57bdyUiuVkHmq8W9URoJf7Va8HCSnd1OVywy13cSGKyfft7ZsdlShZZ/dcL45QltISPBXh0E9JOgm/HvOqT2DnOaNsQiu+QmRdGOlMLiT4Q+anLePWAlZ6jPh6ZffkKqRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTvd9k5g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE2FC116C6;
	Thu,  5 Mar 2026 20:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772741552;
	bh=hbIbkllAiEN/fkhFtcDGuL0eZPTE8FI1rQITQKYrNMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTvd9k5gb4QD6iUdWeDhfx0tGr1FH6uinyHepfoDFhCaSmdWQKPj9v0vjfhqLoBSQ
	 Yn3NuiHYYp8tce/aT0f0ZmW6l1N6Jnm8m/VwmprfA5Oq8w/1/HGjBb8OPUv6e2KuKx
	 VHReeF6+zdP4zJ4GOw+kSe/bICrHMPiFI19Kgp2a4VsTLkqBLkkgUVDw9i/Nr917jc
	 FUosSFPSUK18chpuQ/nv28BycJzu3251vOuiJ1OYLrmMP1G/B6k1cQm0jiMgKBscPF
	 Z4hH95r7JNArvYzHp9JThUSMs1XBiIVIYqbhfVhGQ3gnxG4sMr5RgBi65QruPjltTF
	 zZbUWYRH2HAlw==
Date: Thu, 5 Mar 2026 13:12:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: gregkh@linuxfoundation.org, deller@gmx.de, sam@ravnborg.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/13] lib/fonts: Compare font data for equality with
 font_data_is_equal()
Message-ID: <20260305201227.GA2200688@ax162>
References: <20260302141255.518657-1-tzimmermann@suse.de>
 <20260302141255.518657-10-tzimmermann@suse.de>
 <20260305002347.GA4102761@ax162>
 <4acb921b-6bce-4bbf-a607-cc3e991dfc3a@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4acb921b-6bce-4bbf-a607-cc3e991dfc3a@suse.de>
X-Rspamd-Queue-Id: 489BB2180BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6498-lists,linux-fbdev=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmx.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 10:31:13AM +0100, Thomas Zimmermann wrote:
> Thanks for testing. The attached patch fixes the problem for me. Could you
> please test?

Yeah, that appears to work for me as well.

Tested-by: Nathan Chancellor <nathan@kernel.org> # build

It seems like the asm/sections.h include can be dropped as well, since
that was only included for is_kernel_rodata() AFAICT.

> From 8dc48d2e676d1437584794f4df3dd20d08878655 Mon Sep 17 00:00:00 2001
> From: Thomas Zimmermann <tzimmermann@suse.de>
> Date: Thu, 5 Mar 2026 09:28:28 +0100
> Subject: [PATCH] test for internal fonts by refcount
> 
> Internal font data is 'static const'. Hence test against the refcount
> being zero.
> ---
>  lib/fonts/fonts.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
> index 198aae869be2..b73d74b977ec 100644
> --- a/lib/fonts/fonts.c
> +++ b/lib/fonts/fonts.c
> @@ -45,14 +45,11 @@ static struct font_data *to_font_data_struct(font_data_t *fd)
>  
>  static bool font_data_is_internal(font_data_t *fd)
>  {
> -	return is_kernel_rodata((unsigned long)fd);
> +	return !REFCOUNT(fd); /* internal fonts have no reference counting */
>  }
>  
>  static void font_data_free(font_data_t *fd)
>  {
> -	if (WARN_ON(font_data_is_internal(fd)))
> -		return;
> -
>  	kfree(to_font_data_struct(fd));
>  }
>  
> -- 
> 2.53.0
> 


