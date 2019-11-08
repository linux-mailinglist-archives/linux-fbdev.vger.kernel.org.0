Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3CDF4B9F
	for <lists+linux-fbdev@lfdr.de>; Fri,  8 Nov 2019 13:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfKHMdi (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 8 Nov 2019 07:33:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:50612 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726227AbfKHMdi (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 8 Nov 2019 07:33:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B0C89B28F;
        Fri,  8 Nov 2019 12:33:36 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
        b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
        sam@ravnborg.org, emil.velikov@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/4] drm/udl: Remove udl implementation of GEM's free_object()
Date:   Fri,  8 Nov 2019 13:33:31 +0100
Message-Id: <20191108123333.25274-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108123333.25274-1-tzimmermann@suse.de>
References: <20191108123333.25274-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Udl used to have a custom implementation for free_object() of
struct drm_gem_object_funcs. It unmapped the memory buffer of
the fbdev emulation. With the switch to generic fbdev emulation,
this is now handled by the fbdev code internally.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_gem.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_gem.c
index 6eade6b4b0dc..b6e26f98aa0a 100644
--- a/drivers/gpu/drm/udl/udl_gem.c
+++ b/drivers/gpu/drm/udl/udl_gem.c
@@ -17,22 +17,6 @@
  * GEM object funcs
  */
 
-static void udl_gem_object_free_object(struct drm_gem_object *obj)
-{
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-
-	/* Fbdev emulation vmaps the buffer. Unmap it here for consistency
-	 * with the original udl GEM code.
-	 *
-	 * TODO: Switch to generic fbdev emulation and release the
-	 *       GEM object with drm_gem_shmem_free_object().
-	 */
-	if (shmem->vaddr)
-		drm_gem_shmem_vunmap(obj, shmem->vaddr);
-
-	drm_gem_shmem_free_object(obj);
-}
-
 static int udl_gem_object_mmap(struct drm_gem_object *obj,
 			       struct vm_area_struct *vma)
 {
@@ -91,7 +75,7 @@ static void *udl_gem_object_vmap(struct drm_gem_object *obj)
 }
 
 static const struct drm_gem_object_funcs udl_gem_object_funcs = {
-	.free = udl_gem_object_free_object,
+	.free = drm_gem_shmem_free_object,
 	.print_info = drm_gem_shmem_print_info,
 	.pin = drm_gem_shmem_pin,
 	.unpin = drm_gem_shmem_unpin,
-- 
2.23.0

