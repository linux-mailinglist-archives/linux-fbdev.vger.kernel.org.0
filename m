Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7F784E4731
	for <lists+linux-fbdev@lfdr.de>; Tue, 22 Mar 2022 21:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbiCVUGQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 22 Mar 2022 16:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbiCVUGP (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 22 Mar 2022 16:06:15 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647964EA20;
        Tue, 22 Mar 2022 13:04:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id bu29so31721705lfb.0;
        Tue, 22 Mar 2022 13:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iUZGUL8Gi2Ppt7yy31rOC+YSZzvaBz5owptCNe6gYkY=;
        b=oV2YZ3Ejy3RjJi2itI649lz1+hsG6QWWYX0wozfToncoiqs6v182m72C2NcQ8y5/lG
         ChdqZIsVeWiBE7HeHRZ9mc/TRKJ8horLM7HWoKzV+JLUu6nUGHOVDknM2/C4CxgO49Pb
         U3J1XZT6j4OYlS2l1roZ4uyccGZm6OBWKfRGofyKfs8z1fKOfhEbR2z99lrnHdM2u5zb
         PKYQrMIDu0w7Rx4Kf9Twcm65yIDGUYzq5dBblFR3gyypAykapHxL2l0roUfSmsQS0T9U
         STgLZ3uWyiuM4UeVNAIJ6dpJfHx6p3ykuT3TlDyrl9FlV7Gt1uk6AyVt17cOgXPM0mzo
         Ot4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iUZGUL8Gi2Ppt7yy31rOC+YSZzvaBz5owptCNe6gYkY=;
        b=pyPIS4bpzIT+dJeytyBzNzkG6ikKQ/nlvc0FpQOnyI3IJGK5ykm13L5ZYCnMPYDvZC
         XUDviWC0Z3dnB0TU6y0qylSsGeQJrEFTrvScRg9DR7hXR9Z7QCFt3QCohaLpWLGZnq0t
         SF6AbI/YQ6HBUaGx1WwufuvYTKUNApdubbg6FM6mN7HX1IGoGcto+oHQsQXAzkqJDNOi
         DdksCp2FHRMioDk4N/mfN+FJsdX2lT4DgNG9YNcQIldgNE3JxUKrPuHk4zb2SWcav7F/
         r5y/vaVYgByb9xvgDEuFRQVA3lN0qmrclK5swmtKw82cPtX9S6yrwSJGwkrf2R602t3/
         JH7Q==
X-Gm-Message-State: AOAM532QDfroiamA2SQoj33hHdDWu0HNIf+3vT1km9gw+wdlOLmU9j4C
        IOASGBj09n4TzR/CuV7DbdQ=
X-Google-Smtp-Source: ABdhPJy3cQEbdob9qsqC3FESc/ERco2MNW6fDTTTdfm7ITBEAu2CuQ+PFlRdCTlFaMpr6r4lsSuGcA==
X-Received: by 2002:a05:6512:1111:b0:44a:1035:7a1f with SMTP id l17-20020a056512111100b0044a10357a1fmr13573158lfg.182.1647979485544;
        Tue, 22 Mar 2022 13:04:45 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.145])
        by smtp.gmail.com with ESMTPSA id p12-20020a056512138c00b0044833f1cd85sm2301795lfa.62.2022.03.22.13.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 13:04:45 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     bernie@plugable.com, deller@gmx.de
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+53ce4a4246d0fe0fee34@syzkaller.appspotmail.com
Subject: [PATCH] fbdev: udlfb: properly check endpoint type
Date:   Tue, 22 Mar 2022 23:04:38 +0300
Message-Id: <20220322200438.17998-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

syzbot reported warning in usb_submit_urb, which is caused by wrong
endpoint type.

This driver uses out bulk endpoint for communication, so
let's check if this endpoint is present and bail out early if not.

Fail log:

usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 0 PID: 4822 at drivers/usb/core/urb.c:493 usb_submit_urb+0xd27/0x1540 drivers/usb/core/urb.c:493
Modules linked in:
CPU: 0 PID: 4822 Comm: kworker/0:3 Tainted: G        W         5.13.0-syzkaller #0
...
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0xd27/0x1540 drivers/usb/core/urb.c:493
...
Call Trace:
 dlfb_submit_urb+0x89/0x160 drivers/video/fbdev/udlfb.c:1969
 dlfb_set_video_mode+0x21f0/0x2950 drivers/video/fbdev/udlfb.c:315
 dlfb_ops_set_par+0x2a3/0x840 drivers/video/fbdev/udlfb.c:1110
 dlfb_usb_probe.cold+0x113e/0x1f4a drivers/video/fbdev/udlfb.c:1732
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396

Fixes: 88e58b1a42f8 ("Staging: add udlfb driver")
Reported-and-tested-by: syzbot+53ce4a4246d0fe0fee34@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/video/fbdev/udlfb.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index b9cdd02c1000..2343c7955747 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1649,8 +1649,9 @@ static int dlfb_usb_probe(struct usb_interface *intf,
 	const struct device_attribute *attr;
 	struct dlfb_data *dlfb;
 	struct fb_info *info;
-	int retval = -ENOMEM;
+	int retval;
 	struct usb_device *usbdev = interface_to_usbdev(intf);
+	struct usb_endpoint_descriptor *out;
 
 	/* usb initialization */
 	dlfb = kzalloc(sizeof(*dlfb), GFP_KERNEL);
@@ -1664,6 +1665,12 @@ static int dlfb_usb_probe(struct usb_interface *intf,
 	dlfb->udev = usb_get_dev(usbdev);
 	usb_set_intfdata(intf, dlfb);
 
+	retval = usb_find_common_endpoints(intf->cur_altsetting, NULL, &out, NULL, NULL);
+	if (retval) {
+		dev_err(&intf->dev, "Device should have at lease 1 bulk endpoint!\n");
+		goto error;
+	}
+
 	dev_dbg(&intf->dev, "console enable=%d\n", console);
 	dev_dbg(&intf->dev, "fb_defio enable=%d\n", fb_defio);
 	dev_dbg(&intf->dev, "shadow enable=%d\n", shadow);
@@ -1673,6 +1680,7 @@ static int dlfb_usb_probe(struct usb_interface *intf,
 	if (!dlfb_parse_vendor_descriptor(dlfb, intf)) {
 		dev_err(&intf->dev,
 			"firmware not recognized, incompatible device?\n");
+		retval = -ENODEV;
 		goto error;
 	}
 
@@ -1686,8 +1694,10 @@ static int dlfb_usb_probe(struct usb_interface *intf,
 
 	/* allocates framebuffer driver structure, not framebuffer memory */
 	info = framebuffer_alloc(0, &dlfb->udev->dev);
-	if (!info)
+	if (!info) {
+		retval = -ENOMEM;
 		goto error;
+	}
 
 	dlfb->info = info;
 	info->par = dlfb;
-- 
2.35.1

