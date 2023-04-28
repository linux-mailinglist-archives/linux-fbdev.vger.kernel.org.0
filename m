Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABD86F17CC
	for <lists+linux-fbdev@lfdr.de>; Fri, 28 Apr 2023 14:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345820AbjD1MZO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 28 Apr 2023 08:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbjD1MZC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 28 Apr 2023 08:25:02 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55FC46A0
        for <linux-fbdev@vger.kernel.org>; Fri, 28 Apr 2023 05:25:00 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 9548F2008E;
        Fri, 28 Apr 2023 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1682684699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fUpeEc+p8pjbvFmXDSuyyAeCukrDF8AJNFWwmyCsI/8=;
        b=SFqVcQ11riEh2b0jyXAWrXGO+H2uKbcPVaMeFz1IvqFsmgxt4ayQfVZrpEvRBSOp5Q3zHO
        Ma7kJj+dHjyq551UcX1SkDmfY6agC1TY8A0Yr6EcGnFIpQ2E9JcbcKxZOcXq+pZmk6TZKQ
        Jtu0mYQ2bU3AsMyisXtWmMy008Ww8uI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1682684699;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fUpeEc+p8pjbvFmXDSuyyAeCukrDF8AJNFWwmyCsI/8=;
        b=GjpbXoY9/krwUPK0yAla+PdzgFCSjVod2x0lTJ3WwAJbikAExxXb1Y1FxkqoF6B1m7wAn7
        Q7ZP3rYPuxrvkvAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D2781390E;
        Fri, 28 Apr 2023 12:24:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id mPKfERu7S2RgeAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:24:59 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com,
        deller@gmx.de, geert@linux-m68k.org, sudipm.mukherjee@gmail.com,
        teddy.wang@siliconmotion.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 14/19] fbdev: Return number of bytes read or written
Date:   Fri, 28 Apr 2023 14:24:47 +0200
Message-Id: <20230428122452.4856-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428122452.4856-1-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Always return the number of bytes read or written within the
framebuffer. Only return an errno code if framebuffer memory
was not touched. This is the semantics required by POSIX and
makes fb_read() and fb_write() compatible with IGT tests. [1]

This bug has been fixed for fb_write() long ago by
commit 6a2a88668e90 ("[PATCH] fbdev: Fix return error of
fb_write"). The code in fb_read() and the corresponding fb_sys_()
helpers was forgotten.

It can happen that copy_{from, to}_user() only partially copies
the given buffer. Take this into account when calculating the
number of bytes.

v2:
	* consider return value from copy_{from,to}_user() (Geert)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Helge Deller <deller@gmx.de>
Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/fbdev.c # 1
---
 drivers/video/fbdev/core/fb_sys_fops.c | 24 ++++++++++++++----------
 drivers/video/fbdev/core/fbmem.c       | 15 ++++++++++-----
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_sys_fops.c b/drivers/video/fbdev/core/fb_sys_fops.c
index ff275d7f3eaf..cefb77b9546d 100644
--- a/drivers/video/fbdev/core/fb_sys_fops.c
+++ b/drivers/video/fbdev/core/fb_sys_fops.c
@@ -19,7 +19,8 @@ ssize_t fb_sys_read(struct fb_info *info, char __user *buf, size_t count,
 	unsigned long p = *ppos;
 	void *src;
 	int err = 0;
-	unsigned long total_size;
+	unsigned long total_size, c;
+	ssize_t ret;
 
 	if (info->state != FBINFO_STATE_RUNNING)
 		return -EPERM;
@@ -43,13 +44,14 @@ ssize_t fb_sys_read(struct fb_info *info, char __user *buf, size_t count,
 	if (info->fbops->fb_sync)
 		info->fbops->fb_sync(info);
 
-	if (copy_to_user(buf, src, count))
+	c = copy_to_user(buf, src, count);
+	if (c)
 		err = -EFAULT;
+	ret = count - c;
 
-	if  (!err)
-		*ppos += count;
+	*ppos += ret;
 
-	return (err) ? err : count;
+	return ret ? ret : err;
 }
 EXPORT_SYMBOL_GPL(fb_sys_read);
 
@@ -59,7 +61,8 @@ ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 	unsigned long p = *ppos;
 	void *dst;
 	int err = 0;
-	unsigned long total_size;
+	unsigned long total_size, c;
+	size_t ret;
 
 	if (info->state != FBINFO_STATE_RUNNING)
 		return -EPERM;
@@ -89,13 +92,14 @@ ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 	if (info->fbops->fb_sync)
 		info->fbops->fb_sync(info);
 
-	if (copy_from_user(dst, buf, count))
+	c = copy_from_user(dst, buf, count);
+	if (c)
 		err = -EFAULT;
+	ret = count - c;
 
-	if  (!err)
-		*ppos += count;
+	*ppos += ret;
 
-	return (err) ? err : count;
+	return ret ? ret : err;
 }
 EXPORT_SYMBOL_GPL(fb_sys_write);
 
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 3fd95a79e4c3..b0881348c27f 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -766,7 +766,7 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 	u8 *buffer, *dst;
 	u8 __iomem *src;
 	int c, cnt = 0, err = 0;
-	unsigned long total_size;
+	unsigned long total_size, trailing;
 
 	if (!info || ! info->screen_base)
 		return -ENODEV;
@@ -808,10 +808,13 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 		dst += c;
 		src += c;
 
-		if (copy_to_user(buf, buffer, c)) {
+		trailing = copy_to_user(buf, buffer, c);
+		if (trailing == c) {
 			err = -EFAULT;
 			break;
 		}
+		c -= trailing;
+
 		*ppos += c;
 		buf += c;
 		cnt += c;
@@ -820,7 +823,7 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 
 	kfree(buffer);
 
-	return (err) ? err : cnt;
+	return cnt ? cnt : err;
 }
 
 static ssize_t
@@ -831,7 +834,7 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 	u8 *buffer, *src;
 	u8 __iomem *dst;
 	int c, cnt = 0, err = 0;
-	unsigned long total_size;
+	unsigned long total_size, trailing;
 
 	if (!info || !info->screen_base)
 		return -ENODEV;
@@ -876,10 +879,12 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 		c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
 		src = buffer;
 
-		if (copy_from_user(src, buf, c)) {
+		trailing = copy_from_user(src, buf, c);
+		if (trailing == c) {
 			err = -EFAULT;
 			break;
 		}
+		c -= trailing;
 
 		fb_memcpy_tofb(dst, src, c);
 		dst += c;
-- 
2.40.0

