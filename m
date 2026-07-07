Return-Path: <linux-fbdev+bounces-7882-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hDieNXkHTWpXtwEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7882-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 16:04:41 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DA071C4D4
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 16:04:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rNMil2yW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rPINwQjy;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rNMil2yW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rPINwQjy;
	dmarc=pass (policy=none) header.from=suse.de;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7882-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7882-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BC953014C7C
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 13:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF10422543;
	Tue,  7 Jul 2026 13:57:51 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA7412282
	for <linux-fbdev@vger.kernel.org>; Tue,  7 Jul 2026 13:57:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432671; cv=none; b=fp5Ic6eY8oSjM7ohLroM7c++1gQDH4sye2Re0eLIy577JUOvxVDQ+HNBMd+Lmwu2+UHbBtClw4NQDiOVPL3APjvKnQGNbabGXdpXYUDS5ijoomQ9i8D6UHl6NYCLD8eIMIroiu7DXI3ywV/TZtSiDNnAac6l2wE86h/SLr4KX+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432671; c=relaxed/simple;
	bh=DbwsCRcoTAOjVms7ueSh6LO/MWX8mL5tJW3hXS/rf+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZhi+zZVck0k1NH+vYnRbv4/N9tCuywmngVLRNmox8eQxABYjwbHpXHXY3uSTyP6fiR2LQSqm9ijyp4oldanYTLvqdPutnjb7aJ0NhlKUR5n/C3l7GTqY32WAtEQaSXMHhJ+SgIi6D6mDZB3dOueD1qs9km7AA6uGcN62Ga6fFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rNMil2yW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rPINwQjy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rNMil2yW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rPINwQjy; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A9692759E6;
	Tue,  7 Jul 2026 13:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783432653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qFUchqMhh+t88EmA37o1LKVkZo6s4o6ys1Cb0qM5+6w=;
	b=rNMil2yWhkhaOEzJSsGr929ThkYpkbds2CNXZLwyBehgqYMsr65/9OdLn9tERy76JYGWjq
	QnF+KAC39DFVdOZ1hUBTwrlggsoodT+mdvDbVDna7EU+grUWkc3Iaw4vbVT+pEPz+eBNCO
	p97WoHfwMtz5K5xk6JdRXSVN94MREmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qFUchqMhh+t88EmA37o1LKVkZo6s4o6ys1Cb0qM5+6w=;
	b=rPINwQjy0njGzzXFrtjih2udJr2gbC2XL9H3KDlMifpyy94/8D3CbykW0PCVnB8tqo6Fud
	SXcsjJjL4p3/DhDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783432653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qFUchqMhh+t88EmA37o1LKVkZo6s4o6ys1Cb0qM5+6w=;
	b=rNMil2yWhkhaOEzJSsGr929ThkYpkbds2CNXZLwyBehgqYMsr65/9OdLn9tERy76JYGWjq
	QnF+KAC39DFVdOZ1hUBTwrlggsoodT+mdvDbVDna7EU+grUWkc3Iaw4vbVT+pEPz+eBNCO
	p97WoHfwMtz5K5xk6JdRXSVN94MREmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qFUchqMhh+t88EmA37o1LKVkZo6s4o6ys1Cb0qM5+6w=;
	b=rPINwQjy0njGzzXFrtjih2udJr2gbC2XL9H3KDlMifpyy94/8D3CbykW0PCVnB8tqo6Fud
	SXcsjJjL4p3/DhDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 295C1779AF;
	Tue,  7 Jul 2026 13:57:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mLX0CM0FTWoFSgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Jul 2026 13:57:33 +0000
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
Subject: [PATCH 07/10] drm/nouveau: Implement vga_switcheroo_client_ops.pre_switch
Date: Tue,  7 Jul 2026 15:38:14 +0200
Message-ID: <20260707135724.247562-8-tzimmermann@suse.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-7882-lists,linux-fbdev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:from_mime,suse.de:email,suse.de:mid,suse.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94DA071C4D4

Call drm_client_dev_acquire_outputs() from vga_switcheroo's pre_switch
callback. Pushes fbcon updates from vga_switcheroo into DRM's fbdev
emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_vga.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index a6c375a24154..2d2d08be8fbe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -76,11 +76,20 @@ nouveau_switcheroo_can_switch(struct pci_dev *pdev)
 	return atomic_read(&drm->dev->open_count) == 0;
 }
 
+static void
+nouveau_switcheroo_pre_switch(struct pci_dev *pdev)
+{
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+
+	drm_client_dev_acquire_outputs(drm->dev);
+}
+
 static const struct vga_switcheroo_client_ops
 nouveau_switcheroo_ops = {
 	.set_gpu_state = nouveau_switcheroo_set_state,
 	.reprobe = nouveau_switcheroo_reprobe,
 	.can_switch = nouveau_switcheroo_can_switch,
+	.pre_switch = nouveau_switcheroo_pre_switch,
 };
 
 void
-- 
2.54.0


