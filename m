Return-Path: <linux-fbdev+bounces-7877-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xB+LJncHTWpVtwEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7877-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 16:04:39 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF0571C4CC
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 16:04:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gwrIWvSb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JaOr5OOU;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gwrIWvSb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JaOr5OOU;
	dmarc=pass (policy=none) header.from=suse.de;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7877-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7877-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95AAE300C99A
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 13:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D3F390228;
	Tue,  7 Jul 2026 13:57:39 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17E0169AD2
	for <linux-fbdev@vger.kernel.org>; Tue,  7 Jul 2026 13:57:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432659; cv=none; b=B2rlKwjH6kxnZ93RCHR2heBonYvFbf8Kz9n2htRJLDgKyKTQhlFxHJ1HeJxaPtWZjhlNnydok33Exow0tPm/jqJjwvT1fniP0NptE6UleL7ciqZmYDUrLEupkYmX2rUwoLUvDjXEs1LHehVJSpra65jwGwQ5UY6jYV6Jx1QVfAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432659; c=relaxed/simple;
	bh=Jt/8wZ8zyqV5SVWsj4mYDTX+b8iycCkK+UEdN7fFVSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQz0DjVbDXK9xq4cpqkElIsklxBaHJYROvzywaislCImGiG0Tvudh7+/a+EoJEnaV0Kj5km6mXaKHqv/dUJVqdGt3wqBYQn8++FOchEnhwyslYxCpnGbu+ZRWyTx5ayTD5fgXgtCkgshhXb77M58dxYcVmwqPJWLcWB33+12EA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gwrIWvSb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JaOr5OOU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gwrIWvSb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JaOr5OOU; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F3D8075D04;
	Tue,  7 Jul 2026 13:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783432652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3x/nwzHNwjl8rMP4EbLKJeAYZwQtIsLNzIZ+tShXfVU=;
	b=gwrIWvSbB0dBhtqTXpMOt16G9QZl0JFYpjc84JOc6tPoorjJQQZZTPYO9GD3txyAKtv0TB
	TaysjjMGtuaMO5SYGhCdLPZLirYYlzBikl9A2k9s5O9nZ4gOcD/TGI+rUcUQcjspsRhv4c
	9KYaEkQdgJ/mTsnt8TJi9wThmTjIM+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432652;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3x/nwzHNwjl8rMP4EbLKJeAYZwQtIsLNzIZ+tShXfVU=;
	b=JaOr5OOUXCxV/nN0qgSMZvs6InUBJSt9KBSbeSquxaL/DGJu8ANB1HtteWBkeJ8Xgpu9v6
	oGMMGUffNiyDhHAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783432652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3x/nwzHNwjl8rMP4EbLKJeAYZwQtIsLNzIZ+tShXfVU=;
	b=gwrIWvSbB0dBhtqTXpMOt16G9QZl0JFYpjc84JOc6tPoorjJQQZZTPYO9GD3txyAKtv0TB
	TaysjjMGtuaMO5SYGhCdLPZLirYYlzBikl9A2k9s5O9nZ4gOcD/TGI+rUcUQcjspsRhv4c
	9KYaEkQdgJ/mTsnt8TJi9wThmTjIM+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432652;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3x/nwzHNwjl8rMP4EbLKJeAYZwQtIsLNzIZ+tShXfVU=;
	b=JaOr5OOUXCxV/nN0qgSMZvs6InUBJSt9KBSbeSquxaL/DGJu8ANB1HtteWBkeJ8Xgpu9v6
	oGMMGUffNiyDhHAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D9BB779AE;
	Tue,  7 Jul 2026 13:57:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YG1kGcsFTWoFSgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Jul 2026 13:57:31 +0000
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
Subject: [PATCH 04/10] vga_switcheroo: Add post_switch callback to client ops
Date: Tue,  7 Jul 2026 15:38:11 +0200
Message-ID: <20260707135724.247562-5-tzimmermann@suse.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-7877-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:jfalempe@redhat.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:lyude@redhat.com,m:dakr@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:amd-gfx@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	FREEMAIL_TO(0.00)[wunner.de,redhat.com,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,intel.com,ursulin.net,gmx.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,suse.de:from_mime,suse.de:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EF0571C4CC

Add post_switch to struct vga_switcheroo_client_ops to inform the
switcheroo client about a completed switch of the output.

This callback is intended to replace the reprobe client op. It is a
rename of reprobe for consistency with pre_switch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/vga/vga_switcheroo.c |  4 +++-
 include/linux/vga_switcheroo.h   | 12 +++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index bdf1e56ae891..7b0af4a8aa7d 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -746,7 +746,9 @@ static int vga_switchto_stage2(struct vga_switcheroo_client *new_client)
 	if (ret)
 		return ret;
 
-	if (new_client->ops->reprobe)
+	if (new_client->ops->post_switch)
+		new_client->ops->post_switch(new_client->pdev);
+	else if (new_client->ops->reprobe)
 		new_client->ops->reprobe(new_client->pdev);
 
 	if (vga_switcheroo_pwr_state(active) == VGA_SWITCHEROO_ON)
diff --git a/include/linux/vga_switcheroo.h b/include/linux/vga_switcheroo.h
index d2ce30d8b6f7..38047fe6ea60 100644
--- a/include/linux/vga_switcheroo.h
+++ b/include/linux/vga_switcheroo.h
@@ -128,21 +128,22 @@ struct vga_switcheroo_handler {
  * 	Mandatory. This should not cut power to the discrete GPU,
  * 	which is the job of the handler
  * @gpu_bound: Optional. Called before switching the outputs to the device.
- * @reprobe: poll outputs.
- * 	Optional. This gets called after waking the GPU and switching
- * 	the outputs to it
+ * @reprobe: deprecated
  * @can_switch: check if the device is in a position to switch now.
  * 	Mandatory. The client should return false if a user space process
  * 	has one of its device files open
  * @pre_switch: prepare switch
  *	Optional. This gets called before switching the outputs to the
  *	GPU. Allows drivers to prepare for the switch.
+ * @post_switch: completes switch
+ *	Optional. This gets called after waking the GPU and switching
+ *	the outputs to it. Allows drivers to poll the switched outputs.
  * @gpu_bound: notify the client id to audio client when the GPU is bound.
  *
  * Client callbacks. A client can be either a GPU or an audio device on a GPU.
  * The @set_gpu_state and @can_switch methods are mandatory, @pre_switch and
- * @reprobe may be set to NULL. For audio clients, the @pre_switch and
- * @reprobe members are bogus. OTOH, @gpu_bound is only for audio clients,
+ * @post_switch may be set to NULL. For audio clients, the @pre_switch and
+ * @post_switch members are bogus. OTOH, @gpu_bound is only for audio clients,
  * and not used for GPU clients.
  */
 struct vga_switcheroo_client_ops {
@@ -150,6 +151,7 @@ struct vga_switcheroo_client_ops {
 	void (*reprobe)(struct pci_dev *dev);
 	bool (*can_switch)(struct pci_dev *dev);
 	void (*pre_switch)(struct pci_dev *dev);
+	void (*post_switch)(struct pci_dev *dev);
 	void (*gpu_bound)(struct pci_dev *dev, enum vga_switcheroo_client_id);
 };
 
-- 
2.54.0


