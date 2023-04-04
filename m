Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94B216D575F
	for <lists+linux-fbdev@lfdr.de>; Tue,  4 Apr 2023 06:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjDDEBK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 4 Apr 2023 00:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDDEBJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 4 Apr 2023 00:01:09 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 64D8319F;
        Mon,  3 Apr 2023 21:01:04 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.133])
        by gateway (Coremail) with SMTP id _____8DxE0z+oCtk2E8WAA--.34589S3;
        Tue, 04 Apr 2023 12:01:02 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.133])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxur39oCtkMO4UAA--.18983S2;
        Tue, 04 Apr 2023 12:01:01 +0800 (CST)
From:   Sui Jingfeng <suijingfeng@loongson.cn>
To:     Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        Li Yi <liyi@loongson.cn>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Helge Deller <deller@gmx.de>,
        Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH] video/aperture: fix typos
Date:   Tue,  4 Apr 2023 12:01:01 +0800
Message-Id: <20230404040101.2165600-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxur39oCtkMO4UAA--.18983S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7AF1UZrW7CryrAF17KFyrtFb_yoW8tw4rpF
        sYgFyUCr1DKr4jgayj9a10yFyrWa93Xay5KFyUA3ya9wn8Ca4rXrWUGFWkG3WDJryku3Wa
        vFn8Zr18CF4DZrJanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
        87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxV
        Aaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
        O2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
        WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
        JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
        WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
        JbIYCTnIWIevJa73UjIFyTuYvjxU4SoGDUUUU
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

 EFI FB, VESA FB or VGA FB etc are belong to firmware based framebuffer
 driver.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/video/aperture.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 41e77de1ea82..b009468ffdff 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -20,7 +20,7 @@
  * driver can be active at any given time. Many systems load a generic
  * graphics drivers, such as EFI-GOP or VESA, early during the boot process.
  * During later boot stages, they replace the generic driver with a dedicated,
- * hardware-specific driver. To take over the device the dedicated driver
+ * hardware-specific driver. To take over the device, the dedicated driver
  * first has to remove the generic driver. Aperture functions manage
  * ownership of framebuffer memory and hand-over between drivers.
  *
@@ -76,7 +76,7 @@
  * generic EFI or VESA drivers, have to register themselves as owners of their
  * framebuffer apertures. Ownership of the framebuffer memory is achieved
  * by calling devm_aperture_acquire_for_platform_device(). If successful, the
- * driveris the owner of the framebuffer range. The function fails if the
+ * driver is the owner of the framebuffer range. The function fails if the
  * framebuffer is already owned by another driver. See below for an example.
  *
  * .. code-block:: c
@@ -126,7 +126,7 @@
  * et al for the registered framebuffer range, the aperture helpers call
  * platform_device_unregister() and the generic driver unloads itself. The
  * generic driver also has to provide a remove function to make this work.
- * Once hot unplugged fro mhardware, it may not access the device's
+ * Once hot unplugged from hardware, it may not access the device's
  * registers, framebuffer memory, ROM, etc afterwards.
  */
 
@@ -203,7 +203,7 @@ static void aperture_detach_platform_device(struct device *dev)
 
 	/*
 	 * Remove the device from the device hierarchy. This is the right thing
-	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
+	 * to do for firmware-based fb drivers, such as EFI, VESA or VGA. After
 	 * the new driver takes over the hardware, the firmware device's state
 	 * will be lost.
 	 *
-- 
2.25.1

