Return-Path: <linux-fbdev+bounces-2078-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A968AAA61
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 10:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0702D28677B
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 08:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D3A71742;
	Fri, 19 Apr 2024 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EVWpRYUr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bJI8GRUU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EVWpRYUr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bJI8GRUU"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4470B6A8D2
	for <linux-fbdev@vger.kernel.org>; Fri, 19 Apr 2024 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713515625; cv=none; b=Kubv3XyB+a8CTP6x8NdD2QoOqyLpA5mkZ1DM8b7IPNh2TtjUjciuGnY4MS6Cp0Cr9qwgTUEAyB3o2Ono6wCOyLRYUA54EHp5AKzWfZmIi+TsKurjtkF95KfwFPzHYn4M85Zj7slvp5vdpoOm8iUCu3u907h0nSD4DynKTiCQsug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713515625; c=relaxed/simple;
	bh=EUPg74ZBUlWkKEzKRtCCLuoEQ5xH53qOjaSWo6Ow3eM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WbsUj8VmecjsWyJCB+FdVeJMQxIvXDqUS1+MJywJEa5EtH/DL5Ij8zQ1xOp//9GKx3pBegVDRJrQn4tBPApfHAxyIo1iJj8YlJju7TRYagvhQtHDOrvQeEiBpZVNChc9BtYMgUB4Bd9TWwvu7miMIjc0Y8YMcCSDzRRWbQndAyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EVWpRYUr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bJI8GRUU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EVWpRYUr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bJI8GRUU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 68B115D480;
	Fri, 19 Apr 2024 08:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yehKV9E4wDlUlOpdPxluEfg/SK3RcTHJm3Cb0Zirtw4=;
	b=EVWpRYUrjWFID1fe5DqgUM1Eg5dsoun9jnuJ2gZlFSEegaVurZJmjr4C3rx5N+NxxXMIpq
	ZuAcuUgqkk6KeHj79zK6fmcK52aptmufo72USw4ZN551PZI3g2hP/slmwt2OQB3ADLC1IC
	bmjIsDRFzTQeKRoVhEOfoq2/I0OYOQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515621;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yehKV9E4wDlUlOpdPxluEfg/SK3RcTHJm3Cb0Zirtw4=;
	b=bJI8GRUUFf79vSk33be/fvpEy1V9R9jfGGsBQuMpgT7aqo4xI3grMBobKcjMAQjyvjR/4O
	BkV6J+9XyVbBI9DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713515621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yehKV9E4wDlUlOpdPxluEfg/SK3RcTHJm3Cb0Zirtw4=;
	b=EVWpRYUrjWFID1fe5DqgUM1Eg5dsoun9jnuJ2gZlFSEegaVurZJmjr4C3rx5N+NxxXMIpq
	ZuAcuUgqkk6KeHj79zK6fmcK52aptmufo72USw4ZN551PZI3g2hP/slmwt2OQB3ADLC1IC
	bmjIsDRFzTQeKRoVhEOfoq2/I0OYOQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713515621;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yehKV9E4wDlUlOpdPxluEfg/SK3RcTHJm3Cb0Zirtw4=;
	b=bJI8GRUUFf79vSk33be/fvpEy1V9R9jfGGsBQuMpgT7aqo4xI3grMBobKcjMAQjyvjR/4O
	BkV6J+9XyVbBI9DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3096A13687;
	Fri, 19 Apr 2024 08:33:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GE5dCmUsImb9agAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 19 Apr 2024 08:33:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 21/43] drm/fbdev-dma: Implement damage handling and deferred I/O
Date: Fri, 19 Apr 2024 10:29:14 +0200
Message-ID: <20240419083331.7761-22-tzimmermann@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -6.80
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]

Add support for damage handling and deferred I/O to fbdev-dma. This
enables fbdev-dma to support all DMA-memory-based DRM drivers, even
such with a dirty callback in their framebuffers.

