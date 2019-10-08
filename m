Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1E05CF60C
	for <lists+linux-fbdev@lfdr.de>; Tue,  8 Oct 2019 11:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729440AbfJHJbw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 8 Oct 2019 05:31:52 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38200 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729375AbfJHJbw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 8 Oct 2019 05:31:52 -0400
Received: by mail-wr1-f65.google.com with SMTP id w12so18553206wro.5
        for <linux-fbdev@vger.kernel.org>; Tue, 08 Oct 2019 02:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EazPgAo0KA2L5bP4whOU0gOC5nZeJshj93xKT7W2t+s=;
        b=LvRJZ6xdJUrFyuFeAodhiVrfTO3DINKsAGx5CCndd95qCzlD3/66+r3BM6b4TVrhk8
         Qcgcu2flQ2+Umci8gVj+SNBnKTRagow1zCD7w+Nc1xtPRN+0+xMTp+adeKR92rYh5Y8P
         ZL9bIDvNsNdzq3OwbVBOY+1I/eF0YDPhfTzMPpOFZ9rtQrdHk86cgQLIN0q44I0qa2yG
         9+WhoLIspFeot/bC/hvdfCot1SYQi0S+uCAJe2t9uzGAPIC0waYd+AnylUcFUXwyWG7w
         6h/9fe1CFTmkV24gQe0sTW8D8A8y3Cutm0sZgtDX6ywbw6oa6vDO4xmLo0+HvVKuYwL2
         hKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EazPgAo0KA2L5bP4whOU0gOC5nZeJshj93xKT7W2t+s=;
        b=LsDBzBCFT5xVPLHcbs5PrJcdHoxVhznxUKUMLsOgxWXqd8hUok0ApPJbPoQtEVDLvu
         zJWLGifBRbtTq48Ky1HsB3hobualxn4j7p0YDSTaFXO8FwFJordEcofL+Z1Ad6uINyYb
         qjIFR9kwgn6aYJEpWdDYPH4paOnKZMPvapbtctPfo9rsd8woHjq4tguoBaf5FGKNpjRl
         hgGHJxWr6Mcu1T1oWtiinSOsJc22f/ssOxZ5mEtGfveqhD69Q/EvM49a33UGTVUtEXVM
         TuT2cflWzWpkVgv5lOi3jIqtvJnZWiTIORPzkcpkg8zIUvCQ/mxsNJ3uqvsk7TYm66O/
         LU6Q==
X-Gm-Message-State: APjAAAWjy4tRMP8AjbDjNBsjqfanHpamXbuqhQ4aRSnYJqxA4egvWUNo
        M2C3ufqNNdlc8/ulPm8cUvZztA==
X-Google-Smtp-Source: APXvYqwB7AB3D9uRJhoIYfpbGU3+i/oZ+UjAk1ESfaX46FXfeAEMx/zSwkXAZlDmwRpq//zo58NovA==
X-Received: by 2002:adf:e3c8:: with SMTP id k8mr14526118wrm.268.1570527108416;
        Tue, 08 Oct 2019 02:31:48 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id i11sm7291389wrw.57.2019.10.08.02.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 02:31:47 -0700 (PDT)
Date:   Tue, 8 Oct 2019 10:31:45 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] backlight: pwm_bl: drop use of int_pow()
Message-ID: <20191008093145.kgx6ytkbycmmkist@holly.lan>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
 <20190919140620.32407-3-linux@rasmusvillemoes.dk>
 <20191007152800.3nhbf7h7knumriz4@holly.lan>
 <5f19e307-29c4-f077-568d-b2bd6ae74608@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f19e307-29c4-f077-568d-b2bd6ae74608@rasmusvillemoes.dk>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Oct 07, 2019 at 08:43:31PM +0200, Rasmus Villemoes wrote:
> On 07/10/2019 17.28, Daniel Thompson wrote:
> > On Thu, Sep 19, 2019 at 04:06:18PM +0200, Rasmus Villemoes wrote:
> > 
> > It feels like there is some rationale missing in the description here.
> > 
> > What is the benefit of replacing the explicit int_pow() with the
> > implicit multiplications?
> > 
> > 
> > Daniel.
> > 
> > 
> >>
> >> We could (and a following patch will) change to use a power-of-2 scale,
> >> but for a fixed small exponent of 3, there's no advantage in using
> >> repeated squaring.
> 
>    ^^^^^^^^^^^^^^^^^^                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Apart from the function call overhead (and resulting register pressure
> etc.), using int_pow is less efficient (for an exponent of 3, it ends up
> doing four 64x64 multiplications instead of just two). But feel free to
> drop it, I'm not going to pursue it further - it just seemed like a
> sensible thing to do while I was optimizing the code anyway.
> 
> [At the time I wrote the patch, this was also the only user of int_pow
> in the tree, so it also allowed removing int_pow altogether.]

To be honest the change is fine but the patch description doesn't make
sense if the only current purpose of the patch is as a optimization.


Daniel.
