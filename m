Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E325294C50
	for <lists+linux-fbdev@lfdr.de>; Wed, 21 Oct 2020 14:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439935AbgJUMPP (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 21 Oct 2020 08:15:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:52706 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406570AbgJUMPP (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 21 Oct 2020 08:15:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 34D1BAD2C;
        Wed, 21 Oct 2020 12:15:14 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
        b.zolnierkie@samsung.com, jirislaby@kernel.org,
        gustavoars@kernel.org, peda@axentia.se, jingxiangfeng@huawei.com,
        natechancellor@gmail.com, george.kennedy@oracle.com,
        yepeilin.cs@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] video/fbdev/core: Mark debug-only variable as __maybe_unused
Date:   Wed, 21 Oct 2020 14:15:12 +0200
Message-Id: <20201021121512.17774-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Compiling fbcon.c gives

../drivers/video/fbdev/core/fbcon.c: In function 'fbcon_exit':
../drivers/video/fbdev/core/fbcon.c:3358:7: warning: variable 'pending' set but not used [-Wunused-but-set-variable]
 3358 |   int pending = 0;
      |       ^~~~~~~

The variable pending is only used for fbcon debugging. It's unused
otherwise. Mark it accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index d03f62369734..aca1512b6e86 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3355,7 +3355,7 @@ static void fbcon_exit(void)
 #endif
 
 	for_each_registered_fb(i) {
-		int pending = 0;
+		int __maybe_unused pending = 0;
 
 		mapped = 0;
 		info = registered_fb[i];
-- 
2.28.0

