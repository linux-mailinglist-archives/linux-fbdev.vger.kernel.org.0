Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 001C07DB120
	for <lists+linux-fbdev@lfdr.de>; Mon, 30 Oct 2023 00:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbjJ2X3p (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 29 Oct 2023 19:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbjJ2X3X (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 29 Oct 2023 19:29:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806494C2E;
        Sun, 29 Oct 2023 15:59:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2B8C116A3;
        Sun, 29 Oct 2023 22:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698620392;
        bh=V3MW3HlJw0Dv/VdEsrQyNiXGgZkXx8rL2UAla9DTeeg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kltlq8OYt6TuaBQPUd/mS6caO2DHtrfOsGctGcJ64B3DfI9N/IpdiGT0ZZnbfeVk4
         b4nHonZhLc7U9zyvUxJEAP9oqJL1d9NKH1Yx8msWfcLn9OA88wvKuIeqm0MsU6hlec
         +xmbAfd2oaQGTA20XzGT3BUE6BF868tiDtsQUEW8Z5XWl0tmEApnQYP2qeWOTvXoKC
         t0VteOaiNlViMXPkLiPZbVWbFzRKB2/WYBjoN1Ya5VwHIwX0ovirLdVQILiG+tbWqx
         EsDIGL3JnywzbZ9zj7Iad9KhcqKJHhS9gcetkwrmvG/VGdiB+aLT86F3JxcDyrxweB
         mq9/9dFdOFKLg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, Helge Deller <deller@gmx.de>,
        Sasha Levin <sashal@kernel.org>, daniel@ffwll.ch,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.15 22/28] fbdev: core: syscopyarea: fix sloppy typing
Date:   Sun, 29 Oct 2023 18:58:57 -0400
Message-ID: <20231029225916.791798-22-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225916.791798-1-sashal@kernel.org>
References: <20231029225916.791798-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.137
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

From: Sergey Shtylyov <s.shtylyov@omp.ru>

[ Upstream commit e8e4a470b677511f9d1ad4f3cef32adc1d9a60ca ]

In sys_copyarea(), the local variable bits_per_line is needlessly typed as
*unsigned long* -- which is a 32-bit type on the 32-bit arches and a 64-bit
type on the 64-bit arches; that variable's value is derived from the __u32
typed fb_fix_screeninfo::line_length field (multiplied by 8u) and a 32-bit
*unsigned int* type should still be enough to store the # of bits per line.

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/syscopyarea.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/syscopyarea.c b/drivers/video/fbdev/core/syscopyarea.c
index c1eda31909682..7b8bd3a2bedc5 100644
--- a/drivers/video/fbdev/core/syscopyarea.c
+++ b/drivers/video/fbdev/core/syscopyarea.c
@@ -316,7 +316,7 @@ void sys_copyarea(struct fb_info *p, const struct fb_copyarea *area)
 {
 	u32 dx = area->dx, dy = area->dy, sx = area->sx, sy = area->sy;
 	u32 height = area->height, width = area->width;
-	unsigned long const bits_per_line = p->fix.line_length*8u;
+	unsigned int const bits_per_line = p->fix.line_length * 8u;
 	unsigned long *base = NULL;
 	int bits = BITS_PER_LONG, bytes = bits >> 3;
 	unsigned dst_idx = 0, src_idx = 0, rev_copy = 0;
-- 
2.42.0

