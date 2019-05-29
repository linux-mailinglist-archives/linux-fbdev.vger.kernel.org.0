Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67B932DF66
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 May 2019 16:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbfE2OQ0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 29 May 2019 10:16:26 -0400
Received: from mga12.intel.com ([192.55.52.136]:47636 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbfE2OQ0 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 29 May 2019 10:16:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 07:16:26 -0700
X-ExtLoop1: 1
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
  by fmsmga004.fm.intel.com with ESMTP; 29 May 2019 07:16:22 -0700
From:   Uma Shankar <uma.shankar@intel.com>
To:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc:     Uma Shankar <uma.shankar@intel.com>,
        Shashank Sharma <shashank.sharma@intel.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans Verkuil <hansverk@cisco.com>, linux-fbdev@vger.kernel.org
Subject: [PATCH] drm: Fix docbook warnings in hdr metadata helper structures
Date:   Wed, 29 May 2019 20:13:50 +0530
Message-Id: <1559141030-4386-1-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fixes the following warnings:
./include/drm/drm_mode_config.h:841: warning: Incorrect use of
kernel-doc format:          * hdr_output_metadata_property: Connector
property containing hdr
./include/drm/drm_mode_config.h:918: warning: Function parameter or member 'hdr_output_metadata_property' not described in 'drm_mode_config'
./include/drm/drm_connector.h:1251: warning: Function parameter or member 'hdr_output_metadata' not described in 'drm_connector'
./include/drm/drm_connector.h:1251: warning: Function parameter or member 'hdr_sink_metadata' not described in 'drm_connector'

Also adds some property documentation for HDR Metadata Connector
Property in connector property create function.

Cc: Shashank Sharma <shashank.sharma@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
Cc: Hans Verkuil <hansverk@cisco.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_connector.c | 8 ++++++++
 include/drm/drm_connector.h     | 3 ++-
 include/drm/drm_mode_config.h   | 2 +-
 include/linux/hdmi.h            | 1 +
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index c9ac8b9..702307c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1003,6 +1003,14 @@ int drm_display_info_set_bus_formats(struct drm_display_info *info,
  *	can also expose this property to external outputs, in which case they
  *	must support "None", which should be the default (since external screens
  *	have a built-in scaler).
+ *
+ * HDR_OUTPUT_METADATA:
+ *	Connector property to enable userspace to send HDR Metadata to driver.
+ *	This metadata is based on the composition and blending policies decided
+ *	by user, taking into account the hardware and sink capabilties.
+ *	The driver gets this metadata and creates a Dynamic Range and Mastering
+ *	Infoframe (DRM) which is then sent to sink. This notifies the sink of
+ *	the upcoming frame's Color Encoding and Luminance parameters.
  */
 
 int drm_connector_create_standard_properties(struct drm_device *dev)
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f8f4003..f226ef0 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1244,8 +1244,9 @@ struct drm_connector {
 	 */
 	struct llist_node free_node;
 
-	/* HDR metdata */
+	/** @hdr_output_metadata: HDR Metadata to be sent to sink */
 	struct hdr_output_metadata hdr_output_metadata;
+	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
 	struct hdr_sink_metadata hdr_sink_metadata;
 };
 
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 4f88cc9..0b180e0 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -837,7 +837,7 @@ struct drm_mode_config {
 	struct drm_property *writeback_out_fence_ptr_property;
 
 	/**
-	 * hdr_output_metadata_property: Connector property containing hdr
+	 * @hdr_output_metadata_property: Connector property containing hdr
 	 * metatda. This will be provided by userspace compositors based
 	 * on HDR content
 	 */
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index ee55ba5..ea5858e 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -398,6 +398,7 @@ ssize_t hdmi_vendor_infoframe_pack_only(const struct hdmi_vendor_infoframe *fram
  * @spd: spd infoframe
  * @vendor: union of all vendor infoframes
  * @audio: audio infoframe
+ * @drm: DRM infoframe
  *
  * This is used by the generic pack function. This works since all infoframes
  * have the same header which also indicates which type of infoframe should be
-- 
1.9.1

