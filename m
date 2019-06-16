Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A14F47356
	for <lists+linux-fbdev@lfdr.de>; Sun, 16 Jun 2019 07:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbfFPFya (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 16 Jun 2019 01:54:30 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36199 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfFPFya (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 16 Jun 2019 01:54:30 -0400
Received: by mail-pg1-f196.google.com with SMTP id f21so3943973pgi.3
        for <linux-fbdev@vger.kernel.org>; Sat, 15 Jun 2019 22:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cO4Uu9l8/14KA60VnT20K6kxZTiYScPHxYXqS8cUj1Y=;
        b=oJy6wAILXG5XXDF7BqvaIIslFpvreRsURJ349wTXd6E8u3yzB/zsnAeP1ByNGOr/q1
         7iJxhRQ1Q3YD2MiwJzR9A3zB5ZGEbSPHoG7lcxZxJ8pksViZKqhHdSRI5saBC5jKPrn+
         biELiNd6G0h+iA9sl2l/xuKmaNK/IS4TpZYCABkxMdsah745uWxD+wDeFHsBfQd1enVe
         Wh4bwH/Xnyb7AKHVc37B4ORnULcrkPXh67xR0SVimQT1B6RQN2fH1GgOdF2HL55fL/Rt
         B7boVBkGVoMzgjZfUBlOafIfsbybmaD6rXAf2lMs8dHneV3P/EG8+kJLOunRIHk4l+xc
         1bnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cO4Uu9l8/14KA60VnT20K6kxZTiYScPHxYXqS8cUj1Y=;
        b=NC1pfSGrtZnvlM8aerZFbYV673LANDoi68Tdc0WxEFbnO8nTvWA2NGZHSnJQhQp0yj
         kKA5vrL0HT2M4DYG5Y5gEsLwmedjdpold20XdOwNE9kssr0EDD9rTnhGPCQa34+VQGXo
         foIkUtcVSU2uJ8YB0DtZ/+4gw+CsjYpARxr5kxwdY3lCBs5GfsaVquNYyqTU8KM7ZKdz
         SZA+NgcM9B/t5zVQcke963lxi6aIGXWcFnZMLpwk6Ad8xqWlzJZYXoa9JddpBaXr2JFK
         w89GXWo3VVOPFrRnJflbv6sJG4JTyuWtMecNAN+a5CWyn9DvAfPSE1NBxKinPSBh+bOU
         vOmw==
X-Gm-Message-State: APjAAAX9uKY+XumlnkEw2pQZtLLlVuT7aSVu95jlQen/9gDUUNQdqOgk
        4R7cvZcd4z8BFpTQLzGELVEgFn59otU=
X-Google-Smtp-Source: APXvYqyE31dqao1iOV0g2rcBg/sjS3exQKNiDuAwYomijphgZtZyQlqwtwWrIEqT4Eu5e69OGoItXQ==
X-Received: by 2002:a63:e709:: with SMTP id b9mr42033753pgi.209.1560664469649;
        Sat, 15 Jun 2019 22:54:29 -0700 (PDT)
Received: from t-1000 (c-98-210-58-162.hsd1.ca.comcast.net. [98.210.58.162])
        by smtp.gmail.com with ESMTPSA id w4sm7891097pfw.97.2019.06.15.22.54.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Jun 2019 22:54:28 -0700 (PDT)
Date:   Sat, 15 Jun 2019 22:54:26 -0700
From:   Shobhit Kukreti <shobhitkukreti@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Fix checkpatch ERROR: space prohibited
 before that close parenthesis ')'
Message-ID: <20190616055425.GA6051@t-1000>
References: <20190614023225.GA27938@t-1000>
 <20190615173302.GB4914@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190615173302.GB4914@kroah.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sat, Jun 15, 2019 at 07:33:02PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 13, 2019 at 07:32:28PM -0700, Shobhit Kukreti wrote:
> > Cleaned up code to resolve  the checkpatch error
> > ERROR: space prohibited before that close parenthesis ')'
> > from the file:
> > 
> > fbtft/fbtft-bus.c
> > 
> > Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>
> > ---
> >  drivers/staging/fbtft/fbtft-bus.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
> > index 2ea814d..2b43bc2 100644
> > --- a/drivers/staging/fbtft/fbtft-bus.c
> > +++ b/drivers/staging/fbtft/fbtft-bus.c
> > @@ -62,9 +62,9 @@ out:									      \
> >  }                                                                             \
> >  EXPORT_SYMBOL(func);
> >  
> > -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> > +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
> >  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
> > -define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
> > +define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
> 
> Will this still build?  I thought I remember some old versions of gcc
> not liking this...
I was able to build it with Ubuntu/Linaro GCC-5.4.0
> 
> Did you test this patch out?
I booted the kernel on qemu-2.12 and insmod of fbtft drivers did not 
return any errors. I did not test on actual display hardware. 
If that is mandatory, I can drop the patch. 
> 
> thanks,
> 
> greg k-h

Thank you for your patience and feedback.

Shobhit Kukreti
