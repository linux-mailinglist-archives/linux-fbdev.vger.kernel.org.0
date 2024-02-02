Return-Path: <linux-fbdev+bounces-883-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB6E846FB0
	for <lists+linux-fbdev@lfdr.de>; Fri,  2 Feb 2024 13:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4F131F25F93
	for <lists+linux-fbdev@lfdr.de>; Fri,  2 Feb 2024 12:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C816122067;
	Fri,  2 Feb 2024 12:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LkwPn6zg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dTDiY4yj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ifa/6NzV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wiodzj3c"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FD813E222
	for <linux-fbdev@vger.kernel.org>; Fri,  2 Feb 2024 12:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706875308; cv=none; b=cOhKJx2/pggQga/FTpIuL9rpoLNAMZe9Du9obRDlETX4b6YIV/bGU3wsj1xOGvxbgljXmG0fTn2imZ7ovKk1ZeqlB0mYQ5aBUfDXya7zgqpXsPWidkWg6TGJQb6NxfYlYYRzMkupEx1iZzPAExOnuP8wU/Hz4lFjSc3udiC53ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706875308; c=relaxed/simple;
	bh=/RxmdnoLjG/IbnHavl8tMPPTqqsCdT6juXc+9hCmpS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLbvdFUf0HquiGZ5KG8b8lbW96sqc9VTrdmk+TbyxyrCszGlhfGmF11abrMafJ0hW5pryZxMMShpYsd+sfXJMOD7THplbJ8O35G25UZ1vInc9H3AAGaHxaTEdp/oq4YwfqS1mbtKMrwOXy+kxMZBJKMpSxNMLIcefuTrcgsnW5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LkwPn6zg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dTDiY4yj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ifa/6NzV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wiodzj3c; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 579061F770;
	Fri,  2 Feb 2024 12:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706875304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/NwzWdLw3sw3AOl5hDtCkAdEx+yfwxhpew6N4hH0Tk=;
	b=LkwPn6zgcMnMYK4xMO99HQkM8llctTSeFskd2cbNxuBofEGuKUNILKXZhVB/Y0vngb6LKq
	5lGkEKUpnwayEpAQECdPZz6NiJT+jYQiEy4nbfBp4tzRo2fLiJtWu0N293C11chXjXm0yl
	WpbORVBW4nDT2Xv654Zkm6y10oU1xnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706875304;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/NwzWdLw3sw3AOl5hDtCkAdEx+yfwxhpew6N4hH0Tk=;
	b=dTDiY4yjVdMV2qbO4HDMF0kgoVmh2ARFl3LstvWBQenfO47AZYyT7PnC/0FTu7OCN+in4n
	Kmm8VNuwOakf0YAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706875303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/NwzWdLw3sw3AOl5hDtCkAdEx+yfwxhpew6N4hH0Tk=;
	b=Ifa/6NzVbTWM5dgs207ahD3uVyVSRWAm/EdouYJ/XD/Mum7ewHBaZ8Di1Eu1wOfgf97QmX
	KlhsB4dCmapvdK26nv79t/58Vv4QJD4B4THfnAABQH++7ENnlGSKHDmrx1OEP9JLqH1i4A
	IaiJqhBadZWOdL1F1mFW/k1aRFsUS6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706875303;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/NwzWdLw3sw3AOl5hDtCkAdEx+yfwxhpew6N4hH0Tk=;
	b=wiodzj3cMVwxw9kCgLcg6tNtovH6J330WiUUxadeP71tqt5ZwF5NNgLwvJHeDgDamsc63r
	pUCrj+/zWFs+RcBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 229C813A5D;
	Fri,  2 Feb 2024 12:01:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qA5MB6fZvGWfeAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 02 Feb 2024 12:01:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	pjones@redhat.com,
	deller@gmx.de,
	ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/8] video: Add helpers for decoding screen_info
