Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC9B1951E7
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2020 08:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgC0H2q (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 27 Mar 2020 03:28:46 -0400
Received: from mga14.intel.com ([192.55.52.115]:61770 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgC0H2p (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 27 Mar 2020 03:28:45 -0400
IronPort-SDR: /4M6uuXg8VEoxdcgBoStEYDsoVAI/FKVKP7R1GW7V9iEw3jo6p/5n+0CSSq05etxBXHH/EKNQn
 qg9v3WKbS/0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 00:28:45 -0700
IronPort-SDR: ukAc+pVqOtkt4rV+7os7bCAODKB5Q06/7TsMJ3qzFaB7B3O0dFMYgxyrBfWlISEtSm1d/iTOy6
 mAywy5vZAXgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; 
   d="scan'208";a="394292003"
Received: from aburk3x-mobl1.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.26.111])
  by orsmga004.jf.intel.com with ESMTP; 27 Mar 2020 00:28:43 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com
Subject: [PATCH v8 03/14] drm: Add logging function for DP VSC SDP
Date:   Fri, 27 Mar 2020 09:29:06 +0200
Message-Id: <20200327072917.3676391-4-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
References: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
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

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 174 ++++++++++++++++++++++++++++++++
 include/drm/drm_dp_helper.h     |   3 +
 2 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 8ba4531e808d..e4f8e0ca44b7 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1535,3 +1535,177 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
 	return num_bpc;
 }
 EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
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
index 305533da13ad..d23b7286ac42 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1339,6 +1339,9 @@ struct drm_dp_vsc_sdp {
 	enum dp_content_type content_type;
 };
 
+void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
+			const struct drm_dp_vsc_sdp *vsc);
+
 int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
 
 static inline int
-- 
2.25.0

