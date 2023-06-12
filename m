Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8891672C805
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Jun 2023 16:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238264AbjFLOS5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 12 Jun 2023 10:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237607AbjFLOOe (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 12 Jun 2023 10:14:34 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904531982;
        Mon, 12 Jun 2023 07:14:08 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 4CF6620497;
        Mon, 12 Jun 2023 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686579247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PjQ0WZPdIw3WWFfN2RUGJfJXUodE1BMieiwQSz+bnM8=;
        b=ZhGpsGoWoLoCpa4r4d8gggQNXVhJDl8Re5aT378rH/VK4zWs1t5CW+A2r/YhYocOjK++Nd
        WbFNyL39hQcoG5PXQBL8VZFjeJKG3x4Xlvr+xzfH+VUYA0jhWPcMSuKM6CyWfjivCdAnVR
        1m2FTnPlQ6SrhIzllMmLmIrAbEX0oqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686579247;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PjQ0WZPdIw3WWFfN2RUGJfJXUodE1BMieiwQSz+bnM8=;
        b=HVmDNQrInPhLa32Htc4a1d+dAmFldOzp7rhJSpYICAdfkm+6NDb5/R6b36HVkXRWnz7L2s
        Dq80YBAIEgKT8ECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEA521357F;
        Mon, 12 Jun 2023 14:14:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id kJJYOS4oh2RwGQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 14:14:06 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 35/38] fbdev/core: Move procfs code to separate file
Date:   Mon, 12 Jun 2023 16:08:13 +0200
Message-ID: <20230612141352.29939-36-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230612141352.29939-1-tzimmermann@suse.de>
References: <20230612141352.29939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Move fbdev's procfs code into a separate file and contain it in
init and cleanup helpers. For the cleanup, replace remove_proc_entry()
with proc_remove(). It is equivalent in functionality, but looks
more like an inverse of proc_create_seq().

v2:
	* document proc_remove() usage (Sam)
	* revert unrelated removal of for_each_registered_fb()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/Makefile      |  1 +
 drivers/video/fbdev/core/fb_internal.h | 12 ++++-
 drivers/video/fbdev/core/fb_procfs.c   | 62 ++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c       | 48 +++-----------------
 4 files changed, 80 insertions(+), 43 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_procfs.c

diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index eee3295bc2252..665320160f70a 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
 obj-$(CONFIG_FB)                  += fb.o
 fb-y                              := fb_backlight.o \
                                      fb_info.o \
+                                     fb_procfs.o \
                                      fbmem.o fbmon.o fbcmap.o fbsysfs.o \
                                      modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
 fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
index 0b9640ae7a3d2..51f7c9f04e45a 100644
--- a/drivers/video/fbdev/core/fb_internal.h
+++ b/drivers/video/fbdev/core/fb_internal.h
@@ -3,7 +3,17 @@
 #ifndef _FB_INTERNAL_H
 #define _FB_INTERNAL_H
 
-struct fb_info;
+#include <linux/fb.h>
+#include <linux/mutex.h>
+
+/* fbmem.c */
+extern struct mutex registration_lock;
+extern struct fb_info *registered_fb[FB_MAX];
+extern int num_registered_fb;
+
+/* fb_procfs.c */
+int fb_init_procfs(void);
+void fb_cleanup_procfs(void);
 
 /* fbsysfs.c */
 int fb_device_create(struct fb_info *fb_info);
