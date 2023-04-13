Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15F126E0FDE
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Apr 2023 16:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjDMOXD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 13 Apr 2023 10:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjDMOXC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 13 Apr 2023 10:23:02 -0400
Received: from exchange.fintech.ru (e10edge.fintech.ru [195.54.195.159])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0800F3;
        Thu, 13 Apr 2023 07:22:58 -0700 (PDT)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 13 Apr
 2023 17:22:55 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 13 Apr
 2023 17:22:55 +0300
From:   Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To:     David Airlie <airlied@gmail.com>
CC:     Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Helge Deller <deller@gmx.de>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <intel-gfx@lists.freedesktop.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <amd-gfx@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-fbdev@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH v2] video/hdmi: minor fixes for *_infoframe_init functions
Date:   Thu, 13 Apr 2023 07:22:38 -0700
Message-ID: <20230413142238.19011-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Multiple hdmi_*_infoframe_init() functions that initialize different
types of hdmi infoframes only return default 0 value (contrary to their
descriptions). Yet these functions are still checked against possible
errors in case of failure.

This patch removes redundant checks for errors in calls to following
functions:
- hdmi_spd_infoframe_init
- hdmi_audio_infoframe_init
- hdmi_vendor_infoframe_init
- hdmi_drm_infoframe_init

Also, change their return types to void and fix descriptions.

Fixes: 2c676f378edb ("[media] hdmi: added unpack and logging functions for InfoFrames")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
v2: Fix build warning by removing unnecessary call to drm_WARN_ON()
    with uninitialized value.
    Reported-by: kernel test robot <lkp@intel.com>
    Link: https://lore.kernel.org/oe-kbuild-all/202304131234.hT3mzkju-lkp@intel.com/

 drivers/gpu/drm/display/drm_hdmi_helper.c |  5 +---
 drivers/gpu/drm/drm_edid.c                |  5 +---
 drivers/gpu/drm/i915/display/intel_hdmi.c |  4 +--
 drivers/gpu/drm/mediatek/mtk_hdmi.c       | 14 ++--------
 drivers/gpu/drm/radeon/r600_hdmi.c      
 drivers/gpu/drm/display/drm_hdmi_helper.c |  5 +---
 drivers/gpu/drm/drm_edid.c                |  5 +---
 drivers/gpu/drm/i915/display/intel_hdmi.c |  7 ++---
 drivers/gpu/drm/mediatek/mtk_hdmi.c       | 14 ++--------
 drivers/gpu/drm/radeon/r600_hdmi.c        |  6 +----
 drivers/gpu/drm/sti/sti_hdmi.c            |  6 +----
 drivers/gpu/drm/tegra/hdmi.c              |  7 +----
 drivers/gpu/drm/tegra/sor.c               |  6 +----
 drivers/gpu/drm/vc4/vc4_hdmi.c            |  7 +----
 drivers/video/hdmi.c                      | 44 ++++++-------------------------
 include/linux/hdmi.h                      |  8 +++---
 11 files changed, 23 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index faf5e9efa7d3..ce7038a3a183 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -27,7 +27,6 @@ int drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
 {
 	struct drm_connector *connector;
 	struct hdr_output_metadata *hdr_metadata;
-	int err;
 
 	if (!frame || !conn_state)
 		return -EINVAL;
@@ -47,9 +46,7 @@ int drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
 	    connector->hdr_sink_metadata.hdmi_type1.eotf))
 		DRM_DEBUG_KMS("Unknown EOTF %d\n", hdr_metadata->hdmi_metadata_type1.eotf);
 
-	err = hdmi_drm_infoframe_init(frame);
-	if (err < 0)
-		return err;
+	hdmi_drm_infoframe_init(frame);
 
 	frame->eotf = hdr_metadata->hdmi_metadata_type1.eotf;
 	frame->metadata_type = hdr_metadata->hdmi_metadata_type1.metadata_type;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 261a62e15934..c268148502d6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -7159,7 +7159,6 @@ drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
 	 */
 	bool has_hdmi_infoframe = connector ?
 		connector->display_info.has_hdmi_infoframe : false;
-	int err;
 
 	if (!frame || !mode)
 		return -EINVAL;
@@ -7167,9 +7166,7 @@ drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
 	if (!has_hdmi_infoframe)
 		return -EINVAL;
 
