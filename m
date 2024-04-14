Return-Path: <linux-fbdev+bounces-1920-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 361FF89F377
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 15:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A1861C26C45
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 13:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E77E15B995;
	Wed, 10 Apr 2024 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cQTTyjBG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VK/lYJIF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cQTTyjBG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VK/lYJIF"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E9015B997
	for <linux-fbdev@vger.kernel.org>; Wed, 10 Apr 2024 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754371; cv=none; b=dXHzEtVz7D/7vvzNpFE0eQFYhsGVnp1Lk6Qktx4w7XbcX07y04kFuELAV1AJk8yrh6KOhp0Z751w/vEv2kgwIKzfbEkLIA1jBI93SmJDyfw12NUnpA0lBevgb9XfO2a4JupYHbRDCOYAq0ToNMeTeTzgJu0WA+KUeJfuUICH670=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754371; c=relaxed/simple;
	bh=Flu46HyLqa9jSJlFuH/x24joklcUsfbc8EUq4vY5sR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGoBwxKCTPLlFd74kl9c3WESwNRrZzW0lkhcpuBrpkISs+GdG2CJXN6ha3Kqipp1Gc7JUIVsdwHsPIZMZmTRk8Bgsi1F6sM9Kdo4JX0ddgFixonLnuOysQZvzCqsx0CH0MwXxyM4aScwt1vlfcaQPBlgBvj6bLA7cyxIdnIztsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cQTTyjBG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VK/lYJIF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cQTTyjBG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VK/lYJIF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A7BA55CDAC;
	Wed, 10 Apr 2024 13:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712754366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7LadRZny3k4R/CBaByjDEmLHdtbQrLK7OBOMPcqFWs=;
	b=cQTTyjBGP2Or375HDlB51UQBoCu+ERif6u8p6C1OP7qpiXm9nbG9LvC/Wn4ilbPAyoZYyy
	ErZHccttBY8u8h2uixYY1XVb8BU7d/WspVC819QTXqeRF46wj5smq5B6gsqPHSt4Cki41d
	DTeWSYP4tawuuwd9kLomumGNUFmWh0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712754366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7LadRZny3k4R/CBaByjDEmLHdtbQrLK7OBOMPcqFWs=;
	b=VK/lYJIFb6VrWa5biQAc4sIeLBn9jx5ZcHBvk5c1qf7CT9duddTjOGhjiU3D97oI/kBDl3
	5caXXn/k69Iu2SDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712754366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7LadRZny3k4R/CBaByjDEmLHdtbQrLK7OBOMPcqFWs=;
	b=cQTTyjBGP2Or375HDlB51UQBoCu+ERif6u8p6C1OP7qpiXm9nbG9LvC/Wn4ilbPAyoZYyy
	ErZHccttBY8u8h2uixYY1XVb8BU7d/WspVC819QTXqeRF46wj5smq5B6gsqPHSt4Cki41d
	DTeWSYP4tawuuwd9kLomumGNUFmWh0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712754366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7LadRZny3k4R/CBaByjDEmLHdtbQrLK7OBOMPcqFWs=;
	b=VK/lYJIFb6VrWa5biQAc4sIeLBn9jx5ZcHBvk5c1qf7CT9duddTjOGhjiU3D97oI/kBDl3
	5caXXn/k69Iu2SDQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B62713A94;
	Wed, 10 Apr 2024 13:06:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id kLEEGb6OFmYdEgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 13:06:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 28/43] drm/renesas/rcar-du: Use fbdev-dma
Date: Wed, 10 Apr 2024 15:02:24 +0200
Message-ID: <20240410130557.31572-29-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410130557.31572-1-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -5.30
X-Spam-Level: 
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns,ideasonboard.com:email,suse.de:email];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]

Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
damage handling, which is required by rcar-du. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index dee530e4c8b27..fb719d9aff10d 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -20,7 +20,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
@@ -716,7 +716,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 
 	drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
 
-	drm_fbdev_generic_setup(&rcdu->ddev, 32);
+	drm_fbdev_dma_setup(&rcdu->ddev, 32);
 
 	return 0;
 
-- 
2.44.0


