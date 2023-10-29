Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 404A67DAEE1
	for <lists+linux-fbdev@lfdr.de>; Sun, 29 Oct 2023 23:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbjJ2Wyr (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 29 Oct 2023 18:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjJ2Wyr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 29 Oct 2023 18:54:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56877BC;
        Sun, 29 Oct 2023 15:54:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B6DC433C8;
        Sun, 29 Oct 2023 22:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698620084;
        bh=1TQGvqTPML02EuJFmbb4WOcBkTgs/4pXNv1pyJS/8MU=;
        h=From:To:Cc:Subject:Date:From;
        b=Nwj9TYQQhvbAK9FlhXRfayCnzie8HdZbyhsQMcaEEGKtBFGMJfV+MuPixVxhBLnWy
         eNXiWdZvN2sjTpwkwMhikT7wcNvlifwBO238ZWbFXRXzdjWWZIAaTOnBGlnESQN9TM
         GaPTuRfQ9gYDF/nMo+wfQpPfj1hGBzENG7T2huahodgH3FOB4BBHQR7CZ0cDxRjGRt
         zofJi+JaxUshDvNl/NfVWtc14uy4BiNRoqLYpxTpOofWbjlbc+4jhAFnFsEfEOMSMK
         FS4AW6rql892cz1rczqiYK6h53uCakStB5bzHsNppuzZhMsPmzgIG5w9DpUj8nUhhl
         vhz5rr8ihyfOQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Helge Deller <deller@gmx.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sasha Levin <sashal@kernel.org>, sam@ravnborg.org,
        javierm@redhat.com, xu.panda@zte.com.cn, schnelle@linux.ibm.com,
        steve@sk2.org
Subject: [PATCH AUTOSEL 6.5 01/52] fbdev: atyfb: only use ioremap_uc() on i386 and ia64
Date:   Sun, 29 Oct 2023 18:52:48 -0400
Message-ID: <20231029225441.789781-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.9
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit c1a8d1d0edb71dec15c9649cb56866c71c1ecd9e ]

ioremap_uc() is only meaningful on old x86-32 systems with the PAT
extension, and on ia64 with its slightly unconventional ioremap()
behavior, everywhere else this is the same as ioremap() anyway.

Change the only driver that still references ioremap_uc() to only do so
on x86-32/ia64 in order to allow removing that interface at some
point in the future for the other architectures.

On some architectures, ioremap_uc() just returns NULL, changing
the driver to call ioremap() means that they now have a chance
of working correctly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/aty/atyfb_base.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index cba2b113b28b0..a73114c1c6918 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -3440,11 +3440,15 @@ static int atyfb_setup_generic(struct pci_dev *pdev, struct fb_info *info,
 	}
 
 	info->fix.mmio_start = raddr;
+#if defined(__i386__) || defined(__ia64__)
 	/*
 	 * By using strong UC we force the MTRR to never have an
 	 * effect on the MMIO region on both non-PAT and PAT systems.
 	 */
 	par->ati_regbase = ioremap_uc(info->fix.mmio_start, 0x1000);
+#else
+	par->ati_regbase = ioremap(info->fix.mmio_start, 0x1000);
+#endif
 	if (par->ati_regbase == NULL)
 		return -ENOMEM;
 
-- 
2.42.0

