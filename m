Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FD62C6E25
	for <lists+linux-fbdev@lfdr.de>; Sat, 28 Nov 2020 02:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbgK1BWx (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 27 Nov 2020 20:22:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731324AbgK0UBR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 27 Nov 2020 15:01:17 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F0CC08E862
        for <linux-fbdev@vger.kernel.org>; Fri, 27 Nov 2020 11:59:39 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id d8so8586998lfa.1
        for <linux-fbdev@vger.kernel.org>; Fri, 27 Nov 2020 11:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b0Ju2b6VwP0rGTkHcCSaLjeBzsLdorcbkSm8ycWNFi8=;
        b=YVPokDiHGMOA9sbLmSAHlS5XU0a5XJHcHYLM/96x34Sb9JnoZklVkiVZFvgVRY2O8D
         aA1OqTdOfDklYRW9I7wUVCqlQ0/4GrkcCf41U9FMlKD+xy7gbgDYUUwIGVWxtsqFrhG2
         nqbnO9ryw5FC3dTTqfjBrXCQcB0EgzrMJeljIt3r87SKtBfGvrDaMrj40u65HM3CCX8j
         i4msTSZCAF2DtP7W/gqypD+z93w+e7DmqQjndJmsNb9jx5jYr/NLrkVBVTCi1VByfytN
         9j44D4ggrk7zVgtZVCnPZVhSh+72mRIGxciTQnYfHWKKajkkcxnTW/evGXe33n1hYGDi
         //sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=b0Ju2b6VwP0rGTkHcCSaLjeBzsLdorcbkSm8ycWNFi8=;
        b=fJH2UDI/s4fkpjTAShU/vIHVyXfARarLVHst19C/cjoSlpSk/BaTlxYnAt+FydheAe
         /rJoAKAxqMjhm9Bbwwh0OmFpmm+WwTBR9lHBzjNUf+aN6S9ovYNWCbC182D2zzV9+yn2
         SL6QJeDD1drwg4wSjeofr9UsrC2h8gADfSQLTzic6cJlqZrRn550st4E9IJgbbtTnlmh
         LP9EkfVTqrJdPS237fFCU+PVuPKQwPUOaE3hx53bMf44+a/OKVQXiZo2sYX0ecZ9cJp7
         15MDn9MN12Ym+/KXYf4K9W1qSM+IkrL2pN/goRgmuh0SJHuvSaEvOJSmyQmAAGUWSoEF
         O/8A==
X-Gm-Message-State: AOAM530erehX5/JnUJMq0Mq9cPd+ta2KP49uavAns1y/XgcOQvwU06Og
        I1tufyTCKKje56dbni7MhfcdhpVgryFSZwEU
X-Google-Smtp-Source: ABdhPJw6mJwSIHR8X58y/nVsjR7+pYbL7xkqTpsYLQAhnaUTmtEaj/ktaFglnB3Ot6ORxhYINSCP/Q==
X-Received: by 2002:a19:5602:: with SMTP id k2mr3959293lfb.359.1606507177274;
        Fri, 27 Nov 2020 11:59:37 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
        by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 11:59:36 -0800 (PST)
Sender: Sam Ravnborg <sam.ravnborg@gmail.com>
From:   Sam Ravnborg <sam@ravnborg.org>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Lee Jones <lee.jones@linaro.org>
Cc:     Aditya Pakki <pakki001@umn.edu>,
        Alexander Klimov <grandmaster@al2klimov.de>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Antonino Daplas <adaplas@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Evgeny Novikov <novikov@ispras.ru>,
        Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
        George Kennedy <george.kennedy@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gustavo Silva <gustavoars@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Jason Yan <yanaijie@huawei.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Joe Perches <joe@perches.com>,
        Kristoffer Ericson <kristoffer.ericson@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-nvidia@lists.surfsouth.com,
        Michal Januszewski <spock@gentoo.org>,
        Mike Rapoport <rppt@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peilin Ye <yepeilin.cs@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        Qilong Zhang <zhangqilong3@huawei.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Thomas Zimemrmann <tzimmermann@suse.de>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Xiaofei Tan <tanxiaofei@huawei.com>
Subject: [PATCH v1 24/28] video: fbdev: s3c-fb: Fix W=1 warnings
Date:   Fri, 27 Nov 2020 20:58:21 +0100
Message-Id: <20201127195825.858960-25-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127195825.858960-1-sam@ravnborg.org>
References: <20201127195825.858960-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fix several W=1 warnings
- Updated kernel-doc as needed
- Deleted unused local variable, it was assigned but never used

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/s3c-fb.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index ba316bd56efd..3b134e1bbc38 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -75,6 +75,7 @@ struct s3c_fb;
  * @buf_size: Offset of buffer size registers.
  * @buf_end: Offset of buffer end registers.
  * @osd: The base for the OSD registers.
+ * @osd_stride: stride of osd
  * @palette: Address of palette memory, or 0 if none.
  * @has_prtcon: Set if has PRTCON register.
  * @has_shadowcon: Set if has SHADOWCON register.
@@ -155,7 +156,7 @@ struct s3c_fb_palette {
  * @windata: The platform data supplied for the window configuration.
  * @parent: The hardware that this window is part of.
  * @fbinfo: Pointer pack to the framebuffer info for this window.
- * @varint: The variant information for this window.
+ * @variant: The variant information for this window.
  * @palette_buffer: Buffer/cache to hold palette entries.
  * @pseudo_palette: For use in TRUECOLOUR modes for entries 0..15/
  * @index: The window number of this window.
@@ -336,7 +337,7 @@ static int s3c_fb_check_var(struct fb_var_screeninfo *var,
 /**
  * s3c_fb_calc_pixclk() - calculate the divider to create the pixel clock.
  * @sfb: The hardware state.
- * @pixclock: The pixel clock wanted, in picoseconds.
+ * @pixclk: The pixel clock wanted, in picoseconds.
  *
  * Given the specified pixel clock, work out the necessary divider to get
  * close to the output frequency.
@@ -733,7 +734,7 @@ static inline unsigned int chan_to_field(unsigned int chan,
  * @red: The red field for the palette data.
  * @green: The green field for the palette data.
  * @blue: The blue field for the palette data.
- * @trans: The transparency (alpha) field for the palette data.
+ * @transp: The transparency (alpha) field for the palette data.
  * @info: The framebuffer being changed.
  */
 static int s3c_fb_setcolreg(unsigned regno,
@@ -1133,6 +1134,7 @@ static void s3c_fb_free_memory(struct s3c_fb *sfb, struct s3c_fb_win *win)
 
 /**
  * s3c_fb_release_win() - release resources for a framebuffer window.
+ * @sfb: The base resources for the hardware.
  * @win: The window to cleanup the resources for.
  *
  * Release the resources that where claimed for the hardware window,
@@ -1160,6 +1162,7 @@ static void s3c_fb_release_win(struct s3c_fb *sfb, struct s3c_fb_win *win)
 /**
  * s3c_fb_probe_win() - register an hardware window
  * @sfb: The base resources for the hardware
+ * @win_no: The window number
  * @variant: The variant information for this window.
  * @res: Pointer to where to place the resultant window.
  *
@@ -1170,7 +1173,6 @@ static int s3c_fb_probe_win(struct s3c_fb *sfb, unsigned int win_no,
 			    struct s3c_fb_win_variant *variant,
 			    struct s3c_fb_win **res)
 {
-	struct fb_var_screeninfo *var;
 	struct fb_videomode initmode;
 	struct s3c_fb_pd_win *windata;
 	struct s3c_fb_win *win;
@@ -1198,7 +1200,6 @@ static int s3c_fb_probe_win(struct s3c_fb *sfb, unsigned int win_no,
 
 	win = fbinfo->par;
 	*res = win;
-	var = &fbinfo->var;
 	win->variant = *variant;
 	win->fbinfo = fbinfo;
 	win->parent = sfb;
-- 
2.27.0

