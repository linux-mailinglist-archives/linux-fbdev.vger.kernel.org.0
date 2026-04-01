Return-Path: <linux-fbdev+bounces-6780-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK8SFUkGzWnhZQYAu9opvQ
	(envelope-from <linux-fbdev+bounces-6780-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 01 Apr 2026 13:49:29 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4379379CAE
	for <lists+linux-fbdev@lfdr.de>; Wed, 01 Apr 2026 13:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B93C630D1425
	for <lists+linux-fbdev@lfdr.de>; Wed,  1 Apr 2026 11:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF573F9F5B;
	Wed,  1 Apr 2026 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Sb1xM6xR"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103E13F9F35;
	Wed,  1 Apr 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043526; cv=none; b=oavL+iRPxBGWYkBUZp9INKdeChIj/ZN1/wlTpH835TIYHPyrbGSvLjPvlj2YIJCTpcuyBvjk9Rde2ybMCDag+kC25pGwwa6AKxt+ajTriVc5xRcBsUswiifEKqA+I8Ymso2lHGs3hw+fNX1HS/ndxjm3eR6NOprRo605IAdyQWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043526; c=relaxed/simple;
	bh=UJCTld0ReZV2oG3cLqc8ufkd/aPHZudph+Ul9oBWW2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APZWvG9smdmcoRK3NvVhJt7A2iFX9Uv5Kq1RjppCZ9cBAOlD0ApE0Adu9/B6abfnUz/VRzuD2Es7kKbcSTaUCrb2rYmUujw5c1/omfX2PG/PdnGIRsaDIcXfU0uPnRENPfYEUCxfXWd5JrZLALN3VsHcH1U//c3UeBSWeWWrql4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Sb1xM6xR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6812BC2BCB5;
	Wed,  1 Apr 2026 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775043525;
	bh=UJCTld0ReZV2oG3cLqc8ufkd/aPHZudph+Ul9oBWW2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sb1xM6xRESnatqSiIMM9tEFVkE9SD0K6WzcPk00mOCz1dfBVfuXU3LUPDL5Yp2nzx
	 tqQ2b+5pxLp4jSRIcj4/oZkjTNHvy1xZxbRTrhE2HTA4JEw1p8Y3OxWIGxQat52uI4
	 bBt8g1Tlrklf7tAuBzNziBQMKXTApjv4fHtex+nE=
Date: Wed, 1 Apr 2026 13:38:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: sm750fb: constify fix_id array
Message-ID: <2026040113-ramrod-array-3659@gregkh>
References: <20260401110333.2535-1-dennylin0707@gmail.com>
 <2026040134-stimulant-resisting-869b@gregkh>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040134-stimulant-resisting-869b@gregkh>
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
	TAGGED_FROM(0.00)[bounces-6780-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.560];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C4379379CAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 01:18:15PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Apr 01, 2026 at 11:03:33AM +0000, Hungyu Lin wrote:
> > Make the static fix_id array const-qualified so it can be placed
> > in read-only memory.
> > 
> > Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> > 
> > ---
> > Changes in v3:
> > - Drop g_fbmode change as it is modified at runtime.
> > - Resend as a new thread as requested.
> > ---
> >  drivers/staging/sm750fb/sm750.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> > index 9a42a08c8..f7b5b22f1 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -728,7 +728,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
> >  		lynx750_ext, NULL, vesa_modes,
> >  	};
> >  	int cdb[] = {ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE};
> > -	static const char *fix_id[2] = {
> > +	static const char * const fix_id[2] = {
> 
> Wait, is this really right?
> 
> You have a const char * array, and now you make the pointer to that
> const char * array const as well?  But that was static already, so what
> exactly just got moved to read only memory?  What does the compiler do
> differently here?  How was this tested?
> 
> I need a bit more "proof" that this change really is correct as the
> const * and * to const and static stuff here always is confusing.  There
> used to be some tool that would "unwind" this to figure it all out, but
> I can't find that at the moment...

Ah, found it:
	https://cdecl.org/

So:
	const char * fix_id[2]
is:
	declare fix_id as array 2 of pointer to const char

and:
	const char * const fix_id[2]
is:
	declare fix_id as array 2 of const pointer to const char

so I think that's right and your patch is ok?

But clarifiying what exactly got moved from where into where, would be
good to have done.  Please look at the output of the compiler for proof
of that and put that in the changelog text for the next version.

thanks,

greg k-h

