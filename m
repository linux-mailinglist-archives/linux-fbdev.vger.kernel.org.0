Return-Path: <linux-fbdev+bounces-1903-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3D889F361
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 15:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B231284595
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 13:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747DA15E5CC;
	Wed, 10 Apr 2024 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zMvz7yLf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2DwYUiBw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zMvz7yLf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2DwYUiBw"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E0615CD6B
	for <linux-fbdev@vger.kernel.org>; Wed, 10 Apr 2024 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754367; cv=none; b=BdKt5VyL3aD4Co6hhGGhUPOKvYjx50h+poq1k2wbxTDPQB0UTHo94BDevAsoeQq/mH1OgRQZzEDhylR/5RMYwLmfNOdwfBbUXviw0A38b+ptRbjcb6/M7OIZQXsUTKTlmSVVqgZJ/veAzbYcZRxfhH9F8wvTW80kkPE5M43rutQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754367; c=relaxed/simple;
	bh=I6Ghdqo807nDw/c1rM3fI8ZYRSJwjMylucMyk64Hgyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=melGiPmQpAJQkubrG3Z8tZO2iXtNaJpkfMuIMBJnj7j5ftvM2jc7E5660PuEUX9Kn7HPvDhQhGNSyWzEwAolioo+WS6/QQhnNXxFakVqGWYlBhfyIzA16+s2Px71WO8nd56FKIdJ1frHpDAafBiHrT3K/FahdRR+V1mtoLCqp1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zMvz7yLf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2DwYUiBw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zMvz7yLf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2DwYUiBw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 502455CDA6;
	Wed, 10 Apr 2024 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712754362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9kP91tdGNhKAC328CN3lwrlaDPNz2PDvnM4NyGlv8o=;
	b=zMvz7yLfddT2pPwGfjtzb1L+2v52LQ12iT1AEd14z1s4JJZqXj6zLwxGRqFVDZaYPi1XfK
	Rb/lxTvKYf/lAGqje/dWcdKdiKmC4S0FRbPhUGyFduw+kfTk9rAJTaIJ3YbySzhNoLgk49
	ZMySS/MGMmK/fRFO1sfpmxza2UaneOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712754362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9kP91tdGNhKAC328CN3lwrlaDPNz2PDvnM4NyGlv8o=;
	b=2DwYUiBw6mnLzBUtgMZwRhgjca+Ehqe1m8CME9QrZ2qjf6ShiQBlYiOHKrIA8LuShqL2yG
	SAl6PyLkHNAV0JDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712754362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9kP91tdGNhKAC328CN3lwrlaDPNz2PDvnM4NyGlv8o=;
	b=zMvz7yLfddT2pPwGfjtzb1L+2v52LQ12iT1AEd14z1s4JJZqXj6zLwxGRqFVDZaYPi1XfK
	Rb/lxTvKYf/lAGqje/dWcdKdiKmC4S0FRbPhUGyFduw+kfTk9rAJTaIJ3YbySzhNoLgk49
	ZMySS/MGMmK/fRFO1sfpmxza2UaneOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712754362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9kP91tdGNhKAC328CN3lwrlaDPNz2PDvnM4NyGlv8o=;
	b=2DwYUiBw6mnLzBUtgMZwRhgjca+Ehqe1m8CME9QrZ2qjf6ShiQBlYiOHKrIA8LuShqL2yG
	SAl6PyLkHNAV0JDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 15B0813A94;
	Wed, 10 Apr 2024 13:06:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id SDMcBLqOFmYdEgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 13:06:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dave Airlie <airlied@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 12/43] drm/mgag200: Use fbdev-shmem
Date: Wed, 10 Apr 2024 15:02:08 +0200
Message-ID: <20240410130557.31572-13-tzimmermann@suse.de>
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
X-Spam-Score: -6.35
X-Spam-Level: 
X-Spamd-Result: default: False [-6.35 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.55)[97.97%];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns,suse.de:email];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]

Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 573dbe256aa8b..65f2ed18b31c5 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -12,7 +12,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
@@ -285,7 +285,7 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 * FIXME: A 24-bit color depth does not work with 24 bpp on
 	 * G200ER. Force 32 bpp.
 	 */
-	drm_fbdev_generic_setup(dev, 32);
+	drm_fbdev_shmem_setup(dev, 32);
 
 	return 0;
 }
-- 
2.44.0


