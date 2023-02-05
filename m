Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C3668B166
	for <lists+linux-fbdev@lfdr.de>; Sun,  5 Feb 2023 20:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjBETsO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 5 Feb 2023 14:48:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjBETsM (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sun, 5 Feb 2023 14:48:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38591B544;
        Sun,  5 Feb 2023 11:48:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 818AE60C1E;
        Sun,  5 Feb 2023 19:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E76D6C4339B;
        Sun,  5 Feb 2023 19:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675626488;
        bh=VKbHwO2+6Iqp6gG8oBSLqbcBjysNpgfoCeogyYqdH8Y=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=MPVeqSPDOU4bLpJAAyZRq910Z9JZYkvIZ42wWuVz8RU8fLVjBMv2PeFE3Is0M93sK
         yz483bC5qVw188FyrfOZnpEf2qreay392/fVbCJjleT0jZxHlDgJe7Pwa/HDU3mdCh
         TV3p9S4c2FDshas0DOvWdOsvGoplVXQmhfGCfcTJFUd3Q9PjGjBAtjiSnfnybCsWET
         QDeYoIMyNeLSMKOYr5ddNjpWMDAqazXe0/2DJpzv8PqjDBf85Za4jk5vmJVX6V73cs
         eTwcVleWJgNT5VFVbNSyBGn9Yi2jcrBqwI9TiBmpduCEgPZkScevPS4KmsJ9T1tifl
         R/kmJT2BspdCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D5681C4314C;
        Sun,  5 Feb 2023 19:48:08 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes for v6.2-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Y996d9DJSOK3hT3A@ls3530>
References: <Y996d9DJSOK3hT3A@ls3530>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y996d9DJSOK3hT3A@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.2-rc7
X-PR-Tracked-Commit-Id: 2b09d5d364986f724f17001ccfe4126b9b43a0be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 870c3a9a2bc48bea0f954172aaff7ed489acaf64
Message-Id: <167562648886.9320.9476987893494229842.pr-tracker-bot@kernel.org>
Date:   Sun, 05 Feb 2023 19:48:08 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The pull request you sent on Sun, 5 Feb 2023 10:44:23 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.2-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/870c3a9a2bc48bea0f954172aaff7ed489acaf64

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
