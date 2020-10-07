Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487F8285DE9
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Oct 2020 13:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgJGLM2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 7 Oct 2020 07:12:28 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:36875 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbgJGLM2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 7 Oct 2020 07:12:28 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MFL4B-1kAQtf0kIb-00FgTQ; Wed, 07 Oct 2020 13:07:22 +0200
Received: by mail-qk1-f172.google.com with SMTP id s4so2154757qkf.7;
        Wed, 07 Oct 2020 04:07:21 -0700 (PDT)
X-Gm-Message-State: AOAM530I3FnQRJpTJ6aSFHpdwsFvISnTtTOhARmj5ZJjbGs66pJZslPe
        nSDZdeFQBdpCOaEo/97epcqxJXfZlY6eS6U/aDc=
X-Google-Smtp-Source: ABdhPJzv49GK72G1X8a28drCtbBnhsqm87k5a2dAC3nqOLHjuohsHhfE83fzukBmdWOct5Xcuk6frrtwL5rFwz31X4E=
X-Received: by 2002:a37:b686:: with SMTP id g128mr2180775qkf.286.1602068840973;
 Wed, 07 Oct 2020 04:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-2-hch@lst.de>
 <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com>
 <20201007085911.GA17356@lst.de> <CAK8P3a2w1Q4coFLnW4sDQEC_01uwWWUkuGyqj=r=x3jtB8uhNA@mail.gmail.com>
 <20201007104046.GB24327@lst.de>
In-Reply-To: <20201007104046.GB24327@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Oct 2020 13:07:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1JdeCxr16+wAnYqLwJBuLqTgS7h-UCoiXD5OijQ-evyg@mail.gmail.com>
Message-ID: <CAK8P3a1JdeCxr16+wAnYqLwJBuLqTgS7h-UCoiXD5OijQ-evyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] fbdev/sbuslib: remove FBIOSCURSOR/FBIOGCURSOR leftovers
To:     Christoph Hellwig <hch@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rOrBrvb30/YQ2GkeltCxczg6eoQx6rFDvU0z0VK1h7cVATtQU0U
 8llwJPUcfTNW7kNgh0oB83woSlVqRrMIcLAJ51m44fVfo1ALnF7ndJYrvZ/nnfHhI6jVFS5
 KVORfDi2iourk0tpszdmypLf6oUavWS/exH9R07K3T0gaaqkNh0vvrRMQtk5KzkbjmE9FY8
 nUQeOHGm5JDY4LmgqZDkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ViNGxr4Dv1Q=:s+s+nBfA+CCj9OjJU4z4Hw
 0LXEvNmftnGZBYgcUU6yTYBLuBfBTBXOYSy+9gkHb0lnCLjycWKlbKxd2mVPNMoMqVERywdkh
 P2eAJXNZwyc8FuXFnWlBvF6QJmlEVqdVMcdAJfwQwlfwXssyeQfuHXqziVS5CNTZXKLzwW6tZ
 mkJNdlyRFlx75SUguvP+X/Gck2GHp/sFFmC44GMxDnLRvAxDfbylByJSlYbtYGr0fi5pKoTvB
 +UEJ3ow1PukpwirxozZUAkh3c5a5+yWq76TCdShSLtfVpEGSY6xUnOXYOopvk40g0lGBJBd+v
 JWbR6lznpBNvwdppbhb0t4URmkd14+cHgJurjVZqlAXsecyTHOosOondYec8NmXjuIgBTiX2k
 d7lMO0q2/U2fkFI3s8p5IGu8U5VwTI7VPcAA4KpYS6b5L0GH0To105AudYGAVI0FW5NA5AKOy
 YeFYsuy3ULYUCgr1Ok3lXe7hlvG7GFyga8USEWKqFw9weudqvsuO+05XdEq1bsY4tv6IF50ws
 EcPvo4LkXwl/ZEf9YHptkSBKT57jsM7uuKO+RxnUsv1OHoZD/Z0mqP+5f8wpSkAERrt36jrHN
 gBvQSUkEiO9k9KhEpbdxgwKbrzczN9oAogk6dIe1IcWWZjmJOA0TDzWx90z5OAmv8QrAFP5Ml
 b8I49sMprCG899UsG0A/9Ptwpk9XGqAM5MD4FsWu4pEH2KaHwkcqtQhrESO6tEWC66g2iQgKP
 e20A8p8ycpY5sb0Z20h2WRlBG0bdRGlrnaNhuknjyvMnysOEMp+F4tRw/JIsZeWXy7HnT+3xl
 1j/IcxYSC82FQwr4VtxzG2MFfX0j19X2znmjVKrX555ksbyeO76/cIppTz7KBkMUUs0hyJA
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Oct 7, 2020 at 12:40 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Oct 07, 2020 at 11:28:58AM +0200, Arnd Bergmann wrote:
> > The only one I have actually given up on is the atomisp staging driver,
> > which uses an awful hack, copying the x86 implementation of
> > copy_in_user()/compat_alloc_user_space() into the driver.
>
> That is gross.  Just mark the driver as broken for now.

Ah, it seems that Hans has already done that in commit 57e6b6f2303e
("media: atomisp_fops.c: disable atomisp_compat_ioctl32"), which
removes the only reference to this code. In this case, I think a one-line
change to stop building that file would be best, then if anyone ever
wants to fix the bug that Hans and Sakari found, they get to do also
deal with replacing compat_alloc_user_space().

I'll send a patch for that right away, the patch I have in my tree was
so evil that I hadn't dared submit that, but it was useful for
compile-testing the compat_alloc_user_space() removal patch.

   Arnd
