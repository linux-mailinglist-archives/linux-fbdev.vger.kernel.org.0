Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62ED314F3F5
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jan 2020 22:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgAaVrH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 31 Jan 2020 16:47:07 -0500
Received: from mga17.intel.com ([192.55.52.151]:30307 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbgAaVrG (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 31 Jan 2020 16:47:06 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Jan 2020 13:47:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,387,1574150400"; 
   d="scan'208";a="262691446"
Received: from helsinki.fi.intel.com ([10.237.66.145])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2020 13:47:05 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 01/18] drm: add DP 1.4 VSC SDP Payload related enums
Date:   Fri, 31 Jan 2020 23:46:44 +0200
Message-Id: <20200131214701.1085737-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131214701.1085737-1-gwan-gyeong.mun@intel.com>
References: <20200131214701.1085737-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

It adds new enumeration definitions for VSC SDP Payload for Pixel
Encoding/Colorimetry Format.

enum dp_colorspace and enum dp_colorimetry correspond "Pixel Encoding and
Colorimetry Formats". enum dp_dynamic_range corresponds "Dynamic Range".
And enum dp_content_type corresponds "Content Type"
All of them are based on DP 1.4 spec [Table 2-117: VSC SDP Payload for
DB16 through DB18].

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/drm/drm_dp_helper.h | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 262faf9e5e94..86b1be958a69 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1209,6 +1209,51 @@ struct dp_sdp {
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
 int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
 
 static inline int
-- 
2.24.1

