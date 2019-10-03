Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D583BCB136
	for <lists+linux-fbdev@lfdr.de>; Thu,  3 Oct 2019 23:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387506AbfJCVfI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 3 Oct 2019 17:35:08 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41379 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387486AbfJCVfH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 3 Oct 2019 17:35:07 -0400
Received: by mail-pg1-f195.google.com with SMTP id s1so2502741pgv.8
        for <linux-fbdev@vger.kernel.org>; Thu, 03 Oct 2019 14:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7AHHcEKrWBM5y9wBFl/C7jzA4xtd9EY/YdeDi/hosms=;
        b=ASTwwcBDLKFauBJRi7fwuLBmPbFmPW/3m9tG2zvZzcpcFnfrephyeKAqsoDz/Gbc66
         sNU/cLXRpwM2QQGC5Tx0G9jDeC8pwZEfAnjhJVs59CzNawD20uQqRrHq58tGrC/fQblp
         hNqMsIa+vM2uuIefpEywLO5YYokaczyteqWGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7AHHcEKrWBM5y9wBFl/C7jzA4xtd9EY/YdeDi/hosms=;
        b=qHU6H/KeCHjCpBaMTIpXWDlqDl2jlucfze352GqijG251NVniNp8p04NybHoelTVYm
         EtDxR55DQo5OqRB1v9Ya86psje/Ijb/QfO53C2AGMg75vLoVFcK90y+eMeJrI8iqgjDB
         6s6GklhyealaamJqImVf2agNWN6u4mcOv4RZqrIOw/fx6Vpx3g8/bCj2sysx2P3IjFs/
         gE0OhT4nNkF4J1L1bIgre8V0rkfe/rIa2/dSV7d0ZkpG4dc7F+2/ohK2SmRQPFjXN6mT
         hwi2Pe5iwDFVMLwKpdnYjawBoVuuk2bdtJsbSW1Qz3/pLjTEo8w+tdVF3HxfS4VOyamF
         IygQ==
X-Gm-Message-State: APjAAAVZ77eB2UscqZH9bSd8PS4ZtquMEW8w0FbbwUq5F2zToY1GzkVf
        AJ0mQTQwGzAx8xx/Dls9Nwq3gg==
X-Google-Smtp-Source: APXvYqwzXDfyh4cXIWrG9bwfnxsIwKRIIusw5EU7eFwaLpQRN0oyj60CNEvRM3XFeIwxxnCXAkV7kA==
X-Received: by 2002:a63:4d4e:: with SMTP id n14mr11552757pgl.88.1570138505256;
        Thu, 03 Oct 2019 14:35:05 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 30sm3240647pjk.25.2019.10.03.14.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 14:35:04 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Matthias Kaehlcke <mka@chromium.org>, linux-pwm@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] backlight: pwm_bl: Add missing curly branches in else branch
Date:   Thu,  3 Oct 2019 14:35:02 -0700
Message-Id: <20191003213502.102110-1-mka@chromium.org>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Add curly braces to an 'else' branch in pwm_backlight_update_status()
to match the corresponding 'if' branch.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/video/backlight/pwm_bl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 746eebc411df..130abff2705f 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -125,8 +125,9 @@ static int pwm_backlight_update_status(struct backlight_device *bl)
 		state.duty_cycle = compute_duty_cycle(pb, brightness);
 		pwm_apply_state(pb->pwm, &state);
 		pwm_backlight_power_on(pb);
-	} else
+	} else {
 		pwm_backlight_power_off(pb);
+	}
 
 	if (pb->notify_after)
 		pb->notify_after(pb->dev, brightness);
-- 
2.23.0.444.g18eeb5a265-goog

