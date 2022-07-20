Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B6F57B871
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 Jul 2022 16:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234570AbiGTO1l (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 20 Jul 2022 10:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbiGTO1j (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 20 Jul 2022 10:27:39 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733533E75F
        for <linux-fbdev@vger.kernel.org>; Wed, 20 Jul 2022 07:27:38 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2C9DC34851;
        Wed, 20 Jul 2022 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1658327254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=ndyTqgDHrwAnRGiKTFcM0pUlQ6zCKyLMtSPcv3dUEvI=;
        b=foVbmkvsWdvUGChCCXU0jXpKoN76BNS/M252S4BtEOB1pY19WzLPmvlFbJOXL1sSHiPyWZ
        L9e1sqdkz/rLs5qOCErxAUzERLr/F7uq/xe13EwhmJ4L8TJchu+iJ4Pi/dNHO8jKc98wIe
        DTEoLyxLyAqusSbMDN0zt65CwhuCDWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1658327254;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=ndyTqgDHrwAnRGiKTFcM0pUlQ6zCKyLMtSPcv3dUEvI=;
        b=pZY0KCwwddwZRf0uPX+Z3MZHcVpvAbibSGhx3s4tDi0jFFZfclFKR8NaYAA8TxWpTBKQyn
        mF2LoWhv56JVVECg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D75A713AAD;
        Wed, 20 Jul 2022 14:27:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id mvSsM9UQ2GLfHgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 14:27:33 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
        deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
        msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, geert@linux-m68k.org,
        mark.cave-ayland@ilande.co.uk
Cc:     linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/10] drm: Add driver for PowerPC OF displays
Date:   Wed, 20 Jul 2022 16:27:22 +0200
Message-Id: <20220720142732.32041-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
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

(was: drm: Add driverof PowerPC OF displays)

PowerPC's Open Firmware offers a simple display buffer for graphics
output. Add ofdrm, a DRM driver for the device. As with the existing
simpledrm driver, the graphics hardware is pre-initialized by the
firmware. The driver only provides blitting, no actual DRM modesetting
is possible.

Version 2 of this patchset starts by cleaning up and refactoring
simpledrm, and moving some of the code in a helper library. These
functions are useful for ofdrm as well.

Patch 7 adds ofdrm, which has been significantly reworked since v1.
PCI is now optional and COMPILE_TEST is supported.

Patches 8 to 10 add support for color management. The code has been
taken from fbdev's offb. I have no hardware available for testing the
functionality. Qemu's stdvga apparently does not support gamma tables
in RGB modes. I verified that the color management code is executed
by running Gnome's night-mode settings, but the display's color tone
does not change.

Thomas Zimmermann (10):
  drm/simpledrm: Remove mem field from device structure
  drm/simpledrm: Inline device-init helpers
  drm/simpledrm: Remove pdev field from device structure
  drm/simpledrm: Compute framebuffer stride if not set
  drm/simpledrm: Convert to atomic helpers
  drm/simpledrm: Move some functionality into fwfb helper library
  drm/ofdrm: Add ofdrm for Open Firmware framebuffers
  drm/ofdrm: Add CRTC state
  drm/ofdrm: Add per-model device function
  drm/ofdrm: Support color management

 Documentation/gpu/drm-kms-helpers.rst |   12 +
 MAINTAINERS                           |    3 +
 drivers/gpu/drm/Kconfig               |    6 +
 drivers/gpu/drm/Makefile              |    3 +-
 drivers/gpu/drm/drm_fwfb_helper.c     |  301 ++++++
 drivers/gpu/drm/tiny/Kconfig          |   15 +
 drivers/gpu/drm/tiny/Makefile         |    1 +
 drivers/gpu/drm/tiny/ofdrm.c          | 1301 +++++++++++++++++++++++++
 drivers/gpu/drm/tiny/simpledrm.c      |  588 +++++------
 drivers/video/fbdev/Kconfig           |    1 +
 include/drm/drm_fwfb_helper.h         |   51 +
 11 files changed, 1949 insertions(+), 333 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_fwfb_helper.c
 create mode 100644 drivers/gpu/drm/tiny/ofdrm.c
 create mode 100644 include/drm/drm_fwfb_helper.h

-- 
2.36.1

