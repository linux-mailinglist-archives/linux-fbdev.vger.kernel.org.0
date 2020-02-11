Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C421158A9D
	for <lists+linux-fbdev@lfdr.de>; Tue, 11 Feb 2020 08:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbgBKHrL (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 11 Feb 2020 02:47:11 -0500
Received: from mga11.intel.com ([192.55.52.93]:32361 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727697AbgBKHrL (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 11 Feb 2020 02:47:11 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 23:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="312993673"
Received: from helsinki.fi.intel.com ([10.237.66.159])
  by orsmga001.jf.intel.com with ESMTP; 10 Feb 2020 23:47:08 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v7 05/18] video/hdmi: Add Unpack only function for DRM infoframe
Date:   Tue, 11 Feb 2020 09:46:44 +0200
Message-Id: <20200211074657.231405-6-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
References: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
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

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/video/hdmi.c | 58 +++++++++++++++++++++++++++++++-------------
 include/linux/hdmi.h |  2 ++
 2 files changed, 43 insertions(+), 17 deletions(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 9c82e2a0a411..9818836d82b7 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -1775,20 +1775,18 @@ hdmi_vendor_any_infoframe_unpack(union hdmi_vendor_any_infoframe *frame,
 }
 
 /**
- * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM infoframe
+ * hdmi_drm_infoframe_unpack_only() - unpack binary buffer to a HDMI DRM infoframe
  * @frame: HDMI DRM infoframe
  * @buffer: source buffer
  * @size: size of buffer
  *
- * Unpacks the information contained in binary @buffer into a structured
+ * Unpacks the information data block contained in binary @buffer into a structured
  * @frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
- * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
- * specification.
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
@@ -1797,23 +1795,13 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
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
 
@@ -1837,6 +1825,42 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
 
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
+ * Unpacks the information contained in binary @buffer into a structured
+ * @frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
+ * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
+ * specification.
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
index 9918a6c910c5..afb43efc03e0 100644
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

