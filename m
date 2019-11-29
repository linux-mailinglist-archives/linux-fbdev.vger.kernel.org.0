Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 666E710D411
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 11:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfK2Kau (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 05:30:50 -0500
Received: from mga12.intel.com ([192.55.52.136]:61981 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbfK2Kat (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 05:30:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:30:49 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; 
   d="scan'208";a="207302366"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:30:47 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
        ville.syrjala@linux.intel.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 08/14] video: fbdev: make fbops member of struct fb_info a const pointer
Date:   Fri, 29 Nov 2019 12:29:38 +0200
Message-Id: <2dd4e6fb18637e3315bd57d422c6ae4a2080e844.1575022735.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Now that we no longer modify the fbops, or hold non-const pointers to
it, we can make it const. After this, we can start making the fbops
const all over the place.

Cc: linux-fbdev@vger.kernel.org
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/linux/fb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index a6ad528990de..6557fabdea62 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -472,7 +472,7 @@ struct fb_info {
 	struct fb_deferred_io *fbdefio;
 #endif
 
-	struct fb_ops *fbops;
+	const struct fb_ops *fbops;
 	struct device *device;		/* This is the parent */
 	struct device *dev;		/* This is this fb device */
 	int class_flag;                    /* private sysfs flags */
-- 
2.20.1

