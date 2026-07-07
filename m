Return-Path: <linux-fbdev+bounces-7861-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cJAYBpjETGqspQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7861-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 11:19:20 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3A9719A59
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 11:19:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=sgs5GRzo;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7861-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7861-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9AAD304B185
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 09:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BD7392C2F;
	Tue,  7 Jul 2026 09:11:34 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52706390229;
	Tue,  7 Jul 2026 09:11:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415494; cv=none; b=JZ6cGoeMXlY95hvZtZSm6DpJ3JceLGALmNOBK2HIHaQyVYEAQXeLuqtqt3xUr7pxRGXPOrqaz4FijPABbMICVv5PTmWjGc8q2P1V540gmC4KfLvXfqR8EspCC4/+zPmlrQXDUi9TvDW3Zd7oR7DsQcTlPTSDQFqjpFRfUorkA9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415494; c=relaxed/simple;
	bh=q6QRrlmtPDSpiE2ZSnszpV7TJrXeqexn1Wr4WbJ6FHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKxEsW40g6+P855NKX+UUZD8kgRuXZXUxL9MOZwR8XQboFIf9/Ryj1DgwG4Crfkmhxx/YHWTGlzfwi0TW4UQG5x2Q/YOzuLolFIgExgXAj2spL/BTC+YjZstvtFX6z3Ybon8FKT0sHZfBxTXfu6ySKdN6hPXbO/F8jlN1AX2CJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sgs5GRzo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290731F000E9;
	Tue,  7 Jul 2026 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783415492;
	bh=wKkSJtuFmWOgT7B+qzyHht6dHGZjWtnBBwfPVn+a4uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sgs5GRzooulbS5YmnllK0uNG8G7A0/+/gquqdZVE6OR1nlxyMo8iyhcm7QhPTWXUk
	 IqVvDK3n4h91tyFX22hR893mndGQpAMhLNh35qsVmX47Df3K3WK2xpnFi+me7b7G+S
	 PVOokQn3Awde8QL4PxWud/XmIC4rQc8kXr/hUPAQ=
Date: Tue, 7 Jul 2026 11:11:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: rename variables to avoid CamelCase
Message-ID: <2026070710-exact-unveiling-e321@gregkh>
References: <20260623220614.29682-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260623220614.29682-1-andrem.33333@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrem.33333@gmail.com,m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andrem33333@gmail.com,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-7861-lists,linux-fbdev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:from_mime,linuxfoundation.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gregkh:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A3A9719A59

On Tue, Jun 23, 2026 at 07:06:14PM -0300, André Moreira wrote:
> Rename 'pvReg' to 'pv_reg' and 'setAllEngOff' to 'set_all_eng_off'
> throughout the driver to comply with the Linux kernel coding style.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c    |  6 +++---
>  drivers/staging/sm750fb/sm750.h    |  4 ++--
>  drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 89c811e0806c4..716a8935f58d1 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -743,7 +743,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
>  	 * must be set after crtc member initialized
>  	 */
>  	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
> -	crtc->cursor.mmio = sm750_dev->pvReg +
> +	crtc->cursor.mmio = sm750_dev->pv_reg +

This variable name is still in hungarian notation, which is not allowed
in kernel variable names.

thanks,

greg k-h

