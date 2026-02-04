Return-Path: <linux-fbdev+bounces-6054-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLVgDlIng2kxigMAu9opvQ
	(envelope-from <linux-fbdev+bounces-6054-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Feb 2026 12:02:42 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5F4E4DD8
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Feb 2026 12:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD978300AECB
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Feb 2026 11:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4104B3E8C66;
	Wed,  4 Feb 2026 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jR2Lw2rR"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF843C1995;
	Wed,  4 Feb 2026 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770202958; cv=none; b=LpV158drIOMBUtzjLfqm25Khn98hGbk1QV8YziZFDQgbJD0Ow4X7bGWKRbs4iwCZMUwr0ylD/uv4hSWYi+AtwH3jJR6WSRabTEWNp4dZ0QvuGZDcHkMhm8WP4H03sCkQ1A0LHA9qL+pEAtoUeOlhWb01bpQsC6opahE2yn+DAVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770202958; c=relaxed/simple;
	bh=tbxVkn5xTD2cqMMotYI1qnfsmDiyPMVx+2GLKi8CJsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L7cmRVcLCVPohGyi4oEQ+bZR/zD8gdnertdfnTolUHBsNmhULhyZtyJJGxQ1I42zyz46f2Cuu4ht04nUfLOOd+jJnDHj82kfQ1mXziB8M9RVp6CZi5OZCMmKDMWGJImrjWdwFUWtNhGoFMc0wgmdEZPB4rh17EDuW+7g1n7zsrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jR2Lw2rR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB15FC4CEF7;
	Wed,  4 Feb 2026 11:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770202957;
	bh=tbxVkn5xTD2cqMMotYI1qnfsmDiyPMVx+2GLKi8CJsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jR2Lw2rRn5TyI817j2f74PRb1Do/1+fyZiacrKtn7Flny5uDdLu+1S/MD/qzCf1W9
	 bPjU5t/b33xQbRWLFQNDjif7Uqb9XYt0gkjOoOPZs55+d1IRhw/CLNlyWD7FFGc3iK
	 HHK2CnYjmUD/KofBRyIebuj5Etoo4dw9ftYbrczm+Gd1rF3+jksJjWBokzg5wFOXuw
	 OX9luJEcx87BtEsaIDYMc33FtIdEF/Nj8akLH+DQuXQ7eDmwSlcoKkAFyKT4Vv+BXd
	 FtV2zaMhUT+DlQBfv5rvndZ2lfD4WaX/kTqi9O7n3peikA6QDzB8DVLuC8+R4mhCDg
	 x02T97eS9NtUQ==
From: Lee Jones <lee@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>, Petri Karhula <petri.karhula@novatron.fi>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
In-Reply-To: <20251205-cgbc-backlight-v6-2-e4175b0bf406@novatron.fi>
References: <20251205-cgbc-backlight-v6-2-e4175b0bf406@novatron.fi>
Subject: Re: (subset) [PATCH v6 2/2] mfd: cgbc: Add support for backlight
Message-Id: <177020295541.1156637.13732898227550489902.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 11:02:35 +0000
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6054-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,gmx.de,novatron.fi];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-fbdev@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF5F4E4DD8
X-Rspamd-Action: no action

On Fri, 05 Dec 2025 12:19:48 +0000, Petri Karhula wrote:
> The Board Controller has control for display backlight.
> Add backlight cell for the cgbc-backlight driver which
> adds support for backlight brightness control.
> 
> 

Applied, thanks!

[2/2] mfd: cgbc: Add support for backlight
      commit: 7c5a0d97bb1bc1df127107bf46f6ae49d73094d4

--
Lee Jones [李琼斯]


