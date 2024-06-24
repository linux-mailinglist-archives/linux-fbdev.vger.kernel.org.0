Return-Path: <linux-fbdev+bounces-2617-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0132915253
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jun 2024 17:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D975285EE5
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jun 2024 15:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BFE19B5B6;
	Mon, 24 Jun 2024 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ew/D9iZb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MNhhN1JB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ew/D9iZb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MNhhN1JB"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152D31DFEA;
	Mon, 24 Jun 2024 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719242909; cv=none; b=D2m8uP09dz0zdzD8jauKZkoRnrL0RYr9ZdJyq1ZhVF71TMQE9h2Xvlkf/U8Og7Hf32zPekzFx+fT99jNy4CHgR0CH0bvSr59oYJwcrJKoIDUf70unofNI+zCfW2kezxqOlnEuro84iLLklTLqOCM1KfeEWTc81KZKRQOdjL1lgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719242909; c=relaxed/simple;
	bh=vr+RiDJl7SgVHky0afzslQhrgrRyTKEsA9ZGOlXDfiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E2gnf0FfPPPI5OVxFdFSn2vnIjIxKBnskUbR5OmYlPjKer1IuUavX5ktwNiiq6ZKTzPN6+3WzDor8W7Mdk4yJ7iT4XG4doMbGICy21sj5YSqvYvU3XjtE+hbEEYlyAUeXRaR0NGfJ2wML0JaQBGJAnETygMRIOHunUWOov9OCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ew/D9iZb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MNhhN1JB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ew/D9iZb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MNhhN1JB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 87F9921A9A;
	Mon, 24 Jun 2024 15:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719242437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pvh9Iuhb+qDZ3VUZ19jQr0U88LS2BndpQO41VU2M4Js=;
	b=ew/D9iZbaWaiWdPTIJuJHdSdr3ctDMYFLxEeAH30qZIXgTobA17bB6V+Y9tD0834e3tdZu
	1cPxoTqbRpuQYkcOwsK14STVUUJiq4iaDoClkX7HbelBg55cXoE4GAq5Q2CHn9SkkEqv54
	XQg9ZCpn5+2sts08fKmCy5WO+PytGUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719242437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pvh9Iuhb+qDZ3VUZ19jQr0U88LS2BndpQO41VU2M4Js=;
	b=MNhhN1JBhiH3BpPcm0HNX5JaWgFnWhBVQjfGLqGFnZxf9XQ6ETzEa0rdGxw/86GcOlGJ8l
	iFeGIHyYA7A5M8Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719242437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pvh9Iuhb+qDZ3VUZ19jQr0U88LS2BndpQO41VU2M4Js=;
	b=ew/D9iZbaWaiWdPTIJuJHdSdr3ctDMYFLxEeAH30qZIXgTobA17bB6V+Y9tD0834e3tdZu
	1cPxoTqbRpuQYkcOwsK14STVUUJiq4iaDoClkX7HbelBg55cXoE4GAq5Q2CHn9SkkEqv54
	XQg9ZCpn5+2sts08fKmCy5WO+PytGUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719242437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pvh9Iuhb+qDZ3VUZ19jQr0U88LS2BndpQO41VU2M4Js=;
	b=MNhhN1JBhiH3BpPcm0HNX5JaWgFnWhBVQjfGLqGFnZxf9XQ6ETzEa0rdGxw/86GcOlGJ8l
	iFeGIHyYA7A5M8Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3695613AA4;
	Mon, 24 Jun 2024 15:20:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hT/9C8WOeWbqGgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 24 Jun 2024 15:20:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	sam@ravnborg.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	linus.walleij@linaro.org,
	f.suligoi@asem.it,
	ukleinek@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/17] backlight: Introduce power-state constants
Date: Mon, 24 Jun 2024 17:19:55 +0200
Message-ID: <20240624152033.25016-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,ravnborg.org,gmail.com,gmx.de,asem.it];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]

The backlight code currently uses fbdev's FB_BLANK_ constants to
represent power states UNBLANK and POWERDOWN. Introduce dedicated
backlight constants to remove this dependency on fbdev.

Patch 1 introduces BACKLIGHT_POWER_ON and BACKLIGHT_POWER_OFF, which
replace constants from fbdev. There's also BACKLIGHT_POWER_REDUCED,
which is required by a few drivers that appear to use incorrect or
uncommon blanking semantics.

The rest of the patchset converts backlight drivers. The new
constants' values are identical to the old ones, so the driver
conversion can be done one-by-one.

There are many more backlight drivers in other subsystems. These
can later be converted when the new constants have been merged.
Once merged, several include statements for <linux/fb.h> can be
removed (specifically under drivers/platform/x86/).

This patchset is part of a larger effort to implement the backlight
code without depending on fbdev and ultimatively remove fbdev
dependencies from the kernel.

v2:
- rename BL_CORE_ power constants to BACKLIGHT_POWER_ (Sam)
- fix documentation

Thomas Zimmermann (17):
  backlight: Add BACKLIGHT_POWER_ constants for power states
  backlight: aat2870-backlight: Use blacklight power constants
  backlight: ams369fb06: Use backlight power constants
  backlight: corgi-lcd: Use backlight power constants
  backlight: gpio-backlight: Use backlight power constants
  backlight: ipaq-micro-backlight: Use backlight power constants
  backlight: journada_bl: Use backlight power constants
  backlight: kb3886-bl: Use backlight power constants
  backlight: ktd253-backlight: Use backlight power constants
  backlight: led-backlight: Use backlight power constants
  backlight: lm3533-backlight: Use backlight power constants
  backlight: mp3309c: Use backlight power constants
  backlight: pandora-backlight: Use backlight power constants
  backlight: pcf50633-backlight: Use backlight power constants
  backlight: pwm-backlight: Use backlight power constants
  backlight: rave-sp-backlight: Use backlight power constants
  backlight: sky81452-backlight: Use backlight power constants

 .../ABI/stable/sysfs-class-backlight          |  7 +++---
 drivers/video/backlight/aat2870_bl.c          |  4 ++--
 drivers/video/backlight/ams369fg06.c          | 23 +++++++++----------
 drivers/video/backlight/corgi_lcd.c           |  4 ++--
 drivers/video/backlight/gpio_backlight.c      |  9 ++++----
 drivers/video/backlight/ipaq_micro_bl.c       |  3 +--
 drivers/video/backlight/jornada720_bl.c       |  3 +--
 drivers/video/backlight/kb3886_bl.c           |  4 ++--
 drivers/video/backlight/ktd253-backlight.c    |  5 ++--
 drivers/video/backlight/led_bl.c              |  4 ++--
 drivers/video/backlight/lm3533_bl.c           |  3 +--
 drivers/video/backlight/mp3309c.c             |  4 ++--
 drivers/video/backlight/pandora_bl.c          |  3 +--
 drivers/video/backlight/pcf50633-backlight.c  |  5 ++--
 drivers/video/backlight/pwm_bl.c              |  4 ++--
 drivers/video/backlight/rave-sp-backlight.c   |  2 +-
 drivers/video/backlight/sky81452-backlight.c  |  2 +-
 include/linux/backlight.h                     | 20 +++++++++-------
 18 files changed, 53 insertions(+), 56 deletions(-)

-- 
2.45.2


