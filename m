Return-Path: <linux-fbdev+bounces-4740-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA9EB05A0F
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Jul 2025 14:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37F4417D742
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Jul 2025 12:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B005B665;
	Tue, 15 Jul 2025 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1qoy5yyD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4p61ylF6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p2FQEV9Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mv9tk6pI"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12DA2CA8
	for <linux-fbdev@vger.kernel.org>; Tue, 15 Jul 2025 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582615; cv=none; b=ImnL/LTBBBu/VRqfUs0WkvSkVpyBA40+MROiS0JTKTUF+l5nyl6aOKpj11txO1ZQq5ZjevCiCc5+BW5PzLC7Y/w1rf6Wtc3d68bFEJ5vAGGS8oZ+jXQqOte/RVo+aNDHLyDYaYAt/CPhJA9ZNLu6D84ntpJw23JmrvnOJTyc8BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582615; c=relaxed/simple;
	bh=I0kJnG9F+mx2reGUwPZhLVOqcsztEuv+ifPMS6lLxxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMjMYgK9eJzbsh2WVeKYFndy/qTPoJf+BcT0Byoy/gLhtYFvVBfvGlUCbMzB3hHz/sNox3FQaL1ICxS8vzsCXOwhmc0Oh9NYN2J74NnnSodwDjtVAhUmkCtepzBOhVhh3/KEU3A9jk1ubEUgthw2QhLNgCy+YY0yFIIe7vxmh7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1qoy5yyD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4p61ylF6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p2FQEV9Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mv9tk6pI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD4E31F795;
	Tue, 15 Jul 2025 12:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w+7AV6m26eDnZaYo3lt+2Nc7hfDztVQjKP71HKDd9A4=;
	b=1qoy5yyD+wmae9DMeiZOWHPUFwiebFpInHOn46FlRZBkL+aYvA+hQxLQ6eNU4WUt+koDNj
	UuHf2zSY+xa+/yvFmN9gaRXCP+vhWHizaFxV3ULU+zXkLAnt70ENhhYlyHFuPdR/S31y7Z
	GbVHqsMnSA/zvmTnAdPKzn4m3CLJcIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w+7AV6m26eDnZaYo3lt+2Nc7hfDztVQjKP71HKDd9A4=;
	b=4p61ylF6Sf1+rJ+G65nBEQEw/z6DKMgox9iextFt/Npjd5gPJKPL3PMetRX+sjNoiSuUVA
	FxroQ9G7K7AxU3Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w+7AV6m26eDnZaYo3lt+2Nc7hfDztVQjKP71HKDd9A4=;
	b=p2FQEV9ZakCQgWo+h2ra8t0/dEnKg+69weX0yrWlbs2N6+6mgwPycKnge1wv5YXmmOH6HH
	wUReuYc9jPiL+qxWBGdKKkPsOk0myy0Vuf0feQmLSFGsR3P6Zk77tmMHaKpM4xLcNDl4LT
	U00gC+illaYLcjGN+cwNmy2Ryq4fhmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w+7AV6m26eDnZaYo3lt+2Nc7hfDztVQjKP71HKDd9A4=;
	b=mv9tk6pIC7oNDy+HdN1h00ra1b4/86bWGd3hTXUqy2fPQLoEJfmp21uf3isF32bkyRsfPZ
	QJkNDmSitOYBi0Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DA4B13306;
	Tue, 15 Jul 2025 12:29:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qA6lDcRJdmgaIwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 12:29:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com,
	deller@gmx.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	fnkl.kernel@gmail.com,
	j@jannau.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sven@kernel.org,
	alyssa@rosenzweig.io,
	neal@gompa.dev,
	support.opensource@diasemi.com,
	duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/15] drm/panel: panel-summit: Include <linux/of.h>
Date: Tue, 15 Jul 2025 14:24:41 +0200
Message-ID: <20250715122643.137027-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715122643.137027-1-tzimmermann@suse.de>
References: <20250715122643.137027-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,gmx.de,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,diasemi.com,skole.hr];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLc48bcaq7qz9wekwjsx9fywoc)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.30

Include <linux/of.h> to declare device_property_read_u32() and
struct of_device_id. Avoids dependency on backlight header to include
it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Janne Grunau <j@jannau.net>
---
 drivers/gpu/drm/panel/panel-summit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel/panel-summit.c
index 4854437e2899..02aa1ec287d6 100644
--- a/drivers/gpu/drm/panel/panel-summit.c
+++ b/drivers/gpu/drm/panel/panel-summit.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/backlight.h>
+#include <linux/of.h>
 #include <drm/drm_device.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_mode.h>
-- 
2.50.0


