Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 885DC742223
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jun 2023 10:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbjF2I2x (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 29 Jun 2023 04:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbjF2I2t (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 29 Jun 2023 04:28:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF8810F
        for <linux-fbdev@vger.kernel.org>; Thu, 29 Jun 2023 01:28:47 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1qEn1C-0005qC-0l; Thu, 29 Jun 2023 10:28:46 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-fbdev@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Helge Deller <deller@gmx.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH fbtest] Initialize ticks in benchmark()
Date:   Thu, 29 Jun 2023 10:28:40 +0200
Message-Id: <20230629082840.888110-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fixes a build error with GCC 13:

  util.c: In function 'benchmark':
  util.c:177:17: error: 'ticks' may be used uninitialized [-Werror=maybe-uninitialized]
  util.c:161:14: note: 'ticks' was declared here

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util.c b/util.c
index cdf89b38618a..1193523990e7 100644
--- a/util.c
+++ b/util.c
@@ -158,7 +158,7 @@ static uint64_t get_ticks(void)
 
 double benchmark(void (*func)(unsigned long n, void *data), void *data)
 {
-    uint64_t ticks;
+    uint64_t ticks = 0;
     unsigned long n = 1;
 
     printf("Benchmarking... ");
-- 
2.39.2

