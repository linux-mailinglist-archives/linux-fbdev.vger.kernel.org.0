Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11345279D29
	for <lists+linux-fbdev@lfdr.de>; Sun, 27 Sep 2020 02:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgI0AZN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 26 Sep 2020 20:25:13 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:51394 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgI0AZM (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 26 Sep 2020 20:25:12 -0400
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08R0P9TR053146;
        Sun, 27 Sep 2020 09:25:09 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Sun, 27 Sep 2020 09:25:09 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08R0P8G8053139
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Sun, 27 Sep 2020 09:25:08 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: KASAN: use-after-free Read in bit_putcs
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
        b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, deller@gmx.de,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        syzkaller-bugs@googlegroups.com,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <000000000000226d3f05b02dd607@google.com>
 <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
Message-ID: <47907f77-b14b-b433-45c6-a315193f0c1a@i-love.sakura.ne.jp>
Date:   Sun, 27 Sep 2020 09:25:07 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 2020/09/27 4:39, Peilin Ye wrote:
> On Sun, Sep 27, 2020 at 01:25:17AM +0900, Tetsuo Handa wrote:
>> Since I don't know the meaning of "struct vt_consize"->v_clin (which is commented
>> with "/* number of pixel rows per character */" but does it mean font size ?),
>> I don't know why we can assign that value to vcp->vc_font.height via
>>
>> 	if (v.v_clin)
>> 		vcp->vc_font.height = v.v_clin;
>>
>> in vt_resizex(). While ioctl(PIO_FONT) needs to pass vc->vc_sw->con_font_set()
>> check in con_font_set(), ioctl(VT_RESIZEX) does not pass it in vt_resizex()...
>>
>> Since this problem does not happen if I remove
>>
>> 	if (v.v_clin)
>> 		vcp->vc_font.height = v.v_clin;
> 
> Hi Tetsuo!
> 
>>  from vt_resizex(), I guess that some variables are getting confused by change
>> of vc->vc_font.height ...
> 
> Yes, see bit_putcs():
> 
> (drivers/video/fbdev/core/bitblit.c)
> static void bit_putcs(struct vc_data *vc, struct fb_info *info,
> 		      const unsigned short *s, int count, int yy, int xx,
> 		      int fg, int bg)
> {
> 	struct fb_image image;
> 	u32 width = DIV_ROUND_UP(vc->vc_font.width, 8);
> 	u32 cellsize = width * vc->vc_font.height;
> 	    ^^^^^^^^		   ^^^^^^^^^^^^^^
> 
> `cellsize` is now too large. Later, in bit_putcs_aligned():
> 
> 	while (cnt--) {
> 		src = vc->vc_font.data + (scr_readw(s++)&
> 					  charmask)*cellsize;
> 						    ^^^^^^^^
> 
> `src` goes out of bounds of the data buffer. At first glance I guess
> this is an out-of-bound read reported as a use-after-free read? The
> crashlog says:

How this OOB access is reported varies.

> 
> To resolve this out-of-bound issue for now, I think the easiest way
> is to add a range check in bit_putcs(), or bit_putcs_aligned().
> 
> ...but yeah, that `VT_RESIZEX` ioctl looks really buggy, and is already
> causing more issues:

At least, since not all fonts have height == 32 (e.g. font_vga_8x8 is height == 8),
allow changing vc->vc_font.height with only

	if (v.v_clin > 32)
		return -EINVAL;

validation in VT_RESIZEX looks wrong. This needs more validations.



By the way, can we find a user of VT_RESIZEX? As far as I googled with "VT_RESIZEX",
I couldn't find a userspace program; only explanation of VT_RESIZEX and kernel patches
related to VT_RESIZEX are found. Also, while console_ioctl(4) man page says

  Any parameter may be set to zero, indicating "no change"

, the assignment

	if (!v.v_vlin)
		v.v_vlin = vc->vc_scan_lines;

changes the meaning to

   If v_vlin parameter is set to zero, the value for associated console is copied
   to each console (instead of preserving current value for that console)

. Maybe for now we can try this (effectively making VT_RESIZEX == VT_RESIZE) ?

 vt_ioctl.c |   57 ++++++++++-----------------------------------------------
 1 file changed, 10 insertions(+), 47 deletions(-)

diff --git a/drivers/tty/vt/vt_ioctl.c b/drivers/tty/vt/vt_ioctl.c
index a4e520bdd521..bc33938e2f20 100644
--- a/drivers/tty/vt/vt_ioctl.c
+++ b/drivers/tty/vt/vt_ioctl.c
@@ -773,58 +773,21 @@ static int vt_resizex(struct vc_data *vc, struct vt_consize __user *cs)
 	if (copy_from_user(&v, cs, sizeof(struct vt_consize)))
 		return -EFAULT;
 
-	/* FIXME: Should check the copies properly */
-	if (!v.v_vlin)
-		v.v_vlin = vc->vc_scan_lines;
-
-	if (v.v_clin) {
-		int rows = v.v_vlin / v.v_clin;
-		if (v.v_rows != rows) {
-			if (v.v_rows) /* Parameters don't add up */
-				return -EINVAL;
-			v.v_rows = rows;
-		}
-	}
-
-	if (v.v_vcol && v.v_ccol) {
-		int cols = v.v_vcol / v.v_ccol;
-		if (v.v_cols != cols) {
-			if (v.v_cols)
-				return -EINVAL;
-			v.v_cols = cols;
-		}
-	}
-
-	if (v.v_clin > 32)
-		return -EINVAL;
+	if (v.v_vlin)
+		pr_info_once("\"struct vt_consize\"->v_vlin is ignored. Please report if you need this.\n");
+	if (v.v_clin)
+		pr_info_once("\"struct vt_consize\"->v_clin is ignored. Please report if you need this.\n");
 
+	console_lock();
 	for (i = 0; i < MAX_NR_CONSOLES; i++) {
-		struct vc_data *vcp;
+		vc = vc_cons[i].d;
 
-		if (!vc_cons[i].d)
-			continue;
-		console_lock();
-		vcp = vc_cons[i].d;
-		if (vcp) {
-			int ret;
-			int save_scan_lines = vcp->vc_scan_lines;
-			int save_font_height = vcp->vc_font.height;
-
-			if (v.v_vlin)
-				vcp->vc_scan_lines = v.v_vlin;
-			if (v.v_clin)
-				vcp->vc_font.height = v.v_clin;
-			vcp->vc_resize_user = 1;
-			ret = vc_resize(vcp, v.v_cols, v.v_rows);
-			if (ret) {
-				vcp->vc_scan_lines = save_scan_lines;
-				vcp->vc_font.height = save_font_height;
-				console_unlock();
-				return ret;
-			}
+		if (vc) {
+			vc->vc_resize_user = 1;
+			vc_resize(vc, v.v_cols, v.v_rows);
 		}
-		console_unlock();
 	}
+	console_unlock();
 
 	return 0;
 }

