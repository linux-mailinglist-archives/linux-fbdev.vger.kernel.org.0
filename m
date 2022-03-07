Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD5F4D08FF
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Mar 2022 21:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245533AbiCGUzQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 7 Mar 2022 15:55:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245364AbiCGUy7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 7 Mar 2022 15:54:59 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C73D33A14
        for <linux-fbdev@vger.kernel.org>; Mon,  7 Mar 2022 12:53:37 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
        by andre.telenet-ops.be with bizsmtp
        id 3YtW270091Yj8bA01YtW13; Mon, 07 Mar 2022 21:53:37 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nRKLY-0036Qq-Na; Mon, 07 Mar 2022 21:52:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nRKLY-0034iG-4G; Mon, 07 Mar 2022 21:52:48 +0100
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
Subject: [PATCH v2 RFC 10/10] drm/fourcc: Add DRM_FORMAT_D[1248]
Date:   Mon,  7 Mar 2022 21:52:45 +0100
Message-Id: <e05254ba67598b3973010a7b6f31dd6b20a66844.1646683502.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646683502.git.geert@linux-m68k.org>
References: <cover.1646683502.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

As Rn is light-on-dark, and Cn can be any colors, there are currently
no fourcc codes to describe dark-on-light displays.

Introduce fourcc codes for a single-channel dark-on-light frame buffer
format with two, four, sixteen, or 256 darkness levels.

As the number of bits per pixel may be less than eight, some of these
formats rely on proper block handling for the calculation of bits per
pixel and pitch.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
RFC, as I have no immediate need for these formats.

v2:
  - Add rationale for adding new formats,
  - Improve pixel descriptions,
  - Add D[248] for completeness.
---
 drivers/gpu/drm/drm_fourcc.c  |  7 +++++++
 include/uapi/drm/drm_fourcc.h | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 05e65e9ab0c69c6a..e09331bb3bc73f21 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -154,6 +154,13 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_C4,		.depth = 4,  .num_planes = 1,
 		  .char_per_block = { 1, }, .block_w = { 2, }, .block_h = { 1, }, .hsub = 1, .vsub = 1, .is_color_indexed = true },
 		{ .format = DRM_FORMAT_C8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_color_indexed = true },
+		{ .format = DRM_FORMAT_D1,		.depth = 1,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 8, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_D2,		.depth = 2,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 4, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_D4,		.depth = 4,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 2, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_D8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R1,		.depth = 1,  .num_planes = 1,
 		  .char_per_block = { 1, }, .block_w = { 8, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R2,		.depth = 2,  .num_planes = 1,
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index def0a73620dc86d2..1d8d82b1742898c0 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -104,6 +104,18 @@ extern "C" {
 #define DRM_FORMAT_C4		fourcc_code('C', '4', ' ', ' ') /* [7:0] C0:C1 4:4 two pixels/byte */
 #define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C 8 one pixel/byte */
 
+/* 1 bpp Darkness (monochrome dark-on-light) */
+#define DRM_FORMAT_D1		fourcc_code('D', '1', ' ', ' ') /* [7:0] D0:D1:D2:D3:D4:D5:D6:D7 1:1:1:1:1:1:1:1 eight pixels/byte */
+
+/* 2 bpp Darkness (generic dark-on-light) */
+#define DRM_FORMAT_D2		fourcc_code('D', '2', ' ', ' ') /* [7:0] D0:D1:D2:D3 2:2:2:2 four pixels/byte */
+
+/* 4 bpp Darkness (generic dark-on-light) */
+#define DRM_FORMAT_D4		fourcc_code('D', '4', ' ', ' ') /* [7:0] D0:D1 4:4 two pixels/byte */
+
+/* 8 bpp Darkness (generic dark-on-light) */
+#define DRM_FORMAT_D8		fourcc_code('D', '8', ' ', ' ') /* [7:0] D 8 one pixel/byte */
+
 /* 1 bpp Red (or monochrome light-on-dark) */
 #define DRM_FORMAT_R1		fourcc_code('R', '1', ' ', ' ') /* [7:0] R0:R1:R2:R3:R4:R5:R6:R7 1:1:1:1:1:1:1:1 eight pixels/byte */
 
-- 
2.25.1

