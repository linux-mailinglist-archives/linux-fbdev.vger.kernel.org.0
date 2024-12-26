Return-Path: <linux-fbdev+bounces-3518-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB4F9FC798
	for <lists+linux-fbdev@lfdr.de>; Thu, 26 Dec 2024 03:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0B16162869
	for <lists+linux-fbdev@lfdr.de>; Thu, 26 Dec 2024 02:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0680B14B07A;
	Thu, 26 Dec 2024 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="LiDIn/Nx"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357C014831E;
	Thu, 26 Dec 2024 02:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735180096; cv=none; b=a2XG7mG/KlJI9wV1VFxBM+wViFMxXFVqGcYTHkFLMCjD85lUxJMo/XKVbkBnjKnp6gyw7NJVdRVggITFrvBHpBw5roTyvXg9JLbfu96IOHwkvnPXDXSgDxJToNgQEDGijlc28R+dysZFgYs81FNMsETeTuioo9rCQiGbsCd7kyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735180096; c=relaxed/simple;
	bh=DA7+p+sqvcV1bfMtqx/OfgF8iCr7PIRu+xxz92YnSnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZLBIK7YE71DTU/zlct85KtfYSZB+yJJU2wvDIkzcH4EAbDFJEl9f51KeUWGutoXV6Ty4XcreKLrTmgkAYNiNGjfNXNxrjPQey6o/zijYSfXaZbBUQ1PgPkNqEurnQziHpXpaJMo7fKilJgmhQNZRcPva2rbACftlwrqk8Ozqf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=LiDIn/Nx; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=CzQEqU7rwgr2tl1CtQgZLGQjEt1ez91boRU3k7xCN7k=; b=LiDIn/NxWLtO7Q1N
	AP05iZOzRbOvvHj0+PU0/joMAXcz6XV2kGJhzN5cuZnI7yd/Vo08qRsCVlX48aQ+xLKRruUvHoUkY
	XioEYVojBRoaq5B5BOQZkC4oswDi05cYLBQpaGzowwkYYlWwA2wUHZC61UO+7pf3aFVd8+VD9qZRO
	AoCJZcg7lN5DJT16Lr50F91aA0uEqOko5yYCZG72UPW+JKLtiSNVTJrhpOwnLpTkXcId83uqMb6Wx
	G57hg3Ag22hhQFJgXjirAw2CpL/am7pvlCI6cQK2KviH9j58xAPy1iRci3e6C4nEVDK8EIWJL3Fwi
	yeDqO78mh6OypQQImQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQdbR-007F0L-2p;
	Thu, 26 Dec 2024 02:27:57 +0000
From: linux@treblig.org
To: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	deller@gmx.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 6/7] gpu: ipu-v3: ipu-csi: Remove unused functions
Date: Thu, 26 Dec 2024 02:27:51 +0000
Message-ID: <20241226022752.219399-7-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ipu_csi_get_window(), ipu_csi_is_interlaced() and
ipu_csi_set_test_generator() were added in 2014 by
commit 2ffd48f2e7ae ("gpu: ipu-v3: Add Camera Sensor Interface unit")
but have remained unused.

Remove them.

ipu_csi_set_testgen_mclk() is now unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/ipu-v3/ipu-csi.c | 108 -----------------------------------
 include/video/imx-ipu-v3.h   |   5 --
 2 files changed, 113 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-csi.c b/drivers/gpu/ipu-v3/ipu-csi.c
index 778bc26d3ba5..d576b7d28437 100644
--- a/drivers/gpu/ipu-v3/ipu-csi.c
+++ b/drivers/gpu/ipu-v3/ipu-csi.c
@@ -185,32 +185,6 @@ static inline void ipu_csi_write(struct ipu_csi *csi, u32 value,
 	writel(value, csi->base + offset);
 }
 
