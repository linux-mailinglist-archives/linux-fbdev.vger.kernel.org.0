Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8770FD6497
	for <lists+linux-fbdev@lfdr.de>; Mon, 14 Oct 2019 16:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732349AbfJNOEW (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 14 Oct 2019 10:04:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:50716 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732370AbfJNOEW (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 14 Oct 2019 10:04:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 76F9AAFE8;
        Mon, 14 Oct 2019 14:04:20 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sean@poorly.run, b.zolnierkie@samsung.com, ajax@redhat.com,
        ville.syrjala@linux.intel.com, malat@debian.org, michel@daenzer.net
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 02/15] fbdev: Export FBPIXMAPSIZE
Date:   Mon, 14 Oct 2019 16:04:03 +0200
Message-Id: <20191014140416.28517-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014140416.28517-1-tzimmermann@suse.de>
References: <20191014140416.28517-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This constant is required by DRM's fbdev conversion helpers. Define it in
fbdev's public header file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbmem.c | 2 --
 include/linux/fb.h               | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index e828fcccce40..f02377e959dc 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -43,8 +43,6 @@
      *  Frame buffer device initialization and setup routines
      */
 
-#define FBPIXMAPSIZE	(1024 * 8)
-
 static DEFINE_MUTEX(registration_lock);
 
 struct fb_info *registered_fb[FB_MAX] __read_mostly;
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 372f1f6ae42e..e17d3e1d86ad 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -199,6 +199,8 @@ struct fb_pixmap {
 	void (*readio) (struct fb_info *info, void *dst, void __iomem *src, unsigned int size);
 };
 
+#define FBPIXMAPSIZE	(1024 * 8)
+
 #ifdef CONFIG_FB_DEFERRED_IO
 struct fb_deferred_io {
 	/* delay between mkwrite and deferred handler */
-- 
2.23.0

