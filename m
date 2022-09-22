Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C34375E6120
	for <lists+linux-fbdev@lfdr.de>; Thu, 22 Sep 2022 13:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiIVLdM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 22 Sep 2022 07:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiIVLdL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 22 Sep 2022 07:33:11 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4DCE21CE
        for <linux-fbdev@vger.kernel.org>; Thu, 22 Sep 2022 04:33:10 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 5A342219BD;
        Thu, 22 Sep 2022 11:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1663846389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=TQvMpeIy7cygWqyqnF1hlTB6kVkyGdVkV1T4Po87npQ=;
        b=yoCkJLCmKv8hjDuBTEAxfYkwO6rYLGOkvlqDKfieQD/MWidBdDOIkYYwaaJ7h8WDuBmMWZ
        LITnul/r2/iXXtdkY5HoAfduyI+T2LSHgeM6m5nRqyEZkLUlhxDqEX0FbkN6ZkR4Ac0XFK
        wC2Ob+za9ideUna+yvUTh439N8PnN5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1663846389;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=TQvMpeIy7cygWqyqnF1hlTB6kVkyGdVkV1T4Po87npQ=;
        b=lnoHL8kIiwZUq//J3yGz5E0Z7C2tvQq9m6s6ry3OE1hQZ5cUlAjIjFI34WZfpzqR7yS3hD
        D+ESSk4MRR3L2sBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 081CB13AA5;
        Thu, 22 Sep 2022 11:33:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id KAsVAfVHLGPyPAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 22 Sep 2022 11:33:09 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
        deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
        msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, geert@linux-m68k.org,
        mark.cave-ayland@ilande.co.uk
Cc:     linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/4] drm: Add driver for PowerPC OF displays
Date:   Thu, 22 Sep 2022 13:33:02 +0200
Message-Id: <20220922113306.11251-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
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

PowerPC's Open Firmware offers a simple display buffer for graphics
output. Add ofdrm, a DRM driver for the device. As with the existing
simpledrm driver, the graphics hardware is pre-initialized by the
firmware. The driver only provides blitting, no actual DRM modesetting
is possible.

For version 3 of this patchset, all preparatory changes have been
merged into the DRM codebase. Only ofdrm changes are left.

Patch 1 adds ofdrm, which has again been significantly reworked.
The FWFB library has been removed infavor of various functions in
existing DRM helper libraries. Ofdrm now supports damage iterators
and synchronization for imported GEM BOs.

Patches 2 to 4 add support for color management. The code has been
taken from fbdev's offb. I have no hardware available for testing the
functionality. Qemu's stdvga apparently does not support gamma tables
in RGB modes. I verified that the color management code is executed
by running Gnome's night-mode settings, but the display's color tone
does not change.

Thomas Zimmermann (4):
  drm/ofdrm: Add ofdrm for Open Firmware framebuffers
  drm/ofdrm: Add CRTC state
  drm/ofdrm: Add per-model device function
  drm/ofdrm: Support color management

 MAINTAINERS                   |    1 +
 drivers/gpu/drm/tiny/Kconfig  |   13 +
 drivers/gpu/drm/tiny/Makefile |    1 +
 drivers/gpu/drm/tiny/ofdrm.c  | 1351 +++++++++++++++++++++++++++++++++
 drivers/video/fbdev/Kconfig   |    1 +
 5 files changed, 1367 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/ofdrm.c


base-commit: a7d5d07d5ac5ac58ec81932b3f732e3127d17af9
-- 
2.37.3

