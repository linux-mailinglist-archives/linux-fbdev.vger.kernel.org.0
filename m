Return-Path: <linux-fbdev+bounces-965-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D5084CBFC
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 14:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A413290162
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 13:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F53977F08;
	Wed,  7 Feb 2024 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J4iNwKD9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xbbr9DHZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J4iNwKD9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xbbr9DHZ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5992779DB0
	for <linux-fbdev@vger.kernel.org>; Wed,  7 Feb 2024 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707313781; cv=none; b=oVBrSKe3P/JRUvcdMs8J0BsbbkN2Z6L55Fsi+BC8ixgqrKV9Iyp6/ykKj0rUFaBE2Z32XsDW4mL34hFIDIdTMiUXC5YxUq497VbHUWsz9jS1LeTviVUCs80wsBGCxmkboJ0xYp8AUcHG+yeXbKtj8wmVnqx38jdEiGTjIO2q+ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707313781; c=relaxed/simple;
	bh=MmhISpMQjOh9iF3YA5AGHDBYW8eZIyK5iS7qAJIndU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecBS9IZVDy0arlTs53YwhHCDOTV5Uc8PfYimBwdW5myddsZpFaNjMpcwJtf9qTuOOB/JGc1HyYsSMhoE6bC90ygkkY8gBaDfRj5Dw+Vv2iK85wXyaHHLaPGtfj70Pc/YuSZPlOFciGDmericyz445hOMkeCSr0P7fWT2Z25kNLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J4iNwKD9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xbbr9DHZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J4iNwKD9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xbbr9DHZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7EC08222F4;
	Wed,  7 Feb 2024 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707313777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3d7gVlRG/XQ0QcwGiaeZtTKnZoQ37mzsLRQShJRbrqc=;
	b=J4iNwKD93ZLUYzoXu2X9MwYkuWRL48qO9XTI06ebPsFFyFTCheDoWRTYHgrae5zNXGUBWa
	N5+JmveEtAS/rCyCuhzkJ7V3Sgb4QEajV0tBh4+DrxhzNXXNx2WeSpLskP2UYk8/+vZrCi
	32YUREH7ByforsHtgV2dBzLSDfh1U9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707313777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3d7gVlRG/XQ0QcwGiaeZtTKnZoQ37mzsLRQShJRbrqc=;
	b=Xbbr9DHZKfssJFGPAnm1VlYmL1QsXA2nJM7U7vwQw8jx+C4ITEZKb48T+8vLn29Az9XERn
	Vyz7tjf5/NF7aeCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707313777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3d7gVlRG/XQ0QcwGiaeZtTKnZoQ37mzsLRQShJRbrqc=;
	b=J4iNwKD93ZLUYzoXu2X9MwYkuWRL48qO9XTI06ebPsFFyFTCheDoWRTYHgrae5zNXGUBWa
	N5+JmveEtAS/rCyCuhzkJ7V3Sgb4QEajV0tBh4+DrxhzNXXNx2WeSpLskP2UYk8/+vZrCi
	32YUREH7ByforsHtgV2dBzLSDfh1U9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707313777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3d7gVlRG/XQ0QcwGiaeZtTKnZoQ37mzsLRQShJRbrqc=;
	b=Xbbr9DHZKfssJFGPAnm1VlYmL1QsXA2nJM7U7vwQw8jx+C4ITEZKb48T+8vLn29Az9XERn
	Vyz7tjf5/NF7aeCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 396F3139D8;
	Wed,  7 Feb 2024 13:49:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kG2HDHGKw2V7IQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 07 Feb 2024 13:49:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	sui.jingfeng@linux.dev,
	pjones@redhat.com,
	deller@gmx.de,
	ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 7/8] firmware/sysfb: Update screen_info for relocated EFI framebuffers
Date: Wed,  7 Feb 2024 14:47:16 +0100
Message-ID: <20240207134932.7321-8-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_RATELIMIT(0.00)[to_ip_from(RL4936hw7dbgk3hb39jfn1xy19)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[redhat.com,linux.dev,gmx.de,kernel.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: *
X-Spam-Score: 1.90
X-Spam-Flag: NO

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


