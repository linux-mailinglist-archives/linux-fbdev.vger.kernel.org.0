Return-Path: <linux-fbdev+bounces-6077-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJaBEDAwhWlV9wMAu9opvQ
	(envelope-from <linux-fbdev+bounces-6077-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 06 Feb 2026 01:05:04 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9EAF87C1
	for <lists+linux-fbdev@lfdr.de>; Fri, 06 Feb 2026 01:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC7633016EE2
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Feb 2026 00:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47A88F48;
	Fri,  6 Feb 2026 00:05:00 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08591373
	for <linux-fbdev@vger.kernel.org>; Fri,  6 Feb 2026 00:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770336300; cv=none; b=tudOGH6tL/aH/nTH9Ph91Euvw7Z9+Z7k756C/pRR4dw4WOVZDGwMZZ0oKue3/R5NMFd6VDjFaN+jRK7wADy0C60dGrR9EUr0dPw77pZr+7hiwLRSKh0sD4TgV54H1RDrEiiLgolZ3kntjPg5ChKTKOD3/T0L1fqs6FbK0XANQWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770336300; c=relaxed/simple;
	bh=qvbP0GGWheXqryRE1stVEc7b6SUWhDa6wK7t/cEozCI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B2zZRat1o4fDlXAqJLf6pvYfxQEO8917IpxDPY0lzALdlGv5VV/MPJ92eiuPUDtizq3qDAOaAuy6oDF2qIUjXtDaPCQKnwFtfhNpeIYyekXCKwq2NESlFrPHd8DxkBMrL5hwB2Lnh5KY8b8A5Mtfy8wW7eegBSgN/d/W/C1rjLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
From: Nam Cao <namcaov@gmail.com>
To: ChanSoo Shin <csshin9928@gmail.com>, andy@kernel.org
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, ChanSoo Shin
 <csshin9928@gmail.com>
Subject: Re: [PATCH v5] fbtft: limit dirty rows based on damage range
In-Reply-To: <20260128203938.962414-1-csshin9928@gmail.com>
References: <20260128203938.962414-1-csshin9928@gmail.com>
Date: Fri, 06 Feb 2026 01:04:45 +0100
Message-ID: <87y0l668ki.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6077-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namcaov@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF9EAF87C1
X-Rspamd-Action: no action

Hi ChanSoo,

ChanSoo Shin <csshin9928@gmail.com> writes:
> Instead of marking the entire display as dirty, calculate the start
> and end rows based on the damage offset and length and only mark the
> affected rows dirty. This reduces unnecessary full framebuffer updates
> for partial writes.
>
> Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>

This looks useful and I prefer to see it applied. I understand lack of
testing is the main obstacle. Are you still trying to get it merged? If
not, I can take over.

Nam

