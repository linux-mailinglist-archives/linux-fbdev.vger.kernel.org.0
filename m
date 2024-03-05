Return-Path: <linux-fbdev+bounces-1340-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB828871924
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Mar 2024 10:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A20E72815E8
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Mar 2024 09:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E115473F;
	Tue,  5 Mar 2024 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lML4VmjS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wbL9187w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lML4VmjS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wbL9187w"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A115F537E5;
	Tue,  5 Mar 2024 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709629765; cv=none; b=Nh6pw13lPFhsvdlO0/y4eyOHMNzeSPRgVIZzt8ynLeCpgCsSShKlaGew1Kwk73SqAd5I1Y/yxzDbcya6D5Hb2gaNFWBBB73znDt1tyZHmCpz2Sp1NG3ktGOwgNCI0ScPcMW8nIx1OjzwI66s/8ETDCEhUFl8QK9ikL+5NLMDkn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709629765; c=relaxed/simple;
	bh=dD6oJ1tw3lJemOCAeta+UGXBZxmMDo2ATIvfTasxZ5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLsjhAEtoIPPNK8g2LupT9WIdsLgtI2RmvM7IyFS31e0uRNrPSdHktLQKjvHmDenrGqOG3I7Vy7MbfPfLxUeAod2yP4LOSpIpx9K/nKZKqDF4zX9w52KbjqZ9xTkgUxapny+DW77oXKmrubTh2x2VCZb5XmIjX+i4IseLSvoA7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lML4VmjS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wbL9187w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lML4VmjS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wbL9187w; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A62276AA36;
	Tue,  5 Mar 2024 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709629755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExrC55p7rOd+2RKId8GNbrv3KOFKzMlHTaFnRAZmg9s=;
	b=lML4VmjST9+3hxiLPBDz8P5qe3cSbT+7Wrh+jyjuLhNKhgYkDfSYgKvYk26pTa5At17JpF
	NC7EJiIyORuV7LKsT/fIwnR9jhsp5+kDor2EwKEXkdOWpPPwnSh+alfHOCRJKEw6+nH+Og
	pjLdSE8EndYAyNFsJmdEPZLil99VEcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709629755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExrC55p7rOd+2RKId8GNbrv3KOFKzMlHTaFnRAZmg9s=;
	b=wbL9187we++oFbQu3wEAlU8s2ABcoSkG8zDGreff30y6L8pG+rgdUnbhXrmlLIYPFNrIkB
	0Hlk5m7beOUOiABg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709629755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExrC55p7rOd+2RKId8GNbrv3KOFKzMlHTaFnRAZmg9s=;
	b=lML4VmjST9+3hxiLPBDz8P5qe3cSbT+7Wrh+jyjuLhNKhgYkDfSYgKvYk26pTa5At17JpF
	NC7EJiIyORuV7LKsT/fIwnR9jhsp5+kDor2EwKEXkdOWpPPwnSh+alfHOCRJKEw6+nH+Og
	pjLdSE8EndYAyNFsJmdEPZLil99VEcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709629755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExrC55p7rOd+2RKId8GNbrv3KOFKzMlHTaFnRAZmg9s=;
	b=wbL9187we++oFbQu3wEAlU8s2ABcoSkG8zDGreff30y6L8pG+rgdUnbhXrmlLIYPFNrIkB
	0Hlk5m7beOUOiABg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D2A4713A8A;
	Tue,  5 Mar 2024 09:09:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id UBmdMDrh5mUSYgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 05 Mar 2024 09:09:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au,
	jani.nikula@intel.com,
	naresh.kamboju@linaro.org,
	deller@gmx.de,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	lkft-triage@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/3] arch/powerpc: Remove <linux/fb.h> from backlight code
Date: Tue,  5 Mar 2024 10:01:00 +0100
Message-ID: <20240305090910.26742-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240305090910.26742-1-tzimmermann@suse.de>
References: <20240305090910.26742-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_RATELIMIT(0.00)[to_ip_from(RL9wq65f3r6cge75md5ma8xy98)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[ellerman.id.au,intel.com,linaro.org,gmx.de,gmail.com,csgroup.eu,kernel.org,linux.ibm.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Replace <linux/fb.h> with a forward declaration in <asm/backlight.h> to
resolves an unnecessary dependency. Remove pmac_backlight_curve_lookup()
and struct fb_info from source and header files. The function and the
framebuffer struct is unused. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/powerpc/include/asm/backlight.h        |  5 ++--
 arch/powerpc/platforms/powermac/backlight.c | 26 ---------------------
 2 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/include/asm/backlight.h b/arch/powerpc/include/asm/backlight.h
index 1b5eab62ed047..061a910d74929 100644
--- a/arch/powerpc/include/asm/backlight.h
+++ b/arch/powerpc/include/asm/backlight.h
@@ -10,15 +10,14 @@
 #define __ASM_POWERPC_BACKLIGHT_H
 #ifdef __KERNEL__
 
-#include <linux/fb.h>
 #include <linux/mutex.h>
 
+struct backlight_device;
+
 /* For locking instructions, see the implementation file */
 extern struct backlight_device *pmac_backlight;
 extern struct mutex pmac_backlight_mutex;
 
-extern int pmac_backlight_curve_lookup(struct fb_info *info, int value);
-
 extern int pmac_has_backlight_type(const char *type);
 
 extern void pmac_backlight_key(int direction);
diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/platforms/powermac/backlight.c
index aeb79a8b3e109..12bc01353bd3c 100644
--- a/arch/powerpc/platforms/powermac/backlight.c
+++ b/arch/powerpc/platforms/powermac/backlight.c
@@ -9,7 +9,6 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/fb.h>
 #include <linux/backlight.h>
 #include <linux/adb.h>
 #include <linux/pmu.h>
@@ -72,31 +71,6 @@ int pmac_has_backlight_type(const char *type)
 	return 0;
 }
 
-int pmac_backlight_curve_lookup(struct fb_info *info, int value)
-{
-	int level = (FB_BACKLIGHT_LEVELS - 1);
-
-	if (info && info->bl_dev) {
-		int i, max = 0;
-
-		/* Look for biggest value */
-		for (i = 0; i < FB_BACKLIGHT_LEVELS; i++)
-			max = max((int)info->bl_curve[i], max);
-
-		/* Look for nearest value */
-		for (i = 0; i < FB_BACKLIGHT_LEVELS; i++) {
-			int diff = abs(info->bl_curve[i] - value);
-			if (diff < max) {
-				max = diff;
-				level = i;
-			}
-		}
-
-	}
-
-	return level;
-}
-
 static void pmac_backlight_key_worker(struct work_struct *work)
 {
 	if (atomic_read(&kernel_backlight_disabled))
-- 
2.44.0


