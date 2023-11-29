Return-Path: <linux-fbdev+bounces-260-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B71C7FDC19
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Nov 2023 16:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E552E282777
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Nov 2023 15:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3408839869;
	Wed, 29 Nov 2023 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TIfxyWPV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5+V05/qC"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE6ABF
	for <linux-fbdev@vger.kernel.org>; Wed, 29 Nov 2023 07:59:07 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B82501F8BD;
	Wed, 29 Nov 2023 15:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1701273545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiGO4MfGjQq5sX5wdWEfZICvx6DCduc0T5/sj5ADado=;
	b=TIfxyWPV/teg/tJ8DN0yV4wysvL2ozT4OWvl5XQRpbNyDyg0kIQpDd4DBoUNcFpr5GTy90
	j7uXN6cDqY0hh0ED28ETjRwfZ81nTFdbUrEVGHZDOCJPoIHehhtOlMcw6JBUcQMbbmD2Lp
	0n1lUToFL5IgAF88Y7n6VV+b77gWaFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701273545;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiGO4MfGjQq5sX5wdWEfZICvx6DCduc0T5/sj5ADado=;
	b=5+V05/qCDIrABejERGutt+DwYFQdrEQtYe0tsCQxkQ9EevrlGh4K47Y/ogX+Dvduev3kBp
	4JeKGKxjJqywBiAA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C871913B48;
	Wed, 29 Nov 2023 15:52:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id cO+2LzheZ2XzWAAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 29 Nov 2023 15:52:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	pjones@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/4] fbdev/vesafb: Replace references to global screen_info by local pointer
Date: Wed, 29 Nov 2023 16:48:03 +0100
Message-ID: <20231129155218.3475-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129155218.3475-1-tzimmermann@suse.de>
References: <20231129155218.3475-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: 3.90
X-Spamd-Result: default: False [3.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[redhat.com,gmx.de];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]

