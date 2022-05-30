Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4D65387ED
	for <lists+linux-fbdev@lfdr.de>; Mon, 30 May 2022 21:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243102AbiE3T6Q (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 30 May 2022 15:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242312AbiE3T6Q (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 30 May 2022 15:58:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82675544E5;
        Mon, 30 May 2022 12:58:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1D5F360EFF;
        Mon, 30 May 2022 19:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E59CC385B8;
        Mon, 30 May 2022 19:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653940694;
        bh=72ctE/axp9RcbHHLlGgyhmbJt+bmzqtwO8lqspA2+84=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=BYFHvvipimpr4mqudNK9IU6t9ZMpw5ybT42WzRy6WRiX6Oa82A5gxCNvAFt2lOw7s
         z3xzK2AIQP87BuMpV1jhWVCrIQq2P2HVI2Xcsu8TNsYu/76WOg/oFEA0I2UI6aA+LJ
         Uafz2sLCAnS065uGq5fbmwUAzwBecSTbUfDQPOt59yTN2SAMjOcAJ7xp8a6cwIcY2y
         15I42WBYQs4EXT8ysBPKc7AqBE5fylfxD5cB/hQDTwUj1uIii7iEawToRmvkBRyLcL
         3lKQQsFItJrXgvA/BbiHvD6T2jxEu6qzxhMBndEuUneVdYv8yCuZfGgmO6U0prY2vL
         sSH/T4STrW4FA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6A1BAEAC09C;
        Mon, 30 May 2022 19:58:14 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev updates & fixes for v5.19-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YpUeiCcb0ntt7wct@ls3530>
References: <YpUeiCcb0ntt7wct@ls3530>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YpUeiCcb0ntt7wct@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/for-5.19/fbdev-1
X-PR-Tracked-Commit-Id: 79b66128f13f5c22dea03a2197495c4b96ab31f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8ab2afa23bd197df47819a87f0265c0ac95c5b6a
Message-Id: <165394069442.15519.7261068952610423736.pr-tracker-bot@kernel.org>
Date:   Mon, 30 May 2022 19:58:14 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The pull request you sent on Mon, 30 May 2022 21:44:08 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/for-5.19/fbdev-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8ab2afa23bd197df47819a87f0265c0ac95c5b6a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
