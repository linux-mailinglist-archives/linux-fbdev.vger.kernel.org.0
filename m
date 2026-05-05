Return-Path: <linux-fbdev+bounces-7168-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J09BMCD+mkEPgMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7168-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 06 May 2026 01:56:48 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA7D4D4D2E
	for <lists+linux-fbdev@lfdr.de>; Wed, 06 May 2026 01:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3177E302E93F
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 May 2026 23:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B5F332918;
	Tue,  5 May 2026 23:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WadBA/rB"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721363264C2;
	Tue,  5 May 2026 23:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778025402; cv=none; b=MWjKotOt7qJ0nxuiZ5/P5/Be5ijo2U+1VVzAJowi8r5VwAlQxeOx8tkUL0sKJPg+YKu6+2s8nY0YDD59B4leYH+WnM26gSpIY8lN+heNzk3oqHWM6U0t2AEg6xKieyUC4Rjj3JaaOPS9OJQDzWbqzNz/CGBiDBAnplHCs5soTzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778025402; c=relaxed/simple;
	bh=SKxPzwOs2LUU6XS+S+cwge8LKnZfV+kTiCd5PwTtSI8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Swz8VFXXL1XYxrKXO4wAhamVdqH8cFEs6lKR5bwoUeH8aYPxr5MGV+2Y5wKMo7yPtiAB5BVkCf7HGVKyRfDBX1dYAbVn/5bBjLm3QxnotQInHtPS/7I4AYhpvj9Cxq2dpqsPeoELqDb535ff+GlMRsNL6+UCqCPTRyTlmv6r17g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WadBA/rB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56117C2BCB4;
	Tue,  5 May 2026 23:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778025402;
	bh=SKxPzwOs2LUU6XS+S+cwge8LKnZfV+kTiCd5PwTtSI8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WadBA/rBzHYS46Pec0DntriiezSHraNm6KxHDixqZSe/fu3WK+UIJqXHmDyIJn4PL
	 xKE/Q2jqJzyNDNzIVKp5q+gskYTP7e1nn5JKe560rFGASnisTaujcscUHoZRC2m/AW
	 S9J71ns2z0tPbg+SEH6sv4aGPCjWjIk+vKLQ2tEIcLXCPTcpA698oTFJb5rB5opPCS
	 5Fw7bbYXoXAst9aaOTN3HDl32HDaGF5Dt1kiX+01UWng/20yFf/KOwgrxnG4rdQZS+
	 Z/zFQPz35V0JEMHSDe3fIEmdPgMhLq6iv+1qgCHM/L3u+3NsopOsmAkje17ze2HWTR
	 eQR1SVpLzIBig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FE439302FF;
	Tue,  5 May 2026 23:55:53 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and updates for v7.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <afpYkddCLxIsicwb@carbonx1>
References: <afpYkddCLxIsicwb@carbonx1>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <afpYkddCLxIsicwb@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.1-rc3
X-PR-Tracked-Commit-Id: 8de779dc40d35d39fa07387b6f921eb11df0f511
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 13ad98eaabef611f042d49a9077be060ad03284d
Message-Id: <177802535232.2314843.2129849224623926149.pr-tracker-bot@kernel.org>
Date: Tue, 05 May 2026 23:55:52 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 5FA7D4D4D2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7168-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The pull request you sent on Tue, 5 May 2026 22:52:33 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/13ad98eaabef611f042d49a9077be060ad03284d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

