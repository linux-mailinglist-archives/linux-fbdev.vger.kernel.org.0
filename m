Return-Path: <linux-fbdev+bounces-7878-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5Y3+DV4HTWpStwEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7878-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 16:04:14 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB05B71C4BE
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 16:04:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="f/p74NQG";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bZb6huuQ;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="f/p74NQG";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bZb6huuQ;
	dmarc=pass (policy=none) header.from=suse.de;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7878-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7878-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FC6230A6BB9
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 13:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8C1412282;
	Tue,  7 Jul 2026 13:57:39 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18943ED135
	for <linux-fbdev@vger.kernel.org>; Tue,  7 Jul 2026 13:57:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432659; cv=none; b=uTkKeyuaXyLaMIDBsWZwV2mh+jC337a3qnS5q5eZVg6xFLZdmf/oaC0Kt/F20la0rjpWGXERLK07AyCwi0ik2qUm9zaxIDjB0zeorzVluW1AX8ajFJ1cxzSCL8B8yXyth+3yTmgnJr9kOZQjP1fyhnW5KiYwin1pHDgOIK2lOvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432659; c=relaxed/simple;
	bh=Minn94sXir64EaOIwn4ArV3Rq6I8A3TGmukGJqJdnXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ozl6pRQ7YKyZOn2npP0KGnMX72XTpJchjRQZuk0DnssJypwYHtJjqV953PWjN38V6klR/INZOMRiQx7ey60vCUMI4gdGL4o5U70Wc4rOBTvYHMowJvJYB1/J5hxn8yoC1cXSNbWeuzb/E4zEBBX/tHoEm7QTo9q72LoLn1opv+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f/p74NQG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bZb6huuQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f/p74NQG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bZb6huuQ; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CE9BD741E0;
	Tue,  7 Jul 2026 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783432650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YifDnmK82gFn50n9gIPI//YYkdL4JukIrrg2Jw2g5D0=;
	b=f/p74NQGWjJ1JSiGxgZSaQ0XAuitEjQZF/i+mHFmh7OvZecl3T+YB5Y4kPEmp/A1cmc4EK
	Qhk1MZ4SSp3Au7Ra4bEGcbWO3bKRutqiXkcrcWFtRG139RbkqW8p1r1rq9UdY3BMVe0DGB
	2IKlC6svopgnTq4yGFP9I/RLF24MX9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YifDnmK82gFn50n9gIPI//YYkdL4JukIrrg2Jw2g5D0=;
	b=bZb6huuQ6ui3An99WiqPWURaeYQECZUJ7C1dkU4McVIQpyYsSugXD4k0psE5WSPsiw1TR9
	aPPX27ePEbvi8LAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783432650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YifDnmK82gFn50n9gIPI//YYkdL4JukIrrg2Jw2g5D0=;
	b=f/p74NQGWjJ1JSiGxgZSaQ0XAuitEjQZF/i+mHFmh7OvZecl3T+YB5Y4kPEmp/A1cmc4EK
	Qhk1MZ4SSp3Au7Ra4bEGcbWO3bKRutqiXkcrcWFtRG139RbkqW8p1r1rq9UdY3BMVe0DGB
	2IKlC6svopgnTq4yGFP9I/RLF24MX9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YifDnmK82gFn50n9gIPI//YYkdL4JukIrrg2Jw2g5D0=;
	b=bZb6huuQ6ui3An99WiqPWURaeYQECZUJ7C1dkU4McVIQpyYsSugXD4k0psE5WSPsiw1TR9
	aPPX27ePEbvi8LAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47BE6779AE;
	Tue,  7 Jul 2026 13:57:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6DxSEMoFTWoFSgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Jul 2026 13:57:30 +0000
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
Subject: [PATCH 02/10] drm/client: Add acquire_outputs callback; implement for fbdev emulation
Date: Tue,  7 Jul 2026 15:38:09 +0200
Message-ID: <20260707135724.247562-3-tzimmermann@suse.de>
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
X-Spam-Score: -2.78
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-7878-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:jfalempe@redhat.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:lyude@redhat.com,m:dakr@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:amd-gfx@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	FREEMAIL_TO(0.00)[wunner.de,redhat.com,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,intel.com,ursulin.net,gmx.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB05B71C4BE

Add the callback acquire_outputs to drm_client_funcs to inform an internal
DRM client that vga-switcheroo is about to switch the physical outputs to
the client's device. Allows the client to prepare its internal state for
the upcoming switch.

Wire up the DRM client helpers to invoke the helper for a device's
clients.

Implement acquire_outputs for fbdev emulation. Invoke fb_switch_outputs(),
which remaps framebuffers to virtual terminals in fbcon. Currently this
is still being done by vga-switcheroo. With more DRM clients becoming
available, vga-switcheroo needs to become client agonostic.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_fbdev_client.c | 23 +++++++++++++++-------
 drivers/gpu/drm/drm_client_event.c         | 18 +++++++++++++++++
 include/drm/drm_client.h                   | 14 +++++++++++++
 include/drm/drm_client_event.h             |  3 +++
 4 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
index 91d196a397cf..827f32668714 100644
--- a/drivers/gpu/drm/clients/drm_fbdev_client.c
+++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
@@ -47,6 +47,14 @@ static int drm_fbdev_client_restore(struct drm_client_dev *client, bool force)
 	return 0;
 }
 
