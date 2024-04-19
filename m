Return-Path: <linux-fbdev+bounces-2098-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE05D8AAA7F
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 10:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65781286BFA
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 08:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4316B762E5;
	Fri, 19 Apr 2024 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QLCBN3yi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LK24XKqJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QLCBN3yi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LK24XKqJ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0006A357
	for <linux-fbdev@vger.kernel.org>; Fri, 19 Apr 2024 08:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713515629; cv=none; b=RcTAXIZ2FXmdCJw4yvHaFK+GFy/ODw19u1o8QYb15JFzjk8nlAoOyVC2BA4y7rcV/btTecDzUB8ZkbetB9b/VxDHIbxKz7D+b6fz5uV6zr5YubKsHlmxUwAS+IR51StxOZkgjXsKJjSk1IwmWNDA7LQ0QpCJGCVdkwqupc/2VHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713515629; c=relaxed/simple;
	bh=b80KtZloTnnL8sFrNoRLWF2MXTOuBA/mQOsVo67Udfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHVdabEZETEKX4zY+Pwt+vFqRJCzOvnwaJtdGiNbomlNcwt4cghSwJIjjEfceoHHjp1uoewMM1xpO35pcMqL6jrPWca4B8CZj4h26xwGIP/KqtKxEKcs6QOCg94mSvwnEw4Z1Xtwqbj5kXz75uXcCJ0OQx+qRq4GqIC3EaLnO/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QLCBN3yi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LK24XKqJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QLCBN3yi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LK24XKqJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 511E25D484;
	Fri, 19 Apr 2024 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aDUscRulxHDSG9y8StHBsHaIBOmydO6AXiPPJ5dtd4M=;
	b=QLCBN3yil5iU1ppKqNkyUcpetJLdUmN9O20isDgCiTRGyhbtJSwzWqoBq736sVJGDwy2R1
	A7nG+KVXWJ54Miq/0+Dh74UGtwO1BLMUVRSC2I76aQJekGpDC68PHI266evyeo2tFCN3A2
	NQHt4/UTna3cG8fx2wbz+U/ve2ST//4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aDUscRulxHDSG9y8StHBsHaIBOmydO6AXiPPJ5dtd4M=;
	b=LK24XKqJnlnHmyZquurHt1QpwhTwxKhWSd8TzfFiNU8+Y5L6wq8Tft6GVpbCNc0mYY/Ty+
	qdI6/SW6pkuQKECw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aDUscRulxHDSG9y8StHBsHaIBOmydO6AXiPPJ5dtd4M=;
	b=QLCBN3yil5iU1ppKqNkyUcpetJLdUmN9O20isDgCiTRGyhbtJSwzWqoBq736sVJGDwy2R1
	A7nG+KVXWJ54Miq/0+Dh74UGtwO1BLMUVRSC2I76aQJekGpDC68PHI266evyeo2tFCN3A2
	NQHt4/UTna3cG8fx2wbz+U/ve2ST//4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aDUscRulxHDSG9y8StHBsHaIBOmydO6AXiPPJ5dtd4M=;
	b=LK24XKqJnlnHmyZquurHt1QpwhTwxKhWSd8TzfFiNU8+Y5L6wq8Tft6GVpbCNc0mYY/Ty+
	qdI6/SW6pkuQKECw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2076013687;
	Fri, 19 Apr 2024 08:33:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6PmtBmksImb9agAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 19 Apr 2024 08:33:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 36/43] drm/tiny/ili9486: Use fbdev-dma
Date: Fri, 19 Apr 2024 10:29:29 +0200
Message-ID: <20240419083331.7761-37-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419083331.7761-1-tzimmermann@suse.de>
References: <20240419083331.7761-1-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]

Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
damage handling, which is required by ili9486. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 938bceed59998..70d3662600410 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -16,7 +16,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
@@ -247,7 +247,7 @@ static int ili9486_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, drm);
 
-	drm_fbdev_generic_setup(drm, 0);
+	drm_fbdev_dma_setup(drm, 0);
 
 	return 0;
 }
-- 
2.44.0


