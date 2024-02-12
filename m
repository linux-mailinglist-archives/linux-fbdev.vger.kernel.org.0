Return-Path: <linux-fbdev+bounces-1032-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C65FB850F4E
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Feb 2024 10:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 526461F226D8
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Feb 2024 09:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D31C101C6;
	Mon, 12 Feb 2024 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FG+FQiNG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lVzh/kR/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FG+FQiNG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lVzh/kR/"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65720FBF2
	for <linux-fbdev@vger.kernel.org>; Mon, 12 Feb 2024 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707728867; cv=none; b=BV4vUCflYQggfgGl3Ob7i1Dr6Lb3moiGgA6gi94YJ+DNPeeOZHPBVXzIVfLXoLTywHa+RxTUKYu5z/fxV/2P6Lv9VgNMIo6RVnurSz7AOAzy7WHwbiJOBqdV4AKiCzqOeQ1u9GPBCpaxxS1hebmVwu26v7pona4R5mAksberpHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707728867; c=relaxed/simple;
	bh=MmhISpMQjOh9iF3YA5AGHDBYW8eZIyK5iS7qAJIndU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iR/JiK/xdiYQSdfjyxCUlS6K5DLMTm5v8HydYRr7lhh8wEEuEW9bifHCSQIOKT8MrEjtMYYuolfgaGqm87nHa5sDgKilfWz9ZRLzY884HQ0RGroCSIAUokYPjEhGE5WRwWPtF6wcqvYV2lYcLM9xjtxuTd/5t8/FRV3doH0ZQSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FG+FQiNG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lVzh/kR/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FG+FQiNG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lVzh/kR/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 82867221A7;
	Mon, 12 Feb 2024 09:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707728863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3d7gVlRG/XQ0QcwGiaeZtTKnZoQ37mzsLRQShJRbrqc=;
	b=FG+FQiNGkX4a3QVjjkFqdo711Ou8D9ix639tlR8LdvHAMamYeUBB3N735OsVJDnQW9uUh/
	Pnn5kBT48RqRRK8SVI+oodPjEc7ootIZgclz0CqSHnGbxFzrDmSa4/Ciw6g1ZcqB5ZCVIx
	vslMy0HQDXf/5iYYIrqax82ARxRwR1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707728863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3d7gVlRG/XQ0QcwGiaeZtTKnZoQ37mzsLRQShJRbrqc=;
	b=lVzh/kR/kW1xb3Oh7dftlApmMde8MJK5g+LwvFEoh7JfKcQGFgUJIfmq3rVH01rVN1+9lu
	i2hlDwXhypxZoXCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707728863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3d7gVlRG/XQ0QcwGiaeZtTKnZoQ37mzsLRQShJRbrqc=;
	b=FG+FQiNGkX4a3QVjjkFqdo711Ou8D9ix639tlR8LdvHAMamYeUBB3N735OsVJDnQW9uUh/
	Pnn5kBT48RqRRK8SVI+oodPjEc7ootIZgclz0CqSHnGbxFzrDmSa4/Ciw6g1ZcqB5ZCVIx
	vslMy0HQDXf/5iYYIrqax82ARxRwR1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707728863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3d7gVlRG/XQ0QcwGiaeZtTKnZoQ37mzsLRQShJRbrqc=;
	b=lVzh/kR/kW1xb3Oh7dftlApmMde8MJK5g+LwvFEoh7JfKcQGFgUJIfmq3rVH01rVN1+9lu
	i2hlDwXhypxZoXCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B81213212;
	Mon, 12 Feb 2024 09:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 4KC3CN/fyWXecwAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 12 Feb 2024 09:07:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	sui.jingfeng@linux.dev,
	pjones@redhat.com,
	deller@gmx.de,
	ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 7/8] firmware/sysfb: Update screen_info for relocated EFI framebuffers
Date: Mon, 12 Feb 2024 10:06:15 +0100
Message-ID: <20240212090736.11464-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212090736.11464-1-tzimmermann@suse.de>
References: <20240212090736.11464-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FG+FQiNG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="lVzh/kR/"
X-Spamd-Result: default: False [-0.31 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLd5zd8tio7mptchx3z93fk9kq)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 FREEMAIL_TO(0.00)[redhat.com,linux.dev,gmx.de,kernel.org];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.31
X-Rspamd-Queue-Id: 82867221A7
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /

On ARM PCI systems, the PCI hierarchy might be reconfigured during
boot and the firmware framebuffer might move as a result of that.
The values in screen_info will then be invalid.

Work around this problem by tracking the framebuffer's initial
location before it get relocated; then fix the screen_info state
between reloaction and creating the firmware framebuffer's device.

