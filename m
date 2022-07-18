Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6172577C75
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 Jul 2022 09:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbiGRHXc (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 18 Jul 2022 03:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbiGRHXb (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 18 Jul 2022 03:23:31 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A67418352
        for <linux-fbdev@vger.kernel.org>; Mon, 18 Jul 2022 00:23:28 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6D4F334CA2;
        Mon, 18 Jul 2022 07:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1658129006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6/Gkd62dEtttvTBo1D3gr3nm2MwjC/XrIPw1ugqJ9fg=;
        b=0Jh8nUNgC16C0sj2ii2yzoWtvCpw4yP5ijP28KEZ5q17L+6vDUxr5Uqj/oTcqHzXXO7Ym9
        /YFVHLu8J24Ll1eQctgPW2Uc7AtP3tgy3GPMw02ho50eJVX/Z9MdoK8/aH/Ny7+HTGDBLd
        6DO93Jx3NQUEfc2ndvbFaei88e/5mBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1658129006;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6/Gkd62dEtttvTBo1D3gr3nm2MwjC/XrIPw1ugqJ9fg=;
        b=bnI/PTw+oAmyB5ul90uzcEEnodL1A6ld151WGiRIljt/kNGYQ8Jfqp6BLduV1yo3REbLFH
        j5vbCjQAIjj/ZiDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42CFA13A37;
        Mon, 18 Jul 2022 07:23:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id aEtgD24K1WKjcAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 07:23:26 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch,
        sam@ravnborg.org, maxime@cerno.tech
Cc:     linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/11] fbdev: Acquire framebuffer apertures for firmware devices
Date:   Mon, 18 Jul 2022 09:23:21 +0200
Message-Id: <20220718072322.8927-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718072322.8927-1-tzimmermann@suse.de>
References: <20220718072322.8927-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

When registering a generic framebuffer, automatically acquire ownership
of the framebuffer's I/O range. The device will now be handled by the
aperture helpers. Fbdev-based conflict handling is no longer required.

v2:
	* use fb_ prefix instead of fbm_ (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fbmem.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 2237049327db..928a8afcc5a1 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -13,6 +13,7 @@
 
 #include <linux/module.h>
 
+#include <linux/aperture.h>
 #include <linux/compat.h>
 #include <linux/types.h>
 #include <linux/errno.h>
@@ -1739,6 +1740,32 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
 	put_fb_info(fb_info);
 }
 
+static int fb_aperture_acquire_for_platform_device(struct fb_info *fb_info)
+{
+	struct apertures_struct *ap = fb_info->apertures;
+	struct device *dev = fb_info->device;
+	struct platform_device *pdev;
+	unsigned int i;
+	int ret;
+
+	if (!ap)
+		return 0;
+
+	if (!dev_is_platform(dev))
+		return 0;
+
+	pdev = to_platform_device(dev);
+
+	for (ret = 0, i = 0; i < ap->count; ++i) {
+		ret = devm_aperture_acquire_for_platform_device(pdev, ap->ranges[i].base,
+								ap->ranges[i].size);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 /**
  * remove_conflicting_framebuffers - remove firmware-configured framebuffers
  * @a: memory range, users of which are to be removed
@@ -1789,6 +1816,12 @@ register_framebuffer(struct fb_info *fb_info)
 {
 	int ret;
 
+	if (fb_info->flags & FBINFO_MISC_FIRMWARE) {
+		ret = fb_aperture_acquire_for_platform_device(fb_info);
+		if (ret)
+			return ret;
+	}
+
 	mutex_lock(&registration_lock);
 	ret = do_register_framebuffer(fb_info);
 	mutex_unlock(&registration_lock);
-- 
2.36.1

