Return-Path: <linux-fbdev+bounces-6506-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IygfLneXrGlarAEAu9opvQ
	(envelope-from <linux-fbdev+bounces-6506-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 07 Mar 2026 22:24:07 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1755A22DAEB
	for <lists+linux-fbdev@lfdr.de>; Sat, 07 Mar 2026 22:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEEC5301DAF7
	for <lists+linux-fbdev@lfdr.de>; Sat,  7 Mar 2026 21:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0209E329C7C;
	Sat,  7 Mar 2026 21:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovh9Tano"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17E02D9499;
	Sat,  7 Mar 2026 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772918643; cv=none; b=atTLYHKHfL2EhhZqEpLzfNLqXdj62aRf/Puuvy9KPuQRj2xprmhkRrLHrvI3XuHd04Hkg+mCaK6ae06ALshbSYvfI5FZFjJKkhOq8kAF+K9stLVVnPp971LL3j0fXL0rK5L6vwPZTkiHEQzkgTC/qrHv+tT4avCT7vD7Il9V9JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772918643; c=relaxed/simple;
	bh=fVWek9dUrL/Ln52UfkGDHG5nVzdDqNEpD8OAzGaTD9o=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JSYNvD3uedhfZAt1KJbup++LtMcnqrEfjovM4Dsao0WYRQnKHCdXqioCSgZJfwQtuJuMB2UNy5hws2ImiALe0VnH7JTfxfaDwDig3cjfliy27n8YlEG6YYmB1tMybU+i+91UwEg4K0ElkTexQ0C5vX7RwNXlmZi9+rCDEJJo75c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovh9Tano; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDC2C19422;
	Sat,  7 Mar 2026 21:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772918643;
	bh=fVWek9dUrL/Ln52UfkGDHG5nVzdDqNEpD8OAzGaTD9o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ovh9Tano4PoNs1fZCg7/59OqBdDv98QCQfzo/sZWvK5aEHlQJnGNWwD89KbdSYVVW
	 cgi7HxeB9PljR5ilEeawLtFajiRaGxP0Efz6RumEGMq1Y/X24UJbH2t8zZZ160mnLx
	 M4cKmWKHbVpu1UiOR17WYxsS9AoVaKgGtd+T6NxrUHLQTSbdDIAwFg2NHNLB2jJpgf
	 M2UyJRoHckAeQigB7mDyOZrrzAnqHzpvM+0DR59Y8uGDYV+mlRMyVKQDZOvnDRMf3J
	 6BRsPJix8sJUOEIZp6mjcZ3ohv/ZCbYQng51H9aEMvuIdKD4lUIhZ6bJqQg9ZJCHDu
	 7p47cLT+BLFyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0309F3808200;
	Sat,  7 Mar 2026 21:24:03 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fix for v7.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aayOLznDX70UUs6T@carbonx1>
References: <aayOLznDX70UUs6T@carbonx1>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <aayOLznDX70UUs6T@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.0-rc3
X-PR-Tracked-Commit-Id: e31a374a99f5026df6ebff2a1c49492276e776fd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fb07430e6f98ccff61f6f1a06d01d7f12e29c6d3
Message-Id: <177291864170.323982.13715608528142906828.pr-tracker-bot@kernel.org>
Date: Sat, 07 Mar 2026 21:24:01 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 1755A22DAEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6506-lists,linux-fbdev=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-fbdev@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The pull request you sent on Sat, 7 Mar 2026 21:44:31 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.0-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fb07430e6f98ccff61f6f1a06d01d7f12e29c6d3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

