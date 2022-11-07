Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCDEC61F128
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Nov 2022 11:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbiKGKtm (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 7 Nov 2022 05:49:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231588AbiKGKtl (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 7 Nov 2022 05:49:41 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C538EF9
        for <linux-fbdev@vger.kernel.org>; Mon,  7 Nov 2022 02:49:40 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 86B881F383;
        Mon,  7 Nov 2022 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1667818179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=nnkhv+SYQZ+M1HDhgReYoOWAxqV7BM04VF8ZrUO1cvc=;
        b=oeeDb3DKvqdgfl9NLPGW0FVLyC1jIKi4XMEL0CqPtTrLCE4WLarYRwfZ3XBDqTfozkKMig
        vWKo9nFSzqs6UfuzufmL6EVo09aNpMyfbVPlKz0jW4oG5I04ekX2sG/naHy8GEnIO29v1U
        KNl+e3Hs+g5hq2gCNrig06REcCIdfOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1667818179;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=nnkhv+SYQZ+M1HDhgReYoOWAxqV7BM04VF8ZrUO1cvc=;
        b=eXj1lWs9XeeFHN+0so6kUbmrUTNco68FCVrp0aMEMZIm86PMVCAla7uotTL8rTV67/sUq2
        uNmOd5Ftx8hlqVCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 66F8713494;
        Mon,  7 Nov 2022 10:49:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id IrBPGMPiaGPkewAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 07 Nov 2022 10:49:39 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, daniel@ffwll.ch, javierm@redhat.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] video/fbdev: Support 'nomodeset' in PCI drivers 
Date:   Mon,  7 Nov 2022 11:49:14 +0100
Message-Id: <20221107104916.18733-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Add support for the kernel's 'nomodeset' parameter to PCI-based
fbdev drivers. The option prevents DRM drivers from loading if they
could possibly displace a hardware-agnostic driver that runs on the
firmware framebuffer. It is a fallback for systems on which the
hardware's native driver does not work correctly.

After the work on the aperture helpers and their integration with
fbdev, it can happen that an fbdev driver replaces a hardware-
agnostic DRM driver. Supporting the nomodeset parameter unifies
the behavior among the graphics drivers and subsystems. An fbdev
driver will not replace any hardware-agnostic driver with nomodeset
given.

Thomas Zimmermann (2):
  drm: Move nomodeset kernel parameter to drivers/video
  fbdev: Add support for the nomodeset kernel parameter

 .../admin-guide/kernel-parameters.txt         |  2 +-
 MAINTAINERS                                   |  2 +
 drivers/gpu/drm/Kconfig                       |  7 +---
 drivers/gpu/drm/Makefile                      |  1 -
 drivers/staging/sm750fb/Kconfig               |  1 +
 drivers/staging/sm750fb/sm750.c               |  4 ++
 drivers/video/Kconfig                         |  4 ++
 drivers/video/Makefile                        |  1 +
 drivers/video/fbdev/Kconfig                   | 37 +++++++++++++++++++
 drivers/video/fbdev/arkfb.c                   |  6 +++
 drivers/video/fbdev/asiliantfb.c              |  5 +++
 drivers/video/fbdev/aty/aty128fb.c            |  6 +++
 drivers/video/fbdev/aty/atyfb_base.c          |  6 +++
 drivers/video/fbdev/aty/radeon_base.c         |  6 +++
 drivers/video/fbdev/carminefb.c               |  5 +++
 drivers/video/fbdev/chipsfb.c                 |  5 +++
 drivers/video/fbdev/cirrusfb.c                |  6 +++
 drivers/video/fbdev/cyber2000fb.c             |  6 +++
 drivers/video/fbdev/geode/Kconfig             |  3 ++
 drivers/video/fbdev/geode/gx1fb_core.c        |  7 ++++
 drivers/video/fbdev/geode/gxfb_core.c         |  7 ++++
 drivers/video/fbdev/geode/lxfb_core.c         |  7 ++++
 drivers/video/fbdev/gxt4500.c                 |  5 +++
 drivers/video/fbdev/hyperv_fb.c               |  5 +++
 drivers/video/fbdev/i740fb.c                  |  6 +++
 drivers/video/fbdev/i810/i810_main.c          |  8 ++++
 drivers/video/fbdev/imsttfb.c                 |  7 ++++
 drivers/video/fbdev/intelfb/intelfbdrv.c      |  5 +++
 drivers/video/fbdev/kyro/fbdev.c              |  6 +++
 drivers/video/fbdev/matrox/matroxfb_base.c    |  5 +++
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c    |  5 +++
 drivers/video/fbdev/neofb.c                   |  6 +++
 drivers/video/fbdev/nvidia/nvidia.c           |  7 ++++
 drivers/video/fbdev/pm2fb.c                   |  6 +++
 drivers/video/fbdev/pm3fb.c                   |  6 +++
 drivers/video/fbdev/pvr2fb.c                  |  7 ++++
 drivers/video/fbdev/riva/fbdev.c              |  7 ++++
 drivers/video/fbdev/s3fb.c                    |  6 +++
 drivers/video/fbdev/savage/savagefb_driver.c  |  5 +++
 drivers/video/fbdev/sis/sis_main.c            |  7 ++++
 drivers/video/fbdev/skeletonfb.c              |  7 ++++
 drivers/video/fbdev/sm712fb.c                 |  5 +++
 drivers/video/fbdev/sstfb.c                   |  4 ++
 drivers/video/fbdev/sunxvr2500.c              |  5 +++
 drivers/video/fbdev/sunxvr500.c               |  5 +++
 drivers/video/fbdev/tdfxfb.c                  |  6 +++
 drivers/video/fbdev/tgafb.c                   |  6 +++
 drivers/video/fbdev/tridentfb.c               |  6 +++
 drivers/video/fbdev/vermilion/vermilion.c     |  7 ++++
 drivers/video/fbdev/via/via-core.c            |  5 +++
 drivers/video/fbdev/vt8623fb.c                |  6 +++
 .../drm/drm_nomodeset.c => video/nomodeset.c} | 12 +++---
 include/drm/drm_drv.h                         |  8 +++-
 include/video/nomodeset.h                     |  8 ++++
 54 files changed, 319 insertions(+), 14 deletions(-)
 rename drivers/{gpu/drm/drm_nomodeset.c => video/nomodeset.c} (63%)
 create mode 100644 include/video/nomodeset.h


base-commit: 3aa97a74d622aa26fe79cf4bd819b6a4fd176e90
-- 
2.38.0

