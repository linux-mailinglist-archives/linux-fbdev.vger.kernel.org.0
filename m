Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF6E51BE0F
	for <lists+linux-fbdev@lfdr.de>; Thu,  5 May 2022 13:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355141AbiEELfd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 5 May 2022 07:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357354AbiEELf1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 5 May 2022 07:35:27 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 99CFF25C70
        for <linux-fbdev@vger.kernel.org>; Thu,  5 May 2022 04:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651750306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iaNxVGQEFp6Vh3rpWtfph/7pGGoZXolh5bDdGY4BamI=;
        b=IgCKEiMsAcpt4x0Jvg6JVUrTMxTrYuHy3VA4w7OHOcGQ04fKDZFlPTZmABRPHEVi8xe4AJ
        6M6HqaT1BwyA02NdJ8NQ7P4gtPIpzXeh9J5z7Pq4Xdh0LEEbgnGNpluQdIXg7KH2f841WI
        GM1GaGzEPGtTT5wbnS23jh/vEYHcdYk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-Mu6HMrQuNuWu2W3sooyWmg-1; Thu, 05 May 2022 07:31:45 -0400
X-MC-Unique: Mu6HMrQuNuWu2W3sooyWmg-1
Received: by mail-wr1-f72.google.com with SMTP id j21-20020adfa555000000b0020adb9ac14fso1354719wrb.13
        for <linux-fbdev@vger.kernel.org>; Thu, 05 May 2022 04:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iaNxVGQEFp6Vh3rpWtfph/7pGGoZXolh5bDdGY4BamI=;
        b=1sJqjGxHtdYB7xUfvlam2i5JIQArgxIw3Lb7JovEzFR0qVhN7btv19WQXJXvIBj2zk
         orqHjWVOse2dsS9xVBc6F3kGjO90k3v5cnSUUYrpe6bdFV+1RyliFxx4NNbQlGISVUHT
         UdfRRqxmKe85ykXF9GteW3NKjBQA4C0lZJpOslbpRiH07dHO45hy0nI3thm+snWSn4yn
         s1ghUzOKJctS8dEPX4m7+DokovL2ybRi+KT128r5ORI7aI2zyJQauo9Lfej5sHflkqlZ
         woghXGCwdPt/7urGVpzFsi3Zjj6yl7SM9I3mw8+nWRlTR7AYppe7TRXvKl1+nDs8Gox1
         OU1w==
X-Gm-Message-State: AOAM533woTxRTpC85zUn5CC7vsvjQQQDXxUp3QVbUQYDJJA4UQhrCb9m
        eULPPNDEN1qLBOKsea0C/ylbgkT022yriJCHG15GAQaSz46bU8Eam3tcR6xLPRVFX2m5BQCtzxm
        1865jJVDn67vv60IS+x/BSGU=
X-Received: by 2002:adf:e3c1:0:b0:20a:aba9:9b38 with SMTP id k1-20020adfe3c1000000b0020aaba99b38mr20119954wrm.673.1651750304422;
        Thu, 05 May 2022 04:31:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwogTeQYgdTtWNZ/wNca28ZWGYyN1l0Yo2mnXOCjf6sBJLP+nj0+3gp8L+KGNj+gcXV021TEA==
X-Received: by 2002:adf:e3c1:0:b0:20a:aba9:9b38 with SMTP id k1-20020adfe3c1000000b0020aaba99b38mr20119937wrm.673.1651750304208;
        Thu, 05 May 2022 04:31:44 -0700 (PDT)
Received: from minerva.. ([90.167.94.135])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d5181000000b0020c5253d8f5sm995809wrv.65.2022.05.05.04.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 04:31:43 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: [PATCH v2 4/4] fbdev: vesafb: Cleanup fb_info in .fb_destroy rather than .remove
Date:   Thu,  5 May 2022 13:31:27 +0200
Message-Id: <20220505113128.264963-5-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505113128.264963-1-javierm@redhat.com>
References: <20220505113128.264963-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The driver is calling framebuffer_release() in its .remove callback, but
this will cause the struct fb_info to be freed too early. Since it could
be that a reference is still hold to it if user-space opened the fbdev.

This would lead to a use-after-free error if the framebuffer device was
unregistered but later a user-space process tries to close the fbdev fd.

The correct thing to do is to only unregister the framebuffer in the
driver's .remove callback, but do any cleanup in the fb_ops.fb_destroy.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Also do the change for vesafb (Thomas Zimmermann).

 drivers/video/fbdev/vesafb.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index df6de5a9dd4c..1f03a449e505 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -179,6 +179,10 @@ static int vesafb_setcolreg(unsigned regno, unsigned red, unsigned green,
 	return err;
 }
 
+/*
+ * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
+ * of unregister_framebuffer() or fb_release(). Do any cleanup here.
+ */
 static void vesafb_destroy(struct fb_info *info)
 {
 	struct vesafb_par *par = info->par;
@@ -187,7 +191,13 @@ static void vesafb_destroy(struct fb_info *info)
 	arch_phys_wc_del(par->wc_cookie);
 	if (info->screen_base)
 		iounmap(info->screen_base);
+
+	if (((struct vesafb_par *)(info->par))->region)
+		release_region(0x3c0, 32);
+
 	release_mem_region(info->apertures->ranges[0].base, info->apertures->ranges[0].size);
+
+	framebuffer_release(info);
 }
 
 static struct fb_ops vesafb_ops = {
@@ -484,10 +494,8 @@ static int vesafb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
+	/* vesafb_destroy takes care of info cleanup */
 	unregister_framebuffer(info);
-	if (((struct vesafb_par *)(info->par))->region)
-		release_region(0x3c0, 32);
-	framebuffer_release(info);
 
 	return 0;
 }
-- 
2.35.1

