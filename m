Return-Path: <linux-fbdev+bounces-628-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B195831576
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jan 2024 10:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EF8B1C2099D
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jan 2024 09:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A97013ADC;
	Thu, 18 Jan 2024 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wCRqiS2F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/EsrBqym";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wCRqiS2F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/EsrBqym"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16353443D
	for <linux-fbdev@vger.kernel.org>; Thu, 18 Jan 2024 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705568846; cv=none; b=PGON9tsDgql1zQP+x4Sdb38Nf6+UJ1Da6aJx0PQRutbIBMnLT832CROfwqVau4ECCIShw7CfxTn+h8HNuKLTlwkCY82kRzSoMgpFr0a8G6eFs8hnkDpfdrngN9cA6dYpHi0SCkhzF0Q2ODcB/Af+/gJn8fo8/HZ/izaQTn2SMZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705568846; c=relaxed/simple;
	bh=vaN4w+9UKL/3Y2vs59sPGPx2ZTsxP4loHoAVH+T2hT4=;
	h=Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Spam-Level:X-Spam-Score:X-Spamd-Result:X-Spam-Flag; b=jmqioftXWH1QDNXzAcdPQUfhR/gfaNZ9PL/AWFMDOaWUa8qCRpGF3eHSqP77BYNmflYul2GJzdoqOobZjBrOOEpts/Nx5Hm2EB0z7ecKupwIuN7j//GqbGZGBstoHkLN5uJE2saNJgRSWSqbz7xNh+dJT0coiu477POghtFTXPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wCRqiS2F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/EsrBqym; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wCRqiS2F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/EsrBqym; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2955921F27;
	Thu, 18 Jan 2024 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705568843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QnvhJQPs+b8QWsB2oyvuRQ9Rd3DMaDHQ1+xP5TTdklI=;
	b=wCRqiS2FT5DlK/XBOZq/Y/aofvjkJ90BvT9JIzxP8Kkt1P/OAurUHHoiWaZGIWm9VwJ9Ws
	/wfeztu4ps8gsGZetQjd4Bgplg5C8Eri31Xm2IHYbHm1Vp35q5CUNS9Ju21P/awo15n9C0
	yL8cRoYEiYoinrZ0Apv8S8dY03pdLMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705568843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QnvhJQPs+b8QWsB2oyvuRQ9Rd3DMaDHQ1+xP5TTdklI=;
	b=/EsrBqyma2ccwOy0BgftxYHJcJjtEb2RlGwNAmwilboO64yBhfktLBSOkeGePmSJ1kMuXo
	yDfBrhGtUQ1BKYBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705568843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QnvhJQPs+b8QWsB2oyvuRQ9Rd3DMaDHQ1+xP5TTdklI=;
	b=wCRqiS2FT5DlK/XBOZq/Y/aofvjkJ90BvT9JIzxP8Kkt1P/OAurUHHoiWaZGIWm9VwJ9Ws
	/wfeztu4ps8gsGZetQjd4Bgplg5C8Eri31Xm2IHYbHm1Vp35q5CUNS9Ju21P/awo15n9C0
	yL8cRoYEiYoinrZ0Apv8S8dY03pdLMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705568843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QnvhJQPs+b8QWsB2oyvuRQ9Rd3DMaDHQ1+xP5TTdklI=;
	b=/EsrBqyma2ccwOy0BgftxYHJcJjtEb2RlGwNAmwilboO64yBhfktLBSOkeGePmSJ1kMuXo
	yDfBrhGtUQ1BKYBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5B5813874;
	Thu, 18 Jan 2024 09:07:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P0KFNkrqqGWIMgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jan 2024 09:07:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/3] video: Simplify Kconfig options
Date: Thu, 18 Jan 2024 10:05:25 +0100
Message-ID: <20240118090721.7995-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
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

v2:
	* support CONFIG_FB_CORE=m via IS_ENABLED() (kernel test robot)

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
 include/video/cmdline.h           |  8 ++-----
 11 files changed, 8 insertions(+), 65 deletions(-)


base-commit: 05b317e8457c8e2bd1a797c9440ec07b7f341584
-- 
2.43.0


