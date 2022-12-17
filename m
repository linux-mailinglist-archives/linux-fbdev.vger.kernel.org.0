Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018C964F5B0
	for <lists+linux-fbdev@lfdr.de>; Sat, 17 Dec 2022 01:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiLQALw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 16 Dec 2022 19:11:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiLQALT (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 16 Dec 2022 19:11:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2484740801;
        Fri, 16 Dec 2022 16:10:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A6624622CB;
        Sat, 17 Dec 2022 00:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79287C433D2;
        Sat, 17 Dec 2022 00:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671235829;
        bh=mv8tgCOUMGgtx94A/3ywNez81omKJEm3PGs42DkrCxo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dfQq5FjS5taah0ZNDWPi0cUQ25cV3PhQepoa22b7kh4Z325yNlaTCMZb9x5IcVjHy
         k097TCRlP/rX7Sv2ApHnnxgLulYYNb3Ui9FHmiAFODTSa/F6k1o3kgSNi+RfcPDyb7
         eafZNXxDWyTtUYJV0pUf5cGY0pcj11oeurfKo5wAA8RUtk8BP9gxsdY2YOqvnjEqK6
         y5HBcwt/puSF8WZQw7lwkI46um/4Mfgj5Li2gYV/JdkcR6eIFgIFMEWzYJ0jIiXMc3
         YecBKpTCHHO6PmWWh5IQVW09aJqvpgSnl5hzFXTO8zDKg355IaTIQGsQE8c8mmdl3W
         SnsZlfWYrOa7A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Andrea Parri <parri.andrea@gmail.com>,
        Dexuan Cui <decui@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Michael Kelley <mikelley@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Tianyu Lan <Tianyu.Lan@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>,
        Fabio A M Martins <fabiomirmar@gmail.com>,
        Sasha Levin <sashal@kernel.org>, deller@gmx.de,
        linux-hyperv@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.0 4/8] video: hyperv_fb: Avoid taking busy spinlock on panic path
Date:   Fri, 16 Dec 2022 19:10:08 -0500
Message-Id: <20221217001013.41239-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001013.41239-1-sashal@kernel.org>
References: <20221217001013.41239-1-sashal@kernel.org>
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

From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>

[ Upstream commit 1d044ca035dc22df0d3b39e56f2881071d9118bd ]

The Hyper-V framebuffer code registers a panic notifier in order
to try updating its fbdev if the kernel crashed. The notifier
callback is straightforward, but it calls the vmbus_sendpacket()
routine eventually, and such function takes a spinlock for the
ring buffer operations.

Panic path runs in atomic context, with local interrupts and
preemption disabled, and all secondary CPUs shutdown. That said,
taking a spinlock might cause a lockup if a secondary CPU was
disabled with such lock taken. Fix it here by checking if the
ring buffer spinlock is busy on Hyper-V framebuffer panic notifier;
if so, bail-out avoiding the potential lockup scenario.

Cc: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Michael Kelley <mikelley@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Tianyu Lan <Tianyu.Lan@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Tested-by: Fabio A M Martins <fabiomirmar@gmail.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
Reviewed-by: Michael Kelley <mikelley@microsoft.com>
Link: https://lore.kernel.org/r/20220819221731.480795-10-gpiccoli@igalia.com
Signed-off-by: Wei Liu <wei.liu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hv/ring_buffer.c        | 13 +++++++++++++
 drivers/video/fbdev/hyperv_fb.c |  8 +++++++-
 include/linux/hyperv.h          |  2 ++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/hv/ring_buffer.c b/drivers/hv/ring_buffer.c
index 59a4aa86d1f3..c6692fd5ab15 100644
--- a/drivers/hv/ring_buffer.c
+++ b/drivers/hv/ring_buffer.c
@@ -280,6 +280,19 @@ void hv_ringbuffer_cleanup(struct hv_ring_buffer_info *ring_info)
 	ring_info->pkt_buffer_size = 0;
 }
 
+/*
+ * Check if the ring buffer spinlock is available to take or not; used on
+ * atomic contexts, like panic path (see the Hyper-V framebuffer driver).
+ */
+
+bool hv_ringbuffer_spinlock_busy(struct vmbus_channel *channel)
+{
+	struct hv_ring_buffer_info *rinfo = &channel->outbound;
+
+	return spin_is_locked(&rinfo->ring_lock);
+}
+EXPORT_SYMBOL_GPL(hv_ringbuffer_spinlock_busy);
+
 /* Write to the ring buffer. */
 int hv_ringbuffer_write(struct vmbus_channel *channel,
 			const struct kvec *kv_list, u32 kv_count,
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index b58b445bb529..0839ba7d3a34 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -779,12 +779,18 @@ static void hvfb_ondemand_refresh_throttle(struct hvfb_par *par,
 static int hvfb_on_panic(struct notifier_block *nb,
 			 unsigned long e, void *p)
 {
+	struct hv_device *hdev;
 	struct hvfb_par *par;
 	struct fb_info *info;
 
 	par = container_of(nb, struct hvfb_par, hvfb_panic_nb);
-	par->synchronous_fb = true;
 	info = par->info;
+	hdev = device_to_hv_device(info->device);
+
+	if (hv_ringbuffer_spinlock_busy(hdev->channel))
+		return NOTIFY_DONE;
+
+	par->synchronous_fb = true;
 	if (par->need_docopy)
 		hvfb_docopy(par, 0, dio_fb_size);
 	synthvid_update(info, 0, 0, INT_MAX, INT_MAX);
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 3b42264333ef..646f1da9f27e 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1341,6 +1341,8 @@ struct hv_ring_buffer_debug_info {
 int hv_ringbuffer_get_debuginfo(struct hv_ring_buffer_info *ring_info,
 				struct hv_ring_buffer_debug_info *debug_info);
 
+bool hv_ringbuffer_spinlock_busy(struct vmbus_channel *channel);
+
 /* Vmbus interface */
 #define vmbus_driver_register(driver)	\
 	__vmbus_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
-- 
2.35.1

