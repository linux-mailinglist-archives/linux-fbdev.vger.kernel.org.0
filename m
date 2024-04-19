Return-Path: <linux-fbdev+bounces-2093-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7E88AAA77
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 10:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A18B9286A7B
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 08:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4466875801;
	Fri, 19 Apr 2024 08:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jRiRpBVt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WyJihx/1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jRiRpBVt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WyJihx/1"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1938E626CD
	for <linux-fbdev@vger.kernel.org>; Fri, 19 Apr 2024 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713515628; cv=none; b=NspQQ4fX+PgCOaqJ2T3sPajOeYZFd/LWRlfvW0P6W9vYVjVW0HOcUsnhyw9OAKJ499J6+u6ooH99w5V4/AxeTF01LGLT8/1CCorLtiio4HRvy+BWEjFJO8lvYxsL6vbpmwxFfPMvh8ENSH9+rHT7HJ88s8uGOTMYPmRa9NuhwJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713515628; c=relaxed/simple;
	bh=LXgHlEt00run0WmuIMZ1kh9CS943+x8d7mr9L+iJ9YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFBO5H2T6oy+HWcRvpB/jBe3Ot2FL126+pQTWjQFNchAYB2W7mGJsbqn/h9TNLCOavEueZkaDP7nJ9qRSu8yIlGsLtSDeEdhQBhpSBEl1hRYBEcYAuoLL9QrLUex2855fNluhK6cBun5FWf1f+NlC9Xmj3OyKcjZs8hJ0jpqwAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jRiRpBVt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WyJihx/1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jRiRpBVt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WyJihx/1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 29A585BFE7;
	Fri, 19 Apr 2024 08:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WcjgK/2mXk5oZLTXOxfBCr3nzfD6RAwVFVvrPNMD1Ps=;
	b=jRiRpBVt65EsRUmpriFWYs/OdBW3XEUXThZIT6pXBq9uz7C+f4wBF/ShlZ1LWKQsE6uPJ2
	gwyppE/E88TMlt/1YFMiZUAqziiQAqUw7Waf8eZ6jcEgZIeBmbvhFFYP4QUkIERrw7dG+c
	io4wGojO6dfHQvvWtjeRJwR3LnP8UtA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WcjgK/2mXk5oZLTXOxfBCr3nzfD6RAwVFVvrPNMD1Ps=;
	b=WyJihx/1hzUYIu/3AzVtCV6iMmU0L2kAXP9GXFXNCniZEx3213unJWzIbtAe770JjSC86w
	Mw5CPduiGUYrodAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WcjgK/2mXk5oZLTXOxfBCr3nzfD6RAwVFVvrPNMD1Ps=;
	b=jRiRpBVt65EsRUmpriFWYs/OdBW3XEUXThZIT6pXBq9uz7C+f4wBF/ShlZ1LWKQsE6uPJ2
	gwyppE/E88TMlt/1YFMiZUAqziiQAqUw7Waf8eZ6jcEgZIeBmbvhFFYP4QUkIERrw7dG+c
	io4wGojO6dfHQvvWtjeRJwR3LnP8UtA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WcjgK/2mXk5oZLTXOxfBCr3nzfD6RAwVFVvrPNMD1Ps=;
	b=WyJihx/1hzUYIu/3AzVtCV6iMmU0L2kAXP9GXFXNCniZEx3213unJWzIbtAe770JjSC86w
	Mw5CPduiGUYrodAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DCB451395B;
	Fri, 19 Apr 2024 08:33:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8A1LNGcsImb9agAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 19 Apr 2024 08:33:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 31/43] drm/rockchip: Use fbdev-dma
Date: Fri, 19 Apr 2024 10:29:24 +0200
Message-ID: <20240419083331.7761-32-tzimmermann@suse.de>
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
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: -7.30
X-Spam-Flag: NO

Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
damage handling, which is required by rockchip. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index ab55d71325500..44d769d9234d6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -18,7 +18,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
@@ -191,7 +191,7 @@ static int rockchip_drm_bind(struct device *dev)
 	if (ret)
 		goto err_kms_helper_poll_fini;
 
-	drm_fbdev_generic_setup(drm_dev, 0);
+	drm_fbdev_dma_setup(drm_dev, 0);
 
 	return 0;
 err_kms_helper_poll_fini:
-- 
2.44.0


