Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E89535F8D1D
	for <lists+linux-fbdev@lfdr.de>; Sun,  9 Oct 2022 20:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiJISWD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 9 Oct 2022 14:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiJISWB (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sun, 9 Oct 2022 14:22:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F21D1CFF5;
        Sun,  9 Oct 2022 11:22:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B58B2B80D18;
        Sun,  9 Oct 2022 18:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29BDC433D7;
        Sun,  9 Oct 2022 18:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1665339717;
        bh=hMew0+7H3jKWGNHdcEwLappFPSB87+CL29n5rR8InKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MSWJuXWjzkYh0Y2mPsWumIb6J0GlwjxGUXpSTwv9yzzGV/iVCneEH2H9v1LuP1Nmr
         87rU4YJlGZmuV5OIgjQzQ2gVV036UbXsOpm0oMGvM6tyAPFDaK0Trd+vK8kJ0XUuGO
         bJ3WyUNLqWxGfHiwrToZKvH6JEeTyWtGt0fAmkug=
Date:   Sun, 9 Oct 2022 20:22:40 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jiangshan Yi <13667453960@163.com>
Cc:     sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
        linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Jiangshan Yi <yijiangshan@kylinos.cn>,
        k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] staging: sm750fb: fix spelling typo in comment
Message-ID: <Y0MRcIyBtLlzjRzi@kroah.com>
References: <20221009094809.3171319-1-13667453960@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009094809.3171319-1-13667453960@163.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sun, Oct 09, 2022 at 05:48:09PM +0800, Jiangshan Yi wrote:
> From: Jiangshan Yi <yijiangshan@kylinos.cn>

Again, why 163.com?

thanks,

greg k-h
