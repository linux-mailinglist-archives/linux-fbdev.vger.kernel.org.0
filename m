Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7A360B8A2
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Oct 2022 21:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbiJXTwW (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Oct 2022 15:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233560AbiJXTvr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Oct 2022 15:51:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD25CEA6BF
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Oct 2022 11:17:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CB87AB8171E
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Oct 2022 12:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5F4C433C1;
        Mon, 24 Oct 2022 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666614799;
        bh=N9wIamNHKy/+ppn5xdXN60PJL5TdYTrdbc8ReqtAUWw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hc+bbdp2OxajHemJUi1ByRJcqctWsgYxL+m97MF0ouspSYiNXzJPUEVwtgIu0C5F/
         NfilP+ZE42qTeLFm1OBSYes5Aqp1wXga76NRZwQL0s5mFADGc1bCDN9bdasq9Pd/Rq
         T2YFBccOh+0s3xOVUa4xg5ARCcXgBqNQGrLRqAJqErHzVwChtoFu4jYvTzdZYUivo3
         lslINB7FjHzmbSkMbemuKML3VQAFbMMXRloYuvEi+lcpvAs7OiI6diV4VB0vp3ZiD/
         e2ZAj6aP9A8C3ORRfAEXdq84vtDrJfIELLlQAPbGcc7mGt2Obvg6sdLpEBhirzlYp0
         IZbZNRM7dPiRw==
Date:   Mon, 24 Oct 2022 13:33:15 +0100
From:   Lee Jones <lee@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linus.walleij@linaro.org, daniel.thompson@linaro.org
Subject: Re: [PATCH -next resend] backlight: ktd253: Switch to use
 dev_err_probe() helper
Message-ID: <Y1aGC36X50XvlNwm@google.com>
References: <20220926142059.2294282-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220926142059.2294282-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 26 Sep 2022, Yang Yingliang wrote:

> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> Resend for adding Sob.
> ---
>  drivers/video/backlight/ktd253-backlight.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
