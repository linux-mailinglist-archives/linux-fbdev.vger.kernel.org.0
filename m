Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9789F4B9D37
	for <lists+linux-fbdev@lfdr.de>; Thu, 17 Feb 2022 11:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237143AbiBQKe0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 17 Feb 2022 05:34:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbiBQKeZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 17 Feb 2022 05:34:25 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3CCEFFF8C
        for <linux-fbdev@vger.kernel.org>; Thu, 17 Feb 2022 02:34:08 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id B1D5A1F37D;
        Thu, 17 Feb 2022 10:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1645094047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=TogbLB2YWZU4Ebgwufr1Y/9MrmIOZddMkz5APOYEyk0=;
        b=ejSElkuDIFJvnD8mhqer3og8gtKnJc7hI+VIrcQpad3nTbw1WZZEj80+BubB7OCu8a4b8M
        AMVdKKpM4z4sWHApxq6ROWnPY3+aWPI5hkNGhgJ3s92kfrMnlb4nog2r6trSeKNTIcqUto
        fDHlzMsv7ohc75VjU4+XFOvT+ayyJY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1645094047;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=TogbLB2YWZU4Ebgwufr1Y/9MrmIOZddMkz5APOYEyk0=;
        b=Utrpn1eilMnXnNzAQL9CM4MzrpYhhydPnsCh0IzX4VjMneXiTrj/BwcDaeYFliFbTL2pZ7
        Q+ROS9kWmQxS9wDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 860A413DD8;
        Thu, 17 Feb 2022 10:34:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id QuOgH58kDmLQQgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 17 Feb 2022 10:34:07 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, deller@gmx.de, javierm@redhat.com,
        geert@linux-m68k.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] fbdev: Improve performance of fbdev console
Date:   Thu, 17 Feb 2022 11:34:03 +0100
Message-Id: <20220217103405.26492-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Optimize performance of the fbdev console for the common case of
software-based clearing and image blitting.

The commit descripton of each patch contains resuls os a simple
microbenchmark. I also tested the full patchset's effect on the
console output by printing directory listings (i7-4790, FullHD,
simpledrm, kernel with debugging).

  > time find /usr/share/doc -type f

In the unoptimized case:

  real    0m6.173s
  user    0m0.044s
  sys     0m6.107s

With optimizations applied:

  real    0m4.754s
  user    0m0.044s
  sys     0m4.698s

In the optimized case, printing the directory listing is ~25% faster
than before.

Thomas Zimmermann (2):
  fbdev: Improve performance of sys_fillrect()
  fbdev: Improve performance of sys_imageblit()

 drivers/video/fbdev/core/sysfillrect.c | 16 ++------
 drivers/video/fbdev/core/sysimgblt.c   | 51 ++++++++++++++++++++------
 2 files changed, 42 insertions(+), 25 deletions(-)

-- 
2.34.1

