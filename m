Return-Path: <linux-fbdev+bounces-7875-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OIt4He8ITWqstwEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7875-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 16:10:55 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB7A71C5D2
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 16:10:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JZMcKQXP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=C+RyRdWP;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JZMcKQXP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=C+RyRdWP;
	dmarc=pass (policy=none) header.from=suse.de;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7875-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7875-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78A29314F5A2
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 13:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CF6420E91;
	Tue,  7 Jul 2026 13:57:32 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D63390228
	for <linux-fbdev@vger.kernel.org>; Tue,  7 Jul 2026 13:57:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432652; cv=none; b=HcyPJI6P/va8T5qmK3n6EXOF7D7KYpMdBbteXlC52IoU080E9MmV/9je7fKlPdE42+3m0fPl1LUrT4u05gaG/C8KjJyfVXr3a1TO6a3BRkGF7Mf20pPmXI4OgaS+Iy3fpj1D34F8DvnBxzrXw64eNj2xxE61gKWVVEyy4oRpDWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432652; c=relaxed/simple;
	bh=3ZCjCxoRGovES91sOQuFkxihX0t2iDbf5Gqm502J5DI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g4zyHwQNaiPhzAXU/692km+N/Oo7ScgIph1ovlojq5sff/s+veu9W8kmWyWTVxnYyDrs9jG7eq9xwvnCktmAbRm+QA/5jehj0Qzpx2srq+O3i4j+aPgF+4q+y78QF0BqgaCEcz8DyyTfyrcLMAMyMnPQyVLrQ+YRoBhZ17m87f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JZMcKQXP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C+RyRdWP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JZMcKQXP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C+RyRdWP; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9DF37726F2;
	Tue,  7 Jul 2026 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783432649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/BZajym9uebxwqSIz0M7fPVZU/Sl2uebGIt4iYrAV9g=;
	b=JZMcKQXPD3wy5PFRcdEITfw+miSKvKJ5RTlRAuxpEpPsS5l8wPBhu7f94fvq1bAr/WOr+0
	pUsglwjcyaxwYnrT281uqhdnEzEsoLSpufH5gEu8rNbl0G+vLT7wj+TNMpLAvAf9fzIZ7E
	SO+h0aYfew01KkkLL+kgOIcGFv6WVZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/BZajym9uebxwqSIz0M7fPVZU/Sl2uebGIt4iYrAV9g=;
	b=C+RyRdWPPLFcwhiNscmhIGQS0IMWLqWZiaNhJ0EJauZjg3KpsekXPUg7vgQhjJxISCOmvl
	+TLK6kAXvGZsgVAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783432649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/BZajym9uebxwqSIz0M7fPVZU/Sl2uebGIt4iYrAV9g=;
	b=JZMcKQXPD3wy5PFRcdEITfw+miSKvKJ5RTlRAuxpEpPsS5l8wPBhu7f94fvq1bAr/WOr+0
	pUsglwjcyaxwYnrT281uqhdnEzEsoLSpufH5gEu8rNbl0G+vLT7wj+TNMpLAvAf9fzIZ7E
	SO+h0aYfew01KkkLL+kgOIcGFv6WVZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/BZajym9uebxwqSIz0M7fPVZU/Sl2uebGIt4iYrAV9g=;
	b=C+RyRdWPPLFcwhiNscmhIGQS0IMWLqWZiaNhJ0EJauZjg3KpsekXPUg7vgQhjJxISCOmvl
	+TLK6kAXvGZsgVAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19C6C779AE;
	Tue,  7 Jul 2026 13:57:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1EnlBMkFTWoFSgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Jul 2026 13:57:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lukas@wunner.de,
	jfalempe@redhat.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tursulin@ursulin.net,
	lyude@redhat.com,
	dakr@kernel.org,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/10] vga_switcheroo, drm: Push fbcon handling into DRM clients
Date: Tue,  7 Jul 2026 15:38:07 +0200
Message-ID: <20260707135724.247562-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-7875-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:jfalempe@redhat.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:lyude@redhat.com,m:dakr@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:amd-gfx@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	FREEMAIL_TO(0.00)[wunner.de,redhat.com,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,intel.com,ursulin.net,gmx.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:from_mime,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBB7A71C5D2

Vga_switcheroo currently invokes fb_switch_outputs() to inform fbcon
about switching of the physical outputs among framebuffer devices. But
new DRM clients to not use fbdev/fbcon and might require their own
vga_switcheroo support. Let's strictly separate them from each other.

Remove fbdev/fbcon from vga_switcheroo. Introduce a pre_switch callback
for vga_switcheroo clients to do the fbcon update. Allows for removing
all direct interactions between vga_switcheroo and fbdev/fbcon.

Also replace the existing reprobe hook with post_switch for symetry.

At the same time, push the fbcon update into DRM's client for fbdev
emulation. Do this with the new DRM client callback acquire_outputs,
so that other clients can have their own handling of vga_switcheroo.

There are only four drivers that support vga_switcheroo: amdgpu,
radeon, i915 and nouveau. Update each of them with the new callbacks.
When vga_switcheroo now invokes pre_switch, each DRM driver forwards
to aquire_outputs and lets the DRM clients handle the new outputs.

Tested with radeon on a notebook with Radeon HD 4225 and HD 5430.

Thomas Zimmermann (10):
  drm/edid: Include <linux/fb.h>
  drm/client: Add acquire_outputs callback; implement for fbdev
    emulation
  vga_switcheroo: Add pre_switch callback to client ops
  vga_switcheroo: Add post_switch callback to client ops
  drm/amdgpu: Implement struct vga_switcheroo_client_ops.pre_switch
  drm/i915: Implement vga_switcheroo_client_ops.pre_switch
  drm/nouveau: Implement vga_switcheroo_client_ops.pre_switch
  drm/nouveau: Implement vga_switcheroo_client_ops.post_switch
  drm/radeon: Implement struct vga_switcheroo_client_ops.pre_switch
  vga-switcheroo: Remove unused interfaces

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  9 ++++-
 drivers/gpu/drm/clients/drm_fbdev_client.c | 23 ++++++++----
 drivers/gpu/drm/drm_client_event.c         | 18 ++++++++++
 drivers/gpu/drm/drm_edid.c                 |  1 +
 drivers/gpu/drm/i915/i915_switcheroo.c     | 11 +++++-
 drivers/gpu/drm/nouveau/nouveau_vga.c      | 28 +++++++++------
 drivers/gpu/drm/radeon/radeon_device.c     |  9 ++++-
 drivers/gpu/vga/vga_switcheroo.c           | 41 +++++-----------------
 drivers/video/fbdev/core/fbcon.c           |  8 -----
 include/drm/drm_client.h                   | 14 ++++++++
 include/drm/drm_client_event.h             |  3 ++
 include/linux/vga_switcheroo.h             | 30 +++++++++-------
 12 files changed, 122 insertions(+), 73 deletions(-)


base-commit: cd8abe2554ec7eba16c1d48ab508732bf93534eb
-- 
2.54.0


