Return-Path: <linux-fbdev+bounces-6476-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F8gFMwKqGn2nQAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6476-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Mar 2026 11:34:52 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9321FE6B4
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Mar 2026 11:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB3D730460AE
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Mar 2026 10:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C633A2577;
	Wed,  4 Mar 2026 10:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vsbjk/s+"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C353A256A;
	Wed,  4 Mar 2026 10:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772620370; cv=none; b=YUhTEXXAEr/EVwFeMTsrmwZUXDSIj++IHnfyfRoZtohztYhSmGrh48gV7cAhO7d2kQZYD4q7esxGzSEExmJeb0pQIxe1ao3eO6E/K3YFLSKIaPdeJhBXblgqOIIuVB5wpkkQwTJ2BeD6UrzP6oQX8p2H/7fWCE5uOEbUwV0JJrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772620370; c=relaxed/simple;
	bh=UB+4PkkGvhz2iDiXVKREEcSdY5tXHvNXoqqN/bi40Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5mrVFbDoMYxGFpjAkOaQcmdLO9ZZ8a6rhISsq/yhZd/kfwCA4L3R1spJii5cvwxez8Q2mTa4M92pTLSDlLIo+LYcTgLRoWiW/7180aXShUgaendd8Hzw7yd4Mefj2wcc0TuyXLBBkp6U+XR9Bz0NhAppa5iX1Bok5WEi6cU3QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vsbjk/s+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F72C19423;
	Wed,  4 Mar 2026 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772620370;
	bh=UB+4PkkGvhz2iDiXVKREEcSdY5tXHvNXoqqN/bi40Yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vsbjk/s+JfirtXrENVkG7fZSQicqPrbhPjQgwCFwnfJh5/aPf1HNavZyKR4V2dAaF
	 naYnFHs5ujiZQ55gmDZOmv4k72RhMa97vGOEUf8cgGWLu5VcYn9lQ0HQ33IO46c7Mb
	 ompJB+IY5W4041Wh4YoonklxTYsJxqIYzlpTSCB7bzdhw5unDRN5tri8Hx4kPiPqFr
	 vMvzwZvU6i37taVVrQ54hWn7OIlfmI0iu5VzuAXuQTGRcmYBOFNZ9YFExbos6mo+KC
	 08jS9LRmgz4/nbAS5geecEf75UsAYsNec0pzngo1OfLm4fG1zxBxe5M4k1uIqFq3Be
	 nWtkR/+lXZ6iA==
Date: Wed, 4 Mar 2026 10:32:45 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: daniel@riscstar.com, deller@gmx.de, dri-devel@lists.freedesktop.org,
	jingoohan1@gmail.com, lee@kernel.org, linusw@kernel.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: sky81452-backlight: Check return value of
 devm_gpiod_get_optional() in sky81452_bl_parse_dt()
Message-ID: <aagKTbpLjTAymqiY@aspen.lan>
References: <aYB0cRwmiIb0vVnq@aspen.lan>
 <20260203021625.578678-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203021625.578678-1-nichen@iscas.ac.cn>
X-Rspamd-Queue-Id: BD9321FE6B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6476-lists,linux-fbdev=lfdr.de];
	FREEMAIL_CC(0.00)[riscstar.com,gmx.de,lists.freedesktop.org,gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielt@kernel.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iscas.ac.cn:email,aspen.lan:mid]
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:16:25AM +0800, Chen Ni wrote:
> The devm_gpiod_get_optional() function may return an ERR_PTR in case of
> genuine GPIO acquisition errors, not just NULL which indicates the
> legitimate absence of an optional GPIO.
>
> Add an IS_ERR() check after the call in sky81452_bl_parse_dt(). On
> error, return the error code to ensure proper failure handling rather
> than proceeding with invalid pointers.
>
> Fixes: e1915eec54a6 ("backlight: sky81452: Convert to GPIO descriptors")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

