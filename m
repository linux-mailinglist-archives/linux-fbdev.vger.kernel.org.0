Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBA4175E60
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Mar 2020 16:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgCBPlr (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Mar 2020 10:41:47 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46774 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbgCBPlq (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Mar 2020 10:41:46 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200302154145euoutp02c479c05fb0f98f3b4eba7773ead68309~4hwCSNv0N1202812028euoutp02g
        for <linux-fbdev@vger.kernel.org>; Mon,  2 Mar 2020 15:41:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200302154145euoutp02c479c05fb0f98f3b4eba7773ead68309~4hwCSNv0N1202812028euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583163705;
        bh=6TrqICJ4JkvgzITBg9FNRFomvLY6jkBbLoA022VCes0=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=tgsAftB9HgIt8bQDf86YfjOYV9qbOSxDcQi6Ft+vtZmCZaXzWaDTyj66goyfbeKaZ
         jWGNh9Zc+PXOWuUYhucWroJvA/5r5mWX2a7E/2ZD8X+oFlbjoANc+JUPesMYMJs6Gt
         q4vEWNEA7XVE04pwPev5xzsaIbuDD0W3Cjij3WB0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200302154145eucas1p17a328f7ad87fb55442989468f870034e~4hwCB-DeW0821908219eucas1p1y;
        Mon,  2 Mar 2020 15:41:45 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 59.7D.61286.9392D5E5; Mon,  2
        Mar 2020 15:41:45 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200302154144eucas1p1ef563be023483907696fe8ea41a1caa0~4hwBtiuO23235332353eucas1p1O;
        Mon,  2 Mar 2020 15:41:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200302154144eusmtrp1ed80685acb87da002bd6a99382bdc1fe~4hwBs-HHo2862728627eusmtrp1N;
        Mon,  2 Mar 2020 15:41:44 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-66-5e5d2939f796
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C6.EF.07950.8392D5E5; Mon,  2
        Mar 2020 15:41:44 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200302154144eusmtip1dba7a1d1d932af2524eb81855ecc388d~4hwBX1O391241012410eusmtip1c;
        Mon,  2 Mar 2020 15:41:44 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/2] video: fbdev: sh_mobile_lcdcfb: add COMPILE_TEST
 support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <ac1911fa-4553-b690-2722-cd152b8d549a@samsung.com>
Date:   Mon, 2 Mar 2020 16:41:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVxesjdmL7asPwOP2xoS6quLs4-onT80afi7ui2GSZ-tg@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djP87qWmrFxBi37uC1urTvHanHl63s2
        i2e39jJZnOj7wGpxedccNgdWj0OHOxg97ncfZ/Lo27KK0ePzJrkAligum5TUnMyy1CJ9uwSu
        jN2/+pgL2lgqLm9rZmxg3MTcxcjJISFgIjH3wzPWLkYuDiGBFYwS0/a/h3K+MErcfrYYyvnM
        KNHS8pQdpmXRoy/sEInljBK3zq9nhHDeMkr07ZrOAlLFJmAlMbF9FSOILSwQLDHt8W4gm4ND
        REBXYs5PJpB6ZoErjBKLVrWCHcIrYCex4ewxJhCbRUBFYtvtLrBeUYEIiU8PDrNC1AhKnJz5
        BGw+p0CgxJbmw2wgNrOAuMStJ/OZIGx5ie1v5zCDLJAQWMQu8fv7ZzaIs10kVk26ygRhC0u8
        Or4F6h0ZidOTe1ggGtYxSvzteAHVvZ1RYvnkf1Dd1hJ3zv1iA3mBWUBTYv0ufYiwo0Rz0zsW
        kLCEAJ/EjbeCEEfwSUzaNp0ZIswr0dEmBFGtJrFh2QY2mLVdO1cyT2BUmoXktVlI3pmF5J1Z
        CHsXMLKsYhRPLS3OTU8tNsxLLdcrTswtLs1L10vOz93ECEw0p/8d/7SD8eulpEOMAhyMSjy8
        AcyxcUKsiWXFlbmHGCU4mJVEeH05o+OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCe
        WJKanZpakFoEk2Xi4JRqYPSKUd0vf+yY62vHLOPgj4sKnylpHxdYnLkl6l5fqsjpzbvfsx2Z
        /qNCuk5gguijKzfNb0bt9uGoTZYWsxFfslv0b57eG7lnsZssvG9l+X7r+qP6LFpCYLb1fKWy
        tjqPV11bF3fdeKal1GVecvVny8zns4+8kVu4UVDsQrCU0s4NvK9vG/kHr1ViKc5INNRiLipO
        BADd6x1iMAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xu7oWmrFxBnf+GFrcWneO1eLK1/ds
        Fs9u7WWyONH3gdXi8q45bA6sHocOdzB63O8+zuTRt2UVo8fnTXIBLFF6NkX5pSWpChn5xSW2
        StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Gbt/9TEXtLFUXN7WzNjAuIm5
        i5GTQ0LARGLRoy/sXYxcHEICSxkltja1ACU4gBIyEsfXl0HUCEv8udbFBlHzmlHi057fYM1s
        AlYSE9tXMYLYwgLBEtMe72YE6RUR0JWY85MJpJ5Z4BqjxLnv89hAaoQEbgIteBoHYvMK2Els
        OHuMCcRmEVCR2Ha7C2yOqECExOEdsxghagQlTs58wgJicwoESmxpPgw2h1lAXeLPvEvMELa4
        xK0n85kgbHmJ7W/nME9gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85
        P3cTIzCqth37uWUHY9e74EOMAhyMSjy8Pxhi44RYE8uKK3MPMUpwMCuJ8PpyRscJ8aYkVlal
        FuXHF5XmpBYfYjQFem4is5Rocj4w4vNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqem
        FqQWwfQxcXBKNTCKv2333vd841oFTsUH6nvSX938Oo2ljDNcL6JyUVhv/eSLjo7VH9jLwrOu
        sJzmqKiPC/2qeW9a3/9fGnMn+6/8MCvE8csX63n+l46dND8t0frryNuFZ84sXtIt6lW9PmDm
        rIUtFtPsFJfc3ntV3WCTr8mpH55vrNZP0l2mJX6C0VD2/5It7sfPKrEUZyQaajEXFScCAB87
        wd3AAgAA
X-CMS-MailID: 20200302154144eucas1p1ef563be023483907696fe8ea41a1caa0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200116145157eucas1p2401abc6b00654d767e872edbd0338957
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116145157eucas1p2401abc6b00654d767e872edbd0338957
References: <CGME20200116145157eucas1p2401abc6b00654d767e872edbd0338957@eucas1p2.samsung.com>
        <d98fea18-b72e-6d0f-33ac-1421738bd12b@samsung.com>
        <CAMuHMdVxesjdmL7asPwOP2xoS6quLs4-onT80afi7ui2GSZ-tg@mail.gmail.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 1/17/20 3:08 PM, Geert Uytterhoeven wrote:
> On Thu, Jan 16, 2020 at 3:52 PM Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
>> Add COMPILE_TEST support to sh_mobile_lcdcfb driver for better compile
>> testing coverage.
>>
>> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, patch queued for v5.7.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

