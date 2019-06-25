Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F02065589B
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Jun 2019 22:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfFYUSZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 25 Jun 2019 16:18:25 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41002 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbfFYUSZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 25 Jun 2019 16:18:25 -0400
Received: by mail-pf1-f196.google.com with SMTP id m30so10045588pff.8
        for <linux-fbdev@vger.kernel.org>; Tue, 25 Jun 2019 13:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C3759lLg28N5SzA+DaR8TOro6guhAa3AkyxeMVNWlaA=;
        b=DBNWTvbkUEl+Q82QyMlUAQZxbfMrPJ21nxvTJc4A4oyXIBct+mV2AWriOS8GrtDjct
         fQ/AWfICuixUtS077KPF0Fam3new/bWEO5cg2HUyNMzH2e6PhYunULc3SmTZ4/V38o+3
         AV5a0gsaJhdI4JNfpn96j+xOPq6/exWqVlEf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C3759lLg28N5SzA+DaR8TOro6guhAa3AkyxeMVNWlaA=;
        b=TVwx9oh6mRFqOwtQloyQMcfvksacooZp0MdvIkU5uWiveOFUd2NH25PDZJvpOp1TKV
         PLBil4pBlphLQX3v+zNqwblrO2pnDRo5btWFGg+CbVnhyo5OozgPO4+HqnLWtMc7C91V
         FXw9OLMs2ed/Tgn4Iv9t1Y5Kbuhk8QponsF9dNjzIY5wxWwCTOI/rk3ZNgy6QDKrMZYc
         0dOqqd1LqdFg3YUjfVq8MNk/XNxZjhFXFysnFNu+5ClhDYzIvE7+WwaeLn2Fy8GTdpun
         YYlyo7kmbxji7VUkxrbaGnuRcNV2oG8J/tzAXLiCzGtY+954zE+zIUaqTLeT5ebZeFc/
         joBQ==
X-Gm-Message-State: APjAAAXG5L4OtLigwY24Yu0/CAGOqN+uN2EsgRwHMcCW1DFBZseeu+vh
        5ZhQDHC/c9+UkpuRrJG6G2s7wg==
X-Google-Smtp-Source: APXvYqwGPlu4RGTZXOO9Hg/R9LKbkgnouJNijjTn5OH6GixTNWAzeh5U8DZXqqavq0InyO3HJemICA==
X-Received: by 2002:a65:42cd:: with SMTP id l13mr39845860pgp.72.1561493904625;
        Tue, 25 Jun 2019 13:18:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h62sm20824588pgc.54.2019.06.25.13.18.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 13:18:23 -0700 (PDT)
Date:   Tue, 25 Jun 2019 13:18:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joe Perches <joe@perches.com>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
Message-ID: <201906251312.5059C51334@keescook>
References: <20190625160103.GA13133@embeddedor>
 <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
 <201906251029.08B862130@keescook>
 <9c0d4ed622d6b8e47e040d398f764d52a9ac396d.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c0d4ed622d6b8e47e040d398f764d52a9ac396d.camel@perches.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Jun 25, 2019 at 10:49:01AM -0700, Joe Perches wrote:
> On Tue, 2019-06-25 at 10:31 -0700, Kees Cook wrote:
> > On Tue, Jun 25, 2019 at 09:52:23AM -0700, Joe Perches wrote:
> > > On Tue, 2019-06-25 at 11:01 -0500, Gustavo A. R. Silva wrote:
> > > > In preparation to enabling -Wimplicit-fallthrough, mark switch
> > > > cases where we are expecting to fall through.
> > > []
> > > > This patch is part of the ongoing efforts to enable
> > > > -Wimplicit-fallthrough.
> > > 
> > > Just enable the thing already.
> > 
> > Linus has been pretty clear about not wanting warning options enabled
> > without first fixing all the cases it warns about first.
> 
> Hey Kees.
> 
> I don't recall that particular tidbit.  Got a link?  

It was spread out over the discussion around removing __deprecated,
about enabling -Wvla, and in person at the kernel summit when asking
what approach to take for -Wimplicit-fallthrough.

-- 
Kees Cook
