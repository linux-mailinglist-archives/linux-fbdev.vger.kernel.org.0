Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1D14054AF
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Sep 2021 15:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353696AbhIINBZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Sep 2021 09:01:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:59102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355115AbhIIMxq (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 9 Sep 2021 08:53:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 470E96324A;
        Thu,  9 Sep 2021 11:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631188673;
        bh=AybPZpErDiE8fAce0XBaZMb0g2M5ehifYSknZWnrXm0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sSnHRBOifpAybUgZGZ0oKiUSD3H0IoGedu1qQELpNma32dchNYHKAnHFNkeoE/jGW
         FIyiun1H0zkbqVpClCLoJqewbpsWZtIstJjpUP/k5VSijpc1cB2whar/DUVVxucSwx
         FldwiPppq4uwsE5kGUGD9hfC1A9I4AUFS1Xybjzn7eKFFZMNKqSL5Z7eIN15qtZfOg
         dAQjRHP2k6Jqz1f1qWejIBWal4IijMhl+P/d5H4FLFMePNUkOg4Ht66IvIp3wkqHHl
         FDbCz/NONcNnoAYwg+4EnxssYYI47TnpTDjxJO9pE1DBEFl3en3vFvIZxLuk8TLolj
         YivKgssoozrnQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Zheyu Ma <zheyuma97@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
        Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 4.19 21/74] video: fbdev: riva: Error out if 'pixclock' equals zero
Date:   Thu,  9 Sep 2021 07:56:33 -0400
Message-Id: <20210909115726.149004-21-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115726.149004-1-sashal@kernel.org>
References: <20210909115726.149004-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Zheyu Ma <zheyuma97@gmail.com>

[ Upstream commit f92763cb0feba247e0939ed137b495601fd072a5 ]

The userspace program could pass any values to the driver through
ioctl() interface. If the driver doesn't check the value of 'pixclock',
it may cause divide error.

Fix this by checking whether 'pixclock' is zero first.

The following log reveals it:

[   33.396850] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
[   33.396864] CPU: 5 PID: 11754 Comm: i740 Not tainted 5.14.0-rc2-00513-gac532c9bbcfb-dirty #222
[   33.396883] RIP: 0010:riva_load_video_mode+0x417/0xf70
[   33.396969] Call Trace:
[   33.396973]  ? debug_smp_processor_id+0x1c/0x20
[   33.396984]  ? tick_nohz_tick_stopped+0x1a/0x90
[   33.396996]  ? rivafb_copyarea+0x3c0/0x3c0
[   33.397003]  ? wake_up_klogd.part.0+0x99/0xd0
[   33.397014]  ? vprintk_emit+0x110/0x4b0
[   33.397024]  ? vprintk_default+0x26/0x30
[   33.397033]  ? vprintk+0x9c/0x1f0
[   33.397041]  ? printk+0xba/0xed
[   33.397054]  ? record_print_text.cold+0x16/0x16
[   33.397063]  ? __kasan_check_read+0x11/0x20
[   33.397074]  ? profile_tick+0xc0/0x100
[   33.397084]  ? __sanitizer_cov_trace_const_cmp4+0x24/0x80
[   33.397094]  ? riva_set_rop_solid+0x2a0/0x2a0
[   33.397102]  rivafb_set_par+0xbe/0x610
[   33.397111]  ? riva_set_rop_solid+0x2a0/0x2a0
[   33.397119]  fb_set_var+0x5bf/0xeb0
[   33.397127]  ? fb_blank+0x1a0/0x1a0
[   33.397134]  ? lock_acquire+0x1ef/0x530
[   33.397143]  ? lock_release+0x810/0x810
[   33.397151]  ? lock_is_held_type+0x100/0x140
[   33.397159]  ? ___might_sleep+0x1ee/0x2d0
[   33.397170]  ? __mutex_lock+0x620/0x1190
[   33.397180]  ? trace_hardirqs_on+0x6a/0x1c0
[   33.397190]  do_fb_ioctl+0x31e/0x700

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/1627293835-17441-4-git-send-email-zheyuma97@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/riva/fbdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index cc242ba057d3..dfa81b641f9f 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -1088,6 +1088,9 @@ static int rivafb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 	int mode_valid = 0;
 	
 	NVTRACE_ENTER();
+	if (!var->pixclock)
+		return -EINVAL;
+
 	switch (var->bits_per_pixel) {
 	case 1 ... 8:
 		var->red.offset = var->green.offset = var->blue.offset = 0;
-- 
2.30.2

