Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76AE674A097
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Jul 2023 17:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbjGFPOl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 6 Jul 2023 11:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjGFPOi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 6 Jul 2023 11:14:38 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B17CFC
        for <linux-fbdev@vger.kernel.org>; Thu,  6 Jul 2023 08:14:37 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 380AE22860;
        Thu,  6 Jul 2023 15:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1688656476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=36EIUUn7Yddtfbgxzy5lfozydt7DISbFzo5nF9ZHH3o=;
        b=zLnWrW8ENRb2PwLcNw6WSNL3uc0e9ZSBTCtqq3yGV1GR/LKwHvcm3ACeHy1i/1x8e7YX60
        4LmqzmmFhDVk5AoHyoc+i5fHW3ZGmwim0N0zXqTZK7BUy9ailLcqBKa2+jpcXD9dfjtMZQ
        YlZft7LdxzmF3VJp4/qqpDZ8O+XDeV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1688656476;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=36EIUUn7Yddtfbgxzy5lfozydt7DISbFzo5nF9ZHH3o=;
        b=tXPFfkJQBzZ9NTBfXtMfi9QfaovS4qJv1KDKvtrBlLDQhsqZDfS4Sqvh+LGk9Nk1YiLHMP
        3o8OF9SLiCVz50BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 183E0138FC;
        Thu,  6 Jul 2023 15:14:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wMH7BFzapmRvDgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 15:14:36 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, deller@gmx.de
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/10] fbdev/xen-fbfront: Generate deferred I/O ops
Date:   Thu,  6 Jul 2023 17:08:53 +0200
Message-ID: <20230706151432.20674-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706151432.20674-1-tzimmermann@suse.de>
References: <20230706151432.20674-1-tzimmermann@suse.de>
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

Use the existing generator macros to create deferred-I/O helpers
for xen-fbfront and set them in the fb_ops structure. Functions
for damage handling on memory ranges and areas are provided by
the driver.

Xen-fbfront's implementation of fb_write writes to system memory,
so the generated code can use the respective helper internally.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/xen-fbfront.c | 61 ++++++++++---------------------
 1 file changed, 20 insertions(+), 41 deletions(-)

diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 9b2a786621a6..6664dc7a5a41 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -240,41 +240,6 @@ static int xenfb_setcolreg(unsigned regno, unsigned red, unsigned green,
 	return 0;
 }
 
-static void xenfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
-{
-	struct xenfb_info *info = p->par;
-
-	sys_fillrect(p, rect);
-	xenfb_refresh(info, rect->dx, rect->dy, rect->width, rect->height);
-}
-
-static void xenfb_imageblit(struct fb_info *p, const struct fb_image *image)
-{
-	struct xenfb_info *info = p->par;
-
-	sys_imageblit(p, image);
-	xenfb_refresh(info, image->dx, image->dy, image->width, image->height);
-}
-
-static void xenfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
-{
-	struct xenfb_info *info = p->par;
-
-	sys_copyarea(p, area);
-	xenfb_refresh(info, area->dx, area->dy, area->width, area->height);
-}
-
-static ssize_t xenfb_write(struct fb_info *p, const char __user *buf,
-			size_t count, loff_t *ppos)
-{
-	struct xenfb_info *info = p->par;
-	ssize_t res;
-
-	res = fb_sys_write(p, buf, count, ppos);
-	xenfb_refresh(info, 0, 0, info->page->width, info->page->height);
-	return res;
-}
-
 static int
 xenfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
@@ -326,17 +291,31 @@ static int xenfb_set_par(struct fb_info *info)
 	return 0;
 }
 
+static void xenfb_defio_damage_range(struct fb_info *info, off_t off, size_t len)
+{
+	struct xenfb_info *xenfb_info = info->par;
+
+	xenfb_refresh(xenfb_info, 0, 0, xenfb_info->page->width, xenfb_info->page->height);
+}
+
+static void xenfb_defio_damage_area(struct fb_info *info, u32 x, u32 y,
+				    u32 width, u32 height)
+{
+	struct xenfb_info *xenfb_info = info->par;
+
+	xenfb_refresh(xenfb_info, x, y, width, height);
+}
+
+FB_GEN_DEFAULT_DEFERRED_SYS_OPS(xenfb,
+				xenfb_defio_damage_range,
+				xenfb_defio_damage_area)
+
 static const struct fb_ops xenfb_fb_ops = {
 	.owner		= THIS_MODULE,
-	.fb_read	= fb_sys_read,
-	.fb_write	= xenfb_write,
+	FB_DEFAULT_DEFERRED_OPS(xenfb),
 	.fb_setcolreg	= xenfb_setcolreg,
-	.fb_fillrect	= xenfb_fillrect,
-	.fb_copyarea	= xenfb_copyarea,
-	.fb_imageblit	= xenfb_imageblit,
 	.fb_check_var	= xenfb_check_var,
 	.fb_set_par     = xenfb_set_par,
-	.fb_mmap	= fb_deferred_io_mmap,
 };
 
 static irqreturn_t xenfb_event_handler(int rq, void *dev_id)
-- 
2.41.0

