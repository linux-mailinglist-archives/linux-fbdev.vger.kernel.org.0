Return-Path: <linux-fbdev+bounces-6870-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDrfFWTF12mdSQgAu9opvQ
	(envelope-from <linux-fbdev+bounces-6870-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 09 Apr 2026 17:27:32 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCBB3CCA6A
	for <lists+linux-fbdev@lfdr.de>; Thu, 09 Apr 2026 17:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3448F304481B
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Apr 2026 15:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C2B3DCD81;
	Thu,  9 Apr 2026 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W0iiozom"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBEC3382DE;
	Thu,  9 Apr 2026 15:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748162; cv=none; b=Tm5QJA9xLMYK26UVrx5aQd+/INEH3a9x5iAZ2+d9QBdpgGwBm2eBPxnmn0x0WrxBT0quHESlxXM9yMNW/wWD1J9zcVVeAxGU47bayC+s7ZjOHZEmmpMkCemhNc97zdjkFuTthfSqfrjo041qb54P8GA+wlR8Ed+mY929XJY5k/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748162; c=relaxed/simple;
	bh=Qfd4LMweaa82Dua/kn5hPQzYB4CBR14BG52EZRVqRtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHykMka0TXiXoDsuJCCMF6c+ueHj2JCx4LwkGDblRpQc48LeV58msQnl6K0bofOwhtNTVukVAx/+6NWIeAbLoIlD8z8bR6T1UExUXB4RBUyfzToTQ8Lu3DV6cK5dSzrZrWjTqPO8PcViZeLWFQ9aQCuIBJRznOx+5s3W2/94Il4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W0iiozom; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDF0C4CEF7;
	Thu,  9 Apr 2026 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775748161;
	bh=Qfd4LMweaa82Dua/kn5hPQzYB4CBR14BG52EZRVqRtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0iiozomxy2gjMlONrx5TP91tl9rHaYfMP0zdCIsDF1KQ/P1F9HA3MSO/YEGMT3GC
	 X4XtQJwicb/baXAhqV18VB8RSYtYOeE0lebVe4UBC41Hcz1mo8YnXQwCfmP3TLuOEp
	 t5PuYtEhthK8LLttwzdEg0qgDorErCAQwyGyMGik=
Date: Thu, 9 Apr 2026 17:22:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Denny Lin <dennylin0707@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: sm750fb: propagate error codes from
 de_wait()
Message-ID: <2026040929-cartel-scariness-571c@gregkh>
References: <20260409144119.21500-1-dennylin0707@gmail.com>
 <20260409144119.21500-3-dennylin0707@gmail.com>
 <2026040931-robust-siamese-4e11@gregkh>
 <CAGEkeHd8p48H6U36VBFAAMffz_tW71jcb90POekDgG51JN4YUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGEkeHd8p48H6U36VBFAAMffz_tW71jcb90POekDgG51JN4YUA@mail.gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6870-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 9FCBB3CCA6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 08:15:36AM -0700, Denny Lin wrote:
> Hi Greg,
> 

Odd email style, try replying inline in the real email, not at the top
please :)

> > Why did you delete the comment?
> 
> The comment was removed as part of simplifying the code while
> changing the error handling to propagate the return value from
> de_wait(). I can restore or update it if needed.

Please keep it.

> > And when did de_wait() start returning correct values?
> 
> de_wait() starts returning a proper errno value in patch 1 of this
> series, where the timeout return value is changed from -1 to
> -ETIMEDOUT. This patch then propagates that error value.

Ah, that wasn't obvious, sorry.

thanks,

greg k-h

