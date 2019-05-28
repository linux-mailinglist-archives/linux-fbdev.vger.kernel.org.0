Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA352C2A0
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 May 2019 11:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbfE1JGq (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 May 2019 05:06:46 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41371 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726895AbfE1JDW (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 May 2019 05:03:22 -0400
Received: by mail-ed1-f67.google.com with SMTP id m4so30615600edd.8
        for <linux-fbdev@vger.kernel.org>; Tue, 28 May 2019 02:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wpi1xWPy33lj9mKcPzFNSCGKIPsIrM24U07obZg4Bbk=;
        b=HRwgYNCSeirp12RNt1fyc5OhQoszF2Uo7tDWacf52/s+HTFiZCUvyKuqcMcCFLqTo7
         osyTlqilBk3yRLl/Vm39fichaec5uHYWxg/SR+yE+xqDXUsKId+uFHmCikQYi4P9iErW
         GcKPar6d/CdwBiFSNkAYtg+09d1NA/M8qXEg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wpi1xWPy33lj9mKcPzFNSCGKIPsIrM24U07obZg4Bbk=;
        b=j25j9nOQvhGV0ZvWgi7IP4aAIWv7N2Dv3hS3IK9UrkuYRij222C/0IAZ2xZRQbY4kU
         wgM/GnjEjJM8psg/pdr2qZk0igWEzRFw6NyHGM1zlb0/ucb2hVPIvsk9qigGpoWjwnqt
         tuBd2GzJBIWhRjvxL4hSlVvmAXoQR+482PBkKPKojmR9BePM+WUEei8x7IeFcMRDdKr4
         rdp93OmleqsKwEfB1GEHd2dZxtqZPsypwSkJ4xTCm7oaNOlREF83l59u43HCiLV40ln1
         pG0RmnaWbYDpSirQpuju3mLR389dgWctakY2Qb4GjZYakmLq7M2YNDKrptgbc9L148Ua
         BIsA==
X-Gm-Message-State: APjAAAVv52RZ7uRM8Go7Cou4a+rTw+kk++H4/7Q8wzYfOjcVUn4TC6dc
        vyRhbaRG5BkJKgOP0tA/JSWwtg==
X-Google-Smtp-Source: APXvYqyMZ+XP/DYBnT+b0/bEtV1bg4DZ2v7pGi2tkNPgOMj6ozhRdzLU/jwSi0kUA3Q+ESL/hNZuXg==
X-Received: by 2002:a50:ad98:: with SMTP id a24mr127149884edd.235.1559034200289;
        Tue, 28 May 2019 02:03:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 02:03:17 -0700 (PDT)
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
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/33] fbdev/cyber2000: Remove struct display
Date:   Tue, 28 May 2019 11:02:37 +0200
Message-Id: <20190528090304.9388-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Entirely unused.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/video/fbdev/cyber2000fb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 9a5751cb4e16..452ef07b3a06 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -61,7 +61,6 @@
 struct cfb_info {
 	struct fb_info		fb;
 	struct display_switch	*dispsw;
-	struct display		*display;
 	unsigned char		__iomem *region;
 	unsigned char		__iomem *regs;
 	u_int			id;
-- 
2.20.1

