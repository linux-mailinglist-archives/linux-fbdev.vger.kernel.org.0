Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB4EA26FD79
	for <lists+linux-fbdev@lfdr.de>; Fri, 18 Sep 2020 14:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgIRMsS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 18 Sep 2020 08:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgIRMsR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 18 Sep 2020 08:48:17 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F91C061797
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Sep 2020 05:48:12 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id s13so5199834wmh.4
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Sep 2020 05:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=j6z/UJ7CNrSXR9o7Cfm16LszuY4Y2gIbIznxSeH0B9A=;
        b=lG981rnRtgZAm6syEr1bZwt4N84LNEPYwI/TtyOO/VThTo/f9Li5vCEwYo6F3ZuutF
         6Gslyar/X9Ttu77h6dUYdULlgBkFmFESpKnO8YxLOmCCqVxm+xNqSqCSvB8T2cqti2My
         /HA7oinA8lX9Ie/JT9IPM3+mo8pr5NmmDoZmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=j6z/UJ7CNrSXR9o7Cfm16LszuY4Y2gIbIznxSeH0B9A=;
        b=MZb58Q7XSdJv5wchGJM+11ZJRrW/b9P5FjC82ZF3iE7VLYMrDfk2k7rkXAbnVoKr1j
         mpPwyq6+TJ2lVgf3ZJ71GaJE9RBpWgALNaMHkqlqINyj+ZdIb6g59Ab5qS+EKVtTxBXs
         Fp79n6fWdaWj8/s7rybVrb8CKem7Qs/OXcrU/0m+HTYOQeZvvXHbyrFSmbAk4LdAn/vY
         i42yDsKYIYWOmmS0uDX2FjRaetMkNRGje+VhsEaquzNjzwpQyc4EBi81t/e8nGWbN0mH
         WPpz81cKOKbc5aadH6L2BEK0Dh+geQi37rNQfnLJh3S3cL2XicXH69ZpyCF8sAMcxXCm
         YZXw==
X-Gm-Message-State: AOAM530z3Z5o9xvVXUUVRFEOF7oX+CTKDIJBGG8HoMltxJhwzCEMBR52
        +OzeA27+/C/P+y4XGmB/1DdAHQ==
X-Google-Smtp-Source: ABdhPJyAwBd6mEl7zhhB5tmC68RAnfpPY5rzLITEX8vAOCgabHANhMyPXmiUCR2jm9cGTwuUEaAfOw==
X-Received: by 2002:a7b:c141:: with SMTP id z1mr15912912wmi.79.1600433290849;
        Fri, 18 Sep 2020 05:48:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b18sm5415123wrn.21.2020.09.18.05.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 05:48:10 -0700 (PDT)
Date:   Fri, 18 Sep 2020 14:48:08 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "David S . Miller" <davem@davemloft.net>, hch@lst.de,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] fbdev: stop using compat_alloc_user_space
Message-ID: <20200918124808.GD438822@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
        linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "David S . Miller" <davem@davemloft.net>, hch@lst.de,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200918100812.1447443-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918100812.1447443-1-arnd@arndb.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Sep 18, 2020 at 12:08:10PM +0200, Arnd Bergmann wrote:
> The fbdev code uses compat_alloc_user_space in a few of its
> compat_ioctl handlers, which tends to be a bit more complicated
> and error-prone than calling the underlying handlers directly,
> so I would like to remove it completely.
> 
> This modifies two such functions in fbdev, and removes another
> one that is completely unused.
> 
>     Arnd
> 
> Arnd Bergmann (3):
>   fbdev: simplify fb_getput_cmap()
>   fbdev: sbuslib: remove unused FBIOSCURSOR32 helper
>   fbdev: sbuslib: remove compat_alloc_user_space usage

Looks all good, but we're also kinda looking for a new volunteer for
handling fbdev patches ... drm-misc commit rights, still not interested?
-Daniel

> 
>  drivers/video/fbdev/core/fbmem.c |  44 +++++------
>  drivers/video/fbdev/sbuslib.c    | 124 ++++++++++++++++++-------------
>  2 files changed, 90 insertions(+), 78 deletions(-)
> 
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
