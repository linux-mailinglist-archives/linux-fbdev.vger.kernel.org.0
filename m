Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F374610B35C
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Nov 2019 17:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfK0QdP (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Nov 2019 11:33:15 -0500
Received: from mga02.intel.com ([134.134.136.20]:41377 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfK0QdP (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Nov 2019 11:33:15 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:33:11 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; 
   d="scan'208";a="221030718"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:33:09 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     ville.syrjala@linux.intel.com, intel-gfx@lists.freedesktop.org,
        jani.nikula@intel.com
Subject: [PATCH 06/13] video: fbmem: use const pointer for fb_ops
Date:   Wed, 27 Nov 2019 18:32:02 +0200
Message-Id: <7550581b21a54500021d9a1b2b9b91ba075d19d1.1574871797.git.jani.nikula@intel.com>
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

Use const for fb_ops to let us make the info->fbops pointer const in the
future.

Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/video/fbdev/core/fbmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 86b06a599f96..003f494ccaba 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1079,7 +1079,7 @@ EXPORT_SYMBOL(fb_blank);
 static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 			unsigned long arg)
 {
-	struct fb_ops *fb;
+	const struct fb_ops *fb;
 	struct fb_var_screeninfo var;
 	struct fb_fix_screeninfo fix;
 	struct fb_cmap cmap_from;
@@ -1292,7 +1292,7 @@ static long fb_compat_ioctl(struct file *file, unsigned int cmd,
 			    unsigned long arg)
 {
 	struct fb_info *info = file_fb_info(file);
-	struct fb_ops *fb;
+	const struct fb_ops *fb;
 	long ret = -ENOIOCTLCMD;
 
 	if (!info)
@@ -1332,7 +1332,7 @@ static int
 fb_mmap(struct file *file, struct vm_area_struct * vma)
 {
 	struct fb_info *info = file_fb_info(file);
-	struct fb_ops *fb;
+	const struct fb_ops *fb;
 	unsigned long mmio_pgoff;
 	unsigned long start;
 	u32 len;
-- 
2.20.1

