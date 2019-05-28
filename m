Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40B782C22F
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 May 2019 11:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfE1JD6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 May 2019 05:03:58 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38179 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbfE1JD5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 May 2019 05:03:57 -0400
Received: by mail-ed1-f66.google.com with SMTP id g13so838289edu.5
        for <linux-fbdev@vger.kernel.org>; Tue, 28 May 2019 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KOGyYDuulYoZlGMMrGlYnho9Xow/hNHN2r6g5KqqxbA=;
        b=LmD9YyG7s+OqvV8GaC+iTvVDRdtjPeq/zghiL4J+/ZI7u5Eg21vxnuzwTFovpBti8O
         3LjHgkfSbO5QNC3qJK3ek9epxYfj2V3oUkdq1yYwA2dDDqa0UrVbBDP43PYt6yNfhlLc
         AWLn+vFL5yhJ8lJhJdU43jJDDzQDEKyiJifa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KOGyYDuulYoZlGMMrGlYnho9Xow/hNHN2r6g5KqqxbA=;
        b=BZlhXMwU9rwoiIX9AfF7M2BXyxy8b/5hYA+mdcpVCg6VYDKfgWgpo3G75WlcvjNNg/
         gYT/4o5X2KiEi6U6tHBAM0onlCyIWQkXb5R9RzGD5IrJufMZJXm0N9N0FNRpkcQg7Tis
         CnbhZFNjyh6S4D3w5qRJ9QRb3NrDwLawoqKjdD7MynybW1iOfP982gVpev2VKLCBGwiH
         3ygc1elKRFTZpszvZe+mcEidFumVx26StXC3Xul1Zh5aT+UePU7yurlvebwbLB+SUz+Y
         irri77TjSzxhNsHtA7slujeJHv7ghjIcTvu8buQRI/lokoaZK7//M8DSCSr5casXAMU9
         JM0w==
X-Gm-Message-State: APjAAAUSO/2pyuR8PnGg6IE4fyhAMselUlrzy4TxAklc12+ME1azPE8e
        3gfXXnnJ7emyM4Dr8+WmH8w/tA==
X-Google-Smtp-Source: APXvYqyUrqB+xoH0ka3duTbZa5FPC3QZa0uDwLH0U5RXdNxaQd1JKD8pOMMaPMJ2kKeKORQcacvUQg==
X-Received: by 2002:a50:e048:: with SMTP id g8mr128055262edl.26.1559034236177;
        Tue, 28 May 2019 02:03:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 02:03:55 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Yisheng Xie <ysxie@foxmail.com>
Subject: [PATCH 31/33] fbcon: Document what I learned about fbcon locking
Date:   Tue, 28 May 2019 11:03:02 +0200
Message-Id: <20190528090304.9388-32-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

It's not pretty.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Yisheng Xie <ysxie@foxmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index fbd28aeff307..d6ba3610ee83 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -88,6 +88,25 @@
 #  define DPRINTK(fmt, args...)
 #endif
 
+/*
+ * FIXME: Locking
+ *
+ * - fbcon state itself is protected by the console_lock, and the code does a
+ *   pretty good job at making sure that lock is held everywhere it's needed.
+ *
+ * - access to the registered_fb array is entirely unprotected. This should use
+ *   proper object lifetime handling, i.e. get/put_fb_info. This also means
+ *   switching from indices to proper pointers for fb_info everywhere.
+ *
+ * - fbcon doesn't bother with fb_lock/unlock at all. This is buggy, since it
+ *   means concurrent access to the same fbdev from both fbcon and userspace
+ *   will blow up. To fix this all fbcon calls from fbmem.c need to be moved out
+ *   of fb_lock/unlock protected sections, since otherwise we'll recurse and
+ *   deadlock eventually. Aside: Due to these deadlock issues the fbdev code in
+ *   fbmem.c cannot use locking asserts, and there's lots of callers which get
+ *   the rules wrong, e.g. fbsysfs.c entirely missed fb_lock/unlock calls too.
+ */
+
 enum {
 	FBCON_LOGO_CANSHOW	= -1,	/* the logo can be shown */
 	FBCON_LOGO_DRAW		= -2,	/* draw the logo to a console */
-- 
2.20.1

