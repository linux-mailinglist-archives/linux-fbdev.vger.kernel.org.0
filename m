Return-Path: <linux-fbdev+bounces-6524-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOK2I3LXrmlhJAIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6524-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 09 Mar 2026 15:21:38 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 052DF23A6D4
	for <lists+linux-fbdev@lfdr.de>; Mon, 09 Mar 2026 15:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6072231140CB
	for <lists+linux-fbdev@lfdr.de>; Mon,  9 Mar 2026 14:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BECD3B8D46;
	Mon,  9 Mar 2026 14:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IApIuFeF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0nhlei8o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IApIuFeF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0nhlei8o"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861383B4E96
	for <linux-fbdev@vger.kernel.org>; Mon,  9 Mar 2026 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065874; cv=none; b=nAdbQuDcNRHAx8AHzcGGSd06o9DAXtg+rE/CQqt80BX+lJczJ5AkLMHMoWXUTlvy8jUgYmRYmAe/tpsk8Uyp/R+0jB5OpuQQpqyldTe8jU8eJjpvF8GQ+a8fGajPwa5vLtwEYfqQTwhnGrM1B4JPSdVv5Zm1Kzse2C5Y5WfHOHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065874; c=relaxed/simple;
	bh=SPMtHsartbmoAkf2ZKCxIiqmvk0T2sL/YD7WM4Q909g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dp8t/ZDT5egCufQY4uUpA1CE+Q8N9B+Vv52+Vx/7xFztNrd0ipnO5GANAcxuk6+qy+Z5o2s5AvnkAoYzv/amw/DgEi3l0BT45WJ0m5/2E71GpHGdjKUZuWCf7srpn+XYwZpg1p/ZwEKo7/xbZ29O6IAHRtq/TJ2SHEnfmnT4DJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IApIuFeF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0nhlei8o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IApIuFeF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0nhlei8o; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 52D654D243;
	Mon,  9 Mar 2026 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773065850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W87QsD52fexHhLihb7ZBj35HU6wFyK6TjGFCrQ4J8YU=;
	b=IApIuFeFWJeqg8hHe/x1wuBV5ThST3+RLhkxJ+/LjrMlZEXLAwQ7mkGv/4OBr6hmV1RWx9
	wbvXrhCMSP1VdVch7orh1D9SU5f67e3cCAilMq01wD4r2M7SiIUwsSG1jJZhjZsPtFNHpy
	oMf2bQnG8Hz9lmjCo6tezRwPNjugJiw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773065850;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W87QsD52fexHhLihb7ZBj35HU6wFyK6TjGFCrQ4J8YU=;
	b=0nhlei8oAyylxhCR+fNiZWvX5SgtIYtiYDn15LDazN+mWTBpsRsf8rePSAksGrpdZSs8Bg
	S+R1d3XfW6Qaz/Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IApIuFeF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0nhlei8o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773065850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W87QsD52fexHhLihb7ZBj35HU6wFyK6TjGFCrQ4J8YU=;
	b=IApIuFeFWJeqg8hHe/x1wuBV5ThST3+RLhkxJ+/LjrMlZEXLAwQ7mkGv/4OBr6hmV1RWx9
	wbvXrhCMSP1VdVch7orh1D9SU5f67e3cCAilMq01wD4r2M7SiIUwsSG1jJZhjZsPtFNHpy
	oMf2bQnG8Hz9lmjCo6tezRwPNjugJiw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773065850;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W87QsD52fexHhLihb7ZBj35HU6wFyK6TjGFCrQ4J8YU=;
	b=0nhlei8oAyylxhCR+fNiZWvX5SgtIYtiYDn15LDazN+mWTBpsRsf8rePSAksGrpdZSs8Bg
	S+R1d3XfW6Qaz/Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BE5B3EF3A;
	Mon,  9 Mar 2026 14:17:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yMqZBXrWrmldPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 09 Mar 2026 14:17:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 03/13] vt: Store font in struct vc_font
Date: Mon,  9 Mar 2026 15:14:45 +0100
Message-ID: <20260309141723.137364-4-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 052DF23A6D4
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
	TAGGED_FROM(0.00)[bounces-6524-lists,linux-fbdev=lfdr.de];
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

Replace struct console_font with struct vc_font for the type of the
vc_font field of struct vc_data. Struct console_font is UAPI, which
prevents further changes. Hence a new data type is required.

Struct console_font has a documented vertical pitch of 32 bytes. This
is not the case after the font data has been loaded into the kernel.
Changing the type of vc_font addresses this inconsistency.

The font data is now declared as constant, as it might come from the
kernel's read-only section. There's some fallout throughout the console
code where non-const variables refer to it. Fix them. A later update
will declare the font data to a dedicated data type.

v3:
- fix typos

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/bitblit.c | 11 +++++------
 drivers/video/fbdev/core/fbcon.c   |  4 ++--
 drivers/video/fbdev/core/fbcon.h   |  4 ++--
 include/linux/console_struct.h     | 29 +++++++++++++++++++++++++++--
 4 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index 085ffb44c51a..7478accea8ec 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -22,8 +22,7 @@
 /*
  * Accelerated handlers.
  */
