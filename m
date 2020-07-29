Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C7D231F70
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Jul 2020 15:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgG2Nlx (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 29 Jul 2020 09:41:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:52504 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbgG2Nlx (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 29 Jul 2020 09:41:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 03F4DABE2;
        Wed, 29 Jul 2020 13:42:04 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
        kraxel@redhat.com, b.zolnierkie@samsung.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        jani.nikula@intel.com, peda@axentia.se, dan.carpenter@oracle.com,
        natechancellor@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [RFC][PATCH 0/5] Support GEM object mappings from I/O memory
Date:   Wed, 29 Jul 2020 15:41:43 +0200
Message-Id: <20200729134148.6855-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

DRM's fbdev console uses regular load and store operations to update
framebuffer memory. The bochs driver on sparc64 requires the use of
I/O-specific load and store operations. We have a workaround, but need
a long-term sulotion tothe problem.

This patchset adds a GEM object function that returns framebuffers as
I/O memory. It further updates fbdev to use the new functionality and
implements vmap_iomem for VRAM helpers.

This is an RFC patchset to discuss the approach. It still needs testing
and polish. Patch #4 has to be rebased onto the recent workaround.

Thomas Zimmermann (5):
  fbdev: Remove trailing whitespace
  fbdev/core: Export framebuffer read and write code as cfb_ function
  drm: Add infrastructure for vmap operations of I/O memory
  drm/fb_helper: Use I/O-memory mappings if available
  drm/vram_helper: Implement struct drm_gem_object_funcs.vmap_iomem

 drivers/gpu/drm/ast/ast_cursor.c      |  12 ++-
 drivers/gpu/drm/drm_client.c          |  52 +++++++++-
 drivers/gpu/drm/drm_fb_helper.c       | 132 ++++++++++++++++++++++----
 drivers/gpu/drm/drm_gem.c             |  19 ++++
 drivers/gpu/drm/drm_gem_vram_helper.c | 106 +++++++++++++++++++--
 drivers/gpu/drm/drm_internal.h        |   1 +
 drivers/video/fbdev/core/fbmem.c      |  61 ++++++++----
 include/drm/drm_client.h              |   8 +-
 include/drm/drm_gem.h                 |  17 +++-
 include/drm/drm_gem_vram_helper.h     |   1 +
 include/linux/fb.h                    |  23 +++--
 11 files changed, 369 insertions(+), 63 deletions(-)

--
2.27.0

