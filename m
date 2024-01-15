Return-Path: <linux-fbdev+bounces-569-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3C182D6D6
	for <lists+linux-fbdev@lfdr.de>; Mon, 15 Jan 2024 11:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1129EB2122E
	for <lists+linux-fbdev@lfdr.de>; Mon, 15 Jan 2024 10:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4ADF9D3;
	Mon, 15 Jan 2024 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DqUhaBZT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="klLfxqK4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DqUhaBZT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="klLfxqK4"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5BAF9C7
	for <linux-fbdev@vger.kernel.org>; Mon, 15 Jan 2024 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2A27F1FD2D;
	Mon, 15 Jan 2024 10:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705313381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aiip1690qBwMDq5oi95TJnhRlEt1LO5F56bqZ+XW3ew=;
	b=DqUhaBZTGK4SWNZc5dRdThM1HPC6huUG5gcdjmWlF9VGLlwvB3uLf1KPKFv3Nmr5WbXi0A
	aAt+UK8REoDwjGaXgG9TsjTbfHLsf5TFGDzqa9hnoRK37oxZdi3/aZshzB+/bfD1LbiGKs
	kYmfpi0f5YtedKd9UZEEiqZdT/8jHWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705313381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aiip1690qBwMDq5oi95TJnhRlEt1LO5F56bqZ+XW3ew=;
	b=klLfxqK4/2I3Ux9Ww2oO1raXJ56S5wQgKjJlwLjngbpLO/1kxoFAefkkX/utvycngyZKje
	6V0UVW29KFiwiuDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705313381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aiip1690qBwMDq5oi95TJnhRlEt1LO5F56bqZ+XW3ew=;
	b=DqUhaBZTGK4SWNZc5dRdThM1HPC6huUG5gcdjmWlF9VGLlwvB3uLf1KPKFv3Nmr5WbXi0A
	aAt+UK8REoDwjGaXgG9TsjTbfHLsf5TFGDzqa9hnoRK37oxZdi3/aZshzB+/bfD1LbiGKs
	kYmfpi0f5YtedKd9UZEEiqZdT/8jHWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705313381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aiip1690qBwMDq5oi95TJnhRlEt1LO5F56bqZ+XW3ew=;
	b=klLfxqK4/2I3Ux9Ww2oO1raXJ56S5wQgKjJlwLjngbpLO/1kxoFAefkkX/utvycngyZKje
	6V0UVW29KFiwiuDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EAAE6132FA;
	Mon, 15 Jan 2024 10:09:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 86AcOGQEpWWeJAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 15 Jan 2024 10:09:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] video: Simplify Kconfig options
Date: Mon, 15 Jan 2024 10:54:02 +0100
Message-ID: <20240115100939.21562-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[redhat.com,gmx.de,ffwll.ch,gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Replace CONFIG_VIDEO_CMDLINE and CONFIG_VIDEO_NOMODESET by the single
option CONFIG_VIDEO. Select the latter for DRM or fbdev. Both original
options used to be selected in most cases, so this change simplifies
the Kconfig rules.

Since commit ca6c080eef42 ("arch/parisc: Detect primary video device
from device instance") architecture helpers for fbdev do not longer
require fbdev in their implementation and could be used for non-fbdev
code as well. Eventually guarding them with CONFIG_VIDEO will make
them available to any subsystem.

Thomas Zimmermann (3):
  video/cmdline: Introduce CONFIG_VIDEO for video= parameter
  video/cmdline: Hide __video_get_options() behind CONFIG_FB_CORE
  video/nomodeset: Select nomodeset= parameter with CONFIG_VIDEO

 drivers/gpu/drm/Kconfig           |  3 +--
 drivers/staging/sm750fb/Kconfig   |  1 -
 drivers/video/Kconfig             |  5 +----
 drivers/video/Makefile            |  3 +--
 drivers/video/cmdline.c           |  2 ++
 drivers/video/fbdev/Kconfig       | 37 -------------------------------
 drivers/video/fbdev/core/Kconfig  |  2 +-
 drivers/video/fbdev/core/fbmem.c  |  2 --
 drivers/video/fbdev/geode/Kconfig |  3 ---
 include/linux/fb.h                |  7 ------
 include/video/cmdline.h           |  7 +-----
 11 files changed, 7 insertions(+), 65 deletions(-)


base-commit: 05b317e8457c8e2bd1a797c9440ec07b7f341584
-- 
2.43.0


