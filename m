Return-Path: <linux-fbdev+bounces-1444-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A38879815
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 16:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 493F81C21680
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 15:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786507D410;
	Tue, 12 Mar 2024 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dTU01CNk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6BIO59HQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dTU01CNk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6BIO59HQ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6587CF0C
	for <linux-fbdev@vger.kernel.org>; Tue, 12 Mar 2024 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710258528; cv=none; b=J7kAl3Twaq0Ydil4Rxav+N9mmdsQPxpdKuQusXRQuJ+3VJZloKzW6ixPtjxFx6kfe2ScywzNjvcgMrU9UT6SP+snF9gDCv5Oad3S1JHfQMiigDVyehB2Q6KLzzmR0xY5OevIBbLPygzrdDhuf+vsdd4lhP3ALiWBIc8LyUwlXvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710258528; c=relaxed/simple;
	bh=j7DhLNJErnXHb8xa/mA8KZ7Lo4L9KVUlvEytdVYSvzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXg6g+pBJXivAYehcxk6kNn27UMEetsQdHY//5xIWJxFBY+WqFixUTcUvgABhjvsv18ijU9NucjLvelPPOEDeFPYtchn7Q2mPAGuuSsivKqu7nT7z+Qp7JZAghs0PJ22wlAXfhxz6ruVmX3t0NSP0C4cwF4uPAaczdCEAnMUlZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dTU01CNk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6BIO59HQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dTU01CNk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6BIO59HQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 57F7137885;
	Tue, 12 Mar 2024 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710258524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfufjkwGXb5Pn8U6FMPt4Da/+UPWAw7LVvCmTgBaxu4=;
	b=dTU01CNk/zRfFBtDLHTwmN0FhzBLgARBPkUwZjMCmlLbWWc+EEnQLhm7s0eo0fj0rqoXLk
	nd+NpqiLTgEmbVYc33zGO+DmDxaHabh8mzf3LsAugRGcXX6wBS5WIhl779CuxP0g3cX6+J
	fhCVJoZxZ2vuAmdgOW1mFzTr7Xvwmrk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710258524;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfufjkwGXb5Pn8U6FMPt4Da/+UPWAw7LVvCmTgBaxu4=;
	b=6BIO59HQzPZ2UBre/tDfnBDx6YYuJdf2MkUkMdOouwIDnl58ntKa4AuI3TlTT2Tts20faW
	dwl5u1x5kw7gAQDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710258524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfufjkwGXb5Pn8U6FMPt4Da/+UPWAw7LVvCmTgBaxu4=;
	b=dTU01CNk/zRfFBtDLHTwmN0FhzBLgARBPkUwZjMCmlLbWWc+EEnQLhm7s0eo0fj0rqoXLk
	nd+NpqiLTgEmbVYc33zGO+DmDxaHabh8mzf3LsAugRGcXX6wBS5WIhl779CuxP0g3cX6+J
	fhCVJoZxZ2vuAmdgOW1mFzTr7Xvwmrk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710258524;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfufjkwGXb5Pn8U6FMPt4Da/+UPWAw7LVvCmTgBaxu4=;
	b=6BIO59HQzPZ2UBre/tDfnBDx6YYuJdf2MkUkMdOouwIDnl58ntKa4AuI3TlTT2Tts20faW
	dwl5u1x5kw7gAQDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01EB413976;
	Tue, 12 Mar 2024 15:48:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oFu1Olt58GUhPwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 12 Mar 2024 15:48:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH 24/43] drm/imx/lcdc: Use fbdev-dma
Date: Tue, 12 Mar 2024 16:45:19 +0100
Message-ID: <20240312154834.26178-25-tzimmermann@suse.de>
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
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.82
X-Spamd-Result: default: False [-0.82 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,suse.de,kernel.org,pengutronix.de,gmail.com,nxp.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.52)[80.26%]
X-Spam-Flag: NO

Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
damage handling, which is required by lcdc. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 43ddf3a9810b6..36668455aee8c 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -5,7 +5,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -501,7 +501,7 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Cannot register device\n");
 
-	drm_fbdev_generic_setup(drm, 0);
+	drm_fbdev_dma_setup(drm, 0);
 
 	return 0;
 }
-- 
2.44.0


