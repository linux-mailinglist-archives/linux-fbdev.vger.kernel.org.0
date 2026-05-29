Return-Path: <linux-fbdev+bounces-7442-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MICyJM6dGWq7xwgAu9opvQ
	(envelope-from <linux-fbdev+bounces-7442-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 May 2026 16:08:14 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E9B60348F
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 May 2026 16:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 421EA3010F31
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 May 2026 14:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B029B3403FD;
	Fri, 29 May 2026 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D4Axksh5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gYiNLAa+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D4Axksh5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gYiNLAa+"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF918344DAB
	for <linux-fbdev@vger.kernel.org>; Fri, 29 May 2026 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063687; cv=none; b=aorN+ce7Q7/3dIXumb4usTCJM/x5f2DsTOyOOUp2pdUBzIXdCoA4/Id5AqexrU/LSk2o0i9q7tyQFxcOZomT58AqnH52fblYO5JdYyF4UsdeaQXP622dPRBJfiKc6xi487kPHVsSY+6jy+sNavwHQkW+97oX/F45cJ0hm/+lAhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063687; c=relaxed/simple;
	bh=v6ihfBfc3Ss/yKROUBLKW+umX5fdk+DuovPc9DbJ4TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOv3eZOFxQ/vx0CiAzxETJxf2h0Epx4RhqsrwgT9wmncYbKPoWDUksbOmlodSAOJlpBULaO0aq9r5/YXs/D57tWITzqzxI63wpZDajJYguFpyr/Jq1xFtl9ZzMRg26CucoJhkhlynwRs84rnTJp8o4q46wXBgAUuH4XzzdjncjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D4Axksh5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gYiNLAa+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D4Axksh5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gYiNLAa+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1FB526AD6B;
	Fri, 29 May 2026 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780063684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efjuk97bxAbVY/ZjELo3tpTtD8zKWT42WxrwjHCosIs=;
	b=D4Axksh5zcOve79ye0/Ep2N8xfAsIj8UQrrEx7XrTsaTB1kzOwZ7Z3JFVeXl20nUSyB9/Y
	TVVD4wpex+lSdAuev7CsScVDcEAA/baX0DxB4j/SmerNDFeb2d6FktdMzSwgYhSi4t4zCm
	nQeLM1jhg2zRze7OfiJRpVbk9T+IfxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780063684;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efjuk97bxAbVY/ZjELo3tpTtD8zKWT42WxrwjHCosIs=;
	b=gYiNLAa+ykK3sb90Ep9YGqHx/CPCmMC7XAka/rjgApbVtv+LfD11HHl65bNANQOEcoQYp5
	z52DXyUrSoToVjAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D4Axksh5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gYiNLAa+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780063684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efjuk97bxAbVY/ZjELo3tpTtD8zKWT42WxrwjHCosIs=;
	b=D4Axksh5zcOve79ye0/Ep2N8xfAsIj8UQrrEx7XrTsaTB1kzOwZ7Z3JFVeXl20nUSyB9/Y
	TVVD4wpex+lSdAuev7CsScVDcEAA/baX0DxB4j/SmerNDFeb2d6FktdMzSwgYhSi4t4zCm
	nQeLM1jhg2zRze7OfiJRpVbk9T+IfxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780063684;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efjuk97bxAbVY/ZjELo3tpTtD8zKWT42WxrwjHCosIs=;
	b=gYiNLAa+ykK3sb90Ep9YGqHx/CPCmMC7XAka/rjgApbVtv+LfD11HHl65bNANQOEcoQYp5
	z52DXyUrSoToVjAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1332779A9;
	Fri, 29 May 2026 14:08:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uLHcMcOdGWoybAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 29 May 2026 14:08:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	deller@gmx.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/4] lib/fonts: Look up glyph data with font_data_glyph_buf()
Date: Fri, 29 May 2026 16:01:23 +0200
Message-ID: <20260529140759.529929-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529140759.529929-1-tzimmermann@suse.de>
References: <20260529140759.529929-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7442-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FREEMAIL_TO(0.00)[redhat.com,gmx.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[suse.de:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 81E9B60348F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add font_data_glyph_buf() to retrieve a character's glyph data or NULL
otherwise. Console fonts can currently contain 256 or 512 glyphs. The
kernel-internal characters are of type char, unsigned short or unsigned
int. Catch all of them by accepting unsigned int. Callers possibly have
to cast from signed to unsigned types to reach all glyphs in a font.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/font.h |  3 +++
 lib/fonts/fonts.c    | 31 +++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/linux/font.h b/include/linux/font.h
index 6845f02d739a..ea23b727388b 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -101,6 +101,9 @@ font_data_t *font_data_import(const struct console_font *font, unsigned int vpit
 void font_data_get(font_data_t *fd);
 bool font_data_put(font_data_t *fd);
 unsigned int font_data_size(font_data_t *fd);
+const unsigned char *font_data_glyph_buf(font_data_t *fd,
+					 unsigned int width, unsigned int vpitch,
+					 unsigned int c);
 bool font_data_is_equal(font_data_t *lhs, font_data_t *rhs);
 int font_data_export(font_data_t *fd, struct console_font *font, unsigned int vpitch);
 
diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
index f5d5333450a0..4fc66722d00d 100644
--- a/lib/fonts/fonts.c
+++ b/lib/fonts/fonts.c
@@ -178,6 +178,37 @@ unsigned int font_data_size(font_data_t *fd)
 }
 EXPORT_SYMBOL_GPL(font_data_size);
 
+static unsigned int font_data_num_glyphs(font_data_t *fd, unsigned int width, unsigned int height)
+{
+	return font_data_size(fd) / font_glyph_size(width, height);
+}
+
+/**
+ * font_data_glyph_buf() - Returns the glyph for a specific character as raw bytes
+ * @fd: The font data
+ * @width: The glyph width in bits per scanline
+ * @vpitch: The number of scanlines per glyph
+ * @c: The character
+ *
+ * Glyphs start at fixed intervals within the font data. font_data_glyph_buf()
+ * returns the glyph shape of the specified character. If no such glyph
+ * exists in the font, it returns NULL.
+ *
+ * Returns:
+ * The character's raw glyph shape, or NULL if no glyph exists for the character. The
+ * provided buffer is read-only.
+ */
+const unsigned char *font_data_glyph_buf(font_data_t *fd,
+					 unsigned int width, unsigned int vpitch,
+					 unsigned int c)
+{
+	if (c >= font_data_num_glyphs(fd, width, vpitch))
+		return NULL;
+
+	return font_data_buf(fd) + font_glyph_size(width, vpitch) * c;
+}
+EXPORT_SYMBOL_GPL(font_data_glyph_buf);
+
 /**
  * font_data_is_equal - Compares font data for equality
  * @lhs: Left-hand side font data
-- 
2.54.0


