Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15B9627EDE
	for <lists+linux-fbdev@lfdr.de>; Thu, 23 May 2019 15:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730697AbfEWNzH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 23 May 2019 09:55:07 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:45882 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730323AbfEWNzH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 23 May 2019 09:55:07 -0400
Received: by mail-qt1-f195.google.com with SMTP id t1so6771041qtc.12
        for <linux-fbdev@vger.kernel.org>; Thu, 23 May 2019 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RoLH+1OrHmh/LP5/MP38zvovli5jsWEZsxOs+ayZS9U=;
        b=N/9Y/Xl8Tt5h0I9hzt2GvLliViKn9QgrucYHB55S9E5I5mrVdLd79mPly8nQy/17PS
         mi3RbmlM1m2zrywCX4XafL5t8O7yyUxldtCNctLSB3y0dVWf6GbEtiLlL7kB9qIkL+aO
         RMMDASITpGDnAXFjLShvmgj4faIA/z0ZlQMkIz6sx0R351pGILRksMo3TrgV+j9MwCvz
         Jc1onpQnoAPx5orodpyk5wEaOBP6Hapw9p+cGxIqjghJ1ZAoJu/3s5uD+v/Tg5f4QEOJ
         /0++jL6GbsR5+csAGuIxpvivpykkcJmAqgwTR75YntjvHF5T5xR57Tr0fWzQEEsHHcPh
         AyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RoLH+1OrHmh/LP5/MP38zvovli5jsWEZsxOs+ayZS9U=;
        b=slZ0vlp7M8OkuA52i1uSLuknNeJzKKASQFsFDEwsbKoVz66lOi7vckUhZU4jys9RtY
         Lk9qZ5v4e430tKDPT216IKdFqBh3Ra9tNVnw1gkxHDnPFL3t8ssYe7JnANTYgFQvRYMp
         8dddzftH8348WR23sEhUMUoYgq40GbHJBiTBe9ZE5kkDVUnsNZIZR2iZBBMHOgRZiEWs
         ZFWJgvasqci2laQ6piSBRJVJfkgfdmzgEVWyElFJrIxrPBqLjHnnV0zAU9Zn5HUO5e69
         ug1LLk+WLMiE30YVN1dahQJkwbcTbyliqg7tr7+vRjT/zb2XI35rn+CZHxdzReFMl+DA
         PsWw==
X-Gm-Message-State: APjAAAXwQGp+mZxOgR/Q3fdwP8VQGzF2y3RtzThTxt/G9XA25jGV5O2g
        SzZ6j1bWztp5pkNUkkZjUWzdWg==
X-Google-Smtp-Source: APXvYqy5IvdM4mKrSHbVmmDEPXFfC06X0nVwwJxjzFVDCmtxjWMsGKE3cQuk2yliwbN+kqQp0HtVTw==
X-Received: by 2002:ac8:2c33:: with SMTP id d48mr8900292qta.40.1558619706337;
        Thu, 23 May 2019 06:55:06 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id o13sm14808383qtk.74.2019.05.23.06.55.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 06:55:05 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Uma Shankar <uma.shankar@intel.com>,
        Shashank Sharma <shashank.sharma@intel.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans Verkuil <hansverk@cisco.com>, linux-fbdev@vger.kernel.org
Subject: [PATCH] drm/edid: Fix docbook in drm_hdmi_infoframe_set_hdr_metadata()
Date:   Thu, 23 May 2019 09:54:58 -0400
Message-Id: <20190523135504.184354-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Fixes the following warnings:
../drivers/gpu/drm/drm_edid.c:4925: warning: Function parameter or member 'conn_state' not described in 'drm_hdmi_infoframe_set_hdr_metadata'
../drivers/gpu/drm/drm_edid.c:4925: warning: Excess function parameter 'hdr_metadata' description in 'drm_hdmi_infoframe_set_hdr_metadata'

Fixes: 2cdbfd66a829 ("drm: Enable HDR infoframe support")
Cc: Uma Shankar <uma.shankar@intel.com>
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
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 262510c2a670..d87f574feeca 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4914,7 +4914,7 @@ static inline bool is_eotf_supported(u8 output_eotf, u8 sink_eotf)
  * drm_hdmi_infoframe_set_hdr_metadata() - fill an HDMI DRM infoframe with
  *                                         HDR metadata from userspace
  * @frame: HDMI DRM infoframe
- * @hdr_metadata: hdr_source_metadata info from userspace
+ * @conn_state: Connector state containing HDR metadata
  *
  * Return: 0 on success or a negative error code on failure.
  */
-- 
Sean Paul, Software Engineer, Google / Chromium OS

