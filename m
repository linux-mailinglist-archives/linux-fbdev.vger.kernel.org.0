Return-Path: <linux-fbdev+bounces-1433-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5759879805
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 16:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72A86286C44
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 15:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB00A7D06A;
	Tue, 12 Mar 2024 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ad5xihgr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SMJLej9l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ad5xihgr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SMJLej9l"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB577D06D
	for <linux-fbdev@vger.kernel.org>; Tue, 12 Mar 2024 15:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710258524; cv=none; b=KkqYZ9pr7IMMWmqD8pmqMQ3+3A7zlQCNB2QgzObcA9//FDmcdUrVgiv9bx+Drv6r58Jas2YclCPpLqN9U1yig5OYv+hqJTL8WWUs4VNcS75w/Z7Gpm+ljFtG8OiEJaInTCUT7uO6QdJhylHIj3E7kqXnZCv1UlwTX08bcpK5Nog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710258524; c=relaxed/simple;
	bh=vhS/1pcV+esuIdHAcIrGhkY5l3Uq/y8OKi0L1nFKBnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XcxM22u4LYANoylcAXQlAi+9J0vzaDA+2ssqx+6Cw1WSfCAIfmFZ9K92x+gsjU2Tb45BkALBo2e9eu383QvFiQxF49Z3URSVWCvYaEV+CYgJ0LG0KNz0WW8r+lwy5rIjd6KlfKJ15dTS0E1jrFCCnzUdQf0U/m4uGg+08Yi0q2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ad5xihgr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SMJLej9l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ad5xihgr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SMJLej9l; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 233E13787D;
	Tue, 12 Mar 2024 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710258521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCFoZy+f3KLRfLlVyD5LLwS0Q9/kswDk6/pysa4U4Fs=;
	b=ad5xihgrd3zRjSN00rUiNcG5q/OB7InbE2MFEMy7LM+iYPfbmEpnVP/pcRcGcqRTuHG1S5
	yM4Le6dWs0TAt3D3ZQNZJ2I7ooqBMFjmedUOilI/k9zTfX8QmZfXRV1dl3jwGolRXekM94
	R0aJwVlPnuyTi65RDmipo21LGP9RF+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710258521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCFoZy+f3KLRfLlVyD5LLwS0Q9/kswDk6/pysa4U4Fs=;
	b=SMJLej9lZNQR4nWqse+7LBUXrvgMdzuHi8oy/u4sY0MdIDJBK3iV6Ngm7PStxKyND9HxJU
	i+u4wmSP+3atrLCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710258521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCFoZy+f3KLRfLlVyD5LLwS0Q9/kswDk6/pysa4U4Fs=;
	b=ad5xihgrd3zRjSN00rUiNcG5q/OB7InbE2MFEMy7LM+iYPfbmEpnVP/pcRcGcqRTuHG1S5
	yM4Le6dWs0TAt3D3ZQNZJ2I7ooqBMFjmedUOilI/k9zTfX8QmZfXRV1dl3jwGolRXekM94
	R0aJwVlPnuyTi65RDmipo21LGP9RF+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710258521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCFoZy+f3KLRfLlVyD5LLwS0Q9/kswDk6/pysa4U4Fs=;
	b=SMJLej9lZNQR4nWqse+7LBUXrvgMdzuHi8oy/u4sY0MdIDJBK3iV6Ngm7PStxKyND9HxJU
	i+u4wmSP+3atrLCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB98D1364F;
	Tue, 12 Mar 2024 15:48:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YM0vNFh58GUhPwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 12 Mar 2024 15:48:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 14/43] drm/tiny/cirrus: Use fbdev-shmem
Date: Tue, 12 Mar 2024 16:45:09 +0100
Message-ID: <20240312154834.26178-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312154834.26178-1-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.85 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 URIBL_BLOCKED(0.00)[suse.de:email];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.05)[59.53%]
X-Spam-Score: 0.85
X-Spam-Flag: NO

Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 4e3a152f897ac..3ac4f310aa2ad 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -31,7 +31,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
@@ -716,7 +716,7 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, 16);
+	drm_fbdev_shmem_setup(dev, 16);
 	return 0;
 }
 
-- 
2.44.0


