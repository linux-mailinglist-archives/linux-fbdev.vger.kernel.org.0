Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5BD84EC1A4
	for <lists+linux-fbdev@lfdr.de>; Wed, 30 Mar 2022 13:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344342AbiC3Lzu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 30 Mar 2022 07:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345941AbiC3LzP (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 30 Mar 2022 07:55:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916095FAD;
        Wed, 30 Mar 2022 04:53:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 31F2D615E7;
        Wed, 30 Mar 2022 11:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC90C340EE;
        Wed, 30 Mar 2022 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648641186;
        bh=qW1x31HnZxqlWv9yLK7leVGiHSRFHxjgpFRqN+3ePM4=;
        h=From:To:Cc:Subject:Date:From;
        b=W4CPcDGsBYpYWlko8pj3hn89Ct669WcC+u4xXKXp9jUUkZPBRB/q7EAn4e418XgVG
         YKodxE8PBo5yYf8Ye4APktYygiG/6t4OW+U3r5UIzmeoloycnyyizoxbWQWnI8ydUE
         swdA52iYWg4aq9P4+49RJx4vxWXIZF6+ivMYMep8zR4D8bqc4l+yAP/CMRrin3gGwH
         g8ut4S/A2nldglLxGzaZQ8a8aTUIXuZ4loFlmVrYsiLN8goIVrV7FH4pshXK5NBL9H
         HDIh+ScZejK9m0U2m52ccBquinZsfQegjCj0BI4zvLJbVFyLP6R+a04zc76DUpl+8C
         cDfbUiaOGk4oQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tim Gardner <tim.gardner@canonical.com>,
        Antonino Daplas <adaplas@gmail.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Helge Deller <deller@gmx.de>, Sasha Levin <sashal@kernel.org>,
        tomi.valkeinen@ti.com
Subject: [PATCH AUTOSEL 4.19 01/22] video: fbdev: nvidiafb: Use strscpy() to prevent buffer overflow
Date:   Wed, 30 Mar 2022 07:52:42 -0400
Message-Id: <20220330115303.1672616-1-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Tim Gardner <tim.gardner@canonical.com>

[ Upstream commit 37a1a2e6eeeb101285cd34e12e48a881524701aa ]

Coverity complains of a possible buffer overflow. However,
given the 'static' scope of nvidia_setup_i2c_bus() it looks
like that can't happen after examiniing the call sites.

CID 19036 (#1 of 1): Copy into fixed size buffer (STRING_OVERFLOW)
1. fixed_size_dest: You might overrun the 48-character fixed-size string
  chan->adapter.name by copying name without checking the length.
2. parameter_as_source: Note: This defect has an elevated risk because the
  source argument is a parameter of the current function.
 89        strcpy(chan->adapter.name, name);

Fix this warning by using strscpy() which will silence the warning and
prevent any future buffer overflows should the names used to identify the
channel become much longer.

Cc: Antonino Daplas <adaplas@gmail.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/nvidia/nv_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/nvidia/nv_i2c.c b/drivers/video/fbdev/nvidia/nv_i2c.c
index d7994a173245..0b48965a6420 100644
--- a/drivers/video/fbdev/nvidia/nv_i2c.c
+++ b/drivers/video/fbdev/nvidia/nv_i2c.c
@@ -86,7 +86,7 @@ static int nvidia_setup_i2c_bus(struct nvidia_i2c_chan *chan, const char *name,
 {
 	int rc;
 
-	strcpy(chan->adapter.name, name);
+	strscpy(chan->adapter.name, name, sizeof(chan->adapter.name));
 	chan->adapter.owner = THIS_MODULE;
 	chan->adapter.class = i2c_class;
 	chan->adapter.algo_data = &chan->algo;
-- 
2.34.1

