Return-Path: <linux-fbdev+bounces-53-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 335B17EC075
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Nov 2023 11:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B26FB20AC8
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Nov 2023 10:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400F846A8;
	Wed, 15 Nov 2023 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OUN6IbLI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HD2weQbL"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345E3DDAA
	for <linux-fbdev@vger.kernel.org>; Wed, 15 Nov 2023 10:30:00 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD53121
	for <linux-fbdev@vger.kernel.org>; Wed, 15 Nov 2023 02:29:58 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D96A6204E9;
	Wed, 15 Nov 2023 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700044196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0zNJk+sBtNLCvArNpYhdgvrV+XDhPMO6l+SQ57TPrnI=;
	b=OUN6IbLIIwZ4SBCDQsfWHRhdeDmGQuGhKobGA4Atqk0TER7yopA5Ncxdsqrac56RkHaEpe
	MaychEIWMLvpzvWTLZMjTKIUeMDH0O8DaWu4WQhAIhoaz03t4RbtJ0qQIIZmikwVt1FvRl
	IjowzttEksdH9IzIqoLxBIQd16gw2wE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700044196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0zNJk+sBtNLCvArNpYhdgvrV+XDhPMO6l+SQ57TPrnI=;
	b=HD2weQbLM7xsv4vBqKto/v9hIFhbM7XhbAzegeZTTWzxVBsRcCB4T+ixJgBSSd3Buw/Q67
	bLvCkONPOBkv7MDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD81C13592;
	Wed, 15 Nov 2023 10:29:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iGF0KaSdVGV+UAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 15 Nov 2023 10:29:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 02/32] fbdev/sm712fb: Use correct initializer macros for struct fb_ops
Date: Wed, 15 Nov 2023 11:19:07 +0100
Message-ID: <20231115102954.7102-3-tzimmermann@suse.de>
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
X-Spam-Score: -1.63
X-Spamd-Result: default: False [-1.63 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCVD_TLS_ALL(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_MISSING_CHARSET(2.50)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 BAYES_HAM(-0.03)[56.63%];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,suse.de,gmail.com,siliconmotion.com,ravnborg.org,arndb.de];
	 RCVD_COUNT_TWO(0.00)[2];
	 SUSPICIOUS_RECIPS(1.50)[]

Only initialize mmap and draw helpers with macros; leave read/write
callbacks to driver implementations. Fixes the following warnings:

  CC [M]  drivers/video/fbdev/sm712fb.o
  sm712fb.c:1355:25: warning: initialized field overwritten [-Woverride-init]
  1355 |         .fb_fillrect  = cfb_fillrect,
       |                         ^~~~~~~~~~~~
  sm712fb.c:1355:25: note: (near initialization for 'smtcfb_ops.fb_fillrect')
  sm712fb.c:1356:25: warning: initialized field overwritten [-Woverride-init]
  1356 |         .fb_imageblit = cfb_imageblit,
       |                         ^~~~~~~~~~~~~
  sm712fb.c:1356:25: note: (near initialization for 'smtcfb_ops.fb_imageblit')
  sm712fb.c:1357:25: warning: initialized field overwritten [-Woverride-init]
  1357 |         .fb_copyarea  = cfb_copyarea,
       |                         ^~~~~~~~~~~~
  sm712fb.c:1357:25: note: (near initialization for 'smtcfb_ops.fb_copyarea')
  sm712fb.c:1358:25: warning: initialized field overwritten [-Woverride-init]
  1358 |         .fb_read      = smtcfb_read,
       |                         ^~~~~~~~~~~
  sm712fb.c:1358:25: note: (near initialization for 'smtcfb_ops.fb_read')
  sm712fb.c:1359:25: warning: initialized field overwritten [-Woverride-init]
  1359 |         .fb_write     = smtcfb_write,
       |                         ^~~~~~~~~~~~
  sm712fb.c:1359:25: note: (near initialization for 'smtcfb_ops.fb_write')

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 586132cf1d38 ("fbdev/sm712fb: Initialize fb_ops to fbdev I/O-memory helpers")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Teddy Wang <teddy.wang@siliconmotion.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/sm712fb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index 3f8ef50e32095..104f122e0f273 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -1347,16 +1347,14 @@ static int smtc_set_par(struct fb_info *info)
 
 static const struct fb_ops smtcfb_ops = {
 	.owner        = THIS_MODULE,
-	FB_DEFAULT_IOMEM_OPS,
 	.fb_check_var = smtc_check_var,
 	.fb_set_par   = smtc_set_par,
 	.fb_setcolreg = smtc_setcolreg,
 	.fb_blank     = smtc_blank,
-	.fb_fillrect  = cfb_fillrect,
-	.fb_imageblit = cfb_imageblit,
-	.fb_copyarea  = cfb_copyarea,
+	__FB_DEFAULT_IOMEM_OPS_DRAW,
 	.fb_read      = smtcfb_read,
 	.fb_write     = smtcfb_write,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 /*
-- 
2.42.0


