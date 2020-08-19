Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98D424A8DD
	for <lists+linux-fbdev@lfdr.de>; Thu, 20 Aug 2020 00:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgHSWHu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 19 Aug 2020 18:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgHSWHt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 19 Aug 2020 18:07:49 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EC7C061383
        for <linux-fbdev@vger.kernel.org>; Wed, 19 Aug 2020 15:07:49 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o5so160638pgb.2
        for <linux-fbdev@vger.kernel.org>; Wed, 19 Aug 2020 15:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kf0ZzHRJMAbFMLLUKsjOglGhImKY7cyfAyt1lKaRTFE=;
        b=XdSoOU8bhGfMFDMNkNB0PbGSyC9b/j1tzuVKEsB9zu7tjC2Vu7SEGSFi1W1cIQakbE
         o9qXTs96ee/VmG7efkxn8wb4vmhSq0ewikBueR4YGGz4OVA6fjbIeZISd2TXUVABiNcj
         2cRCBsILsz+/mHHhsf+pfXMZJsKWFTExc0Fuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kf0ZzHRJMAbFMLLUKsjOglGhImKY7cyfAyt1lKaRTFE=;
        b=jq6/Xq/siDSTsTtPVJGsLcH14/wQwqMu3nCZN5mysVPGPmZAG5d1dN9uqnMnIU5/wX
         78OGAAAmiYPex4u8CnLVDmfunMOlCEcftgA11rF1h5ObmrWc0HWVACEi0SXfrQWQSWMk
         aOeBAXELW3v9HHmuC5elUxlFtxB+yH+Nfp6WeOShMkw+WURVMfxhFUz+Gv20U6X6dlh0
         bOM7IMFn/1+GoJEq9ThlQ9EozG6R+RxlCM0D1nnYgWORx6bzNn0oMukPWRozCLMLrnCl
         rjozcOGrAive8SJ+iYQI4TwfFS5zEJwJcDgvBva2AVg58Hl6EHUwj6CF8mJk+wQStM0Y
         mb1Q==
X-Gm-Message-State: AOAM530DAXMRDSw1zD6NEc1ymFocBYOg9l6nLum8QGHdsQ41PX4YVWyj
        +RrQsXarlJ0GWf2pHKH3GNE+Kg==
X-Google-Smtp-Source: ABdhPJxLBSOW/rpsj19Cs2xhJm2vDqZ4jNnT0/9og9Y8mFmIcYvE0rLxvkfRoBix9hXJmZPD7SaZlw==
X-Received: by 2002:a62:6d04:: with SMTP id i4mr10910877pfc.188.1597874869067;
        Wed, 19 Aug 2020 15:07:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q25sm182088pfn.181.2020.08.19.15.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 15:07:48 -0700 (PDT)
Date:   Wed, 19 Aug 2020 15:07:46 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot <syzbot+017265e8553724e514e8@syzkaller.appspotmail.com>
Subject: Re: [PATCH v3] vt: Reject zero-sized screen buffer size.
Message-ID: <202008191452.0278B57D43@keescook>
References: <189fc902-db7c-9886-cc31-c0348435303a@i-love.sakura.ne.jp>
 <20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sun, Jul 12, 2020 at 08:10:12PM +0900, Tetsuo Handa wrote:
> [...]
> @@ -1125,6 +1134,11 @@ int vc_allocate(unsigned int currcons)	/* return 0 on success */
>  	if (!*vc->vc_uni_pagedir_loc)
>  		con_set_default_unimap(vc);
>  
> +	err = -EINVAL;
> +	if (vc->vc_cols > VC_MAXCOL || vc->vc_rows > VC_MAXROW ||
> +	    vc->vc_screenbuf_size > KMALLOC_MAX_SIZE || !vc->vc_screenbuf_size)
> +		goto err_free;
> +	err = -ENOMEM;
>  	vc->vc_screenbuf = kzalloc(vc->vc_screenbuf_size, GFP_KERNEL);
>  	if (!vc->vc_screenbuf)
>  		goto err_free;

I realize this patch already landed, but I wanted to remind folks to
use the check_*_overflow() helpers, which can make a lot of this kind
of stuff easier to deal with.

For example, in this case, I think visual_init() could likely be changed
to return success/failure and do all the sanity checking:

	if (check_shl_overflow(vc->vc_cols, 1, &vc->vc_size_row) ||
	    check_mul_overflow(vc->vc_rows, vc->vc_size_row, &vc->vc_screenbuf_size))
		return -EINVAL;


-- 
Kees Cook
