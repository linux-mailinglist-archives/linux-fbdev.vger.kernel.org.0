Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4921F8648
	for <lists+linux-fbdev@lfdr.de>; Sun, 14 Jun 2020 05:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgFNDFl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 13 Jun 2020 23:05:41 -0400
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:34756 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgFNDFk (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 13 Jun 2020 23:05:40 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49kzqQ4SQHz9vKTq
        for <linux-fbdev@vger.kernel.org>; Sun, 14 Jun 2020 03:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rOmAKQQwiWNb for <linux-fbdev@vger.kernel.org>;
        Sat, 13 Jun 2020 22:05:38 -0500 (CDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49kzqQ2dNvz9vKSf
        for <linux-fbdev@vger.kernel.org>; Sat, 13 Jun 2020 22:05:38 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49kzqQ2dNvz9vKSf
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49kzqQ2dNvz9vKSf
Received: by mail-io1-f72.google.com with SMTP id p8so8942435ios.19
        for <linux-fbdev@vger.kernel.org>; Sat, 13 Jun 2020 20:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6RWcchMQUTnXRjfjU8MBgF+NaxmL7vStwB+9xEzccB8=;
        b=jLMIfC3LZ8Py+m5+WvjpfVMtIgms+TIjE9xznz3oTHlHIBJPK6CM7jOKCdSCC61UlM
         siLADkMA/mBmDJSyMe4te30jEuC22gf3CtpjcynC2s9Dx7nqTM8mulR6un1EOuoz0vjC
         zpSLKTstk5jP9pmgS9JaxjMBlrbaUIhht1611dUyaYpv/cEdes/0U+DnbrWQCOz+zxOP
         ym4fwA3wOLvT+tklF/ZO1/biKXBih5e0FQb4kxTnriBCq6z45hI+uHQheuT/Y+PsSYGP
         rbtrry+QcU/9/g7gEvySAgzyye+QjQdkgWp//3aR9zjJxT+pRxQDRIrbbKi3ui8Vt9ex
         KkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6RWcchMQUTnXRjfjU8MBgF+NaxmL7vStwB+9xEzccB8=;
        b=sGhctd9xC9AszzAWP4GZyDiMPeewhySQN0RKGqrjWpU1OTfUklRgGP2OSTFOc6mOQY
         G7Diru+ftE6jhLE90dsuTv5puSy7Hy+2yVXBvZcM7UpEXyjDzBeLueCvHu4r1QjkTjzf
         xHolkr1EayQq4BD2O8A+q233/pf12YoZdG4VVSAKQ/vveDnoLDyQ8qWa3CMDlJOlQmcj
         vFDf8L98DDUDFxN8/YYGnF9FzD6Xciic7KzkZsxkmwbFLrti+//4+ItcPWR1T/XQYjTd
         rl1zXy2NUZ4NUQTPQQpF+R+UnFjAVqZ3Zoikck6WRHPueLRE09p8rneaC5hiuFDP3NmQ
         vcOA==
X-Gm-Message-State: AOAM5327AvjHooOkTA6Y080PMeyMgBGcR+dW/Xnal1YDtGjrqQT/cfyu
        m4E7wPVCR+3WJhxdLFYVUi4oMDEy3b90SuzsKmSUOPCDgfa7KM9s7Nr78Z6fWmFCmjRj/vkBTjc
        wxX8bpOLjuWxP5Sjk9/fc0Fu3/Yw=
X-Received: by 2002:a92:7104:: with SMTP id m4mr20895001ilc.87.1592103937847;
        Sat, 13 Jun 2020 20:05:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/d2pz6beT8wngqr5vOspHH6/SSx6Djv4sq83HCf0e1WRj4oISMKS0wOWKdfH6MoZQfJ4RDg==
X-Received: by 2002:a92:7104:: with SMTP id m4mr20894981ilc.87.1592103937588;
        Sat, 13 Jun 2020 20:05:37 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:49fa:9c47:e40b:9c40])
        by smtp.gmail.com with ESMTPSA id t14sm5501737ilp.73.2020.06.13.20.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 20:05:37 -0700 (PDT)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, wu000273@umn.edu,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Enrico Weigelt <info@metux.net>,
        "Andrew F. Davis" <afd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        YueHaibing <yuehaibing@huawei.com>, linux-omap@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] omapfb: fix multiple reference count leaks due to pm_runtime_get_sync
Date:   Sat, 13 Jun 2020 22:05:18 -0500
Message-Id: <20200614030528.128064-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On calling pm_runtime_get_sync() the reference count of the device
is incremented. In case of failure, decrement the
reference count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 7 +++++--
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c   | 7 +++++--
 drivers/video/fbdev/omap2/omapfb/dss/dss.c   | 7 +++++--
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c | 5 +++--
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c | 5 +++--
 drivers/video/fbdev/omap2/omapfb/dss/venc.c  | 7 +++++--
 6 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 4a16798b2ecd..e2b572761bf6 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -520,8 +520,11 @@ int dispc_runtime_get(void)
 	DSSDBG("dispc_runtime_get\n");
 
 	r = pm_runtime_get_sync(&dispc.pdev->dev);
-	WARN_ON(r < 0);
-	return r < 0 ? r : 0;
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_sync(&dispc.pdev->dev);
+		return r;
+	}
+	return 0;
 }
 EXPORT_SYMBOL(dispc_runtime_get);
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index d620376216e1..6f9c25fec994 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -1137,8 +1137,11 @@ static int dsi_runtime_get(struct platform_device *dsidev)
 	DSSDBG("dsi_runtime_get\n");
 
 	r = pm_runtime_get_sync(&dsi->pdev->dev);
-	WARN_ON(r < 0);
-	return r < 0 ? r : 0;
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_sync(&dsi->pdev->dev);
+		return r;
+	}
+	return 0;
 }
 
 static void dsi_runtime_put(struct platform_device *dsidev)
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
index 7252d22dd117..3586579c838f 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -768,8 +768,11 @@ int dss_runtime_get(void)
 	DSSDBG("dss_runtime_get\n");
 
 	r = pm_runtime_get_sync(&dss.pdev->dev);
-	WARN_ON(r < 0);
-	return r < 0 ? r : 0;
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_sync(&dss.pdev->dev);
+		return r;
+	}
+	return 0;
 }
 
 void dss_runtime_put(void)
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
index 7060ae56c062..4804aab34298 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -39,9 +39,10 @@ static int hdmi_runtime_get(void)
 	DSSDBG("hdmi_runtime_get\n");
 
 	r = pm_runtime_get_sync(&hdmi.pdev->dev);
-	WARN_ON(r < 0);
-	if (r < 0)
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_sync(&hdmi.pdev->dev);
 		return r;
+	}
 
 	return 0;
 }
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
index ac49531e4732..a06b6f1355bd 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -43,9 +43,10 @@ static int hdmi_runtime_get(void)
 	DSSDBG("hdmi_runtime_get\n");
 
 	r = pm_runtime_get_sync(&hdmi.pdev->dev);
-	WARN_ON(r < 0);
-	if (r < 0)
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_sync(&hdmi.pdev->dev);
 		return r;
+	}
 
 	return 0;
 }
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
index d5404d56c922..0b0ad20afd63 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -348,8 +348,11 @@ static int venc_runtime_get(void)
 	DSSDBG("venc_runtime_get\n");
 
 	r = pm_runtime_get_sync(&venc.pdev->dev);
-	WARN_ON(r < 0);
-	return r < 0 ? r : 0;
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_sync(&venc.pdev->dev);
+		return r;
+	}
+	return 0;
 }
 
 static void venc_runtime_put(void)
-- 
2.25.1

