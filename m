Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D62218861
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Jul 2020 15:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbgGHNEY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Jul 2020 09:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728918AbgGHNEY (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Jul 2020 09:04:24 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16754C08C5DC
        for <linux-fbdev@vger.kernel.org>; Wed,  8 Jul 2020 06:04:24 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o2so3024764wmh.2
        for <linux-fbdev@vger.kernel.org>; Wed, 08 Jul 2020 06:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RxFZ0mM04Szq9whPZ3GL7Mk7ZTkZD0uYPWryvuVTQqY=;
        b=mCsupB04au9clciRuxVrDhmV/yk5CdYxDbfWAKUEqRFL8HrNjxFEsv0/7Obek98xVH
         /9C4GfH+bCFayzILNsMztA+i5/rN8b5+s5217riicElmsJIMnYAmrpNECDTTV1EJEGor
         RwJSHj/wSTRE7zJHK2gqKcQRa5Yhfx6rW08a5khnZoy4ho2Xzam1QjcFS00BOQTZaxUO
         4vKDnfegwxZ1ETmjpXWpWweTk/LamA34ohy6W9sjJbj4OaWfS4Le/aKq+AaVDRqTO+V6
         r9xd0hmcqJMy385gyxHt/uj3aCq5gsCEdnvXK67fNvjI9eELE1VwBOvQXWC6Rrag8PI3
         d2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RxFZ0mM04Szq9whPZ3GL7Mk7ZTkZD0uYPWryvuVTQqY=;
        b=kgTsbsDFmdQ/3/fbCR6F4zCX7hR0MQO8dd1Gg8M1MltDN+2tmaB5vVTQec3Kp/eBWG
         +u0H1ZTYLyZGkWYrGRn+QCofOHLrezfD1/7KrqwwUaxebizKvi7GPVpwKIIYjcYtLxiJ
         4EtRnEBjCkKoVberqvgu8yBHgYdV43gGnFErrhL+vh3vGwoyNfnqdZZm91v7S4bVv1JC
         4kFcJHVZUs5YHnOJE4ra09eHfGfh1CAEpJNAM4LPbFqK0b6+ylgGMYZJ2RMRB7hMLrqC
         oWb2YlJ/bUVGVZQduOCp0VaPWX0sx9Cx88Gc/cD7ywrE/DtTg41wk0gxuSJ/K5dTpkTU
         YLxw==
X-Gm-Message-State: AOAM532aB1jokPrXlLy2bOP0eKPE39IfSfvTmeZDEa1pzd2m733WTeqo
        Gc6r1k5s6bB6WGkvwa6atch6ZQ==
X-Google-Smtp-Source: ABdhPJwkcRNPg0c+ui6qXxBzepuHHCjRwvrxhO3Qpq0Zdau5H9yd/UNhobH+cvwIzFKwffnbfXPm2A==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr9078596wmb.60.1594213462831;
        Wed, 08 Jul 2020 06:04:22 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id q3sm5767129wmq.22.2020.07.08.06.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 06:04:22 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Gyungoh Yoo <jack.yoo@skyworksinc.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 1/1] video: backlight: sky81452-backlight: Fix some kerneldoc issues
Date:   Wed,  8 Jul 2020 14:04:19 +0100
Message-Id: <20200708130419.3445042-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Firstly, all lines must begin with a '*'.  Secondly, arg descriptions
must be spelt correctly, so fix misspelling of 'gpioD_enable' and
'short_detecTion_threshold'

Fixes the following W=1 kernel build warning(s):

 drivers/video/backlight/sky81452-backlight.c:46: warning: bad line:                 If it is not defined, default name is lcd-backlight.
 drivers/video/backlight/sky81452-backlight.c:64: warning: Function parameter or member 'gpiod_enable' not described in 'sky81452_bl_platform_data'
 drivers/video/backlight/sky81452-backlight.c:64: warning: Function parameter or member 'short_detection_threshold' not described in 'sky81452_bl_platform_data'

Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/backlight/sky81452-backlight.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index 83ccb3d940fae..0ce1815850080 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -43,13 +43,13 @@
 /**
  * struct sky81452_platform_data
  * @name:	backlight driver name.
-		If it is not defined, default name is lcd-backlight.
- * @gpios_enable:GPIO descriptor which control EN pin
+ *		If it is not defined, default name is lcd-backlight.
+ * @gpiod_enable:GPIO descriptor which control EN pin
  * @enable:	Enable mask for current sink channel 1, 2, 3, 4, 5 and 6.
  * @ignore_pwm:	true if DPWMI should be ignored.
  * @dpwm_mode:	true is DPWM dimming mode, otherwise Analog dimming mode.
  * @phase_shift:true is phase shift mode.
- * @short_detecion_threshold:	It should be one of 4, 5, 6 and 7V.
+ * @short_detection_threshold:	It should be one of 4, 5, 6 and 7V.
  * @boost_current_limit:	It should be one of 2300, 2750mA.
  */
 struct sky81452_bl_platform_data {
-- 
2.25.1