Date: Fri,  2 Feb 2024 12:58:42 +0100
Message-ID: <20240202120140.3517-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202120140.3517-1-tzimmermann@suse.de>
References: <20240202120140.3517-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[redhat.com,gmx.de,kernel.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

The plain values as stored in struct screen_info need to be decoded
before being used. Add helpers that decode the type of video output
and the framebuffer I/O aperture.

Old or non-x86 systems may not set the type of video directly, but
only indicate the presence by storing 0x01 in orig_video_isVGA. The
decoding logic in screen_info_video_type() takes this into account.
It then follows similar code in vgacon's vgacon_startup() to detect
the video type from the given values.

A call to screen_info_resources() returns all known resources of the
given screen_info. The resources' values have been taken from existing
code in vgacon and vga16fb. These drivers can later be converted to
use the new interfaces.

v2:
	* return ssize_t from screen_info_resources()
	* don't call __screen_info_has_lfb() unnecessarily

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/firmware/Kconfig            |   1 +
 drivers/video/Kconfig               |   4 +
 drivers/video/Makefile              |   3 +
 drivers/video/screen_info_generic.c | 146 ++++++++++++++++++++++++++++
 include/linux/screen_info.h         | 100 +++++++++++++++++++
 5 files changed, 254 insertions(+)
 create mode 100644 drivers/video/screen_info_generic.c

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index afd38539b92e5..71d8b26c4103b 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -182,6 +182,7 @@ config MTK_ADSP_IPC
 config SYSFB
 	bool
 	select BOOT_VESA_SUPPORT
+	select SCREEN_INFO
 
 config SYSFB_SIMPLEFB
 	bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 130ebccb83380..44c9ef1435a2d 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -11,6 +11,10 @@ config APERTURE_HELPERS
 	  Support tracking and hand-over of aperture ownership. Required
 	  by graphics drivers for firmware-provided framebuffers.
 
+config SCREEN_INFO
+	bool
+	default n
+
 config STI_CORE
 	bool
 	depends on PARISC
diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index 9eb5557911de5..117cbdbb58c2c 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -1,11 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_APERTURE_HELPERS)    += aperture.o
+obj-$(CONFIG_SCREEN_INFO)         += screen_info.o
 obj-$(CONFIG_STI_CORE)            += sticore.o
 obj-$(CONFIG_VGASTATE)            += vgastate.o
 obj-$(CONFIG_VIDEO)               += cmdline.o nomodeset.o
 obj-$(CONFIG_HDMI)                += hdmi.o
 
+screen_info-y			  := screen_info_generic.o
+
 obj-$(CONFIG_VT)		  += console/
 obj-$(CONFIG_FB_STI)		  += console/
 obj-$(CONFIG_LOGO)		  += logo/