+static void drm_fbdev_client_acquire_outputs(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+
+	if (fb_helper->info)
+		fb_switch_outputs(fb_helper->info);
+}
+
 static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
@@ -95,13 +103,14 @@ static int drm_fbdev_client_resume(struct drm_client_dev *client)
 }
 
 static const struct drm_client_funcs drm_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.free		= drm_fbdev_client_free,
-	.unregister	= drm_fbdev_client_unregister,
-	.restore	= drm_fbdev_client_restore,
-	.hotplug	= drm_fbdev_client_hotplug,
-	.suspend	= drm_fbdev_client_suspend,
-	.resume		= drm_fbdev_client_resume,
+	.owner		 = THIS_MODULE,
+	.free		 = drm_fbdev_client_free,
+	.unregister	 = drm_fbdev_client_unregister,
+	.restore	 = drm_fbdev_client_restore,
+	.acquire_outputs = drm_fbdev_client_acquire_outputs,
+	.hotplug	 = drm_fbdev_client_hotplug,
+	.suspend	 = drm_fbdev_client_suspend,
+	.resume		 = drm_fbdev_client_resume,
 };
 
 /**
diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
index 7b3e362f7926..f0af584da23c 100644
--- a/drivers/gpu/drm/drm_client_event.c
+++ b/drivers/gpu/drm/drm_client_event.c
@@ -123,6 +123,24 @@ void drm_client_dev_restore(struct drm_device *dev, bool force)
 	mutex_unlock(&dev->clientlist_mutex);
 }
 
+void drm_client_dev_acquire_outputs(struct drm_device *dev)
+{
+	struct drm_client_dev *client;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return;
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry(client, &dev->clientlist, list) {
+		if (!client->funcs || !client->funcs->acquire_outputs)
+			continue;
+
+		client->funcs->acquire_outputs(client);
+	}
+	mutex_unlock(&dev->clientlist_mutex);
+}
+EXPORT_SYMBOL(drm_client_dev_acquire_outputs);
+
 static int drm_client_suspend(struct drm_client_dev *client)
 {
 	struct drm_device *dev = client->dev;
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 49a21f3dcb36..10a0cae3e48f 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -66,6 +66,20 @@ struct drm_client_funcs {
 	 */
 	int (*restore)(struct drm_client_dev *client, bool force);
 
+	/**
+	 * @acquire_outputs:
+	 *
+	 * Called by vga-switcheroo. Informs the client that the outputs will
+	 * be switched to its device. When @acquire_outputs runs, the outputs
+	 * have not been switched yet. The client should only prepare the software
+	 * state. After the switch happened, the client might get a hotplug
+	 * event to update the hardware state.
+	 *
+	 * This callback exists for remapping framebuffers to virtual terminals
+	 * in fbcon.
+	 */
+	void (*acquire_outputs)(struct drm_client_dev *client);
+
 	/**
 	 * @hotplug:
 	 *
diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_event.h
index 79369c755bc9..c93f404bae1d 100644
--- a/include/drm/drm_client_event.h
+++ b/include/drm/drm_client_event.h
@@ -11,6 +11,7 @@ struct drm_device;
 void drm_client_dev_unregister(struct drm_device *dev);
 void drm_client_dev_hotplug(struct drm_device *dev);
 void drm_client_dev_restore(struct drm_device *dev, bool force);
+void drm_client_dev_acquire_outputs(struct drm_device *dev);
 void drm_client_dev_suspend(struct drm_device *dev);
 void drm_client_dev_resume(struct drm_device *dev);
 #else
@@ -20,6 +21,8 @@ static inline void drm_client_dev_hotplug(struct drm_device *dev)
 { }
 static inline void drm_client_dev_restore(struct drm_device *dev, bool force)
 { }
+static inline void drm_client_dev_acquire_outputs(struct drm_device *dev)
+{ }
 static inline void drm_client_dev_suspend(struct drm_device *dev)
 { }
 static inline void drm_client_dev_resume(struct drm_device *dev)
-- 
2.54.0


