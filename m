Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3E4636604
	for <lists+linux-fbdev@lfdr.de>; Wed, 23 Nov 2022 17:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239079AbiKWQnU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 23 Nov 2022 11:43:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239068AbiKWQnU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 23 Nov 2022 11:43:20 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D28F22B0B
        for <linux-fbdev@vger.kernel.org>; Wed, 23 Nov 2022 08:43:18 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:881b:815b:474d:c3fd])
        by andre.telenet-ops.be with bizsmtp
        id nsjF2800J49U0Rd01sjFf2; Wed, 23 Nov 2022 17:43:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oxsqB-001SDE-2q; Wed, 23 Nov 2022 17:43:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oxsqA-001M4Y-FF; Wed, 23 Nov 2022 17:43:14 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gerd Hoffmann <kraxel@redhat.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and RGB565 formats
Date:   Wed, 23 Nov 2022 17:43:10 +0100
Message-Id: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

As of commit eae06120f1974e1a ("drm: refuse ADDFB2 ioctl for broken
bigendian drivers"), drivers must set the
quirk_addfb_prefer_host_byte_order quirk to make the drm_mode_addfb()
compat code work correctly on big-endian machines.

While that works fine for big-endian XRGB8888 and ARGB8888, which are
mapped to the existing little-endian BGRX8888 and BGRA8888 formats, it
does not work for big-endian XRGB1555 and RGB565, as the latter are not
listed in the format database.

Fix this by adding the missing formats.  Limit this to big-endian
platforms, as there is currently no need to support these formats on
little-endian platforms.

Fixes: 6960e6da9cec3f66 ("drm: fix drm_mode_addfb() on big endian machines.")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - Use "DRM_FORMAT_foo | DRM_FORMAT_BIG_ENDIAN" instead of
    "DRM_FORMAT_HOST_foo",
  - Turn into a lone patch, as all other patches from series
    https://lore.kernel.org/r/cover.1657300532.git.geert@linux-m68k.org
    were applied to drm-misc/for-linux-next.
---
 drivers/gpu/drm/drm_fourcc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e09331bb3bc73f21..265671a7f9134c1f 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -190,6 +190,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_BGRA5551,	.depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_RGB565,		.depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_BGR565,		.depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+#ifdef __BIG_ENDIAN
+		{ .format = DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+#endif
 		{ .format = DRM_FORMAT_RGB888,		.depth = 24, .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_BGR888,		.depth = 24, .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_XRGB8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
-- 
2.25.1