The patch adds the code for deferred I/O and also sets a dedicated
helper for struct fb_ops.fb_mmap that support coherent mappings.

v3:
- init fb_ops with FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS() (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fbdev_dma.c | 65 ++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 6c9427bb4053b..5eeb5164e9e2b 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -35,6 +36,22 @@ static int drm_fbdev_dma_fb_release(struct fb_info *info, int user)
 	return 0;
 }
 
+FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(drm_fbdev_dma,
+				   drm_fb_helper_damage_range,
+				   drm_fb_helper_damage_area);
+
+static int drm_fbdev_dma_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_framebuffer *fb = fb_helper->fb;
+	struct drm_gem_dma_object *dma = drm_fb_dma_get_gem_obj(fb, 0);
+
+	if (!dma->map_noncoherent)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	return fb_deferred_io_mmap(info, vma);
+}
+
 static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
@@ -51,20 +68,13 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
 	kfree(fb_helper);
 }
 
-static int drm_fbdev_dma_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-
-	return drm_gem_prime_mmap(fb_helper->buffer->gem, vma);
-}
-
 static const struct fb_ops drm_fbdev_dma_fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_open = drm_fbdev_dma_fb_open,
 	.fb_release = drm_fbdev_dma_fb_release,
-	__FB_DEFAULT_DMAMEM_OPS_RDWR,
+	__FB_DEFAULT_DEFERRED_OPS_RDWR(drm_fbdev_dma),
 	DRM_FB_HELPER_DEFAULT_OPS,
-	__FB_DEFAULT_DMAMEM_OPS_DRAW,
+	__FB_DEFAULT_DEFERRED_OPS_DRAW(drm_fbdev_dma),
 	.fb_mmap = drm_fbdev_dma_fb_mmap,
 	.fb_destroy = drm_fbdev_dma_fb_destroy,
 };
@@ -98,10 +108,6 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	dma_obj = to_drm_gem_dma_obj(buffer->gem);
 
 	fb = buffer->fb;
-	if (drm_WARN_ON(dev, fb->funcs->dirty)) {
-		ret = -ENODEV; /* damage handling not supported; use generic emulation */
-		goto err_drm_client_buffer_delete;
-	}
 
 	ret = drm_client_buffer_vmap(buffer, &map);
 	if (ret) {
@@ -112,7 +118,7 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	}
 
 	fb_helper->buffer = buffer;
-	fb_helper->fb = buffer->fb;
+	fb_helper->fb = fb;
 
 	info = drm_fb_helper_alloc_info(fb_helper);
 	if (IS_ERR(info)) {
@@ -133,8 +139,19 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
 	info->fix.smem_len = info->screen_size;
 
+	/* deferred I/O */
+	fb_helper->fbdefio.delay = HZ / 20;
+	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
+
+	info->fbdefio = &fb_helper->fbdefio;
+	ret = fb_deferred_io_init(info);
+	if (ret)
+		goto err_drm_fb_helper_release_info;
+
 	return 0;
 
+err_drm_fb_helper_release_info:
+	drm_fb_helper_release_info(fb_helper);
 err_drm_client_buffer_vunmap:
 	fb_helper->fb = NULL;
 	fb_helper->buffer = NULL;
@@ -144,8 +161,28 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 
+static int drm_fbdev_dma_helper_fb_dirty(struct drm_fb_helper *helper,
+					 struct drm_clip_rect *clip)
+{
+	struct drm_device *dev = helper->dev;
+	int ret;
+
+	/* Call damage handlers only if necessary */
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->fb->funcs->dirty) {
+		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct drm_fb_helper_funcs drm_fbdev_dma_helper_funcs = {
 	.fb_probe = drm_fbdev_dma_helper_fb_probe,
+	.fb_dirty = drm_fbdev_dma_helper_fb_dirty,
 };
 
 /*
-- 
2.44.0


