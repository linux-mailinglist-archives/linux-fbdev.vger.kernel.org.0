Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 566D810B364
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Nov 2019 17:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfK0QdZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Nov 2019 11:33:25 -0500
Received: from mga02.intel.com ([134.134.136.20]:41410 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfK0QdY (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Nov 2019 11:33:24 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:33:23 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; 
   d="scan'208";a="206818597"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:33:20 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     ville.syrjala@linux.intel.com, intel-gfx@lists.freedesktop.org,
        jani.nikula@intel.com
Subject: [PATCH 08/13] video: fbdev: make fbops member of struct fb_info a const pointer
Date:   Wed, 27 Nov 2019 18:32:04 +0200
Message-Id: <b0ff7235e8c941d6b9fcc28d5e49ceeb92d56828.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Now that we no longer modify the fbops, or hold non-const pointers to
it, we can make it const. With that, also deferred_io_private needs to
be const. After this, we can start making the fbops const all over the
place.

Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/linux/fb.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 65f2abd47745..efc5376c243a 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -470,10 +470,10 @@ struct fb_info {
 #ifdef CONFIG_FB_DEFERRED_IO
 	struct delayed_work deferred_work;
 	struct fb_deferred_io *fbdefio;
-	void *deferred_io_private;
+	const void *deferred_io_private;
 #endif
 
-	struct fb_ops *fbops;
+	const struct fb_ops *fbops;
 	struct device *device;		/* This is the parent */
 	struct device *dev;		/* This is this fb device */
 	int class_flag;                    /* private sysfs flags */
-- 
2.20.1

