Return-Path: <linux-fbdev+bounces-74-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D17EC08E
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Nov 2023 11:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C401F269BA
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Nov 2023 10:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F323FC15;
	Wed, 15 Nov 2023 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ICKgn/ak";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yOoKtzrp"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B20F9EA
	for <linux-fbdev@vger.kernel.org>; Wed, 15 Nov 2023 10:30:07 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C5B187
	for <linux-fbdev@vger.kernel.org>; Wed, 15 Nov 2023 02:30:02 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 88CC6204F6;
	Wed, 15 Nov 2023 10:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700044200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCtIc4cDy/x4uh9iPTBfdHlp2kRuJhjFxiquQhaLMKk=;
	b=ICKgn/akESczcXb9qmu35vQzTuNh6tVLjkPyfqF5pZ59kK/ws5OF09RuLkjtujE9npZJtR
	QaKpY13ZsfPDd1dRRd662Wnnx/+LomNNIn3UfsKvNPp8EfhydYst3HHBYEvFXSfwTpnH8V
	nkI5g/RLq6EIzDzxC0eE0HmwU2LMgh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700044200;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCtIc4cDy/x4uh9iPTBfdHlp2kRuJhjFxiquQhaLMKk=;
	b=yOoKtzrpITWZkESVKRGO+gQmu7A3fS5mO764pzPfDFjYKuX1gblTOqhGSV4zTaMhZF/JZP
	v3DTZZFymsgx41Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 664A613592;
	Wed, 15 Nov 2023 10:30:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OE4WGKidVGV+UAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 15 Nov 2023 10:30:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 24/32] fbdev/cyber2000fb: Initialize fb_ops with fbdev macros
Date: Wed, 15 Nov 2023 11:19:29 +0100
Message-ID: <20231115102954.7102-25-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115102954.7102-1-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.10
X-Spamd-Result: default: False [-6.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 R_MISSING_CHARSET(2.50)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]

Initialize the instance of struct fb_ops with fbdev initializer
macros for framebuffers in I/O address space. Set the read/write,
draw and mmap callbacks to the correct implementation and avoid
implicit defaults. Also select the necessary helpers in Kconfig.

Fbdev drivers sometimes rely on the callbacks being NULL for a
default I/O-memory-based implementation to be invoked; hence
requiring the I/O helpers to be built in any case. Setting all
callbacks in all drivers explicitly will allow to make the I/O
helpers optional. This benefits systems that do not use these
functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/video/fbdev/Kconfig       | 5 +----
 drivers/video/fbdev/cyber2000fb.c | 9 +--------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 357c125c11204..07eccd05390f2 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -178,10 +178,7 @@ config FB_IMX
 config FB_CYBER2000
 	tristate "CyberPro 2000/2010/5000 support"
 	depends on FB && PCI && (BROKEN || !SPARC64)
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
-	select FB_IOMEM_FOPS
+	select FB_IOMEM_HELPERS
 	select VIDEO_NOMODESET
 	help
 	  This enables support for the Integraphics CyberPro 20x0 and 5000
diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 52105dc1a72f3..abb87d3576db0 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -227,13 +227,6 @@ cyber2000fb_copyarea(struct fb_info *info, const struct fb_copyarea *region)
 			   CO_REG_CMD_H, cfb);
 }
 
-static void
-cyber2000fb_imageblit(struct fb_info *info, const struct fb_image *image)
-{
-	cfb_imageblit(info, image);
-	return;
-}
-
 static int cyber2000fb_sync(struct fb_info *info)
 {
 	struct cfb_info *cfb = container_of(info, struct cfb_info, fb);
@@ -1069,7 +1062,7 @@ static const struct fb_ops cyber2000fb_ops = {
 	.fb_pan_display	= cyber2000fb_pan_display,
 	.fb_fillrect	= cyber2000fb_fillrect,
 	.fb_copyarea	= cyber2000fb_copyarea,
-	.fb_imageblit	= cyber2000fb_imageblit,
+	.fb_imageblit	= cfb_imageblit,
 	.fb_sync	= cyber2000fb_sync,
 	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
-- 
2.42.0


