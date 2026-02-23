Return-Path: <linux-fbdev+bounces-6312-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAmPF8hhnGkoFgQAu9opvQ
	(envelope-from <linux-fbdev+bounces-6312-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Feb 2026 15:18:48 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D1177EAB
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Feb 2026 15:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12889300B46A
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Feb 2026 14:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BB223EAB8;
	Mon, 23 Feb 2026 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="naWM1Sgy"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AA4142E83;
	Mon, 23 Feb 2026 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856162; cv=none; b=SYZ09klEllqS6/yoAi10mF+6Gv6SP185Hqzm5cPixlTTi+uJFxNKYEyGFLy09hiL62CUt5wmnL7sRx0DqHL0jsslegNYPA9/RBYAjKGo/5eX76Uwrxb2nKIZuVhXX8PQvvhv5yfipVwcCKoULHiK2jhPoKMVeISV+XFo6lZgRr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856162; c=relaxed/simple;
	bh=WHLPgsZ3iTR06FdZfStKSAY8kzbHFKWMuFf6f3gy5VE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVD5kK0v6It+cSlizVElGoaCeT1St2oBoAmLc39a2nTrGpRyZkoWLOxJA6YtT0SoAAko/QcIJ3UfSnPLWOEAErSZCqYjodHoPglISAPOlA9h5FZsIeQnp28Lsp/IIujFBkXFCI/xmi+uETd/v4Zjp/YI9YGV6MpEzbjmrVzw2o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=naWM1Sgy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3B8C116C6;
	Mon, 23 Feb 2026 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771856161;
	bh=WHLPgsZ3iTR06FdZfStKSAY8kzbHFKWMuFf6f3gy5VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=naWM1SgyqPjr3OWon7WQly9YM8zA0FzEyWlDMSU+nr1vKqYPR//8mpxAKAisyJSMc
	 TQG+xnUxiFJFeQElflaKc69BVJGT/GR8ivWZVcjFcV4mDX2cZkwZAQzHZC8HNlP/iw
	 pSkGX9+S1iJKtEwp/5+wN1695PzGccGP3jARwWGY=
Date: Mon, 23 Feb 2026 15:13:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Shreyas Ravi <shreyasravi320@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] staging: sm750fb: remove Hungarian notation
 prefixes
Message-ID: <2026022316-subtype-hurdle-8b18@gregkh>
References: <2026020842-litigator-flatworm-65d0@gregkh>
 <20260208184344.657617-1-shreyasravi320@gmail.com>
 <20260208184344.657617-2-shreyasravi320@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208184344.657617-2-shreyasravi320@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6312-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: CB1D1177EAB
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 10:43:44AM -0800, Shreyas Ravi wrote:
> Remove Hungarian notation prefixes from variable names to comply
> with kernel coding style.
> 
> No functional changes.
> 
> Signed-off-by: Shreyas Ravi <shreyasravi320@gmail.com>
> ---
> Changes in v4:
> - Fix merge conflicts (forgot to do in v3)
> 
> Changes in v3:
> - Added changelog (was missing in v2)
> 
> Changes in v2:
> - Split original patch into two patches per Greg's feedback
> - This patch addresses Hungarian prefix removal
> ---
>  drivers/staging/sm750fb/sm750.c       | 22 ++++++------
>  drivers/staging/sm750fb/sm750.h       |  6 ++--
>  drivers/staging/sm750fb/sm750_accel.c | 48 +++++++++++++--------------
>  drivers/staging/sm750fb/sm750_accel.h |  2 +-
>  drivers/staging/sm750fb/sm750_hw.c    | 20 +++++------
>  5 files changed, 49 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 1ed7ff57c142..afcfc9e6c207 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -624,27 +624,27 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
>  		output->paths = sm750_pnc;
>  		crtc->channel = sm750_primary;
>  		crtc->o_screen = 0;
> -		crtc->v_screen = sm750_dev->p_v_mem;
> +		crtc->v_screen = sm750_dev->v_mem;

You are fixing up your patch 1 of this series, why not just do it
properly the first time?

thanks,

greg k-h

