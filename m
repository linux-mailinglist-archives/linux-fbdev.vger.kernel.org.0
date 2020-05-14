Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A891D270D
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2020 08:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgENGHj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 14 May 2020 02:07:39 -0400
Received: from mga14.intel.com ([192.55.52.115]:40788 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgENGHi (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 14 May 2020 02:07:38 -0400
IronPort-SDR: 3hdDKf37NIjQZK7bx4qmvMerongzU5KQQ5Q0ZPZlAv8kkUDdPAcUaxj9TWYPy8JF3LdJKpLU/R
 ms07hIzOhRNA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 23:07:38 -0700
IronPort-SDR: s2wiT7yTbP0gdYBaSZpL62F/tmewoC+/paFnaAjp0klCf7RG678nZM1Ln3hobGlK0D5P+mU2ru
 HfF/ZP6zOvqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; 
   d="scan'208";a="409956964"
Received: from bgodonne-mobl.amr.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.18.167])
  by orsmga004.jf.intel.com with ESMTP; 13 May 2020 23:07:35 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        jani.nikula@linux.intel.com, laurent.pinchart@ideasonboard.com,
        ville.syrjala@linux.intel.com
Subject: [PATCH v12 01/14] video/hdmi: Add Unpack only function for DRM infoframe
Date:   Thu, 14 May 2020 09:07:19 +0300
Message-Id: <20200514060732.3378396-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

It adds an unpack only function for DRM infoframe for dynamic range and
mastering infoframe readout.
It unpacks the information data block contained in the binary buffer into
a structured frame of the HDMI Dynamic Range and Mastering (DRM)
information frame.

In contrast to hdmi_drm_infoframe_unpack() function, it does not verify
a checksum.

It can be used for unpacking a DP HDR Metadata Infoframe SDP case.
DP HDR Metadata Infoframe SDP uses the same Dynamic Range and Mastering
(DRM) information (CTA-861-G spec.) such as HDMI DRM infoframe.
But DP SDP header and payload structure are different from HDMI DRM
Infoframe. Therefore unpacking DRM infoframe for DP requires skipping of
a verifying checksum.

v9: Add clear comments to hdmi_drm_infoframe_unpack_only() and
    hdmi_drm_infoframe_unpack() (Laurent Pinchart)

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
---
 drivers/video/hdmi.c | 65 +++++++++++++++++++++++++++++++-------------
 include/linux/hdmi.h |  2 ++
 2 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 856a8c4e84a2..e70792b3e367 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -1768,20 +1768,21 @@ hdmi_vendor_any_infoframe_unpack(union hdmi_vendor_any_infoframe *frame,
 }
 
 /**
- * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM infoframe
+ * hdmi_drm_infoframe_unpack_only() - unpack binary buffer of CTA-861-G DRM
+ *                                    infoframe DataBytes to a HDMI DRM
+ *                                    infoframe
  * @frame: HDMI DRM infoframe
  * @buffer: source buffer
  * @size: size of buffer
  *
- * Unpacks the information contained in binary @buffer into a structured
- * @frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
- * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
- * specification.
+ * Unpacks CTA-861-G DRM infoframe DataBytes contained in the binary @buffer
+ * into a structured @frame of the HDMI Dynamic Range and Mastering (DRM)
+ * infoframe.
  *
  * Returns 0 on success or a negative error code on failure.
  */
-static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
-				     const void *buffer, size_t size)
+int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
+				   const void *buffer, size_t size)
 {
 	const u8 *ptr = buffer;
 	const u8 *temp;
@@ -1790,23 +1791,13 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
 	int ret;
 	int i;
 
-	if (size < HDMI_INFOFRAME_SIZE(DRM))
-		return -EINVAL;
-
-	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
-	    ptr[1] != 1 ||
-	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
-		return -EINVAL;
-
-	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM)) != 0)
+	if (size < HDMI_DRM_INFOFRAME_SIZE)
 		return -EINVAL;
 
 	ret = hdmi_drm_infoframe_init(frame);
 	if (ret)
 		return ret;
 
-	ptr += HDMI_INFOFRAME_HEADER_SIZE;
-
 	frame->eotf = ptr[0] & 0x7;
 	frame->metadata_type = ptr[1] & 0x7;
 
@@ -1814,7 +1805,7 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
 	for (i = 0; i < 3; i++) {
 		x_lsb = *temp++;
 		x_msb = *temp++;
-		frame->display_primaries[i].x =  (x_msb << 8) | x_lsb;
+		frame->display_primaries[i].x = (x_msb << 8) | x_lsb;
 		y_lsb = *temp++;
 		y_msb = *temp++;
 		frame->display_primaries[i].y = (y_msb << 8) | y_lsb;
@@ -1830,6 +1821,42 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
 
 	return 0;
 }
+EXPORT_SYMBOL(hdmi_drm_infoframe_unpack_only);
+
+/**
+ * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM infoframe
+ * @frame: HDMI DRM infoframe
+ * @buffer: source buffer
+ * @size: size of buffer
+ *
+ * Unpacks the CTA-861-G DRM infoframe contained in the binary @buffer into
+ * a structured @frame of the HDMI Dynamic Range and Mastering (DRM)
+ * infoframe. It also verifies the checksum as required by section 5.3.5 of
+ * the HDMI 1.4 specification.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
+				     const void *buffer, size_t size)
+{
+	const u8 *ptr = buffer;
+	int ret;
+
+	if (size < HDMI_INFOFRAME_SIZE(DRM))
+		return -EINVAL;
+
+	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
+	    ptr[1] != 1 ||
+	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
+		return -EINVAL;
+
+	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM)) != 0)
+		return -EINVAL;
+
+	ret = hdmi_drm_infoframe_unpack_only(frame, ptr + HDMI_INFOFRAME_HEADER_SIZE,
+					     size - HDMI_INFOFRAME_HEADER_SIZE);
+	return ret;
+}
 
 /**
  * hdmi_infoframe_unpack() - unpack binary buffer to a HDMI infoframe
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 9613d796cfb1..50c31f1a0a2d 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -219,6 +219,8 @@ ssize_t hdmi_drm_infoframe_pack(struct hdmi_drm_infoframe *frame, void *buffer,
 ssize_t hdmi_drm_infoframe_pack_only(const struct hdmi_drm_infoframe *frame,
 				     void *buffer, size_t size);
 int hdmi_drm_infoframe_check(struct hdmi_drm_infoframe *frame);
+int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
+				   const void *buffer, size_t size);
 
 enum hdmi_spd_sdi {
 	HDMI_SPD_SDI_UNKNOWN,
-- 
2.25.0

