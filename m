Return-Path: <linux-fbdev+bounces-7955-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cyANDGaBU2rcbQMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7955-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sun, 12 Jul 2026 13:58:30 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C28274491E
	for <lists+linux-fbdev@lfdr.de>; Sun, 12 Jul 2026 13:58:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=ND8Kgi59;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7955-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7955-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5B2C300CBC7
	for <lists+linux-fbdev@lfdr.de>; Sun, 12 Jul 2026 11:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7816F3A7F6B;
	Sun, 12 Jul 2026 11:58:21 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192D324336D;
	Sun, 12 Jul 2026 11:58:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857501; cv=none; b=kQwXVCX3Ni4bkNgNUIyCpAvAvraQV0PxPwWUqrCFWoj/v8ScYMntXQ2ba142r9dfOKFamwko4w6OJTtRToJKJDS+wnFw8KKHoANaFlWIefaSQzAujEMpsl87J7xdYe831SNJ1dqwaPRBrVie+Ny04VDLw4vQq7SWqAHNVbn7Vbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857501; c=relaxed/simple;
	bh=57pGUYrskAcquwCxXp4iQyn29Vfw0lsKv6HeEBc+8CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCSnPuoyN2YFK+XYtVbBhRRktYVPNxnw080ffRFjg7b9OZ9k6c9R4aooOxSX0dcDQm//Ie6txOMRLg2+ZiPfHpTK1YuhrnYP3ikrJ4MsPS/NVbtClLuvYzWsq7P8xc3TEEEGZ3ldmv4Vy0iJpprWTVfOQ1dG3+hRHswvjICDyTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ND8Kgi59; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9C11F000E9;
	Sun, 12 Jul 2026 11:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783857499;
	bh=yrFC16hsoM9M2XVRLKGX7WGRy7svbYgDfsDSl/vR2dQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ND8Kgi599b5uMp5LNQ6Ynfqa3aim8kYh1xt2+PPwQVAh0hiDdn3L04rNSDPm8cEuv
	 Va9gupRwvpJ0otAHaJul8g2EWGBLJtmb0QIRkbJqA/wNt31tWicEsF9u8J3y6IaCLP
	 evbPkDh26lB0KGzZaCaFkiTiDYaCfCfTfnK8/Mts=
Date: Sun, 12 Jul 2026 13:56:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: toveno <teamakeads@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: sm750fb: fix CamelCase naming checks
Message-ID: <2026071233-dish-finalize-d5a5@gregkh>
References: <20260712113315.38615-1-teamakeads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712113315.38615-1-teamakeads@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7955-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:teamakeads@gmail.com,m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C28274491E

On Sun, Jul 12, 2026 at 02:33:15PM +0300, toveno wrote:
> Fix checkpatch.pl issues regarding CamelCase naming conventions by
> converting internal driver variables to standard lowercase snake_case.
> - Rename pvReg to pv_reg

Please read the email archives for why this type of rename is not
correct.  (hint, think about the name you just picked...)

thanks,

greg k-h

