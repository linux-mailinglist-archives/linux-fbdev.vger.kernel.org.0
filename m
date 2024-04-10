Return-Path: <linux-fbdev+bounces-1900-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 300A889F360
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 15:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52EB51C26A59
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 13:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1981D15E203;
	Wed, 10 Apr 2024 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TPiSHBzc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xPfkx+rl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2YuBrrpq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h7p/vIvy"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2B415B995
	for <linux-fbdev@vger.kernel.org>; Wed, 10 Apr 2024 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754365; cv=none; b=aiXQaSAWggD2vLkwkLZfPNaXWXeS4SThqwcTOVgx+BkjKKnJ/Dshq/luXPLBoA7dp2/+4XIyml9c1gCQj/J4RhWOifE7ZvuZ7AV906WfWJcC5kxWPPIsplt6+OjDZG6tB3HLpUcIJOFaLPYi1YUgMRDciUHgadMK7uzaOE+Z9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754365; c=relaxed/simple;
	bh=US7xKLBRtZCdsBI99hGqDrHXVSbrUML2aFSZ0il8mIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a05kIlOx874rNZIYz+dOaUOq5wCUApp6CrzQZanNR4YcULb+Gk4ezdPy9VgVjzfTy4nWUhKW9QM7VGg5ccDQtadI3LWq9efSldTd1BON/fvm8GHCM8pudm7cUI07qTn/Ty4HW1tjVAckIHxl4KVkgND7GjDhrvz+3Z63IGCpumU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TPiSHBzc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xPfkx+rl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2YuBrrpq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h7p/vIvy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E2402351E5;
	Wed, 10 Apr 2024 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712754360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVsYxiTdFPi64o9T/Z43vpnf5eMBE2FuUI6SPQbFZ/c=;
	b=TPiSHBzcL4I8M80PevHPHNJIJnetn8wUR2l5DQnk4abRr+qpVdljGG/mEOWWmDbRWeIwfi
	VhPAvwvTpoBCuD2q3MeizVl/Z2ble3jJ4N+fgs94xyCJRcbXnnePbinUZ2X/R46B0xYlaL
	6Gk+ZnhHuh6Pv14bJVUU1Zo2dhSkgIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712754360;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVsYxiTdFPi64o9T/Z43vpnf5eMBE2FuUI6SPQbFZ/c=;
	b=xPfkx+rl7qbOrDHNfGYiKi7qmp7Uq+5zMpb0gCJtjKpH7Xqu9hiWLI2de6ml2nzcPyj39A
	oUSyBN0r6l7hH/AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712754359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVsYxiTdFPi64o9T/Z43vpnf5eMBE2FuUI6SPQbFZ/c=;
	b=2YuBrrpqJC4sF0nVym1U0fvqCgjdKiG7YT7rlp1GBLC3ayw9tp6IaBUj4FS791Cb35FNhG
	QGrLAABjkchAdBKfc2AlWKZB6/4aiTTOQ29SxATTtz3HfHA6Wgvn6FCmGakheAaoW3wH6d
	UPgJqpgZ517xvObiAAxvfBFy6J7z7EM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712754359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVsYxiTdFPi64o9T/Z43vpnf5eMBE2FuUI6SPQbFZ/c=;
	b=h7p/vIvyr0CtvKu1FioCFxei9nEfeQpFxDzFwxAN4SaWHvcWS2MCPibDMpe1vf67s8pbcA
	v28yFuzOWKUZ/cBw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id AAF3C13AA2;
	Wed, 10 Apr 2024 13:05:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id QD2CKLeOFmYdEgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 13:05:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 02/43] fbdev/deferred-io: Move pageref setup into separate helper
Date: Wed, 10 Apr 2024 15:01:58 +0200
Message-ID: <20240410130557.31572-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410130557.31572-1-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns,suse.de:email];
	FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]

Set up struct fb_deferred_io_pageref in the new helper function
fb_deferred_io_pageref_lookup(), which runs when the pageref is first
taken. Remove the setup code from the rest of the code.

At first, the code allocates the memory of all pageref structs. The
setup of the various fields happens when the pageref is required.

v2:
- fix typo in commit message (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fb_defio.c | 42 ++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index dae96c9f61cf8..bff1e300ed6bb 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -36,20 +36,43 @@ static struct page *fb_deferred_io_page(struct fb_info *info, unsigned long offs
 	return page;
 }
 
+static struct fb_deferred_io_pageref *fb_deferred_io_pageref_lookup(struct fb_info *info,
+								    unsigned long offset,
+								    struct page *page)
+{
+	unsigned long pgoff = offset >> PAGE_SHIFT;
+	struct fb_deferred_io_pageref *pageref;
+
+	if (fb_WARN_ON_ONCE(info, pgoff >= info->npagerefs))
+		return NULL; /* incorrect allocation size */
+
+	/* 1:1 mapping between pageref and page offset */
+	pageref = &info->pagerefs[pgoff];
+
+	if (pageref->page)
+		goto out;
+
+	pageref->page = page;
+	pageref->offset = pgoff << PAGE_SHIFT;
+	INIT_LIST_HEAD(&pageref->list);
+
+out:
+	if (fb_WARN_ON_ONCE(info, pageref->page != page))
+		return NULL; /* inconsistent state */
+	return pageref;
+}
+
 static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info *info,
 								 unsigned long offset,
 								 struct page *page)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct list_head *pos = &fbdefio->pagereflist;
-	unsigned long pgoff = offset >> PAGE_SHIFT;
 	struct fb_deferred_io_pageref *pageref, *cur;
 
-	if (WARN_ON_ONCE(pgoff >= info->npagerefs))
-		return NULL; /* incorrect allocation size */
-
-	/* 1:1 mapping between pageref and page offset */
-	pageref = &info->pagerefs[pgoff];
+	pageref = fb_deferred_io_pageref_lookup(info, offset, page);
+	if (!pageref)
+		return NULL;
 
 	/*
 	 * This check is to catch the case where a new process could start
@@ -60,9 +83,6 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info
 	if (!list_empty(&pageref->list))
 		goto pageref_already_added;
 
-	pageref->page = page;
-	pageref->offset = pgoff << PAGE_SHIFT;
-
 	if (unlikely(fbdefio->sort_pagereflist)) {
 		/*
 		 * We loop through the list of pagerefs before adding in
@@ -264,7 +284,7 @@ int fb_deferred_io_init(struct fb_info *info)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct fb_deferred_io_pageref *pagerefs;
-	unsigned long npagerefs, i;
+	unsigned long npagerefs;
 	int ret;
 
 	BUG_ON(!fbdefio);
@@ -286,8 +306,6 @@ int fb_deferred_io_init(struct fb_info *info)
 		ret = -ENOMEM;
 		goto err;
 	}
-	for (i = 0; i < npagerefs; ++i)
-		INIT_LIST_HEAD(&pagerefs[i].list);
 	info->npagerefs = npagerefs;
 	info->pagerefs = pagerefs;
 
-- 
2.44.0


