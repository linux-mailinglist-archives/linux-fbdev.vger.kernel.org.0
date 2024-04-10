Return-Path: <linux-fbdev+bounces-1932-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A43AF89F387
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 15:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 596D2285C9E
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 13:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC3215D5A9;
	Wed, 10 Apr 2024 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nKoDLQ6E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pOV34fCL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VdBGtuVm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w+oxkaxB"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6225815ECDE
	for <linux-fbdev@vger.kernel.org>; Wed, 10 Apr 2024 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754373; cv=none; b=c9UHJLt3f81TS7w4j82YIAMOG2dbkDD4HiLl4HoXU8z4WzRDf+jqU4bLACZScx8erRm74Qb90XebVQyJMblwfacU9SNVE5wH0LTnCn0j0c6cPNPKAsMfeMbvA0N/kXINMWkzrQtJ3b0QFRwd0Z1VE5zCbUgWpUwmJperL02laNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754373; c=relaxed/simple;
	bh=foYrxd7XutSf6R7rnbX5HpBsQRr47SEpHxJzuipVOhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oc4j8/DAI3Vdl1zFajdvwUVmqPazPK2C2egmLmr8L0tT7AqChgWsKB910S3+bixYfeB+ZVkvhQSoz3IYqPvk2gCwRlQvJgiDp4jQ9G/Xq2ZvJBZEH3Z0YyGsAGiEDaxPiQBecDvqk57byXhr86FED4UOBBgDRDzyFhKVYt7K7kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nKoDLQ6E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pOV34fCL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VdBGtuVm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w+oxkaxB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9ECCF351DD;
	Wed, 10 Apr 2024 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712754370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhCaPHLYckLugEaZugbi45+6VCYmhSX+gQM4TCqfVuw=;
	b=nKoDLQ6ERYYBZ8vQHG2Ljrp998Yt87LPErZHC+84AvL+N+0oGUdBds4P8PivaQW/MT0PnE
	g2RTxH1JWvjiWkzA5qiHFJwd5BNDOpi/fSNSIRoLhd3ecyDdeh/6VMcigJAWr1mALA8vYI
	dmXWfP+zI7HxlV4iuPwqm5jBIm72Q/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712754370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhCaPHLYckLugEaZugbi45+6VCYmhSX+gQM4TCqfVuw=;
	b=pOV34fCLVKlKswMys1TMp+SKhSrUMzDYquu0lHVAtZp4K1EZ10pXOV5TaJS5QjRRs7SyKx
	98Wc3tYERDCe1ACg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712754369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhCaPHLYckLugEaZugbi45+6VCYmhSX+gQM4TCqfVuw=;
	b=VdBGtuVmQ2e5pW56H+2KuF8sKYYaTyIKd/uDAtqJjrn1+sWjSHxc+dmO8B4EeeOmEYaizq
	HlDhH6MhRhZsvkrKNEPIN9D8H1+Gi2F1GIexjBGtLWHh36bwvGGdbQoosAkkLm8HnX7jhF
	ZPl3izs7o8XIQS+lhu0gN6gHMLRdIB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712754369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhCaPHLYckLugEaZugbi45+6VCYmhSX+gQM4TCqfVuw=;
	b=w+oxkaxBD8h+REXE6W1xw/aBwC1+irEzAmHQc7fk71C6vB1UNVnScThpLz1Jw645cFpfhz
	x6MsXzNs0ZJCwQDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 69DBF13A94;
	Wed, 10 Apr 2024 13:06:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id aMmSGMGOFmYdEgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 13:06:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Lechner <david@lechnology.com>
Subject: [PATCH v2 40/43] drm/tiny/st7586: Use fbdev-dma
Date: Wed, 10 Apr 2024 15:02:36 +0200
Message-ID: <20240410130557.31572-41-tzimmermann@suse.de>
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns,suse.de:email,lechnology.com:email];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]

Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
damage handling, which is required by st7586. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Lechner <david@lechnology.com>
Acked-by: David Lechner <david@lechnology.com>
---
 drivers/gpu/drm/tiny/st7586.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 7336fa1ddaed1..9e080d3b084c5 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -16,7 +16,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -371,7 +371,7 @@ static int st7586_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, drm);
 
-	drm_fbdev_generic_setup(drm, 0);
+	drm_fbdev_dma_setup(drm, 0);
 
 	return 0;
 }
-- 
2.44.0


