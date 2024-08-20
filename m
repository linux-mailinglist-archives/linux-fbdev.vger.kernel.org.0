Return-Path: <linux-fbdev+bounces-2836-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5206A958275
	for <lists+linux-fbdev@lfdr.de>; Tue, 20 Aug 2024 11:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F0C7283023
	for <lists+linux-fbdev@lfdr.de>; Tue, 20 Aug 2024 09:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D0718C034;
	Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FO03Z8wt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ce1Sm4sx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FO03Z8wt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ce1Sm4sx"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872FD18A6D0;
	Tue, 20 Aug 2024 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146503; cv=none; b=mwc1TpzXz/LPGOknK7PAnexUFbyPFOdSNOQJ9h38N2c8pELpYcJ9jw3QJvr7u7heIdmKQxMQ/uyUoMrvIvA6VcLsWHXPiwyCNv4tcPl+aQHpz2OXhvsmOyPOcEdVeCm+MzbIE/QTRcTYQ7Y0kM/nocXI1j7hiDoSVuFjDwKQY8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146503; c=relaxed/simple;
	bh=kXTX/rJh8g8ipmMuzJPcb1/DULGHmKKMzPTLSm2njzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e75rwGxaQ9Q+rpFml1CrQN8kimx9yRdt/sjRPYp7ZJyEyeJgHA80oYjtT7USlXC5kV5rZnL51BaSPWsG7MGvMvu7oERQdRmD9/ky8SMcmPy16lWV6BO29Eio+LjZ8+z6Q9BFjyUnDGP722XSteNeDdSjd+rZnaimH9XA9zNrYRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FO03Z8wt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ce1Sm4sx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FO03Z8wt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ce1Sm4sx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 85CFC1FFCA;
	Tue, 20 Aug 2024 09:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UmfyRGLb4CbMoxJ7BJTU/i/0ug+JU8PEy/SeO8rCsso=;
	b=FO03Z8wtiGU5YqlDlcfXUhYuiG6QBq3DgwUcpdf68HaqrBx3GUQyjCm8u6Ip0eNUS3fSJ0
	HrLUQw5AWnX7RNkiEMglGd/+gG/BJcaaOyRb2a0GyozVsthWFF6QwlNWKeoczx4hRQtWV+
	EidV++mIZkFKoff6JcMvrhpw83P+1HU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UmfyRGLb4CbMoxJ7BJTU/i/0ug+JU8PEy/SeO8rCsso=;
	b=Ce1Sm4sxHlwHGxUBx9I91bInXwqyOi9zhaX/AuYHKg0+kR1+LATj77GNxjHjgXeyYh4Dp1
	hfxEx6Kwuv8cOEAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FO03Z8wt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ce1Sm4sx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UmfyRGLb4CbMoxJ7BJTU/i/0ug+JU8PEy/SeO8rCsso=;
	b=FO03Z8wtiGU5YqlDlcfXUhYuiG6QBq3DgwUcpdf68HaqrBx3GUQyjCm8u6Ip0eNUS3fSJ0
	HrLUQw5AWnX7RNkiEMglGd/+gG/BJcaaOyRb2a0GyozVsthWFF6QwlNWKeoczx4hRQtWV+
	EidV++mIZkFKoff6JcMvrhpw83P+1HU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UmfyRGLb4CbMoxJ7BJTU/i/0ug+JU8PEy/SeO8rCsso=;
	b=Ce1Sm4sxHlwHGxUBx9I91bInXwqyOi9zhaX/AuYHKg0+kR1+LATj77GNxjHjgXeyYh4Dp1
	hfxEx6Kwuv8cOEAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D362113770;
	Tue, 20 Aug 2024 09:34:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6l9aMkJjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:34:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	bonbons@linux-vserver.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	shc_work@mail.ru,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/28] backlight: lcd: Remove fbdev dependencies
Date: Tue, 20 Aug 2024 11:22:38 +0200
Message-ID: <20240820093452.68270-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 85CFC1FFCA
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

This series removes most dependencies on fbdev from the lcd subsystem
and its drivers.

