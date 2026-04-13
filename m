Return-Path: <linux-fbdev+bounces-6934-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JYbICiH3GnJSQkAu9opvQ
	(envelope-from <linux-fbdev+bounces-6934-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Apr 2026 08:03:20 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F73E79F2
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Apr 2026 08:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A2463004425
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Apr 2026 06:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80F939151A;
	Mon, 13 Apr 2026 06:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HM2+d5KG"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E503563C4;
	Mon, 13 Apr 2026 06:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776060191; cv=none; b=uCWg09altIVmY+DtwnYwd75aJtR+MWw1CaPl7gqQar5gi22hIXtg2S892kLVyjYlrrP8HxYNznbTGD3wfenn+W5HFG18spHHiTbqHeeM8j6KFLlQJcj3eam7C8ypXKJZ15XEvaUwfsNoe/uA789quYoKRRToyNWfLoWsna12Mfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776060191; c=relaxed/simple;
	bh=+DPhsLBBr6AVydYKg13IxgF99bqlwElolEyMA8nzvkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9TROTV+2i5UY64+uvH/zw0BymXEQEmfqxeKMC69HLBdPMmVi3a051dKkgUSTELlW8wICzYt+k1rx7LaysdfIfjST+kwl+gbQoOUGFUFrjOMkry7ruFDUmtfJTKD0zpLigkhB4/UZGgj81ngdq8qOcYWJ+ObADm0NOCODqJddwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HM2+d5KG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41F8C116C6;
	Mon, 13 Apr 2026 06:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776060191;
	bh=+DPhsLBBr6AVydYKg13IxgF99bqlwElolEyMA8nzvkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HM2+d5KGugbLjCNpBQ/HCi/7c+Shj1UmJV/P4QoiDPXZPjTAhPkSQMkPjunxmSz4c
	 sSGTsgm7CBOcLusRB/rIgcJq3dnQr3UUlQm5peqZRXdoGqybDCnpXVz5WMoAR4BcIP
	 dAy12TR7iNoxtKomBxJWg/KFMbDnf7W/gEoirq0o=
Date: Mon, 13 Apr 2026 08:03:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Baker <mzndmzn@gmail.com>, andy@kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: fbtft: replace empty macro args with
 identity converter
Message-ID: <2026041338-guiding-concur-3831@gregkh>
References: <20260412173317.3329-1-mzndmzn@gmail.com>
 <20260412173317.3329-2-mzndmzn@gmail.com>
 <CAHp75VcdWMvvM-oKTqRACSXSUiVsEh1Ep_82MsJxfbrG4thUdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcdWMvvM-oKTqRACSXSUiVsEh1Ep_82MsJxfbrG4thUdA@mail.gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6934-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D84F73E79F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 08:58:50AM +0300, Andy Shevchenko wrote:
> On Sun, Apr 12, 2026 at 8:33 PM Baker <mzndmzn@gmail.com> wrote:
> >
> > The define_fbtft_write_reg macro calls 'modifier' as a function.
> > Passing an empty token as modifier is undefined behavior in C for
> > fixed-arity macros. Introduce fbtft_no_conv() as an identity
> > function to replace the empty args in the no-conversion cases.
> 
> This trick is used in the kernel (usually for u8). If you really want
> to improve, use _Generic() instead.

No, sorry, this code is fine as-is.

greg k-h

