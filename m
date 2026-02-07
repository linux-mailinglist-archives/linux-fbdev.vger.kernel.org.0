Return-Path: <linux-fbdev+bounces-6119-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOCJL/k+h2nVVQQAu9opvQ
	(envelope-from <linux-fbdev+bounces-6119-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 07 Feb 2026 14:32:41 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54765105FB9
	for <lists+linux-fbdev@lfdr.de>; Sat, 07 Feb 2026 14:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0727830120D6
	for <lists+linux-fbdev@lfdr.de>; Sat,  7 Feb 2026 13:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C300A3321BD;
	Sat,  7 Feb 2026 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XXIUVZFX"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00051F0991;
	Sat,  7 Feb 2026 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471157; cv=none; b=sKtw91MxfqFLrYNkM2UVD4dl/312K5pqyTnhubxXLu28i30o5KxsJMdeWdrVoxFZltVK8ZZN7KA8j7XcvhIXA5uOKt/NJ3zfwUhoSbR11lU6T4F7yn2kALM6O3t6twIMYdUUsOhXoZE8o+iXBtoFRifFDfRUXisgRMEdv3yfoUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471157; c=relaxed/simple;
	bh=EAg8D00kBWJwwhcePvUExFWJ6jNPYpUJKsPgCJHrAkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3aOD/XeIuYgdImXMyx7+hb9TXBW9wsTy0uMm7SlowFmRjDSjQskbgR/MXSqngMa2QhtjUc96seNH9qRL7FH49N+03HVm6+Vz1UfNFXr5YHt1s4DLd2ldF4bs9cdpTW+6r7pgvBsNWFZQ++YZ2dpu2kXNPyq0cVSdUC3KmAXLhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XXIUVZFX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978D2C116D0;
	Sat,  7 Feb 2026 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770471157;
	bh=EAg8D00kBWJwwhcePvUExFWJ6jNPYpUJKsPgCJHrAkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXIUVZFXVXAizSJ8Bsm4YXoFVAmSiZ0dUtYdoBb/oKWJFK6Vo3cr9ykew5oEALPDD
	 UqVGUUttBy/lICM3pDL4MmGeXHkFTdA97TLn7UR3Kjk/9TZgsARKADhVhoYCzZB+8L
	 VmNuqBc2+ZjNHH58jX5+bEEWnMLmQhtpUmOgMNvQ=
Date: Sat, 7 Feb 2026 14:32:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] staging: sm750fb: remove debug and diagnostic
 prints
Message-ID: <2026020701-radar-onward-20a4@gregkh>
References: <20260204120602.6715-1-iprintercanon@gmail.com>
 <20260204120602.6715-3-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204120602.6715-3-iprintercanon@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6119-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 54765105FB9
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 12:06:00PM +0000, Artem Lytkin wrote:
> @@ -811,11 +802,8 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
>  				g_fbmode[index],
>  				mdb_desc[i]);
>  			break;
> -		} else if (ret == 3) {
> -			pr_warn("wanna use default mode\n");
> -			/*break;*/
> -		} else if (ret == 4) {
> -			pr_warn("fall back to any valid mode\n");
> +		} else if (ret == 3 || ret == 4) {
> +			continue;
>  		} else {
>  			pr_warn("ret = %d,fb_find_mode failed,with %s\n",
>  				ret,

Why delete some of these but not all?  Why delete any of them?

Consistancy matters :)

thanks,

greg k-h

