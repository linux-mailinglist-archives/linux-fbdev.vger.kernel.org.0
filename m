Return-Path: <linux-fbdev+bounces-7095-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Mv+EWvd7mm+ygAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7095-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2026 05:52:11 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4846CA09
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2026 05:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4EFC3025A48
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2026 03:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967B438F259;
	Mon, 27 Apr 2026 03:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bK+pyhEw"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBC536E469;
	Mon, 27 Apr 2026 03:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261837; cv=none; b=DVAOwvBdBPBAV8uphN6I/JA6YB/pOUaDy/QsxllqSFE3H0q4yrBd7dngVlq6hXgdaMeiUmBiSa2LXpJOTf70/Z7fTcttfJhj7wWl5+veNwGIWKjqYt3a/TrliE+6lfBaXrlXPkIgYRb4Uq5dcGBwpscCY5iM9IYySag/jk1L+HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261837; c=relaxed/simple;
	bh=fuL2tn2dxKn5nHJarpop+f4gboCe8AraHPKmpkr5vuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S13tnWqV7nQc13JrGIXz6cWmaIem/S2PlACuQi8bL+u3Y5Z/OPm56nCRqNYASvwCIjQPlkKeZF1vSd4EiTduGqOcTaexTT8NTj/PRAnZaqX/D2ZT5LOo2i7pDgMmA5vjCqTPTiZcko1uzvfHLJm3tHdwgYtbmf52xnKIuL+P3FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bK+pyhEw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19715C2BCB5;
	Mon, 27 Apr 2026 03:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261837;
	bh=fuL2tn2dxKn5nHJarpop+f4gboCe8AraHPKmpkr5vuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bK+pyhEwdXgBc2w1WO8U+HfRxW5BBDJ6GKbVNW8ILR5NRc4D72pqZZXfsY2MTKers
	 D2ve9um4KUva2ashmlcEYRk+sCu6o99zWd3Da6cdCUCaCn9ya+I6jEs2eTydQPmxWU
	 qQ7VjUd1D3Qn8eXmKccTI5VxQdLoR1fLXcwol3I8=
Date: Sun, 26 Apr 2026 21:10:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: sm750fb: Rename sm750_dev members to
 snake_case
Message-ID: <2026042602-audible-amber-3451@gregkh>
References: <20260407074805.14505-1-chakrabortyshubham66@gmail.com>
 <20260407074805.14505-4-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407074805.14505-4-chakrabortyshubham66@gmail.com>
X-Rspamd-Queue-Id: B1D4846CA09
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-7095-lists,linux-fbdev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]

On Tue, Apr 07, 2026 at 01:18:05PM +0530, Shubham Chakraborty wrote:
> diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
> index b683a82af349..3f6570fc8f08 100644
> --- a/drivers/staging/sm750fb/sm750.h
> +++ b/drivers/staging/sm750fb/sm750.h
> @@ -97,8 +97,8 @@ struct sm750_dev {
>  	unsigned long vidreg_start;
>  	__u32 vidmem_size;
>  	__u32 vidreg_size;
> -	void __iomem *pvReg;
> -	unsigned char __iomem *pvMem;
> +	void __iomem *pv_reg;
> +	unsigned char __iomem *pv_mem;

Why are you keeping the "pv" prefix?  As you know, that's an old-style
notation to try to say this is a pointer to a void, which obviously is
not the kernel coding style.

thanks,

greg k-h

