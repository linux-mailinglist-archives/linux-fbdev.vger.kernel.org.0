Return-Path: <linux-fbdev+bounces-242-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 505577FA097
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Nov 2023 14:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A14FB21110
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Nov 2023 13:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33BE2D7B7;
	Mon, 27 Nov 2023 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZFm86Rtc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TZXluPho"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CBE187
	for <linux-fbdev@vger.kernel.org>; Mon, 27 Nov 2023 05:17:07 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C3B32203FE;
	Mon, 27 Nov 2023 13:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1701091025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJyET7XWuf/KWIDuSKlKzyH4amNakF6D1rSc8AEdlbQ=;
	b=ZFm86RtcrCKpfV4jgk6LHNz8+cvMRIEWagWH7qyjtvtyGllR8KhXm51O40vwx1P4XJzMl7
	7d6vDxHor7AeNTwldmAodKEf3Zx6xs6hOBIVPWmlp2Gu+irDHRT+A5vpVvttFWXAnV1qix
	YqLxPe2nKgH7yD93D7WAda6IvBtN870=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701091025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJyET7XWuf/KWIDuSKlKzyH4amNakF6D1rSc8AEdlbQ=;
	b=TZXluPhoHXTMoLrE3/BXugenP345L4ju5ajwZjM/+JAhRNFY6h+lQCi66LVF7MX0PsMqKr
	ds5M2e1iPZFI7RCw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BFA5132A6;
	Mon, 27 Nov 2023 13:17:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id SJwYIdGWZGUhLQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 25/32] staging/sm750fb: Declare fb_ops as constant
Date: Mon, 27 Nov 2023 14:15:54 +0100
Message-ID: <20231127131655.4020-26-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127131655.4020-1-tzimmermann@suse.de>
References: <20231127131655.4020-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: 5.20
X-Spamd-Result: default: False [5.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,siliconmotion.com:email];
	 FREEMAIL_TO(0.00)[redhat.com,gmx.de];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,suse.de,gmail.com,siliconmotion.com,linuxfoundation.org,lists.linux.dev];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]

Split up lynxfb_ops and declare each as constant. The fb_ops
instance used to be modified while initializing the driver. It is
now constant and the driver picks the correct instance, depending
on the settings for acceleration and cursor support.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Teddy Wang <teddy.wang@siliconmotion.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/staging/sm750fb/sm750.c | 59 +++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 79bcd5bd49380..35098516f53c9 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -663,16 +663,53 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 	return ret;
 }
 
-static struct fb_ops lynxfb_ops = {
+static const struct fb_ops lynxfb_ops = {
 	.owner = THIS_MODULE,
 	.fb_check_var =  lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
 	.fb_blank = lynxfb_ops_blank,
+	.fb_pan_display = lynxfb_ops_pan_display,
 	.fb_fillrect = cfb_fillrect,
 	.fb_imageblit = cfb_imageblit,
 	.fb_copyarea = cfb_copyarea,
-	/* cursor */
+};
+
+static const struct fb_ops lynxfb_ops_with_cursor = {
+	.owner = THIS_MODULE,
+	.fb_check_var =  lynxfb_ops_check_var,
+	.fb_set_par = lynxfb_ops_set_par,
+	.fb_setcolreg = lynxfb_ops_setcolreg,
+	.fb_blank = lynxfb_ops_blank,
+	.fb_pan_display = lynxfb_ops_pan_display,
+	.fb_fillrect = cfb_fillrect,
+	.fb_copyarea = cfb_copyarea,
+	.fb_imageblit = cfb_imageblit,
+	.fb_cursor = lynxfb_ops_cursor,
+};
+
+static const struct fb_ops lynxfb_ops_accel = {
+	.owner = THIS_MODULE,
+	.fb_check_var =  lynxfb_ops_check_var,
+	.fb_set_par = lynxfb_ops_set_par,
+	.fb_setcolreg = lynxfb_ops_setcolreg,
+	.fb_blank = lynxfb_ops_blank,
+	.fb_pan_display = lynxfb_ops_pan_display,
+	.fb_fillrect = lynxfb_ops_fillrect,
+	.fb_copyarea = lynxfb_ops_copyarea,
+	.fb_imageblit = lynxfb_ops_imageblit,
+};
+
+static const struct fb_ops lynxfb_ops_accel_with_cursor = {
+	.owner = THIS_MODULE,
+	.fb_check_var =  lynxfb_ops_check_var,
+	.fb_set_par = lynxfb_ops_set_par,
+	.fb_setcolreg = lynxfb_ops_setcolreg,
+	.fb_blank = lynxfb_ops_blank,
+	.fb_pan_display = lynxfb_ops_pan_display,
+	.fb_fillrect = lynxfb_ops_fillrect,
+	.fb_copyarea = lynxfb_ops_copyarea,
+	.fb_imageblit = lynxfb_ops_imageblit,
 	.fb_cursor = lynxfb_ops_cursor,
 };
 
@@ -714,7 +751,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	par->index = index;
 	output->channel = &crtc->channel;
 	sm750fb_set_drv(par);
-	lynxfb_ops.fb_pan_display = lynxfb_ops_pan_display;
 
 	/*
 	 * set current cursor variable and proc pointer,
@@ -731,19 +767,22 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
-	if (!g_hwcursor) {
-		lynxfb_ops.fb_cursor = NULL;
+	if (!g_hwcursor)
 		sm750_hw_cursor_disable(&crtc->cursor);
-	}
 
 	/* set info->fbops, must be set before fb_find_mode */
 	if (!sm750_dev->accel_off) {
 		/* use 2d acceleration */
-		lynxfb_ops.fb_fillrect = lynxfb_ops_fillrect;
-		lynxfb_ops.fb_copyarea = lynxfb_ops_copyarea;
-		lynxfb_ops.fb_imageblit = lynxfb_ops_imageblit;
+		if (!g_hwcursor)
+			info->fbops = &lynxfb_ops_accel;
+		else
+			info->fbops = &lynxfb_ops_accel_with_cursor;
+	} else {
+		if (!g_hwcursor)
+			info->fbops = &lynxfb_ops;
+		else
+			info->fbops = &lynxfb_ops_with_cursor;
 	}
-	info->fbops = &lynxfb_ops;
 
 	if (!g_fbmode[index]) {
 		g_fbmode[index] = g_def_fbmode;
-- 
2.43.0


