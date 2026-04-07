Return-Path: <linux-fbdev+bounces-6828-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM6jMtLN1GmtxgcAu9opvQ
	(envelope-from <linux-fbdev+bounces-6828-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Apr 2026 11:26:42 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B653ABF2F
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Apr 2026 11:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A8F9302419E
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Apr 2026 09:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698103A0B13;
	Tue,  7 Apr 2026 09:26:14 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176213A256B
	for <linux-fbdev@vger.kernel.org>; Tue,  7 Apr 2026 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553974; cv=none; b=qGgUsmYig8VDFQewcimRVmT1ua5vk+CMZeVx3l1TdVDg4lDtppRtcNhi3KiKIT5g8wOZZaYiFLtSHqlkhOYE4QVnb5FC9G4zdB0OizODuaxaUuRBd9MffoGW/Lw+GflnOvunxdXUCrkALxf37BTWxSoIUI41zzIMbXdQA4XX75Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553974; c=relaxed/simple;
	bh=ySbp4aj6BQOATdrKrKKrTtOypBpwIieGr1SqRNtv37w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QP2YwE72oM1I5WWebP/O5HOm5LjQr5Ypmw2pzRm93/MgZx+Vp8I1Q/0n+uezHf9Voow8fe78MBlC7PDMLNEUFYxdW97ar9knzk5U7/kUpT1I6gUuE3VhxRaI+HLhRFDLKilaGnXxcbGX2Av+fIHdfLI8fxehAPOAUU3ObTyAbJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A78E4E3A3;
	Tue,  7 Apr 2026 09:26:01 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D882E4A0B1;
	Tue,  7 Apr 2026 09:26:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cJeDM6jN1GmDVwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Apr 2026 09:26:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	geert@linux-m68k.org,
	simona@ffwll.ch,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 02/10] vt: Implement helpers for struct vc_font in source file
Date: Tue,  7 Apr 2026 11:23:13 +0200
Message-ID: <20260407092555.58816-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407092555.58816-1-tzimmermann@suse.de>
References: <20260407092555.58816-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6828-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,linuxfoundation.org,kernel.org,linux-m68k.org,ffwll.ch,ravnborg.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,pg.gda.pl:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 30B653ABF2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the helpers vc_font_pitch() and vc_font_size() from the VT
header file into source file. They are not called very often, so
there's no benefit in keeping them in the headers. Also avoids
including <linux/math.h> from the header.

v2:
- fix typo in commit description

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/vt/vt.c            | 35 ++++++++++++++++++++++++++++++++++
 include/linux/console_struct.h | 30 ++---------------------------
 2 files changed, 37 insertions(+), 28 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index e2df99e3d458..3d89d30c9596 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -71,6 +71,7 @@
  * by Adam Tla/lka <atlka@pg.gda.pl>, Aug 2006
  */
 
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/sched/signal.h>
@@ -230,6 +231,40 @@ enum {
 	blank_vesa_wait,
 };
 
+/*
+ * struct vc_font
+ */
+
+/**
+ * vc_font_pitch - Calculates the number of bytes between two adjacent scanlines
+ * @font: The VC font
+ *
+ * Returns:
+ * The number of bytes between two adjacent scanlines in the font data
+ */
+unsigned int vc_font_pitch(const struct vc_font *font)
+{
+	return DIV_ROUND_UP(font->width, 8);
+}
+EXPORT_SYMBOL_GPL(vc_font_pitch);
+
+/**
+ * vc_font_size - Calculates the size of the font data in bytes
+ * @font: The VC font
+ *
+ * vc_font_size() calculates the number of bytes of font data in the
+ * font specified by @font. The function calculates the size from the
+ * font parameters.
+ *
+ * Returns:
+ * The size of the font data in bytes.
+ */
+unsigned int vc_font_size(const struct vc_font *font)
+{
+	return font->height * vc_font_pitch(font) * font->charcount;
+}
+EXPORT_SYMBOL_GPL(vc_font_size);
+
 /*
  * /sys/class/tty/tty0/
  *
diff --git a/include/linux/console_struct.h b/include/linux/console_struct.h
index 6ce498b31855..fe915afdece5 100644
--- a/include/linux/console_struct.h
+++ b/include/linux/console_struct.h
@@ -13,7 +13,6 @@
 #ifndef _LINUX_CONSOLE_STRUCT_H
 #define _LINUX_CONSOLE_STRUCT_H
 
-#include <linux/math.h>
 #include <linux/vt.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
@@ -83,33 +82,8 @@ struct vc_font {
 	const unsigned char *data;
 };
 
-/**
- * vc_font_pitch - Calculates the number of bytes between two adjacent scanlines
- * @font: The VC font
- *
- * Returns:
- * The number of bytes between two adjacent scanlines in the font data
- */
-static inline unsigned int vc_font_pitch(const struct vc_font *font)
-{
-	return DIV_ROUND_UP(font->width, 8);
-}
-
-/**
- * vc_font_size - Calculates the size of the font data in bytes
- * @font: The VC font
- *
- * vc_font_size() calculates the number of bytes of font data in the
- * font specified by @font. The function calculates the size from the
- * font parameters.
- *
- * Returns:
- * The size of the font data in bytes.
- */
-static inline unsigned int vc_font_size(const struct vc_font *font)
-{
-	return font->height * vc_font_pitch(font) * font->charcount;
-}
+unsigned int vc_font_pitch(const struct vc_font *font);
+unsigned int vc_font_size(const struct vc_font *font);
 
 /*
  * Example: vc_data of a console that was scrolled 3 lines down.
-- 
2.53.0


