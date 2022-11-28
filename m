Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46BF63AFFF
	for <lists+linux-fbdev@lfdr.de>; Mon, 28 Nov 2022 18:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbiK1RsI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 28 Nov 2022 12:48:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233876AbiK1Rr1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 28 Nov 2022 12:47:27 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D574EF33;
        Mon, 28 Nov 2022 09:42:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8A5ACB80EA1;
        Mon, 28 Nov 2022 17:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148D4C433D6;
        Mon, 28 Nov 2022 17:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669657351;
        bh=dveRpISKQkJLWLShsA1cxUOfEv49ruwMA12/Y9PcmJ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X1Xu36tiG+fer2n6CM/k1YC7/YEHZReddTpOfv28pOid8fl6teCxs6VyO8g9pC6DX
         MoTIXQmAFWDseL7pVv7B9aahuWTBCsLBamdEC3greg2kFIHjTNUSwaNnBm4b/Kz+bC
         dTFMN3caqL9o/rol7Z/03qu4Kq746/HoD5Ou4+u98ipkzXOWylo3giYTAhgQSSPmNF
         EOhHvtpqSmxT4p526TDXDX2MzveJS162Fs/u50jbjypMxT73JyN5ChGKZ2bVAsz4I2
         czxL9zj8+HoJ7QAt4DnK4sMaeN7IZW1cqM1AaUNNtU/1Lr3/dPKowYtAwOlwdXFk1Q
         0S+HQ2w8Uz+Bg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sasha Levin <sashal@kernel.org>, daniel@ffwll.ch,
        deller@gmx.de, sam@ravnborg.org, tzimmermann@suse.de,
        geert+renesas@glider.be, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.4 14/16] fbcon: Use kzalloc() in fbcon_prepare_logo()
Date:   Mon, 28 Nov 2022 12:41:57 -0500
Message-Id: <20221128174201.1442499-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128174201.1442499-1-sashal@kernel.org>
References: <20221128174201.1442499-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

[ Upstream commit a6a00d7e8ffd78d1cdb7a43f1278f081038c638f ]

A kernel built with syzbot's config file reported that

  scr_memcpyw(q, save, array3_size(logo_lines, new_cols, 2))

causes uninitialized "save" to be copied.

  ----------
  [drm] Initialized vgem 1.0.0 20120112 for vgem on minor 0
  [drm] Initialized vkms 1.0.0 20180514 for vkms on minor 1
  Console: switching to colour frame buffer device 128x48
  =====================================================
  BUG: KMSAN: uninit-value in do_update_region+0x4b8/0xba0
   do_update_region+0x4b8/0xba0
   update_region+0x40d/0x840
   fbcon_switch+0x3364/0x35e0
   redraw_screen+0xae3/0x18a0
   do_bind_con_driver+0x1cb3/0x1df0
   do_take_over_console+0x11cb/0x13f0
   fbcon_fb_registered+0xacc/0xfd0
   register_framebuffer+0x1179/0x1320
   __drm_fb_helper_initial_config_and_unlock+0x23ad/0x2b40
   drm_fbdev_client_hotplug+0xbea/0xda0
   drm_fbdev_generic_setup+0x65e/0x9d0
   vkms_init+0x9f3/0xc76
   (...snipped...)

  Uninit was stored to memory at:
   fbcon_prepare_logo+0x143b/0x1940
   fbcon_init+0x2c1b/0x31c0
   visual_init+0x3e7/0x820
   do_bind_con_driver+0x14a4/0x1df0
   do_take_over_console+0x11cb/0x13f0
   fbcon_fb_registered+0xacc/0xfd0
   register_framebuffer+0x1179/0x1320
   __drm_fb_helper_initial_config_and_unlock+0x23ad/0x2b40
   drm_fbdev_client_hotplug+0xbea/0xda0
   drm_fbdev_generic_setup+0x65e/0x9d0
   vkms_init+0x9f3/0xc76
   (...snipped...)

  Uninit was created at:
   __kmem_cache_alloc_node+0xb69/0x1020
   __kmalloc+0x379/0x680
   fbcon_prepare_logo+0x704/0x1940
   fbcon_init+0x2c1b/0x31c0
   visual_init+0x3e7/0x820
   do_bind_con_driver+0x14a4/0x1df0
   do_take_over_console+0x11cb/0x13f0
   fbcon_fb_registered+0xacc/0xfd0
   register_framebuffer+0x1179/0x1320
   __drm_fb_helper_initial_config_and_unlock+0x23ad/0x2b40
   drm_fbdev_client_hotplug+0xbea/0xda0
   drm_fbdev_generic_setup+0x65e/0x9d0
   vkms_init+0x9f3/0xc76
   (...snipped...)

  CPU: 2 PID: 1 Comm: swapper/0 Not tainted 6.1.0-rc4-00356-g8f2975c2bb4c #924
  Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
  ----------

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/cad03d25-0ea0-32c4-8173-fd1895314bce@I-love.SAKURA.ne.jp
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 4a544e1e2038..673af5937489 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -604,7 +604,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
 		if (scr_readw(r) != vc->vc_video_erase_char)
 			break;
 	if (r != q && new_rows >= rows + logo_lines) {
-		save = kmalloc(array3_size(logo_lines, new_cols, 2),
+		save = kzalloc(array3_size(logo_lines, new_cols, 2),
 			       GFP_KERNEL);
 		if (save) {
 			int i = cols < new_cols ? cols : new_cols;
-- 
2.35.1

