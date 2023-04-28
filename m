Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAAA86F17CB
	for <lists+linux-fbdev@lfdr.de>; Fri, 28 Apr 2023 14:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbjD1MZO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 28 Apr 2023 08:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbjD1MZD (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 28 Apr 2023 08:25:03 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4FE46B8
        for <linux-fbdev@vger.kernel.org>; Fri, 28 Apr 2023 05:25:01 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3161F2008F;
        Fri, 28 Apr 2023 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1682684700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jZcBrX85X9D4JYEqK4P+onn+XI0Hc3Cl8Gd19NFQU5o=;
        b=CrEA+kxiVCmmkPWYWXwsnqzBiITp4bZos97PqEEUj2kKuyfHZquvsC/26qMbHy2QMzjJPa
        p2ONuyzpuETvL13NaunetRnRcGLyo4TQ3lbYKecV8nMZQ27lbr2Xpp3oqzIcUkPZW7uQ3f
        /gRqkJABwJ/9GHdzwml+P2Al9MYzRwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1682684700;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jZcBrX85X9D4JYEqK4P+onn+XI0Hc3Cl8Gd19NFQU5o=;
        b=IHlfY4+MoF5u5stpi88bjDgt+BQRrimWnnUbCL63Lt/jM56R4cpXA0tAjR4KSpY4orlaGt
        BtJfZ/scnHmUi1Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E576D139C3;
        Fri, 28 Apr 2023 12:24:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 2L4xNxu7S2RgeAAAMHmgww
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
Subject: [PATCH v2 16/19] fbdev: Don't re-validate info->state in fb_ops implementations
Date:   Fri, 28 Apr 2023 14:24:49 +0200
Message-Id: <20230428122452.4856-17-tzimmermann@suse.de>
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

The file-op entry points fb_read() and fb_write() verify that
info->state has been set to FBINFO_STATE_RUNNING. Remove the same
test from the implementations of struct fb_ops.{fb_read,fb_write}.

v2:
	* also remove test from ivtvfb, braodsheetfb, hecubafb and
	  metronomefb (Geert)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/media/pci/ivtv/ivtvfb.c        | 3 ---
 drivers/video/fbdev/broadsheetfb.c     | 3 ---
 drivers/video/fbdev/core/fb_sys_fops.c | 6 ------
 drivers/video/fbdev/hecubafb.c         | 3 ---
 drivers/video/fbdev/metronomefb.c      | 3 ---
 drivers/video/fbdev/sm712fb.c          | 6 ------
 6 files changed, 24 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvfb.c
index 00ac94d4ab19..22123a25daea 100644
--- a/drivers/media/pci/ivtv/ivtvfb.c
+++ b/drivers/media/pci/ivtv/ivtvfb.c
@@ -378,9 +378,6 @@ static ssize_t ivtvfb_write(struct fb_info *info, const char __user *buf,
 	unsigned long dma_size;
 	u16 lead = 0, tail = 0;
 
-	if (info->state != FBINFO_STATE_RUNNING)
-		return -EPERM;
-
 	total_size = info->screen_size;
 
 	if (total_size == 0)
diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index 65dc86b7081e..691de5df581b 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -1013,9 +1013,6 @@ static ssize_t broadsheetfb_write(struct fb_info *info, const char __user *buf,
 	int err = 0;
 	unsigned long total_size;
 
-	if (info->state != FBINFO_STATE_RUNNING)
-		return -EPERM;
-
 	total_size = info->fix.smem_len;
 
 	if (p > total_size)
diff --git a/drivers/video/fbdev/core/fb_sys_fops.c b/drivers/video/fbdev/core/fb_sys_fops.c
index 6589123f4127..7dee5d3c7fb1 100644
--- a/drivers/video/fbdev/core/fb_sys_fops.c
+++ b/drivers/video/fbdev/core/fb_sys_fops.c
@@ -22,9 +22,6 @@ ssize_t fb_sys_read(struct fb_info *info, char __user *buf, size_t count,
 	unsigned long total_size, c;
 	ssize_t ret;
 
-	if (info->state != FBINFO_STATE_RUNNING)
-		return -EPERM;
-
 	total_size = info->screen_size;
 
 	if (total_size == 0)
@@ -64,9 +61,6 @@ ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 	unsigned long total_size, c;
 	size_t ret;
 
-	if (info->state != FBINFO_STATE_RUNNING)
-		return -EPERM;
-
 	total_size = info->screen_size;
 
 	if (total_size == 0)
diff --git a/drivers/video/fbdev/hecubafb.c b/drivers/video/fbdev/hecubafb.c
index ddfa2853cc41..a2996d39f918 100644
--- a/drivers/video/fbdev/hecubafb.c
+++ b/drivers/video/fbdev/hecubafb.c
@@ -163,9 +163,6 @@ static ssize_t hecubafb_write(struct fb_info *info, const char __user *buf,
 	int err = 0;
 	unsigned long total_size;
 
-	if (info->state != FBINFO_STATE_RUNNING)
-		return -EPERM;
-
 	total_size = info->fix.smem_len;
 
 	if (p > total_size)
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index afa9b41f5a87..2bb068cadac6 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -523,9 +523,6 @@ static ssize_t metronomefb_write(struct fb_info *info, const char __user *buf,
 	int err = 0;
 	unsigned long total_size;
 
-	if (info->state != FBINFO_STATE_RUNNING)
-		return -EPERM;
-
 	total_size = info->fix.smem_len;
 
 	if (p > total_size)
diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index b528776c7612..6f852cd756c5 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -1031,9 +1031,6 @@ static ssize_t smtcfb_read(struct fb_info *info, char __user *buf,
 	if (!info || !info->screen_base)
 		return -ENODEV;
 
-	if (info->state != FBINFO_STATE_RUNNING)
-		return -EPERM;
-
 	total_size = info->screen_size;
 
 	if (total_size == 0)
@@ -1097,9 +1094,6 @@ static ssize_t smtcfb_write(struct fb_info *info, const char __user *buf,
 	if (!info || !info->screen_base)
 		return -ENODEV;
 
-	if (info->state != FBINFO_STATE_RUNNING)
-		return -EPERM;
-
 	total_size = info->screen_size;
 
 	if (total_size == 0)
-- 
2.40.0

