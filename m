Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88FE233EA2
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jul 2020 07:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729523AbgGaFWk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 31 Jul 2020 01:22:40 -0400
Received: from nsfocus.com ([221.122.62.131]:46210 "HELO nsfocus.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with SMTP
        id S1729519AbgGaFWk (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 31 Jul 2020 01:22:40 -0400
Received: (qmail 7518 invoked from network); 31 Jul 2020 05:21:10 -0000
Received: from unknown (HELO ?192.168.7.10?) (221.122.62.131)
  by nsfocus.com with SMTP; 31 Jul 2020 05:21:10 -0000
Subject: Re: [PATCH] vgacon: fix out of bounds write to the scrollback buffer
From:   =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>
To:     Jiri Slaby <jirislaby@kernel.org>,
        Solar Designer <solar@openwall.com>
Cc:     b.zolnierkie@samsung.com,
        Yang Yingliang <yangyingliang@huawei.com>,
        Kyungtae Kim <kt0755@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg KH <greg@kroah.com>,
        "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
        Anthony Liguori <aliguori@amazon.com>,
        xiao.zhang@windriver.com,
        DRI devel <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>
References: <659f8dcf-7802-1ca1-1372-eb7fefd4d8f4@kernel.org>
 <dbcf2841-7718-2ba7-11e0-efa4b9de8de1@nsfocus.com>
Autocrypt: addr=zhangyunhai@nsfocus.com; keydata=
 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
Message-ID: <9fb43895-ca91-9b07-ebfd-808cf854ca95@nsfocus.com>
Date:   Fri, 31 Jul 2020 13:22:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <dbcf2841-7718-2ba7-11e0-efa4b9de8de1@nsfocus.com>
Content-Type: multipart/mixed;
 boundary="------------A9C3B6C833F3F675B326E38E"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is a multi-part message in MIME format.
--------------A9C3B6C833F3F675B326E38E
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit

Remove whitespace at EOL

On 2020/7/30 18:39, ���ƺ� wrote:
> Update the patch, add CC list, sample output, and Jiri's PoC.
> 
> On 2020/7/30 14:46, Jiri Slaby wrote:
>> Hi, OTOH, you should have CCed all the (public) lists.
> 


--------------A9C3B6C833F3F675B326E38E
Content-Type: text/plain; charset=UTF-8;
 name="0001-Fix-for-missing-check-in-vgacon-scrollback-handling.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-Fix-for-missing-check-in-vgacon-scrollback-handling.pat";
 filename*1="ch"

From ad143ede24ff4e61292cc9c96000100aacd97259 Mon Sep 17 00:00:00 2001
From: Yunhai Zhang <zhangyunhai@nsfocus.com>
Date: Tue, 28 Jul 2020 09:58:03 +0800
Subject: [PATCH] Fix for missing check in vgacon scrollback handling

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

Reported-and-debugged-by: 张云海 <zhangyunhai@nsfocus.com>
Reported-and-debugged-by: Yang Yingliang <yangyingliang@huawei.com>
Reported-by: Kyungtae Kim <kt0755@gmail.com>
Fixes: 15bdab959c9b ([PATCH] vgacon: Add support for soft scrollback)
Cc: stable@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg KH <greg@kroah.com>
Cc: Solar Designer <solar@openwall.com>
Cc: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Anthony Liguori <aliguori@amazon.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Yunhai Zhang <zhangyunhai@nsfocus.com>
---
 drivers/video/console/vgacon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 998b0de1812f..37b5711cd958 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -251,6 +251,10 @@ static void vgacon_scrollback_update(struct vc_data *c, int t, int count)
 	p = (void *) (c->vc_origin + t * c->vc_size_row);
 
 	while (count--) {
+		if ((vgacon_scrollback_cur->tail + c->vc_size_row) >
+		    vgacon_scrollback_cur->size)
+			vgacon_scrollback_cur->tail = 0;
+
 		scr_memcpyw(vgacon_scrollback_cur->data +
 			    vgacon_scrollback_cur->tail,
 			    p, c->vc_size_row);
-- 
2.25.1


--------------A9C3B6C833F3F675B326E38E--
