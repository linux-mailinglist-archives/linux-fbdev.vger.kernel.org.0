Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54F4E270C6
	for <lists+linux-fbdev@lfdr.de>; Wed, 22 May 2019 22:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729632AbfEVUWK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 22 May 2019 16:22:10 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:44370 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729619AbfEVUWK (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 22 May 2019 16:22:10 -0400
Received: by mail-qk1-f195.google.com with SMTP id w25so2351209qkj.11
        for <linux-fbdev@vger.kernel.org>; Wed, 22 May 2019 13:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zmy7j+V2kfqtYYz1WddkagE0DXlderr4yqX5VeQ0jxE=;
        b=Wv7fYjcBuPUYR9MTgyDgURjkjHlUrU+vf2Rjh5kikh+aeZcuBsA45dQS0W772uQXyR
         wJy78nYNEK2ip1KWnGM2LE22p5ty2akRWDyauopLTLGmMOimVzjTRVfFCtf1un/wRAhF
         H39a8cuaCC555EA90d9ghjrpvYjUMsCiJYkUByOaPQzw83C2xylldr98kJUHCtnGmcLy
         ZKCvmW1B9b0npeIxz4U15fKa2mrqGczcA47ac45qCszR0woi68ptU/PdMxnm5xrBbvIY
         jqHC27QIKbDoyUxjHvLVb6+EEAh2qcJtkbObfDMEZWzFgOk5einIXqDBdrI/NOjAONzY
         Br6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zmy7j+V2kfqtYYz1WddkagE0DXlderr4yqX5VeQ0jxE=;
        b=IEekn6nuMemDQ8AbvegKXI6ZYfHQCsP7uWjM1bMudfSVEhKuWzYuyX6GAlXRGdHngG
         yH/BSUFywvfw/dS94yJR/8IUdG8kRAj+SZs+28/7ZUQmV+At9qwq3T0QLLtaGRAK4NV6
         xaVkfJsLPMRxJSYeu7MXwG9/KJhn95utgZ4jHLkfTXsd+uDt4BTBB9z+YiWmxl4Nm8Ry
         wWC3EpAOzTX8XkJ9qMlAJBAbNpyRfMcQFnOyc1k+HbYaj6D1+WQaoW1HpvGYoD99jQDr
         lPilBgQapITTbdLLS73AkkOaaQ4PfMasV8Bz0BHJhpYlFQKIFJuqLW0HvbhUqhLftJ4T
         G3vg==
X-Gm-Message-State: APjAAAWPw4vbLPN9fyBLpjjL9AqkbclK9R4M/TzLGAhdq72rPyMWl0g3
        eIMobBPitab0P79qT3NTzhIstA==
X-Google-Smtp-Source: APXvYqyr5JtWJBxoh41hbTAkOsXHCvEtb3C3/m7M5P7Ry9zlF0gq04xYFw3DvF+dqaIxFQ/JKexWLA==
X-Received: by 2002:a05:620a:141c:: with SMTP id d28mr40026915qkj.18.1558556529503;
        Wed, 22 May 2019 13:22:09 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id t187sm4546863qkh.10.2019.05.22.13.22.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 13:22:09 -0700 (PDT)
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
        Hans Verkuil <hansverk@cisco.com>, linux-fbdev@vger.kernel.org,
        CK Hu <ck.hu@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: Fix warning about unhandled enum value
Date:   Wed, 22 May 2019 16:21:54 -0400
Message-Id: <20190522202207.223110-1-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Fixes the following build warning:
drivers/gpu/drm/mediatek/mtk_hdmi.c:327:2: warning: enumeration value ‘HDMI_INFOFRAME_TYPE_DRM’ not handled in switch [-Wswitch]

Introduced with the addition of HDMI_INFOFRAME_TYPE_DRM in the commit
below, but the code really should have been future-proofed from the
start.

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
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index e04e6c293d39..10cc9910f164 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -341,6 +341,9 @@ static void mtk_hdmi_hw_send_info_frame(struct mtk_hdmi *hdmi, u8 *buffer,
 		ctrl_frame_en = VS_EN;
 		ctrl_reg = GRL_ACP_ISRC_CTRL;
 		break;
+	default:
+		dev_err(hdmi->dev, "Unknown infoframe type %d\n", frame_type);
+		return;
 	}
 	mtk_hdmi_clear_bits(hdmi, ctrl_reg, ctrl_frame_en);
 	mtk_hdmi_write(hdmi, GRL_INFOFRM_TYPE, frame_type);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

