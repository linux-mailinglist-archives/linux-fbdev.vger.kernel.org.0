Return-Path: <linux-fbdev+bounces-966-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0455F84CBFD
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 14:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 839B51F2624B
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 13:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F2D7C095;
	Wed,  7 Feb 2024 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZHUtXtFX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ju2CJmqm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZHUtXtFX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ju2CJmqm"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB2277F14
	for <linux-fbdev@vger.kernel.org>; Wed,  7 Feb 2024 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707313781; cv=none; b=j8iimnDDmv79wfNr7JtD/cYrAEyLDe+RiMx86ATQa98Cl8ijEpJXV5+6QOG1UA3cBzuwLv2h1VsJjsKy3WCFyXUb1bWu6bYNaYGo9pRdD86rj476iuEC/KyAdMj7qDDkV+RPdYDtrQjhQyu0OBEz0pjRPLQkQ0evnzlGfVIonXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707313781; c=relaxed/simple;
	bh=WD2je+Aij8TRuVF/lqUwomHwplWZ28oWiaTvjbk0orU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZARQPEgBXu0u/jfIohjuGUrgzEfxhWp3VKaQSl9Dgtby0A9aaFKZmB8FsPTXYKg+0470u6W7JZhMEGLVniG0Ig7Hf3/4MS79w716JztXSU2meLax0u6qwmzr93Bb1bckMK5TRB+nVoyrmikWkFTW9DSnf57+qxeNnLV6fnQ5Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZHUtXtFX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ju2CJmqm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZHUtXtFX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ju2CJmqm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 919771FBF2;
	Wed,  7 Feb 2024 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707313776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jpd+p9IaqHayjR35KrBxfOInFN2LP+qymQoOt+iSpFg=;
	b=ZHUtXtFXF4bhha27cqDxraLn2/zhEuvM5vJKVXTzCTF/P8WYddj+TsG1N55qi5euNJ4xUG
	KWcbgXxFn2Kfk+4FS+fPXYAWURcjFV9PtZ/YUpn1xIMg4pJELzyR7JDqeNgVhv6CkFw4I/
	7TxYZbPiRdEZAgrlInFX4ZQVnDxsfUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707313776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jpd+p9IaqHayjR35KrBxfOInFN2LP+qymQoOt+iSpFg=;
	b=ju2CJmqmoUOJm81VPr9ji2teEwBHF1YwzhgtGJIl9kv0aBDh40MGKAQNy6EHGx3UFSIQ3E
	uyEfz7JpYPfcVBBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707313776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jpd+p9IaqHayjR35KrBxfOInFN2LP+qymQoOt+iSpFg=;
	b=ZHUtXtFXF4bhha27cqDxraLn2/zhEuvM5vJKVXTzCTF/P8WYddj+TsG1N55qi5euNJ4xUG
	KWcbgXxFn2Kfk+4FS+fPXYAWURcjFV9PtZ/YUpn1xIMg4pJELzyR7JDqeNgVhv6CkFw4I/
	7TxYZbPiRdEZAgrlInFX4ZQVnDxsfUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707313776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jpd+p9IaqHayjR35KrBxfOInFN2LP+qymQoOt+iSpFg=;
	b=ju2CJmqmoUOJm81VPr9ji2teEwBHF1YwzhgtGJIl9kv0aBDh40MGKAQNy6EHGx3UFSIQ3E
	uyEfz7JpYPfcVBBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FA55139B9;
	Wed,  7 Feb 2024 13:49:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QKgPEnCKw2V7IQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 07 Feb 2024 13:49:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	sui.jingfeng@linux.dev,
	pjones@redhat.com,
	deller@gmx.de,
	ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 4/8] fbdev/efifb: Remove PM for parent device
Date: Wed,  7 Feb 2024 14:47:13 +0100
Message-ID: <20240207134932.7321-5-tzimmermann@suse.de>
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
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
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
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

The EFI device has the correct parent device set. This allows Linux
to handle the power management internally. Hence, remove the manual
PM management for the parent device from efifb.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/efifb.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 10fc14ad5d127..e66ef35fa6b62 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -17,7 +17,6 @@
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/screen_info.h>
-#include <linux/pm_runtime.h>
 #include <video/vga.h>
 #include <asm/efi.h>
 #include <drm/drm_utils.h> /* For drm_get_panel_orientation_quirk */
@@ -258,9 +257,6 @@ static void efifb_destroy(struct fb_info *info)
 {
 	struct efifb_par *par = info->par;
 
-	if (efifb_pci_dev)
-		pm_runtime_put(&efifb_pci_dev->dev);
-
 	if (info->screen_base) {
 		if (mem_flags & (EFI_MEMORY_UC | EFI_MEMORY_WC))
 			iounmap(info->screen_base);
@@ -598,26 +594,20 @@ static int efifb_probe(struct platform_device *dev)
 		goto err_groups;
 	}
 
-	if (efifb_pci_dev)
-		WARN_ON(pm_runtime_get_sync(&efifb_pci_dev->dev) < 0);
-
 	err = devm_aperture_acquire_for_platform_device(dev, par->base, par->size);
 	if (err) {
 		pr_err("efifb: cannot acquire aperture\n");
-		goto err_put_rpm_ref;
+		goto err_fb_dealloc_cmap;
 	}
 	err = register_framebuffer(info);
 	if (err < 0) {
 		pr_err("efifb: cannot register framebuffer\n");
-		goto err_put_rpm_ref;
+		goto err_fb_dealloc_cmap;
 	}
 	fb_info(info, "%s frame buffer device\n", info->fix.id);
 	return 0;
 
-err_put_rpm_ref:
-	if (efifb_pci_dev)
-		pm_runtime_put(&efifb_pci_dev->dev);
-
+err_fb_dealloc_cmap:
 	fb_dealloc_cmap(&info->cmap);
 err_groups:
 	sysfs_remove_groups(&dev->dev.kobj, efifb_groups);
-- 
2.43.0


