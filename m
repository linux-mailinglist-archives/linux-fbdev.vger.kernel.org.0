Return-Path: <linux-fbdev+bounces-226-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 700047FA07A
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Nov 2023 14:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F0CE1C20E1A
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Nov 2023 13:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDF82DF84;
	Mon, 27 Nov 2023 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41871A3
	for <linux-fbdev@vger.kernel.org>; Mon, 27 Nov 2023 05:17:04 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE038203FB;
	Mon, 27 Nov 2023 13:17:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 84E8113B3C;
	Mon, 27 Nov 2023 13:17:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 8MtWH8yWZGUhLQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 02/32] fbdev/sm712fb: Use correct initializer macros for struct fb_ops
Date: Mon, 27 Nov 2023 14:15:31 +0100
Message-ID: <20231127131655.4020-3-tzimmermann@suse.de>
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
X-Spamd-Bar: +++++++++
X-Spam-Score: 9.10
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither permitted nor denied by domain of tzimmermann@suse.de) smtp.mailfrom=tzimmermann@suse.de;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.de (policy=none)
X-Rspamd-Queue-Id: BE038203FB
X-Spamd-Result: default: False [9.10 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_SPF_SOFTFAIL(4.60)[~all:c];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.19)[-0.972];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 FREEMAIL_TO(0.00)[redhat.com,gmx.de];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-0.998];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,arndb.de:email,gmx.de:email,ravnborg.org:email,siliconmotion.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,suse.de,gmail.com,siliconmotion.com,ravnborg.org,arndb.de];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]

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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
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
2.43.0


