Return-Path: <linux-fbdev+bounces-3448-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9069EE3B6
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Dec 2024 11:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C98B2839DA
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Dec 2024 10:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13072101BA;
	Thu, 12 Dec 2024 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SzM+e4c5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zFPTjN+S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C88eEKfu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m3hu/pJr"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586E21018A
	for <linux-fbdev@vger.kernel.org>; Thu, 12 Dec 2024 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733998012; cv=none; b=gEsgOUCx45dIo+lf7bFRnQBZxXVPO87UTUIGqWPmML2pEp2cPVqiA5kSw8QnO63aqAd5h8e+v1MI7rBbmQo99BxAuiTdM0PyLr9Cstik+W0bq0XBR5z3Zlb6MohRBz/kIYLFPivMnGFgtVFo3KumMUaqbkxGFFXTQ50zWors9Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733998012; c=relaxed/simple;
	bh=ecDIoMe6xeSi2wG4NptFtfmCHydhk9YvAbBViXdKRnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HgKLbim7h2sE/aphERs6hyazFHrk+767my/hWtQM9T27Iu4G5Y8Jfe92VisNF51qEjVnLdGP6wSx8+ROtivUdW5nAJf/Ri5di+VFAt8O2CHexVOMLT8aB6IdZg0cBycqUlFOYddCFg4pGyoXHS3prZo1M1N5cQ4cOplchUIXQTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SzM+e4c5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zFPTjN+S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C88eEKfu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m3hu/pJr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EA3121F445;
	Thu, 12 Dec 2024 10:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733998008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=INRxU7ywg6HovcPyrlJbcPMTZP3ggyxEfuKjc8HY5a0=;
	b=SzM+e4c5Ym1h/jm5jVRn2Nl51bBZwlCrsSXJWKE8eSsIvW1x9151YFQ/8jopNe/WT25DGg
	dd1JI7f5fPyaMHMgN/Ns+wcJEoBAlD4ktf1B5G0Rxga4vLYmWhLSQa2b/9SiuHDatXE9HY
	OzOzrwlsl6v5KmUvSCQM31/RRV2N4gA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733998008;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=INRxU7ywg6HovcPyrlJbcPMTZP3ggyxEfuKjc8HY5a0=;
	b=zFPTjN+SsvBeunjkwP/6JkWexsWilBM8ALnk3ZViWyFS1fpwyJhjXgRJzw0NyKM21lX+lG
	LIfa6gdLNBg95qBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733998007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=INRxU7ywg6HovcPyrlJbcPMTZP3ggyxEfuKjc8HY5a0=;
	b=C88eEKfuMDlPH1HvCmRgYqp7pDVG0sASkljzBfoFjeIItcffK0rfCEdrJ6k6fzsg2nJixD
	ehYwzmW1s/iAjBGe1kDFRbd0z2U+Z76a6jqrJ3XZLxn+NeyeS9jXOgjRu1dmjfQei+JTv+
	/CUM5DG9DIH47O3FPita/Ms4GR3rDzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733998007;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=INRxU7ywg6HovcPyrlJbcPMTZP3ggyxEfuKjc8HY5a0=;
	b=m3hu/pJriaq1pEPdNSNu7jWg+8lOgOsUJfmtvq7KSt8hFHyu4O52BzltbsBFM3X7OFUdd3
	yYq2vSEFm2yEa6Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A70C013939;
	Thu, 12 Dec 2024 10:06:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uB+YJ7e1WmeaGwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 10:06:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	arnd@arndb.de,
	deller@gmx.de,
	simona@ffwll.ch,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/3] drm,fbdev: Fix module dependencies
Date: Thu, 12 Dec 2024 11:04:42 +0100
Message-ID: <20241212100636.45875-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	FREEMAIL_TO(0.00)[redhat.com,arndb.de,gmx.de,ffwll.ch,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 

Fix the dependencies among the various graphics modules.

Before addressing the FB_CORE issue, patch 1 first resolves a problem
with BACKLIGHT_CLASS_DEVICE. A number of fbdev drivers select it, which
results in a recursive-dependency error after patch has been applied.
Making these drivers (or parts of them) depend on BACKLIGHT_CLASS_DEVICE
fixes this.

Patch 2 selects FB_CORE for DRM_GEM_DMA_HELPER and DRM_TTM_HELPER.
This is necessary with the recently added DRM client library.

Patch 3 is the second half of the patch provided by Arnd at [1]. It
could not yet be merged because of the issues fixed by patch 1.

Side note: For the majority of graphics drivers, backlight functionality
depends on BACKLIGHT_CLASS_DEVICE. In a few cases drivers select the
Kconfig token automatically. These drivers should be updated to depends
on the token as well, such that backlight functionality is fully user-
controlled.

v2:
- s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
- Fix fbdev driver-dependency corner case (Arnd)

[1] https://patchwork.freedesktop.org/series/141411/

Arnd Bergmann (1):
  drm: rework FB_CORE dependency

Thomas Zimmermann (2):
  fbdev: Fix recursive dependencies wrt BACKLIGHT_CLASS_DEVICE
  drm/fbdev: Select FB_CORE dependency for fbdev on DMA and TTM

 drivers/auxdisplay/Kconfig       |  2 +-
 drivers/gpu/drm/Kconfig          |  3 +++
 drivers/macintosh/Kconfig        |  1 +
 drivers/staging/fbtft/Kconfig    |  1 +
 drivers/video/fbdev/Kconfig      | 18 +++++++++++++-----
 drivers/video/fbdev/core/Kconfig |  3 +--
 6 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.47.1


