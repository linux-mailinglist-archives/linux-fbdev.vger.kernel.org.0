Return-Path: <linux-fbdev+bounces-5972-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA63KwYkemmv2wEAu9opvQ
	(envelope-from <linux-fbdev+bounces-5972-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 15:58:14 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD8DA35FF
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 15:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A27C03003720
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 14:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB842741B6;
	Wed, 28 Jan 2026 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QWj/MGXn"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC0B23D2A3;
	Wed, 28 Jan 2026 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769611462; cv=none; b=u3WZ2Qknspa8IAXVNNigOb1tpRPtXAwx7d31Vwu1slWfflJcZhCqyapZKldr3ntneZ3CjKncxvN7zzAgQMDnIthx9Pd9GbyhtPYJ4+HZxJb9hb33iE3jQ1avv6sxYb1FRZE+1XDEv8S7/1Fvk9wRDxYpf0jHL8O8JcyYMi5mdzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769611462; c=relaxed/simple;
	bh=bvRmGgtr5iuQGtzc4Q+sLAUD5FrB7jwUNXgtISBM4Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMyhQxj7NWRmdFYeDT5HtaImc7Zg/siMX6ZTMUTShfwsVbl9+lAu449b/GN2AqJp8erv8jCPvxB+5g3mbB5hmgNLspOLSmT6ts/fAUXTMURoV3U8xHNzv9IimhXXTZXmYA3wYyVfridPG/v+yj/CCRUklAS6/JxAju/RGsV5sF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QWj/MGXn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EB4C116C6;
	Wed, 28 Jan 2026 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769611462;
	bh=bvRmGgtr5iuQGtzc4Q+sLAUD5FrB7jwUNXgtISBM4Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWj/MGXn6Lmjufoszr3Db5tjPmzgh/xBYq0ZxOrSB4a0mhfHPe0QRKJV8Kd1HdRf/
	 vKwH7NCD5nehq3uO3wsHVr4W/ptTny2WQhKYkCUppQjhH9e2q1sr34ZcP2XLzN6IeT
	 2d5GqSo7ydngi9Xm/TZAmtX4P9x3Wf79SoEmy9UI=
Date: Wed, 28 Jan 2026 15:44:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: ChanSoo Shin <csshin9928@gmail.com>
Cc: andy@kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] fbtft: Improve damage_range to mark only changed rows
 Instead of marking the entire display as dirty, calculate start_row and
 end_row based on off/len and mark only those rows. This improves performance
 for partial framebuffer updates.
Message-ID: <2026012806-stained-grunt-f26a@gregkh>
References: <20260128140844.949262-1-csshin9928@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128140844.949262-1-csshin9928@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.19 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	LONG_SUBJ(1.84)[246];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-5972-lists,linux-fbdev=lfdr.de];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 0BD8DA35FF
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 11:08:44PM +0900, ChanSoo Shin wrote:
> Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
> ---

Something went wrong with your subject line :(


