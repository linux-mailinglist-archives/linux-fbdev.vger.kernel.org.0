Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199473B4A93
	for <lists+linux-fbdev@lfdr.de>; Sat, 26 Jun 2021 00:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhFYWgE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 25 Jun 2021 18:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbhFYWgE (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 25 Jun 2021 18:36:04 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17707C061574;
        Fri, 25 Jun 2021 15:33:42 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id k10so18730086lfv.13;
        Fri, 25 Jun 2021 15:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9NMDPaGNwo9dp++pt7dEDvz6yBvTGcBoymI++g12NOc=;
        b=XxeooSIoZSkGhXTTLzsaf8YXlV0sKShLzgUbVXnUr+3uwjIxtVEAvtn/nLYxqjjS+E
         645gOFtwDu27Q2bAAHc1zQcxXFbXxzSxfIZhsikD9NAkQtowjvqVchR1yrMRrcr3yaGc
         oG89m+lOmnnzs6JW0urF1QbP5OqI5hZg/9Jnz9Zs7O8csPTsI0+1T/sF8vRN4F34ulaO
         jN0E5IiFX+v3fHdTikeXUT+tPYBiENiOPFZ5MEntFVJJ1mx9Fin/wN/atCa6UNVG1s34
         HbD7SNrvdHKSxq1DP43W6eGaSw8NRSBhDXqdrJpu6uhntRQPxAqupsG5Ep8oRmof/4P4
         qiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9NMDPaGNwo9dp++pt7dEDvz6yBvTGcBoymI++g12NOc=;
        b=FVvAq50/xWj9AEb5hCPIjXw70LZG6VULZNqlmkcg5Bp17gbqAeCONM2kmS3mhDZuB8
         YC9zUUOnPRg2nwaj6FL4XUyeGBdSRPZ/MEscLGL1/YRuh3Z/+OXFByINxRjZ8jzdfHdC
         wMH/TB/iGge95cpmP99oZSspjM0OuKYFexkN+kV0nbAa3KZ++WQzE/lx28WRDfG9HxDe
         CCo+GpJsoHpHMf6L9hqgqSu5T9jzomrU/wj7HyWntKDtJcG0rLSG7JoPFAUKuni/3yyI
         XazgQpE/jVwA3hQjcSHHuAoRqJET4rjdCqW6BthsOupIWZtiUkpKddNws/1ALNvUmclp
         MraQ==
X-Gm-Message-State: AOAM532B8OwUB7Px7clKTjYM3ZH0ucKvxoD8rmbqBsFGvUyXtYYPoXP+
        ZNSiHsUdmufcu++qx//hlUM=
X-Google-Smtp-Source: ABdhPJxw0w49mOJH8eZ2E+fmYpRltbdOf6mNxIn28I5KywQCjMRXPg6FGSFpgOtx0JdQRn+GFIukdA==
X-Received: by 2002:ac2:4281:: with SMTP id m1mr9344466lfh.164.1624660420338;
        Fri, 25 Jun 2021 15:33:40 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
        by smtp.gmail.com with ESMTPSA id p26sm707610ljn.94.2021.06.25.15.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 15:33:39 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     gustavoars@kernel.org, sam@ravnborg.org, tomi.valkeinen@ti.com
Cc:     linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] OMAP: DSS2: OMAPFB: fix potential GPF
Date:   Sat, 26 Jun 2021 01:33:23 +0300
Message-Id: <20210625223323.13930-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

In case of allocation failures, all code paths was jumping
to this code:

err:
	kfree(fbi);
	kfree(var);
	kfree(fbops);

	return r;

Since all 3 pointers placed on stack and don't initialized, they
will be filled with some random values, which leads to
deferencing random pointers in kfree(). Fix it by rewriting
error handling path.

Fixes: 897044e99e43 ("OMAP: DSS2: OMAPFB: Reduce stack usage")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 .../video/fbdev/omap2/omapfb/omapfb-main.c    | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
index a3decc7fadde..6a302138ebeb 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
@@ -2025,21 +2025,19 @@ static int omapfb_mode_to_timings(const char *mode_str,
 	fbops = NULL;
 
 	fbi = kzalloc(sizeof(*fbi), GFP_KERNEL);
-	if (fbi == NULL) {
-		r = -ENOMEM;
-		goto err;
-	}
+	if (fbi == NULL)
+		return -ENOMEM;
 
 	var = kzalloc(sizeof(*var), GFP_KERNEL);
 	if (var == NULL) {
 		r = -ENOMEM;
-		goto err;
+		goto err_var;
 	}
 
 	fbops = kzalloc(sizeof(*fbops), GFP_KERNEL);
 	if (fbops == NULL) {
 		r = -ENOMEM;
-		goto err;
+		goto err_fbops;
 	}
 
 	fbi->fbops = fbops;
@@ -2047,7 +2045,7 @@ static int omapfb_mode_to_timings(const char *mode_str,
 	r = fb_find_mode(var, fbi, mode_str, NULL, 0, NULL, 24);
 	if (r == 0) {
 		r = -EINVAL;
-		goto err;
+		goto err_find;
 	}
 
 	if (display->driver->get_timings) {
@@ -2088,11 +2086,12 @@ static int omapfb_mode_to_timings(const char *mode_str,
 
 	r = 0;
 
-err:
-	kfree(fbi);
-	kfree(var);
+err_find:
 	kfree(fbops);
-
+err_fbops:
+	kfree(var);
+err_var:
+	kfree(fbi);
 	return r;
 }
 
-- 
2.32.0