diff --git a/drivers/video/fbdev/core/fb_procfs.c b/drivers/video/fbdev/core/fb_procfs.c
new file mode 100644
index 0000000000000..59641142f8aad
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_procfs.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/proc_fs.h>
+
+#include "fb_internal.h"
+
+static struct proc_dir_entry *fb_proc_dir_entry;
+
+static void *fb_seq_start(struct seq_file *m, loff_t *pos)
+{
+	mutex_lock(&registration_lock);
+
+	return (*pos < FB_MAX) ? pos : NULL;
+}
+
+static void fb_seq_stop(struct seq_file *m, void *v)
+{
+	mutex_unlock(&registration_lock);
+}
+
+static void *fb_seq_next(struct seq_file *m, void *v, loff_t *pos)
+{
+	(*pos)++;
+
+	return (*pos < FB_MAX) ? pos : NULL;
+}
+
+static int fb_seq_show(struct seq_file *m, void *v)
+{
+	int i = *(loff_t *)v;
+	struct fb_info *fi = registered_fb[i];
+
+	if (fi)
+		seq_printf(m, "%d %s\n", fi->node, fi->fix.id);
+
+	return 0;
+}
+
+static const struct seq_operations __maybe_unused fb_proc_seq_ops = {
+	.start	= fb_seq_start,
+	.stop	= fb_seq_stop,
+	.next	= fb_seq_next,
+	.show	= fb_seq_show,
+};
+
+int fb_init_procfs(void)
+{
+	struct proc_dir_entry *proc;
+
+	proc = proc_create_seq("fb", 0, NULL, &fb_proc_seq_ops);
+	if (!proc)
+		return -ENOMEM;
+
+	fb_proc_dir_entry = proc;
+
+	return 0;
+}
+
+void fb_cleanup_procfs(void)
+{
+	proc_remove(fb_proc_dir_entry);
+}
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 66532774d351e..536209901e32a 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -24,9 +24,7 @@
 #include <linux/vt.h>
 #include <linux/init.h>
 #include <linux/linux_logo.h>
-#include <linux/proc_fs.h>
 #include <linux/platform_device.h>
-#include <linux/seq_file.h>
 #include <linux/console.h>
 #include <linux/kmod.h>
 #include <linux/err.h>
@@ -48,8 +46,7 @@
 
 #define FBPIXMAPSIZE	(1024 * 8)
 
-static DEFINE_MUTEX(registration_lock);
-
+DEFINE_MUTEX(registration_lock);
 struct fb_info *registered_fb[FB_MAX] __read_mostly;
 int num_registered_fb __read_mostly;
 #define for_each_registered_fb(i)		\
@@ -705,40 +702,6 @@ int fb_show_logo(struct fb_info *info, int rotate) { return 0; }
 EXPORT_SYMBOL(fb_prepare_logo);
 EXPORT_SYMBOL(fb_show_logo);
 
-static void *fb_seq_start(struct seq_file *m, loff_t *pos)
-{
-	mutex_lock(&registration_lock);
-	return (*pos < FB_MAX) ? pos : NULL;
-}
-
-static void *fb_seq_next(struct seq_file *m, void *v, loff_t *pos)
-{
-	(*pos)++;
-	return (*pos < FB_MAX) ? pos : NULL;
-}
-
-static void fb_seq_stop(struct seq_file *m, void *v)
-{
-	mutex_unlock(&registration_lock);
-}
-
-static int fb_seq_show(struct seq_file *m, void *v)
-{
-	int i = *(loff_t *)v;
-	struct fb_info *fi = registered_fb[i];
-
-	if (fi)
-		seq_printf(m, "%d %s\n", fi->node, fi->fix.id);
-	return 0;
-}
-
-static const struct seq_operations __maybe_unused proc_fb_seq_ops = {
-	.start	= fb_seq_start,
-	.next	= fb_seq_next,
-	.stop	= fb_seq_stop,
-	.show	= fb_seq_show,
-};
-
 /*
  * We hold a reference to the fb_info in file->private_data,
  * but if the current registered fb has changed, we don't
@@ -1624,8 +1587,9 @@ fbmem_init(void)
 {
 	int ret;
 
-	if (!proc_create_seq("fb", 0, NULL, &proc_fb_seq_ops))
-		return -ENOMEM;
+	ret = fb_init_procfs();
+	if (ret)
+		return ret;
 
 	ret = register_chrdev(FB_MAJOR, "fb", &fb_fops);
 	if (ret) {
@@ -1648,7 +1612,7 @@ fbmem_init(void)
 err_class:
 	unregister_chrdev(FB_MAJOR, "fb");
 err_chrdev:
-	remove_proc_entry("fb", NULL);
+	fb_cleanup_procfs();
 	return ret;
 }
 
@@ -1659,7 +1623,7 @@ fbmem_exit(void)
 {
 	fb_console_exit();
 
-	remove_proc_entry("fb", NULL);
+	fb_cleanup_procfs();
 	class_destroy(fb_class);
 	unregister_chrdev(FB_MAJOR, "fb");
 }
-- 
2.41.0

