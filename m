Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783331C8C2A
	for <lists+linux-fbdev@lfdr.de>; Thu,  7 May 2020 15:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgEGN1N (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 7 May 2020 09:27:13 -0400
Received: from mga17.intel.com ([192.55.52.151]:60550 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726235AbgEGN1N (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 7 May 2020 09:27:13 -0400
IronPort-SDR: 3OvMYoZRxiaXkI8QHqIiEbw//toIWmuhK77FOxJBivIfQCP0qDdofOGg9WlxhbUDJex+VT+hIH
 KBHuor65R7Tg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 06:27:13 -0700
IronPort-SDR: yS8//KAZbM+SBzAoKAzbhhG/5NGKeFkT3W/kEsSE9SL9HpNxm6KkWV3BJHhterNOdRL4UY1Oq9
 CCQTFaSxQqbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; 
   d="scan'208";a="260528003"
Received: from plaurent-mobl.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.251.84.89])
  by orsmga003.jf.intel.com with ESMTP; 07 May 2020 06:27:11 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v11 03/14] drm: Add logging function for DP VSC SDP
Date:   Thu,  7 May 2020 16:26:55 +0300
Message-Id: <20200507132706.2058969-4-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200507132706.2058969-1-gwan-gyeong.mun@intel.com>
References: <20200507132706.2058969-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

When receiving video it is very useful to be able to log DP VSC SDP.
This greatly simplifies debugging.

v2: Minor style fix
v3: Move logging functions to drm core [Jani N]
v5: Rebased
v10: Rebased

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 174 ++++++++++++++++++++++++++++++++
 include/drm/drm_dp_helper.h     |   3 +
 2 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 612a59ec8116..43e57632b00a 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1629,3 +1629,177 @@ int drm_dp_set_phy_test_pattern(struct drm_dp_aux *aux,
 	return 0;
 }
 EXPORT_SYMBOL(drm_dp_set_phy_test_pattern);
+
+static const char *dp_pixelformat_get_name(enum dp_pixelformat pixelformat)
+{
+	if (pixelformat < 0 || pixelformat > DP_PIXELFORMAT_RESERVED)
+		return "Invalid";
+
+	switch (pixelformat) {
+	case DP_PIXELFORMAT_RGB:
+		return "RGB";
+	case DP_PIXELFORMAT_YUV444:
+		return "YUV444";
+	case DP_PIXELFORMAT_YUV422:
+		return "YUV422";
+	case DP_PIXELFORMAT_YUV420:
+		return "YUV420";
+	case DP_PIXELFORMAT_Y_ONLY:
+		return "Y_ONLY";
+	case DP_PIXELFORMAT_RAW:
+		return "RAW";
+	default:
+		return "Reserved";
+	}
+}
+
+static const char *dp_colorimetry_get_name(enum dp_pixelformat pixelformat,
+					   enum dp_colorimetry colorimetry)
+{
+	if (pixelformat < 0 || pixelformat > DP_PIXELFORMAT_RESERVED)
+		return "Invalid";
+
+	switch (colorimetry) {
+	case DP_COLORIMETRY_DEFAULT:
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "sRGB";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "BT.601";
+		case DP_PIXELFORMAT_Y_ONLY:
+			return "DICOM PS3.14";
+		case DP_PIXELFORMAT_RAW:
+			return "Custom Color Profile";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_RGB_WIDE_FIXED: /* and DP_COLORIMETRY_BT709_YCC */
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "Wide Fixed";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "BT.709";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_RGB_WIDE_FLOAT: /* and DP_COLORIMETRY_XVYCC_601 */
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "Wide Float";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "xvYCC 601";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_OPRGB: /* and DP_COLORIMETRY_XVYCC_709 */
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "OpRGB";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "xvYCC 709";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_DCI_P3_RGB: /* and DP_COLORIMETRY_SYCC_601 */
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "DCI-P3";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "sYCC 601";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_RGB_CUSTOM: /* and DP_COLORIMETRY_OPYCC_601 */
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "Custom Profile";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "OpYCC 601";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_BT2020_RGB: /* and DP_COLORIMETRY_BT2020_CYCC */
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "BT.2020 RGB";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "BT.2020 CYCC";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_BT2020_YCC:
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "BT.2020 YCC";
+		default:
+			return "Reserved";
+		}
+	default:
+		return "Invalid";
+	}
+}
+
+static const char *dp_dynamic_range_get_name(enum dp_dynamic_range dynamic_range)
+{
+	switch (dynamic_range) {
+	case DP_DYNAMIC_RANGE_VESA:
+		return "VESA range";
+	case DP_DYNAMIC_RANGE_CTA:
+		return "CTA range";
+	default:
+		return "Invalid";
+	}
+}
+
+static const char *dp_content_type_get_name(enum dp_content_type content_type)
+{
+	switch (content_type) {
+	case DP_CONTENT_TYPE_NOT_DEFINED:
+		return "Not defined";
+	case DP_CONTENT_TYPE_GRAPHICS:
+		return "Graphics";
+	case DP_CONTENT_TYPE_PHOTO:
+		return "Photo";
+	case DP_CONTENT_TYPE_VIDEO:
+		return "Video";
+	case DP_CONTENT_TYPE_GAME:
+		return "Game";
+	default:
+		return "Reserved";
+	}
+}
+
+void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
+			const struct drm_dp_vsc_sdp *vsc)
+{
+#define DP_SDP_LOG(fmt, ...) dev_printk(level, dev, fmt, ##__VA_ARGS__)
+	DP_SDP_LOG("DP SDP: %s, revision %u, length %u\n", "VSC",
+		   vsc->revision, vsc->length);
+	DP_SDP_LOG("    pixelformat: %s\n",
+		   dp_pixelformat_get_name(vsc->pixelformat));
+	DP_SDP_LOG("    colorimetry: %s\n",
+		   dp_colorimetry_get_name(vsc->pixelformat, vsc->colorimetry));
+	DP_SDP_LOG("    bpc: %u\n", vsc->bpc);
+	DP_SDP_LOG("    dynamic range: %s\n",
+		   dp_dynamic_range_get_name(vsc->dynamic_range));
+	DP_SDP_LOG("    content type: %s\n",
+		   dp_content_type_get_name(vsc->content_type));
+#undef DP_SDP_LOG
+}
+EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 6c4b53dcb851..2035ac44afde 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1348,6 +1348,9 @@ struct drm_dp_vsc_sdp {
 	enum dp_content_type content_type;
 };
 
+void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
+			const struct drm_dp_vsc_sdp *vsc);
+
 int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
 
 static inline int
-- 
2.25.0

