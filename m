Return-Path: <linux-fbdev+bounces-2102-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356E8AAA84
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 10:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 566E21C21D2B
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 08:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E70964CF6;
	Fri, 19 Apr 2024 08:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rKNNdMMS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nKRca5q1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iJM75Yzw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NChf8kwM"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E49F6A357
	for <linux-fbdev@vger.kernel.org>; Fri, 19 Apr 2024 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713515631; cv=none; b=M8u3aWRnsv6FRcoANuaQSNnLIZDxTkPsFBzBP0AvjKDPG3ySF20yjMAeOIxDEwB7OJS1uVftkLK0AQ1AfeXMBkJVqF4uBVsTLhdVBwS8uFYcQeYLGSPLlE5S4DHzEy3EYfQ/yz+HEYHaDp/NpCvASAPtEi3ELB273C0JnbpTlJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713515631; c=relaxed/simple;
	bh=OyZV3SPurCj1HaLJniJDczW5m2MiPBG1AKaQjVeLfYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=anTJ2W19xvPP9FjtIjxSvljqZ2bkx1L1A7tX6yqojWIws378HZx/w7Cbg9okJMmASSmBp7dG2ok0bruyLVRmML6EFSB7QOXXusW2s2g9jgYwvdNC0w4kfc1h1JcUic7fXvkeyfRpog85J/l/IjzNABUugLTpgCcXLUwUtY01scU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rKNNdMMS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nKRca5q1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iJM75Yzw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NChf8kwM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F35083758A;
	Fri, 19 Apr 2024 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xShjgDWUTcIdKvyCvNHDf5tKSMTGL6kovBr2xn66GGg=;
	b=rKNNdMMSta6+L19VmlcRb6T6X7ZKpmQ3LABXCaQpQ6ey34CRJSMf8jlWCFPv6XbP46BgSz
	Jqy6AVN5mpojJ5zv4a2HlrC9f1tf4Mr77+FGrnwgMI2AqSlxaEN37uYXcgd0/hRlx7e8q6
	m4JDWOanAyENeQlbUH613HJkc7qbYt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515628;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xShjgDWUTcIdKvyCvNHDf5tKSMTGL6kovBr2xn66GGg=;
	b=nKRca5q1yfbXucZIny56yHl/gl9k5UKMh8N3/pNeCWMmgrU9vFFA0gfCSU4ichFdH4N3+E
	Hiab0/9Uooow0SCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xShjgDWUTcIdKvyCvNHDf5tKSMTGL6kovBr2xn66GGg=;
	b=iJM75Yzw4IJL7Fk2tyB2FZrqJUYjofEouqKxCc8oiExGG+Tnsr1YN6nxyROkMjHsNokQJu
	jIw0yBCN53Xm9sYos5yIdh4CltKoZMuU/0atQfBQFeLno5by1JkiJra4s0j59vsMhlZO7d
	XXyyhR6UhDabEmlWyy3/Ju4c1FZq+Os=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xShjgDWUTcIdKvyCvNHDf5tKSMTGL6kovBr2xn66GGg=;
	b=NChf8kwM4b9dqFAFNLKeH9RlK9bblsI9uuxE3EaQe1RX0zI9Eb9R5IZoJg8bkEqfmHVgBl
	lT3pcn4cL6XiyuBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE4981395B;
	Fri, 19 Apr 2024 08:33:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aGBkLWosImb9agAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 19 Apr 2024 08:33:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 43/43] drm/fbdev: Clean up fbdev documentation
Date: Fri, 19 Apr 2024 10:29:36 +0200
Message-ID: <20240419083331.7761-44-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419083331.7761-1-tzimmermann@suse.de>
References: <20240419083331.7761-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Rewrite some docs that are not up-to-date any longer. Remove the TODO
item for fbdev-generic conversion, as the helper has been replaced. Make
documentation for DMA, SHMEM and TTM emulation available.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jonathan Corbet <corbet@lwn.net>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 Documentation/gpu/drm-kms-helpers.rst | 12 +++++++++---
 Documentation/gpu/todo.rst            | 13 -------------
 drivers/gpu/drm/drm_drv.c             |  2 +-
 drivers/gpu/drm/drm_fb_helper.c       | 11 ++---------
 include/drm/drm_mode_config.h         |  4 ++--
 5 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index e46ab9b670acd..8435e8621cc08 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -110,15 +110,21 @@ fbdev Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_fb_helper.c
    :doc: fbdev helpers
 
