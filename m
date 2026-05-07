Return-Path: <linux-fbdev+bounces-7175-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIPULcyT/Gn3RQAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7175-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 07 May 2026 15:29:48 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8CC4E9435
	for <lists+linux-fbdev@lfdr.de>; Thu, 07 May 2026 15:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9955B3067B89
	for <lists+linux-fbdev@lfdr.de>; Thu,  7 May 2026 13:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF823B6BF0;
	Thu,  7 May 2026 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtftW3QB"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290E315ECCC;
	Thu,  7 May 2026 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160344; cv=none; b=KdLC11riUHuoa8KJYAJUwdYGM+JQeJDqTX2EFJ18pJsp8hCeON7537GDq/vIO0g+YWsmFYwOljDjRyBmTVyeJUvAiu6JVmdZydQ5hTjCILafGxyhZFBsuPKG2EyXWNnP3QaX+jBZb1/kcu2t8CAiG9fZb645tF3YCn0xch6y6qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160344; c=relaxed/simple;
	bh=KH+/lr31F6Z0z+vUx680aRlaO0mvzZuASV171zsRe8M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VEbzgFlerfx1mX8GTAvrOIx9fPVjHmQippi3+Jyvxw7cPhzZqA5MLlaWZY+odQSysIQQPtaqpbr6h9/uq3TZkTHkFyU7TpLHcNlOvStXbskTGTWiLFvqvDZzdxyM9rAKIOR/Ob7B7XzTVqWfURiyV2LkbTiDE1d59pud1naIAwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtftW3QB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA82C2BCB2;
	Thu,  7 May 2026 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778160343;
	bh=KH+/lr31F6Z0z+vUx680aRlaO0mvzZuASV171zsRe8M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DtftW3QB/Z/jretElAvHJ7PrQmnYEsr3qOnEDjSuXYLSiPGkvRl/dSVlsxnl1s7LV
	 9mwoVb4hK3ZqbQMqHxRnUp6fQPFaPVYWzxEXtIGX9bRhX0H0Sxa82RLI2ZaqGcB/gL
	 +qAZAVkIYjfWiHyVlqH6pD6XX8cophk8g9bW2lNnxji1XxaajwNKGIl341796pImal
	 aK7I1OyFgQ0U4pqr+KFu9Nfuys4nAwLQohcMQTXdBcCrWi6DduD0LQF1r8stq7Cz56
	 mtix+wc/TC1PDTcPmr6aqpXwap2mv5xxJf09FbyvxfASlLFYZB7OlxR1oku9gfTEvb
	 TCkVxc7X7nUiw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260427-backlight-cgbc-remove-x86-dependency-v2-0-da9f2375a34a@bootlin.com>
References: <20260427-backlight-cgbc-remove-x86-dependency-v2-0-da9f2375a34a@bootlin.com>
Subject: Re: [PATCH v2 0/2] Remove redundant X86 dependency for the cgbc
 backlight driver
Message-Id: <177816034168.1867063.1520145469415761822.b4-ty@b4>
Date: Thu, 07 May 2026 14:25:41 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: 4C8CC4E9435
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de,bootlin.com];
	TAGGED_FROM(0.00)[bounces-7175-lists,linux-fbdev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 27 Apr 2026 11:40:32 +0200, Thomas Richard wrote:
> For this second iteration, I just added Daniel's RB tags.

Applied, thanks!

[1/2] backlight: cgbc: Remove redundant X86 dependency
      commit: db8e26c435698222b333cafcbc043dfdf083d591
[2/2] MAINTAINERS: Add cgbc backlight driver
      commit: acea35b567d0f610d533ca661f4106ac12583f78

--
Lee Jones [李琼斯]


