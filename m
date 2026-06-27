Return-Path: <linux-fbdev+bounces-7754-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hea1JSg9QGoDeAkAu9opvQ
	(envelope-from <linux-fbdev+bounces-7754-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 27 Jun 2026 23:14:16 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B916D2AEF
	for <lists+linux-fbdev@lfdr.de>; Sat, 27 Jun 2026 23:14:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=m8TT+rG3;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7754-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7754-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AA28302DF68
	for <lists+linux-fbdev@lfdr.de>; Sat, 27 Jun 2026 21:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF733803F7;
	Sat, 27 Jun 2026 21:13:23 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC3C37F015;
	Sat, 27 Jun 2026 21:13:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782594803; cv=none; b=TI3PSjkZauUQOIiRSQFEU9LXWVPpKb7cFOr1Ez1/y+c6sLervzX6C/5ul9sGxzvUAL7EVBZwXV0rHPu6sjvVZL9jcg0oAhiWYQY7SzWMrm0388ogal/prah7YIHci/X2ScaCoN7Ns+Hz97OCHleWTm6meUCYX0uOds6d4wzH1dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782594803; c=relaxed/simple;
	bh=U7C5GwWwe/Is1uzUc2Yy5jx+U+MtE9zGO0uyhuXhnHY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=jt3mXC/XKgV0to1VzjPMF/X2W19Jr3tv+E6IloUDfjBrWf+PyXPKHmfLEV+O0l0HMRQvSMSKCTHGLaNnUt8nBPsYyzG/oEP9qkj2IE+zHPnWSau0rfnt8jTq8wAfwkshXOGwsw9TPXjK1SictPfBIY0DYqQYke7pbJWqugWgQp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8TT+rG3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828431F000E9;
	Sat, 27 Jun 2026 21:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782594802;
	bh=7IIarUe+baKuHHQbpyHLNcw1qaxN6lQqvLcXWyFWHNg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=m8TT+rG3IZWdMjJVbbCAX1lNwl/HNbxDubbGoG2cwBROFV+X9uHbT3ktfM6AdBNeC
	 qWbY6iAOkhxGkMkqEOKtzFuO+hNAWMT+CfaPS/JtEm+vdZ9nbfF3Px8kqPEZreGEqC
	 j3rUuE03cthvUJhUN3mbyI5BVTEBknk8Zo/9m1nxxn6fvvkr+QrTCjdkn0pCjUxj2A
	 582sVT8UwtLquwteFc0AKr8YfEb5Mit/KuNp/6MQFrc3LXujOnn9VPlu86y6j4M3v4
	 BQ4lbB4/1UzGCgekTJ1OF5sbErACEQdkbwwlRiq1H86nmUBPRhVI2fwpr5M+u6Dbp/
	 BehIEOLbYn8MQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A9F3938452;
	Sat, 27 Jun 2026 21:13:09 +0000 (UTC)
Subject: Re: [GIT PULL] additional fbdev fixes and updates for v7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <akANXx5Fr4vBRhwg@carbonx1>
References: <akANXx5Fr4vBRhwg@carbonx1>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <akANXx5Fr4vBRhwg@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.2-rc1-2
X-PR-Tracked-Commit-Id: 7f08fc10fa3d3366dc3af723970bd03d7d6d10e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f21df873208d41ef816b15024d6447813b97ab5e
Message-Id: <178259478823.1431938.3522644980455972478.pr-tracker-bot@kernel.org>
Date: Sat, 27 Jun 2026 21:13:08 +0000
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
	TAGGED_FROM(0.00)[bounces-7754-lists,linux-fbdev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07B916D2AEF

The pull request you sent on Sat, 27 Jun 2026 19:50:23 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.2-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f21df873208d41ef816b15024d6447813b97ab5e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

