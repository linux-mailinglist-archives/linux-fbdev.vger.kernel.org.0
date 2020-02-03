Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51B4015133F
	for <lists+linux-fbdev@lfdr.de>; Tue,  4 Feb 2020 00:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgBCXce (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 3 Feb 2020 18:32:34 -0500
Received: from mga06.intel.com ([134.134.136.31]:12327 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726474AbgBCXce (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 3 Feb 2020 18:32:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Feb 2020 15:20:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; 
   d="scan'208";a="310866764"
Received: from helsinki.fi.intel.com ([10.237.66.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Feb 2020 15:20:17 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v3 01/17] drm: add DP 1.4 VSC SDP Payload related enums and a structure
Date:   Tue,  4 Feb 2020 01:19:58 +0200
Message-Id: <20200203232014.906651-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

It adds new enumeration definitions for VSC SDP Payload for Pixel
Encoding/Colorimetry Format.
And it adds a new drm data structure for DP VSC SDP.

enum dp_colorspace and enum dp_colorimetry correspond "Pixel Encoding and
Colorimetry Formats". enum dp_dynamic_range corresponds "Dynamic Range".
And enum dp_content_type corresponds "Content Type"
All of them are based on DP 1.4 spec [Table 2-117: VSC SDP Payload for
DB16 through DB18].

v3: Add a new drm data structure for DP VSC SDP

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/drm/drm_dp_helper.h | 57 +++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 262faf9e5e94..c098727681fa 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1209,6 +1209,63 @@ struct dp_sdp {
 #define EDP_VSC_PSR_UPDATE_RFB		(1<<1)
 #define EDP_VSC_PSR_CRC_VALUES_VALID	(1<<2)
 
+/* Based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through DB18] */
+enum dp_colorspace {
+	DP_COLORSPACE_RGB = 0,
+	DP_COLORSPACE_YUV444 = 0x1,
+	DP_COLORSPACE_YUV422 = 0x2,
+	DP_COLORSPACE_YUV420 = 0x3,
+	DP_COLORSPACE_Y_ONLY = 0x4,
+	DP_COLORSPACE_RAW = 0x5,
+	DP_COLORSPACE_RESERVED = 0x6,
+};
+
+/**
+ * Based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through DB18]
+ * and a name of enum member followes DRM_MODE_COLORIMETRY definition.
+ */
+enum dp_colorimetry {
+	DP_COLORIMETRY_DEFAULT = 0, /* sRGB (IEC 61966-2-1) / ITU-R BT.601 */
+	DP_COLORIMETRY_RGB_WIDE_FIXED = 0x1,
+	DP_COLORIMETRY_BT709_YCC = 0x1,
+	DP_COLORIMETRY_RGB_WIDE_FLOAT = 0x2,
+	DP_COLORIMETRY_XVYCC_601 = 0x2,
+	DP_COLORIMETRY_OPRGB = 0x3,
+	DP_COLORIMETRY_XVYCC_709 = 0x3,
+	DP_COLORIMETRY_DCI_P3_RGB = 0x4,
+	DP_COLORIMETRY_SYCC_601 = 0x4,
+	DP_COLORIMETRY_RGB_CUSTOM = 0x5,
+	DP_COLORIMETRY_OPYCC_601 = 0x5,
+	DP_COLORIMETRY_BT2020_RGB = 0x6,
+	DP_COLORIMETRY_BT2020_CYCC = 0x6,
+	DP_COLORIMETRY_BT2020_YCC = 0x7,
+};
+
+enum dp_dynamic_range {
+	DP_DYNAMIC_RANGE_VESA = 0,
+	DP_DYNAMIC_RANGE_CTA = 1,
+};
+
+enum dp_content_type {
+	DP_CONTENT_TYPE_NOT_DEFINED = 0x00,
+	DP_CONTENT_TYPE_GRAPHICS = 0x01,
+	DP_CONTENT_TYPE_PHOTO = 0x02,
+	DP_CONTENT_TYPE_VIDEO = 0x03,
+	DP_CONTENT_TYPE_GAME = 0x04,
+};
+
+/* DRM DP VSC SDP as per DP 1.4 spec */
+struct drm_dp_vsc_sdp {
+	unsigned char sdp_type; /* Secondary-data Packet Type */
+	unsigned char revision; /* Revision Number */
+	unsigned char length; /* Number of Valid Data Bytes */
+	enum dp_colorspace colorspace;
+	enum dp_colorimetry colorimetry;
+	int bpc; /* bit per color */
+	enum dp_dynamic_range dynamic_range;
+	enum dp_content_type content_type;
+};
+
 int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
 
 static inline int
-- 
2.24.1

