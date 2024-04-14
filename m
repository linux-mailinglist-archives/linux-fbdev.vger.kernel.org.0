Return-Path: <linux-fbdev+bounces-1911-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5194689F36C
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 15:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7563B1C26B8B
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 13:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE2C15E810;
	Wed, 10 Apr 2024 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iu7pQJPv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="if4QqV3R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iu7pQJPv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="if4QqV3R"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB8815B995
	for <linux-fbdev@vger.kernel.org>; Wed, 10 Apr 2024 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754368; cv=none; b=mzIZw8x6vB9DEMP9w0z/nvRA05WUVQ2/sd7x7+wE4grged+9/b3GfojbgNhP8EPlQg49zmBayMsUT6kj/kQYssS4FBxYS3sI5Vx5dRY6SLQkRyEme05Q4J7QVligAaQh4ltHcyY6AXPYVZR5lOLDN21t2lDmp4SNJ1PCC8bjkTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754368; c=relaxed/simple;
	bh=N52aWKpglV8IBk938alokF4d/WbC9Zry5gD+EBVcZHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVARAbPnPZBV5v+HAoTCz4rYc1BonuPsGJQmQ4b9m13903Y+gmtktqNiUb2TqaIC+Er7VX0YrO3HLptv6SA8YkuHDGNlqtcozj9rkB+TrMVs+/demE1MTJEzLESw7NUhpSZyMK30tdNBvqpZrYTZHgZ/a08udAS+ScjwzYAr75s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Iu7pQJPv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=if4QqV3R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Iu7pQJPv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=if4QqV3R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 79ABF351EF;
	Wed, 10 Apr 2024 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712754363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YoOQGHHUnfMmOvOugi1BdFBr6ahWKUu5Rtgj79ZYMgI=;
	b=Iu7pQJPv2u6t4x18P0+UbG379rlePnz1dcWAsvJlp+WRvxQC/vB10f55jyYvhd6FNP66Xx
	bOtIWuCU5mydM3VUOi7LhmCk42Q6L+JHBpzxxcqp9SXQ7IDXK9+eaqTEhA2D/X6IOR2hqz
	tabZTw85UFRX5DwoVF0wN7w6MGuqqCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712754363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YoOQGHHUnfMmOvOugi1BdFBr6ahWKUu5Rtgj79ZYMgI=;
	b=if4QqV3RxKGekVOo2ya1BqUZrLTWlVO3ccjfaC85xlZdadII8VQCOD4WuhAlAdQ0jYtw0u
	ZpS3uBWq/1Yfy3Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712754363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YoOQGHHUnfMmOvOugi1BdFBr6ahWKUu5Rtgj79ZYMgI=;
	b=Iu7pQJPv2u6t4x18P0+UbG379rlePnz1dcWAsvJlp+WRvxQC/vB10f55jyYvhd6FNP66Xx
	bOtIWuCU5mydM3VUOi7LhmCk42Q6L+JHBpzxxcqp9SXQ7IDXK9+eaqTEhA2D/X6IOR2hqz
	tabZTw85UFRX5DwoVF0wN7w6MGuqqCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712754363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YoOQGHHUnfMmOvOugi1BdFBr6ahWKUu5Rtgj79ZYMgI=;
	b=if4QqV3RxKGekVOo2ya1BqUZrLTWlVO3ccjfaC85xlZdadII8VQCOD4WuhAlAdQ0jYtw0u
	ZpS3uBWq/1Yfy3Bw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 485BC1390D;
	Wed, 10 Apr 2024 13:06:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id AK59ELuOFmYdEgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 13:06:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 17/43] drm/tiny/simpledrm: Use fbdev-shmem
Date: Wed, 10 Apr 2024 15:02:13 +0200
Message-ID: <20240410130557.31572-18-tzimmermann@suse.de>
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
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]

Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 7ce1c46176750..3cb09ad5f7537 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -17,7 +17,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -1026,7 +1026,7 @@ static int simpledrm_probe(struct platform_device *pdev)
 	if (color_mode == 16)
 		color_mode = sdev->format->depth; // can be 15 or 16
 
-	drm_fbdev_generic_setup(dev, color_mode);
+	drm_fbdev_shmem_setup(dev, color_mode);
 
 	return 0;
 }
-- 
2.44.0


