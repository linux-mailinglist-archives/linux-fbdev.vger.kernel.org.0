Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9051711B3
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Jul 2019 08:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388145AbfGWGOu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 23 Jul 2019 02:14:50 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42857 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388162AbfGWGOr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 23 Jul 2019 02:14:47 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so18569389pff.9
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 23:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rUdeKFVKj/j46aY/YcoOji4W0Ij6fg/KFJvYkeK7wzw=;
        b=YdOCMHbEQbXw8KubWzfOBaz7EB1B9f22y/t/+FTFKWx6jaFEuKDB5E3Sdj+cgk/DqY
         C9cxtOOhSrNaS0qcgK+e3peT5VxHr1x8GRySc1B8JNaI4BFnBdNZKAcPcQwlFhAuZnHM
         fVZrfoQqSU7JY3To8jmisIml+v18EtMwAP2mG9m2TZV0803DLrB/agmYbIynLjJbpWGf
         CEx548oc6YgKawUdx4hUVc63pqEnTiPyaA84BAupYaEGnhrc2rFI0wqFtyI4YVcC2EqM
         TcblXyTlgI5zs0HecA/SZBqEEZyaW8DH0Iy3gUTOjqAgrxmynKEqKoeWUy9kWzXO4Cue
         ThYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rUdeKFVKj/j46aY/YcoOji4W0Ij6fg/KFJvYkeK7wzw=;
        b=Wk7vgqDD522A9EuvO3Ifb0YH6qmTE7xTN7+/rR+x6Gc+gV6z53xezSaJ064YfAw08s
         oY3LDRCfpQtVFus86tD78levygzu2B+LDgFGBEHUlU4UDVz6fZDTSdWJyDX6y4tA4ElU
         naCzPaAA4tJhe+Q51QM3wrBovBJVdaxkwHaibHpP1Rvi19stNVIP+qG/xcDyMyp4iyzB
         7ofx5bZs6NdhdzRoRvWRnW/b+qcffYIWQ9vjE5o997rX5RGDF5tw4jMuHqaNzDhiPNI9
         mfSH7zg5/e8lNahuLukPI/ZG3PVjsS5bLSB2OiXmC01jVrnSmpQh3S42rcUXsNxQqabv
         zNpQ==
X-Gm-Message-State: APjAAAXMzURXvFcz8NM41uvmQ4syZIrk/9YJZYHvM8OhufgYzwKeeWw2
        4eeihSEAmnxCrs0rMaesLHBbrQ==
X-Google-Smtp-Source: APXvYqzYmC0czirjB9JZaCwmGJpEhIA8u9rhpfNc/1Lkv6/WiUNTY1TurBq8xS5qTAzrc9zunXfj2g==
X-Received: by 2002:a63:2148:: with SMTP id s8mr73371962pgm.336.1563862486415;
        Mon, 22 Jul 2019 23:14:46 -0700 (PDT)
Received: from localhost ([122.172.28.117])
        by smtp.gmail.com with ESMTPSA id j10sm3176159pfn.188.2019.07.22.23.14.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 23:14:45 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 08/10] video: pxafb: Remove cpufreq policy notifier
Date:   Tue, 23 Jul 2019 11:44:08 +0530
Message-Id: <56ea0fb68b99d343b093bc517024356a18f780e7.1563862014.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1563862014.git.viresh.kumar@linaro.org>
References: <cover.1563862014.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The cpufreq policy notifier's CPUFREQ_ADJUST notification is going to
get removed soon.

The notifier callback pxafb_freq_policy() isn't doing anything apart
from printing a debug message on CPUFREQ_ADJUST notification. There is
no point in keeping an otherwise empty callback and registering the
notifier.

Remove it.

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/video/fbdev/pxafb.c | 21 ---------------------
 drivers/video/fbdev/pxafb.h |  1 -
 2 files changed, 22 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 4282cb117b92..f70c9f79622e 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -1678,24 +1678,6 @@ pxafb_freq_transition(struct notifier_block *nb, unsigned long val, void *data)
 	}
 	return 0;
 }
-
-static int
-pxafb_freq_policy(struct notifier_block *nb, unsigned long val, void *data)
-{
-	struct pxafb_info *fbi = TO_INF(nb, freq_policy);
-	struct fb_var_screeninfo *var = &fbi->fb.var;
-	struct cpufreq_policy *policy = data;
-
-	switch (val) {
-	case CPUFREQ_ADJUST:
-		pr_debug("min dma period: %d ps, "
-			"new clock %d kHz\n", pxafb_display_dma_period(var),
-			policy->max);
-		/* TODO: fill in min/max values */
-		break;
-	}
-	return 0;
-}
 #endif
 
 #ifdef CONFIG_PM
@@ -2400,11 +2382,8 @@ static int pxafb_probe(struct platform_device *dev)
 
 #ifdef CONFIG_CPU_FREQ
 	fbi->freq_transition.notifier_call = pxafb_freq_transition;
-	fbi->freq_policy.notifier_call = pxafb_freq_policy;
 	cpufreq_register_notifier(&fbi->freq_transition,
 				CPUFREQ_TRANSITION_NOTIFIER);
-	cpufreq_register_notifier(&fbi->freq_policy,
-				CPUFREQ_POLICY_NOTIFIER);
 #endif
 
 	/*
diff --git a/drivers/video/fbdev/pxafb.h b/drivers/video/fbdev/pxafb.h
index b641289c8a99..86b1e9ab1a38 100644
--- a/drivers/video/fbdev/pxafb.h
+++ b/drivers/video/fbdev/pxafb.h
@@ -162,7 +162,6 @@ struct pxafb_info {
 
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
-	struct notifier_block	freq_policy;
 #endif
 
 	struct regulator *lcd_supply;
-- 
2.21.0.rc0.269.g1a574e7a288b

