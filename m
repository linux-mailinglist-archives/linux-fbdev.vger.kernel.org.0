Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E32FFCF92F
	for <lists+linux-fbdev@lfdr.de>; Tue,  8 Oct 2019 14:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730912AbfJHMFY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 8 Oct 2019 08:05:24 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36200 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730750AbfJHMFX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 8 Oct 2019 08:05:23 -0400
Received: by mail-lj1-f195.google.com with SMTP id v24so17245442ljj.3
        for <linux-fbdev@vger.kernel.org>; Tue, 08 Oct 2019 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t1XvNBeL5bYKnc6NbbptU+vm2vXQBBrTO687+/k8huo=;
        b=ELuDRuvEPbxHn+tPF2h2RxCruUdG8zM+LbvVMlIluH8Z/3Nz3rM48QruNf6Jjzt6Qx
         s+T3vGwTXw/HUazqjiUT8y6NaXwohlIowNQCdfwlwMsrwKqKmMOt9HlxSOwPJeCD4YOl
         uaNX5F5hIsDxJs3FYKG+NK0+p/NucTLWFjocY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t1XvNBeL5bYKnc6NbbptU+vm2vXQBBrTO687+/k8huo=;
        b=ETdXxgAmrj5xsG+Mr8hzltf12aDjhohhRP35evKoW+5Sg7NdprOdnK+g9suy37LeIS
         26ET9HTjzN4ZQAohF5QYYt+7dqqGS6SMjnE3gDQWKN1XyUJ+L8vjO+1s+KOjIReKIf/N
         +7SJhdHTK/JqToKSQxSvzzNmqOzxFz7pv9Vs8bddKOXek+AmAelugyZDkyiss2qhO9Zq
         V2sU09MY9nwDiTP7MYZEL9akymSG+MmXvO11EYCHfqCobZz2JzltMWqX9bbCnlj6xTNo
         Ndwoti93SG7AwJEoVUHu8FEt59pImD2+TnQgWeg2r5yzsayeY9FTLphLy8mo7qEYbLi1
         ZBtw==
X-Gm-Message-State: APjAAAWPNYEtnHiypwJBCPIzN+Kl6PlC3qyHeaNfpUwYNZuBOi71ptJc
        RdBGUAUgv9QrXcglrvHa4MjSjQ==
X-Google-Smtp-Source: APXvYqwr3eVj5VGcs9c4XwSP3Lzo4ODiUPJZt5VqFcpdr7xw+mtUtMYtWeZVNZS+BWY7vjjUDAVqgQ==
X-Received: by 2002:a2e:9d16:: with SMTP id t22mr19624221lji.207.1570536321581;
        Tue, 08 Oct 2019 05:05:21 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id z18sm3918033ljh.17.2019.10.08.05.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 05:05:19 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] backlight: pwm_bl: eliminate a 64/32 division
Date:   Tue,  8 Oct 2019 14:03:25 +0200
Message-Id: <20191008120327.24208-3-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

lightness*1000 is nowhere near overflowing 32 bits, so we can just use
an ordinary 32/32 division, which is much cheaper than the 64/32 done
via do_div().

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/video/backlight/pwm_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index cc44a02e95c7..672c5e7cfcd1 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -177,7 +177,7 @@ static u64 cie1931(unsigned int lightness, unsigned int scale)
 	 */
 	lightness *= 100;
 	if (lightness <= (8 * scale)) {
-		retval = DIV_ROUND_CLOSEST_ULL(lightness * 10, 9033);
+		retval = DIV_ROUND_CLOSEST(lightness * 10, 9033);
 	} else {
 		retval = int_pow((lightness + (16 * scale)) / 116, 3);
 		retval = DIV_ROUND_CLOSEST_ULL(retval, (scale * scale));
-- 
2.20.1

