Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED1BC766E2
	for <lists+linux-fbdev@lfdr.de>; Fri, 26 Jul 2019 15:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfGZNF5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 26 Jul 2019 09:05:57 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35910 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfGZNF5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 26 Jul 2019 09:05:57 -0400
Received: by mail-wm1-f66.google.com with SMTP id g67so43531430wme.1
        for <linux-fbdev@vger.kernel.org>; Fri, 26 Jul 2019 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=LA2gZQHW+ogCEHAq4zNqZ9+u5bdgeGEW5eaDTfnaq2c=;
        b=cwXjbHe8R5GVASuJAOtuB91oQOebnWGJyVRTnZvPs8CsQKKRkabnnrm35zfFShy/Uk
         r3B2fm7CPEcU1jDvOibQIdg/jV744HdCz1ZTYwGb/8zRwlXueOBZJ1mKQsFHUIYTTdx4
         rkbUWixSZ12EmGn7Jl1GyEKrK9ZwkF+3Xa2dL7wtfw3Z46nQjaFBXqzXN5L9yD1q2wTe
         74vKi5VtquDxWEWMVvWRK0dzMESgjgofsADYuZzBcQzzq69KXWR/jzV4ztdLsz1Hl3UF
         3rdd0MXI1OyUNOJaf/eEF++Wt6zBMFgshQx2BDM8FvohjDtxGGjFS3uDxlCQQeFJGLqD
         r8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=LA2gZQHW+ogCEHAq4zNqZ9+u5bdgeGEW5eaDTfnaq2c=;
        b=U/hetRRPxnHGelySKG18kJZ/MtgOCW0Dy+GWEhbAtVG5hSizTQx8xf6Vmz43Vsa6na
         I35il1oIa6WvZoauwk1I9JhhxVw/FKRoAenTnqWPz+TBPMMv3YdTbJUYsxk1ozCr0UAv
         7iecBs5kLuLQvm0hq7CYqQEIxkwqfXPmr+Ytw9pHW8vvsepnrOQujzqY+sVoRws0zP1u
         pWjjP5kQQFB1a9fh59zAUUDu/bD9MLUtfWk0ScXSNpNDX+WY0QQgXDBUN2f5/SzQ6qFb
         7D5wWzfh+o/HbSIYFfYKqW3n2BZ6dsdgeUJIQsk2mwtm1Fy8oj6uM2VaZrL3j/8ZX+l8
         jyKQ==
X-Gm-Message-State: APjAAAWYb/rVarSrUoa+lRpoK5PmADCr7woV9/bFg5VNUWrZ/3I5C78z
        ayUf9gzpUthT2c4pxC3ti5vuDg==
X-Google-Smtp-Source: APXvYqys9RQ0RnGtSIgncuHAcCNn6PgPxDgjB5e01xzx01Hy+w1I6ozWB4sOYDep4YVQq+0KTfdkpQ==
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr56918505wmi.14.1564146355025;
        Fri, 26 Jul 2019 06:05:55 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id f70sm65027253wme.22.2019.07.26.06.05.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 06:05:54 -0700 (PDT)
Date:   Fri, 26 Jul 2019 14:05:52 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190726130552.6asmzwvx7dml262x@holly.lan>
References: <20190725143224.GB31803@ravnborg.org>
 <20190726095016.wsj7jnni5zdh37dl@holly.lan>
 <20190726112724.GB20065@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190726112724.GB20065@ravnborg.org>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Jul 26, 2019 at 01:27:25PM +0200, Sam Ravnborg wrote:
> Hi Daniel.
> 
> On Fri, Jul 26, 2019 at 10:50:16AM +0100, Daniel Thompson wrote:
> > On Thu, Jul 25, 2019 at 04:32:24PM +0200, Sam Ravnborg wrote:
> > > There was no users left - so drop the code to support EARLY_FB_BLANK.
> > 
> > Why are we using a different noun for the subject and description?
> I fat-fingered the description.
> Will fix when I apply - or send out a v2 if requested.

No need to me to see a v2 if that's the only change.


Daniel.


> 
> ...
> 
> > > 
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Lee Jones <lee.jones@linaro.org>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
> > > Cc: Peter Rosin <peda@axentia.se>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: linux-fbdev@vger.kernel.org
> > 
> > Other than the quibble about the description...
> > 
> > Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> Thanks,
> 
> 	Sam
