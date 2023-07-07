Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE9974ACF8
	for <lists+linux-fbdev@lfdr.de>; Fri,  7 Jul 2023 10:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbjGGIe3 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 7 Jul 2023 04:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbjGGIe2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 7 Jul 2023 04:34:28 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC6B90;
        Fri,  7 Jul 2023 01:34:27 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7989C227B0;
        Fri,  7 Jul 2023 08:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1688718866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Pvfj/OY6eCHI5adzX5a09+e+OBxPRPHmLMKqJIGthDI=;
        b=1GFi3pIGlBjSZkCD/VYvTY5TMcveaTo2LhruYtHhaMYNkMV8bjN6ZvuZScTeBSuIj1N951
        S3p7n9wct/WmCXVSVsJwYTbsHbMY7Ph3loJvwC9HKAfMc99osCFJJ0uLMtoDdTQAxL57JT
        Kgy4uydqkc5Ah9uaFHeNHY9ziHw1P8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1688718866;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Pvfj/OY6eCHI5adzX5a09+e+OBxPRPHmLMKqJIGthDI=;
        b=3ZFfdrcNBnX0QGiMOP/uCo/tK0c3jzRLvVLQMdkCfhlkjQGhUmk/NQ1hsItKS5pHpbvyme
        02tuatFhYQSDuQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4697B1346D;
        Fri,  7 Jul 2023 08:34:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0qwgEBLOp2RdQAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 07 Jul 2023 08:34:26 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 00/12] drm: Improve fbdev emulation for DMA-able framebuffers
Date:   Fri,  7 Jul 2023 10:31:51 +0200
Message-ID: <20230707083422.18691-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Add fbdev helpers for framebuffers in DMA-able memory and update
fbdev emulation in the respective DRM drivers. DMA memory used to
handled as system memory. Improve this and prepare for possible
future changes.

Patch 1 adds initializer macros for struct fb_ops and a Kconfig
token for framebuffers in DMA memory.

Patches 2 to 5 update fbdev-dma and tegra. No functional changes
are expected as both used system memory before.

Patches 6 and 7 update exynos to use DMA helpers. Exynos incorrectly
used fbdev's I/O-memory helpers. Fix this.

Patches 8 to 10 update omapdrm to use DMA helpers. Patch 7 first
reworks the driver's mmap to current best practices. This also makes
it suitable for use with fbdev, which patches 8 and 9 implement.

Patchies 11 removes some fbdev macros for system memory that are now
unused; patch 12 fixes some comments.

The patchset would ideally go through drm-misc-next. Future patches
can build upon it and update fbdev drivers in similar ways.

v3:
	* set screen_buffer in tegra (Thierry)
v2:
	* fix omap mmap flags
	* drop FBINFO_DEFAULT from patches
	* minor cleanups

Thomas Zimmermann (12):
  fbdev: Add fb_ops init macros for framebuffers in DMA-able memory
  drm/fbdev-dma: Use fbdev DMA helpers
  drm/tegra: Use fbdev DMA helpers
  drm/tegra: Set fbdev FBINFO_VIRTFB flag
  drm/tegra: Store pointer to vmap'ed framebuffer in screen_buffer
  drm/exynos: Use fbdev DMA helpers
  drm/exynos: Set fbdev FBINFO_VIRTFB flag
  drm/omapdrm: Set VM flags in GEM-object mmap function
  drm/omapdrm: Use GEM mmap for fbdev emulation
  drm/omapdrm: Set fbdev FBINFO_VIRTFB flag
  fbdev: Remove FB_DEFAULT_SYS_OPS
  fbdev: Harmonize some comments in <linux/fb.h>

 drivers/gpu/drm/Kconfig                   |  2 +-
 drivers/gpu/drm/drm_fbdev_dma.c           |  4 ++--
 drivers/gpu/drm/exynos/Kconfig            |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  5 ++--
 drivers/gpu/drm/omapdrm/Kconfig           |  2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c        | 12 +---------
 drivers/gpu/drm/omapdrm/omap_fbdev.c      | 16 +++++++++++--
 drivers/gpu/drm/omapdrm/omap_gem.c        | 24 +++++--------------
 drivers/gpu/drm/omapdrm/omap_gem.h        |  3 ---
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c |  7 +-----
 drivers/gpu/drm/tegra/Kconfig             |  2 +-
 drivers/gpu/drm/tegra/fbdev.c             |  7 +++---
 drivers/video/fbdev/Kconfig               |  8 +++++++
 include/linux/fb.h                        | 29 ++++++++++-------------
 14 files changed, 56 insertions(+), 67 deletions(-)

-- 
2.41.0

