Return-Path: <linux-fbdev+bounces-7385-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHowF9/LFWqQbgcAu9opvQ
	(envelope-from <linux-fbdev+bounces-7385-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 26 May 2026 18:35:43 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DFE5D9C78
	for <lists+linux-fbdev@lfdr.de>; Tue, 26 May 2026 18:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD2923005145
	for <lists+linux-fbdev@lfdr.de>; Tue, 26 May 2026 16:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2553B2FD4;
	Tue, 26 May 2026 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xEvkgsxB"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBC43AE704;
	Tue, 26 May 2026 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812511; cv=none; b=qx00vq9pECUxVdzbp3lMoZ8b8px6Af9z55FjRZW1jYL3kzkmyaq7DHTaxN/hf+4JiX2lkGGHJhOQ2mnPYJRZ8p+eGLmU3izRXNEKqBj3OXpVnIwviD60GvHlfnQDk3F8F/JJoboIAgNkc+EMA8Iwivcv/MVEaR7EO0QUJ6QvrfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812511; c=relaxed/simple;
	bh=Vn1QNejWOmdwHf1YX/e1RHPQ6d7CJkarXW6LJSwW6I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noRrCGdSc6TSgwqNvHkmsEas3uaEDcn8AXj8MfqWE9jBAt5GkiBpuueqg2+j25zwj/PEpzLTk0Dfo7vzjHcCasHVF6cFr+Y5ZoXKApGIwt4Q4O8CLW/v4vYamxsbOC8npmnyqPWpOei5XrzIdjija2idguJnZN+GUrrSOT3FG6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xEvkgsxB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B3F1F000E9;
	Tue, 26 May 2026 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779812510;
	bh=xwRSJlscEwLalAgr5GspEYDs8S8ptrjiKAWpnKJuDDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xEvkgsxBONIpHNP9YiscNZXqEu7VMDhPYzjoPAyuJOjkqcNk63KZg8ZIwBzlMJQjE
	 /l1hwtVw+SX1CZQpFeR0az8GONGf7vX4AjMfgHIKdKY2g08XmNTj0tHcFZmGu4+Axe
	 CmUoeDHYq/qJlpHAkjvLtpNa+evDHgqGpffu3NFU=
Date: Tue, 26 May 2026 18:20:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Emmanuel Arias <eamanu@riseup.net>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] staging: sm750fb: fix CamelCase variables name in
 sm750
Message-ID: <2026052623-cause-region-02e3@gregkh>
References: <20260526131631.1237672-1-eamanu@riseup.net>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526131631.1237672-1-eamanu@riseup.net>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7385-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,riseup.net:email,linuxfoundation.org:dkim,intel.com:email]
X-Rspamd-Queue-Id: B6DFE5D9C78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 10:16:31AM -0300, Emmanuel Arias wrote:
> Replace CamelCase variable name with snake_case:
> - pvReg -> pv_reg

Why are you keeping the "pv_"?  What does that mean?

> - setAllEngOff -> set_all_eng_off
> 
> Reported-by: kernel test robot <lkp@intel.com>

The test robot told you to make this change?

> Closes: https://lore.kernel.org/oe-kbuild-all/202605171049.KbaBnrJV-lkp@intel.com/
> Signed-off-by: Emmanuel Arias <eamanu@riseup.net>
> ---
>  drivers/staging/sm750fb/sm750.c    |  6 +++---
>  drivers/staging/sm750fb/sm750.h    |  4 ++--
>  drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
>  3 files changed, 11 insertions(+), 11 deletions(-)

What changed from v1?

thanks,

greg k-h

