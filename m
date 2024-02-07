Return-Path: <linux-fbdev+bounces-962-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE4E84CBF5
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 14:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B30BB1C21ABC
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 13:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EEF7A720;
	Wed,  7 Feb 2024 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fiMJYm4l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+0/874P9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fiMJYm4l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+0/874P9"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2312777F08
	for <linux-fbdev@vger.kernel.org>; Wed,  7 Feb 2024 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707313779; cv=none; b=OoRzO+qenjr6+Dtd/hy8Sd/PTzDD7kO25Laqbx568oZ2/Hr53bL4rB8eeDbam3j4STQRFladsOqIQn2sGDamLCJd8D6qjwazIrjTH2zZ8qtxIpGsccHlgnZzsmtYnYatGrCtH+MmIzXpSA1BvhHgEUCVZGMVFpn6jItgI5PKDNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707313779; c=relaxed/simple;
	bh=EwWH25+0BhD4u3zr48Xo5K0iKZAR1DVSoeSUBqjpFCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1KQ6SooQlBjKMKML3nabri5wzXH0HurKSTNqFvUlOmW88d1J6LgwKyHv4x6Fk4endOrc1s8H3432eIrVB56erMWDaTZWKxBtUqOpRYQwSI7JsWSNyG7GPa0Niia6/AdN3DGanxxAXvpah1zomyhPhD+6YAQT9vsZMtWv245eFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fiMJYm4l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+0/874P9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fiMJYm4l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+0/874P9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4790C222FA;
	Wed,  7 Feb 2024 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707313776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zU8XfeUgLwBEaIvk3/13+9yRxdEwPJEFGWH8p2d55+4=;
	b=fiMJYm4lsdSAON2b2+6Xs/Jbt6iq3finIFrKGuxMRVF+s+zglLYQq6/6Mc2Lqc9Nlu2/x/
	BHy5vmPj85gLpBvaMlPvQpArot96YU0WacII8vGDjhWcRN1IwSk5UC9e/sw7IPOFxHNOvU
	9quC16x67+F4RBxjLnH3nVjLX9CuozE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707313776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zU8XfeUgLwBEaIvk3/13+9yRxdEwPJEFGWH8p2d55+4=;
	b=+0/874P958IkKJaUDU4jmzNLig0BTd0aj/Hsp1yVWHjL6QAcqPAIkwT3H1MyX04173kxRy
	H9eXr5J0vORvWbCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707313776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zU8XfeUgLwBEaIvk3/13+9yRxdEwPJEFGWH8p2d55+4=;
	b=fiMJYm4lsdSAON2b2+6Xs/Jbt6iq3finIFrKGuxMRVF+s+zglLYQq6/6Mc2Lqc9Nlu2/x/
	BHy5vmPj85gLpBvaMlPvQpArot96YU0WacII8vGDjhWcRN1IwSk5UC9e/sw7IPOFxHNOvU
	9quC16x67+F4RBxjLnH3nVjLX9CuozE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707313776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zU8XfeUgLwBEaIvk3/13+9yRxdEwPJEFGWH8p2d55+4=;
	b=+0/874P958IkKJaUDU4jmzNLig0BTd0aj/Hsp1yVWHjL6QAcqPAIkwT3H1MyX04173kxRy
	H9eXr5J0vORvWbCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01242139D8;
	Wed,  7 Feb 2024 13:49:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6MN4Om+Kw2V7IQAAD6G6ig
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
Subject: [PATCH v3 3/8] firmware/sysfb: Set firmware-framebuffer parent device
Date: Wed,  7 Feb 2024 14:47:12 +0100
Message-ID: <20240207134932.7321-4-tzimmermann@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fiMJYm4l;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="+0/874P9"
X-Spamd-Result: default: False [1.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FREEMAIL_TO(0.00)[redhat.com,linux.dev,gmx.de,kernel.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 1.69
X-Rspamd-Queue-Id: 4790C222FA
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Bar: +

Set the firmware framebuffer's parent device, which usually is the
graphics hardware's physical device. Integrates the framebuffer in
the Linux device hierarchy and lets Linux handle dependencies among
devices. For example, the graphics hardware won't be suspended while
the firmware device is still active.

v3:
	* fix build for CONFIG_SYSFB_SIMPLEFB=n (Sui)
	* test result of screen_info_pci_dev() for errors (Sui)
v2:
	* detect parent device in sysfb_parent_dev()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/firmware/sysfb.c          | 21 ++++++++++++++++++++-
 drivers/firmware/sysfb_simplefb.c |  5 ++++-
 include/linux/sysfb.h             |  6 ++++--
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 3c197db42c9d9..4e104f3de4b95 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -29,6 +29,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/pci.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/screen_info.h>
@@ -69,9 +70,23 @@ void sysfb_disable(void)
 }
 EXPORT_SYMBOL_GPL(sysfb_disable);
 
+static __init struct device *sysfb_parent_dev(const struct screen_info *si)
+{
+	struct pci_dev *pdev;
+
+	pdev = screen_info_pci_dev(si);
+	if (IS_ERR(pdev))
+		return ERR_CAST(pdev);
+	else if (pdev)
+		return &pdev->dev;
+
+	return NULL;
+}
+
 static __init int sysfb_init(void)
 {
 	struct screen_info *si = &screen_info;
+	struct device *parent;
 	struct simplefb_platform_data mode;
 	const char *name;
 	bool compatible;
@@ -83,10 +98,12 @@ static __init int sysfb_init(void)
 
 	sysfb_apply_efi_quirks();
 
+	parent = sysfb_parent_dev(si);
+
 	/* try to create a simple-framebuffer device */
 	compatible = sysfb_parse_mode(si, &mode);
 	if (compatible) {
-		pd = sysfb_create_simplefb(si, &mode);
+		pd = sysfb_create_simplefb(si, &mode, parent);
 		if (!IS_ERR(pd))
 			goto unlock_mutex;
 	}
@@ -109,6 +126,8 @@ static __init int sysfb_init(void)
 		goto unlock_mutex;
 	}
 
+	pd->dev.parent = parent;
+
 	sysfb_set_efifb_fwnode(pd);
 
 	ret = platform_device_add_data(pd, si, sizeof(*si));
diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index 74363ed7501f6..75a186bf8f8ec 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -91,7 +91,8 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 }
 
 __init struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
-						     const struct simplefb_platform_data *mode)
+						     const struct simplefb_platform_data *mode,
+						     struct device *parent)
 {
 	struct platform_device *pd;
 	struct resource res;
@@ -143,6 +144,8 @@ __init struct platform_device *sysfb_create_simplefb(const struct screen_info *s
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
 
+	pd->dev.parent = parent;
+
 	sysfb_set_efifb_fwnode(pd);
 
 	ret = platform_device_add_resources(pd, &res, 1);
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index 19cb803dd5ecd..9a007ea2d3635 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -91,7 +91,8 @@ static inline void sysfb_set_efifb_fwnode(struct platform_device *pd)
 bool sysfb_parse_mode(const struct screen_info *si,
 		      struct simplefb_platform_data *mode);
 struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
-					      const struct simplefb_platform_data *mode);
+					      const struct simplefb_platform_data *mode,
+					      struct device *parent);
 
 #else /* CONFIG_SYSFB_SIMPLE */
 
@@ -102,7 +103,8 @@ static inline bool sysfb_parse_mode(const struct screen_info *si,
 }
 
 static inline struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
-							    const struct simplefb_platform_data *mode)
+							    const struct simplefb_platform_data *mode,
+							    struct device *parent);
 {
 	return ERR_PTR(-EINVAL);
 }
-- 
2.43.0


