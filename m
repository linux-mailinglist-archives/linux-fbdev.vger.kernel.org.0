Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 855ECF4B9E
	for <lists+linux-fbdev@lfdr.de>; Fri,  8 Nov 2019 13:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbfKHMdh (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 8 Nov 2019 07:33:37 -0500
Received: from mx2.suse.de ([195.135.220.15]:50544 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725883AbfKHMdh (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 8 Nov 2019 07:33:37 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 036C8B27A;
        Fri,  8 Nov 2019 12:33:36 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
        b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
        sam@ravnborg.org, emil.velikov@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] drm/udl: Replace fbdev by generic emulation
Date:   Fri,  8 Nov 2019 13:33:29 +0100
Message-Id: <20191108123333.25274-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The udl driver can use the generic fbdev emulation. After conversion,
a number of cleanups can be applied.

The fbdev conversion is in patch 1. The original fbdev code in udl
mapped the framebuffer's GEM object memory unconditionally, and
unmapped the memory in the object's free() function. The respective
code in free() can now be removed (Patch 2). And as udl was the
only remaining external user of unlink_framebuffer(), that function
now becomes an internal interface of the fbdev code.

The patchset has been tested by running the console, X11 and Weston
on a DisplayLink adapter.

Thomas Zimmermann (4):
  drm/udl: Replace fbdev code with generic emulation
  drm/udl: Remove udl implementation of GEM's free_object()
  drm/fb-helper: Remove drm_fb_helper_unlink_fbi()
  fbdev: Unexport unlink_framebuffer()

 drivers/gpu/drm/drm_fb_helper.c   |  16 +-
 drivers/gpu/drm/udl/udl_drv.c     |   4 +-
 drivers/gpu/drm/udl/udl_drv.h     |   5 -
 drivers/gpu/drm/udl/udl_fb.c      | 270 +-----------------------------
 drivers/gpu/drm/udl/udl_gem.c     |  18 +-
 drivers/gpu/drm/udl/udl_main.c    |   2 -
 drivers/gpu/drm/udl/udl_modeset.c |   3 +-
 drivers/video/fbdev/core/fbmem.c  |   3 +-
 include/drm/drm_fb_helper.h       |   6 -
 include/linux/fb.h                |   1 -
 10 files changed, 10 insertions(+), 318 deletions(-)

--
2.23.0

