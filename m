Return-Path: <linux-fbdev+bounces-7886-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E3t8HU4OTWpGuQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7886-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 16:33:50 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D79D471CAC0
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 16:33:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=MHjbv5Ph;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7886-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7886-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BF5F30D3A5D
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 14:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D9D4252B9;
	Tue,  7 Jul 2026 14:17:37 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AF63F4824;
	Tue,  7 Jul 2026 14:17:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433855; cv=none; b=nuH0qabSszVHVkpnjT2m54ZM9TWTdpr03C9tAxLLrNpkrbBJWppzFvSeBP6YnKIU+u4OMJrGxFHRk9VXCVZjhnYLWBuk3iJuCMIJrMkY8Fs3DEJCimEz4VOC5yyyhDrRQ5BXTsEiMP/ywh+JN8hRIN9cvHLCpKEXuNprKbxY5WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433855; c=relaxed/simple;
	bh=eajTuACd/4IgS5su39Ql1WyiKQbMRkIT0R0MD1NPBh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApQSBS94IP21KSv+9Jlsega4rXMF00GvQ577QpnuSJSlnXnBXHTCeSz8iMBE8UloLOSulzncEanqhvQqNUlRxyOqYc+1mZq2E+Pv6d/tXl6Zj0c3LZt6ie/bFNtii1gaTG7gVIYNu3IVsPLOmwyHhJJPi4pKKDZbsfLzVkvaTH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MHjbv5Ph; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E5D1F00A3D;
	Tue,  7 Jul 2026 14:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783433843;
	bh=Jm32KnLzXJKqXIkeeFi/CJ1wSCoIc/iBf+3ICTnzYYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MHjbv5PhULcWiA3+yqNuQL3c3LwEzOakR8EgQAj5JTpAj1nGA219NfhM5vcgr9k4Q
	 KG2vzT7K0DqifDRcgXn83s9GsNpLGiVVjnQT2XV7ZOWcfMOsc3mLQfwvH9jySdBtMK
	 z5ejGeI9PV3/nrhXmmFjjwZt7+nsqgm/0ugxvR2I=
Date: Tue, 7 Jul 2026 16:17:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: sm750fb: rename variables to comply with
 kernel style
Message-ID: <2026070751-user-kitten-e1a6@gregkh>
References: <2026070710-exact-unveiling-e321@gregkh>
 <20260707131529.38340-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707131529.38340-1-andrem.33333@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-7886-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:from_mime,linuxfoundation.org:dkim,gregkh:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D79D471CAC0

On Tue, Jul 07, 2026 at 10:15:28AM -0300, André Moreira wrote:
> Rename 'setAllEngOff' to 'set_all_eng_off' within the 'init_status'
> struct to avoid CamelCase and comply with the Linux kernel coding style.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>
> ---
> v4:
>   - Drop register renames 'pvReg' to 'regs' as they were merged via another upstream patch.
>   - Keep only the 'init_status' CamelCase cleanup.
> 
> drivers/staging/sm750fb/sm750.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
> index 0324778768cbc..3a1bd38ab347a 100644
> --- a/drivers/staging/sm750fb/sm750.h
> +++ b/drivers/staging/sm750fb/sm750.h
> @@ -39,6 +39,15 @@ enum sm750_path {
>  	sm750_pnc = 3,	/* panel and crt */
>  };
>  
> +struct init_status {
> +	ushort power_mode;
> +	/* below three clocks are in unit of MHZ*/
> +	ushort chip_clk;
> +	ushort mem_clk;
> +	ushort master_clk;
> +	ushort set_all_eng_off;
> +	ushort reset_memory;
> +};
>  

The description of this patch seems to have nothing to do with the diff
itself :(

Did something go wrong?


