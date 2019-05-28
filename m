Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A70D82C258
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 May 2019 11:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbfE1JEY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 May 2019 05:04:24 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42035 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727212AbfE1JDu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 May 2019 05:03:50 -0400
Received: by mail-ed1-f67.google.com with SMTP id g24so2700027eds.9
        for <linux-fbdev@vger.kernel.org>; Tue, 28 May 2019 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xdSAzTv9tDPr6PTxvMhXZVM/Er2L9zs7q0S7NNjW/ok=;
        b=XG2Xk6QdQnFvZNtT1FJSbJRUie40rMANdM0srLaNSg5DjS2kagtuP2RFgL4VendVOT
         BabNgErILkSIbHiZbTBTMTYqlOuoHuDBbXOVrWrUlgwpokq6/Wf0htlfVQ/vZhH8sFl9
         dkgrYC8vItg/cnP9Ums7sqMpu0F3/0mku30MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xdSAzTv9tDPr6PTxvMhXZVM/Er2L9zs7q0S7NNjW/ok=;
        b=MUxjjXCRHS2KUhqdQWlItR/cbfBZJjWFvGoOoImdOCQk2uFfOB92jlyyNc0q1PTY+x
         I0DngRVaBPixwkLm/X2FcEOA2IgGPqqc1zgjx96Qbc43CDP94qfzoiajQTwmt3jWLApZ
         B53cnxNc/qYrZYP48tasBSfCkrdm1bB93rNiL0s3lSo0HzNr38czGp5Hg9AYreCtccHc
         L+vnGm92RXsGdbwVp9s6E/d6N4SAcRw1teCMtdNyxgiIKxN5L+XFydcGlImn6R3vNaV/
         aYj/Hl2PydwUPLpR1Z2QwmdHkdbUDlipv+TZnnpYCxFDuwkbKuA25dsgV3FFC8hECUOt
         YJ/g==
X-Gm-Message-State: APjAAAXw0ucw0inYeIdigMFsG1YxBg6TSXfiZF/z2coOS2/gz+rIh1RM
        iX0FV3iD0FWi1MIuLlS9SXjZpg==
X-Google-Smtp-Source: APXvYqz7N+WGbx3CGIzAcTP4j/O/T91KOj5m1m+2vfXlGhtH0z7XZhnZ1uDp1ATj69H/KzvnZS3Kaw==
X-Received: by 2002:a50:f4fb:: with SMTP id v56mr128756589edm.13.1559034228987;
        Tue, 28 May 2019 02:03:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 02:03:48 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Yisheng Xie <ysxie@foxmail.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Rob Clark <robdclark@gmail.com>
Subject: [PATCH 26/33] fbdev: remove FBINFO_MISC_USEREVENT around fb_blank
Date:   Tue, 28 May 2019 11:02:57 +0200
Message-Id: <20190528090304.9388-27-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

With the recursion broken in the previous patch we can drop the
FBINFO_MISC_USEREVENT flag around calls to fb_blank - recursion
prevention was it's only job.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Yisheng Xie <ysxie@foxmail.com>
Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
Cc: Peter Rosin <peda@axentia.se>
Cc: Mikulas Patocka <mpatocka@redhat.com>
Cc: Rob Clark <robdclark@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c   | 5 ++---
 drivers/video/fbdev/core/fbmem.c   | 3 ---
 drivers/video/fbdev/core/fbsysfs.c | 2 --
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index a4617067ff24..b5ee89f16d6c 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2386,9 +2386,8 @@ static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch)
 			fbcon_cursor(vc, blank ? CM_ERASE : CM_DRAW);
 			ops->cursor_flash = (!blank);
 
-			if (!(info->flags & FBINFO_MISC_USEREVENT))
-				if (fb_blank(info, blank))
-					fbcon_generic_blank(vc, info, blank);
+			if (fb_blank(info, blank))
+				fbcon_generic_blank(vc, info, blank);
 		}
 
 		if (!blank)
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index d6713dce9e31..25ae466ba593 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1194,10 +1194,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 	case FBIOBLANK:
 		console_lock();
 		lock_fb_info(info);
-		info->flags |= FBINFO_MISC_USEREVENT;
 		ret = fb_blank(info, arg);
-		info->flags &= ~FBINFO_MISC_USEREVENT;
-
 		/* might again call into fb_blank */
 		fbcon_fb_blanked(info, arg);
 		unlock_fb_info(info);
diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 252d4f52d2a5..882b471d619e 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -310,9 +310,7 @@ static ssize_t store_blank(struct device *device,
 
 	arg = simple_strtoul(buf, &last, 0);
 	console_lock();
-	fb_info->flags |= FBINFO_MISC_USEREVENT;
 	err = fb_blank(fb_info, arg);
-	fb_info->flags &= ~FBINFO_MISC_USEREVENT;
 	/* might again call into fb_blank */
 	fbcon_fb_blanked(fb_info, arg);
 	console_unlock();
-- 
2.20.1

