Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 789254716B
	for <lists+linux-fbdev@lfdr.de>; Sat, 15 Jun 2019 19:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbfFORdF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 15 Jun 2019 13:33:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:33446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725270AbfFORdF (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 15 Jun 2019 13:33:05 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BA2A21841;
        Sat, 15 Jun 2019 17:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560619985;
        bh=WGXI8jXG0pKfq2SJo5cutcD1R3GEYJqxwZCDZAfx5/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vhyOA3qKzYPZ7gnbY9LxRLHZl5uU4g7RBi63PuoHo/ljxYZz0uMtZJ5dVVwMBtc7L
         rUfN8DBIZhRsl4vpkJYFgIRCNlGjwBoz+tmwrVncGcXdi6WREwYzpg5ViH7+cPnv+Y
         IhxZPapatIjP86VWnebmCvJ9ZcAtv3l2xOxKJRM4=
Date:   Sat, 15 Jun 2019 19:33:02 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Shobhit Kukreti <shobhitkukreti@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Fix checkpatch ERROR: space prohibited
 before that close parenthesis ')'
Message-ID: <20190615173302.GB4914@kroah.com>
References: <20190614023225.GA27938@t-1000>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614023225.GA27938@t-1000>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jun 13, 2019 at 07:32:28PM -0700, Shobhit Kukreti wrote:
> Cleaned up code to resolve  the checkpatch error
> ERROR: space prohibited before that close parenthesis ')'
> from the file:
> 
> fbtft/fbtft-bus.c
> 
> Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
> index 2ea814d..2b43bc2 100644
> --- a/drivers/staging/fbtft/fbtft-bus.c
> +++ b/drivers/staging/fbtft/fbtft-bus.c
> @@ -62,9 +62,9 @@ out:									      \
>  }                                                                             \
>  EXPORT_SYMBOL(func);
>  
> -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
>  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
> -define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
> +define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)

Will this still build?  I thought I remember some old versions of gcc
not liking this...

Did you test this patch out?

thanks,

greg k-h
