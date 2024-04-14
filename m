Return-Path: <linux-fbdev+bounces-1926-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E668189F37F
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 15:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A277528580B
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 13:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB0F15E205;
	Wed, 10 Apr 2024 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HUrsX0KU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PR1hNMpx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HUrsX0KU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PR1hNMpx"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7157715D5D8
	for <linux-fbdev@vger.kernel.org>; Wed, 10 Apr 2024 13:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754372; cv=none; b=KJKIYdewrxK7QZdDCFUjXjSKNgjVbEIOT6KAqQEWa3I1gqhBVzhaKiINxeeyyAJ0uKcT6rtNfaNuIDIYx4okbzQaZCEme32YYo06g/EGTqwifGpHGIQqyG3vHyI9rLdUxtyN6P83Dyf6dO+VoGAvr48VZigqrQhecN+//Dvq1x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754372; c=relaxed/simple;
	bh=Tt93g/dmtAQ8tixrVaXUe39cM8/ZXdD6bzvaGO0DHEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glfa1oESSkhFem8WM+EQpsJgvPnJYLqJlTjA9+MlTO4G3rFTh8VHesfhmceeQJkM3HSkOUVpDUojuarvQsCCIKK0jsDcmruxeA2dTGC/7QfSaC+eZv76GIdGm1A254y9cJWsYj6U9wYppynii/YsTKy1aw5TEbHjgSpqei0IUUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HUrsX0KU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PR1hNMpx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HUrsX0KU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PR1hNMpx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A5F085CDA9;
	Wed, 10 Apr 2024 13:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712754368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmLyjBIU+sa+KC6TShmVXNvGuSHoNkmIJLCbXbUAGms=;
	b=HUrsX0KUQZ03cvP7+LLSH07oZhZE6S42IizXwwqyQnMgKIeqdqpht8bjObcQshopmvyGLj
	8M1NE5MmGaPSF4dXPmwzsMd/YzoYEI1xPrYyo48w1IfTvRFFCQpgAYxynA5l1DUJz0+RAI
	CIyAvCynpPmpPZVJBTMDBpIVj7/SuIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712754368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmLyjBIU+sa+KC6TShmVXNvGuSHoNkmIJLCbXbUAGms=;
	b=PR1hNMpx0TkEQYv4Bk4lYyDxBjwxt1nP/TWOcVyl4co1gmRRJ9OLLzqcjyotv4KdcoP26i
	mthCRdVftDQ9nMDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712754368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmLyjBIU+sa+KC6TShmVXNvGuSHoNkmIJLCbXbUAGms=;
	b=HUrsX0KUQZ03cvP7+LLSH07oZhZE6S42IizXwwqyQnMgKIeqdqpht8bjObcQshopmvyGLj
	8M1NE5MmGaPSF4dXPmwzsMd/YzoYEI1xPrYyo48w1IfTvRFFCQpgAYxynA5l1DUJz0+RAI
	CIyAvCynpPmpPZVJBTMDBpIVj7/SuIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712754368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmLyjBIU+sa+KC6TShmVXNvGuSHoNkmIJLCbXbUAGms=;
	b=PR1hNMpx0TkEQYv4Bk4lYyDxBjwxt1nP/TWOcVyl4co1gmRRJ9OLLzqcjyotv4KdcoP26i
	mthCRdVftDQ9nMDQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7461C13AA2;
	Wed, 10 Apr 2024 13:06:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id oApEG8COFmYdEgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 13:06:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 36/43] drm/tiny/ili9486: Use fbdev-dma
Date: Wed, 10 Apr 2024 15:02:32 +0200
Message-ID: <20240410130557.31572-37-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns,suse.de:email];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
damage handling, which is required by ili9486. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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


