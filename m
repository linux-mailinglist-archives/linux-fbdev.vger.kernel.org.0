Return-Path: <linux-fbdev+bounces-3085-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362E397EEA4
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Sep 2024 17:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB72228165D
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Sep 2024 15:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D8019DF97;
	Mon, 23 Sep 2024 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzy2FtBO"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E12919CC1E
	for <linux-fbdev@vger.kernel.org>; Mon, 23 Sep 2024 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727107081; cv=none; b=T4020yAyfNKU0MDmwh0kFSKn/xHJeHe8WusT8PInAC7vI8qZ2QSVdegYzzeKSSUzChWDQJ9odMFDfNdg1tSqmgI78NqXsEfC4I6UwU+yc8wxxlijHAbuR8L3xyzbQ7QH9D6fshMslt2N5muRP1bIAybsZqTbyN2nZZUTqmSH1FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727107081; c=relaxed/simple;
	bh=O3g3L/+sKtCko1xwkExrYw48dPoMuF/ASAUzm/24awE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TEkfsDvyDGIgl0r0Kfn8PZZuVCeHpsCl55OcXS6Bu38+WZ0FrHSMkjQlO2dS0bywiGENivjjCxFVK1P+ywf7lEOjiuAPgNfbQ9UdddJgl+RQbVheg1Y/ZB6UxrD3C1mU4BO2qhWjI03OwWXxh4RTJjcPOMB5Xmam72PaNAQE4fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzy2FtBO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727107080; x=1758643080;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O3g3L/+sKtCko1xwkExrYw48dPoMuF/ASAUzm/24awE=;
  b=dzy2FtBOTGgpNyrn73CD2zvhiI6kiaTIRrokBPLL1XA31pI6xJ+du3K4
   Qgi49Zbtk2748UiE3no/ruz7SE9Tn5/QFvd16BblyrFfCqyVYcoAL96jn
   9UnV+TGsqCmajc1XMzxOueuv7HHVK4W5K7mbxWO72lsjw9ZgF8VeWKG4i
   Q2OEYenlhWqg6IXwsZWMbKt0DLOAPLc0XmE/fc6kPluzS03cij7aaYEoX
   ARQBcGXKwEFOXdt+cWF43Xdzx27PvkX4i3swmByiZHbkAce/HbTOK+ULq
   s7dHObQrTRxcjWE1fO7uTCxD+O+yAmezFwWKjp1nzS4Lky17lkVeG0VHx
   w==;
X-CSE-ConnectionGUID: ylRZeBHhRgeSiKQ8KKlc6Q==
X-CSE-MsgGUID: n7Sax7N1Q3ua7cksDQRXfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="28957223"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="28957223"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 08:58:00 -0700
X-CSE-ConnectionGUID: VuxfrVICQsWiU7qbjIvxOQ==
X-CSE-MsgGUID: Pkx6592wQjKTeVxgUJYhdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="71250774"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 08:57:57 -0700
Received: by stinkbox (sSMTP sendmail emulation); Mon, 23 Sep 2024 18:57:56 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] fbcon: Add sysfs attributes before registering the device
Date: Mon, 23 Sep 2024 18:57:45 +0300
Message-ID: <20240923155749.30846-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently fbcon adds the attributes after registering the device,
which means the attributes may not be there by the time udev
gets the ADD uevent. Fix the race by switching over to
device_create_with_groups().

With this one can reliably turn off the power wasting cursor
blink with a udev rule such as:
ACTION=="add", SUBSYSTEM=="graphics", TEST=="cursor_blink", ATTR{cursor_blink}="0"

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/video/fbdev/core/fbcon.c | 73 +++++++++-----------------------
 1 file changed, 19 insertions(+), 54 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 8936fa79b9e0..bbe332572ca7 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -160,7 +160,6 @@ static int info_idx = -1;
 
 /* console rotation */
 static int initial_rotation = -1;
-static int fbcon_has_sysfs;
 static int margin_color;
 
 static const struct consw fb_con;
