Return-Path: <linux-fbdev+bounces-7187-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKYULVauAWrXiAEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7187-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 May 2026 12:24:22 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5024050BD82
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 May 2026 12:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F1CD30037F2
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 May 2026 10:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9F23D6479;
	Mon, 11 May 2026 10:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KbbX4EKN"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E9E3D5662;
	Mon, 11 May 2026 10:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495027; cv=none; b=YrPetKknqrZniv8RvhgUmg9QPeDFFdqxdyItrLwSeqfzaI33+r/bbPSnVPCEA5XgtkOrIwoqFjhwSMOAq8J6/uFyuvWiehp3O+bwaiu7DSMHrKo3DyzS8mipMp9tt/eX9diyokTgZDsb55s9h/Eb+9szXsrC1m9OCdQATFwEHuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495027; c=relaxed/simple;
	bh=H4bh643ZAWg+KT4NrCi5QbTwqF52+LZQ8uy6drN/aNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DK+SygT3cDwHpiqR3Ut7DGsikUNCCP6jYhj31UOSy+ao9b8xK07HLsPKGPtMLLBiIFRyn7EXeuf8TDxWfoDb8P9VlnuhzlyrWwQyxUMxpEj52exj9y7ADMyPt3UfMHH/dnyNS45SgCYC+ecK6NDx4zlKtb9zvRXx4t9C+NXhebM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KbbX4EKN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C44EC2BCB0;
	Mon, 11 May 2026 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778495026;
	bh=H4bh643ZAWg+KT4NrCi5QbTwqF52+LZQ8uy6drN/aNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KbbX4EKNpOrC9UzMBd43Mn8KLbcaAKpFFfYwlYYo9w9+UMuEFFnSiLuqc9xSpvuLy
	 Pha9xPyyT9wA7XhH5UhqBHbYPlxV9ifhxDZT2VPTfhNDz3Yqjn05xOCDmf/P6gr3qL
	 6AR/Y7K6mMgvfiS7VOMoNBQZocLZ4mni3tv+L9Lc=
Date: Mon, 11 May 2026 12:23:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alone <yogeshdangal66@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Add const to g_fbmode array
Message-ID: <2026051159-oxidize-fraction-cea6@gregkh>
References: <20260509164057.71722-1-yogeshdangal66@gmail.com>
 <2026051100-mankind-disown-5cf3@gregkh>
 <CAF9nfaDEys+8bcnFRVWWoAvyrvPgXmENbASABG+4dBjMinaP5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF9nfaDEys+8bcnFRVWWoAvyrvPgXmENbASABG+4dBjMinaP5A@mail.gmail.com>
X-Rspamd-Queue-Id: 5024050BD82
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
	TAGGED_FROM(0.00)[bounces-7187-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 04:04:40PM +0545, Alone wrote:
> Thanks for the feedback. I verified the patch with:
> 
> make M=drivers/staging/sm750fb
> 
> and it builds successfully. I’ll make sure to compile-test patches before
> submission next time.

I don't think you actually built the file you modified.  Be sure the
correct config option is also enabled.  Try it yourself and see!

Also, please don't top-post or send html email, the mailing lists reject
that.

thanks,

greg k-h

