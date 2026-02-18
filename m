Return-Path: <linux-fbdev+bounces-6254-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFDSLnB8lWl8RwIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6254-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 18 Feb 2026 09:46:40 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2100E154417
	for <lists+linux-fbdev@lfdr.de>; Wed, 18 Feb 2026 09:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E99C5310489E
	for <lists+linux-fbdev@lfdr.de>; Wed, 18 Feb 2026 08:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A89432252D;
	Wed, 18 Feb 2026 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXjAgxcQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+YcvbbTt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXjAgxcQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+YcvbbTt"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8326326922
	for <linux-fbdev@vger.kernel.org>; Wed, 18 Feb 2026 08:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403980; cv=none; b=U4fDXIpoVDTDcH1jTOAZnWvSl/xbMAxtnRTIN2kOWKapN9ZzdYNkToQGsJ7rbR5se81Akpx6g4IZQXKLDE4K4IQeELP8uqV7GFQA8E1tgPpIUFGVqMerF3+6shNfdfI1IqgOF+wXpNnAf+b0IsLLSzUNTL322tS80VSWPtfB7c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403980; c=relaxed/simple;
	bh=rt++1rOyH24xhyR/UKMz+OyIvVYgk6XvGA4TupzT8pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlT7YP54gbjTlx4dbS9gy/LCeMlLu/AQhG0YR+Nsqji5bnq36JBvwU0GHvbhE3uEL/YNRvgFyr5W6EVoKSO1jJJf69yC6Qb16/LfTMlXQyzsonLaClSacQeACISo9O7KeOMF5gPngaDpxWQ4FXQhpMyJI/O6hYm3L4d+iejrx00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MXjAgxcQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+YcvbbTt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MXjAgxcQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+YcvbbTt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E37F43E6FB;
	Wed, 18 Feb 2026 08:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771403945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QzqtmJhuJ2RxEAWSLSo7zzX/rZyzWuOAMbwlIRZfewI=;
	b=MXjAgxcQjy0BkN1IUrnfAvixhtazyANfUuc2XS2PswsX8K1AELcovruU8D39OW2qrEPLup
	07swLmZdm4XLtaYQ6TbgBfvGj0iLz2gzlsEocT1g5zDX/sKLEdBX2bVX84iTbQyU6MteCi
	BG/dEn0+NEGeD3RGuKa7zFh3O2PwxC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771403945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QzqtmJhuJ2RxEAWSLSo7zzX/rZyzWuOAMbwlIRZfewI=;
	b=+YcvbbTtWNEz/pQGc1UD7g/t1+vt5WcXAG8XNYnQiaCm7ADa11sgcQDQyM5xlpJ47tE9wl
	KkdhDxJpKeEe/VDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771403945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QzqtmJhuJ2RxEAWSLSo7zzX/rZyzWuOAMbwlIRZfewI=;
	b=MXjAgxcQjy0BkN1IUrnfAvixhtazyANfUuc2XS2PswsX8K1AELcovruU8D39OW2qrEPLup
	07swLmZdm4XLtaYQ6TbgBfvGj0iLz2gzlsEocT1g5zDX/sKLEdBX2bVX84iTbQyU6MteCi
	BG/dEn0+NEGeD3RGuKa7zFh3O2PwxC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771403945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QzqtmJhuJ2RxEAWSLSo7zzX/rZyzWuOAMbwlIRZfewI=;
	b=+YcvbbTtWNEz/pQGc1UD7g/t1+vt5WcXAG8XNYnQiaCm7ADa11sgcQDQyM5xlpJ47tE9wl
	KkdhDxJpKeEe/VDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A26A93EA65;
	Wed, 18 Feb 2026 08:39:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MDtzJql6lWn8LwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 18 Feb 2026 08:39:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/13] lib/fonts: Compare font data for equality with font_data_is_equal()
Date: Wed, 18 Feb 2026 09:16:00 +0100
Message-ID: <20260218083855.10743-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218083855.10743-1-tzimmermann@suse.de>
References: <20260218083855.10743-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6254-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmx.de,ravnborg.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2100E154417
X-Rspamd-Action: no action

Add font_data_is_equal() and update consoles to use it.

Font data is equal if it has the same size and contains the same values
on all bytes. Only fbcon uses a crc32 checksum. If set in both operands
the checksums have to be equal.

