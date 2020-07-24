Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435E422C0A9
	for <lists+linux-fbdev@lfdr.de>; Fri, 24 Jul 2020 10:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgGXI3E (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 24 Jul 2020 04:29:04 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37085 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgGXI3C (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 24 Jul 2020 04:29:02 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200724082900euoutp0253ec0c39f08cffc0a394c24e1c87c9cc~kovTVssMs0343703437euoutp02_
        for <linux-fbdev@vger.kernel.org>; Fri, 24 Jul 2020 08:29:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200724082900euoutp0253ec0c39f08cffc0a394c24e1c87c9cc~kovTVssMs0343703437euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1595579340;
        bh=8saHxxyOllLvB5Pj5gQEyB5HP1Jv7zofel2hqV57D+E=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=XblIwh0O/26kyKyFJAS8Gtmh2PTwkw5DLpIUfH60vrDf7Z9oeYjkEYCew0qO1eTY1
         faCpTaS7UPXBLZXWtHHmhyCMY3t7y43WMQ2XVmj+4kNOzQgvsMVvYyHb758Zqi6KAq
         gJaH6XaQcSojFNbjnhwV92fKZCcOkoDJdu/O1RH8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200724082859eucas1p183670e38979a06881f88bcdf15331454~kovS4Ds7s1538415384eucas1p1E;
        Fri, 24 Jul 2020 08:28:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id AC.8D.06318.BCB9A1F5; Fri, 24
        Jul 2020 09:28:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200724082859eucas1p1f7a8733834d78c409fa68c056256642d~kovSeKZ4i2610726107eucas1p1s;
        Fri, 24 Jul 2020 08:28:59 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200724082859eusmtrp2ea08706e5049ab6d8252e4deabd20d15~kovSddl2Z3074730747eusmtrp2h;
        Fri, 24 Jul 2020 08:28:59 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-ef-5f1a9bcb50e8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 9E.19.06314.BCB9A1F5; Fri, 24
        Jul 2020 09:28:59 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200724082858eusmtip2fb720823973bd45154401c4223222212~kovR9Qljd2769327693eusmtip2I;
        Fri, 24 Jul 2020 08:28:58 +0000 (GMT)
Subject: Re: [PATCH v2] fbdev: Detect integer underflow at
 "struct fbcon_ops"->clear_margins.
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        George Kennedy <george.kennedy@oracle.com>,
        Jiri Slaby <jslaby@suse.com>,
        Dmitry Vyukov <dvyukov@google.com>
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <f9249933-f63f-e0ea-d232-d5a0ddbcc7e1@samsung.com>
Date:   Fri, 24 Jul 2020 10:28:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200723142111.GA2377086@kroah.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUYRSG+3YuO1pb05p4srJYVMho0zQcUqSiH+OPLPshEZiuOajorrLj
        eolIMzMxqVWD8oZimbblNVvdhS5q6Kqo4FqIGOWlSENNzUTxkuMo+e8573nf75wDH4XJrYQj
        FaWJ57QaVYyCtMWNbYs9x7sKHUPc7/7wYn6tPsaZNWMOxvTPT5OMfjhDyswtV0mZO09rSOZR
        7W8JY3nwm2Cs5iKSKUyfIpjy4gn8zE727d9SnC2t17GmKoOEfV/8Ssp+vd8uYWe+D+JsTcMn
        nM2fdGXn6p0u2Vy19Q3nYqISOO0Jv1DbyMquIiKuc3+SOXtNmorS7LOQDQW0F6TWLRJZyJaS
        05UI9M13kVj8QVBYNYKJxRyC8axuyVZkOb2NFBsVCKzZ05v5SQQfM2qkgsuODgHLlyZS4H10
        EJibu6WCCaPfYfDE0kIIDZI+DTn3DEhgGe0HuR+suMA47QLZaZaNh+zpKzD7rZUQPXuhI39s
        w2NDe8CaMW9Dx2gHGBwrkYh8GBonizb2BnpGCkN3hglx7/Ow0JtDimwHE+0NUpEPwppJCAuB
        agQrmT83040IKvJWNxM+MNSztM7U+oijUGM+IcpnoXe8mRBkoHfDwORecYndkGt8jImyDDIz
        5KLbFWqf15JbY7NMLzA9UhRsO61g2zkF284p+D+3FOEG5MDpeHUEx3tquEQlr1LzOk2E8nqs
        uh6tf7Wu1fb5JvRuOawF0RRS7JLBrf0hckKVwCerWxBQmGKf7Fx31zW5LFyVfIPTxoZodTEc
        34IOULjCQeZZNh4spyNU8Vw0x8Vx2q2uhLJxTEUpM7KRHU3dzidbE00doc6dgdPeSZXBemvd
        Q3vWEP7GJ6Va6ealHdWMKiRTFyyaY0nlvhedVr71Hfr82p+ny4yzZHvgqT3Phgb0rgtKcxQJ
        QaFPzAEzuEtsebR73800/0Flf29HAJwaM/iOcNnOXh4v1WG3L/eYljy9S3QORxQ4H6nycMO0
        vOofRlkey2YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xe7qnZ0vFG6w7KWPx+t90Fov/2yYy
        W1z5+p7NYsLDNnaLz3/Wsls0L17PZjFlwwcmixN9H1gtLu+aw2Yxu+Udq8XSua9YHLg99n5b
        wOKxYFOpx861q5g89s9dw+5xv/s4k8fHp7dYPNZvucriMfOtmsfnTXIBnFF6NkX5pSWpChn5
        xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GStOz2EtOCVZsavnP3sD
        Y5NoFyMnh4SAicSflmNsXYxcHEICSxkl9s3pZe5i5ABKyEgcX18GUSMs8edaF1TNa0aJ0x82
        MoEkhAXiJW7+WgZmiwiESexuXccOUsQssI9ZYv61V0wQHZNZJXoXNLCCVLEJWElMbF/FCGLz
        CthJTDpwmQXEZhFQlehpOsEOYosKREgc3jELqkZQ4uTMJ2A1nAKGEv+3TQabwyygLvFn3iVm
        CFtc4taT+UwQtrzE9rdzmCcwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqX
        rpecn7uJERjD24793LyD8dLG4EOMAhyMSjy8EnWS8UKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1J
        rKxKLcqPLyrNSS0+xGgK9NxEZinR5HxgeskriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliS
        mp2aWpBaBNPHxMEp1cAoEZgRxX/ow5sZ4pFz1854GnP5bafEh5+tR9JiC/J2yP24yvdp4Y/k
        9CZe/lUXbi50vM9cvt407ZvV4o29k1zmCB3cXWWy7LShpUnqkfcvAjaePjJz7p4r1tuSOQxf
        2quoq3qenr16rt3R+YX2yo0bN73fm/WaSentsol9Sw/MKHz1/8uOmgwFPSWW4oxEQy3mouJE
        ALgVfhf3AgAA
X-CMS-MailID: 20200724082859eucas1p1f7a8733834d78c409fa68c056256642d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200723142112eucas1p10a3704ee99314f54eed0c6cb2e13245c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200723142112eucas1p10a3704ee99314f54eed0c6cb2e13245c
References: <20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp>
        <20200715094836.GD2571@kadam>
        <9e6eac10-c5c3-f518-36cc-9ea32fb5d7fe@i-love.sakura.ne.jp>
        <b50f85c7-80e5-89c5-0aca-31d8e9892665@i-love.sakura.ne.jp>
        <20200715151220.GE2571@kadam>
        <adfa8720-c411-dfe6-6b0f-7591dd95396c@i-love.sakura.ne.jp>
        <20200716100006.GN3278063@phenom.ffwll.local>
        <b202b74b-6a7b-e2be-2350-72144331303b@i-love.sakura.ne.jp>
        <20200721160836.GA2109047@kroah.com>
        <CAKMK7uGtDQKkSJhvr4YrGOmcbfVyTeEvSD-QSoHhUtH8=D856w@mail.gmail.com>
        <CGME20200723142112eucas1p10a3704ee99314f54eed0c6cb2e13245c@eucas1p1.samsung.com>
        <20200723142111.GA2377086@kroah.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 7/23/20 4:21 PM, Greg Kroah-Hartman wrote:
> On Wed, Jul 22, 2020 at 10:07:06AM +0200, Daniel Vetter wrote:
>> On Tue, Jul 21, 2020 at 6:08 PM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>>
>>> On Thu, Jul 16, 2020 at 08:27:21PM +0900, Tetsuo Handa wrote:
>>>> On 2020/07/16 19:00, Daniel Vetter wrote:
>>>>> On Thu, Jul 16, 2020 at 12:29:00AM +0900, Tetsuo Handa wrote:
>>>>>> On 2020/07/16 0:12, Dan Carpenter wrote:
>>>>>>> I've complained about integer overflows in fbdev for a long time...
>>>>>>>
>>>>>>> What I'd like to see is something like the following maybe.  I don't
>>>>>>> know how to get the vc_data in fbmem.c so it doesn't include your checks
>>>>>>> for negative.
>>>>>>
>>>>>> Yes. Like I said "Thus, I consider that we need more sanity/constraints checks." at
>>>>>> https://lore.kernel.org/lkml/b1e7dd6a-fc22-bba8-0abb-d3e779329bce@i-love.sakura.ne.jp/ ,
>>>>>> we want basic checks. That's a task for fbdev people who should be familiar with
>>>>>> necessary constraints.
>>>>>
>>>>> I think the worldwide supply of people who understand fbdev and willing to
>>>>> work on it is roughly 0. So if someone wants to fix this mess properly
>>>>> (which likely means adding tons of over/underflow checks at entry points,
>>>>> since you're never going to catch the driver bugs, there's too many and
>>>>> not enough people who care) they need to fix this themselves.
>>>>
>>>> But I think we can enforce reasonable constraint which is much stricter than Dan's basic_checks()
>>>> (which used INT_MAX). For example, do we need to accept var->{xres,yres} >= 1048576, for
>>>> "32768 rows or cols" * "32 pixels per character" = 1045876 and vc_do_resize() accepts only
>>>> rows and cols < 32768 ?
>>>>
>>>>>
>>>>> Just to avoid confusion here.
>>>>>
>>>>>> Anyway, my two patches are small and low cost; can we apply these patches regardless
>>>>>> of basic checks?
>>>>>
>>>>> Which two patches where?
>>>>
>>>> [PATCH v3] vt: Reject zero-sized screen buffer size.
>>>>  from https://lkml.kernel.org/r/20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp
>>>
>>> This is now in my tree.
>>>
>>>> [PATCH v2] fbdev: Detect integer underflow at "struct fbcon_ops"->clear_margins.
>>>>  from https://lkml.kernel.org/r/20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp
>>>
>>> That should be taken by the fbdev maintainer, but I can take it too if
>>> people want.
>>
>> Just missed this weeks pull request train and feeling like not worth
>> making this an exception (it's been broken forever after all), so
>> maybe best if you just add this to vt.
>>
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> Also this avoids the impression I know what's going on in fbdev code,
>> maybe with sufficient abandon from my side someone will pop up who
>> cares an fixes the bazillion of syzkaller issues we seem to have
>> around console/vt and everything related.
> 
> Great, will go queue it up now, thanks!
Fine with me, thanks!

PS I'll later queue the patch from George to drm-misc-next (after
reading both fbdev patches in detail it seems that both are needed).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
