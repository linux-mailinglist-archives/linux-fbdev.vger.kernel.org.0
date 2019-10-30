Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C977EE9751
	for <lists+linux-fbdev@lfdr.de>; Wed, 30 Oct 2019 08:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfJ3Hn0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 30 Oct 2019 03:43:26 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39871 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfJ3Hn0 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 30 Oct 2019 03:43:26 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andrea.righi@canonical.com>)
        id 1iPidX-0006NF-Dm
        for linux-fbdev@vger.kernel.org; Wed, 30 Oct 2019 07:43:23 +0000
Received: by mail-wr1-f69.google.com with SMTP id z9so893359wrq.11
        for <linux-fbdev@vger.kernel.org>; Wed, 30 Oct 2019 00:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r2kgY/Eb4NrL0J9edPQFC8rYWl1U1ZwS7+lel270Qps=;
        b=c/Rwjho4Wmc+ibQjqe7vSEQjtHQjA4WNmsv22vagn8tUvhh6afIG7JrDqq0+0MLpW4
         79NmQMtfg+Xq1jD5sC9elTQ5krPSFGd2iDxM0uFb/gAkPQXKU7wan07UiIylpl5ipxlm
         EDU707mN809Lt1V8TfGuI7VhaprEgrhNDq7Znbcl8oBWmMysgl01PZ3/g2YZ+Z7fBNU7
         qcMwynqgQtLptxdOtFdn6Aukghm3GuD0W1w7CPXQaFpRBzkAHDJ/BuvWzKoj7AtXLyrc
         XY6uIoNsykX86p1lC4/T3AyThmTW086QHjiroInsWQT/8a29aHwVYhml9TLKAeYjLkig
         ZXWA==
X-Gm-Message-State: APjAAAVFqr4pM0yG+Cmj0j7wti0ofkSTOtfbdVn3y53H//J+MeaIAwH3
        qZV0dPXCU8yJcF5+u9XZeCNAJTgx64McN4OH60dFPvltYitkFAQobvJXFKdce3s/GDkhfltaIst
        HiJo7iPhaRtZbq57llMHmf6SrQWXdPp+GZLr1wxle
X-Received: by 2002:adf:b219:: with SMTP id u25mr22414454wra.327.1572421403072;
        Wed, 30 Oct 2019 00:43:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLmwt311jFlTSkqSoJBn/UrU6mv9JWrlxZTNb9CaaMKdyQWyaslF1hIc5G7liA+tivNC4DKA==
X-Received: by 2002:adf:b219:: with SMTP id u25mr22414436wra.327.1572421402800;
        Wed, 30 Oct 2019 00:43:22 -0700 (PDT)
Received: from localhost ([91.217.168.176])
        by smtp.gmail.com with ESMTPSA id c8sm1149783wml.44.2019.10.30.00.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 00:43:22 -0700 (PDT)
Date:   Wed, 30 Oct 2019 08:43:21 +0100
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
Message-ID: <20191030074321.GD2656@xps-13>
References: <20191029182320.GA17569@mwanda>
 <87zhhjjryk.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zhhjjryk.fsf@x220.int.ebiederm.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Oct 29, 2019 at 02:02:11PM -0500, Eric W. Biederman wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > The "fix" struct has a 2 byte hole after ->ywrapstep and the
> > "fix = info->fix;" assignment doesn't necessarily clear it.  It depends
> > on the compiler.
> >
> > Fixes: 1f5e31d7e55a ("fbmem: don't call copy_from/to_user() with mutex held")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > I have 13 more similar places to patch...  I'm not totally sure I
> > understand all the issues involved.
> 
> What I have done in a similar situation with struct siginfo, is that
> where the structure first appears I have initialized it with memset,
> and then field by field.
> 
> Then when the structure is copied I copy the structure with memcpy.
> 
> That ensures all of the bytes in the original structure are initialized
> and that all of the bytes are copied.
> 
> The goal is to avoid memory that has values of the previous users of
> that memory region from leaking to userspace.  Which depending on who
> the previous user of that memory region is could tell userspace
> information about what the kernel is doing that it should not be allowed
> to find out.
> 
> I tried to trace through where "info" and thus presumably "info->fix" is
> coming from and only made it as far as  register_framebuffer.  Given
> that I suspect a local memset, and then a field by field copy right
> before copy_to_user might be a sound solution.  But ick.  That is a lot
> of fields to copy.

I know it might sound quite inefficient, but what about making struct
fb_fix_screeninfo __packed?

This doesn't solve other potential similar issues, but for this
particular case it could be a reasonable and simple fix.

-Andrea
