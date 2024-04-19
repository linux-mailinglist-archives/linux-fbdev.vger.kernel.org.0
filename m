Return-Path: <linux-fbdev+bounces-2075-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C40C8AAA5D
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 10:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45AAA28670A
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 08:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B29362170;
	Fri, 19 Apr 2024 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bzbJ6J2v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MDQgrv9L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bzbJ6J2v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MDQgrv9L"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C3E51004
	for <linux-fbdev@vger.kernel.org>; Fri, 19 Apr 2024 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713515625; cv=none; b=D+J1uZEtmrDWl8dncKMrnjN0ATGOIeFD6EQVPmbH36FkYLtes6pyl1NBB9ERnXXUmdEea5LtYlqbWldBNFdNIHzF5GYITdniiFwIS+QzWJLjJjNx87mlVQMcOJRtVtGeP4MlbE3MK+IRmD/MQNdzHDaqYmNhYJH0Hvz9E8CKGwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713515625; c=relaxed/simple;
	bh=33Hc6kQHOhEC2cb9jvmrWMEP5OB1ofx9Kbrvxwm3TZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uk3LoqVwXG2y3ZdNLgQO6DoX/RsCBx/WoqLuGmVivdevgTaF2PSVXddiSYz+7D3NcH0O0DgjnUzygRB9wg2zrD2Y1KnJClLRd4zlsDktnnOCWAaYokH/QBe41arEyUrXeCm6cX5OyruD/X8HKDlpYOhNv+d1aWk30PS/8L1U/98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bzbJ6J2v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MDQgrv9L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bzbJ6J2v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MDQgrv9L; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 43A065D489;
	Fri, 19 Apr 2024 08:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DvCfoGKB9m9bV6iNPkyb1lNEeXa+oHUo33MsbSAxBgw=;
	b=bzbJ6J2vtJ9mf0fzASHuLI9zybvGB7WN4QME5UnvABfUMO3xjdO1b733Yr4+ZpIJtMN+Fs
	qP2b4lVTkzZAAFQeitcztgJVUmrCpLgfqIbhvPUSKfyjp5e22ARPp0E7C8HPj9UoLbxZLh
	mEpB0xQ61oUf6ar47Ig3BSObvIGUfVE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515620;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DvCfoGKB9m9bV6iNPkyb1lNEeXa+oHUo33MsbSAxBgw=;
	b=MDQgrv9LVPy2l52Zwgsn74HCW/QIOGjCdUDddYXcJXD92g+TbxoddtiTN/zXowTx0OV7EE
	14yEPjbl50vs0PBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DvCfoGKB9m9bV6iNPkyb1lNEeXa+oHUo33MsbSAxBgw=;
	b=bzbJ6J2vtJ9mf0fzASHuLI9zybvGB7WN4QME5UnvABfUMO3xjdO1b733Yr4+ZpIJtMN+Fs
	qP2b4lVTkzZAAFQeitcztgJVUmrCpLgfqIbhvPUSKfyjp5e22ARPp0E7C8HPj9UoLbxZLh
	mEpB0xQ61oUf6ar47Ig3BSObvIGUfVE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515620;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DvCfoGKB9m9bV6iNPkyb1lNEeXa+oHUo33MsbSAxBgw=;
	b=MDQgrv9LVPy2l52Zwgsn74HCW/QIOGjCdUDddYXcJXD92g+TbxoddtiTN/zXowTx0OV7EE
	14yEPjbl50vs0PBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14F9113687;
	Fri, 19 Apr 2024 08:33:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MFYCBGQsImb9agAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 19 Apr 2024 08:33:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 17/43] drm/tiny/simpledrm: Use fbdev-shmem
Date: Fri, 19 Apr 2024 10:29:10 +0200
Message-ID: <20240419083331.7761-18-tzimmermann@suse.de>
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

Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 7ce1c46176750..3cb09ad5f7537 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -17,7 +17,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -1026,7 +1026,7 @@ static int simpledrm_probe(struct platform_device *pdev)
 	if (color_mode == 16)
 		color_mode = sdev->format->depth; // can be 15 or 16
 
-	drm_fbdev_generic_setup(dev, color_mode);
+	drm_fbdev_shmem_setup(dev, color_mode);
 
 	return 0;
 }
-- 
2.44.0


