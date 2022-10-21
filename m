Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E4C606CEB
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Oct 2022 03:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiJUBPz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 20 Oct 2022 21:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJUBPw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 20 Oct 2022 21:15:52 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3421E188AA2
        for <linux-fbdev@vger.kernel.org>; Thu, 20 Oct 2022 18:15:50 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id n7so944296plp.1
        for <linux-fbdev@vger.kernel.org>; Thu, 20 Oct 2022 18:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYc5dlRmOKX3pKCJnT+MFL8RVo/8Ttmq2r93sp4OQsE=;
        b=H4nujdR2StaT8z4NSqPqeAGsi1b6673+PXh6vfeb6bElyNwNNy5g52mhzYcq36RpL9
         9GKKanOQHIcIIp8+6Nj7Xu6BY20xS4yNgOBuZCIWjIvRKM9fAsQFLXv3c7X7c6iLfYxf
         GdPkcv9YyThGeuigxQUNaS2YbBPGhy8TpMgxbSQA6zNLTwGPGxGKdGCsnNS3STKoU9TN
         NhiUx7Aula+FJLPWE+64oMDteE13Pn6jYY/f1QQG4xKNP5omfh4TGBTb/SHWvMqhmXZU
         VnlH0/8pQ53mBy3kVW6v2Elsw/1axLw48TICQP8DBID25lmqRGuSOvXyiVrgYvMDhRfm
         pDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TYc5dlRmOKX3pKCJnT+MFL8RVo/8Ttmq2r93sp4OQsE=;
        b=vUNwXcdKWUTbd7VcY4WCF7bFWJbBzUIjLSHj7kzsefqebxtUR1te2BMrfCsBIi7Rvq
         FYPoqAxYHXNMwu+WcyWTVbKx7W+mqYGoizRsmdVSQ8l/DikAt9eEgeb7Puao3jG7lMSe
         vEkrZ9P3X5gNl6tFIV7uuCOXMuKgjLi1yJ1Ihe64+AROk3AAZWfbPU8bu51UNsoyJ4Xl
         ipfpHB1t8FpfuLeXe1LeB3nz4F2yd6hgly5vWVFAa3uWSKBDnPUOElxQIXC69oMiqpjR
         Iqqmyl9XzXSW186+RxZkOXGIdqjYUAo7HvspRp4wrPVSKyrpnQirI81DS5Otl+e6yF3g
         SHqQ==
X-Gm-Message-State: ACrzQf2aJ2vB7m3tcwqgWAAzqjKGwELHJM428tpySEDxdQBi3sUYNLZ2
        p6epeA9XELW4PUABqvqrrP4=
X-Google-Smtp-Source: AMsMyM5Kvgj6SsrhrnGcanCbSG7FEtgALjP0nlO1UN4j4ONw2zIIgC3xgaEqTX7M5eipjsxwPwOFPQ==
X-Received: by 2002:a17:90a:2bcb:b0:20a:ea55:32ef with SMTP id n11-20020a17090a2bcb00b0020aea5532efmr54828720pje.59.1666314949631;
        Thu, 20 Oct 2022 18:15:49 -0700 (PDT)
Received: from ubuntu ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id m10-20020a1709026bca00b00181a0e61ce4sm13409281plt.6.2022.10.20.18.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 18:15:49 -0700 (PDT)
Date:   Thu, 20 Oct 2022 18:15:44 -0700
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     steve.glendinning@shawell.net, deller@gmx.de
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imv4bel@gmail.com
Subject: [PATCH v2] video: fbdev: smscufx: Fixed several use-after-free bugs
Message-ID: <20221021011544.GA339803@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Several types of UAFs can occur when physically removing a USB device.

Adds ufx_ops_destroy() function to .fb_destroy of fb_ops, and
in this function, there is kref_put() that finally calls ufx_free().

This fix prevents multiple UAFs.

Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
Link: https://lore.kernel.org/linux-fbdev/20221011153436.GA4446@ubuntu/
---
v2:
The v1 patch fixed several UAFs, but "info" was not kfree()d after the device 
was removed by calling the framebuffer_release() function from 
ufx_free_framebuffer().
This is because fb_info->count was not 0 at the time the 
framebuffer_release() function was called.

