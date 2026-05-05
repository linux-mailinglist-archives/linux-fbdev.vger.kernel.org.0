Return-Path: <linux-fbdev+bounces-7167-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wb6+MJpY+mmVNAMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7167-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 05 May 2026 22:52:42 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 199104D3C5D
	for <lists+linux-fbdev@lfdr.de>; Tue, 05 May 2026 22:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F7D73026747
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 May 2026 20:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E4C39B971;
	Tue,  5 May 2026 20:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvMLujDa"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8440B2F0661;
	Tue,  5 May 2026 20:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778014358; cv=none; b=UBkigvsQnHbf9eHRnfedS3Gj2PhAYzRZqH/b94CXcvR76w6eN5nqTbFmmZKAOU1mUyfsSA2d7K5vT4CuuPBc7qkNBrv2DAX1WfAh3tAHaiQ1Y5oP0RCjHJxuRexxAsYw7fmE5OOa7DT/UMeMn9D1+8TPDCRbgg6TYwXplDDTroM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778014358; c=relaxed/simple;
	bh=HChXrytaKurFkc9WqOBSK4ESIOzp4TbVSdtmIumCorE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2oxO9ns4RV4O+6lZeCeNUDGKmfJpsQp8CZGW3/IXSoG3sXuufAa0Zuwb/Gexry9moDmXpe339DQsi17N/v4uDWdE9dLy6b83Dzyp+o6/c3QXHATgnZ2egbAngFeTsX/cfXHAqup/ZI3vgkAnm8goP8u2wcaOwZ5N22yMBEpvRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvMLujDa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0166DC2BCB4;
	Tue,  5 May 2026 20:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778014358;
	bh=HChXrytaKurFkc9WqOBSK4ESIOzp4TbVSdtmIumCorE=;
	h=Date:From:To:Subject:From;
	b=NvMLujDalHQBRmPaPYRCs27vCTglfQJZmYSrmi1+HuoRaT+iJi3NMSR43QcuhkB+b
	 zz5bY448GrhOrZr7lDUq3fD0G2B6q0M0mxAW340wZDIc8l0B8/0kpH0weiumiSaQa2
	 Ei4YJkyaOZn1ma5RMOEgddSkOG/oQq6HCKiZiILGol/ySM5EfkMlIBCTIor/mtyHdL
	 W13GpjOdcUI/SBd1Cevj3OhZaDvd1eAoo3GXRPIlr8zmGtFAwb2NYk5oeJVTuEYfO/
	 eKVZFVCHxS11BAF8cORt8WEJRaGiY5sVIiBUMS81dn2gTK+SiK5EdnnYqUZBT+Mq9A
	 7ZKTZV/8MH61Q==
Date: Tue, 5 May 2026 22:52:33 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and updates for v7.1-rc3
Message-ID: <afpYkddCLxIsicwb@carbonx1>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 199104D3C5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7167-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@kernel.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	BLOCKLISTDE_FAIL(0.00)[100.90.174.1:server fail,2600:3c0a:e001:db::12fc:5321:server fail,10.30.226.201:server fail];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Linus,

please pull four small patches for fbdev, of which two are important:
One fixes the bitmap font generation and the other prevents a possible
use-after-free in udlfb.

Thanks!
Helge

----------------------------------------------------------------

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.1-rc3

for you to fetch changes up to 8de779dc40d35d39fa07387b6f921eb11df0f511:

  fbdev: udlfb: add vm_ops to dlfb_ops_mmap to prevent use-after-free (2026-05-04 10:35:55 +0200)

----------------------------------------------------------------
fbdev fixes & cleanups for 7.1-rc3:

- Fix rotating fonts by 180 degrees [Thomas Zimmermann]
- Drop duplicate include of linux/module.h in fb_defio [Chen Ni]
- Add vm_ops in udlfb to prevent use-after-free [Rajat Gupta]
- ipu-v3: clean up kernel-doc warnings [Randy Dunlap]

----------------------------------------------------------------
Chen Ni (1):
      fbdev: defio: Remove duplicate include of linux/module.h

Rajat Gupta (1):
      fbdev: udlfb: add vm_ops to dlfb_ops_mmap to prevent use-after-free

Randy Dunlap (1):
      fbdev: ipu-v3: clean up kernel-doc warnings

Thomas Zimmermann (1):
      lib/fonts: Fix bit position when rotating by 180 degrees

 drivers/video/fbdev/core/fb_defio.c   |  1 -
 drivers/video/fbdev/udlfb.c           | 31 ++++++++++++++++++++++++++++++-
 include/video/imx-ipu-image-convert.h | 16 +++++++++++-----
 include/video/udlfb.h                 |  1 +
 lib/fonts/font_rotate.c               |  2 +-
 5 files changed, 43 insertions(+), 8 deletions(-)

