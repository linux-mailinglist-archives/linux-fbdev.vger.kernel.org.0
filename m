Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEFD20768C
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2020 17:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404365AbgFXPEu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Jun 2020 11:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404362AbgFXPEt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Jun 2020 11:04:49 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC47C061796
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jun 2020 08:04:49 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h5so2625894wrc.7
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jun 2020 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RVepsW5AvbKSelkDGpeRLJ59PttgtzeSmv2QlhFjJvQ=;
        b=LsBw1uV8LrG03R4u2wAAHV9lr+txMyw7+BdND15xIDswqXzGkXd922uezxszzxlKxa
         y6z1rBpFXRbiDLX/DYinCMp07ITmQAaZc4ADuyeddcvqYS9TdDbGAYOWzoL2rDSQWcw9
         85nofVUxEK24RYZvCHdW4bsSTMWEs4SAqGBcHF+XCYhgfe54ZZFoXKhSjLS2/c9PD9N3
         MjSyj4nMjZzhJNj1+kmNeddik1BNOt9Qx4pJUmMe8atuBq0wU6WIA3OgGX8lEd5hIh7w
         uQSnwO83jCtGstF7Qtm4upnJkXj8EyJ26Ib+qAdCMXuKvWx55yEiYohCoEgTdLNct4K9
         AsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RVepsW5AvbKSelkDGpeRLJ59PttgtzeSmv2QlhFjJvQ=;
        b=DJcFAwx1QWibhvIm1J6ftQD2XCwgSQR3X5mkhogNt0p5AdOhQJWJtnLG3sqvCDx1md
         tgXITm8IjkgHIqis9CHuVJZ0OquTK97+vaUBVJkrJBmipup9X9yu4Vy2Ot8Ioqvdscxi
         Za08oot3PWc3f8OWUFOD6ctBPkee5HiPv5WyYuOgBzRBZJhN6PIE3bVvJlJyWd7EAqoO
         7sfvRcDkudchERibKbGLwlXbQ0nznb6l5qXUis5noRDuD1V0O6N5S4dQj+BHmJH80MTp
         QGyFdyXgiq0TFiclI3bXc/34YWfJ0XMmY0Pr5IB2ZKJ1Wawqz9n7ZtLzT3C0HMC6goL2
         aqog==
X-Gm-Message-State: AOAM531L6Df1KwafC8083CD7YJF5Fn5rlyCqM3SRKBxFICee5CEo5dZE
        HizQ8Sjq4mbtUWz5YsyAgpsAOg==
X-Google-Smtp-Source: ABdhPJy5hjoveRZ0F4NTZinjK6e2tP12GsQQtzyhrotgfkM8UdmF7amCXrR0qX7WGB+tS0ZfQBcPvA==
X-Received: by 2002:adf:e782:: with SMTP id n2mr31179657wrm.417.1593011088504;
        Wed, 24 Jun 2020 08:04:48 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:04:47 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, stable@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jamey Hicks <jamey.hicks@hp.com>,
        Andrew Zabolotny <zap@homelink.ru>
Subject: [PATCH 6/8] backlight: backlight: Supply description for function args in existing Kerneldocs
Date:   Wed, 24 Jun 2020 15:57:19 +0100
Message-Id: <20200624145721.2590327-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200624145721.2590327-1-lee.jones@linaro.org>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Kerneldoc syntax is used, but not complete.  Descriptions required.

Prevents warnings like:

 drivers/video/backlight/backlight.c:329: warning: Function parameter or member 'reason' not described in 'backlight_force_update'
 drivers/video/backlight/backlight.c:354: warning: Function parameter or member 'props' not described in 'backlight_device_register'

Cc: <stable@vger.kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Jamey Hicks <jamey.hicks@hp.com>
Cc: Andrew Zabolotny <zap@homelink.ru>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/backlight/backlight.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 92d80aa0c0ef1..744ba58488e01 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -320,6 +320,7 @@ ATTRIBUTE_GROUPS(bl_device);
  * backlight_force_update - tell the backlight subsystem that hardware state
  *   has changed
  * @bd: the backlight device to update
+ * @reason: reason for update
  *
  * Updates the internal state of the backlight in response to a hardware event,
  * and generate a uevent to notify userspace
@@ -344,6 +345,7 @@ EXPORT_SYMBOL(backlight_force_update);
  * @devdata: an optional pointer to be stored for private driver use. The
  *   methods may retrieve it by using bl_get_data(bd).
  * @ops: the backlight operations structure.
+ * @props: pointer to backlight's properties structure.
  *
  * Creates and registers new backlight device. Returns either an
  * ERR_PTR() or a pointer to the newly allocated device.
-- 
2.25.1

