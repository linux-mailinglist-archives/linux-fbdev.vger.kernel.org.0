Return-Path: <linux-fbdev+bounces-7628-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GGEhBVq/MGoEXAUAu9opvQ
	(envelope-from <linux-fbdev+bounces-7628-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 16 Jun 2026 05:13:30 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CEB68BA42
	for <lists+linux-fbdev@lfdr.de>; Tue, 16 Jun 2026 05:13:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Iu73EJEH;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7628-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7628-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EB253055044
	for <lists+linux-fbdev@lfdr.de>; Tue, 16 Jun 2026 03:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E073C76AF;
	Tue, 16 Jun 2026 03:10:43 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BA03C8738;
	Tue, 16 Jun 2026 03:10:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781579443; cv=none; b=V6tmtx420glF+s6YFJ4s00+PjZqsaDMdbjCp7IFzgP69bwjL/7Uyy8yxklpYP8E9oxarrCARlAFoBtLA0IUBK4g2/ItvoZqNJQl5phlpvZs87hJp2/dEt0q/ADHReq/lnZBAkwKbWmRvnXYgGngtvXFyhIRAbggntR4pFEtfXFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781579443; c=relaxed/simple;
	bh=Ej9ZM1VKFxHSLU7cZbjXPi7fgMfVhgJcMn5dQQU2yeQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kQaUdTRLlrUcRf374YQNrBO9iGGkkcuaXFBQZCkURiG4Y0XnBn77dwC/VorLwg0SwZG/mAG18pyAbqri2hskAOCTlRs908nmQQ4Z4THJTMuRz69lRRHIb5CCqKtmC5KDjrERcwCjQ3qFYJUK1AYnm0dXy7mXUSpZD/UKr2J+tJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iu73EJEH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EEE1F00AC4;
	Tue, 16 Jun 2026 03:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781579440;
	bh=Dtej1D3OJgueLvzfSfIXgzcNjGnEErEqNbrsgY+1CjE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Iu73EJEHii83jRXnVKhFp8O4qMxSFqRS4GTI/YTwGa590LTA9SbWC7czS0ZMePXVC
	 rVlFINbtQYPE82lJE4IRsOV5h0Q7LiQw+u89FkzxV23l7l4ZxIk9IzW+/jTl6iorRn
	 nXBFhTNIjiaa8asBQciq7lIS+pEPWHjafP89Z+If4I2MpvXhjaxgwCeAtfgeSSOBXW
	 /HFqRC+PqKOG7XuOrVrH0643AqqZxR7ChNBl8hhcLe9XJEMtlkjh1qVBsAM3yahnwz
	 8I4DBoXAYDXEl2w+/H2V5F/aaGftDXYV0MXLmpekevgt5iRLKSUiZkOZeK1xf0f20N
	 yaBX9ma0kMKGg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C44C383BF4D;
	Tue, 16 Jun 2026 03:10:36 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and updates for v7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ajAqhsgrxtUHQdFv@carbonx1>
References: <ajAqhsgrxtUHQdFv@carbonx1>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <ajAqhsgrxtUHQdFv@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.2-rc1
X-PR-Tracked-Commit-Id: d894c48a57d78206e4df9c90d4acfaf39394806a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd77e50c9a70f844d6073499f3d1a6fd193eae73
Message-Id: <178157943496.413763.1174494062218662923.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 03:10:34 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:deller@kernel.org,m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-7628-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linux-fbdev@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72CEB68BA42

The pull request you sent on Mon, 15 Jun 2026 18:38:30 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd77e50c9a70f844d6073499f3d1a6fd193eae73

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

