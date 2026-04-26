Return-Path: <linux-fbdev+bounces-7094-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGZYI2Xd7mlhywAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7094-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2026 05:52:05 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D0846CA02
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2026 05:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39F8330242B0
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2026 03:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFEA38B7AA;
	Mon, 27 Apr 2026 03:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c3d6Pbue"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4A2386C12;
	Mon, 27 Apr 2026 03:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261837; cv=none; b=h2QyA9FI8qT1RsYdNQWt3Lxl8Qmcs/CmJ5k/dVwUVR3dux7bxVCHM+R5SwyVnOv8jJeVcJa3aiS4HepGrLH8aAgnbjuCWiEEBUvOwceo3qxCxF0TEkBStgc3fdcWnEZzMtzs4EEiLVtFW4ZgUqa/MqHP5KEf6uX/opj+9WNBu1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261837; c=relaxed/simple;
	bh=OsTqdrCpvuRt+s8mRGNxqscUnV+Sj8U770iBk/KIUY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dp8rgdPdbJbK/HKFkKIIZuq+nmUNS4PpMbuVn9r3MXL6Ft8ZWSUekAJyUi+Hyg/Wu8l6TshnT9ko5bICTVO23/RIU/kjYmqBzGrDsBDjYPwk2Ij2mcIXju3tMqW48v109u8m7bIhCiTLfqBpMZV+Tl3y8d6Z7LPj+TWuJqBxbCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c3d6Pbue; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106E0C19425;
	Mon, 27 Apr 2026 03:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261835;
	bh=OsTqdrCpvuRt+s8mRGNxqscUnV+Sj8U770iBk/KIUY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3d6Pbuevqje1jWXOD8d5lmhKF4IEv2/3QGbrB/3mqgDZU1IyFyw9WBuJmKXsXmYh
	 JDWd++NiwvAomyC5gX65Sllmh7WhuOpYx4dLH3Y1pR7i1P3GWZQPigaKQWqaoUA7iD
	 P2Ttv/gDMcE4n1AVy7LlBbtg7ygwlygx6KVl5nYg=
Date: Sun, 26 Apr 2026 21:08:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: sm750fb: return -ETIMEDOUT on timeout in
 de_wait functions
Message-ID: <2026042644-deafening-unwelcome-ca90@gregkh>
References: <20260409155821.23375-1-dennylin0707@gmail.com>
 <20260409155821.23375-2-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409155821.23375-2-dennylin0707@gmail.com>
X-Rspamd-Queue-Id: 09D0846CA02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7094-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]

On Thu, Apr 09, 2026 at 03:58:20PM +0000, Hungyu Lin wrote:
> The hw_sm750le_de_wait() and hw_sm750_de_wait() functions return -1
> when a timeout occurs. Replace these with -ETIMEDOUT to use a proper
> errno value and better describe the error condition.
> 
> All callers check the return value as non-zero, so this change does
> not alter existing behavior.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750_hw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
> index a2798d428663..3809401baa3a 100644
> --- a/drivers/staging/sm750fb/sm750_hw.c
> +++ b/drivers/staging/sm750fb/sm750_hw.c
> @@ -502,7 +502,7 @@ int hw_sm750le_de_wait(void)
>  			return 0;
>  	}
>  	/* timeout error */
> -	return -1;
> +	return -ETIMEDOUT;
>  }
>  
>  int hw_sm750_de_wait(void)
> @@ -520,7 +520,7 @@ int hw_sm750_de_wait(void)
>  			return 0;
>  	}
>  	/* timeout error */
> -	return -1;
> +	return -ETIMEDOUT;

The comment should be removed at the same time, now that the code itself
documents it properly, right?

thanks,

greg k-h

