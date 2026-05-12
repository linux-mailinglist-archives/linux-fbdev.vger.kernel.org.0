Return-Path: <linux-fbdev+bounces-7205-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDgyO0TGAmp7wQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7205-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 08:18:44 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B36CF51AD83
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 08:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1C543029146
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 06:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15583233F4;
	Tue, 12 May 2026 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vKeurG5b"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C6742B728;
	Tue, 12 May 2026 06:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566488; cv=none; b=NFtZyF9X2zWWCSZ2KJ8UsdtmivEQGXQQvWz44KoFzFWviMRJ/muEWDVrz7wsJ1VPr/hGGCzg+Wj4S9radsrch/GixCvB1mPFFRing1mV8+dU7ggDfZNr7V38HjNniOxkxln5/NRWpqqooN/6rFv9bNgRLCiZ+4zwwL0u/xodsns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566488; c=relaxed/simple;
	bh=cd1CqkS2Id3CsmjakAe2k0YJ3P9OsGuvQpUAAon0VYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5lCc0qDdIoK8z7wTx8fQGSMOliTj60NVLsDI9f1O/o8ZHvgLNo32uw8QmXzZTN/yPsv/GQhe6OGrrDNSGlx85461IYdPsFo+okcBlYXZOuy5L+9jfI+cn0K9GtoIZEJRAoyHgoTY8NaA0ZbXeheHXkH3qq2lmgWidsB8L1cLCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vKeurG5b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEC3C2BCB0;
	Tue, 12 May 2026 06:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778566487;
	bh=cd1CqkS2Id3CsmjakAe2k0YJ3P9OsGuvQpUAAon0VYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKeurG5b8KPsxXfEAodvbiXcIPopEo1YjjSNUiaQGiizFlQtZqkou8z0GivKSy1N1
	 OET/prZ0sfI/NzP+bmAy1MAojctXl/hUItlrZzJngGPRRioxNMkGls+t6PxPp8b08A
	 54rDE9j+8Tdzg1ekAabU3v7vadtkJtntOMk00Hps=
Date: Tue, 12 May 2026 08:13:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chhabilal Dangal <yogeshdangal66@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: sm750fb: remove unused
 <linux/platform_device.h> include
Message-ID: <2026051248-tuesday-reissue-b86b@gregkh>
References: <20260512061012.76252-1-yogeshdangal66@gmail.com>
 <20260512061012.76252-2-yogeshdangal66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512061012.76252-2-yogeshdangal66@gmail.com>
X-Rspamd-Queue-Id: B36CF51AD83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7205-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 11:55:12AM +0545, Chhabilal Dangal wrote:
> sm750_accel.c and sm750_cursor.c include <linux/platform_device.h>
> but never call any platform device APIs. This is a PCI driver.
> 
> Remove the dead includes.

You do more than just that in this patch :(

