Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 803A06AC63D
	for <lists+linux-fbdev@lfdr.de>; Mon,  6 Mar 2023 17:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbjCFQAw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 6 Mar 2023 11:00:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbjCFQA2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 6 Mar 2023 11:00:28 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B241C2E0D3;
        Mon,  6 Mar 2023 08:00:26 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 38BFA22373;
        Mon,  6 Mar 2023 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678118425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b6D8FQBTb2yaZRkjP/3Zmj8yOkLU5mYNE2Q1swliLUA=;
        b=q8ROvjUcrSXURP4NQC4Zg3u4Gw4+An+KGI1Kz4tT1+pf8x6qL8wrC00mYNJwkdWcszbg5g
        tX72pAJlWDzpAc3ZuKEDcoSMaLFrSB4WMxkUhjCTS+K/hDHXwL/pU/Y0dOgZhUUlsZLJPi
        COMOQEwJ1WdVegCTBs0GtRQXm5JvkPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678118425;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b6D8FQBTb2yaZRkjP/3Zmj8yOkLU5mYNE2Q1swliLUA=;
        b=qnWYoxjTuASWAY95x+RCGYYuVtszvqtS7n4BHovqz0pZaA2P3xj7tUmgp0+ovDNZcGaSto
        nst+SnyK6AarT9AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC4DB13513;
        Mon,  6 Mar 2023 16:00:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id UBMDNRgOBmQ/PwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:24 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
        linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
        adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
        mbroemme@libmpq.org, thomas@winischhofer.net,
        James.Bottomley@HansenPartnership.com, spock@gentoo.org,
        sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
        geert+renesas@glider.be, corbet@lwn.net
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/99] fbdev/68328fb: Remove trailing whitespaces
Date:   Mon,  6 Mar 2023 16:58:39 +0100
Message-Id: <20230306160016.4459-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306160016.4459-1-tzimmermann@suse.de>
References: <20230306160016.4459-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/68328fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/68328fb.c b/drivers/video/fbdev/68328fb.c
index 7db03ed77c76..7fe56ecbe4e6 100644
--- a/drivers/video/fbdev/68328fb.c
+++ b/drivers/video/fbdev/68328fb.c
@@ -123,7 +123,7 @@ static u_long get_line_length(int xres_virtual, int bpp)
      *  First part, xxxfb_check_var, must not write anything
      *  to hardware, it should only verify and adjust var.
      *  This means it doesn't alter par but it does use hardware
-     *  data from it to check this var. 
+     *  data from it to check this var.
      */
 
 static int mc68x328fb_check_var(struct fb_var_screeninfo *var,
@@ -181,7 +181,7 @@ static int mc68x328fb_check_var(struct fb_var_screeninfo *var,
 
 	/*
 	 * Now that we checked it we alter var. The reason being is that the video
-	 * mode passed in might not work but slight changes to it might make it 
+	 * mode passed in might not work but slight changes to it might make it
 	 * work. This way we let the user know what is acceptable.
 	 */
 	switch (var->bits_per_pixel) {
@@ -256,8 +256,8 @@ static int mc68x328fb_check_var(struct fb_var_screeninfo *var,
 }
 
 /* This routine actually sets the video mode. It's in here where we
- * the hardware state info->par and fix which can be affected by the 
- * change in par. For this driver it doesn't do much. 
+ * the hardware state info->par and fix which can be affected by the
+ * change in par. For this driver it doesn't do much.
  */
 static int mc68x328fb_set_par(struct fb_info *info)
 {
@@ -294,7 +294,7 @@ static int mc68x328fb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
 	 *   {hardwarespecific} contains width of RAMDAC
 	 *   cmap[X] is programmed to (X << red.offset) | (X << green.offset) | (X << blue.offset)
 	 *   RAMDAC[X] is programmed to (red, green, blue)
-	 * 
+	 *
 	 * Pseudocolor:
 	 *    uses offset = 0 && length = RAMDAC register width.
 	 *    var->{color}.offset is 0
@@ -383,7 +383,7 @@ static int mc68x328fb_pan_display(struct fb_var_screeninfo *var,
 }
 
     /*
-     *  Most drivers don't need their own mmap function 
+     *  Most drivers don't need their own mmap function
      */
 
 static int mc68x328fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
-- 
2.39.2

