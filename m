Return-Path: <linux-fbdev+bounces-7336-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEByLOHeD2rQQwYAu9opvQ
	(envelope-from <linux-fbdev+bounces-7336-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 22 May 2026 06:43:13 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC3B5AEBD1
	for <lists+linux-fbdev@lfdr.de>; Fri, 22 May 2026 06:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 592DA3017BD0
	for <lists+linux-fbdev@lfdr.de>; Fri, 22 May 2026 04:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED7A258EFF;
	Fri, 22 May 2026 04:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a8iGxB2K"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401305FDA7;
	Fri, 22 May 2026 04:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779424991; cv=none; b=ma6F7pB/DVDCGLhlotZSJR2Q2oBYZOA/eDOns9qCJEfO6Iis7XF+0eDRslVMSYDSySCJ7gqgeLSc//1HG9Fr/euoNRil+KX9/bNNjTPr67WTtLAKiynptB2RKWspxgrQAxTrn9ZeDZxYIaZG96ZPTEu+GYna5cWa5ZHJEwOSoJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779424991; c=relaxed/simple;
	bh=YfFh5yk0v1xTpsGNMqRc30/ft6bjAwbrqGEt+rDGzVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpauPUC1+etLj/RQyGOKiLgUf+B6BlLPyx+0MTgzIryxiX31GnThOWsrFYoc4xXa63TXMjc3wro9Mv4D22rXg3WemuxElJHoKS2sg27JxtCsHinGyvmsAvSqNASZYmgVO79a6ni0o8Gg25Ba5RF431DsMsKNU19XiHTmUYLs4fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a8iGxB2K; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417941F00A3E;
	Fri, 22 May 2026 04:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779424989;
	bh=YfFh5yk0v1xTpsGNMqRc30/ft6bjAwbrqGEt+rDGzVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a8iGxB2KckWBC2HIOeH5LWglZ3LDomGLNTJEfSptLbrey5066HwO//Yc1o/eaaUeZ
	 f+HHBi++a1CNpDPN+LmRQglOJqnFSgzFv27cnKqMQ40UJr+gLjGr826vxBJKuznVu+
	 4WMUtxx4xo+Au01VYKjvCrxCWbftbbsgfPc5pLeo=
Date: Fri, 22 May 2026 06:43:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michail Tatas <michail.tatas@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: sm750fb: Change camelCase to snake_case
Message-ID: <2026052249-gargle-dimly-9e4c@gregkh>
References: <ag-XlRifxjqXF-Zx@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag-XlRifxjqXF-Zx@michalis-linux>
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
	TAGGED_FROM(0.00)[bounces-7336-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.764];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4DC3B5AEBD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 02:39:01AM +0300, Michail Tatas wrote:
> Change variable names from camelCase to snake_case
> as per the Linux Kernel standards.

Please do one-change-per-variable, as some of these are fine, but others
are obviously not.

thanks,

greg k-h

