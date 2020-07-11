Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A28621C3D8
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jul 2020 13:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgGKLI0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 11 Jul 2020 07:08:26 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:62854 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgGKLI0 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 11 Jul 2020 07:08:26 -0400
Received: from fsav305.sakura.ne.jp (fsav305.sakura.ne.jp [153.120.85.136])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06BB87EO027033;
        Sat, 11 Jul 2020 20:08:07 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav305.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav305.sakura.ne.jp);
 Sat, 11 Jul 2020 20:08:06 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav305.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06BB80rN027005
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Sat, 11 Jul 2020 20:08:06 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: fbconsole needs more parameter validations.
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     DRI <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        linux-kernel@vger.kernel.org,
        syzbot <syzbot+017265e8553724e514e8@syzkaller.appspotmail.com>
References: <20200710055329.3759-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <b1e7dd6a-fc22-bba8-0abb-d3e779329bce@i-love.sakura.ne.jp>
 <20200710105637.GB1232395@kroah.com>
 <f80527f4-ffb2-69ef-ebd4-3de92cacfa17@i-love.sakura.ne.jp>
Message-ID: <189fc902-db7c-9886-cc31-c0348435303a@i-love.sakura.ne.jp>
Date:   Sat, 11 Jul 2020 20:08:00 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f80527f4-ffb2-69ef-ebd4-3de92cacfa17@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 2020/07/11 15:16, Tetsuo Handa wrote:
> On 2020/07/10 19:56, Greg Kroah-Hartman wrote:
>> Where is the over/underflow happening here when we set a size to be so
>> small?  We should bound the size somewhere, and as you show, that's not
>> really working properly, right?
> 
> It is bit_clear_margins() where integer underflow is happening (4294966497 == 1 - 100 * 8),
> but the cause of this problem seems to be fbcon_startup() or vc_do_resize().
> 

A possible cause is that vc_resize(vc, 0, 0) fails to set vc->vc_cols == vc->vc_rows == 0
because of

  new_cols = (cols ? cols : vc->vc_cols);
  new_rows = (lines ? lines : vc->vc_rows);

exception. I don't know how user program referenced as

  /*
   * Change # of rows and columns (0 means unchanged/the size of fg_console)
   * [this is to be used together with some user program
   * like resize that changes the hardware videomode]
   */
  #define VC_RESIZE_MAXCOL (32767)
  #define VC_RESIZE_MAXROW (32767)

is utilizing this exception (this code predates the git repository). But since I
don't think that a console with 0 column and/or 0 row makes sense, the real root
cause might be that fb_set_var() fails to reject too small var.xres value for
keeping cols > 0 and too small var.yres value for keeping lines > 0.

Regardless, making "struct fbcon_ops"->clear_margins no-op when integer underflow
is detected (like below diff) helps avoiding crash. Can we apply this handy
protection assuming that vc->vc_cols * vc->vc_font.width and
vc->vc_rows * vc->vc_font.heigh do not cause integer overflow?

 drivers/video/fbdev/core/bitblit.c   |    4 ++--
 drivers/video/fbdev/core/fbcon_ccw.c |    4 ++--
 drivers/video/fbdev/core/fbcon_cw.c  |    4 ++--
 drivers/video/fbdev/core/fbcon_ud.c  |    4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index ca935c09a261..35ebeeccde4d 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -216,7 +216,7 @@ static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
 	region.color = color;
 	region.rop = ROP_COPY;
 
-	if (rw && !bottom_only) {
+	if ((int) rw > 0 && !bottom_only) {
 		region.dx = info->var.xoffset + rs;
 		region.dy = 0;
 		region.width = rw;
@@ -224,7 +224,7 @@ static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
 		info->fbops->fb_fillrect(info, &region);
 	}
 
-	if (bh) {
+	if ((int) bh > 0) {
 		region.dx = info->var.xoffset;
 		region.dy = info->var.yoffset + bs;
 		region.width = rs;
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index dfa9a8aa4509..78f3a5621478 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -201,7 +201,7 @@ static void ccw_clear_margins(struct vc_data *vc, struct fb_info *info,
 	region.color = color;
 	region.rop = ROP_COPY;
 
-	if (rw && !bottom_only) {
+	if ((int) rw > 0 && !bottom_only) {
 		region.dx = 0;
 		region.dy = info->var.yoffset;
 		region.height = rw;
@@ -209,7 +209,7 @@ static void ccw_clear_margins(struct vc_data *vc, struct fb_info *info,
 		info->fbops->fb_fillrect(info, &region);
 	}
 
-	if (bh) {
+	if ((int) bh > 0) {
 		region.dx = info->var.xoffset + bs;
 		region.dy = 0;
                 region.height = info->var.yres_virtual;
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index ce08251bfd38..fd098ff17574 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -184,7 +184,7 @@ static void cw_clear_margins(struct vc_data *vc, struct fb_info *info,
 	region.color = color;
 	region.rop = ROP_COPY;
 
-	if (rw && !bottom_only) {
+	if ((int) rw > 0 && !bottom_only) {
 		region.dx = 0;
 		region.dy = info->var.yoffset + rs;
 		region.height = rw;
@@ -192,7 +192,7 @@ static void cw_clear_margins(struct vc_data *vc, struct fb_info *info,
 		info->fbops->fb_fillrect(info, &region);
 	}
 
-	if (bh) {
+	if ((int) bh > 0) {
 		region.dx = info->var.xoffset;
 		region.dy = info->var.yoffset;
                 region.height = info->var.yres;
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index 1936afc78fec..e165a3fad29a 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -231,7 +231,7 @@ static void ud_clear_margins(struct vc_data *vc, struct fb_info *info,
 	region.color = color;
 	region.rop = ROP_COPY;
 
-	if (rw && !bottom_only) {
+	if ((int) rw > 0 && !bottom_only) {
 		region.dy = 0;
 		region.dx = info->var.xoffset;
 		region.width  = rw;
@@ -239,7 +239,7 @@ static void ud_clear_margins(struct vc_data *vc, struct fb_info *info,
 		info->fbops->fb_fillrect(info, &region);
 	}
 
-	if (bh) {
+	if ((int) bh > 0) {
 		region.dy = info->var.yoffset;
 		region.dx = info->var.xoffset;
                 region.height  = bh;

