Return-Path: <linux-fbdev+bounces-960-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1706284CBF2
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 14:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE8BE28C41F
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 13:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8555C7A702;
	Wed,  7 Feb 2024 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXyJ7e7s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dvHAGFFZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXyJ7e7s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dvHAGFFZ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2E576C9B
	for <linux-fbdev@vger.kernel.org>; Wed,  7 Feb 2024 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707313779; cv=none; b=A5nw1RgukEEDzQxHjAOFeTLLlT8M5EIwl+g7mFc+HBStLE6g7jjxe2ub7w3kjLvdlBNOMJr1lfE7OQ5pSBzuAEyvqhZ0/N3AN5yNs0H0qtCGgQYx7md5DZm2c8PiPDDoocltwy88TNFYgB/n6eDQBPuYR+XbQUvkQTGIphyXW8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707313779; c=relaxed/simple;
	bh=Qj5Q9ZIwzQ/rfgVQ+At4to2GLkb4gufB49ttJudVwVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iH3Ulo89Sa5bPuF9SOdKlT8xuX6I9rb/7aIcrGUAhWpvqgsSuORvwnAhdT7/t0/KB3Z/ASbP0WL8CCsnKi5zQasqCMX6vuSJs2Ikn1W/hUoZCjpEoQ1iP/hqoLmtuKRgS8laNDklpkj634Oyr1ORUqvS2NQgy190/2bRZ8iedRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MXyJ7e7s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dvHAGFFZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MXyJ7e7s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dvHAGFFZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 04416222F8;
	Wed,  7 Feb 2024 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707313776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzfJPbuCSE3CPf/KPTSR1M28eU5dvUFdAj7lj/2rk+Q=;
	b=MXyJ7e7s8BUSzZxkVzYNUr35rjs3ULjGNN+1ap7Z6YgxZiABDLlW2jIy4Qq85JJqa7KKHN
	kitVf6EWju6DcrNUAlJ6jXwFey/7+On+uczZmjdGOQOGlFbi+umwYKtP2UeBlshaBnwxHE
	BuECoZuOtni3hLeaYB7Q737FjxHng+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707313776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzfJPbuCSE3CPf/KPTSR1M28eU5dvUFdAj7lj/2rk+Q=;
	b=dvHAGFFZEUoAnAry6zBUWRe5BAEcXBWqVIhVssoxG7DskexefgFtclJjkXAeR3JA/1L5oV
	bzdRNJZjN5WRQVBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707313776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzfJPbuCSE3CPf/KPTSR1M28eU5dvUFdAj7lj/2rk+Q=;
	b=MXyJ7e7s8BUSzZxkVzYNUr35rjs3ULjGNN+1ap7Z6YgxZiABDLlW2jIy4Qq85JJqa7KKHN
	kitVf6EWju6DcrNUAlJ6jXwFey/7+On+uczZmjdGOQOGlFbi+umwYKtP2UeBlshaBnwxHE
	BuECoZuOtni3hLeaYB7Q737FjxHng+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707313776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzfJPbuCSE3CPf/KPTSR1M28eU5dvUFdAj7lj/2rk+Q=;
	b=dvHAGFFZEUoAnAry6zBUWRe5BAEcXBWqVIhVssoxG7DskexefgFtclJjkXAeR3JA/1L5oV
	bzdRNJZjN5WRQVBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A989F139B9;
	Wed,  7 Feb 2024 13:49:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SHnfJ2+Kw2V7IQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 07 Feb 2024 13:49:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	sui.jingfeng@linux.dev,
	pjones@redhat.com,
	deller@gmx.de,
	ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 2/8] video: Provide screen_info_get_pci_dev() to find screen_info's PCI device
Date: Wed,  7 Feb 2024 14:47:11 +0100
Message-ID: <20240207134932.7321-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207134932.7321-1-tzimmermann@suse.de>
References: <20240207134932.7321-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
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
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[redhat.com,linux.dev,gmx.de,kernel.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Add screen_info_get_pci_dev() to find the PCI device of an instance
of screen_info. Does nothing on systems without PCI bus.

v3:
	* search PCI device with pci_get_base_class() (Sui)
v2:
	* remove ret from screen_info_pci_dev() (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/Makefile          |  1 +
 drivers/video/screen_info_pci.c | 48 +++++++++++++++++++++++++++++++++
 include/linux/screen_info.h     | 10 +++++++
 3 files changed, 59 insertions(+)
 create mode 100644 drivers/video/screen_info_pci.c

diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index 117cbdbb58c2c..ffbac4387c670 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_VIDEO)               += cmdline.o nomodeset.o
 obj-$(CONFIG_HDMI)                += hdmi.o
 
 screen_info-y			  := screen_info_generic.o
+screen_info-$(CONFIG_PCI)         += screen_info_pci.o
 
 obj-$(CONFIG_VT)		  += console/
 obj-$(CONFIG_FB_STI)		  += console/
diff --git a/drivers/video/screen_info_pci.c b/drivers/video/screen_info_pci.c
new file mode 100644
index 0000000000000..d8985a54ce717
--- /dev/null
+++ b/drivers/video/screen_info_pci.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/pci.h>
+#include <linux/screen_info.h>
+
+static struct pci_dev *__screen_info_pci_dev(struct resource *res)
+{
+	struct pci_dev *pdev = NULL;
+	const struct resource *r = NULL;
+
+	if (!(res->flags & IORESOURCE_MEM))
+		return NULL;
+
+	while (!r && (pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
+		r = pci_find_resource(pdev, res);
+	}
+
+	return pdev;
+}
+
+/**
+ * screen_info_pci_dev() - Return PCI parent device that contains screen_info's framebuffer
+ * @si: the screen_info
+ *
+ * Returns:
+ * The screen_info's parent device or NULL on success, or a pointer-encoded
+ * errno value otherwise. The value NULL is not an error. It signals that no
+ * PCI device has been found.
+ */
+struct pci_dev *screen_info_pci_dev(const struct screen_info *si)
+{
+	struct resource res[SCREEN_INFO_MAX_RESOURCES];
+	ssize_t i, numres;
+
+	numres = screen_info_resources(si, res, ARRAY_SIZE(res));
+	if (numres < 0)
+		return ERR_PTR(numres);
+
+	for (i = 0; i < numres; ++i) {
+		struct pci_dev *pdev = __screen_info_pci_dev(&res[i]);
+
+		if (pdev)
+			return pdev;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(screen_info_pci_dev);
diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
index e7a02c5609d12..0eae08e3c6f90 100644
--- a/include/linux/screen_info.h
+++ b/include/linux/screen_info.h
@@ -9,6 +9,7 @@
  */
 #define SCREEN_INFO_MAX_RESOURCES	3
 
+struct pci_dev;
 struct resource;
 
 static inline bool __screen_info_has_lfb(unsigned int type)
@@ -104,6 +105,15 @@ static inline unsigned int screen_info_video_type(const struct screen_info *si)
 
 ssize_t screen_info_resources(const struct screen_info *si, struct resource *r, size_t num);
 
+#if defined(CONFIG_PCI)
+struct pci_dev *screen_info_pci_dev(const struct screen_info *si);
+#else
+static inline struct pci_dev *screen_info_pci_dev(const struct screen_info *si)
+{
+	return NULL;
+}
+#endif
+
 extern struct screen_info screen_info;
 
 #endif /* _SCREEN_INFO_H */
-- 
2.43.0


