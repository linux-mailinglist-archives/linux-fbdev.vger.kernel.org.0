Return-Path: <linux-fbdev+bounces-1457-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7BB879821
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 16:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 106E81F21983
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 15:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A047E0F5;
	Tue, 12 Mar 2024 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BkHA+x4q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G6C1cQOz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BkHA+x4q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G6C1cQOz"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB987E0EC
	for <linux-fbdev@vger.kernel.org>; Tue, 12 Mar 2024 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710258531; cv=none; b=EwmKiaKhD28FFrZHObwVTzMqEXWYpD6htnYk7i7RQtKC6MdYgOuvdWe/L+gj+U1SnKYhJVY74G4+WiMn6eKIIKyCuYDJKQFVwUdbziitguqyKOO7bolSoFsm3KZR/oCTCvKdN19k5rjBib3UTM+8iIbcveSX+7kcwbENAMQchlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710258531; c=relaxed/simple;
	bh=bCdYX+iRzY2W/RGGKRzc8GWvCe3VZQszDyoILJuFguI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jFgAEHktuSu86X1T1GtFB5QYVTgI3Md4uUYTXGLN5AYmJBO1qgDImEB7fE0ysBjB8VMOe90T5Abk8xIwJAoQWHLSfJglQznUfWXEI2+UvdH+AVNEv7rIbSapoWzdNnM1uRt7jYNHL04pRcyhrKw2DMUlYhNR7rLJwrP1MKGBbew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BkHA+x4q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G6C1cQOz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BkHA+x4q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G6C1cQOz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4DEDC5D6DC;
	Tue, 12 Mar 2024 15:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710258528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wIfRgXFHI6e23AJk9Ot5gFyI+o9MU8+1XMdOA9YrSM=;
	b=BkHA+x4qnPArHle+ZeJI8BpKcHRPUZlH+tzERZxXiZOj6t46ASsuFGCqdOEaauz/ffh0by
	HgE8uyq+6acJYmphWHaa5uKhnRmCQupFnuBATKXp89QAU+FFSkhHzNu6VekAp3+Irha9Ah
	uHx0dwUXXtEVJ0FNSMGCErlVDbFEr2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710258528;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wIfRgXFHI6e23AJk9Ot5gFyI+o9MU8+1XMdOA9YrSM=;
	b=G6C1cQOz1Owua1GyGGOt+6O2xhPqYVAngfGe2Yiw118QLOoTfP1sQr4euFdAmQusGA4k7Y
	vJNdck6VgS1vHjAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710258528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wIfRgXFHI6e23AJk9Ot5gFyI+o9MU8+1XMdOA9YrSM=;
	b=BkHA+x4qnPArHle+ZeJI8BpKcHRPUZlH+tzERZxXiZOj6t46ASsuFGCqdOEaauz/ffh0by
	HgE8uyq+6acJYmphWHaa5uKhnRmCQupFnuBATKXp89QAU+FFSkhHzNu6VekAp3+Irha9Ah
	uHx0dwUXXtEVJ0FNSMGCErlVDbFEr2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710258528;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wIfRgXFHI6e23AJk9Ot5gFyI+o9MU8+1XMdOA9YrSM=;
	b=G6C1cQOz1Owua1GyGGOt+6O2xhPqYVAngfGe2Yiw118QLOoTfP1sQr4euFdAmQusGA4k7Y
	vJNdck6VgS1vHjAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03D521364F;
	Tue, 12 Mar 2024 15:48:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kNAYO1958GUhPwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 12 Mar 2024 15:48:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 37/43] drm/tiny/mi0283qt: Use fbdev-dma
Date: Tue, 12 Mar 2024 16:45:32 +0100
Message-ID: <20240312154834.26178-38-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312154834.26178-1-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.31
X-Spamd-Result: default: False [-4.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[51.48%]
X-Spam-Flag: NO

Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
damage handling, which is required by mi0283qt. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Noralf Trønnes" <noralf@tronnes.org>
---
 drivers/gpu/drm/tiny/mi0283qt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index 01ff43c8ac3ff..e46581d74c257 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -15,7 +15,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
@@ -226,7 +226,7 @@ static int mi0283qt_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, drm);
 
-	drm_fbdev_generic_setup(drm, 0);
+	drm_fbdev_dma_setup(drm, 0);
 
 	return 0;
 }
-- 
2.44.0


