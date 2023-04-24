Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDDE6EC82C
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Apr 2023 10:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjDXI6a (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Apr 2023 04:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjDXI63 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Apr 2023 04:58:29 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 066B5E5E
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Apr 2023 01:58:29 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id B7EFD1FD7B;
        Mon, 24 Apr 2023 08:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1682326707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2KsN1V3LZEtdFqq36eDVk4nfUTrXtItgjE/Q0UzO78c=;
        b=sjYBGC5tRcaRbxsA0CbMhwi5UJ/73GQmAvfX+FQdgdg6yjeUA7hpEc3l3aU72HBjLNMdsk
        kW0o3nstNkyPoUv1p+3/D9g+HJLRiC03MzUJDvFnrpA0sG30UwZm92GZIBFkX3rSzz1hcM
        0mTidvlMkJONGtc3IwswNns4HLZxurE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1682326707;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2KsN1V3LZEtdFqq36eDVk4nfUTrXtItgjE/Q0UzO78c=;
        b=XCAwZFYnqzDJjsVExF5zNxPQcqXS00+Je86sHFdRXlHUJ9zCjrFRjtCAxO4s29ZqpCxyQe
        j/gs37RoafugclDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 793141391A;
        Mon, 24 Apr 2023 08:58:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id CI+wHLNERmQneQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 24 Apr 2023 08:58:27 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, geert@linux-m68k.org
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linuxppc-dev@lists.ozlabs.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/3] fbdev/68328fb: Init owner field of struct fb_ops
Date:   Mon, 24 Apr 2023 10:58:23 +0200
Message-Id: <20230424085825.18287-2-tzimmermann@suse.de>
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
 drivers/video/fbdev/68328fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/68328fb.c b/drivers/video/fbdev/68328fb.c
index ef49cdfb7dd2..07d6e8dc686b 100644
--- a/drivers/video/fbdev/68328fb.c
+++ b/drivers/video/fbdev/68328fb.c
@@ -94,6 +94,7 @@ static int mc68x328fb_pan_display(struct fb_var_screeninfo *var,
 static int mc68x328fb_mmap(struct fb_info *info, struct vm_area_struct *vma);
 
 static const struct fb_ops mc68x328fb_ops = {
+	.owner		= THIS_MODULE,
 	.fb_check_var	= mc68x328fb_check_var,
 	.fb_set_par	= mc68x328fb_set_par,
 	.fb_setcolreg	= mc68x328fb_setcolreg,
-- 
2.40.0

