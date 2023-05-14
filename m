Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22BD7701AFB
	for <lists+linux-fbdev@lfdr.de>; Sun, 14 May 2023 02:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233804AbjENAwa (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 13 May 2023 20:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbjENAw3 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 13 May 2023 20:52:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFDFC1FCD;
        Sat, 13 May 2023 17:52:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5E71261541;
        Sun, 14 May 2023 00:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7B1EC433EF;
        Sun, 14 May 2023 00:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684025547;
        bh=qxamtKkRAoZRHqoBvnHzvqyqOuFPnLjYtgmn7P8WFYM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=N4c8ir2u1g9MR8bOjhZnyjqCMskRiD6+ADwl9Ng2PcOpB9eoskJhQRM74FtcJWZ2l
         rDsL7M0wFY6AOIAthdL0BPg549FzBEVz+a3bbuxLTplQH9+g3+21wfvXPpyr/JQLm2
         bWjqW5tkJMF4m6yn6yF1DZ3zEynauB6+a+rNXa7JRd8LAkWnM/CgHfTbt1WSiaSe+s
         /po3uO/SNZdCWLgbZ2GEQ4CgDJged0yA2NSkzM1+Nf2cj82TU5kU/lCtcv590+7i7a
         LY+tNVOZ4OKTzvcQivMuds2+yaD36QDkK4bkfg1eJ14pkoBoKDLRSnjC67Y/Kfg5bv
         PzjQG9sHKvMng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B2E17E49F61;
        Sun, 14 May 2023 00:52:27 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and updates for v6.4-rc2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZGAd+wWXxlA+zvSs@ls3530>
References: <ZGAd+wWXxlA+zvSs@ls3530>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZGAd+wWXxlA+zvSs@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.4-rc2
X-PR-Tracked-Commit-Id: 0bdf1ad8d10bd4e50a8b1a2c53d15984165f7fea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: adfbf653a3ba6bb8bbb84ed90bf4f1533db545d3
Message-Id: <168402554772.23680.10459468742364825475.pr-tracker-bot@kernel.org>
Date:   Sun, 14 May 2023 00:52:27 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The pull request you sent on Sun, 14 May 2023 01:32:11 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/adfbf653a3ba6bb8bbb84ed90bf4f1533db545d3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
