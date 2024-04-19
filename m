Return-Path: <linux-fbdev+bounces-2063-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACDB8AAA4E
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 10:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 515B82864A5
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 08:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CB1657AC;
	Fri, 19 Apr 2024 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BX4fAXXj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KLDwDTJx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BX4fAXXj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KLDwDTJx"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B2B54913
	for <linux-fbdev@vger.kernel.org>; Fri, 19 Apr 2024 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713515621; cv=none; b=anGMpb0A5v66h/WWy3taIS1muzM6gwOTTRIYwuVgBIErtdf86uR3t5XqHL5Wj/3WQxG9Xdd9AQH6zQSLq7Ht+hTOeyPyeKzzY25UkaiF4p4mGbuH5okmwB4CVHalZDlUbClh/SAAOxt63VVBC/OD40X/Mbs+lWX4JzR7WwFyaZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713515621; c=relaxed/simple;
	bh=aoAyl9uUBor5Ms1PjmZhxmhCuzQMuXTC9By0YNdJai8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzNjJ5rgnlcrihVptFRlaFQG+HRPo7YAfmh+80jX2iJPYbWCIKsiH7LqkUTW0Lz7sMd5swbslYi63IR5j5NOK5T4KYF/55VFdUNv39JSHV89MiWipBMXikXA/UQ27yj6dpwSW++e5pgz1BeM9Gf2xeihXfQndZW46WtN3UZr6ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BX4fAXXj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KLDwDTJx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BX4fAXXj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KLDwDTJx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E63685D480;
	Fri, 19 Apr 2024 08:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yrVBVglS97iHpP8gqzH1FRofta6fhlXrGDfZ5OHWQg=;
	b=BX4fAXXjVgbo9XAI7atjY09eqU9CR+G952ErmY0snUjw9Uxd5BUgnusz3agrMLlvPC+fY6
	qJisK4kYzx3NJ7p6fRekRZn9jwpkyln5qzC9rZE3BUkHqGMiyHP2GQPCgfU1fLi5/Nagy7
	YUlxl48w6fupwW/PzJh+EK72Jp9FjD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yrVBVglS97iHpP8gqzH1FRofta6fhlXrGDfZ5OHWQg=;
	b=KLDwDTJxKvej0CxaLDB0tHMzTIa15rpJzeHubLXd3hN5tZZ5/XtsMJLzsx8VFls1yS4P/e
	UCShzrIh3X/IUxBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yrVBVglS97iHpP8gqzH1FRofta6fhlXrGDfZ5OHWQg=;
	b=BX4fAXXjVgbo9XAI7atjY09eqU9CR+G952ErmY0snUjw9Uxd5BUgnusz3agrMLlvPC+fY6
	qJisK4kYzx3NJ7p6fRekRZn9jwpkyln5qzC9rZE3BUkHqGMiyHP2GQPCgfU1fLi5/Nagy7
	YUlxl48w6fupwW/PzJh+EK72Jp9FjD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yrVBVglS97iHpP8gqzH1FRofta6fhlXrGDfZ5OHWQg=;
	b=KLDwDTJxKvej0CxaLDB0tHMzTIa15rpJzeHubLXd3hN5tZZ5/XtsMJLzsx8VFls1yS4P/e
	UCShzrIh3X/IUxBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B808C13687;
	Fri, 19 Apr 2024 08:33:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SH/GK2EsImb9agAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 19 Apr 2024 08:33:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 07/43] fbdev/deferred-io: Provide get_page hook in struct fb_deferred_io
Date: Fri, 19 Apr 2024 10:29:00 +0200
Message-ID: <20240419083331.7761-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419083331.7761-1-tzimmermann@suse.de>
References: <20240419083331.7761-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]

Add a callback for drivers to provide framebuffer pages to fbdev's
deferred-I/O helpers. Implementations need to acquire a reference on
the page before returning it. Returning NULL generates a SIGBUS
signal.

This will be useful for DRM's fbdev emulation with GEM-shmem buffer
objects.

v2:
- fix typo in commit message (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fb_defio.c | 4 ++++
 include/linux/fb.h                  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 6e0bbcfdb01b5..51928ff7961a5 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -25,9 +25,13 @@
 
 static struct page *fb_deferred_io_get_page(struct fb_info *info, unsigned long offs)
 {
+	struct fb_deferred_io *fbdefio = info->fbdefio;
 	const void *screen_buffer = info->screen_buffer;
 	struct page *page = NULL;
 
+	if (fbdefio->get_page)
+		return fbdefio->get_page(info, offs);
+
 	if (is_vmalloc_addr(screen_buffer + offs))
 		page = vmalloc_to_page(screen_buffer + offs);
 	else if (info->fix.smem_start)
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 3417103885e27..4eb6afa93737c 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -225,6 +225,7 @@ struct fb_deferred_io {
 	struct mutex lock; /* mutex that protects the pageref list */
 	struct list_head pagereflist; /* list of pagerefs for touched pages */
 	/* callback */
+	struct page *(*get_page)(struct fb_info *info, unsigned long offset);
 	void (*deferred_io)(struct fb_info *info, struct list_head *pagelist);
 };
 #endif
-- 
2.44.0