-.. kernel-doc:: include/drm/drm_fb_helper.h
-   :internal:
+.. kernel-doc:: drivers/gpu/drm/drm_fbdev_dma.c
+   :export:
 
-.. kernel-doc:: drivers/gpu/drm/drm_fb_helper.c
+.. kernel-doc:: drivers/gpu/drm/drm_fbdev_shmem.c
    :export:
 
 .. kernel-doc:: drivers/gpu/drm/drm_fbdev_ttm.c
    :export:
 
+.. kernel-doc:: include/drm/drm_fb_helper.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_fb_helper.c
+   :export:
+
 format Helper Functions Reference
 =================================
 
diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index fb9ad120b1414..e2a0585915b32 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -243,19 +243,6 @@ Contact: Maintainer of the driver you plan to convert
 
 Level: Intermediate
 
-Convert drivers to use drm_fbdev_generic_setup()
-------------------------------------------------
-
-Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
-atomic modesetting and GEM vmap support. Historically, generic fbdev emulation
-expected the framebuffer in system memory or system-like memory. By employing
-struct iosys_map, drivers with frambuffers in I/O memory can be supported
-as well.
-
-Contact: Maintainer of the driver you plan to convert
-
-Level: Intermediate
-
 Reimplement functions in drm_fbdev_fb_ops without fbdev
 -------------------------------------------------------
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 243cacb3575c0..cfcd45480d326 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -345,7 +345,7 @@ void drm_minor_release(struct drm_minor *minor)
  *		if (ret)
  *			return ret;
  *
- *		drm_fbdev_generic_setup(drm, 32);
+ *		drm_fbdev_{...}_setup(drm, 32);
  *
  *		return 0;
  *	}
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d612133e2cf7e..e2e19f49342e1 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -85,12 +85,8 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
  * The fb helper functions are useful to provide an fbdev on top of a drm kernel
  * mode setting driver. They can be used mostly independently from the crtc
  * helper functions used by many drivers to implement the kernel mode setting
- * interfaces.
- *
- * Drivers that support a dumb buffer with a virtual address and mmap support,
- * should try out the generic fbdev emulation using drm_fbdev_generic_setup().
- * It will automatically set up deferred I/O if the driver requires a shadow
- * buffer.
+ * interfaces. Drivers that use one of the shared memory managers, TTM, SHMEM,
+ * DMA, should instead use the corresponding fbdev emulation.
  *
  * Existing fbdev implementations should restore the fbdev console by using
  * drm_fb_helper_lastclose() as their &drm_driver.lastclose callback.
@@ -126,9 +122,6 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
  * atomic context. If drm_fb_helper_deferred_io() is used as the deferred_io
  * callback it will also schedule dirty_work with the damage collected from the
  * mmap page writes.
- *
- * Deferred I/O is not compatible with SHMEM. Such drivers should request an
- * fbdev shadow buffer and call drm_fbdev_generic_setup() instead.
  */
 
 static void drm_fb_helper_restore_lut_atomic(struct drm_crtc *crtc)
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 9d8acf7a10eb8..77b8429e7b2b2 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -106,8 +106,8 @@ struct drm_mode_config_funcs {
 	 * Drivers implementing fbdev emulation use drm_kms_helper_hotplug_event()
 	 * to call this hook to inform the fbdev helper of output changes.
 	 *
-	 * This hook is deprecated, drivers should instead use
-	 * drm_fbdev_generic_setup() which takes care of any necessary
+	 * This hook is deprecated, drivers should instead implement fbdev
+	 * support with struct drm_client, which takes care of any necessary
 	 * hotplug event forwarding already without further involvement by
 	 * the driver.
 	 */
-- 
2.44.0


