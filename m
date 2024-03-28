Return-Path: <linux-fbdev+bounces-1464-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334887982C
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 16:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A45B2871B2
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 15:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438AD7D079;
	Tue, 12 Mar 2024 15:48:53 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807757CF35
	for <linux-fbdev@vger.kernel.org>; Tue, 12 Mar 2024 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710258533; cv=none; b=AKeAiOVkObNk/4p190+Cm4ql62Y8MRqbgfbF67lAQ/PqlBN0WPs/OkEndB7da0hx2d5rtTeUE5RoBbfrH9b8pGJV2V+AHzBEtDQUuQn/hn2TMd6hTo0+xClj5eCSkPUIsBTgZQ2K/d3f4kv5Wr03tEqRaVKr70b1tLkTreRrljU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710258533; c=relaxed/simple;
	bh=YiYtW10jzl2U1edSkfKWrE1+qz2qy6AA1x2PYUD1xzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jnvGUxb2bov8UBF5boe4QQgwF/ayVQC2cncXFmlbQFtIanKZoOs+DsRNVNLOQW3Gb+cKz8toVsTAXp7VWah2CMt5axccslzrSy/92I9/kV2+TROOYpLgLOQFVx8CE0siS7soDcWRnVeP8DBg1dusDF+DZAoHtymFdqjmrEKpeU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 077595D6DF;
	Tue, 12 Mar 2024 15:48:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC0651364F;
	Tue, 12 Mar 2024 15:48:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QDx/LGF58GUhPwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 12 Mar 2024 15:48:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 43/43] drm/fbdev: Clean up fbdev documentation
Date: Tue, 12 Mar 2024 16:45:38 +0100
Message-ID: <20240312154834.26178-44-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312154834.26178-1-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 077595D6DF
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Rewrite some docs that are not up-to-date any longer. Remove the TODO
item for fbdev-generic conversion, as the helper has been replaced. Make
documentation for DMA, SHMEM and TTM emulation available.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jonathan Corbet <corbet@lwn.net>
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
index 973119a9176b2..1e4b8d01212e6 100644
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


