Return-Path: <linux-fbdev+bounces-2283-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF01F8C2737
	for <lists+linux-fbdev@lfdr.de>; Fri, 10 May 2024 16:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54F5B1F25A18
	for <lists+linux-fbdev@lfdr.de>; Fri, 10 May 2024 14:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A170817108A;
	Fri, 10 May 2024 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qk+QHBRU"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ABC168AFC;
	Fri, 10 May 2024 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715352942; cv=none; b=ZGYUFXvxWMHPFUU7kbYZIr023198we/j+wiGZ86sv7GOygbLOOY8fmr4xchowQFNEVQTtDzwDwxFBcp0cIOfw2qa1ZdT0qTkHYSgUcG+VEzeldlH4zKY5rnX+DE1epxWakWCkgw1mZfYc87i6KYfHsjkuKpvv5HM3UA6DRDh0p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715352942; c=relaxed/simple;
	bh=sLxTchYz896sDj6qbtwDuUDSEIrv3OIFfIsIipZpE5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGwqQCepcSKbgbemV/dptfixidGWezFD6/dE4IploauNfCurmQ5myBjBLUPnlODCanzScemsDf440nwX/Jbbk4vq+lvPirAb6YSAx1lZhBb2jm+YZaQyYCazmvkCNs2Azor6W0tb0mugwJy6b6SJKqN55pOATTlw/bgdf3OKCnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qk+QHBRU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B805BC113CC;
	Fri, 10 May 2024 14:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715352942;
	bh=sLxTchYz896sDj6qbtwDuUDSEIrv3OIFfIsIipZpE5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qk+QHBRUz835G4CYflpo32U3bgdyaL3BSq2dIP7JPTBxppCQBluDy5JvM3o97jF80
	 iEALaNAdz3a/+xGsLAEiu9b9vQ8IOnPt5tIhImEP0eGpneYwpJjwpuG02fLkJ3yi68
	 nhbRbKKys1TrAkL5vW0TVsZ1OZcRgEjvN426FUx7zeuaqiU+tMqyApz+JEHhGlVjsp
	 zDEVo4rZ2XssiB7JTh43TEhLtOPYXIZhhcknhTJmh/C+HOdQCExA3ZWfYGTj7MIeOv
	 FQzyk2hH6uVo11vyU+GDq7RXKXBnosQk38Lr2DJANEJLXeauHqnO5s9JAJ0Ew2Q7b5
	 NjdJU+QN1zb3Q==
Date: Fri, 10 May 2024 15:55:34 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: [GIT PULL] Immutable branch between Backlight, HID and fbdev due for
 the v6.10 merge window
Message-ID: <20240510145534.GD6146@google.com>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>

Enjoy!

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git ib-backlight-hid-fbdev-lcd-scripts-v6.10

for you to fetch changes up to 82b9007bc4f8c22975d640d7df6743366f25a353:

  const_structs.checkpatch: add lcd_ops (2024-05-03 10:45:55 +0100)

----------------------------------------------------------------
Immutable branch between Backlight, HID and fbdev due for the v6.10 merge window

----------------------------------------------------------------
Krzysztof Kozlowski (19):
      backlight: lcd: Constify lcd_ops
      backlight: ams369fg06: Constify lcd_ops
      backlight: corgi_lcd: Constify lcd_ops
      backlight: hx8357: Constify lcd_ops
      backlight: ili922x: Constify lcd_ops
      backlight: ili9320: Constify lcd_ops
      backlight: jornada720_lcd: Constify lcd_ops
      backlight: l4f00242t03: Constify lcd_ops
      backlight: lms283gf05: Constify lcd_ops
      backlight: lms501kf03: Constify lcd_ops
      backlight: ltv350qv: Constify lcd_ops
      backlight: otm3225a: Constify lcd_ops
      backlight: platform_lcd: Constify lcd_ops
      backlight: tdo24m: Constify lcd_ops
      HID: picoLCD: Constify lcd_ops
      fbdev: clps711x: Constify lcd_ops
      fbdev: imx: Constify lcd_ops
      fbdev: omap: lcd_ams_delta: Constify lcd_ops
      const_structs.checkpatch: add lcd_ops

 drivers/hid/hid-picolcd_lcd.c            | 2 +-
 drivers/video/backlight/ams369fg06.c     | 2 +-
 drivers/video/backlight/corgi_lcd.c      | 2 +-
 drivers/video/backlight/hx8357.c         | 2 +-
 drivers/video/backlight/ili922x.c        | 2 +-
 drivers/video/backlight/ili9320.c        | 2 +-
 drivers/video/backlight/jornada720_lcd.c | 2 +-
 drivers/video/backlight/l4f00242t03.c    | 2 +-
 drivers/video/backlight/lcd.c            | 4 ++--
 drivers/video/backlight/lms283gf05.c     | 2 +-
 drivers/video/backlight/lms501kf03.c     | 2 +-
 drivers/video/backlight/ltv350qv.c       | 2 +-
 drivers/video/backlight/otm3225a.c       | 2 +-
 drivers/video/backlight/platform_lcd.c   | 2 +-
 drivers/video/backlight/tdo24m.c         | 2 +-
 drivers/video/fbdev/clps711x-fb.c        | 2 +-
 drivers/video/fbdev/imxfb.c              | 2 +-
 drivers/video/fbdev/omap/lcd_ams_delta.c | 2 +-
 include/linux/lcd.h                      | 6 +++---
 scripts/const_structs.checkpatch         | 1 +
 20 files changed, 23 insertions(+), 22 deletions(-)

-- 
Lee Jones [李琼斯]

