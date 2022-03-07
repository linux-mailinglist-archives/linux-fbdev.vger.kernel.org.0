Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665DB4D08ED
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Mar 2022 21:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245441AbiCGUzE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 7 Mar 2022 15:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245440AbiCGUyn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 7 Mar 2022 15:54:43 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C6E3150A
        for <linux-fbdev@vger.kernel.org>; Mon,  7 Mar 2022 12:53:33 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
        by xavier.telenet-ops.be with bizsmtp
        id 3YtW2700A1Yj8bA01YtWF7; Mon, 07 Mar 2022 21:53:33 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nRKLY-0036Ql-Nk; Mon, 07 Mar 2022 21:52:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nRKLY-0034iA-3I; Mon, 07 Mar 2022 21:52:48 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 RFC 09/10] drm/fourcc: Add DRM_FORMAT_R[124]
Date:   Mon,  7 Mar 2022 21:52:44 +0100
Message-Id: <98c062f1b5c71427d5ba6c7bca706d04b1892162.1646683502.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646683502.git.geert@linux-m68k.org>
References: <cover.1646683502.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Introduce fourcc codes for single-channel light-on-dark frame buffer
formats with two, four, and sixteen intensity levels.

As the number of bits per pixel is less than eight, these rely on proper
block handling for the calculation of bits per pixel and pitch.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
RFC, as I have no immediate need for these formats.

v2:
  - Improve pixel descriptions.
---
 drivers/gpu/drm/drm_fourcc.c  |  6 ++++++
 include/uapi/drm/drm_fourcc.h | 11 ++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 29f4fe199c4ddcf0..05e65e9ab0c69c6a 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -154,6 +154,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_C4,		.depth = 4,  .num_planes = 1,
 		  .char_per_block = { 1, }, .block_w = { 2, }, .block_h = { 1, }, .hsub = 1, .vsub = 1, .is_color_indexed = true },
 		{ .format = DRM_FORMAT_C8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_color_indexed = true },
+		{ .format = DRM_FORMAT_R1,		.depth = 1,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 8, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_R2,		.depth = 2,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 4, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_R4,		.depth = 4,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 2, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R10,		.depth = 10, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R12,		.depth = 12, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f0187cf20e4619d2..def0a73620dc86d2 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -104,8 +104,17 @@ extern "C" {
 #define DRM_FORMAT_C4		fourcc_code('C', '4', ' ', ' ') /* [7:0] C0:C1 4:4 two pixels/byte */
 #define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C 8 one pixel/byte */
 
+/* 1 bpp Red (or monochrome light-on-dark) */
+#define DRM_FORMAT_R1		fourcc_code('R', '1', ' ', ' ') /* [7:0] R0:R1:R2:R3:R4:R5:R6:R7 1:1:1:1:1:1:1:1 eight pixels/byte */
+
+/* 2 bpp Red (or generic light-on-dark) */
+#define DRM_FORMAT_R2		fourcc_code('R', '2', ' ', ' ') /* [7:0] R0:R1:R2:R3 2:2:2:2 four pixels/byte */
+
+/* 4 bpp Red (or generic light-on-dark) */
+#define DRM_FORMAT_R4		fourcc_code('R', '4', ' ', ' ') /* [7:0] R0:R1 4:4 two pixels/byte */
+
 /* 8 bpp Red (or generic light-on-dark) */
-#define DRM_FORMAT_R8		fourcc_code('R', '8', ' ', ' ') /* [7:0] R */
+#define DRM_FORMAT_R8		fourcc_code('R', '8', ' ', ' ') /* [7:0] R 8 one pixel/byte */
 
 /* 10 bpp Red (or generic light-on-dark) */
 #define DRM_FORMAT_R10		fourcc_code('R', '1', '0', ' ') /* [15:0] x:R 6:10 little endian */
-- 
2.25.1

