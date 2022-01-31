Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B34644A511A
	for <lists+linux-fbdev@lfdr.de>; Mon, 31 Jan 2022 22:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380577AbiAaVI4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 31 Jan 2022 16:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380569AbiAaVHJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 31 Jan 2022 16:07:09 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94771C061770
        for <linux-fbdev@vger.kernel.org>; Mon, 31 Jan 2022 13:06:54 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id h21so27910838wrb.8
        for <linux-fbdev@vger.kernel.org>; Mon, 31 Jan 2022 13:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aGreVoBv5lFrGAhkKBR22I8AcuYmyzl1ND80HuTCbWw=;
        b=Ce2EXiZ6NeWaMQg7vuTxuhe84d+UnW4ndFL8GON+RIrMFrKsXLBgnAYvw3YX7WHoob
         8iy9fYppGJA1n5RdF5uOmTbl35qes7UPTXp58TH4VzJ/2T4MaY6yf24bJlKJAdBErdgu
         qHKH9P+j50ghgEGyY1xMaZSVgQklR+WgfJEBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aGreVoBv5lFrGAhkKBR22I8AcuYmyzl1ND80HuTCbWw=;
        b=cadamGnBREpoVPeOC6T4GuyHCNy20xnbRFNEc9q3gD9JzFbjVLYHfVupWUQxa+mlnd
         o8vIfBdxX+FWD8U2VwQQCmL2TNFkO/xpsbRvbdZCctuMPqHOY0VK7pmWnpKgRitRq5G7
         0G4uP1LwvqAPA0mfJsEHp2O6tVmIiafdlKc9EJQJ1t8hoy9nqYwrIMufHMRghrZEz/JE
         ICsBEQd1Ti3b2ohmF8E4q+8l1dYUdy3zPc3Ciyvse/Z+99qWpXve7epv8s98vasRSwTH
         Uqp7v7xnNyo+Qebpnxy4vkF2CmXMqqxjjUsLddNotUImejtUAKgoBJA3gt3rzznTCZlF
         V0BQ==
X-Gm-Message-State: AOAM533nh4Z3lEn5uO2ns9BjB8VFUFNbSnvtUvQhejU9ZiZ7z5RdRDQl
        1A3BMevZ3hfeP7C88iTqZl8eJA==
X-Google-Smtp-Source: ABdhPJx/nOHwEr/5eFZj9enrGYAxDjjY1aE3BvBG5xK+gsRkdtoyvkoY3tqiyHdzYyxTwphjn5fXwQ==
X-Received: by 2002:a5d:6341:: with SMTP id b1mr18173217wrw.719.1643663213206;
        Mon, 31 Jan 2022 13:06:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 13:06:52 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Zack Rusin <zackr@vmware.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Ilya Trukhanov <lahvuun@gmail.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Peter Jones <pjones@redhat.com>
Subject: [PATCH 20/21] Revert "fbdev: Prevent probing generic drivers if a FB is already registered"
Date:   Mon, 31 Jan 2022 22:05:51 +0100
Message-Id: <20220131210552.482606-21-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This reverts commit fb561bf9abde49f7e00fdbf9ed2ccf2d86cac8ee.

With

commit 27599aacbaefcbf2af7b06b0029459bbf682000d
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Tue Jan 25 10:12:18 2022 +0100

    fbdev: Hot-unplug firmware fb devices on forced removal

this should be fixed properly and we can remove this somewhat hackish
check here (e.g. this won't catch drm drivers if fbdev emulation isn't
enabled).

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilya Trukhanov <lahvuun@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Peter Jones <pjones@redhat.com>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/efifb.c    | 11 -----------
 drivers/video/fbdev/simplefb.c | 11 -----------
 2 files changed, 22 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index ea42ba6445b2..edca3703b964 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -351,17 +351,6 @@ static int efifb_probe(struct platform_device *dev)
 	char *option = NULL;
 	efi_memory_desc_t md;
 
-	/*
-	 * Generic drivers must not be registered if a framebuffer exists.
-	 * If a native driver was probed, the display hardware was already
-	 * taken and attempting to use the system framebuffer is dangerous.
-	 */
-	if (num_registered_fb > 0) {
-		dev_err(&dev->dev,
-			"efifb: a framebuffer is already registered\n");
-		return -EINVAL;
-	}
-
 	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 57541887188b..ee8b4412f7e4 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -407,17 +407,6 @@ static int simplefb_probe(struct platform_device *pdev)
 	struct simplefb_par *par;
 	struct resource *mem;
 
-	/*
-	 * Generic drivers must not be registered if a framebuffer exists.
-	 * If a native driver was probed, the display hardware was already
-	 * taken and attempting to use the system framebuffer is dangerous.
-	 */
-	if (num_registered_fb > 0) {
-		dev_err(&pdev->dev,
-			"simplefb: a framebuffer is already registered\n");
-		return -EINVAL;
-	}
-
 	if (fb_get_options("simplefb", NULL))
 		return -ENODEV;
 
-- 
2.33.0