This functionality has been lifted from efifb. See the commit message
of commit 55d728a40d36 ("efi/fb: Avoid reconfiguration of BAR that
covers the framebuffer") for more information.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/firmware/sysfb.c        |  2 +
 drivers/video/screen_info_pci.c | 88 +++++++++++++++++++++++++++++++++
 include/linux/screen_info.h     | 16 ++++++
 3 files changed, 106 insertions(+)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 170b7cd0cfcbf..a6b48703dc9e9 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -118,6 +118,8 @@ static __init int sysfb_init(void)
 	bool compatible;
 	int ret = 0;
 
+	screen_info_apply_fixups();
+
 	mutex_lock(&disable_lock);
 	if (disabled)
 		goto unlock_mutex;
diff --git a/drivers/video/screen_info_pci.c b/drivers/video/screen_info_pci.c
index d8985a54ce717..6c58335171410 100644
--- a/drivers/video/screen_info_pci.c
+++ b/drivers/video/screen_info_pci.c
@@ -1,7 +1,95 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/pci.h>
+#include <linux/printk.h>
 #include <linux/screen_info.h>
+#include <linux/string.h>
+
+static struct pci_dev *screen_info_lfb_pdev;
+static size_t screen_info_lfb_bar;
+static resource_size_t screen_info_lfb_offset;
+static struct resource screen_info_lfb_res = DEFINE_RES_MEM(0, 0);
+
+static bool __screen_info_relocation_is_valid(const struct screen_info *si, struct resource *pr)
+{
+	u64 size = __screen_info_lfb_size(si, screen_info_video_type(si));
+
+	if (screen_info_lfb_offset > resource_size(pr))
+		return false;
+	if (size > resource_size(pr))
+		return false;
+	if (resource_size(pr) - size < screen_info_lfb_offset)
+		return false;
+
+	return true;
+}
+
+void screen_info_apply_fixups(void)
+{
+	struct screen_info *si = &screen_info;
+
+	if (screen_info_lfb_pdev) {
+		struct resource *pr = &screen_info_lfb_pdev->resource[screen_info_lfb_bar];
+
+		if (pr->start != screen_info_lfb_res.start) {
+			if (__screen_info_relocation_is_valid(si, pr)) {
+				/*
+				 * Only update base if we have an actual
+				 * relocation to a valid I/O range.
+				 */
+				__screen_info_set_lfb_base(si, pr->start + screen_info_lfb_offset);
+				pr_info("Relocating firmware framebuffer to offset %pa[d] within %pr\n",
+					&screen_info_lfb_offset, pr);
+			} else {
+				pr_warn("Invalid relocating, disabling firmware framebuffer\n");
+			}
+		}
+	}
+}
+
+static void screen_info_fixup_lfb(struct pci_dev *pdev)
+{
+	unsigned int type;
+	struct resource res[SCREEN_INFO_MAX_RESOURCES];
+	size_t i, numres;
+	int ret;
+	const struct screen_info *si = &screen_info;
+
+	if (screen_info_lfb_pdev)
+		return; // already found
+
+	type = screen_info_video_type(si);
+	if (type != VIDEO_TYPE_EFI)
+		return; // only applies to EFI
+
+	ret = screen_info_resources(si, res, ARRAY_SIZE(res));
+	if (ret < 0)
+		return;
+	numres = ret;
+
+	for (i = 0; i < numres; ++i) {
+		struct resource *r = &res[i];
+		const struct resource *pr;
+
+		if (!(r->flags & IORESOURCE_MEM))
+			continue;
+		pr = pci_find_resource(pdev, r);
+		if (!pr)
+			continue;
+
+		/*
+		 * We've found a PCI device with the framebuffer
+		 * resource. Store away the parameters to track
+		 * relocation of the framebuffer aperture.
+		 */
+		screen_info_lfb_pdev = pdev;
+		screen_info_lfb_bar = pr - pdev->resource;
+		screen_info_lfb_offset = r->start - pr->start;
+		memcpy(&screen_info_lfb_res, r, sizeof(screen_info_lfb_res));
+	}
+}
+DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_BASE_CLASS_DISPLAY, 16,
+			       screen_info_fixup_lfb);
 
 static struct pci_dev *__screen_info_pci_dev(struct resource *res)
 {
diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
index 0eae08e3c6f90..75303c126285a 100644
--- a/include/linux/screen_info.h
+++ b/include/linux/screen_info.h
@@ -4,6 +4,8 @@
 
 #include <uapi/linux/screen_info.h>
 
+#include <linux/bits.h>
+
 /**
  * SCREEN_INFO_MAX_RESOURCES - maximum number of resources per screen_info
  */
@@ -27,6 +29,17 @@ static inline u64 __screen_info_lfb_base(const struct screen_info *si)
 	return lfb_base;
 }
 
+static inline void __screen_info_set_lfb_base(struct screen_info *si, u64 lfb_base)
+{
+	si->lfb_base = lfb_base & GENMASK_ULL(31, 0);
+	si->ext_lfb_base = (lfb_base & GENMASK_ULL(63, 32)) >> 32;
+
+	if (si->ext_lfb_base)
+		si->capabilities |= VIDEO_CAPABILITY_64BIT_BASE;
+	else
+		si->capabilities &= ~VIDEO_CAPABILITY_64BIT_BASE;
+}
+
 static inline u64 __screen_info_lfb_size(const struct screen_info *si, unsigned int type)
 {
 	u64 lfb_size = si->lfb_size;
@@ -106,8 +119,11 @@ static inline unsigned int screen_info_video_type(const struct screen_info *si)
 ssize_t screen_info_resources(const struct screen_info *si, struct resource *r, size_t num);
 
 #if defined(CONFIG_PCI)
+void screen_info_apply_fixups(void);
 struct pci_dev *screen_info_pci_dev(const struct screen_info *si);
 #else
+static inline void screen_info_apply_fixups(void)
+{ }
 static inline struct pci_dev *screen_info_pci_dev(const struct screen_info *si)
 {
 	return NULL;
-- 
2.43.0


