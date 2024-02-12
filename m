Return-Path: <linux-fbdev+bounces-1033-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ADB850F52
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Feb 2024 10:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 215BBB2215B
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Feb 2024 09:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EA5FBF2;
	Mon, 12 Feb 2024 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z75xE/zx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EhSKm1b6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cD+PtsoY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HQvu9w9h"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF374FC11
	for <linux-fbdev@vger.kernel.org>; Mon, 12 Feb 2024 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707728867; cv=none; b=EHobXKVydtHSKnBCfTchbik4j/ySB2VUyh+IphanTPEVnw8eiGWWopveEz/DEzRzNBPWHxTZyRZzRNvp8GW+9BM4WGV8yogB4JsM0Yw2vcVr5F2fXSOuHotKku0Kxr83keKyWp36z9ckk+PNYyrtvwZ/WfWHSehYX0SUCGwtkVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707728867; c=relaxed/simple;
	bh=Aq7rHZDXrNzFCFawuZKxq2ZLrmcpCprahXFUyK8W/fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upQGI7JYXsS8Ahpim+ofbAhEE4U4UkCCzIkXrjY4X1WNMnC1QMHa3m+WGx4HctKOYdQq9cOd42EWoBumw2ls4AEuXAjuJ4fEFh2A8OYFQyMPfnDhH0lPvhsN7uJVZGvHML4NtKFJmn9paRZ6Uqx3E1TtfnTpfpkRXjz064IINds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z75xE/zx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EhSKm1b6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cD+PtsoY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HQvu9w9h; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DBEA8221A9;
	Mon, 12 Feb 2024 09:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707728864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l7/m6ngH/9vR7GU3dOozu7ziOJrbdZSSV92eIclE80M=;
	b=Z75xE/zxZI3jrjnlrv1rFMX4dIH9y0ken7/GxnjCXL2KBZpw2PSENqU2MWdkGn7HaeUq5v
	gKmLEl8TEaaEm5/rZqQHp4kP+10X9z6VfMP9E685wax8degDRE+9u7wrV6UWVOl5mMpQIx
	ZF1lsdj9kKPBOWimP+Q0wp3RanplbEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707728864;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l7/m6ngH/9vR7GU3dOozu7ziOJrbdZSSV92eIclE80M=;
	b=EhSKm1b6FUVTzyPMALE9WfrB1r0lD7zaJ6tqfUmF59sV/mhVeYxxWUb4dWZKz/VjGQ0y4L
	Q8XCM8rqGRqBqvBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707728863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l7/m6ngH/9vR7GU3dOozu7ziOJrbdZSSV92eIclE80M=;
	b=cD+PtsoYAUSJvlPcGzPOoYBUY3NRSBCGZpnfJ6fe1SZOiBGoQNwajpaHIuZfnxxuh4jv2r
	taGUiEAL0ocMlH+ecQZRRg8tQyKqeLPUFyz67Ak65JKVuKhTVVHAaVj7+MgEu/5tlnATcn
	diaFpPxVUT2PYYUta2Cm2rwzMBEDAYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707728863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l7/m6ngH/9vR7GU3dOozu7ziOJrbdZSSV92eIclE80M=;
	b=HQvu9w9hX5WwgmSI6M1MZvITS4EYURi0iBtocGwxGw1t6NjwDMxSTo+EI70AIq9uqBsapB
	jJvscsGUerHT4iCw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A66A13A2D;
	Mon, 12 Feb 2024 09:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id aJ5+IN/fyWXecwAAn2gu4w
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
Subject: [PATCH v4 8/8] fbdev/efifb: Remove framebuffer relocation tracking
Date: Mon, 12 Feb 2024 10:06:16 +0100
Message-ID: <20240212090736.11464-9-tzimmermann@suse.de>
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
X-Spam-Level: ***
X-Spamd-Bar: +++
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cD+PtsoY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HQvu9w9h
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.48 / 50.00];
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
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_TO(0.00)[redhat.com,linux.dev,gmx.de,kernel.org];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.01)[48.63%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 3.48
X-Rspamd-Queue-Id: DBEA8221A9
X-Spam-Flag: NO

If the firmware framebuffer has been reloacted, the sysfb code
fixes the screen_info state before it creates the framebuffer's
platform device. Efifb will automatically receive a screen_info
with updated values. Hence remove the tracking from efifb.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/video/fbdev/efifb.c | 76 +------------------------------------
 1 file changed, 1 insertion(+), 75 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index f76b7ae007518..8dd82afb3452b 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -13,7 +13,6 @@
 #include <linux/efi-bgrt.h>
 #include <linux/errno.h>
 #include <linux/fb.h>
-#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/screen_info.h>
@@ -47,8 +46,6 @@ static bool use_bgrt = true;
 static bool request_mem_succeeded = false;
 static u64 mem_flags = EFI_MEMORY_WC | EFI_MEMORY_UC;
 
-static struct pci_dev *efifb_pci_dev;	/* dev with BAR covering the efifb */
-
 struct efifb_par {
 	u32 pseudo_palette[16];
 	resource_size_t base;
@@ -348,9 +345,6 @@ static struct attribute *efifb_attrs[] = {
 };
 ATTRIBUTE_GROUPS(efifb);
 
-static struct resource *bar_resource;
-static u64 bar_offset;
-
 static int efifb_probe(struct platform_device *dev)
 {
 	struct screen_info *si;
@@ -411,21 +405,7 @@ static int efifb_probe(struct platform_device *dev)
 		si->rsvd_pos = 24;
 	}
 
-	efifb_fix.smem_start = si->lfb_base;
-
-	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE) {
-		u64 ext_lfb_base;
-
-		ext_lfb_base = (u64)(unsigned long)si->ext_lfb_base << 32;
-		efifb_fix.smem_start |= ext_lfb_base;
-	}
-
-	if (bar_resource &&
-	    bar_resource->start + bar_offset != efifb_fix.smem_start) {
-		dev_info(&efifb_pci_dev->dev,
-			 "BAR has moved, updating efifb address\n");
-		efifb_fix.smem_start = bar_resource->start + bar_offset;
-	}
+	efifb_fix.smem_start = __screen_info_lfb_base(si);
 
 	efifb_defined.bits_per_pixel = si->lfb_depth;
 	efifb_defined.xres = si->lfb_width;
@@ -640,57 +620,3 @@ static struct platform_driver efifb_driver = {
 };
 
 builtin_platform_driver(efifb_driver);
-
-#if defined(CONFIG_PCI)
-
-static void record_efifb_bar_resource(struct pci_dev *dev, int idx, u64 offset)
-{
-	u16 word;
-
-	efifb_pci_dev = dev;
-
-	pci_read_config_word(dev, PCI_COMMAND, &word);
-	if (!(word & PCI_COMMAND_MEMORY)) {
-		dev_err(&dev->dev,
-			"BAR %d: assigned to efifb but device is disabled!\n",
-			idx);
-		return;
-	}
-
-	bar_resource = &dev->resource[idx];
-	bar_offset = offset;
-
-	dev_info(&dev->dev, "BAR %d: assigned to efifb\n", idx);
-}
-
-static void efifb_fixup_resources(struct pci_dev *dev)
-{
-	u64 base = screen_info.lfb_base;
-	u64 size = screen_info.lfb_size;
-	int i;
-
-	if (efifb_pci_dev || screen_info.orig_video_isVGA != VIDEO_TYPE_EFI)
-		return;
-
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		base |= (u64)screen_info.ext_lfb_base << 32;
-
-	if (!base)
-		return;
-
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		struct resource *res = &dev->resource[i];
-
-		if (!(res->flags & IORESOURCE_MEM))
-			continue;
-
-		if (res->start <= base && res->end >= base + size - 1) {
-			record_efifb_bar_resource(dev, i, base - res->start);
-			break;
-		}
-	}
-}
-DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_BASE_CLASS_DISPLAY,
-			       16, efifb_fixup_resources);
-
-#endif
-- 
2.43.0