-	err = hdmi_vendor_infoframe_init(frame);
-	if (err < 0)
-		return err;
+	hdmi_vendor_infoframe_init(frame);
 
 	/*
 	 * Even if it's not absolutely necessary to send the infoframe
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index c0ce6d3dc505..59e2f53015c0 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -778,12 +778,9 @@ intel_hdmi_compute_spd_infoframe(struct intel_encoder *encoder,
 		intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_SPD);
 
 	if (IS_DGFX(i915))
-		ret = hdmi_spd_infoframe_init(frame, "Intel", "Discrete gfx");
+		hdmi_spd_infoframe_init(frame, "Intel", "Discrete gfx");
 	else
-		ret = hdmi_spd_infoframe_init(frame, "Intel", "Integrated gfx");
-
-	if (drm_WARN_ON(encoder->base.dev, ret))
-		return false;
+		hdmi_spd_infoframe_init(frame, "Intel", "Integrated gfx");
 
 	frame->sdi = HDMI_SPD_SDI_PC;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0a8e0a13f516..75899e4a011f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -995,12 +995,7 @@ static int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi,
 	u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_SPD_INFOFRAME_SIZE];
 	ssize_t err;
 
-	err = hdmi_spd_infoframe_init(&frame, vendor, product);
-	if (err < 0) {
-		dev_err(hdmi->dev, "Failed to initialize SPD infoframe: %zd\n",
-			err);
-		return err;
-	}
+	hdmi_spd_infoframe_init(&frame, vendor, product);
 
 	err = hdmi_spd_infoframe_pack(&frame, buffer, sizeof(buffer));
 	if (err < 0) {
@@ -1018,12 +1013,7 @@ static int mtk_hdmi_setup_audio_infoframe(struct mtk_hdmi *hdmi)
 	u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_AUDIO_INFOFRAME_SIZE];
 	ssize_t err;
 
-	err = hdmi_audio_infoframe_init(&frame);
-	if (err < 0) {
-		dev_err(hdmi->dev, "Failed to setup audio infoframe: %zd\n",
-			err);
-		return err;
-	}
+	hdmi_audio_infoframe_init(&frame);
 
 	frame.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
 	frame.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
diff --git a/drivers/gpu/drm/radeon/r600_hdmi.c b/drivers/gpu/drm/radeon/r600_hdmi.c
index f3551ebaa2f0..b690254562e8 100644
--- a/drivers/gpu/drm/radeon/r600_hdmi.c
+++ b/drivers/gpu/drm/radeon/r600_hdmi.c
@@ -432,11 +432,7 @@ void r600_hdmi_update_audio_settings(struct drm_encoder *encoder)
 	DRM_DEBUG("0x%02X IEC60958 status bits and 0x%02X category code\n",
 		  (int)audio.status_bits, (int)audio.category_code);
 
-	err = hdmi_audio_infoframe_init(&frame);
-	if (err < 0) {
-		DRM_ERROR("failed to setup audio infoframe\n");
-		return;
-	}
+	hdmi_audio_infoframe_init(&frame);
 
 	frame.channels = audio.channels;
 
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 8539fe1fedc4..1f92db1fb960 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1321,11 +1321,7 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	/* Initialize audio infoframe */
-	err = hdmi_audio_infoframe_init(&hdmi->audio.cea);
-	if (err) {
-		DRM_ERROR("Failed to init audio infoframe\n");
-		goto err_sysfs;
-	}
+	hdmi_audio_infoframe_init(&hdmi->audio.cea);
 
 	cec_fill_conn_info_from_drm(&conn_info, drm_connector);
 	hdmi->notifier = cec_notifier_conn_register(&hdmi->dev, NULL,
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 40ec3e6cf204..fe8fcd1b056b 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -747,12 +747,7 @@ static void tegra_hdmi_setup_audio_infoframe(struct tegra_hdmi *hdmi)
 	u8 buffer[14];
 	ssize_t err;
 
-	err = hdmi_audio_infoframe_init(&frame);
-	if (err < 0) {
-		dev_err(hdmi->dev, "failed to setup audio infoframe: %zd\n",
-			err);
-		return;
-	}
+	hdmi_audio_infoframe_init(&frame);
 
 	frame.channels = hdmi->format.channels;
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 8af632740673..d8cd93d5af10 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2021,11 +2021,7 @@ static int tegra_sor_hdmi_enable_audio_infoframe(struct tegra_sor *sor)
 	u32 value;
 	int err;
 
-	err = hdmi_audio_infoframe_init(&frame);
-	if (err < 0) {
-		dev_err(sor->dev, "failed to setup audio infoframe: %d\n", err);
-		return err;
-	}
+	hdmi_audio_infoframe_init(&frame);
 
 	frame.channels = sor->format.channels;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ea22c9bf223a..d7de86b41901 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -816,13 +816,8 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 static void vc4_hdmi_set_spd_infoframe(struct drm_encoder *encoder)
 {
 	union hdmi_infoframe frame;
-	int ret;
 
-	ret = hdmi_spd_infoframe_init(&frame.spd, "Broadcom", "Videocore");
-	if (ret < 0) {
-		DRM_ERROR("couldn't fill SPD infoframe\n");
-		return;
-	}
+	hdmi_spd_infoframe_init(&frame.spd, "Broadcom", "Videocore");
 
 	frame.spd.sdi = HDMI_SPD_SDI_PC;
 
diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 03c7f27dde49..a4a1359415a0 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -216,10 +216,8 @@ EXPORT_SYMBOL(hdmi_avi_infoframe_pack);
  * @frame: HDMI SPD infoframe
  * @vendor: vendor string
  * @product: product string
- *
- * Returns 0 on success or a negative error code on failure.
  */
-int hdmi_spd_infoframe_init(struct hdmi_spd_infoframe *frame,
+void hdmi_spd_infoframe_init(struct hdmi_spd_infoframe *frame,
 			    const char *vendor, const char *product)
 {
 	size_t len;
@@ -234,8 +232,6 @@ int hdmi_spd_infoframe_init(struct hdmi_spd_infoframe *frame,
 	memcpy(frame->vendor, vendor, min(len, sizeof(frame->vendor)));
 	len = strlen(product);
 	memcpy(frame->product, product, min(len, sizeof(frame->product)));
-
-	return 0;
 }
 EXPORT_SYMBOL(hdmi_spd_infoframe_init);
 
@@ -348,18 +344,14 @@ EXPORT_SYMBOL(hdmi_spd_infoframe_pack);
 /**
  * hdmi_audio_infoframe_init() - initialize an HDMI audio infoframe
  * @frame: HDMI audio infoframe
- *
- * Returns 0 on success or a negative error code on failure.
  */
-int hdmi_audio_infoframe_init(struct hdmi_audio_infoframe *frame)
+void hdmi_audio_infoframe_init(struct hdmi_audio_infoframe *frame)
 {
 	memset(frame, 0, sizeof(*frame));
 
 	frame->type = HDMI_INFOFRAME_TYPE_AUDIO;
 	frame->version = 1;
 	frame->length = HDMI_AUDIO_INFOFRAME_SIZE;
-
-	return 0;
 }
 EXPORT_SYMBOL(hdmi_audio_infoframe_init);
 
@@ -526,10 +518,8 @@ EXPORT_SYMBOL(hdmi_audio_infoframe_pack_for_dp);
 /**
  * hdmi_vendor_infoframe_init() - initialize an HDMI vendor infoframe
  * @frame: HDMI vendor infoframe
- *
- * Returns 0 on success or a negative error code on failure.
  */
-int hdmi_vendor_infoframe_init(struct hdmi_vendor_infoframe *frame)
+void hdmi_vendor_infoframe_init(struct hdmi_vendor_infoframe *frame)
 {
 	memset(frame, 0, sizeof(*frame));
 
@@ -544,8 +534,6 @@ int hdmi_vendor_infoframe_init(struct hdmi_vendor_infoframe *frame)
 	 */
 	frame->s3d_struct = HDMI_3D_STRUCTURE_INVALID;
 	frame->length = HDMI_VENDOR_INFOFRAME_SIZE;
-
-	return 0;
 }
 EXPORT_SYMBOL(hdmi_vendor_infoframe_init);
 
@@ -698,18 +686,14 @@ hdmi_vendor_any_infoframe_check_only(const union hdmi_vendor_any_infoframe *fram
  * hdmi_drm_infoframe_init() - initialize an HDMI Dynaminc Range and
  * mastering infoframe
  * @frame: HDMI DRM infoframe
- *
- * Returns 0 on success or a negative error code on failure.
  */
-int hdmi_drm_infoframe_init(struct hdmi_drm_infoframe *frame)
+void hdmi_drm_infoframe_init(struct hdmi_drm_infoframe *frame)
 {
 	memset(frame, 0, sizeof(*frame));
 
 	frame->type = HDMI_INFOFRAME_TYPE_DRM;
 	frame->version = 1;
 	frame->length = HDMI_DRM_INFOFRAME_SIZE;
-
-	return 0;
 }
 EXPORT_SYMBOL(hdmi_drm_infoframe_init);
 
@@ -1661,7 +1645,6 @@ static int hdmi_spd_infoframe_unpack(struct hdmi_spd_infoframe *frame,
 				     const void *buffer, size_t size)
 {
 	const u8 *ptr = buffer;
-	int ret;
 
 	if (size < HDMI_INFOFRAME_SIZE(SPD))
 		return -EINVAL;
@@ -1677,9 +1660,7 @@ static int hdmi_spd_infoframe_unpack(struct hdmi_spd_infoframe *frame,
 
 	ptr += HDMI_INFOFRAME_HEADER_SIZE;
 
-	ret = hdmi_spd_infoframe_init(frame, ptr, ptr + 8);
-	if (ret)
-		return ret;
+	hdmi_spd_infoframe_init(frame, ptr, ptr + 8);
 
 	frame->sdi = ptr[24];
 
@@ -1703,7 +1684,6 @@ static int hdmi_audio_infoframe_unpack(struct hdmi_audio_infoframe *frame,
 				       const void *buffer, size_t size)
 {
 	const u8 *ptr = buffer;
-	int ret;
 
 	if (size < HDMI_INFOFRAME_SIZE(AUDIO))
 		return -EINVAL;
@@ -1717,9 +1697,7 @@ static int hdmi_audio_infoframe_unpack(struct hdmi_audio_infoframe *frame,
 	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(AUDIO)) != 0)
 		return -EINVAL;
 
-	ret = hdmi_audio_infoframe_init(frame);
-	if (ret)
-		return ret;
+	hdmi_audio_infoframe_init(frame);
 
 	ptr += HDMI_INFOFRAME_HEADER_SIZE;
 
@@ -1755,7 +1733,6 @@ hdmi_vendor_any_infoframe_unpack(union hdmi_vendor_any_infoframe *frame,
 {
 	const u8 *ptr = buffer;
 	size_t length;
-	int ret;
 	u8 hdmi_video_format;
 	struct hdmi_vendor_infoframe *hvf = &frame->hdmi;
 
@@ -1789,9 +1766,7 @@ hdmi_vendor_any_infoframe_unpack(union hdmi_vendor_any_infoframe *frame,
 	if (hdmi_video_format > 0x2)
 		return -EINVAL;
 
-	ret = hdmi_vendor_infoframe_init(hvf);
-	if (ret)
-		return ret;
+	hdmi_vendor_infoframe_init(hvf);
 
 	hvf->length = length;
 
@@ -1837,15 +1812,12 @@ int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
 	const u8 *temp;
 	u8 x_lsb, x_msb;
 	u8 y_lsb, y_msb;
-	int ret;
 	int i;
 
 	if (size < HDMI_DRM_INFOFRAME_SIZE)
 		return -EINVAL;
 
-	ret = hdmi_drm_infoframe_init(frame);
-	if (ret)
-		return ret;
+	hdmi_drm_infoframe_init(frame);
 
 	frame->eotf = ptr[0] & 0x7;
 	frame->metadata_type = ptr[1] & 0x7;
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 2f4dcc8d060e..e60a28d181f2 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -214,7 +214,7 @@ ssize_t hdmi_avi_infoframe_pack(struct hdmi_avi_infoframe *frame, void *buffer,
 ssize_t hdmi_avi_infoframe_pack_only(const struct hdmi_avi_infoframe *frame,
 				     void *buffer, size_t size);
 int hdmi_avi_infoframe_check(struct hdmi_avi_infoframe *frame);
-int hdmi_drm_infoframe_init(struct hdmi_drm_infoframe *frame);
+void hdmi_drm_infoframe_init(struct hdmi_drm_infoframe *frame);
 ssize_t hdmi_drm_infoframe_pack(struct hdmi_drm_infoframe *frame, void *buffer,
 				size_t size);
 ssize_t hdmi_drm_infoframe_pack_only(const struct hdmi_drm_infoframe *frame,
@@ -249,7 +249,7 @@ struct hdmi_spd_infoframe {
 	enum hdmi_spd_sdi sdi;
 };
 
-int hdmi_spd_infoframe_init(struct hdmi_spd_infoframe *frame,
+void hdmi_spd_infoframe_init(struct hdmi_spd_infoframe *frame,
 			    const char *vendor, const char *product);
 ssize_t hdmi_spd_infoframe_pack(struct hdmi_spd_infoframe *frame, void *buffer,
 				size_t size);
@@ -331,7 +331,7 @@ struct hdmi_audio_infoframe {
 
 };
 
-int hdmi_audio_infoframe_init(struct hdmi_audio_infoframe *frame);
+void hdmi_audio_infoframe_init(struct hdmi_audio_infoframe *frame);
 ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
 				  void *buffer, size_t size);
 ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
@@ -393,7 +393,7 @@ struct hdr_sink_metadata {
 	};
 };
 
-int hdmi_vendor_infoframe_init(struct hdmi_vendor_infoframe *frame);
+void hdmi_vendor_infoframe_init(struct hdmi_vendor_infoframe *frame);
 ssize_t hdmi_vendor_infoframe_pack(struct hdmi_vendor_infoframe *frame,
 				   void *buffer, size_t size);
 ssize_t hdmi_vendor_infoframe_pack_only(const struct hdmi_vendor_infoframe *frame,