-/*
- * Set mclk division ratio for generating test mode mclk. Only used
- * for test generator.
- */
-static int ipu_csi_set_testgen_mclk(struct ipu_csi *csi, u32 pixel_clk,
-					u32 ipu_clk)
-{
-	u32 temp;
-	int div_ratio;
-
-	div_ratio = (ipu_clk / pixel_clk) - 1;
-
-	if (div_ratio > 0xFF || div_ratio < 0) {
-		dev_err(csi->ipu->dev,
-			"value of pixel_clk extends normal range\n");
-		return -EINVAL;
-	}
-
-	temp = ipu_csi_read(csi, CSI_SENS_CONF);
-	temp &= ~CSI_SENS_CONF_DIVRATIO_MASK;
-	ipu_csi_write(csi, temp | (div_ratio << CSI_SENS_CONF_DIVRATIO_SHIFT),
-			  CSI_SENS_CONF);
-
-	return 0;
-}
-
 /*
  * Find the CSI data format and data width for the given V4L2 media
  * bus pixel format code.
@@ -538,56 +512,6 @@ int ipu_csi_init_interface(struct ipu_csi *csi,
 }
 EXPORT_SYMBOL_GPL(ipu_csi_init_interface);
 
-bool ipu_csi_is_interlaced(struct ipu_csi *csi)
-{
-	unsigned long flags;
-	u32 sensor_protocol;
-
-	spin_lock_irqsave(&csi->lock, flags);
-	sensor_protocol =
-		(ipu_csi_read(csi, CSI_SENS_CONF) &
-		 CSI_SENS_CONF_SENS_PRTCL_MASK) >>
-		CSI_SENS_CONF_SENS_PRTCL_SHIFT;
-	spin_unlock_irqrestore(&csi->lock, flags);
-
-	switch (sensor_protocol) {
-	case IPU_CSI_CLK_MODE_GATED_CLK:
-	case IPU_CSI_CLK_MODE_NONGATED_CLK:
-	case IPU_CSI_CLK_MODE_CCIR656_PROGRESSIVE:
-	case IPU_CSI_CLK_MODE_CCIR1120_PROGRESSIVE_DDR:
-	case IPU_CSI_CLK_MODE_CCIR1120_PROGRESSIVE_SDR:
-		return false;
-	case IPU_CSI_CLK_MODE_CCIR656_INTERLACED:
-	case IPU_CSI_CLK_MODE_CCIR1120_INTERLACED_DDR:
-	case IPU_CSI_CLK_MODE_CCIR1120_INTERLACED_SDR:
-		return true;
-	default:
-		dev_err(csi->ipu->dev,
-			"CSI %d sensor protocol unsupported\n", csi->id);
-		return false;
-	}
-}
-EXPORT_SYMBOL_GPL(ipu_csi_is_interlaced);
-
-void ipu_csi_get_window(struct ipu_csi *csi, struct v4l2_rect *w)
-{
-	unsigned long flags;
-	u32 reg;
-
-	spin_lock_irqsave(&csi->lock, flags);
-
-	reg = ipu_csi_read(csi, CSI_ACT_FRM_SIZE);
-	w->width = (reg & 0xFFFF) + 1;
-	w->height = (reg >> 16 & 0xFFFF) + 1;
-
-	reg = ipu_csi_read(csi, CSI_OUT_FRM_CTRL);
-	w->left = (reg & CSI_HSC_MASK) >> CSI_HSC_SHIFT;
-	w->top = (reg & CSI_VSC_MASK) >> CSI_VSC_SHIFT;
-
-	spin_unlock_irqrestore(&csi->lock, flags);
-}
-EXPORT_SYMBOL_GPL(ipu_csi_get_window);
-
 void ipu_csi_set_window(struct ipu_csi *csi, struct v4l2_rect *w)
 {
 	unsigned long flags;
@@ -624,38 +548,6 @@ void ipu_csi_set_downsize(struct ipu_csi *csi, bool horiz, bool vert)
 }
 EXPORT_SYMBOL_GPL(ipu_csi_set_downsize);
 
-void ipu_csi_set_test_generator(struct ipu_csi *csi, bool active,
-				u32 r_value, u32 g_value, u32 b_value,
-				u32 pix_clk)
-{
-	unsigned long flags;
-	u32 ipu_clk = clk_get_rate(csi->clk_ipu);
-	u32 temp;
-
-	spin_lock_irqsave(&csi->lock, flags);
-
-	temp = ipu_csi_read(csi, CSI_TST_CTRL);
-
-	if (!active) {
-		temp &= ~CSI_TEST_GEN_MODE_EN;
-		ipu_csi_write(csi, temp, CSI_TST_CTRL);
-	} else {
-		/* Set sensb_mclk div_ratio */
-		ipu_csi_set_testgen_mclk(csi, pix_clk, ipu_clk);
-
-		temp &= ~(CSI_TEST_GEN_R_MASK | CSI_TEST_GEN_G_MASK |
-			  CSI_TEST_GEN_B_MASK);
-		temp |= CSI_TEST_GEN_MODE_EN;
-		temp |= (r_value << CSI_TEST_GEN_R_SHIFT) |
-			(g_value << CSI_TEST_GEN_G_SHIFT) |
-			(b_value << CSI_TEST_GEN_B_SHIFT);
-		ipu_csi_write(csi, temp, CSI_TST_CTRL);
-	}
-
-	spin_unlock_irqrestore(&csi->lock, flags);
-}
-EXPORT_SYMBOL_GPL(ipu_csi_set_test_generator);
-
 int ipu_csi_set_mipi_datatype(struct ipu_csi *csi, u32 vc,
 			      struct v4l2_mbus_framefmt *mbus_fmt)
 {
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index c9ed4b6a408b..29e142e95ba3 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -361,13 +361,8 @@ int ipu_csi_init_interface(struct ipu_csi *csi,
 			   const struct v4l2_mbus_config *mbus_cfg,
 			   const struct v4l2_mbus_framefmt *infmt,
 			   const struct v4l2_mbus_framefmt *outfmt);
-bool ipu_csi_is_interlaced(struct ipu_csi *csi);
-void ipu_csi_get_window(struct ipu_csi *csi, struct v4l2_rect *w);
 void ipu_csi_set_window(struct ipu_csi *csi, struct v4l2_rect *w);
 void ipu_csi_set_downsize(struct ipu_csi *csi, bool horiz, bool vert);
-void ipu_csi_set_test_generator(struct ipu_csi *csi, bool active,
-				u32 r_value, u32 g_value, u32 b_value,
-				u32 pix_clk);
 int ipu_csi_set_mipi_datatype(struct ipu_csi *csi, u32 vc,
 			      struct v4l2_mbus_framefmt *mbus_fmt);
 int ipu_csi_set_skip_smfc(struct ipu_csi *csi, u32 skip,
-- 
2.47.1


