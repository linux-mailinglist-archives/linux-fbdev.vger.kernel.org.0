Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB547427F60
	for <lists+linux-fbdev@lfdr.de>; Sun, 10 Oct 2021 08:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhJJGom (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 10 Oct 2021 02:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhJJGol (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 10 Oct 2021 02:44:41 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50033C061570;
        Sat,  9 Oct 2021 23:42:43 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 187so11897504pfc.10;
        Sat, 09 Oct 2021 23:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=/fo+SL59BqhBp8OwXWZaQWCV9nYu75S/chQz3wujueI=;
        b=ZgFYjNHVIn8b1F/37R31LzGFz1t2iuolTYtbKonSY1vvYElgPlb7XncvrVoW1UFuYr
         T4Nv+62Z7y7ERSUpvHvmin3wIn0BJBNNi3eyGIDKBKXaCceSo6JwIVjDceZDT9QqI9px
         hz50DraMhIGWlN3GDw8gKAF3L85GQQVoCbcOlQ+dFcaBlLF9BeNs8g7Ggy53+CTou91u
         qmKZq2u35eDB5Q3XwclmRRluSqlYasoJ0GooeEAucKSPcFW7zg/mbhqFcegXURHa48xp
         iKWHx5FqYz2UquuiItB5fRLtFKRS6bU726w7v1ngB7UYuenYClbSSBGyAghjBGvfXRO8
         OpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/fo+SL59BqhBp8OwXWZaQWCV9nYu75S/chQz3wujueI=;
        b=0HiQ5L38skp83VFyDFIwYBC/vX50xJ155Ngw+ZzKSsEHbBQVwsdWZJCxFi9Rs4und4
         lec/QKWtGUoKdaW7Nv7gimbOI38Vytpum6M+OpYskCBN8WQHFrLwRcVBbJX8qKKlHvff
         IFh4kSXJvp09RSgCl/rJhXOjeD8mTOWcsT1Lq6iBiiW192va8ssFF9AmQXQzSETA1Dcf
         Sx9bMUCXg2NROSR2v6BS2TgBON2Ta0F+SYA218PL49Vjn5OLVpNu7CZnsKzJKQy+0pTk
         W807EeNmZJhlwvtQuJGzUUFxwXEeRLe0IQAJz3qcqQFb0QwQr6vt5kJZzlBhqscTYFWm
         Fp1A==
X-Gm-Message-State: AOAM530Z7ULJ8OI0h9GyXJCM1+b0lY6cq5whZ8m5WGONlb/6QoJfK4o3
        vyqTnRiYj2VfpJIcxbkm8Q==
X-Google-Smtp-Source: ABdhPJwV/WF678MkNnZwGi1mVyKfzHnZ5lAckmRMyF9WU/RzTeI724ojh+nwcm48h7sCrxFtqfxqkg==
X-Received: by 2002:a63:7746:: with SMTP id s67mr2983525pgc.225.1633848162816;
        Sat, 09 Oct 2021 23:42:42 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
        by smtp.gmail.com with ESMTPSA id t3sm2553823pgu.87.2021.10.09.23.42.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 09 Oct 2021 23:42:42 -0700 (PDT)
From:   Zheyu Ma <zheyuma97@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zheyu Ma <zheyuma97@gmail.com>
Subject: [PATCH 2/2] fbdev: fbmem: Fix double free of 'fb_info->pixmap.addr'
Date:   Sun, 10 Oct 2021 06:42:28 +0000
Message-Id: <1633848148-29747-1-git-send-email-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

savagefb and some other drivers call kfree to free 'info->pixmap.addr'
even after calling unregister_framebuffer, which may cause double free.

Fix this by setting 'fb_info->pixmap.addr' to NULL after kfree in
unregister_framebuffer.

The following log reveals it:

[   37.318872] BUG: KASAN: double-free or invalid-free in kfree+0x13e/0x290
[   37.319369]
[   37.320803] Call Trace:
[   37.320992]  dump_stack_lvl+0xa8/0xd1
[   37.321274]  print_address_description+0x87/0x3b0
[   37.321632]  ? kfree+0x13e/0x290
[   37.321879]  ? kfree+0x13e/0x290
[   37.322126]  ? kfree+0x13e/0x290
[   37.322374]  kasan_report_invalid_free+0x58/0x90
[   37.322724]  ____kasan_slab_free+0x123/0x140
[   37.323049]  __kasan_slab_free+0x11/0x20
[   37.323347]  slab_free_freelist_hook+0x81/0x150
[   37.323689]  ? savagefb_remove+0xa1/0xc0 [savagefb]
[   37.324066]  kfree+0x13e/0x290
[   37.324304]  savagefb_remove+0xa1/0xc0 [savagefb]
[   37.324655]  pci_device_remove+0xa9/0x250
[   37.324959]  ? pci_device_probe+0x7d0/0x7d0
[   37.325273]  device_release_driver_internal+0x4f7/0x7a0
[   37.325666]  driver_detach+0x1e8/0x2c0
[   37.325952]  bus_remove_driver+0x134/0x290
[   37.326262]  ? sysfs_remove_groups+0x97/0xb0
[   37.326584]  driver_unregister+0x77/0xa0
[   37.326883]  pci_unregister_driver+0x2c/0x1c0
[   37.336124]
[   37.336245] Allocated by task 5465:
[   37.336507]  ____kasan_kmalloc+0xb5/0xe0
[   37.336801]  __kasan_kmalloc+0x9/0x10
[   37.337069]  kmem_cache_alloc_trace+0x12b/0x220
[   37.337405]  register_framebuffer+0x3f3/0xa00
[   37.337731]  foo_register_framebuffer+0x3b/0x50 [savagefb]
[   37.338136]
[   37.338255] Freed by task 5475:
[   37.338492]  kasan_set_track+0x3d/0x70
[   37.338774]  kasan_set_free_info+0x23/0x40
[   37.339081]  ____kasan_slab_free+0x10b/0x140
[   37.339399]  __kasan_slab_free+0x11/0x20
[   37.339694]  slab_free_freelist_hook+0x81/0x150
[   37.340034]  kfree+0x13e/0x290
[   37.340267]  do_unregister_framebuffer+0x21c/0x3d0
[   37.340624]  unregister_framebuffer+0x23/0x40
[   37.340950]  savagefb_remove+0x45/0xc0 [savagefb]
[   37.341302]  pci_device_remove+0xa9/0x250
[   37.341603]  device_release_driver_internal+0x4f7/0x7a0
[   37.341990]  driver_detach+0x1e8/0x2c0
[   37.342272]  bus_remove_driver+0x134/0x290
[   37.342577]  driver_unregister+0x77/0xa0
[   37.342873]  pci_unregister_driver+0x2c/0x1c0
[   37.343196]  cleanup_module+0x15/0x1c [savagefb]
[   37.343543]  __se_sys_delete_module+0x398/0x490
[   37.343881]  __x64_sys_delete_module+0x56/0x60
[   37.344221]  do_syscall_64+0x4d/0xc0
[   37.344492]  entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/core/fbmem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 7420d2c16e47..b81b0e37daed 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1702,8 +1702,10 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
 {
 	unlink_framebuffer(fb_info);
 	if (fb_info->pixmap.addr &&
-	    (fb_info->pixmap.flags & FB_PIXMAP_DEFAULT))
+	    (fb_info->pixmap.flags & FB_PIXMAP_DEFAULT)) {
 		kfree(fb_info->pixmap.addr);
+		fb_info->pixmap.addr = NULL;
+	}
 	fb_destroy_modelist(&fb_info->modelist);
 	registered_fb[fb_info->node] = NULL;
 	num_registered_fb--;
-- 
2.17.6