@@ -188,8 +187,6 @@ static void fbcon_redraw_move(struct vc_data *vc, struct fbcon_display *p,
 static void fbcon_modechanged(struct fb_info *info);
 static void fbcon_set_all_vcs(struct fb_info *info);
 
-static struct device *fbcon_device;
-
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
 static inline void fbcon_set_rotation(struct fb_info *info)
 {
@@ -3151,7 +3148,7 @@ static const struct consw fb_con = {
 	.con_debug_leave	= fbcon_debug_leave,
 };
 
-static ssize_t store_rotate(struct device *device,
+static ssize_t rotate_store(struct device *device,
 			    struct device_attribute *attr, const char *buf,
 			    size_t count)
 {
@@ -3173,7 +3170,7 @@ static ssize_t store_rotate(struct device *device,
 	return count;
 }
 
-static ssize_t store_rotate_all(struct device *device,
+static ssize_t rotate_all_store(struct device *device,
 				struct device_attribute *attr,const char *buf,
 				size_t count)
 {
@@ -3195,7 +3192,7 @@ static ssize_t store_rotate_all(struct device *device,
 	return count;
 }
 
-static ssize_t show_rotate(struct device *device,
+static ssize_t rotate_show(struct device *device,
 			   struct device_attribute *attr,char *buf)
 {
 	struct fb_info *info;
@@ -3214,13 +3211,13 @@ static ssize_t show_rotate(struct device *device,
 	return sysfs_emit(buf, "%d\n", rotate);
 }
 
-static ssize_t show_cursor_blink(struct device *device,
+static ssize_t cursor_blink_show(struct device *device,
 				 struct device_attribute *attr, char *buf)
 {
 	return sysfs_emit(buf, "%d\n", !fbcon_cursor_noblink);
 }
 
-static ssize_t store_cursor_blink(struct device *device,
+static ssize_t cursor_blink_store(struct device *device,
 				  struct device_attribute *attr,
 				  const char *buf, size_t count)
 {
@@ -3253,35 +3250,17 @@ static ssize_t store_cursor_blink(struct device *device,
 	return count;
 }
 
-static struct device_attribute device_attrs[] = {
-	__ATTR(rotate, S_IRUGO|S_IWUSR, show_rotate, store_rotate),
-	__ATTR(rotate_all, S_IWUSR, NULL, store_rotate_all),
-	__ATTR(cursor_blink, S_IRUGO|S_IWUSR, show_cursor_blink,
-	       store_cursor_blink),
-};
-
-static int fbcon_init_device(void)
-{
-	int i, error = 0;
-
-	fbcon_has_sysfs = 1;
-
-	for (i = 0; i < ARRAY_SIZE(device_attrs); i++) {
-		error = device_create_file(fbcon_device, &device_attrs[i]);
-
-		if (error)
-			break;
-	}
-
-	if (error) {
-		while (--i >= 0)
-			device_remove_file(fbcon_device, &device_attrs[i]);
-
-		fbcon_has_sysfs = 0;
-	}
+static DEVICE_ATTR_RW(rotate);
+static DEVICE_ATTR_WO(rotate_all);
+static DEVICE_ATTR_RW(cursor_blink);
 
-	return 0;
-}
+static struct attribute *device_attrs[] = {
+	&dev_attr_rotate.attr,
+	&dev_attr_rotate_all.attr,
+	&dev_attr_cursor_blink.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(device);
 
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
 static void fbcon_register_existing_fbs(struct work_struct *work)
@@ -3336,19 +3315,18 @@ static void fbcon_start(void)
 
 void __init fb_console_init(void)
 {
+	struct device *fbcon_device;
 	int i;
 
 	console_lock();
-	fbcon_device = device_create(fb_class, NULL, MKDEV(0, 0), NULL,
-				     "fbcon");
 
+	fbcon_device = device_create_with_groups(fb_class, NULL, MKDEV(0, 0),
+						 NULL, device_groups, "fbcon");
 	if (IS_ERR(fbcon_device)) {
 		printk(KERN_WARNING "Unable to create device "
 		       "for fbcon; errno = %ld\n",
 		       PTR_ERR(fbcon_device));
-		fbcon_device = NULL;
-	} else
-		fbcon_init_device();
+	}
 
 	for (i = 0; i < MAX_NR_CONSOLES; i++)
 		con2fb_map[i] = -1;
@@ -3359,18 +3337,6 @@ void __init fb_console_init(void)
 
 #ifdef MODULE
 
-static void __exit fbcon_deinit_device(void)
-{
-	int i;
-
-	if (fbcon_has_sysfs) {
-		for (i = 0; i < ARRAY_SIZE(device_attrs); i++)
-			device_remove_file(fbcon_device, &device_attrs[i]);
-
-		fbcon_has_sysfs = 0;
-	}
-}
-
 void __exit fb_console_exit(void)
 {
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
@@ -3383,7 +3349,6 @@ void __exit fb_console_exit(void)
 #endif
 
 	console_lock();
-	fbcon_deinit_device();
 	device_destroy(fb_class, MKDEV(0, 0));
 
 	do_unregister_con_driver(&fb_con);
-- 
2.44.2


