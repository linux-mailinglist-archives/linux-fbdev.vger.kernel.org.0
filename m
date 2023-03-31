Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE426D1BF3
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Mar 2023 11:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjCaJX0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 31 Mar 2023 05:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbjCaJXX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 31 Mar 2023 05:23:23 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F76558F
        for <linux-fbdev@vger.kernel.org>; Fri, 31 Mar 2023 02:23:18 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 35C9F21B2B;
        Fri, 31 Mar 2023 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680254597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DezrXlzeOpDWdexZa7oYMI/hhP+/7Z1+8qeO/nnp77k=;
        b=niXnglxuHMXx9jZGLTDRM59sWA3zVpsJCYUdwf/hgGyRAImv5DJJCuCH9ci36vPcKEB2I5
        EZTXT5nM8+D3eG3oNsKXaq1sMQkhyVv+rRuUDY6mBneV1YZIA7bKt8/sXMBo50TGlk35kx
        SOi1Gd2lbyYofIjgb4dd3TTDM3Vobvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680254597;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DezrXlzeOpDWdexZa7oYMI/hhP+/7Z1+8qeO/nnp77k=;
        b=1Ejv0Mf42oLKy+gPBV4dWon46klbReZit93JPSAyw0O8QAb2Po/V+2msPgYWTMYskncC3f
        JmZ5wZSH7QLlspBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16EC0133B6;
        Fri, 31 Mar 2023 09:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id oGCWBIWmJmTsOwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 31 Mar 2023 09:23:17 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/15] fbdev/controlfb: Remove trailing whitespaces
Date:   Fri, 31 Mar 2023 11:23:03 +0200
Message-Id: <20230331092314.2209-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331092314.2209-1-tzimmermann@suse.de>
References: <20230331092314.2209-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/controlfb.c | 34 ++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 77dbf94aae5f..82eeb139c4eb 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -113,14 +113,14 @@ struct fb_info_control {
 	struct fb_info		info;
 	struct fb_par_control	par;
 	u32			pseudo_palette[16];
-		
+
 	struct cmap_regs	__iomem *cmap_regs;
 	unsigned long		cmap_regs_phys;
-	
+
 	struct control_regs	__iomem *control_regs;
 	unsigned long		control_regs_phys;
 	unsigned long		control_regs_size;
-	
+
 	__u8			__iomem *frame_buffer;
 	unsigned long		frame_buffer_phys;
 	unsigned long		fb_orig_base;
@@ -196,7 +196,7 @@ static void set_control_clock(unsigned char *params)
 		while (!req.complete)
 			cuda_poll();
 	}
-#endif	
+#endif
 }
 
 /*
@@ -233,19 +233,19 @@ static void control_set_hardware(struct fb_info_control *p, struct fb_par_contro
 		if (p->par.xoffset != par->xoffset ||
 		    p->par.yoffset != par->yoffset)
 			set_screen_start(par->xoffset, par->yoffset, p);
-			
+
 		return;
 	}
-	
+
 	p->par = *par;
 	cmode = p->par.cmode;
 	r = &par->regvals;
-	
+
 	/* Turn off display */
 	out_le32(CNTRL_REG(p,ctrl), 0x400 | par->ctrl);
-	
+
 	set_control_clock(r->clock_params);
-	
+
 	RADACAL_WRITE(0x20, r->radacal_ctrl);
 	RADACAL_WRITE(0x21, p->control_use_bank2 ? 0 : 1);
 	RADACAL_WRITE(0x10, 0);
@@ -254,7 +254,7 @@ static void control_set_hardware(struct fb_info_control *p, struct fb_par_contro
 	rp = &p->control_regs->vswin;
 	for (i = 0; i < 16; ++i, ++rp)
 		out_le32(&rp->r, r->regs[i]);
-	
+
 	out_le32(CNTRL_REG(p,pitch), par->pitch);
 	out_le32(CNTRL_REG(p,mode), r->mode);
 	out_le32(CNTRL_REG(p,vram_attr), p->vram_attr);
@@ -366,7 +366,7 @@ static int read_control_sense(struct fb_info_control *p)
 	sense |= (in_le32(CNTRL_REG(p,mon_sense)) & 0x180) >> 7;
 
 	out_le32(CNTRL_REG(p,mon_sense), 077);	/* turn off drivers */
-	
+
 	return sense;
 }
 
@@ -558,9 +558,9 @@ static int control_var_to_par(struct fb_var_screeninfo *var,
 static void control_par_to_var(struct fb_par_control *par, struct fb_var_screeninfo *var)
 {
 	struct control_regints *rv;
-	
+
 	rv = (struct control_regints *) par->regvals.regs;
-	
+
 	memset(var, 0, sizeof(*var));
 	var->xres = par->xres;
 	var->yres = par->yres;
@@ -568,7 +568,7 @@ static void control_par_to_var(struct fb_par_control *par, struct fb_var_screeni
 	var->yres_virtual = par->vyres;
 	var->xoffset = par->xoffset;
 	var->yoffset = par->yoffset;
-	
+
 	switch(par->cmode) {
 	default:
 	case CMODE_8:
@@ -634,7 +634,7 @@ static int controlfb_check_var (struct fb_var_screeninfo *var, struct fb_info *i
 
 	err = control_var_to_par(var, &par, info);
 	if (err)
-		return err;	
+		return err;
 	control_par_to_var(&par, var);
 
 	return 0;
@@ -655,7 +655,7 @@ static int controlfb_set_par (struct fb_info *info)
 				 " control_var_to_par: %d.\n", err);
 		return err;
 	}
-	
+
 	control_set_hardware(p, &par);
 
 	info->fix.visual = (p->par.cmode == CMODE_8) ?
@@ -840,7 +840,7 @@ static int __init init_control(struct fb_info_control *p)
 	int full, sense, vmode, cmode, vyres;
 	struct fb_var_screeninfo var;
 	int rc;
-	
+
 	printk(KERN_INFO "controlfb: ");
 
 	full = p->total_vram == 0x400000;
-- 
2.40.0

