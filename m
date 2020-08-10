Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C56C240877
	for <lists+linux-fbdev@lfdr.de>; Mon, 10 Aug 2020 17:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgHJPVC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 10 Aug 2020 11:21:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:51696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728058AbgHJPU7 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 10 Aug 2020 11:20:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8A7620656;
        Mon, 10 Aug 2020 15:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597072858;
        bh=OzsmA25owFxj0rqitKR2MBowKesqp44jQTh/7yr6E94=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W4b8ZO7SnvBrljS26BfyNmTyLvtQYcw7ZaT6K4rJY1QGIR5HJ1B8Skwtny30T4C6v
         VjgctvcS4ur+2wZmbxnq+skvIY4foVkW33gHSYbS3NvxeyY+l7fN7KVE+eGPKS3PIo
         r9rid14XhNL7oloxc7One0HFiSHybLS1WRspV4vY=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org,
        =?UTF-8?q?=E5=BC=A0=E4=BA=91=E6=B5=B7?= <zhangyunhai@nsfocus.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Kyungtae Kim <kt0755@gmail.com>, linux-fbdev@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Solar Designer <solar@openwall.com>,
        "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
        Anthony Liguori <aliguori@amazon.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 5.8 23/38] vgacon: Fix for missing check in scrollback handling
Date:   Mon, 10 Aug 2020 17:19:13 +0200
Message-Id: <20200810151805.039678187@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200810151803.920113428@linuxfoundation.org>
References: <20200810151803.920113428@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Yunhai Zhang <zhangyunhai@nsfocus.com>

commit ebfdfeeae8c01fcb2b3b74ffaf03876e20835d2d upstream.

vgacon_scrollback_update() always leaves enbough room in the scrollback
buffer for the next call, but if the console size changed that room
might not actually be enough, and so we need to re-check.

The check should be in the loop since vgacon_scrollback_cur->tail is
updated in the loop and count may be more than 1 when triggered by CSI M,
as Jiri's PoC:
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <fcntl.h>

int main(int argc, char** argv)
{
        int fd = open("/dev/tty1", O_RDWR);
        unsigned short size[3] = {25, 200, 0};
        ioctl(fd, 0x5609, size); // VT_RESIZE

        write(fd, "\e[1;1H", 6);
        for (int i = 0; i < 30; i++)
                write(fd, "\e[10M", 5);
}

It leads to various crashes as vgacon_scrollback_update writes out of
the buffer:
 BUG: unable to handle page fault for address: ffffc900001752a0
 #PF: supervisor write access in kernel mode
 #PF: error_code(0x0002) - not-present page
 RIP: 0010:mutex_unlock+0x13/0x30
...
 Call Trace:
  n_tty_write+0x1a0/0x4d0
  tty_write+0x1a0/0x2e0

Or to KASAN reports:
BUG: KASAN: slab-out-of-bounds in vgacon_scroll+0x57a/0x8ed

This fixes CVE-2020-14331.

Reported-by: 张云海 <zhangyunhai@nsfocus.com>
Reported-by: Yang Yingliang <yangyingliang@huawei.com>
Reported-by: Kyungtae Kim <kt0755@gmail.com>
Fixes: 15bdab959c9b ([PATCH] vgacon: Add support for soft scrollback)
Cc: stable@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Solar Designer <solar@openwall.com>
Cc: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Anthony Liguori <aliguori@amazon.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Jiri Slaby <jirislaby@kernel.org>
Signed-off-by: Yunhai Zhang <zhangyunhai@nsfocus.com>
Link: https://lore.kernel.org/r/9fb43895-ca91-9b07-ebfd-808cf854ca95@nsfocus.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/video/console/vgacon.c |    4 ++++
 1 file changed, 4 insertions(+)

--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -251,6 +251,10 @@ static void vgacon_scrollback_update(str
 	p = (void *) (c->vc_origin + t * c->vc_size_row);
 
 	while (count--) {
+		if ((vgacon_scrollback_cur->tail + c->vc_size_row) >
+		    vgacon_scrollback_cur->size)
+			vgacon_scrollback_cur->tail = 0;
+
 		scr_memcpyw(vgacon_scrollback_cur->data +
 			    vgacon_scrollback_cur->tail,
 			    p, c->vc_size_row);


