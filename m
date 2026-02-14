Return-Path: <linux-fbdev+bounces-6216-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGZxCgHhkGlmdgEAu9opvQ
	(envelope-from <linux-fbdev+bounces-6216-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 14 Feb 2026 21:54:25 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F0D13D32A
	for <lists+linux-fbdev@lfdr.de>; Sat, 14 Feb 2026 21:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69F693007231
	for <lists+linux-fbdev@lfdr.de>; Sat, 14 Feb 2026 20:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437AF308F23;
	Sat, 14 Feb 2026 20:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1r3MeMj"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CCB23E32B;
	Sat, 14 Feb 2026 20:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771102456; cv=none; b=Nq7753qhPgs3q6EPIAByUk0yrCPin28z6mqr4NV7q8QdiZQViOgiLM6NO7yJlmK7oprpJ9aA5wDZ1uOjoZotgEjdaFk8eRvqjaeQthcvOV+pJXmm1C2JnU0zvT8EtCF2xxINbn/rjSP6QZ5ST90++E8J5ZxxV6gvF+c3vZZRmAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771102456; c=relaxed/simple;
	bh=306/mQm3wMQ+H/qsWyBLA3nYFv70lCHwqVjrBNEI3lw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MYc4oZiIww964PK2rcbI0HXa6XQQRxmD7KdiQPe4le+yg912aIxk5JTwjZXXOGplPUxya8cU+dFC7xQj1oElP/n+1EBZ+irmkVHV73+CqGTGnlTq3ASdxom44UWWBqjLsYwQprdCnYDtxuOl8QjG7KKaX64eAwJru0HXib7XCms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1r3MeMj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B4FC16AAE;
	Sat, 14 Feb 2026 20:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771102456;
	bh=306/mQm3wMQ+H/qsWyBLA3nYFv70lCHwqVjrBNEI3lw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=A1r3MeMjm6BDGJG2qWoC8aHm9TZkQbGpTGhOZiHKWrcJwkcUhGeKsuX5jCmAP5ajv
	 HetU44xFLiTFohQ/JO/4ksUZ56jCv+Y1tJKZSUbVwXmqjcJd0EgLdPm8DlYrZpAKwh
	 +pkMVsoG/BIijW5o8WkYN4Q4mPtFPDGdYJbtQGXu8Hgc2nEu2XciRAAk6lMKG3g3SU
	 qiwIeQnIroDjSWeqdTUEiZfOipNHY/nexf5Z8j9ngK+3WiDLNX1RH4kh8jnrJwTLb0
	 /N0nH4NsWmkdFiil9GdobVeBv3ArnI6jIcCrTx1/gXGBIEliq3LjgCKGnJNezPnd/T
	 +gziIBEe7Je/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8527A393091E;
	Sat, 14 Feb 2026 20:54:10 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and updates for v7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aZBlTsIwTzS0tqBD@carbonx1>
References: <aZBlTsIwTzS0tqBD@carbonx1>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <aZBlTsIwTzS0tqBD@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.0-rc1
X-PR-Tracked-Commit-Id: a86039b76e5d1e886d42ec28f569a9ef76409750
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8b3c75a39cc3cde78332f0e10898104a5e1e2807
Message-Id: <177110244909.2897141.11184148040863874004.pr-tracker-bot@kernel.org>
Date: Sat, 14 Feb 2026 20:54:09 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6216-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 41F0D13D32A
X-Rspamd-Action: no action

The pull request you sent on Sat, 14 Feb 2026 13:06:38 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8b3c75a39cc3cde78332f0e10898104a5e1e2807

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

