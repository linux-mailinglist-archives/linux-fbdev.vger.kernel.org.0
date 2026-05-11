Return-Path: <linux-fbdev+bounces-7186-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH06O5uNAWpyeAEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7186-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 May 2026 10:04:43 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 871BA509C80
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 May 2026 10:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72C203035B0F
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 May 2026 08:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9783B7772;
	Mon, 11 May 2026 07:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bwG/OdZD"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636A03A8747;
	Mon, 11 May 2026 07:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486230; cv=none; b=WpQvLSIOb/Z0rG3WKV3BsMxB2RlWVf57jVZTJtORhzJzA38TEPt8IEE0SnC9RiBaZBqkRX72XKJahJSoRWlVSO6quxdifh6Mw38tjC3bgPj96fzzW9i9eYtElCTiZXxHjSyIN0UgzkPTWXjMzPMTXjP6PTipvqFItL+kEPiZSNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486230; c=relaxed/simple;
	bh=xoszqIFclkt39j6kHtik7JNlZe/Gte788UPg1TZKhMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWfsb/AFaBpe33jYa3Phfmcaj/VfQULEt31mZJN1usFkKyUBJ3C0I9Xf17pMTBnBV8F0Kh234XR41vMNJBQMKXczqd8HMpXCS3b0qlbq8d/aMFeXyX8yxL/a1nAmYWZuekrJFdmKEuKz8kXFs+vi5tG9K67qzAdsUTXxbMHKEyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bwG/OdZD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A8CC2BCB0;
	Mon, 11 May 2026 07:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486229;
	bh=xoszqIFclkt39j6kHtik7JNlZe/Gte788UPg1TZKhMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwG/OdZDnPQdEit0udfb4xs/Mql+f6PNtb6wLs5eW9tZmlYYgskmzpyYCAqsgyscg
	 htcmZlBq1Q+CuCHuY7vzPbuQPVgmatQvHiFFV0nT4LWYUimr6LumWDYAbo0FWgZP7D
	 pqQcVJMlaRHrOk46babTBr1BGmHqTwUpX6sd5mKo=
Date: Mon, 11 May 2026 09:57:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alone <yogeshdangal66@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Add const to g_fbmode array
Message-ID: <2026051100-mankind-disown-5cf3@gregkh>
References: <20260509164057.71722-1-yogeshdangal66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509164057.71722-1-yogeshdangal66@gmail.com>
X-Rspamd-Queue-Id: 871BA509C80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7186-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim,0.0.0.60:email]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 10:25:57PM +0545, Alone wrote:
> From: Chhabilal Dangal <yogeshdangal66@gmail.com>
> 
> Add const qualifier to g_fbmode array since the array
> itself is not modified after initialization.
> 
> Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 9f3e3d37e..19c3da654 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -33,7 +33,7 @@
>  static int g_hwcursor = 1;
>  static int g_noaccel;
>  static int g_nomtrr;
> -static const char *g_fbmode[] = {NULL, NULL};
> +static const char * const g_fbmode[] = {NULL, NULL};
>  static const char *g_def_fbmode = "1024x768-32@60";
>  static char *g_settings;
>  static int g_dualview;
> -- 
> 2.54.0
> 
> 

Please always test-build your patches :(

