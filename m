Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDE266078F
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Jan 2023 21:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235947AbjAFUF0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 6 Jan 2023 15:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236067AbjAFUFY (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 6 Jan 2023 15:05:24 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C4583187
        for <linux-fbdev@vger.kernel.org>; Fri,  6 Jan 2023 12:05:19 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id w13so1018553wrk.9
        for <linux-fbdev@vger.kernel.org>; Fri, 06 Jan 2023 12:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpGU+cdVK3SM6jir+mxXdoP9uvBXRWWoe82Gg0a/TfQ=;
        b=IBLtyAaOl/9raVwH+lZtFBqYmzZLUwb1aTvMvHWtsrxUvXHKeNvPf2Z4sLb/8lhUnG
         teLv7dU1nWBtLW6oOpXSyzLijuYoaopWks5gay0v4IatiPbDlI38MBG3bXbzlW7qBSx7
         8HGbPC1w/AgS3fdCtr2ldQ84u/eiwSpKLgAkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpGU+cdVK3SM6jir+mxXdoP9uvBXRWWoe82Gg0a/TfQ=;
        b=Izu/zA+HHsgzP4ZtVOB7mkQF7lmj+gkSaNE6cGdcnl3bVaKGVRZx+LGz9CEr/wY9IX
         z2E9aY3jVJlee44qIOmpjX+dbfqEMLrucO5lYHM9ypcZZXohsYUtwMW6v1cSDWzCKiIh
         U0VykZJ+/e4kNlRb9MkLGKgZsCIApLLvxUNqU+yHnMKFji/oePhzJ3MNh1VPVZ5PuydL
         cRe8SjiYATBBK3n+ECss3RElqljoWb1NrMW9nV/fu3W8WWU3J4TcLZkPzHfgvVOAU38l
         uOf1xzoAf1ritZK4dHM0O3fEQWtkdSHZpZFaGzPWHuvmoR0Ik9YLRdDPxNjKWAWvMjSn
         BzVA==
X-Gm-Message-State: AFqh2koyFrI3LSzXz3Z9pGeXuW/6E7t+y6X5EjhacNkh6z42RQaS0TKZ
        T3K8p+49xskC8tF/FpuzzKav2A==
X-Google-Smtp-Source: AMrXdXuXq7d7eNb8lJL+TQA5OVZQLRgie1AhDXr6CE1qdxWO8mfj4eIhK2Jd7Cc+vw2oC4U09t3ckA==
X-Received: by 2002:adf:f007:0:b0:28e:66ae:75af with SMTP id j7-20020adff007000000b0028e66ae75afmr18337774wro.58.1673035518458;
        Fri, 06 Jan 2023 12:05:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d404a000000b00275970a85f4sm1928236wrp.74.2023.01.06.12.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 12:05:17 -0800 (PST)
Date:   Fri, 6 Jan 2023 21:05:15 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Hang Zhang <zh.nvgt@gmail.com>
Cc:     Helge Deller <deller@gmx.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] fbmem: prevent potential use-after-free issues with
 console_lock()
Message-ID: <Y7h++5sU/hGJ/yTS@phenom.ffwll.local>
Mail-Followup-To: Hang Zhang <zh.nvgt@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20221230063528.41037-1-zh.nvgt@gmail.com>
 <2711de96-fcbe-5611-657a-ab29becd2ff6@gmx.de>
 <CAKMK7uEOX5n64cjzMt9GRQaS13HFPFyOeqdrkmzc035U5_T8tg@mail.gmail.com>
 <CAKMK7uE7CAXO50JPQ6ziQGGehqfDK2UanBQbfLdUH2RwrwXUvw@mail.gmail.com>
 <CAO2zrtYDcOfvxpG6wPghPnWZVks+NL6N9VaynsBVoX7nHBcxuw@mail.gmail.com>
 <Y7hvhtHeivfsnBtE@phenom.ffwll.local>
 <CAO2zrtb9H=OWPbrgmqTxQnHqETt-P4K6AxiwdtN7guxUYL2NCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO2zrtb9H=OWPbrgmqTxQnHqETt-P4K6AxiwdtN7guxUYL2NCw@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Jan 06, 2023 at 02:58:27PM -0500, Hang Zhang wrote:
