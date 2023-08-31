Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A7078F4D6
	for <lists+linux-fbdev@lfdr.de>; Thu, 31 Aug 2023 23:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235188AbjHaVuH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 31 Aug 2023 17:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjHaVuG (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 31 Aug 2023 17:50:06 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2206B8;
        Thu, 31 Aug 2023 14:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1693518591; x=1694123391; i=deller@gmx.de;
 bh=dHQ00SqXGjQWO/ja+90NM5kWGwHlfKyu1HVb1L8m0Us=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
 b=Ta4upUyKtfzIdj02ERZYPYqF+//dxSTjsio6Qf6IPKWL0gFAwQ4/qWe9CEQLQXrseRP/9kE
 RMJP9TAN/ru2uvij8+dLQ3ieczRpUKIG2IsNCyyTH+uhZIpZ+0AMcscrEc6LRxhx3dHVmSrCw
 o0EBr7auoWuVVTtvGJXgDqmmUcHHuBhIN/BEojTJmIRyVajVbnmh61LSH+8Jagol6qMpRFKcY
 Hju8v7bqjKHFuMF2TVwNWq8JcugX5uuO3Wo80+yZbU0gniEA1cm2CcIA9CCWAz2l5Rj2sYINo
 KLYkAGrzl2vQAKCVE2SziGqynw/id89GT0kB0QeQSz7mA2pP9DeQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.146.94]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1My32L-1pkQTJ3rLD-00zZBp; Thu, 31
 Aug 2023 23:49:51 +0200
Message-ID: <b8a04a40-a8ad-16ef-fdde-e56acb6845ca@gmx.de>
Date:   Thu, 31 Aug 2023 23:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] fbdev: Update fbdev source file paths
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-fbdev@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jingoo Han <jg1.han@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230829200253.1473891-1-j.neuschaefer@gmx.net>
 <d9a02d20-8b59-cbdd-d054-eac14f9771d2@suse.de> <ZPA26xdbTRdfuveS@probook>
 <ZPBUdJwZzvYYrNei@phenom.ffwll.local>
 <d0646771-d426-45c6-e189-517b1e6e6248@gmx.de>
In-Reply-To: <d0646771-d426-45c6-e189-517b1e6e6248@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tPVyoPuKi1wtmYUTmJVzZjxMSunSNjmo8BxekKvNNbiikt6CCm8
 JDTsgzQwWjziJBsn3FpZZ+0gSD9xaM24wHOsgropdIzJOukr3RWF59GYy96kcTPh4i7NJRu
 lo+7U4CNpCAcrrlMnogwKqqPN9q0YwSzKUVBcTdVRN/xt5GX9WTFsgIj5Wd9I7qjmIv7B0f
 K8BrA9jPEnxwEZnxJInEA==
UI-OutboundReport: notjunk:1;M01:P0:gX0PcbqLMbg=;7gOpvRGmNzJz0scA13XvRUGcN3q
 TuAcJ32xPnp4JbQ6HjW0CCQwnU0Qb0B/z99afCffEx2kONFQJEmZwoyanWZ+NVhXhDAL3x0va
 ahCWgC8NWyVGaDAy5QbJ9eYSQtShWxHNWlP7AK5D/K+4cD6OeTrIRMWbqnJ4prIatpCzp5Nd+
 7GYpsyPplv19KbmPm9uttmhwRr2peXdQRfZLA+IVWz/meDa3GE7+z1pNPYmJ7vXRI7zBTMylM
 2puO3fA1EWGVduekQm+4Muikot2H+pucTQHi9wr2SNbuIlcOCyVxRt/qJi4HEzvwKrUmgmrEN
 enegKRx/reA8PM9X8qmUo6Si6yLUOyFUHO6NPVRBxIHdicIWCjM/z3eYRgspV1uQaTh/XM2ki
 dV6/gnEscSGBL6twUdXddqtOUeCKAO5F6S+sbXGdQ2oFpYdf1eNgxj1sBOjByuFGzPZ9EegHN
 YVamI8N7pRTD9u+8wUoffQjBIDAtLpHMIeA5F+NaHRoJ83VPZLtFzKe09TIu7KDZNtJu02D4/
 SOnzOFN06586klUw9G7vdPwDGxrChk3jZ0Cg+KDM1fAKpRAklTgMLvUjqiKaYeYEFW+JsPf8d
 fVB4qjLtHfQshg6HSpW0IVF8kDqGtRn3tcETFf4cCUMdk31v6JW5tkUujf/ZTGCfDlOszo32H
 6Ffg1W/qOGW72bFk84+3tr781a3Qq4xpAUSE509qH8l+HEWiWLr+Y7Y3ru0JFWw5Kv6rlEvZr
 bG9GcgIkZ1I3XbyKVyjUI04V4Crdfwcp+4LJ2QTyVRMWcVaoXVdP2skHeGf1ldyuC5IcciSk6
 AmfqZcJ+SK8gY6VHhhBLALR1z3rminT2b4jl5SR/TTcKDqAswMsoYo7YsYZxCoLNBg9hpgU0K
 Vm26XIhT2Zw+hMMovt3W1RYEkboMjeTj9HKiq88ye6ijtVHX/AY7SzE4QvPWPI+9EiZdvXXVZ
 r5vblGYbzz3XRP/3L4T3UErCOE0=
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 8/31/23 11:02, Helge Deller wrote:
> On 8/31/23 10:51, Daniel Vetter wrote:
>> On Thu, Aug 31, 2023 at 08:44:59AM +0200, Jonathan Neusch=C3=A4fer wrot=
e:
>>> On Wed, Aug 30, 2023 at 09:10:26AM +0200, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 29.08.23 um 22:02 schrieb Jonathan Neusch=C3=A4fer:
>>>>> The files fbmem.c, fb_defio.c, fbsysfs.c, fbmon.c, modedb.c, and
>>>>> fbcmap.c were moved to drivers/video/fbdev, and subsequently to
>>>>> drivers/video/fbdev/core, in the commits listed below.
>>>>>
>>>>> Reported by kalekale in #kernel (Libera IRC).
>>>>>
>>>>> Fixes: f7018c213502 ("video: move fbdev to drivers/video/fbdev")
>>>>> Fixes: 19757fc8432a ("fbdev: move fbdev core files to separate direc=
tory")
>>>>> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>>>>
>>>> IMHO these comments might just be removed.
>>>
>>> I think it's nice to have some sort of visual separation between group=
s
>>> of functions in fb.h, which these comments provide at the moment.
>>> Therefore I'm currently leaning towards my patch as it is, but I'm
>>> willing to have my mind changed and do a v2 which just removes the
>>> comments.
>>
>> Just the filename without the full path maybe?
>
> Yes, I'd prefer that as well.

I've manually changed it and applied the patch to the fbdev git tree.

Thanks!
Helge

