Return-Path: <linux-fbdev+bounces-83-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE57EC09F
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Nov 2023 11:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16F29281078
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Nov 2023 10:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3385E1428F;
	Wed, 15 Nov 2023 10:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wqc4nYvx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="71shkTLs"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F81F9C8
	for <linux-fbdev@vger.kernel.org>; Wed, 15 Nov 2023 10:30:09 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05191127
	for <linux-fbdev@vger.kernel.org>; Wed, 15 Nov 2023 02:30:04 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CAC6422914;
	Wed, 15 Nov 2023 10:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700044201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpTAIVT1mFZjZGtABwbdXQeIticTTk7mDsjbRkpohAI=;
	b=wqc4nYvxzXg9ri0MMOkaJsi5Wjn9BpoPjiOTaImd3McyNNt90p9xqUjrRp7Vz+QjL1TkdQ
	PdxRShhUfiR7yTfj3SEZN2z/IbLvk5vO/fbd/zRLfo1Rh4W4riSG2BiW5d4lksza4H86e2
	luTfK/6B6Svl/Pd+QgS8dYa3ibB+OBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700044201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpTAIVT1mFZjZGtABwbdXQeIticTTk7mDsjbRkpohAI=;
	b=71shkTLshaw8fuvA3H1woJ1UXgEfZP61e8oXJ95alBXi4fxMiQoyJB6fTqpZ4IE0fAm0fV
	sIi6Gdri+gqg8OCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8A4A13592;
	Wed, 15 Nov 2023 10:30:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wBk/KKmdVGV+UAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 15 Nov 2023 10:30:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 32/32] fbdev: Remove default file-I/O implementations
Date: Wed, 15 Nov 2023 11:19:37 +0100
Message-ID: <20231115102954.7102-33-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115102954.7102-1-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.10
X-Spamd-Result: default: False [-6.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 R_MISSING_CHARSET(2.50)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 R_RATELIMIT(0.00)[to_ip_from(RLhj387a44qpajt9e5qpoeukef)];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]

Drop the default implementations for file read, write and mmap
operations. Each fbdev driver must now provide an implementation
and select any necessary helpers. If no implementation has been
set, fbdev returns an errno code to user space. The code is the
same as if the operation had not been set in the file_operations
struct.

This change makes the fbdev helpers for I/O memory optional. Most
systems only use system-memory framebuffers via DRM's fbdev emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/Kconfig     |  1 -
 drivers/video/fbdev/core/fb_chrdev.c | 37 +++++++++-------------------
 2 files changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index faab5d50cac3c..21053bf00dc58 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -4,7 +4,6 @@
 #
 
 config FB_CORE
-	select FB_IOMEM_FOPS
 	select VIDEO_CMDLINE
 	tristate
 
diff --git a/drivers/video/fbdev/core/fb_chrdev.c b/drivers/video/fbdev/core/fb_chrdev.c
index 089441c9d810f..118ab7884285a 100644
--- a/drivers/video/fbdev/core/fb_chrdev.c
+++ b/drivers/video/fbdev/core/fb_chrdev.c
@@ -34,13 +34,13 @@ static ssize_t fb_read(struct file *file, char __user *buf, size_t count, loff_t
 	if (!info)
 		return -ENODEV;
 
+	if (!info->fbops->fb_read)
+		return -EINVAL;
+
 	if (info->state != FBINFO_STATE_RUNNING)
 		return -EPERM;
 
-	if (info->fbops->fb_read)
-		return info->fbops->fb_read(info, buf, count, ppos);
-
-	return fb_io_read(info, buf, count, ppos);
+	return info->fbops->fb_read(info, buf, count, ppos);
 }
 
 static ssize_t fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
@@ -50,13 +50,13 @@ static ssize_t fb_write(struct file *file, const char __user *buf, size_t count,
 	if (!info)
 		return -ENODEV;
 
+	if (!info->fbops->fb_write)
+		return -EINVAL;
+
 	if (info->state != FBINFO_STATE_RUNNING)
 		return -EPERM;
 
-	if (info->fbops->fb_write)
-		return info->fbops->fb_write(info, buf, count, ppos);
-
-	return fb_io_write(info, buf, count, ppos);
+	return info->fbops->fb_write(info, buf, count, ppos);
 }
 
 static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
@@ -319,24 +319,11 @@ static int fb_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!info)
 		return -ENODEV;
 
-	mutex_lock(&info->mm_lock);
-
-	if (info->fbops->fb_mmap) {
-
-		res = info->fbops->fb_mmap(info, vma);
-#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
-	} else if (info->fbdefio) {
-		/*
-		 * FB deferred I/O wants you to handle mmap in your drivers. At a
-		 * minimum, point struct fb_ops.fb_mmap to fb_deferred_io_mmap().
-		 */
-		dev_warn_once(info->dev, "fbdev mmap not set up for deferred I/O.\n");
-		res = -ENODEV;
-#endif
-	} else {
-		res = fb_io_mmap(info, vma);
-	}
+	if (!info->fbops->fb_mmap)
+		return -ENODEV;
 
+	mutex_lock(&info->mm_lock);
+	res = info->fbops->fb_mmap(info, vma);
 	mutex_unlock(&info->mm_lock);
 
 	return res;
-- 
2.42.0


