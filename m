Return-Path: <linux-fbdev+bounces-1449-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43365879817
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 16:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F33F7286F4B
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 15:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384177E0E3;
	Tue, 12 Mar 2024 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SvT+OA2Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RYrJKX+B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SvT+OA2Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RYrJKX+B"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AD87D3FF
	for <linux-fbdev@vger.kernel.org>; Tue, 12 Mar 2024 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710258529; cv=none; b=f3LabU0JS7dwv4xqhieUYV0QxHviaaGRKNacpRYw1RSHxsadgNuT7IWOg5ldMw1FiLI2voIgQehUAXOyDad95J791Npj0APagV4Oa9WJKwCSyKIySmQiAWunwfRRKsAQ006dZE+WnYgz/t2ThW5cuVWSvKwz8+por8lobepf57Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710258529; c=relaxed/simple;
	bh=bS0SDVlJ8KrEnZ5aE3lx2PonwpkBw0TLY2m+oHAmrjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BtbKsTgsrEFws+6Qd6yJZ5zlTAKsJUPkLVP5r+4n8N0cyw81FLQv0tUY8Nfvw4uHn8YClUn8es8auok7W8Bu0QYyCgSsDZAA3KAPqJl40/NSXfEKFIHobpmr/ZDBHoDbWDU7LyFPJTe4/By0Vpz64vepzPLd7j7HGA1TS6cZksU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SvT+OA2Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RYrJKX+B; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SvT+OA2Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RYrJKX+B; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9FC6D5D6CC;
	Tue, 12 Mar 2024 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710258524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OXFdnlzdGByMsY9pFY4Mifj9IG/C+80tZQ/+RvnyxIQ=;
	b=SvT+OA2YXGzj7VDfc3xYhA91jCM1ikkj50IGTWz+aLsoiyP02BcUMeFDg5Y8PK+4qnZhRk
	hZp0u2uCcOJc2CauIWf57joHLf8l9DUX3VeJCQjbyCeksmT30kXWth6eU3MM0A7Itzw9EL
	vG2Pfj6tJI7NqioaT2lWQT0SOJOZG+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710258524;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OXFdnlzdGByMsY9pFY4Mifj9IG/C+80tZQ/+RvnyxIQ=;
	b=RYrJKX+BJkE/nOx1AX2hgXoeC01UnQEJvxN9HZGtP436j9cAnyvx4MBnePX5SAEIfToy48
	4/tPHKiUCHomiZDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710258524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OXFdnlzdGByMsY9pFY4Mifj9IG/C+80tZQ/+RvnyxIQ=;
	b=SvT+OA2YXGzj7VDfc3xYhA91jCM1ikkj50IGTWz+aLsoiyP02BcUMeFDg5Y8PK+4qnZhRk
	hZp0u2uCcOJc2CauIWf57joHLf8l9DUX3VeJCQjbyCeksmT30kXWth6eU3MM0A7Itzw9EL
	vG2Pfj6tJI7NqioaT2lWQT0SOJOZG+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710258524;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OXFdnlzdGByMsY9pFY4Mifj9IG/C+80tZQ/+RvnyxIQ=;
	b=RYrJKX+BJkE/nOx1AX2hgXoeC01UnQEJvxN9HZGtP436j9cAnyvx4MBnePX5SAEIfToy48
	4/tPHKiUCHomiZDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F6661364F;
	Tue, 12 Mar 2024 15:48:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mLf5FVx58GUhPwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 12 Mar 2024 15:48:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 25/43] drm/ingenic: Use fbdev-dma
Date: Tue, 12 Mar 2024 16:45:20 +0100
Message-ID: <20240312154834.26178-26-tzimmermann@suse.de>
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
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 URIBL_BLOCKED(0.00)[suse.de:email,crapouillou.net:email];
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
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[33.51%]
X-Spam-Score: 0.90
X-Spam-Flag: NO

Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
damage handling, which is required by ingenic. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 0751235007a7e..39fa291f43dd1 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -31,7 +31,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_fb_dma_helper.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -1399,7 +1399,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		goto err_clk_notifier_unregister;
 	}
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_dma_setup(drm, 32);
 
 	return 0;
 
-- 
2.44.0


