Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5085D2327B1
	for <lists+linux-fbdev@lfdr.de>; Thu, 30 Jul 2020 00:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgG2WrC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 29 Jul 2020 18:47:02 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:53900 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgG2WrC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 29 Jul 2020 18:47:02 -0400
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06TMkhCG049026;
        Thu, 30 Jul 2020 07:46:43 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp);
 Thu, 30 Jul 2020 07:46:43 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06TMkhGb049020
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Thu, 30 Jul 2020 07:46:43 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: [PATCH] fbmem: pull fbcon_update_vcs() out of fb_set_var()
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        syzbot <syzbot+c37a14770d51a085a520@syzkaller.appspotmail.com>
References: <1596000620-4075-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
 <CAKMK7uHeteS2+rKrZKrAM+zQO==hAX0XaVc9JfHPsdLTCtzKOw@mail.gmail.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <a3bb6544-064d-54a1-1215-d92188cb4209@i-love.sakura.ne.jp>
Date:   Thu, 30 Jul 2020 07:46:40 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHeteS2+rKrZKrAM+zQO==hAX0XaVc9JfHPsdLTCtzKOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

syzbot is reporting OOB read bug in vc_do_resize() [1] caused by memcpy()
based on outdated old_{rows,row_size} values, for resize_screen() can
recurse into vc_do_resize() which changes vc->vc_{cols,rows} that outdates
old_{rows,row_size} values which were saved before calling resize_screen().

Daniel Vetter explained that resize_screen() should not recurse into
fbcon_update_vcs() path due to FBINFO_MISC_USEREVENT being still set
when calling resize_screen().

Instead of masking FBINFO_MISC_USEREVENT before calling fbcon_update_vcs(),
we can remove FBINFO_MISC_USEREVENT by calling fbcon_update_vcs() only if
fb_set_var() returned 0. This change assumes that it is harmless to call
fbcon_update_vcs() when fb_set_var() returned 0 without reaching
fb_notifier_call_chain().

[1] https://syzkaller.appspot.com/bug?id=c70c88cfd16dcf6e1d3c7f0ab8648b3144b5b25e

Reported-and-tested-by: syzbot <syzbot+c37a14770d51a085a520@syzkaller.appspotmail.com>
Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/video/fbdev/core/fbmem.c   | 8 ++------
 drivers/video/fbdev/core/fbsysfs.c | 4 ++--
 drivers/video/fbdev/ps3fb.c        | 4 ++--
 include/linux/fb.h                 | 2 --
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 30e73ec..da7c88f 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -957,7 +957,6 @@ static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
 int
 fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 {
-	int flags = info->flags;
 	int ret = 0;
 	u32 activate;
 	struct fb_var_screeninfo old_var;
@@ -1052,9 +1051,6 @@ static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
 	event.data = &mode;
 	fb_notifier_call_chain(FB_EVENT_MODE_CHANGE, &event);
 
-	if (flags & FBINFO_MISC_USEREVENT)
-		fbcon_update_vcs(info, activate & FB_ACTIVATE_ALL);
-
 	return 0;
 }
 EXPORT_SYMBOL(fb_set_var);
@@ -1105,9 +1101,9 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 			return -EFAULT;
 		console_lock();
 		lock_fb_info(info);
-		info->flags |= FBINFO_MISC_USEREVENT;
 		ret = fb_set_var(info, &var);
-		info->flags &= ~FBINFO_MISC_USEREVENT;
+		if (!ret)
+			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
 		unlock_fb_info(info);
 		console_unlock();
 		if (!ret && copy_to_user(argp, &var, sizeof(var)))
diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index d54c88f..65dae05 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -91,9 +91,9 @@ static int activate(struct fb_info *fb_info, struct fb_var_screeninfo *var)
 
 	var->activate |= FB_ACTIVATE_FORCE;
 	console_lock();
-	fb_info->flags |= FBINFO_MISC_USEREVENT;
 	err = fb_set_var(fb_info, var);
-	fb_info->flags &= ~FBINFO_MISC_USEREVENT;
+	if (!err)
+		fbcon_update_vcs(fb_info, var->activate & FB_ACTIVATE_ALL);
 	console_unlock();
 	if (err)
 		return err;
diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index 9df78fb..4b4a99f 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -824,12 +824,12 @@ static int ps3fb_ioctl(struct fb_info *info, unsigned int cmd,
 				var = info->var;
 				fb_videomode_to_var(&var, vmode);
 				console_lock();
-				info->flags |= FBINFO_MISC_USEREVENT;
 				/* Force, in case only special bits changed */
 				var.activate |= FB_ACTIVATE_FORCE;
 				par->new_mode_id = val;
 				retval = fb_set_var(info, &var);
-				info->flags &= ~FBINFO_MISC_USEREVENT;
+				if (!retval)
+					fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
 				console_unlock();
 			}
 			break;
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 3b4b2f0..b11eb02 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -400,8 +400,6 @@ struct fb_tile_ops {
 #define FBINFO_HWACCEL_YPAN		0x2000 /* optional */
 #define FBINFO_HWACCEL_YWRAP		0x4000 /* optional */
 
-#define FBINFO_MISC_USEREVENT          0x10000 /* event request
-						  from userspace */
 #define FBINFO_MISC_TILEBLITTING       0x20000 /* use tile blitting */
 
 /* A driver may set this flag to indicate that it does want a set_par to be
-- 
1.8.3.1


