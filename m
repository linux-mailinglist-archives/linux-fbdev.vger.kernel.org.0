Return-Path: <linux-fbdev+bounces-6521-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFXuDAnXrmlhJAIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6521-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 09 Mar 2026 15:19:53 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C735723A691
	for <lists+linux-fbdev@lfdr.de>; Mon, 09 Mar 2026 15:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EDB13007AEF
	for <lists+linux-fbdev@lfdr.de>; Mon,  9 Mar 2026 14:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D03F3D300A;
	Mon,  9 Mar 2026 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1WdUBwKT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OfALJV6F";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1WdUBwKT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OfALJV6F"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8ED3CF66E
	for <linux-fbdev@vger.kernel.org>; Mon,  9 Mar 2026 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065863; cv=none; b=uipvH/hxqGWYnxD+nlH/g+NAdNbBMlH43oJrW/1AiKmWNzylQa/Mv+Bhi8MFnFWVlfmrbcDf4Zh8j2rkZXgJod76B+APjlUtEIeCNqvZyzksnNPlw1N1omtDktw0A17xJNWmxKLrf8lpkePxHInMADwV//XXokxNXL0aKVlaYbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065863; c=relaxed/simple;
	bh=KALZsMCqudWuPmvMe0xoKmUA4AsvvKztti4OCOIbY0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTPJ7CFglQuu+RQAm0aRQJ5fGswiBZCGp90Rq4KOizwGKHg3i0EsJ2Ke3c9lhCE+5qBdacIQnO/l6eJa88A+55a0tWw2LARMyax+AQXh265rcRh9CbGrw4ehqxCKze7ohM2FhM1diDYo45QEnt3uqtNLxwU5i3Sao1Bz9cHPy+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1WdUBwKT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OfALJV6F; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1WdUBwKT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OfALJV6F; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2257F5BE1D;
	Mon,  9 Mar 2026 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773065851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkFX7hcGtwsA7uQ5xnjWz1xBCczQKP2Ld4rm28KaAPI=;
	b=1WdUBwKTpHbscsvZSHd+jpZJdD5cG3cJZjTHMgBoa0K2vy2AdDu2mAiz3cmk1MJpU7N1eS
	XyLYjndNYaC2mZYdt/qi+xneU2D3JX/WFvZ4qIlGzvXeX2YZnO/pbU8YhegiavgMsPWbuV
	GVIkRgBCtsfWbqJuthTNtwRuNYDesiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773065851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkFX7hcGtwsA7uQ5xnjWz1xBCczQKP2Ld4rm28KaAPI=;
	b=OfALJV6FHBtPLvkz7fsL6Uu6Wndwmka6q3TRJnW+B/E3hRje0xSoJk7nWm2PhWa42HY97s
	y79FCiGkEqmmcRCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1WdUBwKT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OfALJV6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773065851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkFX7hcGtwsA7uQ5xnjWz1xBCczQKP2Ld4rm28KaAPI=;
	b=1WdUBwKTpHbscsvZSHd+jpZJdD5cG3cJZjTHMgBoa0K2vy2AdDu2mAiz3cmk1MJpU7N1eS
	XyLYjndNYaC2mZYdt/qi+xneU2D3JX/WFvZ4qIlGzvXeX2YZnO/pbU8YhegiavgMsPWbuV
	GVIkRgBCtsfWbqJuthTNtwRuNYDesiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773065851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkFX7hcGtwsA7uQ5xnjWz1xBCczQKP2Ld4rm28KaAPI=;
	b=OfALJV6FHBtPLvkz7fsL6Uu6Wndwmka6q3TRJnW+B/E3hRje0xSoJk7nWm2PhWa42HY97s
	y79FCiGkEqmmcRCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC4583EF3B;
	Mon,  9 Mar 2026 14:17:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kEBaNHrWrmldPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 09 Mar 2026 14:17:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 06/13] lib/fonts: Remove FNTCHARCNT()
Date: Mon,  9 Mar 2026 15:14:48 +0100
Message-ID: <20260309141723.137364-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309141723.137364-1-tzimmermann@suse.de>
References: <20260309141723.137364-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: C735723A691
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6521-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmx.de,ravnborg.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.979];
	DKIM_TRACE(0.00)[suse.de:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.de:dkim,suse.de:email,suse.de:mid]
X-Rspamd-Action: no action

The character count in the font data is unused. The internal fonts also
do not set it. Remove FNTCHARCNT().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/console/newport_con.c | 1 -
 include/linux/font.h                | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index b178678566e7..e2922caa8685 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -516,7 +516,6 @@ static int newport_set_font(int unit, const struct console_font *op,
 
 	new_data += FONT_EXTRA_WORDS * sizeof(int);
 	FNTSIZE(new_data) = size;
-	FNTCHARCNT(new_data) = op->charcount;
 	REFCOUNT(new_data) = 0;	/* usage counter */
 	FNTSUM(new_data) = 0;
 
diff --git a/include/linux/font.h b/include/linux/font.h
index fd8625cd76b2..d929c5fa32ca 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -68,7 +68,6 @@ extern const struct font_desc *get_default_font(int xres, int yres,
 /* Extra word getters */
 #define REFCOUNT(fd)	(((int *)(fd))[-1])
 #define FNTSIZE(fd)	(((int *)(fd))[-2])
-#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
 #define FNTSUM(fd)	(((int *)(fd))[-4])
 
 #define FONT_EXTRA_WORDS 4
-- 
2.53.0


