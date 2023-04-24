Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11276EC82D
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Apr 2023 10:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjDXI6b (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Apr 2023 04:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbjDXI6a (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Apr 2023 04:58:30 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652B1E66
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Apr 2023 01:58:29 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 065C41FD7D;
        Mon, 24 Apr 2023 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1682326708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q5qi3O2aD7rdQoBAZWbZmBTd/WmQHLMl1hHZDUbTNtE=;
        b=hWANSOtgxyn3ZNoTcRSEc/O5/Oo2oB4fBC3JSH0R1tvF7+vQfT/OjqR9YLMt0QTWOz27VX
        YAxu93Hjj+e4bASRIDMUcQy7aSlY3+/EbLEFzrC44CI1ei0OrMZfmnUj3kT6Ix5FBH3mFm
        tcJtTW/FwT18rj8pDhIQev+mjj0NEpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1682326708;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q5qi3O2aD7rdQoBAZWbZmBTd/WmQHLMl1hHZDUbTNtE=;
        b=bxkYG1tZc12Cp9Xm2FMtZGWzZt2B4oY9WD2lpM0S/4OQwd4CgyjxKbouDi0Hqi4zjCzTdo
        GCyoQlXE4n8ERZCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC09A13780;
        Mon, 24 Apr 2023 08:58:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id aPXjLLNERmQneQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 24 Apr 2023 08:58:27 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, geert@linux-m68k.org
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linuxppc-dev@lists.ozlabs.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] fbdev/ps3fb: Init owner field of struct fb_ops
Date:   Mon, 24 Apr 2023 10:58:24 +0200
Message-Id: <20230424085825.18287-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424085825.18287-1-tzimmermann@suse.de>
References: <20230424085825.18287-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Initialize the owner field of struct fb_ops. Required to prevent
module unloading while the driver is in use.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/ps3fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index 2fe08b67eda7..98aaa330a193 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -936,6 +936,7 @@ static irqreturn_t ps3fb_vsync_interrupt(int irq, void *ptr)
 
 
 static const struct fb_ops ps3fb_ops = {
+	.owner		= THIS_MODULE,
 	.fb_open	= ps3fb_open,
 	.fb_release	= ps3fb_release,
 	.fb_read        = fb_sys_read,
-- 
2.40.0

