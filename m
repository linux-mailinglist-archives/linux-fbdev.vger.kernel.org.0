Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 853137AC4B
	for <lists+linux-fbdev@lfdr.de>; Tue, 30 Jul 2019 17:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732358AbfG3PZi (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 30 Jul 2019 11:25:38 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33899 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731347AbfG3PZi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 30 Jul 2019 11:25:38 -0400
Received: by mail-lf1-f65.google.com with SMTP id b29so37782933lfq.1
        for <linux-fbdev@vger.kernel.org>; Tue, 30 Jul 2019 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a8k87dhuTxTzS+n3u2Ou7NXh77Uav3wOrh0j/WlwUGo=;
        b=p5bsKDg7tMBnd5qo4asPd25ewkYLyTBvTiDchpZUVrlXTDmyMEYZ5sLLXxeZE+FEJu
         fFFNjoTLkv5d2pa5xGLx9vkfp2kN2vnddjucaeZvUkFXRynv1VNzJ1pUcqmxb2Txe3do
         JzVko3L/nJk6RDWynthGjwo+jRTerO6ZGya1/kDLuC6bMX9B/IbVW/JZHrLMlgpcKLym
         sItTVYZ8Z+4m2Qww3kRTK+O9+PXHRF8M/C9S5nnxW1x3N3BsbW8oNQ7YaNaUDMO60oA1
         XF9/tnA4qlzGsdu85SFUrd6yfss+zvC3BltZJqm8Q5sMSfDSix3SZ+AP1EjUxazCFJ4I
         wdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a8k87dhuTxTzS+n3u2Ou7NXh77Uav3wOrh0j/WlwUGo=;
        b=NYzLelGq9gobyJRtKvwFhqH/MelcZ3pcMmZmhYITTL3J+gHX5jM8vwu01I5wruge5b
         IJorgSWXPuD7+hZnfbBR9kWEnjMbRzDuYLWZthL2/taBIoENBtUyyDv2kIpP0GXVEwpB
         bIbJpp2geixLo9gEtEp54MOiZawMBF77rRaMhdSTtqQBWhOkl7+bVB+HZYQau+D8QpPk
         wPjscvdPQ1dQXbksurq3WcmDXZNU1IQnIi0M/5odWl/7D7vkXsEcUkKtSvThtLdGlWfc
         EUJKNO+UOxsBs1oEfqlC0xFCIPWUxVCMchHX4obm0cRynsYTN8gGJMDfZOBsJ0kvm2u4
         6NJQ==
X-Gm-Message-State: APjAAAWFfS02KhLOEHo/kshFKzcT1AxOYNPIc70ouyCG6zbw1GlVaZ3M
        WQe4M49SHe9+ujf52oixLqCRMw==
X-Google-Smtp-Source: APXvYqzrh7p3FQO75/hpL7dUe20p/p24BxIUA3XsEMf3aeLRuCyAOWaX12fBPsDhGMCzfbDEd2eHKQ==
X-Received: by 2002:a19:41cc:: with SMTP id o195mr10890679lfa.166.1564500336500;
        Tue, 30 Jul 2019 08:25:36 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se. [213.112.60.36])
        by smtp.gmail.com with ESMTPSA id t5sm13280728ljj.10.2019.07.30.08.25.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 08:25:35 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     b.zolnierkie@samsung.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo@embeddedor.com,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v2] video: fbdev: Mark expected switch fall-through
Date:   Tue, 30 Jul 2019 17:25:30 +0200
Message-Id: <20190730152530.3055-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Now that -Wimplicit-fallthrough is passed to GCC by default, the
following warnings shows up:

../drivers/video/fbdev/sh_mobile_lcdcfb.c: In function ‘sh_mobile_lcdc_channel_fb_init’:
../drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement may fall
 through [-Wimplicit-fallthrough=]
   info->fix.ypanstep = 2;
   ~~~~~~~~~~~~~~~~~~~^~~
../drivers/video/fbdev/sh_mobile_lcdcfb.c:2087:2: note: here
  case V4L2_PIX_FMT_NV16:
  ^~~~
../drivers/video/fbdev/sh_mobile_lcdcfb.c: In function ‘sh_mobile_lcdc_overlay_fb_init’:
../drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement may fall
 through [-Wimplicit-fallthrough=]
   info->fix.ypanstep = 2;
   ~~~~~~~~~~~~~~~~~~~^~~
../drivers/video/fbdev/sh_mobile_lcdcfb.c:1597:2: note: here
  case V4L2_PIX_FMT_NV16:
  ^~~~

Rework to address a warnings due to the enablement of
-Wimplicit-fallthrough.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index ac0bcac9a865..c249763dbf0b 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1594,6 +1594,7 @@ sh_mobile_lcdc_overlay_fb_init(struct sh_mobile_lcdc_overlay *ovl)
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV21:
 		info->fix.ypanstep = 2;
+		/* Fall through */
 	case V4L2_PIX_FMT_NV16:
 	case V4L2_PIX_FMT_NV61:
 		info->fix.xpanstep = 2;
@@ -2084,6 +2085,7 @@ sh_mobile_lcdc_channel_fb_init(struct sh_mobile_lcdc_chan *ch,
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV21:
 		info->fix.ypanstep = 2;
+		/* Fall through */
 	case V4L2_PIX_FMT_NV16:
 	case V4L2_PIX_FMT_NV61:
 		info->fix.xpanstep = 2;
-- 
2.20.1

