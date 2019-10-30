Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0FD0EA497
	for <lists+linux-fbdev@lfdr.de>; Wed, 30 Oct 2019 21:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfJ3UMF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 30 Oct 2019 16:12:05 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58892 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbfJ3UMF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 30 Oct 2019 16:12:05 -0400
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andrea.righi@canonical.com>)
        id 1iPuK3-00049O-V5
        for linux-fbdev@vger.kernel.org; Wed, 30 Oct 2019 20:12:03 +0000
Received: by mail-wr1-f72.google.com with SMTP id 7so1979970wrl.2
        for <linux-fbdev@vger.kernel.org>; Wed, 30 Oct 2019 13:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AVK3dTX5VeGMLnBzR7G4n82XaLQo9FRcTOWzPDhXKnM=;
        b=KNtf5JigpSBEyMho5NZNL/NKOgFbz5RVmUPtTo32Zf4OtRE9pNMP6BY7oG11aPjnB2
         jbB8QJcw9vvC1/Uh5JIQR9vTh2dq5npXxad9pSV+GFfWco7FVU70oNnTQR9V+SC9DWwJ
         MOsIJA4Z8Z00qkxxmjUIqhcm2ibZI2VW2dGeDlw7T8YTA0eiqd0/0yt35DG/Iy/M2KiZ
         /3AIt2Ve9HF15Sk39wnPexedUPgeQLYPf1adB3k07/9h9WnwjlyX42HVGAj64LI7u+Rn
         Zq9KE+ESWHvUGIsIbJ7v0nOUMSNJnef1Ua7XtmgJfvwlkuWfkqQvPIfGSl6JLoUc8VPn
         KwDA==
X-Gm-Message-State: APjAAAWWCeFGpVYocmAOtFTJ1A5c9SnQdL5cdd/FEO7QK/kEcRtE/BJ9
        4AZbwajgphsKajfNisPOgob4Ls0SjKx3J5UK9RVh6QKf0lCwfBi0AQf5GAGVDig542RtRcj2u5u
        cFYDKIrAqIlreltZiKOKw8Y2vNa8f6TU9IZ+AH8rI
X-Received: by 2002:a5d:678e:: with SMTP id v14mr1517136wru.393.1572466323596;
        Wed, 30 Oct 2019 13:12:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxlH3NbfJNwZ+iH3vOzPj9s1eHdaXQjgrBiVlMVrAzQAGIq2J05NZ48ryoa5j1osqZbWvhIHw==
X-Received: by 2002:a5d:678e:: with SMTP id v14mr1517106wru.393.1572466323277;
        Wed, 30 Oct 2019 13:12:03 -0700 (PDT)
Received: from localhost ([178.18.58.186])
        by smtp.gmail.com with ESMTPSA id j22sm1733453wrd.41.2019.10.30.13.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 13:12:02 -0700 (PDT)
Date:   Wed, 30 Oct 2019 21:12:01 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Peter Rosin <peda@axentia.se>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        security@kernel.org, Kees Cook <keescook@chromium.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>
Subject: Re: [PATCH] fbdev: potential information leak in do_fb_ioctl()
Message-ID: <20191030201201.GA3209@xps-13>
References: <20191029182320.GA17569@mwanda>
 <87zhhjjryk.fsf@x220.int.ebiederm.org>
 <20191030074321.GD2656@xps-13>
 <87r22ujaqq.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r22ujaqq.fsf@x220.int.ebiederm.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Oct 30, 2019 at 02:26:21PM -0500, Eric W. Biederman wrote:
> Andrea Righi <andrea.righi@canonical.com> writes:
> 
> > On Tue, Oct 29, 2019 at 02:02:11PM -0500, Eric W. Biederman wrote:
> >> Dan Carpenter <dan.carpenter@oracle.com> writes:
> >> 
> >> > The "fix" struct has a 2 byte hole after ->ywrapstep and the
> >> > "fix = info->fix;" assignment doesn't necessarily clear it.  It depends
> >> > on the compiler.
> >> >
> >> > Fixes: 1f5e31d7e55a ("fbmem: don't call copy_from/to_user() with mutex held")
> >> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >> > ---
> >> > I have 13 more similar places to patch...  I'm not totally sure I
> >> > understand all the issues involved.
> >> 
> >> What I have done in a similar situation with struct siginfo, is that
> >> where the structure first appears I have initialized it with memset,
> >> and then field by field.
> >> 
> >> Then when the structure is copied I copy the structure with memcpy.
> >> 
> >> That ensures all of the bytes in the original structure are initialized
> >> and that all of the bytes are copied.
> >> 
> >> The goal is to avoid memory that has values of the previous users of
> >> that memory region from leaking to userspace.  Which depending on who
> >> the previous user of that memory region is could tell userspace
> >> information about what the kernel is doing that it should not be allowed
> >> to find out.
> >> 
> >> I tried to trace through where "info" and thus presumably "info->fix" is
> >> coming from and only made it as far as  register_framebuffer.  Given
> >> that I suspect a local memset, and then a field by field copy right
> >> before copy_to_user might be a sound solution.  But ick.  That is a lot
> >> of fields to copy.
> >
> > I know it might sound quite inefficient, but what about making struct
> > fb_fix_screeninfo __packed?
> >
> > This doesn't solve other potential similar issues, but for this
> > particular case it could be a reasonable and simple fix.
> 
> It is part of the user space ABI.  As such you can't move the fields.
> 
> Eric

Oh, that's right! Then memset() + memcpy() is probably the best option,
since copying all those fields one by one looks quite ugly to me...

-Andrea
