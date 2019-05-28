Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A25572C296
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 May 2019 11:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfE1JDd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 May 2019 05:03:33 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37267 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbfE1JDc (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 May 2019 05:03:32 -0400
Received: by mail-ed1-f67.google.com with SMTP id w37so30609315edw.4
        for <linux-fbdev@vger.kernel.org>; Tue, 28 May 2019 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vM1aYE2ulFqwNKAI91FehOuN3FngVvZTQQrOwUdJ200=;
        b=KW37xWZVcPypjbSNTGtze1qbJdJ+h3eyy81RbWAyp7nDLbzjHN5Wkb5DfFZKHDsp2A
         v6vepSIbHMJFlOq2tkBtTV/XzHFr6pwUkmz2w01+sxCfI4CkmEqKeMStEPkcI1eaw2zU
         cTRX3cMyqjfte5kX7q5zfCLS6/JyWCmbOWE5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vM1aYE2ulFqwNKAI91FehOuN3FngVvZTQQrOwUdJ200=;
        b=RXA8trCbCTIkM2jCHRSgpwQt9GNeoEPleMpxrgVoCGaVXvq8DFlcCCsLoMOJPlRhCS
         f9Ej4hhnYYGrEEHE+QqaM4b2mE+DG18Oe8UDf0qlHox2pZCX8YhGWmsxyW6D+0z88FJL
         Dy1vdAAyYhEabQMjcgNHRJp9AISmZWMPnqqYUMnCLVnaqEPeMMPtBZ/WhnAvantn6y0r
         JbamlQoJNv7gjDTJSj9QUFeQuErEkllrP5BI/yk/+ttEGdogi5LAfBz1tEwyzvVLuYyv
         v1lct00LrCEb+XmAzxlCxRS+AEOt1DP2VwRZwI2kJy7rcIurJo29JKrTXSzBtkzMPEop
         RNvw==
X-Gm-Message-State: APjAAAXWefR4oWIss/v4zAfQf/dJOnbBc4kBIRhjonhajiB2CTrrDePp
        NdCmOGYzJD0fUcBxUqa+juH9HA==
X-Google-Smtp-Source: APXvYqwU3phWu021ZksHkbFLtcLsKLyfWY2d+xsu54QDYCzOWlQy1gkDllSESV1InsXH4hWCGMcBow==
X-Received: by 2002:a50:b3a6:: with SMTP id s35mr129115181edd.220.1559034210796;
        Tue, 28 May 2019 02:03:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 02:03:29 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>
Subject: [PATCH 13/33] fbdev: sysfs files can't disappear before the device is gone
Date:   Tue, 28 May 2019 11:02:44 +0200
Message-Id: <20190528090304.9388-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Which means lock_fb_info can never fail. Remove the error handling.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Rob Clark <robdclark@gmail.com>
---
 drivers/video/fbdev/core/fbsysfs.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 44cca39f2b51..5f329278e55f 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -179,10 +179,7 @@ static ssize_t store_modes(struct device *device,
 		return -EINVAL;
 
 	console_lock();
-	if (!lock_fb_info(fb_info)) {
-		console_unlock();
-		return -ENODEV;
-	}
+	lock_fb_info(fb_info);
 
 	list_splice(&fb_info->modelist, &old_list);
 	fb_videomode_to_modelist((const struct fb_videomode *)buf, i,
@@ -409,10 +406,7 @@ static ssize_t store_fbstate(struct device *device,
 	state = simple_strtoul(buf, &last, 0);
 
 	console_lock();
-	if (!lock_fb_info(fb_info)) {
-		console_unlock();
-		return -ENODEV;
-	}
+	lock_fb_info(fb_info);
 
 	fb_set_suspend(fb_info, (int)state);
 
-- 
2.20.1

