Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C952C10D42A
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 11:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfK2Kba (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 05:31:30 -0500
Received: from mga09.intel.com ([134.134.136.24]:45953 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbfK2Kb3 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 05:31:29 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:31:29 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; 
   d="scan'208";a="241001454"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:31:26 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
        ville.syrjala@linux.intel.com,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
        Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH v2 14/14] auxdisplay: constify fb ops
Date:   Fri, 29 Nov 2019 12:29:44 +0200
Message-Id: <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
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

Now that the fbops member of struct fb_info is const, we can start
making the ops const as well.

Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
Cc: Robin van der Gracht <robin@protonic.nl>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/auxdisplay/cfag12864bfb.c | 2 +-
 drivers/auxdisplay/ht16k33.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864bfb.c b/drivers/auxdisplay/cfag12864bfb.c
index 4074886b7bc8..2002291ab338 100644
--- a/drivers/auxdisplay/cfag12864bfb.c
+++ b/drivers/auxdisplay/cfag12864bfb.c
@@ -57,7 +57,7 @@ static int cfag12864bfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return vm_map_pages_zero(vma, &pages, 1);
 }
 
-static struct fb_ops cfag12864bfb_ops = {
+static const struct fb_ops cfag12864bfb_ops = {
 	.owner = THIS_MODULE,
 	.fb_read = fb_sys_read,
 	.fb_write = fb_sys_write,
diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index a2fcde582e2a..d951d54b26f5 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -228,7 +228,7 @@ static int ht16k33_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return vm_map_pages_zero(vma, &pages, 1);
 }
 
-static struct fb_ops ht16k33_fb_ops = {
+static const struct fb_ops ht16k33_fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_read = fb_sys_read,
 	.fb_write = fb_sys_write,
-- 
2.20.1

