Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E82657CA0
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Dec 2022 16:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233847AbiL1Pe2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 28 Dec 2022 10:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233209AbiL1Pe2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 28 Dec 2022 10:34:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E6211648F;
        Wed, 28 Dec 2022 07:34:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B1E8561542;
        Wed, 28 Dec 2022 15:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB39C433F0;
        Wed, 28 Dec 2022 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1672241666;
        bh=SW5xKFSPrwYLrKP1omDMY+E/09Pr8z9WKCx+2TLz0uQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OBzdoWBmldAdErd0Fy0EavevjKR3oYDk9Osfrsx+2mqMqvwNMyPVQTyPILdscoUzh
         OYEbocwSzNlpCyNZblqST4NWX1X+VuRT5n5McCyU+p6BeHQAksn5tiT2ww/d5oJ1tp
         mQpBoS+HA/frZUH7ZCG0/VtQh1QM9VoyjkL66nkI=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Richard Weinberger <richard@nod.at>,
        linux-um@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
        Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Michal Januszewski <spock@gentoo.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 509/731] fbdev: uvesafb: dont build on UML
Date:   Wed, 28 Dec 2022 15:40:16 +0100
Message-Id: <20221228144311.300749846@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228144256.536395940@linuxfoundation.org>
References: <20221228144256.536395940@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 35b4f4d4a725cf8f8c10649163cd12aed509b953 ]

The uvesafb fbdev driver uses memory management information that is not
available on ARCH=um, so don't allow this driver to be built on UML.

Prevents these build errors:

../drivers/video/fbdev/uvesafb.c: In function ‘uvesafb_vbe_init’:
../drivers/video/fbdev/uvesafb.c:807:21: error: ‘__supported_pte_mask’ undeclared (first use in this function)
  807 |                 if (__supported_pte_mask & _PAGE_NX) {
../drivers/video/fbdev/uvesafb.c:807:44: error: ‘_PAGE_NX’ undeclared (first use in this function)
  807 |                 if (__supported_pte_mask & _PAGE_NX) {

Fixes: 68f5d3f3b654 ("um: add PCI over virtio emulation driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Richard Weinberger <richard@nod.at>
Cc: linux-um@lists.infradead.org
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Michal Januszewski <spock@gentoo.org>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 5050a9f8e879..26531aa19428 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -606,6 +606,7 @@ config FB_TGA
 config FB_UVESA
 	tristate "Userspace VESA VGA graphics support"
 	depends on FB && CONNECTOR
+	depends on !UML
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
2.35.1



