Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B50B827A021
	for <lists+linux-fbdev@lfdr.de>; Sun, 27 Sep 2020 11:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgI0J1L (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 27 Sep 2020 05:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgI0J1K (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 27 Sep 2020 05:27:10 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA99DC0613CE;
        Sun, 27 Sep 2020 02:27:10 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id n14so6712634pff.6;
        Sun, 27 Sep 2020 02:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/+0v4K0vmArclBVNRS/fx6ONczXgbxr9rkdov+E0hJQ=;
        b=uhn8pjG4O8w8yKQYba0Eqi7d+4yEDRRterRVfsBkbBzHte3tCxkee/VgACvDRoQOEB
         m8HlLZD8Rvmqz29YH+gKFlueoL77fiAxJYnHQMr9t84twhsh85cQI5Rev7kbALp43kfi
         yZodv8kSYLEUmgK6sxazd6Ljn1IA/lYSgdCJaU9+93jI6qE/yxUMMT/WEgo/qTerkg47
         sIR97q1Gpo38eUBE4uAg4/cqRxlfq5t3BtKpVQwy8HTHCpnzw8aFtAITvXQOO49IRS6x
         YSookZTniu56Aam3V0J3jvjGU0YD3WdyEmxzCchnhGCm+85xK9/EqcEk7GXrZrG1NE3R
         ojkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/+0v4K0vmArclBVNRS/fx6ONczXgbxr9rkdov+E0hJQ=;
        b=I3ckKWAcXG01EJLET1YsEixVYk87zX8fjk+4L+wF+hvEswvWhsjXEl72MWh32TtCSN
         GmcED+OVXiEtU9o8PCVcKIn0Zf0Sedz4WR1YQzb2oATuTckeg3tpMY1tV1orDcOesO0R
         Agcap5LQTzFYlchmpQd7vtgjUvDZluEin1gJ4UKQbQP5ZN2CpUMObUcbxE5wHaF3hQl6
         mK/45ZF8l+XDhwSkfCsnRuWA6lewqnjWRlv9l8Osf+ZroKdSlJT4rKl4ciCMKKOfAknB
         WrQPBgvyiYINK246gGRiM8Y3tg+pnHd/0G1Ot87xxAFCvfQGjTES7a7UMdYHHawrHvtF
         PGmA==
X-Gm-Message-State: AOAM532KGdaCnj5NWhUzOe390aBjN+vFw+BRxgh5Lh/k863dkf+fRQvb
        yFnU+yl6yxkP6kVMBp6yzrUhcjYt4TNg7t8=
X-Google-Smtp-Source: ABdhPJzznsWE+vGPA76opHSWu8mdz1RLxc0cgGQ4T3jeUXYXq5bYqi3z1U4Ii5LxZ7AyjI1MX6tBxw==
X-Received: by 2002:a63:1f1a:: with SMTP id f26mr5227671pgf.150.1601198830044;
        Sun, 27 Sep 2020 02:27:10 -0700 (PDT)
Received: from PWN ([161.117.41.183])
        by smtp.gmail.com with ESMTPSA id r6sm7556304pfq.11.2020.09.27.02.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 02:27:09 -0700 (PDT)
Date:   Sun, 27 Sep 2020 05:27:01 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
        b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, deller@gmx.de,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        syzkaller-bugs@googlegroups.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peilin Ye <yepeilin.cs@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: KASAN: use-after-free Read in bit_putcs
Message-ID: <20200927092701.GA1037755@PWN>
References: <000000000000226d3f05b02dd607@google.com>
 <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
 <47907f77-b14b-b433-45c6-a315193f0c1a@i-love.sakura.ne.jp>
 <494395bc-a7dd-fdb1-8196-a236a266ef54@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <494395bc-a7dd-fdb1-8196-a236a266ef54@i-love.sakura.ne.jp>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sun, Sep 27, 2020 at 05:28:12PM +0900, Tetsuo Handa wrote:
> Well, vt_io_ioctl(PIO_FONT) initializes "struct console_font_op op;" with
> 
>   op.width = 8;
>   op.height = 0;
>   op.charcount = 256;
> 
> and calls con_font_set() from con_font_op(). But the "/* Need to guess font height [compat] */"
> chunk in con_font_set() guesses font's height due to being initialized with op.height = 0.
> Then, con_font_set() calls fbcon_set_font() via vc->vc_sw->con_font_set(), and fbcon_set_font()
> allocates minimal amount of memory for font data based on font's height calcllated by con_font_set().
> 
> Therefore, any attempt to change font's height (like vt_resizex()) larger than font's height
> calculated by con_font_set() can cause OOB read of memory block for font data. If we allocate
> maximal amount of memory for any font, OOB read of memory block for font data should not happen.
> 
> ----------------------------------------
> 
> static char fontdata[8192] = { 2 };
> 
> [  227.065369] bit_putcs: width=1 cellsize=1 count=80 maxcnt=8192 scan_align=0 buf_align=0 image.height=1
> [  227.066254] bit_putcs: width=1 cellsize=1 count=80 maxcnt=8192 scan_align=0 buf_align=0 image.height=1
> [  227.067642] vc=ffff8880d69b4000 v.v_rows=0 v.v_cols=0 v.v_vlin=1 v.v_clin=9 v.v_vcol=0 v.v_ccol=0 ret=0
> [  227.067699] vcp=ffff8880d69b4000 before: ->vc_rows=480 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=400 ->vc_font.height=9 save_font_height=1
> [  227.067774] vcp=ffff8880d69b4000 after: ->vc_rows=480 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=400 ->vc_font.height=9 save_font_height=1 ret=0
> [  227.067831] vcp=ffff8880cac4b000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
> [  227.067891] vcp=ffff8880cac4b000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
> [  227.067947] vcp=ffff8880c6180000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
> [  227.068007] vcp=ffff8880c6180000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
> [  227.068063] vcp=ffff8880d6b84000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
> [  227.068123] vcp=ffff8880d6b84000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
> [  227.068179] vcp=ffff8880ca8c0000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
> [  227.068255] vcp=ffff8880ca8c0000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
> [  227.068455] vcp=ffff8880cbd5d000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
> [  227.068515] vcp=ffff8880cbd5d000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
> [  227.084709] ==================================================================
> [  227.084729] BUG: KASAN: slab-out-of-bounds in soft_cursor+0x34e/0x4a0
> [  227.084748] Read of size 9 at addr ffff8880c98d5930 by task a.out/1662

Very interesting, I remember seeing this on the syzbot dashboard...

Yes, I guess it is this one:
	KASAN: slab-out-of-bounds Read in soft_cursor
	https://syzkaller.appspot.com/bug?id=6b8355d27b2b94fb5cedf4655e3a59162d9e48e3

There is a `0x560aul` ioctl() in the reproducer, which is `VT_RESIZEX`.

Thank you,
Peilin Ye

