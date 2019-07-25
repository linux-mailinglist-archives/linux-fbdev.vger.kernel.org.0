Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 012B574802
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jul 2019 09:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbfGYHVh (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 25 Jul 2019 03:21:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:42824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725808AbfGYHVh (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 25 Jul 2019 03:21:37 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4ACDE21734;
        Thu, 25 Jul 2019 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564039295;
        bh=koldjvoUr4frV/SN/rliziUGZJdzC8i5yEDGFavMyKI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q3GkVwGN7MzdTpN8WKWen3Ox7EBsfjyv6qPIoakxutGNF5HC07TNvxy2MoYsob5ld
         ehtMtSldlH1PZH2HQ79/NiPEPGiWZY3tMwP+3dPlfk7wD384Oty5tD60P0XCzwqKFV
         w0ySB482LvT5v28iOs8Sg/57nVsCac+eoYAO3W1g=
Date:   Thu, 25 Jul 2019 09:21:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jan Sebastian =?iso-8859-1?Q?G=F6tte?= <linux@jaseg.net>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Phil Reid <preid@electromag.com.au>,
        dri-devel@lists.freedesktop.org, nishadkamdar@gmail.com,
        bhanusreemahesh@gmail.com, leobras.c@gmail.com,
        linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: [PATCH v2] Staging: fbtft: Fix GPIO handling
Message-ID: <20190725072132.GA18714@kroah.com>
References: <20190715143003.12819-1-nsaenzjulienne@suse.de>
 <7b8242ab-cc0c-d90b-60af-ff1c53789e44@opensynergy.com>
 <5a77c18f-7338-888f-2379-12171b6a545e@jaseg.net>
 <75ada52f-afa1-08bc-d0ce-966fc1110e70@jaseg.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75ada52f-afa1-08bc-d0ce-966fc1110e70@jaseg.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jul 17, 2019 at 11:41:37PM +0900, Jan Sebastian Götte wrote:
> Commit c440eee1a7a1 ("Staging: fbtft: Switch to the gpio descriptor
> interface") breaks GPIO handling. In several places, checks to only set
> a GPIO if it was configured ended up backwards.
> I have tested this fix. The fixed driver works with a ili9486
> display connected to a raspberry pi via SPI.
> 
> Fixes: commit c440eee1a7a1d ("Staging: fbtft: Switch to the gpio descriptor interface")
> Tested-by: Jan Sebastian Götte <linux@jaseg.net>
> Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Jan Sebastian Götte <linux@jaseg.net>
> ---

Can this go on top of Phil's patches?  Or does it replace it?

I can't figure out what to do here, sorry.

thanks,

greg k-h
