Return-Path: <linux-fbdev+bounces-1139-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4EE859FE9
	for <lists+linux-fbdev@lfdr.de>; Mon, 19 Feb 2024 10:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A5071F2233D
	for <lists+linux-fbdev@lfdr.de>; Mon, 19 Feb 2024 09:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57C723777;
	Mon, 19 Feb 2024 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f9PTN/7J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8da1tEb2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NVzSkbKf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dFN2S1vl"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7641124214
	for <linux-fbdev@vger.kernel.org>; Mon, 19 Feb 2024 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708335592; cv=none; b=gf3144znWvOU/G2V75ubQo2FLZagh1wCjy3bn5UKsFl+ythVU9nzIyFC3UMDEUZcgylXa3phceFpL2s7zlYoRXXSqeJyuWKVpvvHDgpLDBThqWCQYXMEMupygy8cZW9+YMFg0x02ocSexLtPDZeFvXe+Izqb7pGZcINfv6iDh3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708335592; c=relaxed/simple;
	bh=YomORlfB0OQOQYlT+defiuKrrZ6VEPVvzBi1wMArlVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9hi3510/O5JW3Ms7uMiDJsldM2cxQnUiyk1gFgjjt5FUOytz3JP0bcWy5KJHqptojcvibbMq+yiBxZKnpXXLzwBATsw3uIPnOaEI33a0hQw3M5igzuNUSNvAY15pMxp6ixvIVuR8Pr0+01y2NCGCkdxyhNyo+4BEbgfb4EUh6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f9PTN/7J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8da1tEb2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NVzSkbKf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dFN2S1vl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9DADF21FC5;
	Mon, 19 Feb 2024 09:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708335588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfmI2atJmbsgQRDKLbs9qliA1H9Vu+/49qKyasERxZs=;
	b=f9PTN/7JpUJZOZqvvXV7KeW9tiVpfGCfm1R2rSw3GbAYA8p8LRICq/2NGhvEIFvULAd3Ab
	CTILBj0X+MVrSPvUri/MMkfmwluubEuTHJn1QQo03S9p6ASBwynfHw6jvsr8jFxlke9m/M
	PEx+C/7aWCQ2GhB4mHuMr/b7DY/U8cw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708335588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfmI2atJmbsgQRDKLbs9qliA1H9Vu+/49qKyasERxZs=;
	b=8da1tEb2BuIPgh8vrg7JX/yFbbxplxri9dBZK+d4KNvGsyPbV3fp7TE0ns1Pt1Ehx0noEK
	sUuubbGhkS8uHgCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708335587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfmI2atJmbsgQRDKLbs9qliA1H9Vu+/49qKyasERxZs=;
	b=NVzSkbKfvdDrUw3WM+G3nVXoNRA0HBl4hmLT6cgcmp2nhpP8bzKI4dgoM2UTpSe1DtpzDw
	sSHIQ+SP/4prOTmSOYA2PtpkWJLQo5ehyHoDIt65iCH7nEhHoVOtDmo/m1omlwXnxQhVXG
	jdGBxBQqMGZ6esj32O85ZllxEgPdjbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708335587;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfmI2atJmbsgQRDKLbs9qliA1H9Vu+/49qKyasERxZs=;
	b=dFN2S1vlUhvF5g79rxZB9bDPfkmVARtNpzg8Yk+WJd03Q6NyxL4r1eO16D2nWEy7IyaqeQ
	MB4Pl4jwrUuzcVCw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 42F26139F7;
	Mon, 19 Feb 2024 09:39:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id gCAoD+Mh02XlUAAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 19 Feb 2024 09:39:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	kherbst@redhat.com,
	lyude@redhat.com,
	dakr@redhat.com,
	jani.nikula@linux.intel.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 2/9] drm/nouveau: Include <linux/backlight.h>
Date: Mon, 19 Feb 2024 10:37:27 +0100
Message-ID: <20240219093941.3684-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240219093941.3684-1-tzimmermann@suse.de>
References: <20240219093941.3684-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *
X-Spamd-Bar: +
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NVzSkbKf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dFN2S1vl
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.49 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_TO(0.00)[gmx.de,redhat.com,linux.intel.com,ffwll.ch,gmail.com,linuxfoundation.org];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[12.16%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,suse.de:dkim,suse.de:email,intel.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 1.49
X-Rspamd-Queue-Id: 9DADF21FC5
X-Spam-Flag: NO

Resolves the proxy include via <linux/fb.h>, which does not require the
backlight header.

v3:
	* fix grammar in commit message

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 8d37a694b7724..0c3d88ad0b0ea 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -28,6 +28,7 @@
 #include "wndw.h"
 #include "handles.h"
 
+#include <linux/backlight.h>
 #include <linux/dma-mapping.h>
 #include <linux/hdmi.h>
 #include <linux/component.h>
-- 
2.43.0


