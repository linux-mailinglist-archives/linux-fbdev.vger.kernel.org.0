Return-Path: <linux-fbdev+bounces-7885-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2urVOhkJTWq9twEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7885-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 16:11:37 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C986D71C609
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 16:11:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zrv2jo0Y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nA3CUPqh;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zrv2jo0Y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nA3CUPqh;
	dmarc=pass (policy=none) header.from=suse.de;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7885-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7885-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BA573044324
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 13:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D00E421EF6;
	Tue,  7 Jul 2026 13:58:04 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0278C42252D
	for <linux-fbdev@vger.kernel.org>; Tue,  7 Jul 2026 13:58:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432684; cv=none; b=CKbpuFvCQYokLjciIamU7KVnJKZCiVcuriW++WBiob5DPOpfz7BkIwcpz714VLMwZvW2EQkyAqeAJKbWMJBvqnfUmTL0xGiLCVwssngS10SryAwnGG70ymkzlvmPS1Ct9OvgP5nhs3yq0F3ZmkbmqYjWZ9zxC7RIkwADyieVXrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432684; c=relaxed/simple;
	bh=tmeRXeJNfg2VeObxWKXrULMSOLvSZELw4ccb2cY65fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXt06KkC+OAcEL1O8Vqem0xsapzp9UMCnQfvBNEmSoKbaoIOIxjHFTA1yZ3hFLf/V/LrpBaqICTGRKWsBaEZwwUM0g07KHib4nZ0vxajBYdd7zUboBuXX6VzOv2cKDbb4d4lVteP7QQuvxioYszcGzoUzBnqOM0zVnKk0tEWvzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zrv2jo0Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nA3CUPqh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zrv2jo0Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nA3CUPqh; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2DC9D75CC4;
	Tue,  7 Jul 2026 13:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783432655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gezhe42hCPuf8EJ5YT9wfwNAIh+Y34zKtMBp5FToaFc=;
	b=zrv2jo0Y9kQ8hic3l6dlQwiACP+CSHn3K9S8zHi0UAHt2qeH+2JfmKogqKEQB7lwPGQg9b
	NNufZTCUl5VV5EPL9+6+x3EpEkIOrFtxUYccLmTsyvyBxkumHzfBdNGoAGnP1h1siaF8RY
	2uDGAu+ycwXVH6J+3jcmhS/p4YDtsIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gezhe42hCPuf8EJ5YT9wfwNAIh+Y34zKtMBp5FToaFc=;
	b=nA3CUPqhNNZV29K9KCZwdEMICNzKf14++DVHz3lQM1in+eCBjFVcXK0dtBAOWTcAmlDoGB
	TzyOEyioQpKHp/Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783432655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gezhe42hCPuf8EJ5YT9wfwNAIh+Y34zKtMBp5FToaFc=;
	b=zrv2jo0Y9kQ8hic3l6dlQwiACP+CSHn3K9S8zHi0UAHt2qeH+2JfmKogqKEQB7lwPGQg9b
	NNufZTCUl5VV5EPL9+6+x3EpEkIOrFtxUYccLmTsyvyBxkumHzfBdNGoAGnP1h1siaF8RY
	2uDGAu+ycwXVH6J+3jcmhS/p4YDtsIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gezhe42hCPuf8EJ5YT9wfwNAIh+Y34zKtMBp5FToaFc=;
	b=nA3CUPqhNNZV29K9KCZwdEMICNzKf14++DVHz3lQM1in+eCBjFVcXK0dtBAOWTcAmlDoGB
	TzyOEyioQpKHp/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40AA1779AF;
	Tue,  7 Jul 2026 13:57:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AISQDs4FTWoFSgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Jul 2026 13:57:34 +0000
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
Subject: [PATCH 09/10] drm/radeon: Implement struct vga_switcheroo_client_ops.pre_switch
Date: Tue,  7 Jul 2026 15:38:16 +0200
Message-ID: <20260707135724.247562-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707135724.247562-1-tzimmermann@suse.de>
References: <20260707135724.247562-1-tzimmermann@suse.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-7885-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:jfalempe@redhat.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:lyude@redhat.com,m:dakr@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:amd-gfx@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	FREEMAIL_TO(0.00)[wunner.de,redhat.com,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,intel.com,ursulin.net,gmx.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,suse.de:from_mime,suse.de:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C986D71C609

Call drm_client_dev_acquire_outputs() from vga_switcheroo's pre_switch
callback. Pushes fbcon updates from vga_switcheroo into DRM's fbdev
emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_device.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 705c012fcf9e..8697a9eb5d13 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1258,10 +1258,18 @@ static bool radeon_switcheroo_can_switch(struct pci_dev *pdev)
 	return atomic_read(&dev->open_count) == 0;
 }
 
+static void radeon_switcheroo_pre_switch(struct pci_dev *pdev)
+{
+	struct drm_device *dev = pci_get_drvdata(pdev);
+
+	drm_client_dev_acquire_outputs(dev);
+}
+
 static const struct vga_switcheroo_client_ops radeon_switcheroo_ops = {
 	.set_gpu_state = radeon_switcheroo_set_state,
 	.reprobe = NULL,
 	.can_switch = radeon_switcheroo_can_switch,
+	.pre_switch = radeon_switcheroo_pre_switch,
 };
 
 /**
-- 
2.54.0


