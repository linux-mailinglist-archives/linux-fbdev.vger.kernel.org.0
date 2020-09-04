Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B4425DD2F
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Sep 2020 17:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730813AbgIDPYI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 4 Sep 2020 11:24:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:32942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730220AbgIDPYH (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 4 Sep 2020 11:24:07 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 230432074D;
        Fri,  4 Sep 2020 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599233047;
        bh=ri7zmUpgyKTMYbtz2kSDMQhuxoAgWTRyxdor8sG91Hg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v7jW2vEhVr8p23I/HLTgMVDzv/+VDSoGYpdmM/nuLNXYiLpN+dnzni3LQmpvsVaVd
         UZ3874kcTdk389T9t/dzruGQ70LzC/qKevtSC0v38b2LWOyO9LrH1oc10AB0Io28zh
         HqQFP/YiUoenvO6h10Kes+Xr/Qvi8HyI++84pREE=
Date:   Fri, 4 Sep 2020 17:24:28 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 (resend)] video: fbdev: fix OOB read in
 vga_8planes_imageblit()
Message-ID: <20200904152428.GA3501859@kroah.com>
References: <11ad8786-e407-3289-8bd9-2745c4834718@i-love.sakura.ne.jp>
 <90b55ec3-d5b0-3307-9f7c-7ff5c5fd6ad3@i-love.sakura.ne.jp>
 <36618e37-2cb6-8114-7a43-788780fae321@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36618e37-2cb6-8114-7a43-788780fae321@i-love.sakura.ne.jp>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Sep 04, 2020 at 11:53:16PM +0900, Tetsuo Handa wrote:
> Hello, Greg.
> 
> Since nobody is interested in this bug, can you directly pick up
> this obvious patch without waiting for maintainer's response?

I'll pick it up now.

thanks,

greg k-h
