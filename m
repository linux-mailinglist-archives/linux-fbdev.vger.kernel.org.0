Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D01C5439E7
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2019 17:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732364AbfFMPRa (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 13 Jun 2019 11:17:30 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37424 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732485AbfFMPRa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 13 Jun 2019 11:17:30 -0400
Received: by mail-qt1-f193.google.com with SMTP id y57so23017034qtk.4
        for <linux-fbdev@vger.kernel.org>; Thu, 13 Jun 2019 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bGNK1d0Xv7GxXmH2bfhCnv3hSiuIxOQH6M80YrpAFbg=;
        b=gfgLShrOdv+5kNqWdz8F30pzoMJbuuG3vdPsovlgP+y+yxT/DYd4jTFhAXjOCnSUFv
         /gHuVdby5VwMdO70Q5obBp2iABib6ipvIY4nk5FhobueWFsmGq00n3hNcOuR7+SjTmtC
         Nvtlu8phwW8zeXXQK40f27sncCYzxcbiO8moKR7pne7LUSydLtnfOU+5GSRysChCgdAL
         6z5gt1XYC4RvqmUGxgDmNgtP0s1BQBPozVKcwYwUo8zCndZ9nqZt6ShUcPCE0NLpHkkg
         LutIvq/su8KGiXD4ColOKvf96sNaUHLC7NFboOq0wvqMR/r1ZdT43GS5iTTIRxhsTs5l
         4p/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bGNK1d0Xv7GxXmH2bfhCnv3hSiuIxOQH6M80YrpAFbg=;
        b=nfuC8TGZt9kAjlOEzpyeWVzACb205tZoLKh98E6OyWvTKhILwN4iEjhDo4Z4yy1PJF
         uPb+7gnEEQboRs709xQPPmWu30iPDe2j7vm0QAT7YRG51nyV4WLy8/TvTfRk6HnwpKqu
         W5MBq9sVWw2jy4iI8Xqd8qEr6ZEoZkL7kmraFMnslgA+tsNIKgQ/5r3Wlc0SfiF7SKvv
         GB7jv4hBEsWoeCgB2CiWwI7el42jVwju9QbHEaA0y1RUPWc9g86vzvVITN/94YOaaDmi
         CsIUWwXfb4LyeOmK/g7t7eQkHW3IHP9TpUD78vH64btezBf/G/8VCDvouzJXeFXrHHqs
         /8Jg==
X-Gm-Message-State: APjAAAXDJggV5FpP495akAdcC7AwwJIncdkdt+SJvFzYLOHgsetUktDV
        mxp+zVNgTJSWe2nBofATWjMO6A==
X-Google-Smtp-Source: APXvYqzccEYb3lN3E8mI+ddJiTi8WFUyrc0/SlwYQBbc+d8kJiOZ9Eaf6pD5QdwwSLK8oIKtzIbx9g==
X-Received: by 2002:ac8:2b10:: with SMTP id 16mr57217884qtu.351.1560439049086;
        Thu, 13 Jun 2019 08:17:29 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id v186sm1688779qkc.36.2019.06.13.08.17.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 08:17:28 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Shashank Sharma <shashank.sharma@intel.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4?= <ville.syrjala@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans Verkuil <hansverk@cisco.com>, linux-fbdev@vger.kernel.org,
        Uma Shankar <uma.shankar@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm/connector: Fix kerneldoc warning in HDR_OUTPUT_METADATA description
Date:   Thu, 13 Jun 2019 11:17:23 -0400
Message-Id: <20190613151727.133696-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Fixes the following warning:
../drivers/gpu/drm/drm_connector.c:981: WARNING: Definition list ends without a blank line; unexpected unindent.

Fixes: a09db883e5d9 ("drm: Fix docbook warnings in hdr metadata helper structures")
Cc: Shashank Sharma <shashank.sharma@intel.com>
Cc: Ville Syrjä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: "Ville Syrjä" <ville.syrjala@linux.intel.com>
Cc: Hans Verkuil <hansverk@cisco.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: Sean Paul <sean@poorly.run> (v1)
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_connector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index a598a5eb48d21..3ccdcf3dfcde2 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -978,6 +978,7 @@ static const struct drm_prop_enum_list hdmi_colorspaces[] = {
  *	Userspace will be responsible to do Tone mapping operation in case:
  *		- Some layers are HDR and others are SDR
  *		- HDR layers luminance is not same as sink
+ *
  *	It will even need to do colorspace conversion and get all layers
  *	to one common colorspace for blending. It can use either GL, Media
  *	or display engine to get this done based on the capabilties of the
-- 
Sean Paul, Software Engineer, Google / Chromium OS

