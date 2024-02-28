Return-Path: <linux-fbdev+bounces-1266-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E09B86A869
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Feb 2024 07:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C321FB249E5
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Feb 2024 06:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54D922612;
	Wed, 28 Feb 2024 06:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="ccAwx5ci"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB5721370
	for <linux-fbdev@vger.kernel.org>; Wed, 28 Feb 2024 06:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709102225; cv=none; b=fJK+IVNwXhuThWg2pQ93ROB5y7Ruxgr1R9C02p4NCpE4LZ34rIchRTfMV+eEGIg4Q5YO0lhe36AkO9DkiMNNm2tZ0rdMJW4opJ+V3T63p0STaQcod7PHxQHNJQhPrukZlKkOLdYYiKZNIuU8e2jDP+JY3eCrwz7dDeJ0trT49GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709102225; c=relaxed/simple;
	bh=M2859QzQ+R61FkyD744ASgs2qZVOK1XHHB7RztXuk7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMwRhLw3zNkiQTMU7fy/Zum53yHUoZdRHfrYNWcPKfghANm63xeHmETDwSSti5SCdMbCupJxLlTuTjEJZUjyk9sVDsU+jWx0NwcK45V5QxebmG49R8yyl8Pdz9YWPUYdlUMfiPEz4udHysbV3nLeyDsWksuy1sKwxFq9KuI9SWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=ccAwx5ci; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 6C1B7604A0;
	Wed, 28 Feb 2024 06:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709102223;
	bh=M2859QzQ+R61FkyD744ASgs2qZVOK1XHHB7RztXuk7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ccAwx5ciad/SV3OM/C4+EEXRy4EWRhZERNdFYDNQo9Q6fWKbLF3y2hZGfbxypvF5H
	 UlWUf7KzOlhcbnJJryS0XXEnIq7MbzT6GuRYksq4oua50QhxtU7sPEOcGeQTNa5ldn
	 2t1+RRqxgqCfMRzgx14ScJZAnjO9JiRhEQ00b7LYcA+EzQpS59DMumLV+qLrxByojB
	 zBVhEBFTrBhTMbOc5EDhU8G4PZPECJ8merTEnSnqGqx1qG/R6BlqXfXcQth4FJ2zSL
	 ToEsqr41qzBg8l0cH/YO/eqMOTyQYh+E/XrGuzv1zQ2KbnbcH+z7aGDRSJ7edU+uiR
	 yv7YUMkYWvARA==
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 1/2] drm/omapdrm: Fix console by implementing fb_dirty
Date: Wed, 28 Feb 2024 08:35:31 +0200
Message-ID: <20240228063540.4444-2-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240228063540.4444-1-tony@atomide.com>
References: <20240228063540.4444-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The framebuffer console stopped updating with commit f231af498c29
("drm/fb-helper: Disconnect damage worker from update logic").

Let's fix the issue by implementing fb_dirty similar to what was done
with commit 039a72ce7e57 ("drm/i915/fbdev: Implement fb_dirty for intel
custom fb helper").

Fixes: f231af498c29 ("drm/fb-helper: Disconnect damage worker from update logic")
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -238,8 +238,20 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 	return ret;
 }
 
+static int omap_fbdev_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
+{
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->fb->funcs->dirty)
+		return helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+
+	return 0;
+}
+
 static const struct drm_fb_helper_funcs omap_fb_helper_funcs = {
 	.fb_probe = omap_fbdev_create,
+	.fb_dirty = omap_fbdev_dirty,
 };
 
 static struct drm_fb_helper *get_fb(struct fb_info *fbi)
-- 
2.43.1

