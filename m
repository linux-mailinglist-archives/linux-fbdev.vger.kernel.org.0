Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6EC8747F2
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jul 2019 09:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387797AbfGYHQj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 25 Jul 2019 03:16:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:41126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387722AbfGYHQj (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 25 Jul 2019 03:16:39 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8187621734;
        Thu, 25 Jul 2019 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564038998;
        bh=Twe7T2ksbtZDBiQa7kI9kVZPuxOy4gwdvC5nAZG75H4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p5Rt+SvwJnjf8AhPSfbDvu5rxBNibDaMh3f0kbsM0xcaYZ0mzb9e8ssJjpsgeuDEW
         LxSwJIRU0oWiVrKh+HQERxJ06yB9JBDtkhAnsWNe7YU4AMFa1GqNv/TWwKHsztpVT6
         ipUOuzZHSDbZOxYjjCWDq3VF+3lhtzG7aOvUARUo=
Date:   Thu, 25 Jul 2019 09:16:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     nishadkamdar@gmail.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org,
        Kernel Janitors <kernel-janitors@vger.kernel.org>
Subject: Re: [RFC] Staging: fbtft: Typo in
Message-ID: <20190725071635.GA17271@kroah.com>
References: <f4881a63-8702-55f2-ed03-cfbc30970083@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4881a63-8702-55f2-ed03-cfbc30970083@wanadoo.fr>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sun, Jul 21, 2019 at 08:54:39PM +0200, Christophe JAILLET wrote:
> Hi,
> 
> looking at the code in 'drivers/staging/fbtft/fb_pcd8544.c', there seems to
> be some typos.
> 
> At the end of the file, we can find:
> 
> FBTFT_REGISTER_DRIVER(DRVNAME, "philips,pdc8544", &display);
> ...
> MODULE_ALIAS("spi:pdc8544");
> 
> 
> It is likely that the 2 pdc8544 should be pcd8544. (d and c switched)
> 
> As I don't know the implication of such a change, I prefer to first report
> the potential issue, before proposing a patch for it.

Submit a patch, that's the best way to discuss it!

thanks,

greg k-h
