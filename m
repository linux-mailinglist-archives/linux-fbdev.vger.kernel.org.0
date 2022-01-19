Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFDEF493BC5
	for <lists+linux-fbdev@lfdr.de>; Wed, 19 Jan 2022 15:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354942AbiASONf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 19 Jan 2022 09:13:35 -0500
Received: from mout.gmx.net ([212.227.17.20]:49055 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354938AbiASONf (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 19 Jan 2022 09:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1642601586;
        bh=eOc18aaHEx6ZoSIENFopEw1eN9p1iSLii2fUQ3lWeeU=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=P3tUlICosefkpyuy/v32cX2ZYnUZMtAeCTzWzhCgYCP9L/z5LZOV28fy1KjjkTtD3
         iFKsimxEwhUdJC2qgw8J43DdRrqFtgcmwOZPGMuBmnyThszbx9H5gIwGuFNGveki8C
         eGceRi1Lyvr02RQNCDo9MbLUCVvLosiaS9ewKaPA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.183.52]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5rU-1mx2XK08oK-00M2uF; Wed, 19
 Jan 2022 15:13:06 +0100
Message-ID: <9a8bb480-440b-9680-ffcc-822a27c76997@gmx.de>
Date:   Wed, 19 Jan 2022 15:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
Content-Language: en-US
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>, Claudio Suarez <cssk@net-c.es>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <Yef0j8+DBbwC7Kjv@kroah.com>
 <Yef15k2GtC40aJEu@kroah.com>
 <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
 <4d8950c7-5f51-ca2b-4c93-741c7805a214@gmx.de>
 <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+M05Sm+E8yY43C89jNYOO4dCvarZWkGiXrsWMAYiKW7JfX1xUxO
 17/rjWudGySTVp1fDHWn942aqrGA5KOwMofGxJlZr20W9LxRnT4RNWiw0XmqkOkmIxQDuO+
 MRAH1ofZyIaqXVA6FOMXhHcXPt/XTh6lJFKFJQuX4YzNVd87wvZSLLQIF8pw+6mVy7ABKJK
 awJblqjtQ1VdvrrMaH+Qw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6FVUdjiU8I4=:M6d77mTgbCbCiqfTT98sWa
 Ml2pa5qSFlXfwgQdwcM9qtJXZmOE/cfOclrZqYeQp0BHalG9i8cTCjFWDVW6dWANTjEY9q5hJ
 HiMa22meX5nyKF/CXBkbrwgZJRQ8/PWft1cybNyHCAKiby+xuonKNgPSpMEVjioY6bpX0eTXn
 qzyiCwr0QhgG/7XzDSljcRcOI0FTmSzIk45gMPhKmWdQSkk7tU/FM9ui4Ulqh7JScy0MSt88U
 JwqdJ9trnCOTVT/Dm03dO0VqRK5jkwOaWu0cN5w3CqJCGnV832eEMYJXENcqPPqjISJL2ot9R
 X4MEVkThZ7lNqPdRwabfEHeGTMZNwrY0axbOcOs53GpM33Ep/EFjPZ7b301N6UBuEQ540BYui
 vhnrjNa39nwjkdjokTOUSwnmgSwKeRC3ll2EsH0ac80QeM0y8ZFRA/fdcRqrfCoYAppoVmWut
 VmFHp8r/oX0PdKhp0h8dhi8x6850aCWpKGIv/XBajgDB50uUoBEndgM6EXpt5P5/daET88tXS
 pRQGutW3AXn3wsig3KiM3yJW4Ky3JquHMkODzum+735OlRp78rIa1KiUBvIaaSJrx6xFvyznC
 E8tjeUny9qLdXeDrf7p/+9MiYUmft2bnn1Wo3j13FiT0jQgU6wKLRgoFIe1fTtehN0idQO/fm
 59LE5AqC3Q9hK0RlG1fyWhHYJ+RNsf6YouGKDMLis0v/kCve/BT1dm0Fc5RfrSuROWc23hHdq
 kXtblSa7gi+XLi4779h1jpRA5ahyihL8Mrzf0+LY+KWPprw9xo8/yTvYLsx16o7xwuyKOQLP/
 j4sOrHWNIATsBPP0GKMDiEX418Sx2tS/p15SdloJoe3hvsRoL4HOoxtE/1y5xAiwt74ozi/Sz
 UjTJNE11b9/X/KY7uYd1bIl7JlNdjJ0SCZRGCU+2V+LsagzMdwjZuuEFdyvn2w6bM7gxpe575
 rB9BZo6gdvL4Fr30bfFI6dn1wusrldEaB3fTDZ5hx+OXChA8ptik1VdgGyz07Icpcs/h7jskw
 REW1PErIrUTK/ax4GiT2OPKHapJ5xbJYEIzW9rTFmaMmGFgp69/ct2fIukff1amOVxwj0YuDM
 Mdy5oORY7FJE34=
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 1/19/22 15:01, Linus Torvalds wrote:
> On Wed, Jan 19, 2022 at 2:29 PM Helge Deller <deller@gmx.de> wrote:
>>
>>>>
>>>> Ah, no, that was just the soft scrollback code I was thinking of, whi=
ch
>>
>> Right.
>> That was commit 973c096f6a85 and it was about vgacon, not fbcon.
>
> No, fbcon had some bug too, although I've paged out the details. See
> commit 50145474f6ef ("fbcon: remove soft scrollback code").

Yes, but those bugs didn't affected

> If I remember correctly (and it's entirely possible that I don't), the
> whole "softback_lines" logic had serious problems with resizing the
> console (or maybe changing the font size).

Right.
I'm not asking to revert any soft scrollback functions.

It's about if you allow to use the fbdev-drivers hardware acceleration
to move parts of the screen or if you are stuck to software memcpy() and
repainting instead.
None of the bug reports touched that part.

> There may have been some other bad interaction with
> foreground/background consoles too, I forget.

I think that is independend if you use hardware acceleration or not.

Helge
