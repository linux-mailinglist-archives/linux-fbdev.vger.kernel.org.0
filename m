Return-Path: <linux-fbdev+bounces-7723-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wzKIBNACPWoKvwgAu9opvQ
	(envelope-from <linux-fbdev+bounces-7723-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 12:28:32 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 797DF6C4AAC
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 12:28:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YTz9DecS;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7723-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7723-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 468D7301C957
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 10:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A64D3D1707;
	Thu, 25 Jun 2026 10:28:27 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C43358399
	for <linux-fbdev@vger.kernel.org>; Thu, 25 Jun 2026 10:28:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782383307; cv=none; b=BP5Ebf5K00ju4m3fUgTq0JUyXmFeiXWvkl0sQxAur9ikQQdZFzS4dA33vazo9hJrzLojiUBCVM+pemZlrKyVc1G+xdwsf3FJk+W7xVOGo9YL/ztdqdiRO+7lSd6tSVCdcLA7jXYrOlCukkXpqejkolUtZg+LWlUAozfW2UbpSzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782383307; c=relaxed/simple;
	bh=HYgZXJzpaPo1lhmxJlKVYQ6TqGUOOhocJO1WrPJL9a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ot+P91RToDdn/TRW2a60Zh0/tu5eC3CHATydDQmZIKyuf27ppMcfNcBqNbr1lkkgK4Nc04MIYUQdHceOmoY8fPLWpJPVh2LY8//3SnsHAWW3GvRtq14rkLElhZIhmgJbNbhmKaCN8KiU9niGAbXwi98ZgnWphFTCkT5vcErH/8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTz9DecS; arc=none smtp.client-ip=209.85.167.179
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-48633190849so845425b6e.3
        for <linux-fbdev@vger.kernel.org>; Thu, 25 Jun 2026 03:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782383305; x=1782988105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=otpXdjNkhvgaZ3XJWWSziZvKCi33swAVBBkTmAhDpkc=;
        b=YTz9DecSdDCmLiiQKWD+9jNeeIbDEqS5IpaRiSq/DmGT/qgZ7bm6b17iF45+/86BMk
         8GTeFLzMI/fmu+Oh1iL8s4YhDB5hOdlFivMCmCAm064fm2D635ejTGpYg3lB8IENa7s4
         fvNnlpvCtc0TR8b60ovzrZKXBCJ12g2In1CLMJSGWjDtd6/X41G6KEI7EkUqKEWyxLPc
         ngLICmPpnXvoVN3OTKlk3siSLVHjtV3fJG6g5XhJ8+93kyImY/rUvwA8oyaCPh4cUuGs
         fBcHp+KtLEd9OyIQF9IPqQO7OwZbELr6O44BMiXzqTkb08OEISvMrj3gbppALq6VGTth
         am4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782383305; x=1782988105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otpXdjNkhvgaZ3XJWWSziZvKCi33swAVBBkTmAhDpkc=;
        b=s+FEKjFxIFYnMM9jv6Cji5qhjaGczCk8MGEgYuHUvis8Q2/xYISxcIDdAN5jq38CGo
         rSubBQvdmUEOfZEMxplPXnx3gxRV3Dz8dJEsd1wUkg2javtivuGsAkWyRt4LdEwEcwsl
         3DcYcgAca7+t2Cs38YP+xxcpb56SJk/j6xmyQoEysTI30IT0vVgN5zVIb56v8XmrWGRz
         rvspIkAvKUJDfwf4xWCntfvyQLTGwPCnqJeresGIimCQpnE2kZglaZJ9uu2yzbJlwAWq
         hYcBwEtzmF1eK163x0Tu3vdBwgGEjqslCfkqfojYpu7bu/nr6P//0IMs2593dfuAKJBP
         BX/g==
X-Forwarded-Encrypted: i=1; AFNElJ+n9bOlDQ+75ChI8gENAhoyHBG8kBT1pm+yqaexhjgJEja63b3LtznO2eC3zYDPpeFGBvhVWab/EdqMgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz0fq6NR/Ul/PVHWhUf5RAja02vgKTCA9zGdNvJ4eGYSLVX+26
	qRRlKibuV1IYQuUOC1BvS/gws6zuyOIiCVGrx1f3BRVfjHlVCh2+v6At
X-Gm-Gg: AfdE7ckscnht46HgXXKavE7b+b32o8ExbN+JtIoCKLIH7QlPCqmk/L6jDbmw07j7GsP
	PPCy1Wys19eILVEHampqOTQVDvCQmfB9Oy1R3XFPcNdbMxEy8DlhJJgCF27GrN+iwoeWi4urwHd
	Bf7HYUbfX9/GlO64TiDfqywz49soXAMd/Z5QL+KFp2uVbwr/BQSGGsJT8o/pkEnJoKnZkH92S9G
	9dIhsDbroxGOhny+BGGltVUwJTY2vBECJifZ2+JNT3fzvY1EUPTPIv9Cz/r1QxV/D5UANMJXg2a
	jdZ+im0B1hkD7OSdAOMkbTM+M561UIod3F1CK71F8svQY2oUVizIS59+i4CJL3llOVYeRwO4NnA
	KvUBmRUizQQsFhvPUDwx/d1BlZ74Uhcc1xjNp7z22QYwpXVWzj6mrs2U+y/Nk62qShcwDEWEieD
	g1s9XT
X-Received: by 2002:a05:6808:6718:b0:490:b586:1459 with SMTP id 5614622812f47-4921573deccmr1924568b6e.2.1782383304720;
        Thu, 25 Jun 2026 03:28:24 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aebb9f1e4sm10496756b6e.1.2026.06.25.03.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:28:22 -0700 (PDT)
Date: Thu, 25 Jun 2026 13:28:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: suryasaimadhu <suryasaimadhu369@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: replace empty modifier argument with
 no-op macro
Message-ID: <aj0Cv0Wzb3rieNqW@stanley.mountain>
References: <20260625092721.238366-1-suryasaimadhu369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625092721.238366-1-suryasaimadhu369@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7723-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suryasaimadhu369@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 797DF6C4AAC

On Thu, Jun 25, 2026 at 05:27:21PM +0800, suryasaimadhu wrote:
> Define fbtft_write_reg_no_modifier() as an identity function and
> use it in place of empty modifier arguments in define_fbtft_write_reg()
> calls to fix checkpatch errors.
> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> ---

I don't hate this patch, but I think we've decided to leave this
as-is.

regards,
dan carpenter


