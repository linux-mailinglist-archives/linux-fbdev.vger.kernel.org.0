Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C936EF9162
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Nov 2019 15:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfKLOEf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 12 Nov 2019 09:04:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:43850 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726912AbfKLOEf (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 12 Nov 2019 09:04:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 28E82B20B;
        Tue, 12 Nov 2019 14:04:34 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
        b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
        sam@ravnborg.org, emil.velikov@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/5] drm/udl: Set default color depth to 32 bpp
Date:   Tue, 12 Nov 2019 15:04:27 +0100
Message-Id: <20191112140431.7895-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191112140431.7895-1-tzimmermann@suse.de>
References: <20191112140431.7895-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The udl driver only supports color depths that are powers of two.
Change prefered default to 32 bpp.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index bc1ab6060dc6..1f8ebcc595de 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -437,7 +437,7 @@ int udl_modeset_init(struct drm_device *dev)
 	dev->mode_config.max_height = 2048;
 
 	dev->mode_config.prefer_shadow = 0;
-	dev->mode_config.preferred_depth = 24;
+	dev->mode_config.preferred_depth = 32;
 
 	dev->mode_config.funcs = &udl_mode_funcs;
 
-- 
2.23.0

