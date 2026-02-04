Return-Path: <linux-fbdev+bounces-6071-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAvSAg5sg2l+mgMAu9opvQ
	(envelope-from <linux-fbdev+bounces-6071-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Feb 2026 16:55:58 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B39BE99D6
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Feb 2026 16:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 453D83008524
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Feb 2026 15:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34396421EE2;
	Wed,  4 Feb 2026 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OMj4Dl5F"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D94421A16;
	Wed,  4 Feb 2026 15:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770220461; cv=none; b=neVk35USwKsTpFqYzCE6I3nowJ/D0KlaKLt4RxHTof/TTDKbioqaDNPzxLQGeWtWLd4xPBpVnu0c3lPQJS3j+LdQHav0z9MezdeZ0KCnloAy++5/RLHjfIb9Jk8kz5ZhZRrHhOEXJss977auYuZm7cAHY/SLdxLDjXUjZkshDTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770220461; c=relaxed/simple;
	bh=RSORJ03ne4P+AXQgsb8E2FO6orKfDo+ustVJgXpZ7+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blNtMRmWibM+FGxreYfaCTQNhB7E+c0zTERRq4vxNt9PHyGNVulwpq4Vdeax/cN+L5VELhjPkh9y8JUQ1yScAvl+uUy7ez9fFKUys8jwwJdJYT8/PWbhevSuR7xbd+Un9WDvr8/i154EAEKTsOyMdg+caiGpaY9z8qxFgSV+BGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OMj4Dl5F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371C8C19423;
	Wed,  4 Feb 2026 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770220460;
	bh=RSORJ03ne4P+AXQgsb8E2FO6orKfDo+ustVJgXpZ7+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMj4Dl5FLduGGkbiXRA0GeeiD5moSjai0zPSDfAcAyMaTXsmx5vaPBi11IBLr+HX6
	 TmTIvOT+QsmKqRekKAaCDdNmsKNw7QDD4J6guvsgHlFKAizmt3NtMLTjmydziubYrQ
	 7kyuHEKwUUZ8B16HFP9LSfolLsHM9AT0I8XcqaK8=
Date: Wed, 4 Feb 2026 16:54:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sarah Schwartz <sarah.schwartz025@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix CamelCase warning for dBase
Message-ID: <2026020450-shindig-starry-32fc@gregkh>
References: <20260204153856.23277-1-sarah.schwartz025@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204153856.23277-1-sarah.schwartz025@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6071-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,checkpath.pl:url]
X-Rspamd-Queue-Id: 5B39BE99D6
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 03:38:56PM +0000, Sarah Schwartz wrote:
> Rename variable dBase to d_base to fix a CamelCase warning reported by checkpath.pl
> This aligns the code with the Linux kernel coding style.
> 
> Signed-off-by: Sarah Schwartz <sarah.schwartz025@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750_accel.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
> index 046b9282b..c77b0fe3b 100644
> --- a/drivers/staging/sm750fb/sm750_accel.c
> +++ b/drivers/staging/sm750fb/sm750_accel.c
> @@ -136,7 +136,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
>   * @sPitch: Pitch value of source surface in BYTE
>   * @sx: Starting x coordinate of source surface
>   * @sy: Starting y coordinate of source surface
> - * @dBase: Address of destination: offset in frame buffer
> + * @d_base: Address of destination: offset in frame buffer

what does the "d_" stand for here?

Should that be dest_base instead?

>   * @dPitch: Pitch value of destination surface in BYTE

Why ignore all of these other variables as well?

thanks,

greg k-h