diff --git a/drivers/video/screen_info_generic.c b/drivers/video/screen_info_generic.c
new file mode 100644
index 0000000000000..64117c6367abb
--- /dev/null
+++ b/drivers/video/screen_info_generic.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/export.h>
+#include <linux/ioport.h>
+#include <linux/screen_info.h>
+#include <linux/string.h>
+
+static void resource_init_named(struct resource *r,
+				resource_size_t start, resource_size_t size,
+				const char *name, unsigned int flags)
+{
+	memset(r, 0, sizeof(*r));
+
+	r->start = start;
+	r->end = start + size - 1;
+	r->name = name;
+	r->flags = flags;
+}
+
+static void resource_init_io_named(struct resource *r,
+				   resource_size_t start, resource_size_t size,
+				   const char *name)
+{
+	resource_init_named(r, start, size, name, IORESOURCE_IO);
+}
+
+static void resource_init_mem_named(struct resource *r,
+				   resource_size_t start, resource_size_t size,
+				   const char *name)
+{
+	resource_init_named(r, start, size, name, IORESOURCE_MEM);
+}
+
+static inline bool __screen_info_has_ega_gfx(unsigned int mode)
+{
+	switch (mode) {
+	case 0x0d:	/* 320x200-4 */
+	case 0x0e:	/* 640x200-4 */
+	case 0x0f:	/* 640x350-1 */
+	case 0x10:	/* 640x350-4 */
+		return true;
+	default:
+		return false;
+	}
+}
+
+static inline bool __screen_info_has_vga_gfx(unsigned int mode)
+{
+	switch (mode) {
+	case 0x10:	/* 640x480-1 */
+	case 0x12:	/* 640x480-4 */
+	case 0x13:	/* 320-200-8 */
+	case 0x6a:	/* 800x600-4 (VESA) */
+		return true;
+	default:
+		return __screen_info_has_ega_gfx(mode);
+	}
+}
+
+/**
+ * screen_info_resources() - Get resources from screen_info structure
+ * @si: the screen_info
+ * @r: pointer to an array of resource structures
+ * @num: number of elements in @r:
+ *
+ * Returns:
+ * The number of resources stored in @r on success, or a negative errno code otherwise.
+ *
+ * A call to screen_info_resources() returns the resources consumed by the
+ * screen_info's device or framebuffer. The result is stored in the caller-supplied
+ * array @r with up to @num elements. The function returns the number of
+ * initialized elements.
+ */
+ssize_t screen_info_resources(const struct screen_info *si, struct resource *r, size_t num)
+{
+	struct resource *pos = r;
+	unsigned int type = screen_info_video_type(si);
+	u64 base, size;
+
+	switch (type) {
+	case VIDEO_TYPE_MDA:
+		if (num > 0)
+			resource_init_io_named(pos++, 0x3b0, 12, "mda");
+		if (num > 1)
+			resource_init_io_named(pos++, 0x3bf, 0x01, "mda");
+		if (num > 2)
+			resource_init_mem_named(pos++, 0xb0000, 0x2000, "mda");
+		break;
+	case VIDEO_TYPE_CGA:
+		if (num > 0)
+			resource_init_io_named(pos++, 0x3d4, 0x02, "cga");
+		if (num > 1)
+			resource_init_mem_named(pos++, 0xb8000, 0x2000, "cga");
+		break;
+	case VIDEO_TYPE_EGAM:
+		if (num > 0)
+			resource_init_io_named(pos++, 0x3bf, 0x10, "ega");
+		if (num > 1)
+			resource_init_mem_named(pos++, 0xb0000, 0x8000, "ega");
+		break;
+	case VIDEO_TYPE_EGAC:
+		if (num > 0)
+			resource_init_io_named(pos++, 0x3c0, 0x20, "ega");
+		if (num > 1) {
+			if (__screen_info_has_ega_gfx(si->orig_video_mode))
+				resource_init_mem_named(pos++, 0xa0000, 0x10000, "ega");
+			else
+				resource_init_mem_named(pos++, 0xb8000, 0x8000, "ega");
+		}
+		break;
+	case VIDEO_TYPE_VGAC:
+		if (num > 0)
+			resource_init_io_named(pos++, 0x3c0, 0x20, "vga+");
+		if (num > 1) {
+			if (__screen_info_has_vga_gfx(si->orig_video_mode))
+				resource_init_mem_named(pos++, 0xa0000, 0x10000, "vga+");
+			else
+				resource_init_mem_named(pos++, 0xb8000, 0x8000, "vga+");
+		}
+		break;
+	case VIDEO_TYPE_VLFB:
+	case VIDEO_TYPE_EFI:
+		base = __screen_info_lfb_base(si);
+		if (!base)
+			break;
+		size = __screen_info_lfb_size(si, type);
+		if (!size)
+			break;
+		if (num > 0)
+			resource_init_mem_named(pos++, base, size, "lfb");
+		break;
+	case VIDEO_TYPE_PICA_S3:
+	case VIDEO_TYPE_MIPS_G364:
+	case VIDEO_TYPE_SGI:
+	case VIDEO_TYPE_TGAC:
+	case VIDEO_TYPE_SUN:
+	case VIDEO_TYPE_SUNPCI:
+	case VIDEO_TYPE_PMAC:
+	default:
+		/* not supported */
+		return -EINVAL;
+	}
+
+	return pos - r;
+}
+EXPORT_SYMBOL(screen_info_resources);
diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
index eab7081392d50..e7a02c5609d12 100644
--- a/include/linux/screen_info.h
+++ b/include/linux/screen_info.h
@@ -4,6 +4,106 @@
 
 #include <uapi/linux/screen_info.h>
 
