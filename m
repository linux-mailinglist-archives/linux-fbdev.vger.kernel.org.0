Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EE923CCEB
	for <lists+linux-fbdev@lfdr.de>; Wed,  5 Aug 2020 19:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728614AbgHERLe (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 5 Aug 2020 13:11:34 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25640 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728484AbgHERIi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 5 Aug 2020 13:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596647316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=NXrvFSV+dNzT7Ew4OtdZ4sl3Tp8McXO1LQ3a/45Cy2g=;
        b=EcJmCxzcZ7bIjzT8p2fD9r9DFXN5PtMFJjemYihJHR4uAtiKoWvBjwWqOk9kSn9ggH+S59
        HiABS3ToP9hSmwJ272U6SN7hSZ4lurUNFMkW9KmlzWvPenZJeHiyBvLIaA/NGv5CWCKSsk
        pFmFSBkgEdzaSe724K3ITd1F4hkxE6g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-4nc9J-xgORG3P-Xe2vdOHA-1; Wed, 05 Aug 2020 10:52:19 -0400
X-MC-Unique: 4nc9J-xgORG3P-Xe2vdOHA-1
Received: by mail-qt1-f200.google.com with SMTP id u17so29521837qtq.13
        for <linux-fbdev@vger.kernel.org>; Wed, 05 Aug 2020 07:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NXrvFSV+dNzT7Ew4OtdZ4sl3Tp8McXO1LQ3a/45Cy2g=;
        b=BNnCDbBPZDy/Mq3t3GNwSAyN2dbUFnDwr7nF5utVQyTNwIibjwXb4/0xA7okIiKiKi
         c0/Cv87fd18NRIfViyCOvNkO7JQTfloM3l52O1MR1Jvp6sik5tlbniZNjdhoxiaEpJE6
         oYkLexqQ8HUXPngaUQcj4i2Z9HGad9vR2mdrewl1e9t3m8wTz7Dh008jIt7KZNK0Xh76
         3L6K/3iVDY/mvCe52lZL70geLwGE4xIkWFx9tAbTcQohbTKFsPyShPEzxB6+qx5jB3rU
         rjLWTxWupVmNl86xPdLdz8TCMr3N+s5oiboD9tBPiX9gtDy/ZHkOonqhNQCaSZfImdEg
         31kA==
X-Gm-Message-State: AOAM5312kU4OHmGs5S9RCAUmpufKmDNU9UM4wElqNMSk6ncd2SYimhji
        zcTvoE1s1nYcQonGdo8RggG+9FLsd+6Z+kUkCUxh1IEtYob+uHkk3qW2MjuNkfmRzTOnJiBLdYs
        sMM/ok1HXRyIIBLc/5xWmPZk=
X-Received: by 2002:ac8:4a99:: with SMTP id l25mr3768029qtq.132.1596639139244;
        Wed, 05 Aug 2020 07:52:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp5tU+SNu4wENz/P1igk4DE3nEE4fftblfRV1X1lQLG3yUmxqeZIDzwczARUE/HJu8apixFA==
X-Received: by 2002:ac8:4a99:: with SMTP id l25mr3768003qtq.132.1596639138881;
        Wed, 05 Aug 2020 07:52:18 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 22sm1868301qkd.64.2020.08.05.07.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:52:17 -0700 (PDT)
From:   trix@redhat.com
To:     thomas@winischhofer.net, b.zolnierkie@samsung.com, akpm@osdl.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] video: fbdev: sis: fix null ptr dereference
Date:   Wed,  5 Aug 2020 07:52:08 -0700
Message-Id: <20200805145208.17727-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this representative error

init.c:2501:18: warning: Array access (from variable 'queuedata') results
  in a null pointer dereference
      templ |= ((queuedata[i] & 0xc0) << 3);

This is the problem block of code

   if(ModeNo > 0x13) {
      ...
      if(SiS_Pr->ChipType == SIS_730) {
	 queuedata = &FQBQData730[0];
      } else {
	 queuedata = &FQBQData[0];
      }
   } else {

   }

queuedata is not set in the else block

Reviewing the old code, the arrays FQBQData730 and FQBQData were
used directly.

So hoist the setting of queuedata out of the if-else block.

Fixes: 544393fe584d ("[PATCH] sisfb update")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/video/fbdev/sis/init.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/sis/init.c b/drivers/video/fbdev/sis/init.c
index dfe3eb769638..fde27feae5d0 100644
--- a/drivers/video/fbdev/sis/init.c
+++ b/drivers/video/fbdev/sis/init.c
@@ -2428,6 +2428,11 @@ SiS_SetCRT1FIFO_630(struct SiS_Private *SiS_Pr, unsigned short ModeNo,
 
    i = 0;
 
+	if (SiS_Pr->ChipType == SIS_730)
+		queuedata = &FQBQData730[0];
+	else
+		queuedata = &FQBQData[0];
+
    if(ModeNo > 0x13) {
 
       /* Get VCLK  */
@@ -2445,12 +2450,6 @@ SiS_SetCRT1FIFO_630(struct SiS_Private *SiS_Pr, unsigned short ModeNo,
       /* Get half colordepth */
       colorth = colortharray[(SiS_Pr->SiS_ModeType - ModeEGA)];
 
-      if(SiS_Pr->ChipType == SIS_730) {
-	 queuedata = &FQBQData730[0];
-      } else {
-	 queuedata = &FQBQData[0];
-      }
-
       do {
 	 templ = SiS_CalcDelay2(SiS_Pr, queuedata[i]) * VCLK * colorth;
 
-- 
2.18.1

