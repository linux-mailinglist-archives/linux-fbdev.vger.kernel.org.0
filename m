Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF972A9C9E
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Nov 2020 19:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgKFSp4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 6 Nov 2020 13:45:56 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:10613 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbgKFSp4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 6 Nov 2020 13:45:56 -0500
X-Greylist: delayed 342 seconds by postgrey-1.27 at vger.kernel.org; Fri, 06 Nov 2020 13:45:55 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604688354;
        s=strato-dkim-0002; d=aepfle.de;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=hHXqYa5IRM8lVFD4kWWag37WTKepOwX6VuBzNs094kA=;
        b=HYAN/n3co0rz9nBnGT8+Pq0asTMkLwXP6Wc58r072c/NQIAAgAsz4EewzmY7lYXIp7
        5dEwgjQUXLstOeOUh9D2WSK9xrrtxw2Sn/+hC38VGX08bVJ2tmxWFf25FldkIuzox2R3
        GWZYXgJHp6O3diSESNQZBqqTJpXZtOn4jKK7croC4KeWFbbGiFk0Iee+cSx6xS5Or0MV
        VGdDFVbEkBVkNkefwRQZ1SWHq4NZ05xVAEeYSAoBBm+mi1q/E6jmAJ45gETrwk3aMTzP
        pLyPauylqRfSnyGgAxAPQv/tkA/Q5reEQ+PzyMin61DcWsbJigAUhQcGP5wwlEzFlLNE
        AG7A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GhJjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id j03b7dwA6Idp358
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 6 Nov 2020 19:39:51 +0100 (CET)
From:   Olaf Hering <olaf@aepfle.de>
To:     linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Olaf Hering <olaf@aepfle.de>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v1] video: hyperv_fb: include vmalloc.h
Date:   Fri,  6 Nov 2020 19:39:41 +0100
Message-Id: <20201106183941.9751-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

hvfb_getmem uses vzalloc, therefore vmalloc.h should be included.

Fixes commit d21987d709e807ba7bbf47044deb56a3c02e8be4 ("video: hyperv:
hyperv_fb: Support deferred IO for Hyper-V frame buffer driver")

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 drivers/video/fbdev/hyperv_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index e36fb1a0ecdb..5bc86f481a78 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -47,6 +47,7 @@
 
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/vmalloc.h>
 #include <linux/init.h>
 #include <linux/completion.h>
 #include <linux/fb.h>
