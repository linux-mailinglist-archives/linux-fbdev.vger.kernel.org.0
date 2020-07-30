Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08988233107
	for <lists+linux-fbdev@lfdr.de>; Thu, 30 Jul 2020 13:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgG3LfR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 30 Jul 2020 07:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgG3LfR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 30 Jul 2020 07:35:17 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48805C061794
        for <linux-fbdev@vger.kernel.org>; Thu, 30 Jul 2020 04:35:17 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id v6so9045662ota.13
        for <linux-fbdev@vger.kernel.org>; Thu, 30 Jul 2020 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MRzokrMc0Qm9FKeka5mjSS3X3+tAOXypP+ce1X7MQBI=;
        b=iipVaGjfy4vwKxkDV4BAQroSsbhnoNOfVaRbNPsPbYc617UHV3vMKacI3QuoVFW4Ym
         NMEfZrR2B+sQF5rf1QYFMQhm71yOP2XE0ErB0cuM7dlMVGT/r/UTqlQt9ZlRjsV3FiHj
         KOP0wiur98KfxTYFxbJ78Ro9HO5aYJz9EPxPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MRzokrMc0Qm9FKeka5mjSS3X3+tAOXypP+ce1X7MQBI=;
        b=pHut19I0Ip6V0Tbgi3wEjuTkwqmeuC9G2oKY0xwAG4j6NcoCX0GOzitk0bkduyD5C5
         yOudYTUiFroZ6z9Qtx5EMCUly12IyC/sg6K0hHcKwzIoEnWl6QfJvusKLYXq5wvj8O/x
         T5qJl3mWBYmtqFMcFuyo6vpZ0q6zADZeAEsrRpZY/xWoKvbyg6LoCksqpEjRkYIQFCXv
         mheiej3uZqzuxxilsDBTG8hB3tK2nMVZK/bKxHO5hBEIOi2PB1szrck9pf7xuQ8tzQfe
         sME+Ig6aK9R27/hEDg7RxSX3qD7sYt6Joc35fwyIMm+7lySiiZqnqYdN8hSb32kOA+2g
         1vvQ==
X-Gm-Message-State: AOAM5304g6gSiUOsqTcSfbC0IZBUTfEeZfSdCjWMuG2QSGy75VBBj0D7
        rfa1yzxz+b30CoalNEAklfZutly1gs0iKgEdDZM0pA==
X-Google-Smtp-Source: ABdhPJyK3XjO3qAYxV/3DE11QmLPyeVuxGiJw5ED5uo8MdAzpo+p3AFXndZW5wHhjoS7i3OPw7tr1pOnjbzeng7wAi4=
X-Received: by 2002:a9d:6052:: with SMTP id v18mr1821579otj.303.1596108916621;
 Thu, 30 Jul 2020 04:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <1596000620-4075-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
 <CAKMK7uHeteS2+rKrZKrAM+zQO==hAX0XaVc9JfHPsdLTCtzKOw@mail.gmail.com>
 <a3bb6544-064d-54a1-1215-d92188cb4209@i-love.sakura.ne.jp>
 <CAKMK7uGTL02SHbEazu5YEnEncO6c-+P6DXt1GWSVQ28enqLx2g@mail.gmail.com> <d4c97785-467a-6e04-b8bb-c8aa4177882a@i-love.sakura.ne.jp>
In-Reply-To: <d4c97785-467a-6e04-b8bb-c8aa4177882a@i-love.sakura.ne.jp>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 30 Jul 2020 13:35:05 +0200
Message-ID: <CAKMK7uH_Y6eFuLZOvsDbzk2D0S5uREjM_kwAFkcK1k0z9qXSug@mail.gmail.com>
Subject: Re: [PATCH] fbmem: pull fbcon_update_vcs() out of fb_set_var()
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        syzbot <syzbot+c37a14770d51a085a520@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jul 30, 2020 at 1:27 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2020/07/30 20:16, Daniel Vetter wrote:
> > Patch looks good, except ... does this compile? fbcon_update_vcs is
> > defined in fbcon.h, and that doesn't seem to be included here ...
> > Maybe what we want is an fb_set_var_ioctl in fbmem.c so that the fbcon
> > interaction is a bit better hidden (but that's a bikeshed, feel free
> > to ignore). Also I have no idea what trickery you need to compile-test
> > ps3fb, that's why I'm asking :-)
>
> Right. I didn't prepare environment for compiling powerpc kernel.
> Kernel test robot found it and I already posted V2 patch as
> https://lkml.kernel.org/r/075b7e37-3278-cd7d-31ab-c5073cfa8e92@i-love.sakura.ne.jp .

Excellent. It's still stuck in a queue somewhere and hasn't reached my
inbox, I'll queue it up as soon as I have it.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
