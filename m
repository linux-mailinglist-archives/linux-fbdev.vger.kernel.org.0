Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6788708341
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 May 2023 15:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjERNyY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 18 May 2023 09:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjERNyX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 18 May 2023 09:54:23 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 7CCED10D8
        for <linux-fbdev@vger.kernel.org>; Thu, 18 May 2023 06:54:20 -0700 (PDT)
Received: (qmail 913917 invoked by uid 1000); 18 May 2023 09:54:19 -0400
Date:   Thu, 18 May 2023 09:54:19 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Helge Deller <deller@gmx.de>
Cc:     syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bernie@plugable.com,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in
 dlfb_submit_urb/usb_submit_urb (2)
Message-ID: <4cd17511-2b60-4c37-baf3-c477cf6d1761@rowland.harvard.edu>
References: <0000000000004a222005fbf00461@google.com>
 <ZGXVANMhn5j/jObU@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGXVANMhn5j/jObU@ls3530>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, May 18, 2023 at 09:34:24AM +0200, Helge Deller wrote:
> * syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>:
> > syzbot found the following issue on:
> >
> > HEAD commit:    a4422ff22142 usb: typec: qcom: Add Qualcomm PMIC Type-C dr..
> > git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > console output: https://syzkaller.appspot.com/x/log.txt?x=15245566280000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=2414a945e4542ec1
> > dashboard link: https://syzkaller.appspot.com/bug?extid=0e22d63dcebb802b9bc8
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1720fd3a280000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=171a73ea280000
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/414817142fb7/disk-a4422ff2.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/448dba0d344e/vmlinux-a4422ff2.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/d0ad9fe848e2/bzImage-a4422ff2.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com
> >
> > usb 1-1: Read EDID byte 0 failed: -71
> > usb 1-1: Unable to get valid EDID from device/display
> > ------------[ cut here ]------------
> > usb 1-1: BOGUS urb xfer, pipe 3 != type 1
> > WARNING: CPU: 0 PID: 9 at drivers/usb/core/urb.c:504 usb_submit_urb+0xed6/0x1880 drivers/usb/core/urb.c:504
> > Modules linked in:
> > CPU: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.4.0-rc1-syzkaller-00016-ga4422ff22142 #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/28/2023
> > Workqueue: usb_hub_wq hub_event
> > RIP: 0010:usb_submit_urb+0xed6/0x1880 drivers/usb/core/urb.c:504
> > Code: 7c 24 18 e8 7c dc 5a fd 48 8b 7c 24 18 e8 42 ca 0b ff 41 89 d8 44 89 e1 4c 89 ea 48 89 c6 48 c7 c7 60 34 cc 86 e8 0a fa 25 fd <0f> 0b e9 58 f8 ff ff e8 4e dc 5a fd 48 81 c5 b8 05 00 00 e9 84 f7
> > RSP: 0018:ffffc9000009ed48 EFLAGS: 00010282
> > RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> > RDX: ffff888103650000 RSI: ffffffff81163677 RDI: 0000000000000001
> > RBP: ffff88810cb32940 R08: 0000000000000001 R09: 0000000000000000
> > R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000003
> > R13: ffff88810cf426b8 R14: 0000000000000003 R15: ffff888104272100
> > FS:  0000000000000000(0000) GS:ffff8881f6600000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000562147be3b70 CR3: 0000000110380000 CR4: 00000000003506f0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  <TASK>
> >  dlfb_submit_urb+0x92/0x180 drivers/video/fbdev/udlfb.c:1980
> >  dlfb_set_video_mode+0x21f0/0x2950 drivers/video/fbdev/udlfb.c:315
> >  dlfb_ops_set_par+0x2a7/0x8d0 drivers/video/fbdev/udlfb.c:1111
> >  dlfb_usb_probe+0x149a/0x2710 drivers/video/fbdev/udlfb.c:1743
> >  usb_probe_interface+0x30f/0x960 drivers/usb/core/driver.c:396
> >  call_driver_probe drivers/base/dd.c:579 [inline]
> >  really_probe+0x240/0xca0 drivers/base/dd.c:658
> >  __driver_probe_device+0x1df/0x4b0 drivers/base/dd.c:800
> >  driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:830
> >  __device_attach_driver+0x1d4/0x2e0 drivers/base/dd.c:958
> >  bus_for_each_drv+0x149/0x1d0 drivers/base/bus.c:457
> >  __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
> >  bus_probe_device+0x17c/0x1c0 drivers/base/bus.c:532
> >  device_add+0x112d/0x1a40 drivers/base/core.c:3625
> >  usb_set_configuration+0x1196/0x1bc0 drivers/usb/core/message.c:2211
> >  usb_generic_driver_probe+0xcf/0x130 drivers/usb/core/generic.c:238
> >  usb_probe_device+0xd8/0x2c0 drivers/usb/core/driver.c:293
> >  call_driver_probe drivers/base/dd.c:579 [inline]
> >  really_probe+0x240/0xca0 drivers/base/dd.c:658
> >  __driver_probe_device+0x1df/0x4b0 drivers/base/dd.c:800
> >  driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:830
> >  __device_attach_driver+0x1d4/0x2e0 drivers/base/dd.c:958
> >  bus_for_each_drv+0x149/0x1d0 drivers/base/bus.c:457
> >  __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
> >  bus_probe_device+0x17c/0x1c0 drivers/base/bus.c:532
> >  device_add+0x112d/0x1a40 drivers/base/core.c:3625
> >  usb_new_device+0xcb2/0x19d0 drivers/usb/core/hub.c:2575
> >  hub_port_connect drivers/usb/core/hub.c:5407 [inline]
> >  hub_port_connect_change drivers/usb/core/hub.c:5551 [inline]
> >  port_event drivers/usb/core/hub.c:5711 [inline]
> >  hub_event+0x2e3d/0x4ed0 drivers/usb/core/hub.c:5793
> >  process_one_work+0x99a/0x15e0 kernel/workqueue.c:2405
> >  worker_thread+0x67d/0x10c0 kernel/workqueue.c:2552
> >  kthread+0x344/0x440 kernel/kthread.c:379
> >  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
> 
> I think this is an informational warning from the USB stack,

It is not informational.  It is a warning that the caller has a bug.

> since the syzbot usb device doesn't behave as expected.
> 
> What happens with this patch applied?
> 
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> 
> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index 9f3c54032556..dd77b9e757da 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -501,7 +501,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
> 
>  	/* Check that the pipe's type matches the endpoint's type */
>  	if (usb_pipe_type_check(urb->dev, urb->pipe))
> -		dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
> +		printk("BOGUS urb xfer, pipe %x != type %x (hardware misbehaviour?)\n",
>  			usb_pipetype(urb->pipe), pipetypes[xfertype]);
> 
>  	/* Check against a simple/standard policy */

You can't fix a bug by changing the line that reports it from dev_WARN 
to printk!

In this case it looks like dlfb_usb_probe() or one of the routines it 
calls is wrong; it assumes that an endpoint has the expected type 
without checking.  More precisely, it thinks an endpoint is BULK when 
actually it is INTERRUPT.  That's what needs to be fixed.

Alan Stern
