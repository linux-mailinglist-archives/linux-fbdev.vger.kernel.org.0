Return-Path: <linux-fbdev+bounces-1427-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 986408797FD
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 16:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F3F21F22ADD
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 15:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549637D061;
	Tue, 12 Mar 2024 15:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gYGAvr1A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2N3+K+mR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gYGAvr1A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2N3+K+mR"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A630E7C6F6
	for <linux-fbdev@vger.kernel.org>; Tue, 12 Mar 2024 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710258522; cv=none; b=bPQG9UpDpmYHc43raj1jJU67RBXqoFIY616gUxP+cA94rupwvDk/DnB96Eeff2eY9xyaQkOKMMa1s0Nm+qsKJ7H5wHcK4RS1zTnomCmFZ4aBztM4srtUKoNd7GPgRRoe1aOAU/NWlhaAIPNmBHpTI7xcVsZTR0sqtKlc++KpHV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710258522; c=relaxed/simple;
	bh=j6gnAjtRdOw7uG5pwHGGfFhNXDqt++HBmEiff0fNWTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvTvPl0ExJMxNnY7bzEiNvqqzKeVg+6pjEklr+bh0nNg1v/QG0qFBoAPsxrT/7kYwGKMbbU8C08IHhotxd4y/iJKEt/kIMVM8331KcOGR5IMekIbZ4QCWK6+1LG8fO/Nsj1W2kF7z19IncDZHGp2vYgUkkubMSxJbdw7nEVNzUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gYGAvr1A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2N3+K+mR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gYGAvr1A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2N3+K+mR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CB1CB37877;
	Tue, 12 Mar 2024 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710258518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PklQcVgrNOaKzshXPJwMN6AoIxJpZP0wEgBnSK9Gf7c=;
	b=gYGAvr1Am9V+Y63IkgTqtTgNodzRKIawJMBLjCgYbGpedY4pWHBi8yQaGuEqaFVrzuaHoC
	oHAdWLm+D5JaiYU/uCEpdUoA6e9VH7pO6PRO6ErLE1z+dNOB8tIb0uMHiSgfkRhUxd7Ky1
	/Cnvjg425W9m77LmkyRQaTEAPn9tLcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710258518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PklQcVgrNOaKzshXPJwMN6AoIxJpZP0wEgBnSK9Gf7c=;
	b=2N3+K+mReo0MsMDG+XI94fRp5dtU6PXI6wJNcNlp+YZ144V7gMkd6kXxxlze/R1jpGXVg3
	pVk4BaYe8nvk2lAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710258518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PklQcVgrNOaKzshXPJwMN6AoIxJpZP0wEgBnSK9Gf7c=;
	b=gYGAvr1Am9V+Y63IkgTqtTgNodzRKIawJMBLjCgYbGpedY4pWHBi8yQaGuEqaFVrzuaHoC
	oHAdWLm+D5JaiYU/uCEpdUoA6e9VH7pO6PRO6ErLE1z+dNOB8tIb0uMHiSgfkRhUxd7Ky1
	/Cnvjg425W9m77LmkyRQaTEAPn9tLcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710258518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PklQcVgrNOaKzshXPJwMN6AoIxJpZP0wEgBnSK9Gf7c=;
	b=2N3+K+mReo0MsMDG+XI94fRp5dtU6PXI6wJNcNlp+YZ144V7gMkd6kXxxlze/R1jpGXVg3
	pVk4BaYe8nvk2lAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90C4B13976;
	Tue, 12 Mar 2024 15:48:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yBjfIVZ58GUhPwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 12 Mar 2024 15:48:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/43] fbdev/deferred-io: Always call get_page() for framebuffer pages
Date: Tue, 12 Mar 2024 16:45:01 +0100
Message-ID: <20240312154834.26178-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312154834.26178-1-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 URIBL_BLOCKED(0.00)[suse.de:email];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[22.38%]
X-Spam-Score: 0.90
X-Spam-Flag: NO

Unconditionally call get_page() after looking up a page from the
framebuffer memory. Guarantees that we always hold a reference.

This change also refactors the code such that it can support a
driver-supplied get_page helper. This will be useful for DRM's
fbdev emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_defio.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index fe84218ded457..6e0bbcfdb01b5 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -23,7 +23,7 @@
 #include <linux/rmap.h>
 #include <linux/pagemap.h>
 
-static struct page *fb_deferred_io_page(struct fb_info *info, unsigned long offs)
+static struct page *fb_deferred_io_get_page(struct fb_info *info, unsigned long offs)
 {
 	const void *screen_buffer = info->screen_buffer;
 	struct page *page = NULL;
@@ -33,6 +33,9 @@ static struct page *fb_deferred_io_page(struct fb_info *info, unsigned long offs
 	else if (info->fix.smem_start)
 		page = pfn_to_page((info->fix.smem_start + offs) >> PAGE_SHIFT);
 
+	if (page)
+		get_page(page);
+
 	return page;
 }
 
@@ -129,12 +132,10 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 	if (offset >= info->fix.smem_len)
 		return VM_FAULT_SIGBUS;
 
-	page = fb_deferred_io_page(info, offset);
+	page = fb_deferred_io_get_page(info, offset);
 	if (!page)
 		return VM_FAULT_SIGBUS;
 
-	get_page(page);
-
 	if (vmf->vma->vm_file)
 		page->mapping = vmf->vma->vm_file->f_mapping;
 	else
-- 
2.44.0


