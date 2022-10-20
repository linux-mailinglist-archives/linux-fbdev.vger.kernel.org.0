Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D48606949
	for <lists+linux-fbdev@lfdr.de>; Thu, 20 Oct 2022 22:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbiJTUBk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 20 Oct 2022 16:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiJTUBh (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 20 Oct 2022 16:01:37 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED8D181C8C
        for <linux-fbdev@vger.kernel.org>; Thu, 20 Oct 2022 13:01:28 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id g28so539348pfk.8
        for <linux-fbdev@vger.kernel.org>; Thu, 20 Oct 2022 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8QFkj9eVIkbxCy5NQnLk1d8ujRFVsl1WFy880Uu5V7E=;
        b=WZUDgTN58FA+GtBOYb6eRU53jCH7UOyrFhWuxtC6Tp3ugyacaOvTN9QxqtqonzBcoO
         YLZewmFcQVINhpOWQfg43DproYrPvKdm+0FwH5YWoSakWub7XqKrvmcURRa8rp3HRj/j
         bvmJKo6j/1uECgeAdu5t4U6HpzoFtGRM1PgEcZRt9KmDynvKN+FBbeot6+NMTJKU1hsB
         kQ4RD37sTHiq4iwi0MgB428L8Z1+JChBb5TcPhyWTkvw3U7CIZ6jLhIJdF3v5Evh2Ygj
         iOz58KzFeVYa9CzLyXfa9k+RT+LnssPa+/UHkrzYeeoTP4rmDdOh+dQOFdvRy74Lef2d
         Dydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8QFkj9eVIkbxCy5NQnLk1d8ujRFVsl1WFy880Uu5V7E=;
        b=i+HKhqxBfc1Sz9gtHqsb+HAMRSQ2/ipFMew53+bphfPhV0KKVpJff5+S2Aaat7tlV/
         WgQrefGu0jdu/6VHxbIweoNw+sme2uohFEH/Lko9kNYl71FtvUEle5osIXgDIn1/ef0g
         5K5DjoZ/L8OCHfNMRP3SivaticA6x/ki1qsvMyf4KuVdGh31jALZRXh0YBmTHRK4+UBf
         pZNNiw7m8BK0C7+QMp8M9WLAgSJn+evlnkT5TiZNwjGhjYK/LhN0me1siTQCd8hX2U9t
         4XxvLb5os8Oo2xZPMCeoy1egjg10gZRjeQuc4qs1iUQOKVUwUJm/wXydjzECJ/qsZ4aN
         GMgg==
X-Gm-Message-State: ACrzQf0evWVcJZZv2E9gDYMJ0gr4p/omWgHbmO2CyCULySEAaosc8Cok
        bSg6GzpCm2ZMD0n9zOpF0+EL7G56uc4=
X-Google-Smtp-Source: AMsMyM5jQbpBV5B3hwnc9fqao2gemLLhACd/mP9bu23pKklolM7clIOtQr/VrArKSgki9KGXNpSnSA==
X-Received: by 2002:a17:902:d48d:b0:185:115c:b165 with SMTP id c13-20020a170902d48d00b00185115cb165mr15697503plg.86.1666296077277;
        Thu, 20 Oct 2022 13:01:17 -0700 (PDT)
Received: from ubuntu ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090a6c8800b0020a9af6bb1asm207950pjj.32.2022.10.20.13.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 13:01:16 -0700 (PDT)
Date:   Thu, 20 Oct 2022 13:01:13 -0700
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     steve.glendinning@shawell.net, deller@gmx.de
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imv4bel@gmail.com
Subject: [PATCH] video: fbdev: smscufx: Fixed several use-after-free bugs
Message-ID: <20221020200113.GA320044@ubuntu>
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
 drivers/video/fbdev/smscufx.c | 43 +++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index e65bdc499c23..9f90c02c6533 100644
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
@@ -1117,15 +1116,18 @@ static void ufx_free(struct kref *kref)
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
 
-	kfree(dev);
+	/* release reference taken by kref_init in probe() */
+	kref_put(&dev->kref, ufx_free);
 }
 
+
 static void ufx_release_urb_work(struct work_struct *work)
 {
 	struct urb_node *unode = container_of(work, struct urb_node,
@@ -1134,15 +1136,11 @@ static void ufx_release_urb_work(struct work_struct *work)
 	up(&unode->dev->urbs.limit_sem);
 }
 
-static void ufx_free_framebuffer_work(struct work_struct *work)
+static void ufx_free_framebuffer(struct ufx_data *dev)
 {
-	struct ufx_data *dev = container_of(work, struct ufx_data,
-					    free_framebuffer_work.work);
 	struct fb_info *info = dev->info;
 	int node = info->node;
 
-	unregister_framebuffer(info);
-
 	if (info->cmap.len != 0)
 		fb_dealloc_cmap(&info->cmap);
 	if (info->monspecs.modedb)
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


Dear,


I have been pointed out that it is possible to bypass the existing UAF fix patch I submitted:
https://lore.kernel.org/linux-fbdev/20221011153436.GA4446@ubuntu/

I am now submitting a patch to prevent this and several other UAFs.

The patch contents are as follows:
1. Added "fb_ops.fb_destroy" function
The root cause of multiple UAFs is that this driver does not implement .fb_destroy of fb_ops.

.fb_destroy is called when fb_info->count goes to zero.
Changes in fb_info->count usually look like this:
```
.probe: 1
.open : 2
.release : 1
.disconnect: 0
```
In other words, since .fb_destory is called only after both release and disconnect are called,
"dev" of this driver must be released in this function so that UAF does not occur.

Even in situations where .disconnect acquires the mutex before .open, no UAF occurs:
```
.probe: 1
.open : 2
.disconnect: 1
.open failed. fb_open() : 0
```
This is because fb_info->count is decremented by calling put_fb_info() in fb_open()
function after .open fails.


2. Add global mutex to ufx_ops_release()
Added global mutex because race conditions between .release function ufx_ops_release()
and .disconnect can occur.


3. Remove dev->free_framebuffer_work
Since the dev->free_framebuffer_work delay work is called without the global mutex applied,
it can cause numerous race conditions.
Therefore, the work queue callback ufx_free_framebuffer_work() function has been changed
to the normal function ufx_free_framebuffer().


Regards,
Hyunwoo Kim.
