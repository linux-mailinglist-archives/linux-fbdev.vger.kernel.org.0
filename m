Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8518E64F091
	for <lists+linux-fbdev@lfdr.de>; Fri, 16 Dec 2022 18:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbiLPRqk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 16 Dec 2022 12:46:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbiLPRqi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 16 Dec 2022 12:46:38 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC2DA2BB1F
        for <linux-fbdev@vger.kernel.org>; Fri, 16 Dec 2022 09:46:37 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 29EDD3473B;
        Fri, 16 Dec 2022 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1671212796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oOfJNFraF06M4jbL/L1/zWpM/pCR44jctYw61DQP7KQ=;
        b=VOa9Qf9mpCybmP4Ppvq6vZGVx7a6kF0+ztN6JCXV8g+ixD5Q80Dyw/gt8g6nMxX4eiCWuR
        2sxG/q+9N5ulgRQOJ70da0Qy+ZhTkz0X39pcvF7pyMPFZTkMKbZO//A+quceWK3fLB7tkv
        Xxa7LUpHrE8r0SnxxgRY81viVGwpx+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1671212796;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oOfJNFraF06M4jbL/L1/zWpM/pCR44jctYw61DQP7KQ=;
        b=FT9Ajn2/urgUzFwK9a41Y8lrl5KlMDLSzfFzlQHwMNwkNdkl5epOJ2cwVoIgbYjTSIP1uf
        EXnZd3dVH8hcj/Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0605E13904;
        Fri, 16 Dec 2022 17:46:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id yBtsAPyunGNYSgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 16 Dec 2022 17:46:36 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, daniel@ffwll.ch, airlied@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/2] fbdev/hgafb: Remove trailing whitespaces
Date:   Fri, 16 Dec 2022 18:46:32 +0100
Message-Id: <20221216174633.1971-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216174633.1971-1-tzimmermann@suse.de>
References: <20221216174633.1971-1-tzimmermann@suse.de>
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
 drivers/video/fbdev/hgafb.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index bd3d07aa4f0e..40879d9facdf 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -1,6 +1,6 @@
 /*
  * linux/drivers/video/hgafb.c -- Hercules graphics adaptor frame buffer device
- * 
+ *
  *      Created 25 Nov 1999 by Ferenc Bakonyi (fero@drama.obuda.kando.hu)
  *      Based on skeletonfb.c by Geert Uytterhoeven and
  *               mdacon.c by Andrew Apted
@@ -8,14 +8,14 @@
  * History:
  *
  * - Revision 0.1.8 (23 Oct 2002): Ported to new framebuffer api.
- * 
- * - Revision 0.1.7 (23 Jan 2001): fix crash resulting from MDA only cards 
+ *
+ * - Revision 0.1.7 (23 Jan 2001): fix crash resulting from MDA only cards
  *				   being detected as Hercules.	 (Paul G.)
  * - Revision 0.1.6 (17 Aug 2000): new style structs
  *                                 documentation
  * - Revision 0.1.5 (13 Mar 2000): spinlocks instead of saveflags();cli();etc
  *                                 minor fixes
- * - Revision 0.1.4 (24 Jan 2000): fixed a bug in hga_card_detect() for 
+ * - Revision 0.1.4 (24 Jan 2000): fixed a bug in hga_card_detect() for
  *                                  HGA-only systems
  * - Revision 0.1.3 (22 Jan 2000): modified for the new fb_info structure
  *                                 screen is cleared after rmmod
@@ -143,7 +143,7 @@ static bool nologo = 0;
 
 static void write_hga_b(unsigned int val, unsigned char reg)
 {
-	outb_p(reg, HGA_INDEX_PORT); 
+	outb_p(reg, HGA_INDEX_PORT);
 	outb_p(val, HGA_VALUE_PORT);
 }
 
@@ -155,7 +155,7 @@ static void write_hga_w(unsigned int val, unsigned char reg)
 
 static int test_hga_b(unsigned char val, unsigned char reg)
 {
-	outb_p(reg, HGA_INDEX_PORT); 
+	outb_p(reg, HGA_INDEX_PORT);
 	outb  (val, HGA_VALUE_PORT);
 	udelay(20); val = (inb_p(HGA_VALUE_PORT) == val);
 	return val;
@@ -244,7 +244,7 @@ static void hga_show_logo(struct fb_info *info)
 	void __iomem *dest = hga_vram;
 	char *logo = linux_logo_bw;
 	int x, y;
-	
+
 	for (y = 134; y < 134 + 80 ; y++) * this needs some cleanup *
 		for (x = 0; x < 10 ; x++)
 			writeb(~*(logo++),(dest + HGA_ROWADDR(y) + x + 40));
@@ -255,7 +255,7 @@ static void hga_pan(unsigned int xoffset, unsigned int yoffset)
 {
 	unsigned int base;
 	unsigned long flags;
-	
+
 	base = (yoffset / 8) * 90 + xoffset;
 	spin_lock_irqsave(&hga_reg_lock, flags);
 	write_hga_w(base, 0x0c);	/* start address */
@@ -310,7 +310,7 @@ static int hga_card_detect(void)
 	/* Ok, there is definitely a card registering at the correct
 	 * memory location, so now we do an I/O port test.
 	 */
-	
+
 	if (!test_hga_b(0x66, 0x0f))	    /* cursor low register */
 		goto error;
 
@@ -321,7 +321,7 @@ static int hga_card_detect(void)
 	 * bit of the status register is changing.  This test lasts for
 	 * approximately 1/10th of a second.
 	 */
-	
+
 	p_save = q_save = inb_p(HGA_STATUS_PORT) & HGA_STATUS_VSYNC;
 
 	for (count=0; count < 50000 && p_save == q_save; count++) {
@@ -329,7 +329,7 @@ static int hga_card_detect(void)
 		udelay(2);
 	}
 
-	if (p_save == q_save) 
+	if (p_save == q_save)
 		goto error;
 
 	switch (inb_p(HGA_STATUS_PORT) & 0x70) {
@@ -415,7 +415,7 @@ static int hgafb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
  *	@info:pointer to fb_info object containing info for current hga board
  *
  *	This function looks only at xoffset, yoffset and the %FB_VMODE_YWRAP
- *	flag in @var. If input parameters are correct it calls hga_pan() to 
+ *	flag in @var. If input parameters are correct it calls hga_pan() to
  *	program the hardware. @info->var is updated to the new values.
  *	A zero is returned on success and %-EINVAL for failure.
  */
@@ -442,9 +442,9 @@ static int hgafb_pan_display(struct fb_var_screeninfo *var,
  *	hgafb_blank - (un)blank the screen
  *	@blank_mode:blanking method to use
  *	@info:unused
- *	
- *	Blank the screen if blank_mode != 0, else unblank. 
- *	Implements VESA suspend and powerdown modes on hardware that supports 
+ *
+ *	Blank the screen if blank_mode != 0, else unblank.
+ *	Implements VESA suspend and powerdown modes on hardware that supports
  *	disabling hsync/vsync:
  *		@blank_mode == 2 means suspend vsync,
  *		@blank_mode == 3 means suspend hsync,
@@ -539,15 +539,15 @@ static const struct fb_ops hgafb_ops = {
 	.fb_copyarea	= hgafb_copyarea,
 	.fb_imageblit	= hgafb_imageblit,
 };
-		
+
 /* ------------------------------------------------------------------------- *
  *
  * Functions in fb_info
- * 
+ *
  * ------------------------------------------------------------------------- */
 
 /* ------------------------------------------------------------------------- */
-    
+
 	/*
 	 *  Initialization
 	 */
-- 
2.38.1