Patches 1 to 3 rework the fbdev notifier, the fbdev's fb_info can
now refer to a dedicated lcd device, and lcd defines constants for
power states. These changes resemble similar changes to the backlight
code.

Patches 4 to 19 update lcd drivers to the new interfaces and perform
minor cleanups during the process. Patches 20 to 24 update fbdev
drivers and patch 25 updates the picolcd driver from the hid subsystem.

Patches 25 to 28 finally clean up various lcd interfaces and files.

This patchset is part of a larger effort to implement the lcd code
without depending on fbdev. Similar patches have been sent out for
the backlight subsystem, such as in [1] and [2].

Hopefully this series can be merged at once through the lcd tree.

[1] https://patchwork.freedesktop.org/series/129782/
[2] https://patchwork.freedesktop.org/series/134718/

Thomas Zimmermann (28):
  backlight: lcd: Rearrange code in fb_notifier_callback()
  backlight: lcd: Test against struct fb_info.lcd_dev
  backlight: lcd: Add LCD_POWER_ constants for power states
  backlight: corgi_lcd: Use lcd power constants
  backlight: hx8357: Use lcd power constants
  backlight: ili922x: Use lcd power constants
  backlight: ili9320: Use lcd power constants
  backlight: jornada720_lcd: Include <linux/io.h> for IOMEM() macro
  backlight: jornada720_lcd: Use lcd power constants
  backlight: l4f00242t03: Use lcd power constants
  backlight: lms283gf05: Use lcd power constants
  backlight: lms501kf03: Remove unnecessary include of
    <linux/backlight.h>
  backlight: lms501kf03: Use lcd power constants
  backlight: ltv350qv: Use lcd power constants
  backlight: otm3225a: Use lcd power constants
  backlight: platform_lcd: Remove include statement for
    <linux/backlight.h>
  backlight: platform_lcd: Remove match_fb from struct plat_lcd_data
  backlight: platform_lcd: Use lcd power constants
  backlight: tdo24m: Use lcd power constants
  fbdev: clps711x-fb: Replace check_fb in favor of struct
    fb_info.lcd_dev
  fbdev: clps711x-fb: Use lcd power constants
  fbdev: imxfb: Replace check_fb in favor of struct fb_info.lcd_dev
  fbdev: imxfb: Use lcd power constants
  fbdev: omap: Use lcd power constants
  HID: picoLCD: Replace check_fb in favor of struct fb_info.lcd_dev
  backlight: lcd: Replace check_fb with controls_device
  backlight: lcd: Remove struct fb_videomode from set_mode callback
  backlight: lcd: Do not include <linux/fb.h> in lcd header

 drivers/hid/hid-picolcd_fb.c             |  4 ++
 drivers/hid/hid-picolcd_lcd.c            |  6 ---
 drivers/video/backlight/corgi_lcd.c      | 17 ++++----
 drivers/video/backlight/hx8357.c         |  2 +-
 drivers/video/backlight/ili922x.c        |  7 ++--
 drivers/video/backlight/ili9320.c        | 15 ++++----
 drivers/video/backlight/jornada720_lcd.c | 10 ++---
 drivers/video/backlight/l4f00242t03.c    | 32 ++++++++--------
 drivers/video/backlight/lcd.c            | 49 +++++++++++++++++++-----
 drivers/video/backlight/lms283gf05.c     |  2 +-
 drivers/video/backlight/lms501kf03.c     | 24 ++++++------
 drivers/video/backlight/ltv350qv.c       | 15 ++++----
 drivers/video/backlight/otm3225a.c       |  2 +-
 drivers/video/backlight/platform_lcd.c   | 20 ++++------
 drivers/video/backlight/tdo24m.c         | 19 +++++----
 drivers/video/fbdev/clps711x-fb.c        | 29 +++++++-------
 drivers/video/fbdev/imxfb.c              | 32 ++++++----------
 drivers/video/fbdev/omap/lcd_ams_delta.c |  8 ++--
 include/linux/fb.h                       | 13 +++++++
 include/linux/lcd.h                      | 29 ++++++++++----
 include/video/platform_lcd.h             |  3 --
 21 files changed, 182 insertions(+), 156 deletions(-)

-- 
2.46.0


