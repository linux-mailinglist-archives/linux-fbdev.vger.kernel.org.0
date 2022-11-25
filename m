Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 670A36390B2
	for <lists+linux-fbdev@lfdr.de>; Fri, 25 Nov 2022 21:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiKYUbe (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 25 Nov 2022 15:31:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbiKYUbX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 25 Nov 2022 15:31:23 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA29532C9
        for <linux-fbdev@vger.kernel.org>; Fri, 25 Nov 2022 12:31:20 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d898:271f:7512:e47f])
        by albert.telenet-ops.be with bizsmtp
        id okXG2800P4su47u06kXGQj; Fri, 25 Nov 2022 21:31:18 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oyfLw-001aQv-5Z; Fri, 25 Nov 2022 21:31:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oyfLv-003Kz0-Bf; Fri, 25 Nov 2022 21:31:15 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Helge Deller <deller@gmx.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/RFC 2/3] drm/simple-kms-helper: Add mode_fixup() to simple display pipe
Date:   Fri, 25 Nov 2022 21:31:09 +0100
Message-Id: <3b0862187f1c8910089cb0d06a8669caa985042e.1669406382.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669406380.git.geert@linux-m68k.org>
References: <cover.1669406380.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Thomas Zimmermann <tzimmermann@suse.de>

The mode fix-up function for simple display helpers is equivalent to the
regular pipeline's CRTC mode fix-up function. It's called to adjust the
CRTC's display mode for the encoder. Add this function for DRM fbconv
helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 15 +++++++++
 include/drm/drm_simple_kms_helper.h     | 43 +++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 3ef420ec4534aab5..3d7f859ac9de6814 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -96,6 +96,20 @@ drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
 	return pipe->funcs->mode_valid(pipe, mode);
 }
 
+static bool
+drm_simple_kms_crtc_mode_fixup(struct drm_crtc *crtc,
+			       const struct drm_display_mode *mode,
+			       struct drm_display_mode *adjusted_mode)
+{
+	struct drm_simple_display_pipe *pipe;
+
+	pipe = container_of(crtc, struct drm_simple_display_pipe, crtc);
+	if (!pipe->funcs || !pipe->funcs->mode_fixup)
+		return true;
+
+	return pipe->funcs->mode_fixup(crtc, mode, adjusted_mode);
+}
+
 static int drm_simple_kms_crtc_check(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
@@ -141,6 +155,7 @@ static void drm_simple_kms_crtc_disable(struct drm_crtc *crtc,
 
 static const struct drm_crtc_helper_funcs drm_simple_kms_crtc_helper_funcs = {
 	.mode_valid = drm_simple_kms_crtc_mode_valid,
+	.mode_fixup = drm_simple_kms_crtc_mode_fixup,
 	.atomic_check = drm_simple_kms_crtc_check,
 	.atomic_enable = drm_simple_kms_crtc_enable,
 	.atomic_disable = drm_simple_kms_crtc_disable,
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index 2298fe3af4cd7abb..2312d089ae85a2b6 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -52,6 +52,49 @@ struct drm_simple_display_pipe_funcs {
 	enum drm_mode_status (*mode_valid)(struct drm_simple_display_pipe *pipe,
 					   const struct drm_display_mode *mode);
 
+	/**
+	 * @mode_fixup:
+	 *
+	 * This callback is used to validate a mode. The parameter mode is the
+	 * display mode that userspace requested, adjusted_mode is the mode the
+	 * encoders need to be fed with. Note that this is the inverse semantics
+	 * of the meaning for the &drm_encoder and &drm_bridge_funcs.mode_fixup
+	 * vfunc. If the CRTC of the simple display pipe cannot support the
+	 * requested conversion from mode to adjusted_mode it should reject the
+	 * modeset.
+	 *
+	 * This function is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This function is called in the check phase of atomic modesets, which
+	 * can be aborted for any reason (including on userspace's request to
+	 * just check whether a configuration would be possible). Atomic drivers
+	 * MUST NOT touch any persistent state (hardware or software) or data
+	 * structures except the passed in adjusted_mode parameter.
+	 *
+	 * Atomic drivers which need to inspect and adjust more state should
+	 * instead use the @atomic_check callback, but note that they're not
+	 * perfectly equivalent: @mode_valid is called from
+	 * drm_atomic_helper_check_modeset(), but @atomic_check is called from
+	 * drm_atomic_helper_check_planes(), because originally it was meant for
+	 * plane update checks only.
+	 *
+	 * Also beware that userspace can request its own custom modes, neither
+	 * core nor helpers filter modes to the list of probe modes reported by
+	 * the GETCONNECTOR IOCTL and stored in &drm_connector.modes. To ensure
+	 * that modes are filtered consistently put any CRTC constraints and
+	 * limits checks into @mode_valid.
+	 *
+	 * RETURNS:
+	 *
+	 * True if an acceptable configuration is possible, false if the modeset
+	 * operation should be rejected.
+	 */
+	bool (*mode_fixup)(struct drm_crtc *crtc,
+			   const struct drm_display_mode *mode,
+			   struct drm_display_mode *adjusted_mode);
+
 	/**
 	 * @enable:
 	 *
-- 
2.25.1

