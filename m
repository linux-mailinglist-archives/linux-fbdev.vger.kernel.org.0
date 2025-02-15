Return-Path: <linux-fbdev+bounces-3816-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 70080A36CD2
	for <lists+linux-fbdev@lfdr.de>; Sat, 15 Feb 2025 10:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E50787A4C52
	for <lists+linux-fbdev@lfdr.de>; Sat, 15 Feb 2025 09:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0A4198A38;
	Sat, 15 Feb 2025 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="TqMD57lj"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9491802;
	Sat, 15 Feb 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739611247; cv=none; b=oJ0ZQvonXZ9hua19ofyGqjBD5e+BYKlyJCrSpBVyKa09mqaad/rBJRgfPQJGdUVn0qUsqd6aNEmDdfy5WXqpyPoBYXwqEuiKv6jJhQvYtx9C58JDfj/QWC7Oa2diu1je2p/J/bF8Lv3gKYmKZdeudLqhI7sgJs4O+GEq+n1uEfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739611247; c=relaxed/simple;
	bh=PBYNrOLXNU7rMQSZX5XVZ6b210WBqxWqqIhqXNHKUVM=;
	h=From:To:Cc:Subject:Date:Message-Id; b=LyVObRT4uFsAhFuVOTggkkOVMGN8Gr0OMOb/imR+cD/jWG/9+8ExvPemKmVSk73B8WvSsuIw+6djAtvicSCcYAonyJ4Kk4+UVkVyIkgOLq6RSS9NDSi4HCdrlWfcrBmZUr6gt1rqbjrMDnBZh0pq/s4i00i7A8ZHKOQekc4SHp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=TqMD57lj; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 36D332107AA1;
	Sat, 15 Feb 2025 01:20:45 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 36D332107AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739611245;
	bh=X4BZo2FoCtZKftMiZVna+dhZsaZWDkhj/UsiastHJkE=;
	h=From:To:Cc:Subject:Date:From;
	b=TqMD57ljKGise/ffyryS+Wk18XxesOCMs3BLBm2eoryGDbIlhiMHAjm823Oy9Pl3V
	 pDLzx9NSIT/EHyBJcpPXwTXIYbjyGR35vH94cuyIOxErfFl0ZuWFvJYE8UOOEECzg9
	 GBcQXoMzWjSaRie5AGtJoS6cmR+OP88+cPEJOIF4=
From: Saurabh Sengar <ssengar@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	deller@gmx.de,
	akpm@linux-foundation.org,
	linux-hyperv@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: ssengar@microsoft.com,
	mhklinux@outlook.com
Subject: [PATCH] fbdev: hyperv_fb: Allow graceful removal of framebuffer
Date: Sat, 15 Feb 2025 01:20:40 -0800
Message-Id: <1739611240-9512-1-git-send-email-ssengar@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>

When a Hyper-V framebuffer device is unbind, hyperv_fb driver tries to
release the framebuffer forcefully. If this framebuffer is in use it
produce the following WARN and hence this framebuffer is never released.

[   44.111220] WARNING: CPU: 35 PID: 1882 at drivers/video/fbdev/core/fb_info.c:70 framebuffer_release+0x2c/0x40
< snip >
[   44.111289] Call Trace:
[   44.111290]  <TASK>
[   44.111291]  ? show_regs+0x6c/0x80
[   44.111295]  ? __warn+0x8d/0x150
[   44.111298]  ? framebuffer_release+0x2c/0x40
[   44.111300]  ? report_bug+0x182/0x1b0
[   44.111303]  ? handle_bug+0x6e/0xb0
[   44.111306]  ? exc_invalid_op+0x18/0x80
[   44.111308]  ? asm_exc_invalid_op+0x1b/0x20
[   44.111311]  ? framebuffer_release+0x2c/0x40
[   44.111313]  ? hvfb_remove+0x86/0xa0 [hyperv_fb]
[   44.111315]  vmbus_remove+0x24/0x40 [hv_vmbus]
[   44.111323]  device_remove+0x40/0x80
[   44.111325]  device_release_driver_internal+0x20b/0x270
[   44.111327]  ? bus_find_device+0xb3/0xf0

Fix this by moving the release of framebuffer to fb_ops.fb_destroy function
so that framebuffer framework handles it gracefully

While we fix this, also replace manual registrations/unregistration of
framebuffer with devm_register_framebuffer.

Fixes: 68a2d20b79b1 ("drivers/video: add Hyper-V Synthetic Video Frame Buffer Driver")
Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
---
 drivers/video/fbdev/hyperv_fb.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 363e4ccfcdb7..83b1ab4da984 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -862,6 +862,16 @@ static void hvfb_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width,
 		hvfb_ondemand_refresh_throttle(par, x, y, width, height);
 }
 
+/*
+ * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
+ * of unregister_framebuffer() or fb_release(). Do any cleanup related to
+ * framebuffer here.
+ */
+static void hvfb_destroy(struct fb_info *info)
+{
+	framebuffer_release(info);
+}
+
 /*
  * TODO: GEN1 codepaths allocate from system or DMA-able memory. Fix the
  *       driver to use the _SYSMEM_ or _DMAMEM_ helpers in these cases.
@@ -877,6 +887,7 @@ static const struct fb_ops hvfb_ops = {
 	.fb_set_par = hvfb_set_par,
 	.fb_setcolreg = hvfb_setcolreg,
 	.fb_blank = hvfb_blank,
+	.fb_destroy	= hvfb_destroy,
 };
 
 /* Get options from kernel paramenter "video=" */
@@ -1172,7 +1183,7 @@ static int hvfb_probe(struct hv_device *hdev,
 	if (ret)
 		goto error;
 
-	ret = register_framebuffer(info);
+	ret = devm_register_framebuffer(&hdev->device, info);
 	if (ret) {
 		pr_err("Unable to register framebuffer\n");
 		goto error;
@@ -1220,14 +1231,11 @@ static void hvfb_remove(struct hv_device *hdev)
 
 	fb_deferred_io_cleanup(info);
 
-	unregister_framebuffer(info);
 	cancel_delayed_work_sync(&par->dwork);
 
 	vmbus_close(hdev->channel);
-	hv_set_drvdata(hdev, NULL);
 
 	hvfb_putmem(hdev, info);
-	framebuffer_release(info);
 }
 
 static int hvfb_suspend(struct hv_device *hdev)
-- 
2.43.0


