Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4E485EDAA2
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Sep 2022 12:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbiI1Kxz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 28 Sep 2022 06:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233973AbiI1Kxc (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 28 Sep 2022 06:53:32 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D544A82E
        for <linux-fbdev@vger.kernel.org>; Wed, 28 Sep 2022 03:50:30 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id C14F21F8D7;
        Wed, 28 Sep 2022 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1664362213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jo/jfbE1kUYbklxtyFc3gLH6gUYZIwdxT1MLMhgJIPM=;
        b=YpgnW+Gcwl+JTWlTHlhyMrFmGAJP1fmSs7dxxuk4jv8LrV4fuNjDLPU3Fd45E5CwSG77Nl
        CuD4T4Fui0B2xOn3l4PVpdWrm3Z96ZUg5vXBCATU1dw7Dw7SmfIJmenwf9VlcOzFKGEdjO
        pyV4OxaKR4ebgq3pg4IHOXI8QEh3ORc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1664362213;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jo/jfbE1kUYbklxtyFc3gLH6gUYZIwdxT1MLMhgJIPM=;
        b=q74IWhERpi801X3VW34LkCfwbkpmSsJ3CTTigWBIgRHmR4EDkCY+eqNrXKuo7YK7bpfPWp
        3ytMTu5XVkFuMoDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7AC0D13A86;
        Wed, 28 Sep 2022 10:50:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id uEIuHeUmNGMUEwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 28 Sep 2022 10:50:13 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
        deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
        msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, geert@linux-m68k.org,
        mark.cave-ayland@ilande.co.uk
Cc:     linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Date:   Wed, 28 Sep 2022 12:50:10 +0200
Message-Id: <20220928105010.18880-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928105010.18880-1-tzimmermann@suse.de>
References: <20220928105010.18880-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

All DRM formats assume little-endian byte order. On big-endian systems,
it is likely that the scanout buffer is in big endian as well. Update
the format accordingly and add endianess conversion to the format-helper
library. Also opt-in to allocated buffers in host format by default.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 10 ++++++
 drivers/gpu/drm/tiny/ofdrm.c        | 55 +++++++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 4afc4ac27342..fca7936db083 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -659,6 +659,11 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, false);
 			return 0;
 		}
+	} else if (dst_format == (DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN)) {
+		if (fb_format == DRM_FORMAT_RGB565) {
+			drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
+			return 0;
+		}
 	} else if (dst_format == DRM_FORMAT_RGB888) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
 			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip);
@@ -677,6 +682,11 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
 			return 0;
 		}
+	} else if (dst_format == DRM_FORMAT_BGRX8888) {
+		if (fb_format == DRM_FORMAT_XRGB8888) {
+			drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
+			return 0;
+		}
 	}
 
 	drm_warn_once(fb->dev, "No conversion helper from %p4cc to %p4cc found.\n",
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 0bf5eebf6678..6e100a7f5db7 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -94,7 +94,7 @@ static int display_get_validated_int0(struct drm_device *dev, const char *name,
 }
 
 static const struct drm_format_info *display_get_validated_format(struct drm_device *dev,
-								  u32 depth)
+								  u32 depth, bool big_endian)
 {
 	const struct drm_format_info *info;
 	u32 format;
@@ -115,6 +115,29 @@ static const struct drm_format_info *display_get_validated_format(struct drm_dev
 		return ERR_PTR(-EINVAL);
 	}
 
+	/*
+	 * DRM formats assume little-endian byte order. Update the format
+	 * if the scanout buffer uses big-endian ordering.
+	 */
+	if (big_endian) {
+		switch (format) {
+		case DRM_FORMAT_XRGB8888:
+			format = DRM_FORMAT_BGRX8888;
+			break;
+		case DRM_FORMAT_ARGB8888:
+			format = DRM_FORMAT_BGRA8888;
+			break;
+		case DRM_FORMAT_RGB565:
+			format = DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN;
+			break;
+		case DRM_FORMAT_XRGB1555:
+			format = DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN;
+			break;
+		default:
+			break;
+		}
+	}
+
 	info = drm_format_info(format);
 	if (!info) {
 		drm_err(dev, "cannot find framebuffer format for depth %u\n", depth);
@@ -134,6 +157,23 @@ static int display_read_u32_of(struct drm_device *dev, struct device_node *of_no
 	return ret;
 }
 
+static bool display_get_big_endian_of(struct drm_device *dev, struct device_node *of_node)
+{
+	bool big_endian;
+
+#ifdef __BIG_ENDIAN
+	big_endian = true;
+	if (of_get_property(of_node, "little-endian", NULL))
+		big_endian = false;
+#else
+	big_endian = false;
+	if (of_get_property(of_node, "big-endian", NULL))
+		big_endian = true;
+#endif
+
+	return big_endian;
+}
+
 static int display_get_width_of(struct drm_device *dev, struct device_node *of_node)
 {
 	u32 width;
@@ -613,6 +653,7 @@ static void ofdrm_device_set_gamma_linear(struct ofdrm_device *odev,
 
 	switch (format->format) {
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
 		/* Use better interpolation, to take 32 values from 0 to 255 */
 		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE / 8; i++) {
 			unsigned char r = i * 8 + i / 4;
@@ -631,6 +672,7 @@ static void ofdrm_device_set_gamma_linear(struct ofdrm_device *odev,
 		}
 		break;
 	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_BGRX8888:
 		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE; i++)
 			odev->funcs->cmap_write(odev, i, i, i, i);
 		break;
@@ -650,6 +692,7 @@ static void ofdrm_device_set_gamma(struct ofdrm_device *odev,
 
 	switch (format->format) {
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
 		/* Use better interpolation, to take 32 values from lut[0] to lut[255] */
 		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE / 8; i++) {
 			unsigned char r = lut[i * 8 + i / 4].red >> 8;
@@ -668,6 +711,7 @@ static void ofdrm_device_set_gamma(struct ofdrm_device *odev,
 		}
 		break;
 	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_BGRX8888:
 		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE; i++) {
 			unsigned char r = lut[i].red >> 8;
 			unsigned char g = lut[i].green >> 8;
@@ -718,6 +762,9 @@ static const uint32_t ofdrm_primary_plane_formats[] = {
 	DRM_FORMAT_RGB565,
 	//DRM_FORMAT_XRGB1555,
 	//DRM_FORMAT_C8,
+	/* Big-endian formats below */
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN,
 };
 
 static const uint64_t ofdrm_primary_plane_format_modifiers[] = {
@@ -1048,6 +1095,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	struct ofdrm_device *odev;
 	struct drm_device *dev;
 	enum ofdrm_model model;
+	bool big_endian;
 	int width, height, depth, linebytes;
 	const struct drm_format_info *format;
 	u64 address;
@@ -1109,6 +1157,8 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 		break;
 	}
 
+	big_endian = display_get_big_endian_of(dev, of_node);
+
 	width = display_get_width_of(dev, of_node);
 	if (width < 0)
 		return ERR_PTR(width);
@@ -1122,7 +1172,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	if (linebytes < 0)
 		return ERR_PTR(linebytes);
 
-	format = display_get_validated_format(dev, depth);
+	format = display_get_validated_format(dev, depth, big_endian);
 	if (IS_ERR(format))
 		return ERR_CAST(format);
 	if (!linebytes) {
@@ -1234,6 +1284,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 		dev->mode_config.preferred_depth = depth;
 		break;
 	}
+	dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
 
 	/* Primary plane */
 
-- 
2.37.3