Moved the framebuffer_release() function to the ufx_ops_destory() function. 
The ufx_ops_destory() function is a .fb_destory ops that is called 
after fb_info->count goes to zero.
---
 drivers/video/fbdev/smscufx.c | 55 +++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index e65bdc499c23..9343b7a4ac89 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -97,7 +97,6 @@ struct ufx_data {
 	struct kref kref;
 	int fb_count;
 	bool virtualized; /* true when physical usb device not present */
-	struct delayed_work free_framebuffer_work;
 	atomic_t usb_active; /* 0 = update virtual buffer, but no usb traffic */
 	atomic_t lost_pixels; /* 1 = a render op failed. Need screen refresh */
 	u8 *edid; /* null until we read edid from hw or get from sysfs */
@@ -1117,15 +1116,24 @@ static void ufx_free(struct kref *kref)
 {
 	struct ufx_data *dev = container_of(kref, struct ufx_data, kref);
 
-	/* this function will wait for all in-flight urbs to complete */
-	if (dev->urbs.count > 0)
-		ufx_free_urb_list(dev);
+	kfree(dev);
+}
 
-	pr_debug("freeing ufx_data %p", dev);
+static void ufx_ops_destory(struct fb_info *info)
+{
+	struct ufx_data *dev = info->par;
+	int node = info->node;
 
-	kfree(dev);
+	/* Assume info structure is freed after this point */
+	framebuffer_release(info);
+
+	pr_debug("fb_info for /dev/fb%d has been freed", node);
+
+	/* release reference taken by kref_init in probe() */
+	kref_put(&dev->kref, ufx_free);
 }
 
+
 static void ufx_release_urb_work(struct work_struct *work)
 {
 	struct urb_node *unode = container_of(work, struct urb_node,
@@ -1134,14 +1142,9 @@ static void ufx_release_urb_work(struct work_struct *work)
 	up(&unode->dev->urbs.limit_sem);
 }
 
-static void ufx_free_framebuffer_work(struct work_struct *work)
+static void ufx_free_framebuffer(struct ufx_data *dev)
 {
-	struct ufx_data *dev = container_of(work, struct ufx_data,
-					    free_framebuffer_work.work);
 	struct fb_info *info = dev->info;
-	int node = info->node;
-
-	unregister_framebuffer(info);
 
 	if (info->cmap.len != 0)
 		fb_dealloc_cmap(&info->cmap);
@@ -1153,11 +1156,6 @@ static void ufx_free_framebuffer_work(struct work_struct *work)
 
 	dev->info = NULL;
 
-	/* Assume info structure is freed after this point */
-	framebuffer_release(info);
-
-	pr_debug("fb_info for /dev/fb%d has been freed", node);
-
 	/* ref taken in probe() as part of registering framebfufer */
 	kref_put(&dev->kref, ufx_free);
 }
@@ -1169,11 +1167,13 @@ static int ufx_ops_release(struct fb_info *info, int user)
 {
 	struct ufx_data *dev = info->par;
 
+	mutex_lock(&disconnect_mutex);
+
 	dev->fb_count--;
 
 	/* We can't free fb_info here - fbmem will touch it when we return */
 	if (dev->virtualized && (dev->fb_count == 0))
-		schedule_delayed_work(&dev->free_framebuffer_work, HZ);
+		ufx_free_framebuffer(dev);
 
 	if ((dev->fb_count == 0) && (info->fbdefio)) {
 		fb_deferred_io_cleanup(info);
@@ -1186,6 +1186,8 @@ static int ufx_ops_release(struct fb_info *info, int user)
 
 	kref_put(&dev->kref, ufx_free);
 
+	mutex_unlock(&disconnect_mutex);
+
 	return 0;
 }
 
@@ -1292,6 +1294,7 @@ static const struct fb_ops ufx_ops = {
 	.fb_blank = ufx_ops_blank,
 	.fb_check_var = ufx_ops_check_var,
 	.fb_set_par = ufx_ops_set_par,
+	.fb_destroy = ufx_ops_destory,
 };
 
 /* Assumes &info->lock held by caller
@@ -1673,9 +1676,6 @@ static int ufx_usb_probe(struct usb_interface *interface,
 		goto destroy_modedb;
 	}
 
-	INIT_DELAYED_WORK(&dev->free_framebuffer_work,
-			  ufx_free_framebuffer_work);
-
 	retval = ufx_reg_read(dev, 0x3000, &id_rev);
 	check_warn_goto_error(retval, "error %d reading 0x3000 register from device", retval);
 	dev_dbg(dev->gdev, "ID_REV register value 0x%08x", id_rev);
@@ -1748,10 +1748,12 @@ static int ufx_usb_probe(struct usb_interface *interface,
 static void ufx_usb_disconnect(struct usb_interface *interface)
 {
 	struct ufx_data *dev;
+	struct fb_info *info;
 
 	mutex_lock(&disconnect_mutex);
 
 	dev = usb_get_intfdata(interface);
+	info = dev->info;
 
 	pr_debug("USB disconnect starting\n");
 
@@ -1765,12 +1767,15 @@ static void ufx_usb_disconnect(struct usb_interface *interface)
 
 	/* if clients still have us open, will be freed on last close */
 	if (dev->fb_count == 0)
-		schedule_delayed_work(&dev->free_framebuffer_work, 0);
+		ufx_free_framebuffer(dev);
 
-	/* release reference taken by kref_init in probe() */
-	kref_put(&dev->kref, ufx_free);
+	/* this function will wait for all in-flight urbs to complete */
+	if (dev->urbs.count > 0)
+		ufx_free_urb_list(dev);
 
-	/* consider ufx_data freed */
+	pr_debug("freeing ufx_data %p", dev);
+
+	unregister_framebuffer(info);
 
 	mutex_unlock(&disconnect_mutex);
 }
-- 
2.25.1

