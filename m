Return-Path: <linux-fbdev+bounces-3593-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E57A1CD39
	for <lists+linux-fbdev@lfdr.de>; Sun, 26 Jan 2025 17:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C76B3A7F71
	for <lists+linux-fbdev@lfdr.de>; Sun, 26 Jan 2025 16:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF41D19F416;
	Sun, 26 Jan 2025 16:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkW8gUVF"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1919F104;
	Sun, 26 Jan 2025 16:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737909983; cv=none; b=kjk4sg6L92WhVK+AyHtPU0jGRKdOyJdLo2R6X0KGOWo5BQqmlI2+4d6qX9Veu/fgCug8RQcAFDVfrawCXNOwfMbkFyxhSotlbVZzZzShOCg18lLuZiIFvI+18KA/aIjYNZYxIIEzUg3WWzV7AEEdySueKcSxBQogGrKe17v/G8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737909983; c=relaxed/simple;
	bh=MEe2oo2YjYf2lKVsyVv7MzPAyJxoyZAgPw92+aRPQfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dz/g/EjTKjB4ER/W/2PmIUUJWtuECW4zHCakTWGPSeUmb3SM1U0NfC/Mmp0YTIFVDxf8a0o+IDXgvjwWZ2TNKIOvijVl6ln5viRVGVfYndlHAK04lPCiavlBv5SpusFuTmwKcXfuqTyqYpyMcl24p3FGuJ28hPUukOMpWFxXMIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkW8gUVF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263D0C4CEE2;
	Sun, 26 Jan 2025 16:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737909983;
	bh=MEe2oo2YjYf2lKVsyVv7MzPAyJxoyZAgPw92+aRPQfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DkW8gUVFafTu/MC0pAg4/0QvAfrgelXtr4Tg4n0z4Nm0Iew9BDcCbR++dXrVh3Eoy
	 DHc9YhuOx5eDCv4tIb5t4nX9v2ta1fbH/TOJbDuatoZ2RJkeLPlB2NVF7GQcCd/rpm
	 GLCnrIX81f9Gys3++HKqe52G0xP9+C7HAIeBROtS6xex2sKdaOZG94YTXG70ntm0m8
	 wv0oqVKvYI6clR75exlJcXyYx7rj5N3+910c0D217Y525I46uXqq6OhGZ/GQRgXN3L
	 bOST7DNAmlYDdXlb8Ql7CCvw0Hg91XC+pN5oxr9zKO8MLq1AM9/8pY7SaKL7U623hq
	 H2gXkxaErXpHQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Linus Walleij <linus.walleij@linaro.org>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 2/2] fbdev: omap: use threaded IRQ for LCD DMA
Date: Sun, 26 Jan 2025 11:46:18 -0500
Message-Id: <20250126164618.964225-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126164618.964225-1-sashal@kernel.org>
References: <20250126164618.964225-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.127
Content-Transfer-Encoding: 8bit

From: Aaro Koskinen <aaro.koskinen@iki.fi>

[ Upstream commit e4b6b665df815b4841e71b72f06446884e8aad40 ]

When using touchscreen and framebuffer, Nokia 770 crashes easily with:

    BUG: scheduling while atomic: irq/144-ads7846/82/0x00010000
    Modules linked in: usb_f_ecm g_ether usb_f_rndis u_ether libcomposite configfs omap_udc ohci_omap ohci_hcd
    CPU: 0 UID: 0 PID: 82 Comm: irq/144-ads7846 Not tainted 6.12.7-770 #2
    Hardware name: Nokia 770
    Call trace:
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x54/0x5c
     dump_stack_lvl from __schedule_bug+0x50/0x70
     __schedule_bug from __schedule+0x4d4/0x5bc
     __schedule from schedule+0x34/0xa0
     schedule from schedule_preempt_disabled+0xc/0x10
     schedule_preempt_disabled from __mutex_lock.constprop.0+0x218/0x3b4
     __mutex_lock.constprop.0 from clk_prepare_lock+0x38/0xe4
     clk_prepare_lock from clk_set_rate+0x18/0x154
     clk_set_rate from sossi_read_data+0x4c/0x168
     sossi_read_data from hwa742_read_reg+0x5c/0x8c
     hwa742_read_reg from send_frame_handler+0xfc/0x300
     send_frame_handler from process_pending_requests+0x74/0xd0
     process_pending_requests from lcd_dma_irq_handler+0x50/0x74
     lcd_dma_irq_handler from __handle_irq_event_percpu+0x44/0x130
     __handle_irq_event_percpu from handle_irq_event+0x28/0x68
     handle_irq_event from handle_level_irq+0x9c/0x170
     handle_level_irq from generic_handle_domain_irq+0x2c/0x3c
     generic_handle_domain_irq from omap1_handle_irq+0x40/0x8c
     omap1_handle_irq from generic_handle_arch_irq+0x28/0x3c
     generic_handle_arch_irq from call_with_stack+0x1c/0x24
     call_with_stack from __irq_svc+0x94/0xa8
    Exception stack(0xc5255da0 to 0xc5255de8)
    5da0: 00000001 c22fc620 00000000 00000000 c08384a8 c106fc00 00000000 c240c248
    5dc0: c113a600 c3f6ec30 00000001 00000000 c22fc620 c5255df0 c22fc620 c0279a94
    5de0: 60000013 ffffffff
     __irq_svc from clk_prepare_lock+0x4c/0xe4
     clk_prepare_lock from clk_get_rate+0x10/0x74
     clk_get_rate from uwire_setup_transfer+0x40/0x180
     uwire_setup_transfer from spi_bitbang_transfer_one+0x2c/0x9c
     spi_bitbang_transfer_one from spi_transfer_one_message+0x2d0/0x664
     spi_transfer_one_message from __spi_pump_transfer_message+0x29c/0x498
     __spi_pump_transfer_message from __spi_sync+0x1f8/0x2e8
     __spi_sync from spi_sync+0x24/0x40
     spi_sync from ads7846_halfd_read_state+0x5c/0x1c0
     ads7846_halfd_read_state from ads7846_irq+0x58/0x348
     ads7846_irq from irq_thread_fn+0x1c/0x78
     irq_thread_fn from irq_thread+0x120/0x228
     irq_thread from kthread+0xc8/0xe8
     kthread from ret_from_fork+0x14/0x28

As a quick fix, switch to a threaded IRQ which provides a stable system.

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/omap/lcd_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap/lcd_dma.c b/drivers/video/fbdev/omap/lcd_dma.c
index f85817635a8c2..0da23c57e4757 100644
--- a/drivers/video/fbdev/omap/lcd_dma.c
+++ b/drivers/video/fbdev/omap/lcd_dma.c
@@ -432,8 +432,8 @@ static int __init omap_init_lcd_dma(void)
 
 	spin_lock_init(&lcd_dma.lock);
 
-	r = request_irq(INT_DMA_LCD, lcd_dma_irq_handler, 0,
-			"LCD DMA", NULL);
+	r = request_threaded_irq(INT_DMA_LCD, NULL, lcd_dma_irq_handler,
+				 IRQF_ONESHOT, "LCD DMA", NULL);
 	if (r != 0)
 		pr_err("unable to request IRQ for LCD DMA (error %d)\n", r);
 
-- 
2.39.5