-static void update_attr(u8 *dst, u8 *src, int attribute,
-			       struct vc_data *vc)
+static void update_attr(u8 *dst, const u8 *src, int attribute, struct vc_data *vc)
 {
 	int i, offset = (vc->vc_font.height < 10) ? 1 : 2;
 	int width = DIV_ROUND_UP(vc->vc_font.width, 8);
@@ -81,7 +80,7 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	unsigned int charcnt = vc->vc_font.charcount;
 	u32 idx = vc->vc_font.width >> 3;
-	u8 *src;
+	const u8 *src;
 
 	while (cnt--) {
 		u16 ch = scr_readw(s++) & charmask;
@@ -120,7 +119,7 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
 	u32 shift_low = 0, mod = vc->vc_font.width % 8;
 	u32 shift_high = 8;
 	u32 idx = vc->vc_font.width >> 3;
-	u8 *src;
+	const u8 *src;
 
 	while (cnt--) {
 		u16 ch = scr_readw(s++) & charmask;
@@ -267,7 +266,7 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	int y = real_y(par->p, vc->state.y);
 	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
 	int err = 1;
-	char *src;
+	const u8 *src;
 
 	cursor.set = 0;
 
@@ -278,7 +277,7 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	attribute = get_attribute(info, c);
 	src = vc->vc_font.data + ((c & charmask) * (w * vc->vc_font.height));
 
-	if (par->cursor_state.image.data != src ||
+	if (par->cursor_state.image.data != (const char *)src ||
 	    par->cursor_reset) {
 		par->cursor_state.image.data = src;
 		cursor.set |= FB_CUR_SETIMAGE;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 666261ae59d8..247bb90c08d3 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2286,7 +2286,7 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 
 static int fbcon_get_font(struct vc_data *vc, struct console_font *font, unsigned int vpitch)
 {
-	u8 *fontdata = vc->vc_font.data;
+	const u8 *fontdata = vc->vc_font.data;
 	u8 *data = font->data;
 	int i, j;
 
@@ -2417,7 +2417,7 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	struct fbcon_par *par = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	int resize, ret, old_userfont, old_width, old_height, old_charcount;
-	u8 *old_data = vc->vc_font.data;
+	const u8 *old_data = vc->vc_font.data;
 
 	resize = (w != vc->vc_font.width) || (h != vc->vc_font.height);
 	vc->vc_font.data = (void *)(p->fontdata = data);
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index fca14e9b729b..3f4386a40237 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -82,8 +82,8 @@ struct fbcon_par {
 	int    rotate;
 	int    cur_rotate;
 	char  *cursor_data;
-	u8    *fontbuffer;
-	u8    *fontdata;
+	u8          *fontbuffer;
+	const u8    *fontdata;
 	u8    *cursor_src;
 	u32    cursor_size;
 	u32    fd_size;
diff --git a/include/linux/console_struct.h b/include/linux/console_struct.h
index ebdb9750d348..ea0cdf4278a3 100644
--- a/include/linux/console_struct.h
+++ b/include/linux/console_struct.h
@@ -13,8 +13,9 @@
 #ifndef _LINUX_CONSOLE_STRUCT_H
 #define _LINUX_CONSOLE_STRUCT_H
 
-#include <linux/wait.h>
+#include <linux/math.h>
 #include <linux/vt.h>
+#include <linux/wait.h>
 #include <linux/workqueue.h>
 
 struct uni_pagedict;
@@ -58,6 +59,30 @@ struct vc_state {
 	bool		reverse;
 };
 
+/**
+ * struct vc_font - Describes a font
+ * @width: The width of a single glyph in bits
+ * @height: The height of a single glyph in scanlines
+ * @charcount: The number of glyphs in the font
+ * @data: The raw font data
+ *
+ * Font data is organized as an array of glyphs. Each glyph is a bitmap with
+ * set bits indicating the foreground color. Unset bits indicate background
+ * color. The fields @width and @height store a single glyph's number of
+ * horizontal bits and vertical scanlines. If width is not a multiple of 8,
+ * there are trailing bits to fill up the byte. These bits should not be drawn.
+ *
+ * The field @data points to the first glyph's first byte. The value @charcount
+ * gives the number of glyphs in the font. There are no empty scanlines between
+ * two adjacent glyphs.
+ */
+struct vc_font {
+	unsigned int width;
+	unsigned int height;
+	unsigned int charcount;
+	const unsigned char *data;
+};
+
 /*
  * Example: vc_data of a console that was scrolled 3 lines down.
  *
@@ -122,7 +147,7 @@ struct vc_data {
 	unsigned long	vc_pos;			/* Cursor address */
 	/* fonts */
 	unsigned short	vc_hi_font_mask;	/* [#] Attribute set for upper 256 chars of font or 0 if not supported */
-	struct console_font vc_font;		/* Current VC font set */
+	struct vc_font vc_font;			/* Current VC font set */
 	unsigned short	vc_video_erase_char;	/* Background erase character */
 	/* VT terminal data */
 	unsigned int	vc_state;		/* Escape sequence parser state */
-- 
2.53.0


