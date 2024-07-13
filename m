Return-Path: <linux-fbdev+bounces-2687-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E4893063C
	for <lists+linux-fbdev@lfdr.de>; Sat, 13 Jul 2024 17:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC5501F21912
	for <lists+linux-fbdev@lfdr.de>; Sat, 13 Jul 2024 15:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AA413B284;
	Sat, 13 Jul 2024 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="rqiku9PL"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6523E629E4;
	Sat, 13 Jul 2024 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720885810; cv=none; b=t940IQczcGjQPN/lrze0+z0YVQQkYLdL6F3yMQ7/tGdqO+Tlan8pSH8DoQhsID6hgI3gUr1l8GnpKbHz2mw8JyCpWIIrPJ/O9pevWlfieO50nng5zvROQGzmRzBGD9SB2OrHtUsQGVnTOkQaKzJrRyEM3WAJrTGswKhWwnTVIJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720885810; c=relaxed/simple;
	bh=ym9kq30myjxMGzu6rRXn5NSy1q9t0pn9/4qyaF7Rerg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XfQ0Srdv5ArKMMcv9ukQ8erAqnwNDl4EroiyVyzMmxol6EbM+W2nHV2kxxNOHPxqXoJX4FPBQnXPlEGQfPbdqV+93OhsPYzMA8tuOjLZOWjqwkN1/83INW9+Rde5bQ4EwDaGWFwtdoD2REZoaEsCIvz3pTuFisNqAG0rrgXnN6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=rqiku9PL; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F1B8A884EA;
	Sat, 13 Jul 2024 17:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720885806;
	bh=cA2Q2MbVe9fskbOQDrWM2YYpTo6SJI1WDaOk84HRv6E=;
	h=From:To:Cc:Subject:Date:From;
	b=rqiku9PLrtGSmTxzkGlpWeUXVCdxPDgk2i7Hv6kkcYdDs1G9wBO4P5B7So0feFGLW
	 kz6sLNG80uAr9KjwjNyDKejV/yeMNRs/kJSl3SsjokT8fdu0cdNBF3uUwc4p53g86z
	 hWiZBad9VxlyCAI+FtCPlOsnXg0b68TGbeVH2xe6MDoVbh/oZqhRkyyjFF43Ih7h6S
	 R/hBcgFBVtGHZ8hZ5j5GzagLLtm4MmUfGRNE3iWxPnff9/1tmeFUXgaG04bAKAyB6i
	 WIobz/AAixPeEj+dFJ7V6YBLf3g/ee71B582rutt1bL07AT4rxwmRTg6G6EADdG12u
	 J0nliiIJoQfyg==
From: Marek Vasut <marex@denx.de>
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/2] gpu: ipu-v3: vdic: Simplify ipu_vdi_setup()
Date: Sat, 13 Jul 2024 17:48:01 +0200
Message-ID: <20240713154934.109318-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The 'code' parameter only ever selects between YUV 4:2:0 and 4:2:2
subsampling, turn it into boolean to select exactly that and update
related code accordingly.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev
---
 drivers/gpu/ipu-v3/ipu-vdi.c               | 14 +++-----------
 drivers/staging/media/imx/imx-media-vdic.c |  3 +--
 include/video/imx-ipu-v3.h                 |  2 +-
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-vdi.c b/drivers/gpu/ipu-v3/ipu-vdi.c
index a593b232b6d3e..4df2821977c0c 100644
--- a/drivers/gpu/ipu-v3/ipu-vdi.c
+++ b/drivers/gpu/ipu-v3/ipu-vdi.c
@@ -117,10 +117,10 @@ void ipu_vdi_set_motion(struct ipu_vdi *vdi, enum ipu_motion_sel motion_sel)
 }
 EXPORT_SYMBOL_GPL(ipu_vdi_set_motion);
 
-void ipu_vdi_setup(struct ipu_vdi *vdi, u32 code, int xres, int yres)
+void ipu_vdi_setup(struct ipu_vdi *vdi, bool yuv422not420, int xres, int yres)
 {
 	unsigned long flags;
-	u32 pixel_fmt, reg;
+	u32 reg;
 
 	spin_lock_irqsave(&vdi->lock, flags);
 
@@ -131,16 +131,8 @@ void ipu_vdi_setup(struct ipu_vdi *vdi, u32 code, int xres, int yres)
 	 * Full motion, only vertical filter is used.
 	 * Burst size is 4 accesses
 	 */
-	if (code == MEDIA_BUS_FMT_UYVY8_2X8 ||
-	    code == MEDIA_BUS_FMT_UYVY8_1X16 ||
-	    code == MEDIA_BUS_FMT_YUYV8_2X8 ||
-	    code == MEDIA_BUS_FMT_YUYV8_1X16)
-		pixel_fmt = VDI_C_CH_422;
-	else
-		pixel_fmt = VDI_C_CH_420;
-
 	reg = ipu_vdi_read(vdi, VDI_C);
-	reg |= pixel_fmt;
+	reg |= yuv422not420 ? VDI_C_CH_422 : VDI_C_CH_420;
 	reg |= VDI_C_BURST_SIZE2_4;
 	reg |= VDI_C_BURST_SIZE1_4 | VDI_C_VWM1_CLR_2;
 	reg |= VDI_C_BURST_SIZE3_4 | VDI_C_VWM3_CLR_2;
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 09da4103a8dbe..ea5b4ef3573de 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -376,8 +376,7 @@ static int vdic_start(struct vdic_priv *priv)
 	 * only supports 4:2:2 or 4:2:0, and this subdev will only
 	 * negotiate 4:2:2 at its sink pads.
 	 */
-	ipu_vdi_setup(priv->vdi, MEDIA_BUS_FMT_UYVY8_2X8,
-		      infmt->width, infmt->height);
+	ipu_vdi_setup(priv->vdi, true, infmt->width, infmt->height);
 	ipu_vdi_set_field_order(priv->vdi, V4L2_STD_UNKNOWN, infmt->field);
 	ipu_vdi_set_motion(priv->vdi, priv->motion);
 
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index c422a403c0990..75f435d024895 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -466,7 +466,7 @@ void ipu_ic_dump(struct ipu_ic *ic);
 struct ipu_vdi;
 void ipu_vdi_set_field_order(struct ipu_vdi *vdi, v4l2_std_id std, u32 field);
 void ipu_vdi_set_motion(struct ipu_vdi *vdi, enum ipu_motion_sel motion_sel);
-void ipu_vdi_setup(struct ipu_vdi *vdi, u32 code, int xres, int yres);
+void ipu_vdi_setup(struct ipu_vdi *vdi, bool yuv422not420, int xres, int yres);
 void ipu_vdi_unsetup(struct ipu_vdi *vdi);
 int ipu_vdi_enable(struct ipu_vdi *vdi);
 int ipu_vdi_disable(struct ipu_vdi *vdi);
-- 
2.43.0


