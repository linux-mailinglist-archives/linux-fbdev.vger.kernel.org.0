Return-Path: <linux-fbdev+bounces-2068-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B33658AAA53
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 10:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7B9C1C218D9
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 08:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867615FEED;
	Fri, 19 Apr 2024 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j7Rl/AeQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pC7vGNQL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dBmGP2DU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FqOHM+Hi"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324C353371
	for <linux-fbdev@vger.kernel.org>; Fri, 19 Apr 2024 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713515622; cv=none; b=FVe+4zIkSDp2DWkyrFBWlgtWKnT7nms50WXRVphypeR1GSIov9fLAprfHpNIlyQsWcH8P1XEO+BmpD2ZFwnH1BksUotrBlQaLlmMR7avgzebZJB+UFoxg7FRgI2YPcrhbaUKJL6FE3QCyKxn1xLxn+pTb23r8zLNVOguj4c/au8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713515622; c=relaxed/simple;
	bh=US7xKLBRtZCdsBI99hGqDrHXVSbrUML2aFSZ0il8mIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJSw/uZQ1ydgZn2UFQHhM/rKek9XHEuF5U7sCQXIvqQZ7tcU2dzLROkFR1sliOsK5vcZaSSesf0cWpJAE3kWZTTbYhCLhE3+BuK472HSC9BaCAdTAeHHxkjL9KLkle/WoAPgwSY+GdJQ4luajNfHRYTCk9sdlwrOh/XlQhLGBoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j7Rl/AeQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pC7vGNQL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dBmGP2DU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FqOHM+Hi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D23823757C;
	Fri, 19 Apr 2024 08:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVsYxiTdFPi64o9T/Z43vpnf5eMBE2FuUI6SPQbFZ/c=;
	b=j7Rl/AeQkPyyfsZFbNAHepPAVuJ0KWP5Crkz7/CW0yyTnvREYE1BBpc7g4Lq9aSTmiv3T5
	CeT41UzOST9w/qKIw8BEsdrQ3LXqOjyxokcOwsRsLoax1PaP1LULNIpdacAs7tE7kPdmSP
	dTjqL/F99iD+rEzU6fbTWoKRf+QAQH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVsYxiTdFPi64o9T/Z43vpnf5eMBE2FuUI6SPQbFZ/c=;
	b=pC7vGNQLAQx3nVuoTVQfCxV9pP8DiRxUolBoMAe7OHV2Bt2Lxh0MA5R+96hwXVQ1cHuWug
	aHUrVSjb5sOSceCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dBmGP2DU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FqOHM+Hi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVsYxiTdFPi64o9T/Z43vpnf5eMBE2FuUI6SPQbFZ/c=;
	b=dBmGP2DUKrMHMyn0MZxnaqzDU0G9ESKauxHA7oCHPfNylzv2XdpoUoVwVuzyXYtQg0vAB8
	3MJRprBH2MmOQyV3f5V2rO0BsQQlavOQsicQX0M8l2vQLr2OoeEYFn8C73vJu4fzHA+B3U
	6Ek+GPeZ5NuXZIXOcYLPkWYrnhNn574=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVsYxiTdFPi64o9T/Z43vpnf5eMBE2FuUI6SPQbFZ/c=;
	b=FqOHM+HiTqKTOvju7dyvN9JEMhBaLpupVzch1Hl9aOKOIFODe79TcdYZxFCSP0iYJrdxgp
	WRjIxqZSTIMqzSDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F36413984;
	Fri, 19 Apr 2024 08:33:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AI6rJWAsImb9agAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 19 Apr 2024 08:33:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 02/43] fbdev/deferred-io: Move pageref setup into separate helper
Date: Fri, 19 Apr 2024 10:28:55 +0200
Message-ID: <20240419083331.7761-3-tzimmermann@suse.de>
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
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D23823757C
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

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


