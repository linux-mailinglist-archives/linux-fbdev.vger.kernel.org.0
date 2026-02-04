Return-Path: <linux-fbdev+bounces-6065-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFAtIo1Gg2nqkgMAu9opvQ
	(envelope-from <linux-fbdev+bounces-6065-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Feb 2026 14:15:57 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A6BE647B
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Feb 2026 14:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3DBE3014104
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Feb 2026 13:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B73407567;
	Wed,  4 Feb 2026 13:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XjkIEEYz"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F148919B5A3;
	Wed,  4 Feb 2026 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210869; cv=none; b=ZVQDA9wMBmktIXkZiNp6O/6wEVi1PAQyO1csPO+xV3VaDU1IlgorG5c9VKMWzlmEya0ZRsTmDDunxkfzgCDvaJjHgkKoXSLnGc/L1Q0AhhC1SutDUvFc3zgizya0uqbpacQkux/hbZDjWEFQAJXAZod0WG9kr+s4cr5i9n3jX9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210869; c=relaxed/simple;
	bh=ffcmAPQZo7uzBQT3kAXCcjTJAkFLQXZxnUkW8zdRS8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlRWj+3Vf0Buj8qAuWJjvB3eMJ3HAqwDABta1arAT0xTEvp0DmQihXsr1DVQD6LQc4ViqpwEpU4X8t6MI7lqlGztIrZxv9EwZNcVhCMJlPpHxpb1yqAEauscfDCbvv9T1LJVlkSgx97Y7cMKaGqLi/01A43jrQazs7p1pd5ZyUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XjkIEEYz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AEAC16AAE;
	Wed,  4 Feb 2026 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770210868;
	bh=ffcmAPQZo7uzBQT3kAXCcjTJAkFLQXZxnUkW8zdRS8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XjkIEEYz8SoeJow3y9gnoKu0HSNRkqDN4n3rDuLwyl3zuZsEF6CFFXkeCsp/LJ0Il
	 m+IIHEFjC1QKIxNtoF1L0igud4Hsp3Drjd5yDqFZNPh1iucCFzgh5E0cYskC7J1CWF
	 9j8TIGfSGc+lzS0iGM78f/I8Vee7KdafrtNdgnx4=
Date: Wed, 4 Feb 2026 14:14:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: remove unnecessary parentheses in
 ddk750_swi2c.c
Message-ID: <2026020416-talon-mousiness-1b08@gregkh>
References: <20260204125525.5498-1-zeeshanahmad022019@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204125525.5498-1-zeeshanahmad022019@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6065-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 06A6BE647B
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 05:55:25PM +0500, Zeeshan Ahmad wrote:
> Checkpatch reported "Unnecessary parentheses around 'clk_gpio > 31'"
> and 'data_gpio > 31'.
> 
> Remove the extra parentheses to clean up the code and satisfy the
> coding style guidelines.
> 
> Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
> index 0ef8d4ff2ef9..50e51d730d86 100644
> --- a/drivers/staging/sm750fb/ddk750_swi2c.c
> +++ b/drivers/staging/sm750fb/ddk750_swi2c.c
> @@ -393,7 +393,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
>  	 * Return 0 if the GPIO pins to be used is out of range. The
>  	 * range is only from [0..63]
>  	 */
> -	if ((clk_gpio > 31) || (data_gpio > 31))
> +	if (clk_gpio > 31 || data_gpio > 31)

Now I have to remember which is a higher priority in C, > or ||

Please don't make changes like this, I thought checkpatch turned these
off for staging code, as I keep complaining about it on a weekly (or
more than that) basis :(

If you look at the mailing list, I think I just complained about this a
few hours before you sent this change as well...

thanks,

greg k-h

