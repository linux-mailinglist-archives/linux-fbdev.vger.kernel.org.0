Return-Path: <linux-fbdev+bounces-6311-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB1fI2phnGkoFgQAu9opvQ
	(envelope-from <linux-fbdev+bounces-6311-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Feb 2026 15:17:14 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 161AB177E78
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Feb 2026 15:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7618306F034
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Feb 2026 14:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E9A285418;
	Mon, 23 Feb 2026 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rzf4+wxj"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA78281358;
	Mon, 23 Feb 2026 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856084; cv=none; b=hBrxYRfOeyLWMoUstBHbFaGbHI/fpnKLCmJDEVi7onABZSFigU8/oP7EJNsac5ydoQQ0gCQ6LCw3zP4nvkO+3NDeShmv1Iqeezfhc0g6FhEIq2uQmATDghKr15KaecEEf1Nae0kP4Gnxt0XiSl/pj7LkXOr7GtNghV9hUWUoFYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856084; c=relaxed/simple;
	bh=3v/77CpdrBjE+r4wzjNYsTklTWpMCUbqXxRGW69H+eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNvn2blkie0vHwn0rBq7Ec6uHUamwjKGNJ0nu9aBCwesSCk+P+tLmmHt7hChG2YL7OhE2x6UijctMfmLSWrhs2/3CLMxxUE1T2Qj0TS0jPioKlifGGHDycq6pBFUC4GYyYpVfHoLriEnQ8upkkf6GAc4DSUcnfrL4VyGeilG3To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rzf4+wxj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3110DC116C6;
	Mon, 23 Feb 2026 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771856084;
	bh=3v/77CpdrBjE+r4wzjNYsTklTWpMCUbqXxRGW69H+eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rzf4+wxjrdHNNO3QYS8OX1ZhRjwvghK6OTOk2wIgBhXZg7sGEeZWkqHE+DP1ocCJy
	 mUhZX5ezqojFpXk+FqQNE5Kyi4k2ET8T4JdfV9mCUNLZ8k9a8KpOYpDnUC5UTRQcJY
	 Ga3nFbArJTh1SJ2Oc0NYG6kZQEG4zJlH7NB/q66k=
Date: Mon, 23 Feb 2026 15:12:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Shreyas Ravi <shreyasravi320@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] staging: sm750fb: Fix CamelCase variable names
Message-ID: <2026022324-bounce-foe-83f5@gregkh>
References: <2026020842-litigator-flatworm-65d0@gregkh>
 <20260208184344.657617-1-shreyasravi320@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208184344.657617-1-shreyasravi320@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6311-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 161AB177E78
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 10:43:43AM -0800, Shreyas Ravi wrote:
> Rename CamelCase variable names to snake_case to comply
> with kernel coding style.

You are changing different structures at the same time.  Do it one
structure at a time please.

thanks,

greg k-h

