Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0542C28F
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 May 2019 11:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfE1JGH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 May 2019 05:06:07 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45795 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbfE1JDk (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 May 2019 05:03:40 -0400
Received: by mail-ed1-f68.google.com with SMTP id g57so15792120edc.12
        for <linux-fbdev@vger.kernel.org>; Tue, 28 May 2019 02:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jemw2QjWxU+UFHjYLKdEyQ9knTBj8Nqm3v5Mrc95+O8=;
        b=Q2Q/sGFS+3ztGuIG6HjyW4WqtF83a09htVuw4GKSsgH3cHm7dGKzhjvGuCPzzPDkgL
         E1/NRgZTaeTYcHOps+FhdcT1PbSFGvlgKFkIBRaH+zrG9UMsmLLURLcCTjDwxR0xLIN3
         KwwuXSGHz0AEiTSHK9LXqpPeWcu8jfLUGcaEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jemw2QjWxU+UFHjYLKdEyQ9knTBj8Nqm3v5Mrc95+O8=;
        b=mbtiGY8dRsoEo2eI09lN+HE0kYiogwYfzlqDGAkTWsWqgm0UEKwztaFnTo/HNFig6a
         PhkhmmYdzkXWNggarnMjyT46EDIjigJNYbGp/2QHOuZ8e8rVd8QKCr/uB4LUyJUuv8Yn
         QFnVVtF2gJqmVS9sWF0wwFFC91nw+Jm1mOuFgvFfThYZDbHT8AByACP0naf4J7RLZ6Gj
         3zLx0XogCS0+1UGwoqvHtYhq330tpy1a3ZXyj1KOVXA5s1VyiTtD+3+K29XBHPXnQ1ot
         3mkIBKhawlpYfbCnKk45JiHKMu6jnyUGPFNptRYiLuwNnhX0YPfYQ/DtiOwIfEtMPYJX
         ivTw==
X-Gm-Message-State: APjAAAVnhpBjSZErB1k9bD89vB3hoO05CsdYc8w6RdVHrrV1ixXGLXGb
        KmMtpQNCScm0B5UFlz5xUf5/BQ==
X-Google-Smtp-Source: APXvYqzRmMQx8hio/CkC+ykYBbXTDds6GiLnz4oTtSmCC0xHsSsFWfJG1JCAR/ZOcV6FU9c5NjgHVQ==
X-Received: by 2002:a50:ad2b:: with SMTP id y40mr126347451edc.237.1559034218893;
        Tue, 28 May 2019 02:03:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 02:03:38 -0700 (PDT)
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
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Hans de Goede <hdegoede@redhat.com>,
        Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH 19/33] fbdev: unify unlink_framebuffer paths
Date:   Tue, 28 May 2019 11:02:50 +0200
Message-Id: <20190528090304.9388-20-daniel.vetter@ffwll.ch>
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

For some reasons the pm_vt_switch_unregister call was missing from the
direct unregister_framebuffer path. Fix this.

v2: fbinfo->dev is used to decided whether unlink_framebuffer has been
called already. I botched that in v1. Make this all clearer by
inlining __unlink_framebuffer.

v3: Fix typoe in subject (Maarten).

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
Cc: Peter Rosin <peda@axentia.se>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>
---
 drivers/video/fbdev/core/fbmem.c | 47 ++++++++++++++------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index f3bcad30d3ba..bee45e9405b8 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1722,15 +1722,30 @@ static void unbind_console(struct fb_info *fb_info)
 	console_unlock();
 }
 
-static void __unlink_framebuffer(struct fb_info *fb_info);
-
-static void do_unregister_framebuffer(struct fb_info *fb_info)
+void unlink_framebuffer(struct fb_info *fb_info)
 {
-	unbind_console(fb_info);
+	int i;
+
+	i = fb_info->node;
+	if (WARN_ON(i < 0 || i >= FB_MAX || registered_fb[i] != fb_info))
+		return;
+
+	if (!fb_info->dev)
+		return;
+
+	device_destroy(fb_class, MKDEV(FB_MAJOR, i));
 
 	pm_vt_switch_unregister(fb_info->dev);
 
-	__unlink_framebuffer(fb_info);
+	unbind_console(fb_info);
+
+	fb_info->dev = NULL;
+}
+EXPORT_SYMBOL(unlink_framebuffer);
+
+static void do_unregister_framebuffer(struct fb_info *fb_info)
+{
+	unlink_framebuffer(fb_info);
 	if (fb_info->pixmap.addr &&
 	    (fb_info->pixmap.flags & FB_PIXMAP_DEFAULT))
 		kfree(fb_info->pixmap.addr);
@@ -1753,28 +1768,6 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
 	put_fb_info(fb_info);
 }
 
-static void __unlink_framebuffer(struct fb_info *fb_info)
-{
-	int i;
-
-	i = fb_info->node;
-	if (WARN_ON(i < 0 || i >= FB_MAX || registered_fb[i] != fb_info))
-		return;
-
-	if (fb_info->dev) {
-		device_destroy(fb_class, MKDEV(FB_MAJOR, i));
-		fb_info->dev = NULL;
-	}
-}
-
-void unlink_framebuffer(struct fb_info *fb_info)
-{
-	__unlink_framebuffer(fb_info);
-
-	unbind_console(fb_info);
-}
-EXPORT_SYMBOL(unlink_framebuffer);
-
 /**
  * remove_conflicting_framebuffers - remove firmware-configured framebuffers
  * @a: memory range, users of which are to be removed
-- 
2.20.1