The new helper also guarantees to not compare internal fonts against
fonts from user space. Internal fonts cannot be ref-counted, so making
them equal to user-space fonts with the same byte sequence results in
undefined behavior.

The test only compares data buffers. Their interpretation is up each
console. Therefore remove a width test in fbcon_set_font().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/console/newport_con.c |  3 +--
 drivers/video/fbdev/core/fbcon.c    |  7 +-----
 include/linux/font.h                |  1 +
 lib/fonts/fonts.c                   | 37 +++++++++++++++++++++++++++--
 4 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index eee9695c3eb5..02bf4df05016 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -530,8 +530,7 @@ static int newport_set_font(int unit, const struct console_font *op,
 	/* check if font is already used by other console */
 	for (i = 0; i < MAX_NR_CONSOLES; i++) {
 		if (font_data[i] != FONT_DATA
-		    && font_data_size(font_data[i]) == size
-		    && !memcmp(font_data[i], new_data, size)) {
+		    && font_data_is_equal(font_data[i], new_data)) {
 			kfree(new_data - FONT_EXTRA_WORDS * sizeof(int));
 			/* current font is the same as the new one */
 			if (i == unit)
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index ebb9c5c1b247..6fbecce606fd 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2553,14 +2553,9 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	FNTSUM(new_data) = csum;
 	/* Check if the same font is on some other console already */
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
-		struct vc_data *tmp = vc_cons[i].d;
-
 		if (fb_display[i].userfont &&
 		    fb_display[i].fontdata &&
-		    FNTSUM(fb_display[i].fontdata) == csum &&
-		    font_data_size(fb_display[i].fontdata) == size &&
-		    tmp->vc_font.width == w &&
-		    !memcmp(fb_display[i].fontdata, new_data, size)) {
+		    font_data_is_equal(fb_display[i].fontdata, new_data)) {
 			kfree(new_data - FONT_EXTRA_WORDS * sizeof(int));
 			new_data = (u8 *)fb_display[i].fontdata;
 			break;
diff --git a/include/linux/font.h b/include/linux/font.h
index 3afb32b625d3..da9869ca2294 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -55,6 +55,7 @@ static inline const unsigned char *font_data_buf(font_data_t *fd)
 }
 
 unsigned int font_data_size(font_data_t *fd);
+bool font_data_is_equal(font_data_t *lhs, font_data_t *rhs);
 
 /*
  * Font lookup
diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
index 8c9a6762061c..c9f6328d5dda 100644
--- a/lib/fonts/fonts.c
+++ b/lib/fonts/fonts.c
@@ -12,18 +12,25 @@
  * for more details.
  */
 
+#include <linux/font.h>
 #include <linux/module.h>
-#include <linux/types.h>
 #include <linux/string.h>
+#include <linux/types.h>
+
+#include <asm/sections.h>
 #if defined(__mc68000__)
 #include <asm/setup.h>
 #endif
-#include <linux/font.h>
 
 /*
  * Helpers for font_data_t
  */
 
+static bool font_data_is_internal(font_data_t *fd)
+{
+	return is_kernel_rodata((unsigned long)fd);
+}
+
 /**
  * font_data_size - Return size of the font data in bytes
  * @fd: Font data
@@ -37,6 +44,32 @@ unsigned int font_data_size(font_data_t *fd)
 }
 EXPORT_SYMBOL_GPL(font_data_size);
 
+/**
+ * font_data_is_equal - Compares font data for equality
+ * @lhs: Left-hand side font data
+ * @rhs: Right-hand-size font data
+ *
+ * Font data is equal if is constain the same sequence of values. The
+ * helper also use the checksum, if both arguments contain it. Font data
+ * coming from different origins, internal or from user space, is never
+ * equal. Allowing this would break reference counting.
+ *
+ * Returns:
+ * True if the given font data is equal, false otherwise.
+ */
+bool font_data_is_equal(font_data_t *lhs, font_data_t *rhs)
+{
+	if (font_data_is_internal(lhs) != font_data_is_internal(rhs))
+		return false;
+	if (font_data_size(lhs) != font_data_size(rhs))
+		return false;
+	if (FNTSUM(lhs) && FNTSUM(rhs) && FNTSUM(lhs) != FNTSUM(rhs))
+		return false;
+
+	return !memcmp(lhs, rhs, FNTSIZE(lhs));
+}
+EXPORT_SYMBOL_GPL(font_data_is_equal);
+
 /*
  * Font lookup
  */
-- 
2.52.0


