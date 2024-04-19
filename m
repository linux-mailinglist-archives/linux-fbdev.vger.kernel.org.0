Return-Path: <linux-fbdev+bounces-2066-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BB08AAA51
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 10:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 265B01C21CD0
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 08:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165D869DFB;
	Fri, 19 Apr 2024 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HGjKTpIO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UmOVIj+m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HGjKTpIO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UmOVIj+m"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8824255E44
	for <linux-fbdev@vger.kernel.org>; Fri, 19 Apr 2024 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713515622; cv=none; b=O8Huk0W6axBB3aTXeqay7mp8Lau6nUXsazqKR43/vyhmGaNpacQ4FTUyfCEnhIR32umyJSJBi9e8LFDNUm7PMONWHzeCezPTCNZx/MFLCK8/JcumGmNcu1ejTJKOgzukKxPcskJZ1SQgv4lSjoEGXGN5x5GW52UKwCbHgyhVNWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713515622; c=relaxed/simple;
	bh=mgfXAa4608Ett7jGtwD/UvIeQMG79OASEu2Si0V2mbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GfoLu2f9FDjV9fPpisj/7hRC2CrWLB/PnI553hUk/jJa6vBUM7e7PpaGZ7Z3faKKiSqYmxDxJR6T86yfqz841DrnBJamMd8eBwK51ulWh9XYJQnwGcV0EFnxfn1NtWeQxb7yA3fjSWVf6g/gg4D15B+P4AbtajM2aP/sZ6/ps2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HGjKTpIO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UmOVIj+m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HGjKTpIO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UmOVIj+m; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A1DE15D486;
	Fri, 19 Apr 2024 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOubkzI8Ti2SXQMPzwTAhH3X+dqEqfDNmzI/jxTmhJo=;
	b=HGjKTpIO6VgAiSjqqYjhfyWfG9CnSqsq8oBtrXn1uIkqhxboLhOKFjZ4VBlxQKR/cBMBbH
	LHvMsnZvUeKKQsugPrRocOlK+muxp7TvcMSAaqb4Th8LisD/S8nayNt0RZgOzpsG8KTbHc
	FobOqjl8l9jAgTUJVnOOJKd2D8QYodA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515618;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOubkzI8Ti2SXQMPzwTAhH3X+dqEqfDNmzI/jxTmhJo=;
	b=UmOVIj+mluxhj21xTkWIa+ShlOh0e6vMoi8zPktsoHFHCHbevjpEvrKmkwqpSM8zFFfNjE
	MNGt33WAKT39p3BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOubkzI8Ti2SXQMPzwTAhH3X+dqEqfDNmzI/jxTmhJo=;
	b=HGjKTpIO6VgAiSjqqYjhfyWfG9CnSqsq8oBtrXn1uIkqhxboLhOKFjZ4VBlxQKR/cBMBbH
	LHvMsnZvUeKKQsugPrRocOlK+muxp7TvcMSAaqb4Th8LisD/S8nayNt0RZgOzpsG8KTbHc
	FobOqjl8l9jAgTUJVnOOJKd2D8QYodA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515618;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOubkzI8Ti2SXQMPzwTAhH3X+dqEqfDNmzI/jxTmhJo=;
	b=UmOVIj+mluxhj21xTkWIa+ShlOh0e6vMoi8zPktsoHFHCHbevjpEvrKmkwqpSM8zFFfNjE
	MNGt33WAKT39p3BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E4CA1395B;
	Fri, 19 Apr 2024 08:33:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uOLSGWIsImb9agAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 19 Apr 2024 08:33:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v3 10/43] drm/gud: Use fbdev-shmem
Date: Fri, 19 Apr 2024 10:29:03 +0200
Message-ID: <20240419083331.7761-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419083331.7761-1-tzimmermann@suse.de>
References: <20240419083331.7761-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-7.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email]
X-Spam-Score: -7.30
X-Spam-Flag: NO

Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Noralf Trønnes" <noralf@tronnes.org>
Acked-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 9d7bf8ee45f13..4f5aa2e5cb890 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -18,7 +18,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -622,7 +622,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	drm_kms_helper_poll_init(drm);
 
-	drm_fbdev_generic_setup(drm, 0);
+	drm_fbdev_shmem_setup(drm, 0);
 
 	return 0;
 }
-- 
2.44.0


