Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA8EF27860A
	for <lists+linux-fbdev@lfdr.de>; Fri, 25 Sep 2020 13:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbgIYLhU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 25 Sep 2020 07:37:20 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:39601 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbgIYLhU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 25 Sep 2020 07:37:20 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MvsMz-1kcL0R1AZj-00svBP; Fri, 25 Sep 2020 13:32:08 +0200
Received: by mail-qk1-f172.google.com with SMTP id c2so2351821qkf.10;
        Fri, 25 Sep 2020 04:32:08 -0700 (PDT)
X-Gm-Message-State: AOAM533pkys8b2Lid9uQbJAD7ezFyLenFz/rIQSCMtnGRxxwuH5OVGm8
        2mLnuN3RFo1KwyI6vK8F85vq2Kf6CZyn2SoydfM=
X-Google-Smtp-Source: ABdhPJx6ewrlWaRTSHIqlQrw+rKO7nXCIyzMa6HgJMLyR6GVXtL8m3RFlHN9L9HcuFDN5VDSQuUZf+KvXWM6om9D0g0=
X-Received: by 2002:ae9:c30d:: with SMTP id n13mr3632853qkg.138.1601033527016;
 Fri, 25 Sep 2020 04:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200918100812.1447443-1-arnd@arndb.de> <20200918124808.GD438822@phenom.ffwll.local>
 <20200924205436.GP1223313@ravnborg.org>
In-Reply-To: <20200924205436.GP1223313@ravnborg.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 25 Sep 2020 13:31:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1P=oY9XexnXjk6F_wcbm8OnZ=70rXPTRED+Z6LjU9_QA@mail.gmail.com>
Message-ID: <CAK8P3a1P=oY9XexnXjk6F_wcbm8OnZ=70rXPTRED+Z6LjU9_QA@mail.gmail.com>
Subject: Re: [PATCH 0/3] fbdev: stop using compat_alloc_user_space
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "David S . Miller" <davem@davemloft.net>,
        Christoph Hellwig <hch@lst.de>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:mK9JJ4zRKrsJacf1kWV+j/IVwr3I225w8Edv+3Fd/rdctE5BPxV
 AbKC7XWzjk9f7C3cU/8l7eJbEFxj+qzXlckOhoEwlRzhTTJjJ+VwCaZiBeKGlNFBkkBJj8S
 Ys4WgyASQQgloKycTDgLRjWCRkF+Zius+T+wueJh4jziCGMW6Y3xyL/TCGiMa4msiCKCdXp
 Na812kwFxphrNkKGxKADA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SqLL+E287oc=:mQ3a8qayJmzpVRzUcc7+vy
 Lgrei6R5Sex8Zt3wquxC/1iEfdJMWq5+i9Xrm8cYNw6m1OYgGX4qI+ACIxiB4z6b38AHHngKi
 26m0R6zr65glBKA210ii76XzK3L1zL8ZjUwF1KVWPHpO7suNnB19wqgb10hLU2Gz5RdpXCFNb
 yt0kgsWHKOKSAriNaVPccmrlzfO03KCwtovSHYWejHCuy1bFmDg+Mr03R1wk2XjZs+fBhhKzb
 Wst4NX78G5NAGGEQDedrX089KwmlVCU29sX8evj7d4GL8nXcdgyx6KaKKFnhg7Rj7GbZa9ZUt
 wMPeH32EgsH4bGxfJKBQJwvW2RgKT2JW5u6YAfiDvTZCz33Upd57u18hn7Wm2wGTFCstcCwlU
 HiPH0+Bx/4IE8shpd6mz1YpZfGSSgA2Vx/wzytxyfuTlr04O28n8zw8jK3mAfy1POMGoajvVY
 CXwoyoevYSwmOYpVZcYswluioo2VRJheAnsdh2VvDdtKKbSM6B6oe9PsfMcP0vmZaIspMqHET
 Fqeavx8kWiSHnJndduEpIezH0oXoiVEXUDJnQuthWOpz/LaPnRfmDnnoxmQ5MEQAZgqOBRRMN
 /DKMyexfW1i/bDBh8MAbsra1z6FXdN602O2lKxrJPHWbg287oATpdkPwyt6ZUmbGDXbg/ENcZ
 87H8cxQY2ku4R10u21j3djKA9ZCdToWpmsIgvJmOL6xX9VUN+BiUPoXUjIg1X8HTPhtTlIZbM
 NS/7QC7z+Z9DVxDo7G8pgsPakw+d9cQEQA6xNPQXSjZFwKWBR68csoKyCy44jaWytwuXVxIOo
 +/HXDdHOmtIjbBNZeygsFLfH5DHUruPanYkZ1LMVwH8r7cTP1EFxIxFJDJjG70EnUDIeLn6PG
 Lqnt9bZuCzNdfo2E7StDUk88jo8g+kspP8ZVe+O04dkiSPu/TKB05XAxB08A4ch8sBVt625yv
 6TxQ0jjemZ8PT5ZL5jIT6IvMj8RWI+SdvEZMUtS0aOdf2FGIoZYbW
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Sep 24, 2020 at 10:54 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel/Arnd.
>
> On Fri, Sep 18, 2020 at 02:48:08PM +0200, Daniel Vetter wrote:
> > On Fri, Sep 18, 2020 at 12:08:10PM +0200, Arnd Bergmann wrote:
> > > The fbdev code uses compat_alloc_user_space in a few of its
> > > compat_ioctl handlers, which tends to be a bit more complicated
> > > and error-prone than calling the underlying handlers directly,
> > > so I would like to remove it completely.
> > >
> > > This modifies two such functions in fbdev, and removes another
> > > one that is completely unused.
> > >
> > >     Arnd
> > >
> > > Arnd Bergmann (3):
> > >   fbdev: simplify fb_getput_cmap()
> > >   fbdev: sbuslib: remove unused FBIOSCURSOR32 helper
> > >   fbdev: sbuslib: remove compat_alloc_user_space usage
> >
> > Looks all good, but we're also kinda looking for a new volunteer for
> > handling fbdev patches ... drm-misc commit rights, still not interested?
>
> Hi Daniel - I read the above as an a-b. And Arnd did not take the bait
> it seems.

Ah right, I meant to reply but then forgot about it.

I don't really want commit access, thanks for the offer.

> Hi Arnd. checkpatch complained about some whitespace, which I fixed
> while applying.
> Will push to drm-misc-next tomorrow unless I hear anything else.

Great, thanks!

        Arnd
