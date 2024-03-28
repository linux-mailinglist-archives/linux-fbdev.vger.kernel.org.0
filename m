Return-Path: <linux-fbdev+bounces-1577-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A977787FAF5
	for <lists+linux-fbdev@lfdr.de>; Tue, 19 Mar 2024 10:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C1521F2144D
	for <lists+linux-fbdev@lfdr.de>; Tue, 19 Mar 2024 09:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44787D071;
	Tue, 19 Mar 2024 09:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q0Cgf4cV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DCbnmhkI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q0Cgf4cV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DCbnmhkI"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DC453379
	for <linux-fbdev@vger.kernel.org>; Tue, 19 Mar 2024 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710841169; cv=none; b=cUgY8QRiUI68oaGB4tMrQA6XD5E93RJnBD5q5SqY4BuzL76G/s5Qt1/T/YgmVryodH0ANnWDglxk15C1xndWy6EUUozQbSOEfvOLfCHUxiGXXZ+JD9u49iQyzK1IfTbAz4sexM9JpGggSX0go6QOl3i4u22Ie6LF5V7FBVBJ/7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710841169; c=relaxed/simple;
	bh=HKnw7C4eWtSdq4lPuUfuRKifzgi2CLT9yTnkdhpsrIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DS0F2BURcYBZUMJfeL4gfOeW0+8LXDRvazhDz9OIDpMzoZ0rL4u0NJTtSM8FG0MrKJJElG7H7Q9Ows7K9L5lfdWla1ZH+dmkBMn2tkDRBYl8e+rMBHlUXYflvZJCPt0wPDbh8pR3HapuYtMssFhguIEZ+d2khtIzuTc/dpB3CjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q0Cgf4cV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DCbnmhkI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q0Cgf4cV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DCbnmhkI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 822825D40D;
	Tue, 19 Mar 2024 09:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710841159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsLgC6a7SLMWzCnsR8L8i4IJJpXfcwCqgqO3xARUgMw=;
	b=q0Cgf4cVKLh9CoqX7WY+E+NNbuXOFB4q5vx8GltZJugFNEKJXOEQXUl4aUJGPSMYTlEMa9
	pE7iVI9mJAxM9Aw3nkutJMLO63MbyhqdoOlPJfJWuA84VPEGL4vbPB/NAzPc+1hIynGw6l
	1RcDtd2BakdWSFmHIOWZHY/XuXStBV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710841159;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsLgC6a7SLMWzCnsR8L8i4IJJpXfcwCqgqO3xARUgMw=;
	b=DCbnmhkI+FTn+to9rEBVMAB0xkQgu1TOjIpPBO13yTdgWJoLMYmPPqAqFEQBzOaH+JRbGh
	jhjrAE8Ibtm2A6Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710841159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsLgC6a7SLMWzCnsR8L8i4IJJpXfcwCqgqO3xARUgMw=;
	b=q0Cgf4cVKLh9CoqX7WY+E+NNbuXOFB4q5vx8GltZJugFNEKJXOEQXUl4aUJGPSMYTlEMa9
	pE7iVI9mJAxM9Aw3nkutJMLO63MbyhqdoOlPJfJWuA84VPEGL4vbPB/NAzPc+1hIynGw6l
	1RcDtd2BakdWSFmHIOWZHY/XuXStBV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710841159;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsLgC6a7SLMWzCnsR8L8i4IJJpXfcwCqgqO3xARUgMw=;
	b=DCbnmhkI+FTn+to9rEBVMAB0xkQgu1TOjIpPBO13yTdgWJoLMYmPPqAqFEQBzOaH+JRbGh
	jhjrAE8Ibtm2A6Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3902213700;
	Tue, 19 Mar 2024 09:39:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2Ii/DEdd+WU6GAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 19 Mar 2024 09:39:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	andy@kernel.org,
	geert@linux-m68k.org,
	dan.carpenter@linaro.org,
	sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/6] staging: fbtft: Remove reference to fb_blank
Date: Tue, 19 Mar 2024 10:37:24 +0100
Message-ID: <20240319093915.31778-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319093915.31778-1-tzimmermann@suse.de>
References: <20240319093915.31778-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00];
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
	 R_RATELIMIT(0.00)[to_ip_from(RLe6e1dyhqp7xrfznmmjiny17d)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:email];
	 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-m68k.org,ravnborg.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[28.52%]
X-Spam-Flag: NO

The field fb_blank in struct backlight_properties is deprecated and
should not be used. Don't output its value in the driver's debug print.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/fbtft/fb_ssd1351.c | 4 +---
 drivers/staging/fbtft/fbtft-core.c | 5 ++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index 72172e870007e..ca2cba2185ae3 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -194,9 +194,7 @@ static int update_onboard_backlight(struct backlight_device *bd)
 	struct fbtft_par *par = bl_get_data(bd);
 	bool on;
 
-	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
-		      "%s: power=%d, fb_blank=%d\n",
-		      __func__, bd->props.power, bd->props.fb_blank);
+	fbtft_par_dbg(DEBUG_BACKLIGHT, par, "%s: power=%d\n", __func__, bd->props.power);
 
 	on = !backlight_is_blank(bd);
 	/* Onboard backlight connected to GPIO0 on SSD1351, GPIO1 unused */
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 3626f429b002c..5ca150c409c3c 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -133,9 +133,8 @@ static int fbtft_backlight_update_status(struct backlight_device *bd)
 	struct fbtft_par *par = bl_get_data(bd);
 	bool polarity = par->polarity;
 
-	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
-		      "%s: polarity=%d, power=%d, fb_blank=%d\n",
-		      __func__, polarity, bd->props.power, bd->props.fb_blank);
+	fbtft_par_dbg(DEBUG_BACKLIGHT, par, "%s: polarity=%d, power=%d\n", __func__,
+		      polarity, bd->props.power);
 
 	if (!backlight_is_blank(bd))
 		gpiod_set_value(par->gpio.led[0], polarity);
-- 
2.44.0


