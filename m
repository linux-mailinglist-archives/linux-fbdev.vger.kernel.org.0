Return-Path: <linux-fbdev+bounces-6714-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PEzO4CAxmnQLAUAu9opvQ
	(envelope-from <linux-fbdev+bounces-6714-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2026 14:05:04 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CD287344BC6
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2026 14:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95FC33045BD2
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2026 13:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E39A3EAC7D;
	Fri, 27 Mar 2026 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mdH5OOOS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zTO/JAbr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mdH5OOOS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zTO/JAbr"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9287F3E8683
	for <linux-fbdev@vger.kernel.org>; Fri, 27 Mar 2026 13:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616687; cv=none; b=QwcUFVLz4k5fDGMZQ8mYTYDpBKfcLseBQuB/AqJELYEFc3KIvwiEvA88ZPZBTJKDOqb/L42nzrKN9Sf1HjWrud6QfXeP7TxIXHzOflJ++V/kQ3rLxrPXgx3J7okub9FsCTZE2CDPg3T6Z3ENPlMRtrGvYyeRdHtzByDOD2r/wI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616687; c=relaxed/simple;
	bh=7SWK6+xforbO9ObuX1tAwg0BTEZ2KvUbTuIZ961ycCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KcgrL/khku2Uc/0HMt5GGfwFMZS4L8JgtZRIHcA2Ll6KXnlw/s0PkFlS+ul3F8foxP9qQHT5PKfBMRZWRcntunG3LhCRNZaR0iaqbrCJ4G5Q5AvfgrW/2Lcciz7q3BqAVrimmMurDMlMa9mvl/fq5Rqrq4mIsHrVXuqPXYzIB9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mdH5OOOS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zTO/JAbr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mdH5OOOS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zTO/JAbr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7DE095BE3D;
	Fri, 27 Mar 2026 13:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774616676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76Lu2FhyqR0U2rrMx7Vy0WuE3C2Dk7OvXdlLMk2AL6M=;
	b=mdH5OOOSREPZ1IUJSb0PHSMI6D07zcchroWeh1RULvFETSTOy8Zctx0EPhSYK0LUgrXiKU
	aEWJ6MkUygguz6UWy88RpArUJTBHRqefM2wDG9ateaZ8rbByYX9u4IKHQiIlSRPr4S6QkE
	Kcg7aExVoZAfmXGv6+RKD+zQsVy4u4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774616676;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76Lu2FhyqR0U2rrMx7Vy0WuE3C2Dk7OvXdlLMk2AL6M=;
	b=zTO/JAbrljkCciSwQQrq2EvPiiq7b8Q29FLA+coRxxeOGmGo6IWdyC0w42VvV7S3eIsoGd
	Ha9p/a5XAuJjN8AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774616676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76Lu2FhyqR0U2rrMx7Vy0WuE3C2Dk7OvXdlLMk2AL6M=;
	b=mdH5OOOSREPZ1IUJSb0PHSMI6D07zcchroWeh1RULvFETSTOy8Zctx0EPhSYK0LUgrXiKU
	aEWJ6MkUygguz6UWy88RpArUJTBHRqefM2wDG9ateaZ8rbByYX9u4IKHQiIlSRPr4S6QkE
	Kcg7aExVoZAfmXGv6+RKD+zQsVy4u4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774616676;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76Lu2FhyqR0U2rrMx7Vy0WuE3C2Dk7OvXdlLMk2AL6M=;
	b=zTO/JAbrljkCciSwQQrq2EvPiiq7b8Q29FLA+coRxxeOGmGo6IWdyC0w42VvV7S3eIsoGd
	Ha9p/a5XAuJjN8AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E1D64A0A2;
	Fri, 27 Mar 2026 13:04:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0Dn3DWSAxmmweQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 27 Mar 2026 13:04:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	simona@ffwll.ch,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/10] vt: Implement helpers for struct vc_font in source file
Date: Fri, 27 Mar 2026 13:49:35 +0100
Message-ID: <20260327130431.59481-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327130431.59481-1-tzimmermann@suse.de>
References: <20260327130431.59481-1-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6714-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FREEMAIL_TO(0.00)[gmx.de,linuxfoundation.org,kernel.org,ffwll.ch,ravnborg.org];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pg.gda.pl:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid]
X-Rspamd-Queue-Id: CD287344BC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the helpers vc_font_pitch() and vc_font_size() from the VT
header file into source file. They are not called very often, so
there's no benefit in keeping them in the headers. Also avoids
including <liux/math.h> from the header.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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