+/**
+ * SCREEN_INFO_MAX_RESOURCES - maximum number of resources per screen_info
+ */
+#define SCREEN_INFO_MAX_RESOURCES	3
+
+struct resource;
+
+static inline bool __screen_info_has_lfb(unsigned int type)
+{
+	return (type == VIDEO_TYPE_VLFB) || (type == VIDEO_TYPE_EFI);
+}
+
+static inline u64 __screen_info_lfb_base(const struct screen_info *si)
+{
+	u64 lfb_base = si->lfb_base;
+
+	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+		lfb_base |= (u64)si->ext_lfb_base << 32;
+
+	return lfb_base;
+}
+
+static inline u64 __screen_info_lfb_size(const struct screen_info *si, unsigned int type)
+{
+	u64 lfb_size = si->lfb_size;
+
+	if (type == VIDEO_TYPE_VLFB)
+		lfb_size <<= 16;
+	return lfb_size;
+}
+
+static inline unsigned int __screen_info_video_type(unsigned int type)
+{
+	switch (type) {
+	case VIDEO_TYPE_MDA:
+	case VIDEO_TYPE_CGA:
+	case VIDEO_TYPE_EGAM:
+	case VIDEO_TYPE_EGAC:
+	case VIDEO_TYPE_VGAC:
+	case VIDEO_TYPE_VLFB:
+	case VIDEO_TYPE_PICA_S3:
+	case VIDEO_TYPE_MIPS_G364:
+	case VIDEO_TYPE_SGI:
+	case VIDEO_TYPE_TGAC:
+	case VIDEO_TYPE_SUN:
+	case VIDEO_TYPE_SUNPCI:
+	case VIDEO_TYPE_PMAC:
+	case VIDEO_TYPE_EFI:
+		return type;
+	default:
+		return 0;
+	}
+}
+
+/**
+ * screen_info_video_type() - Decodes the video type from struct screen_info
+ * @si: an instance of struct screen_info
+ *
+ * Returns:
+ * A VIDEO_TYPE_ constant representing si's type of video display, or 0 otherwise.
+ */
+static inline unsigned int screen_info_video_type(const struct screen_info *si)
+{
+	unsigned int type;
+
+	// check if display output is on
+	if (!si->orig_video_isVGA)
+		return 0;
+
+	// check for a known VIDEO_TYPE_ constant
+	type = __screen_info_video_type(si->orig_video_isVGA);
+	if (type)
+		return si->orig_video_isVGA;
+
+	// check if text mode has been initialized
+	if (!si->orig_video_lines || !si->orig_video_cols)
+		return 0;
+
+	// 80x25 text, mono
+	if (si->orig_video_mode == 0x07) {
+		if ((si->orig_video_ega_bx & 0xff) != 0x10)
+			return VIDEO_TYPE_EGAM;
+		else
+			return VIDEO_TYPE_MDA;
+	}
+
+	// EGA/VGA, 16 colors
+	if ((si->orig_video_ega_bx & 0xff) != 0x10) {
+		if (si->orig_video_isVGA)
+			return VIDEO_TYPE_VGAC;
+		else
+			return VIDEO_TYPE_EGAC;
+	}
+
+	// the rest...
+	return VIDEO_TYPE_CGA;
+}
+
+ssize_t screen_info_resources(const struct screen_info *si, struct resource *r, size_t num);
+
 extern struct screen_info screen_info;
 
 #endif /* _SCREEN_INFO_H */
-- 
2.43.0


