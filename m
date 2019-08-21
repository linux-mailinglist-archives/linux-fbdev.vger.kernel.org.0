Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C04D9970A6
	for <lists+linux-fbdev@lfdr.de>; Wed, 21 Aug 2019 06:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725268AbfHUECI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 21 Aug 2019 00:02:08 -0400
Received: from condef-03.nifty.com ([202.248.20.68]:47864 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbfHUECI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 21 Aug 2019 00:02:08 -0400
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-03.nifty.com with ESMTP id x7L3tuqe020946
        for <linux-fbdev@vger.kernel.org>; Wed, 21 Aug 2019 12:55:56 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x7L3tQp4016439;
        Wed, 21 Aug 2019 12:55:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7L3tQp4016439
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566359729;
        bh=6fHkMxqT3+v0CE4zyYlxI6pTvIRPi8TKT8Z20L42FeY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CGTM9Ip8o61zeqHGDHeQK9RgclVA0dIXBS0WTjDmQzDmdx6VqjNALxNsUNKVlLh/s
         wQHaHeqEOTciWRofraKElz+DdJTipiVlPP50NKlLPgWLJrV9ny/9Ja7dAh5XudxAIS
         JLi3xQG00ucSqQwts31QadViT0zDqYJoUWEohMiDxynNpGmKR8ybqAmOOwlpnnFvQC
         cNe0MQsqEvIXeRP6yD7BTt+VM0yh9xgK6hIwDAyMoW8BmLBaKBw82B//jbgKYBBBTw
         oqx7PkXwOM93RByfRyHrPGHjRcRq4aEkjc7IKp0K7zrqekUX9s7dPUUr1Nga8nMRc1
         9Hr24AH+ql5mQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] video/logo: simplify cmd_logo
Date:   Wed, 21 Aug 2019 12:55:15 +0900
Message-Id: <20190821035517.21671-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821035517.21671-1-yamada.masahiro@socionext.com>
References: <20190821035517.21671-1-yamada.masahiro@socionext.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Shorten the code. It still works in the same way.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/video/logo/Makefile | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/video/logo/Makefile b/drivers/video/logo/Makefile
index 16f60c1e1766..7d672d40bf01 100644
--- a/drivers/video/logo/Makefile
+++ b/drivers/video/logo/Makefile
@@ -22,20 +22,15 @@ pnmtologo := scripts/pnmtologo
 
 # Create commands like "pnmtologo -t mono -n logo_mac_mono -o ..."
 quiet_cmd_logo = LOGO    $@
-	cmd_logo = $(pnmtologo) \
-			-t $(patsubst $*_%,%,$(notdir $(basename $<))) \
-			-n $(notdir $(basename $<)) -o $@ $<
+      cmd_logo = $(pnmtologo) -t $(lastword $(subst _, ,$*)) -n $* -o $@ $<
 
-$(obj)/%_mono.c: $(src)/%_mono.pbm $(pnmtologo) FORCE
+$(obj)/%.c: $(src)/%.pbm $(pnmtologo) FORCE
 	$(call if_changed,logo)
 
-$(obj)/%_vga16.c: $(src)/%_vga16.ppm $(pnmtologo) FORCE
+$(obj)/%.c: $(src)/%.ppm $(pnmtologo) FORCE
 	$(call if_changed,logo)
 
-$(obj)/%_clut224.c: $(src)/%_clut224.ppm $(pnmtologo) FORCE
-	$(call if_changed,logo)
-
-$(obj)/%_gray256.c: $(src)/%_gray256.pgm $(pnmtologo) FORCE
+$(obj)/%.c: $(src)/%.pgm $(pnmtologo) FORCE
 	$(call if_changed,logo)
 
 # generated C files
-- 
2.17.1

