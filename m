Return-Path: <linux-fbdev+bounces-3497-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD0F9F2B1F
	for <lists+linux-fbdev@lfdr.de>; Mon, 16 Dec 2024 08:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CF8A164E1E
	for <lists+linux-fbdev@lfdr.de>; Mon, 16 Dec 2024 07:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262D11F7542;
	Mon, 16 Dec 2024 07:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m/p2ltQU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3nz2fXgx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m/p2ltQU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3nz2fXgx"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769651F7097
	for <linux-fbdev@vger.kernel.org>; Mon, 16 Dec 2024 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734335105; cv=none; b=tHcPM7dHZhBm7zuPZflErXUiFN/Sf3E/jd+EGVw81YUEst/mNRuS5j6mW0a6VZrf69UrvPqUIJP5b9i4yDs6QXL10UojA2t+pmWugBfI97hYOL7w54UEH6P/QZbE/GsaHlRKrWsmuMmz+6h8NiLWbIvYfKAsgmpnggG+0F/qjaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734335105; c=relaxed/simple;
	bh=7uTJ0FCbAuSF44PipioUkFizPMW1Qptr38vs0++S4DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4vB/O7DRKddHVaKiZf7igfrg0yUuygd8Kb1BXlo1RYu9pKNbhNJPVFapetRswKwnQdoL65yqC+QpELAYcBGtrHDk3ov5SVQA472YdGp1VJ9hdXhdd1pPc/IO6CAgtOqW0O0rjc/MFYWwHUDgOLUIUdMiIJUo01Lid3KMMqQ1aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m/p2ltQU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3nz2fXgx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m/p2ltQU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3nz2fXgx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AE3201F441;
	Mon, 16 Dec 2024 07:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734335101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErN9wcGBgiB6JprkFXTrxRToJxKIiYBt8gCDJYKfCZU=;
	b=m/p2ltQU07FOSRB/0oMKIbbKi0qbzJtaRXnTmnrjKmzo91ghJsUWwrxWX37v+aFW9fAbr5
	cNp5+8gyWon33wVe5J7wtlGzhgaR9d6t1Z2kJGJUAMQr8jbjzsqIeNL6AedHp7kxcL+WVh
	dCZGJHMOscWUC/sMLkGk94CqgLljSvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734335101;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErN9wcGBgiB6JprkFXTrxRToJxKIiYBt8gCDJYKfCZU=;
	b=3nz2fXgxmUgckT/dc1Y+F2wHfc+aBr5cjtyriaVo3Zo5anrzSfvl7SkJO5+DYXfFitEeMN
	l/sjuB4LUD6ZzWAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734335101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErN9wcGBgiB6JprkFXTrxRToJxKIiYBt8gCDJYKfCZU=;
	b=m/p2ltQU07FOSRB/0oMKIbbKi0qbzJtaRXnTmnrjKmzo91ghJsUWwrxWX37v+aFW9fAbr5
	cNp5+8gyWon33wVe5J7wtlGzhgaR9d6t1Z2kJGJUAMQr8jbjzsqIeNL6AedHp7kxcL+WVh
	dCZGJHMOscWUC/sMLkGk94CqgLljSvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734335101;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErN9wcGBgiB6JprkFXTrxRToJxKIiYBt8gCDJYKfCZU=;
	b=3nz2fXgxmUgckT/dc1Y+F2wHfc+aBr5cjtyriaVo3Zo5anrzSfvl7SkJO5+DYXfFitEeMN
	l/sjuB4LUD6ZzWAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F63313A62;
	Mon, 16 Dec 2024 07:45:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EOoXFn3aX2egZAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 16 Dec 2024 07:45:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	arnd@arndb.de,
	deller@gmx.de,
	jani.nikula@linux.intel.com,
	christophe.leroy@csgroup.eu,
	simona@ffwll.ch,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 3/3] drm: rework FB_CORE dependency
Date: Mon, 16 Dec 2024 08:42:49 +0100
Message-ID: <20241216074450.8590-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216074450.8590-1-tzimmermann@suse.de>
References: <20241216074450.8590-1-tzimmermann@suse.de>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,arndb.de,gmx.de,linux.intel.com,csgroup.eu,ffwll.ch,gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLykjg6e7ifkwtw7jmpw7b9yio)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
X-Spam-Flag: NO

From: Arnd Bergmann <arnd@arndb.de>

The 'select FB_CORE' statement moved from CONFIG_DRM to DRM_CLIENT_LIB,
but there are now configurations that have code calling into fb_core
as built-in even though the client_lib itself is a loadable module:

x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
drm_fb_helper.c:(.text+0x2c6): undefined reference to `fb_set_suspend'
x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
drm_fb_helper.c:(.text+0x2e1): undefined reference to `fb_set_suspend'

In addition to DRM_CLIENT_LIB, the 'select' needs to be at least in
DRM_KMS_HELPER and DRM_GEM_SHMEM_HELPER, so add it here.

This patch is the KMS_HELPER part of [1].

Fixes: dadd28d4142f ("drm/client: Add client-lib module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/series/141411/ # 1
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 55ce61a46984..2f51546b0b88 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -99,6 +99,7 @@ config DRM_KUNIT_TEST
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
+	select FB_CORE if DRM_FBDEV_EMULATION
 	help
 	  CRTC helpers for KMS drivers.
 
-- 
2.47.1


