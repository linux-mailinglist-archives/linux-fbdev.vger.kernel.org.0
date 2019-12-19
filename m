Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCED125D39
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Dec 2019 10:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbfLSJFf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 19 Dec 2019 04:05:35 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40023 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfLSJFf (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 19 Dec 2019 04:05:35 -0500
Received: by mail-pf1-f194.google.com with SMTP id q8so2840183pfh.7
        for <linux-fbdev@vger.kernel.org>; Thu, 19 Dec 2019 01:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyderabad.bits-pilani.ac.in; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=AJrQiLYNAF/E1S5b1mRsk2AKXE5RDFoq3eOqQWgOzh4=;
        b=Wj4xmeYtJjpM9+eir9kpHbU3gtjUwkOwdFw/EvV6YGe0tzGEoMse+DlGUjtcBn9AVk
         yO47EJj5NQKgrOeOIPnMUrgbu+AA4GfcezmWu/BdA94vaKjvQsY4g+/GfvFu/mfXGYcN
         lpfo/vUDhKF4SUgW8zx5yCFaqwukjL/NyeWi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AJrQiLYNAF/E1S5b1mRsk2AKXE5RDFoq3eOqQWgOzh4=;
        b=Bd7U2/oteEXIocUHB+NPaKBS+MMIaAr9FwXDKmfQ7UtXGoceyjqQiCZB4ruc9BgoyA
         9bWlUkm8N3LQ4YnzXZmKpx9+sj+vz2dObtXSMKiI72LpXGDd6hUo3caXb6yvqxIdNUxf
         onWFBINIXZtaFjl6lQ9rfaTclcpo04z/T8grDZqDhCnqCd+vB3DrGolVra9bL+6FER5o
         mdrOvcFI+1NPxARWAPf2y5Fd2C7G08yGL6JOE5hzlf64+MZtb2q4ztaJX7tK8Aj17V+a
         k12BzMxmmx+UHXtVvcWJZ8vBwH87Zlko5iIctwSuxLMq3RUIjNpliZxyUuZTF1A+L7/I
         oQ/Q==
X-Gm-Message-State: APjAAAXQPiB2K0tK8OeYsw6nDhxyJzunPOpDYolsBw3u+KOH1CSLXlXg
        G+QSXoqlwGLr+wtV9woCfcWLZg==
X-Google-Smtp-Source: APXvYqywH5YqYI79B9shtzhIYrdCjNEdtTe+qTjaPdt1archPdCe6TtU6xTSOEzt/USyCkf1gUPrgQ==
X-Received: by 2002:a63:904c:: with SMTP id a73mr8027070pge.335.1576746334421;
        Thu, 19 Dec 2019 01:05:34 -0800 (PST)
Received: from localhost.localdomain ([2402:8100:2800:cf9f:4401:9547:9e30:ea15])
        by smtp.googlemail.com with ESMTPSA id l127sm6502304pgl.48.2019.12.19.01.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 01:05:33 -0800 (PST)
From:   Simran Sandhu <f20171454@hyderabad.bits-pilani.ac.in>
To:     gregkh@linuxfoundation.org
Cc:     sudipm.mukherjee@gmail.comm, teddy.wang@siliconmotion.com,
        linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Staging: sm750fb: sm750.h:Fixed Coding Style Issue
Date:   Thu, 19 Dec 2019 14:35:53 +0530
Message-Id: <20191219090553.13243-1-f20171454@hyderabad.bits-pilani.ac.in>
X-Mailer: git-send-email 2.17.1
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fixed the checkpath error: function definition arguments
should also have identifier names

Signed-of-by: Simran Sandhu <f20171454@hyderabad.bits-pilani.ac.in>
---
 drivers/staging/sm750fb/sm750.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index ce90adcb449d..cf986bad7210 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -66,9 +66,9 @@ struct lynx_accel {
 						u32, u32, u32, u32,
 						u32, u32, u32, u32);
 
-	int (*de_imageblit)(struct lynx_accel *, const char *, u32, u32, u32, u32,
-							       u32, u32, u32, u32,
-							       u32, u32, u32, u32);
+	int (*de_imageblit)(struct lynx_accel *A, const char *B, u32 C, u32 D,
+		       						u32 E, u32 F, u32 G, u32 H, u32 I,
+							       	u32 J, u32 K, u32 L, u32 M, u32 N);
 
 };
 
-- 
2.17.1