Get the global screen_info's address once and access the data via
this pointer. Limits the use of global state.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/vesafb.c | 66 +++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index c0edceea0a793..ea89accbec385 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -243,6 +243,7 @@ static int vesafb_setup(char *options)
 
 static int vesafb_probe(struct platform_device *dev)
 {
+	struct screen_info *si = &screen_info;
 	struct fb_info *info;
 	struct vesafb_par *par;
 	int i, err;
@@ -255,17 +256,17 @@ static int vesafb_probe(struct platform_device *dev)
 	fb_get_options("vesafb", &option);
 	vesafb_setup(option);
 
-	if (screen_info.orig_video_isVGA != VIDEO_TYPE_VLFB)
+	if (si->orig_video_isVGA != VIDEO_TYPE_VLFB)
 		return -ENODEV;
 
-	vga_compat = (screen_info.capabilities & 2) ? 0 : 1;
-	vesafb_fix.smem_start = screen_info.lfb_base;
-	vesafb_defined.bits_per_pixel = screen_info.lfb_depth;
+	vga_compat = (si->capabilities & 2) ? 0 : 1;
+	vesafb_fix.smem_start = si->lfb_base;
+	vesafb_defined.bits_per_pixel = si->lfb_depth;
 	if (15 == vesafb_defined.bits_per_pixel)
 		vesafb_defined.bits_per_pixel = 16;
-	vesafb_defined.xres = screen_info.lfb_width;
-	vesafb_defined.yres = screen_info.lfb_height;
-	vesafb_fix.line_length = screen_info.lfb_linelength;
+	vesafb_defined.xres = si->lfb_width;
+	vesafb_defined.yres = si->lfb_height;
+	vesafb_fix.line_length = si->lfb_linelength;
 	vesafb_fix.visual   = (vesafb_defined.bits_per_pixel == 8) ?
 		FB_VISUAL_PSEUDOCOLOR : FB_VISUAL_TRUECOLOR;
 
@@ -277,7 +278,7 @@ static int vesafb_probe(struct platform_device *dev)
 	/*   size_total -- all video memory we have. Used for mtrr
 	 *                 entries, resource allocation and bounds
 	 *                 checking. */
-	size_total = screen_info.lfb_size * 65536;
+	size_total = si->lfb_size * 65536;
 	if (vram_total)
 		size_total = vram_total * 1024 * 1024;
 	if (size_total < size_vmode)
@@ -297,7 +298,7 @@ static int vesafb_probe(struct platform_device *dev)
 	vesafb_fix.smem_len = size_remap;
 
 #ifndef __i386__
-	screen_info.vesapm_seg = 0;
+	si->vesapm_seg = 0;
 #endif
 
 	if (!request_mem_region(vesafb_fix.smem_start, size_total, "vesafb")) {
@@ -317,23 +318,26 @@ static int vesafb_probe(struct platform_device *dev)
 	par = info->par;
 	info->pseudo_palette = par->pseudo_palette;
 
-	par->base = screen_info.lfb_base;
+	par->base = si->lfb_base;
 	par->size = size_total;
 
 	printk(KERN_INFO "vesafb: mode is %dx%dx%d, linelength=%d, pages=%d\n",
-	       vesafb_defined.xres, vesafb_defined.yres, vesafb_defined.bits_per_pixel, vesafb_fix.line_length, screen_info.pages);
+	       vesafb_defined.xres, vesafb_defined.yres, vesafb_defined.bits_per_pixel,
+	       vesafb_fix.line_length, si->pages);
 
-	if (screen_info.vesapm_seg) {
+	if (si->vesapm_seg) {
 		printk(KERN_INFO "vesafb: protected mode interface info at %04x:%04x\n",
-		       screen_info.vesapm_seg,screen_info.vesapm_off);
+		       si->vesapm_seg, si->vesapm_off);
 	}
 
-	if (screen_info.vesapm_seg < 0xc000)
+	if (si->vesapm_seg < 0xc000)
 		ypan = pmi_setpal = 0; /* not available or some DOS TSR ... */
 
 	if (ypan || pmi_setpal) {
+		unsigned long pmi_phys;
 		unsigned short *pmi_base;
-		pmi_base  = (unsigned short*)phys_to_virt(((unsigned long)screen_info.vesapm_seg << 4) + screen_info.vesapm_off);
+		pmi_phys  = ((unsigned long)si->vesapm_seg << 4) + si->vesapm_off;
+		pmi_base  = (unsigned short *)phys_to_virt(pmi_phys);
 		pmi_start = (void*)((char*)pmi_base + pmi_base[1]);
 		pmi_pal   = (void*)((char*)pmi_base + pmi_base[2]);
 		printk(KERN_INFO "vesafb: pmi: set display start = %p, set palette = %p\n",pmi_start,pmi_pal);
@@ -377,14 +381,14 @@ static int vesafb_probe(struct platform_device *dev)
 	vesafb_defined.left_margin  = (vesafb_defined.xres / 8) & 0xf8;
 	vesafb_defined.hsync_len    = (vesafb_defined.xres / 8) & 0xf8;
 
-	vesafb_defined.red.offset    = screen_info.red_pos;
-	vesafb_defined.red.length    = screen_info.red_size;
-	vesafb_defined.green.offset  = screen_info.green_pos;
-	vesafb_defined.green.length  = screen_info.green_size;
-	vesafb_defined.blue.offset   = screen_info.blue_pos;
-	vesafb_defined.blue.length   = screen_info.blue_size;
-	vesafb_defined.transp.offset = screen_info.rsvd_pos;
-	vesafb_defined.transp.length = screen_info.rsvd_size;
+	vesafb_defined.red.offset    = si->red_pos;
+	vesafb_defined.red.length    = si->red_size;
+	vesafb_defined.green.offset  = si->green_pos;
+	vesafb_defined.green.length  = si->green_size;
+	vesafb_defined.blue.offset   = si->blue_pos;
+	vesafb_defined.blue.length   = si->blue_size;
+	vesafb_defined.transp.offset = si->rsvd_pos;
+	vesafb_defined.transp.length = si->rsvd_size;
 
 	if (vesafb_defined.bits_per_pixel <= 8) {
 		depth = vesafb_defined.green.length;
@@ -399,14 +403,14 @@ static int vesafb_probe(struct platform_device *dev)
 	       (vesafb_defined.bits_per_pixel > 8) ?
 	       "Truecolor" : (vga_compat || pmi_setpal) ?
 	       "Pseudocolor" : "Static Pseudocolor",
-	       screen_info.rsvd_size,
-	       screen_info.red_size,
-	       screen_info.green_size,
-	       screen_info.blue_size,
-	       screen_info.rsvd_pos,
-	       screen_info.red_pos,
-	       screen_info.green_pos,
-	       screen_info.blue_pos);
+	       si->rsvd_size,
+	       si->red_size,
+	       si->green_size,
+	       si->blue_size,
+	       si->rsvd_pos,
+	       si->red_pos,
+	       si->green_pos,
+	       si->blue_pos);
 
 	vesafb_fix.ypanstep  = ypan     ? 1 : 0;
 	vesafb_fix.ywrapstep = (ypan>1) ? 1 : 0;
-- 
2.43.0


