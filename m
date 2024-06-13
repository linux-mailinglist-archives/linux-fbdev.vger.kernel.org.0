Return-Path: <linux-fbdev+bounces-2505-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E36B907C76
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2024 21:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3977288C2C
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2024 19:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA98A15444E;
	Thu, 13 Jun 2024 19:18:19 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B85153567
	for <linux-fbdev@vger.kernel.org>; Thu, 13 Jun 2024 19:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306299; cv=none; b=n1ejTvSUwZN4dFqG1bp28fLAkyCKV1HFUGNUx5yTsSbhbupKI2+9C7yqM2Mx1r9TTqgZBuximNoB4/PEnOqShFBADp+z4eOU12mbiGox7i/9w6NXi3988OJEdiS3ExhMG8Cwnd5B/wo9TwuepdMNwXKn5Dek5RRIJkVXKBo/QTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306299; c=relaxed/simple;
	bh=/mZa73zwDKX0V9S42wBjaR1oVGDw4zIOxpP9TGhCG7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gy4FFgn9yH1WYXsZC7Yixm2NRKk4FF2kXmOrGwSpJiaQdbr/W/cjDwJN4zCt/x6QUCrz6Dwt+7bY5APaFNgmfPsKejcQNwhJX1URlkrQLmqGw8vKd7iYD304r0/fl3CuuuN7Ivh4cVyjtFV0edED3kQ1g9hQiBnMrgGSbYJtDvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by andre.telenet-ops.be with bizsmtp
	id b7J62C00A3w30qz017J6rJ; Thu, 13 Jun 2024 21:18:08 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHpwS-00Ax6l-DD;
	Thu, 13 Jun 2024 21:18:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHpxW-00FL8W-Dz;
	Thu, 13 Jun 2024 21:18:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jocelyn Falempe <jfalempe@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/7] drm/panic: Fix off-by-one logo size checks
Date: Thu, 13 Jun 2024 21:18:00 +0200
Message-Id: <1c9d02463cef3eac22cfac3ac6d1adad369f367b.1718305355.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718305355.git.geert+renesas@glider.be>
References: <cover.1718305355.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Logos that are either just as wide or just as high as the display work
fine.

Fixes: bf9fb17c6672868d ("drm/panic: Add a drm panic handler")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebased.
---
 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index fc04ed4e0b399f55..814ef5c20c08ee42 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -472,7 +472,7 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 	drm_panic_fill(sb, &r_screen, bg_color);
 
 	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
-	    drm_rect_width(&r_logo) < sb->width && drm_rect_height(&r_logo) < sb->height) {
+	    drm_rect_width(&r_logo) <= sb->width && drm_rect_height(&r_logo) <= sb->height) {
 		draw_txt_rectangle(sb, font, logo, logo_lines, false, &r_logo, fg_color);
 	}
 	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);
-- 
2.34.1


