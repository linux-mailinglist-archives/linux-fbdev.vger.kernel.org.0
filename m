Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53941D7247
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 May 2020 09:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgERHwD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 18 May 2020 03:52:03 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:39653 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbgERHwD (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 18 May 2020 03:52:03 -0400
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mo73N-1jGagl2DIx-00pa1X for <linux-fbdev@vger.kernel.org>; Mon, 18 May
 2020 09:52:00 +0200
Received: by mail-qt1-f175.google.com with SMTP id d7so7300292qtn.11
        for <linux-fbdev@vger.kernel.org>; Mon, 18 May 2020 00:52:00 -0700 (PDT)
X-Gm-Message-State: AOAM5304ikxvY9Dh9BVXJEqlbuaefhYPiUwhF6g6rFDH72aLOgAwTQGm
        iJTXd+o2lL7Pru+6JtxbNuQ+dNBeFmrFPbDj+PI=
X-Google-Smtp-Source: ABdhPJwKJs2tBbsiAp5buhbH7+nBy1gs4sbXiUcXaaX+zO4MdYepKhG/rvRgDCtRmvNcpRswmcr9uvXa3JilwFHZalo=
X-Received: by 2002:ac8:6a09:: with SMTP id t9mr4240443qtr.7.1589788319394;
 Mon, 18 May 2020 00:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <202005181437.mPf3HD00%lkp@intel.com>
In-Reply-To: <202005181437.mPf3HD00%lkp@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 18 May 2020 09:51:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3JsqShYvB_0tc6j5QtrXRcgrgTtWnT8fbsO5x0tJZBsg@mail.gmail.com>
Message-ID: <CAK8P3a3JsqShYvB_0tc6j5QtrXRcgrgTtWnT8fbsO5x0tJZBsg@mail.gmail.com>
Subject: Re: [linux-next:master 6172/9662] drivers/video/fbdev/atmel_lcdfb.c:362:20:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
To:     kbuild test robot <lkp@intel.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, kbuild-all@lists.01.org,
        Mark Brown <broonie@kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ECCN8Hw9YjNygIogF42UG4Cb9+Hz2M2/Swil2NzVdbcTRgGDzdq
 YRQ92jB9GzGb5zloc4tFAJ0B3XXnZdaDvpssK9r/xiomq1r0mZ8SwyZDMpO4U0MinZVQfb4
 eJAncajteZPLv1tHzdiEtuuttVgzOwUwYCrjdJ35xOZxXGZsyz3TTlFclLafRva8Kn6BmYm
 iNZoR6nd/SvDe6/2DrUdQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8h/K2ttQlCY=:3yxPhPjyFoiMzDW4Ngl/H/
 Y2LbxEQYC2lEl2SdLKw8VZfvMhxesTKrM7CSzAVtmSBW6m4QX5kt5ew8GkLnvZXCfyXw9XBbP
 +yqo0rqbzuG2fwruY1QvUbH/E+M64yz4HEP3c+VtJrSJlxHXLlf+4JFOpQ30Xx5QlpgAnfREF
 o84DHYrLxzQ7KGuqDd33WbWFADCPX7SDeB9bpWx0jdEL7FJhaQxMa5wdUd+jf7jVXE8lUqANy
 IuRs7mOb2HNeSa1pCBCDgbz/+Ljaaj4l6mTq18rTFMIN/eQSYmibu+P+ThcLu2IkVLzAHVKvj
 3bbFgkkadJEE4EmFa8JOejhZLN/ELjq+Mu7t5FUJnI+rfr0wpsVzPnLoGEJnffj6bHnJLKc2p
 aFk8AoSu3OdYCuF6NpLqkITtJURU6z1UOvzj5UybuhIlrZ5eZ3+4uAdY1sytIIP/3E9kHFd0G
 BHiXzOB+KJtmBRnsMEyJDVY/FUN0h7k+u6cjHO26aNA5tBXIZXOdjxV4ABW23lw/wUmj/DMyk
 h6k25Y6XpMevBWlV5X1/ICwGxGShwiJWMtwbu4tNmC8e3PBQ2zjfXSsAjRwsqVJBkuCX9IwG5
 +Dkv1t3yXDMu5EN93FZ0AelV6UwMS1jgaHkfyUQRk7DHn3Tb/RyDWiupYAClW7jOKHXXH6v1v
 RH5B4nno88vOdGF2CqzvjZdG9KNt/8jE5h0ogItKJSdDjpWonpF8QecPWkJYW0z1rzyOLzkCz
 BJbccQ4a+neO7lsoZE51vtYUHHU2zWt1F9Yn97v/zndWXDsGvwgV7tDsqjeXo1bYaPH/b58Ax
 5JXC1ZlnT8YkIxx2IOZZg4vX7Lscjs/SNVrMs/FM7b6yXl0IR0=
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, May 18, 2020 at 8:56 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   bdecf38f228bcca73b31ada98b5b7ba1215eb9c9
> commit: bbd7ffdbef6888459f301c5889f3b14ada38b913 [6172/9662] clk: Allow the common clk framework to be selectable
> config: ia64-randconfig-s001-20200518 (attached as .config)
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-193-gb8fad4bc-dirty
>         git checkout bbd7ffdbef6888459f301c5889f3b14ada38b913
>         # save the attached .config to linux build tree
>         make C=1 ARCH=ia64 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
>
> sparse warnings: (new ones prefixed by >>)
>
>    drivers/video/fbdev/atmel_lcdfb.c:354:27: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected char [noderef] <asn:2> *screen_base @@    got n:2> *screen_base @@
>    drivers/video/fbdev/atmel_lcdfb.c:354:27: sparse:    expected char [noderef] <asn:2> *screen_base
>    drivers/video/fbdev/atmel_lcdfb.c:354:27: sparse:    got void *
> >> drivers/video/fbdev/atmel_lcdfb.c:362:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void * @@    got char [noderef] <asvoid * @@
> >> drivers/video/fbdev/atmel_lcdfb.c:362:20: sparse:    expected void *
>    drivers/video/fbdev/atmel_lcdfb.c:362:20: sparse:    got char [noderef] <asn:2> *screen_base
>    drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void *cpu_addr @@    got char [noderef] <asvoid *cpu_addr @@
>    drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse:    expected void *cpu_addr
>    drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse:    got char [noderef] <asn:2> *screen_base
>    drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void *cpu_addr @@    got char [noderef] <asvoid *cpu_addr @@
>    drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse:    expected void *cpu_addr
>    drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse:    got char [noderef] <asn:2> *screen_base

This is an old bug, valid but harmless. The same thing happens in a number
of fbdev drivers, but it may be hard to motivate someone to fix them all.

       Arnd
