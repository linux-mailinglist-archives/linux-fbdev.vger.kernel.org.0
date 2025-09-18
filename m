Return-Path: <linux-fbdev+bounces-4823-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72231B29F88
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 Aug 2025 12:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 483411897BFF
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 Aug 2025 10:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A392E2820;
	Mon, 18 Aug 2025 10:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sJiA3U+Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5tDbxFiQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sJiA3U+Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5tDbxFiQ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6FA258EE7
	for <linux-fbdev@vger.kernel.org>; Mon, 18 Aug 2025 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755514190; cv=none; b=XnDJThOXPoduAZw70BAsHsxzTVQMZ0G+kWpbGjKCZxdGHs69zG+DBYSjlncJvC0ymAk2MY6eLWFUdK60RxZE+/rd2r7WruDDvX1QQJnfjkmpNrI8AIPBs/MPpMs5NXs5uf6L5zNP1omIAeOETykgdBGWHIIJIVIx+wrl/Rw8M4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755514190; c=relaxed/simple;
	bh=0UPhhVP2buaAp3DWsUl0ePEfpnjGlFILwrfVeqCPtOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M4LCgh+vsmA/OKEmepUNmyCxQzWTn5cHJvsddlXydUgrhcrAMnTfdA+FCmMe87zH9xL9wAGy9zAmysSDviWn7ihK4iYS7Jzo/rRC0DxVCynqp+/JcmtplEYkdT6TqzY5e6ZTKaPvwUb6cffuKWZysV7yGTd5nRkX8yNxKlgQAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sJiA3U+Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5tDbxFiQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sJiA3U+Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5tDbxFiQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 45EC91F453;
	Mon, 18 Aug 2025 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755514185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SlwBaOHMbntngllLxUjfFjKuq9yqNdldF6MaODxPOy0=;
	b=sJiA3U+YIdigkzfeNGN6rSA6X5y7QA5l3KK10Kmq7tLmRWoQ4MFDVEPvbfGqmowbcK0RkW
	VSkmYYCh2F50w/xmSOq6mwci5PHB6pJF8gndrNfavnP1V5WrFTqN869KXGSsJ3AxMFKvIY
	PJV+7AWAzsUkSCCH7atBkThKc7U4n6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755514185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SlwBaOHMbntngllLxUjfFjKuq9yqNdldF6MaODxPOy0=;
	b=5tDbxFiQ3zTYfX/mEe/DMBZAn9n++AvUbkzMCb4o7A2nQf8tMEKfFJVCUWWLInDW5hvHk8
	PpBMKawV1Ri3EsAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755514185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SlwBaOHMbntngllLxUjfFjKuq9yqNdldF6MaODxPOy0=;
	b=sJiA3U+YIdigkzfeNGN6rSA6X5y7QA5l3KK10Kmq7tLmRWoQ4MFDVEPvbfGqmowbcK0RkW
	VSkmYYCh2F50w/xmSOq6mwci5PHB6pJF8gndrNfavnP1V5WrFTqN869KXGSsJ3AxMFKvIY
	PJV+7AWAzsUkSCCH7atBkThKc7U4n6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755514185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SlwBaOHMbntngllLxUjfFjKuq9yqNdldF6MaODxPOy0=;
	b=5tDbxFiQ3zTYfX/mEe/DMBZAn9n++AvUbkzMCb4o7A2nQf8tMEKfFJVCUWWLInDW5hvHk8
	PpBMKawV1Ri3EsAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1522F13A73;
	Mon, 18 Aug 2025 10:49:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OBTxA0kFo2hQVQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 10:49:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	deller@gmx.de,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/6] fbcon: Fix empty lines in fbcon.h
Date: Mon, 18 Aug 2025 12:36:36 +0200
Message-ID: <20250818104655.235001-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818104655.235001-1-tzimmermann@suse.de>
References: <20250818104655.235001-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Add and remove empty lines as necessary to fix coding style. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbcon.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 4d97e6d8a16a..c535d8f84356 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -87,6 +87,7 @@ struct fbcon_ops {
 	u32    cursor_size;
 	u32    fd_size;
 };
+
     /*
      *  Attribute Decoding
      */
@@ -106,7 +107,6 @@ struct fbcon_ops {
 	((s) & 0x400)
 #define attr_blink(s) \
 	((s) & 0x8000)
-	
 
 static inline int mono_col(const struct fb_info *info)
 {
-- 
2.50.1