> On Fri, Jan 6, 2023 at 1:59 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jan 05, 2023 at 01:38:54PM -0500, Hang Zhang wrote:
> > > On Thu, Jan 5, 2023 at 5:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Thu, 5 Jan 2023 at 11:21, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > Hi Helge
> > > > >
> > > > > On Mon, 2 Jan 2023 at 16:28, Helge Deller <deller@gmx.de> wrote:
> > > > > >
> > > > > > On 12/30/22 07:35, Hang Zhang wrote:
> > > > > > > In do_fb_ioctl(), user specified "fb_info" can be freed in the callee
> > > > > > > fbcon_get_con2fb_map_ioctl() -> set_con2fb_map() ->
> > > > > > > con2fb_release_oldinfo(), this free operation is protected by
> > > > > > > console_lock() in fbcon_set_con2fb_map_ioctl(), it also results in
> > > > > > > the change of certain states such as "minfo->dead" in matroxfb_remove(),
> > > > > > > so that it can be checked to avoid use-after-free before the use sites
> > > > > > > (e.g., the check at the beginning of matroxfb_ioctl()). However,
> > > > > > > the problem is that the use site is not protected by the same locks
> > > > > > > as for the free operation, e.g., "default" case in do_fb_ioctl()
> > > > > > > can lead to "matroxfb_ioctl()" but it's not protected by console_lock(),
> > > > > > > which can invalidate the aforementioned state set and check in a
> > > > > > > concurrent setting.
> > > > > > >
> > > > > > > Prevent the potential use-after-free issues by protecting the "default"
> > > > > > > case in do_fb_ioctl() with console_lock(), similarly as for many other
> > > > > > > cases like "case FBIOBLANK" and "case FBIOPAN_DISPLAY".
> > > > > > >
> > > > > > > Signed-off-by: Hang Zhang <zh.nvgt@gmail.com>
> > > > > >
> > > > > > applied to fbdev git tree.
> > > > >
> > > > > The patch above makes no sense at all to me:
> > > > >
> > > > > - fb_info is protected by lock_fb_info and
> > > > > - the lifetime of fb_info is protected by the get/put functions
> > > > > - yes there's the interaction with con2fb, which is protected by
> > > > > console_lock, but the lifetime guarantees are ensured by the device
> > > > > removal
> > > > > - which means any stuff happening in matroxfb_remove is also not a
> > > > > concern here (unless matroxfb completely gets all the device lifetime
> > > > > stuff wrong, but it doesn't look like it's any worse than any of the
> > > > > other fbdev drivers that we haven't recently fixed up due to the
> > > > > takeover issues with firmware drivers
> > > >
> > > > I have also a really hard timing finding the con2fb map use in the
> > > > matroxfb ioctl code, but that just might be that I didn't look
> > > > carefully enough. Maybe that would shed some light on this.
> > > > -Daniel
> > > >
> > > >
> > > > >
> > > > > On the very clear downside this now means we take console_lock for the
> > > > > vblank ioctl (which is a device driver extension for reasons, despite
> > > > > that it's a standard fbdev ioctl), which is no good at all given how
> > > > > console_lock() is a really expensive lock.
> > > > >
> > > > > Unless I'm massively missing something, can you pls push the revert
> > > > > before this lands in Linus' tree?
> > > > >
> > > > > Thanks, Daniel
> > >
> > > Hi, Daniel. Thank you for your feedback. We're not developers of the
> > > video subsystem and thus may be short in domain knowledge (e.g., the
> > > performance of console_lock() and the complex lifetime management).
> > > This patch initially intended to bring up the potential use-after-free
> > > issues here to the community - we have performed a best-effort code
> > > review and cannot exclude the possibility based on our understanding.
> > >
> > > What we have observed is that the call chain leading to the free site
> > > (do_fb_ioctl()->fbcon_set_con2fb_map_ioctl()->set_con2fb_map()->
> > > con2fb_release_oldinfo()-> ... ->matroxfb_remove()) is only protected
> > > by console_lock() but not lock_fb_info(), while the potential use
> > > site (call chain starts from the default case in do_fb_ioctl()) is
> > > only protected by lock_fb_info() but not console_lock().
> > > We thus propose to add this extra console_lock() to the default case,
> > > which is inspired by the lock protection of many other existing
> > > switch-case terms in the same function.
> > >
> > > Since we do not have deep domain knowledge of this subsystem, we will
> > > rely on the developers to make a decision regarding the patch. Thank
> > > you again for your review and help!
> >
> > Can you please elaborate where you've found this use-after-free and how?
> > I'm still not understanding how you even got here - this is orthogonal to
> > whether the patch is the right fix or not.
> > -Daniel
> 
> Hi, Daniel. Sure. This issue was initially flagged by our experimental static
> code analyzer aiming to find use-after-free issues in the kernel - that's why
> we don't have PoC or execution traces here. We deeply understand that
> static analyzer can generate false alarms, so we have tried our best and
> spent a good amount of time carefully reviewing the related code. We
> eventually found that we could not exclude this potential issue based on our
> study, so we decided to report this to the community with this tentative fix. As
> mentioned, we may be short in domain knowledge, so your input is
> highly appreciated. We respect the developer's decision about whether
> this is really a problem and whether/how to fix it. However, if you think the
> use-after-free is actually not possible, it will be very helpful if you can
> elaborate on the reasoning since it will greatly help us improve our
> analyzer. Thank you very much for your help!

Please start out these patches with the fact that this is from an
experimental checker.

Also do include _why_ your checker things something is going wrong. If you
cannot follow why the checker complains about something, then don't report
it as an issue until you do. Also, if you do not understand the code,
please make it absolutely clear that you just guessed a possible fix, but
not that it's been tested in any way or form.

If you don't do this, then we end up wasting a ton of time of people who
don't have surplus time, because in this case the patch got review,
applied, pull request made, I realized it looks funny, patch dropped, pull
request remade, and then a fairly big thread here.

All for a bug that's likely in your checker and not in the kernel. This is
not great.
 
> BTW, if this is worthed a fix and the performance of console_lock() is a
> major concern, then I think there may be alternative solutions like adding
> a lock_fb_info() to the free call chain - if that's better in performance,
> or maybe selectively protect the matroxfb ioctl but not vblank ioctl as you
> mentioned.

Please start out with explaining what kind of bug your checker is seeing,
and why. Not how you're trying to fix it. Because I'm pretty sure there
isn't a bug, but since I've already spent a pile of time looking at this,
I want to make sure.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
