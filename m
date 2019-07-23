Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E697371BD8
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Jul 2019 17:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfGWPiS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 23 Jul 2019 11:38:18 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42660 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727598AbfGWPiR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 23 Jul 2019 11:38:17 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190723153816euoutp0256baac69319a94548c2e616e85e041b0~0E2VIENVd1039110391euoutp02L
        for <linux-fbdev@vger.kernel.org>; Tue, 23 Jul 2019 15:38:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190723153816euoutp0256baac69319a94548c2e616e85e041b0~0E2VIENVd1039110391euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1563896296;
        bh=VjovTDiMt97xdGE3WlxPMJBYNl8cS2ld4czh4ywLQes=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Fw/By5gb+Pvx3XHO0t9yo5Gd9XnioBXd+skD+fbX575MrlfciU1Vn4L34odu/7W9u
         3+tLaEhTYxWs1njR95YvklWDgFCZX35Ysq7XaeRvMs+gqlYuSHAKVSjipWM3NE19o9
         SXiqyNcREoSv+V6QFbfboXP6tC/CRdnZSwwTcDgo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190723153815eucas1p20869e6ec0af05080bbd994a9b05de046~0E2UgeTqu2709827098eucas1p29;
        Tue, 23 Jul 2019 15:38:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 94.EE.04325.7E9273D5; Tue, 23
        Jul 2019 16:38:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190723153814eucas1p118ce10061c55ca4b9bf71c69b8430367~0E2Twm9u_3017730177eucas1p1h;
        Tue, 23 Jul 2019 15:38:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190723153814eusmtrp1ea731f0262c19150a1d3a7a930df52aa~0E2Tihy5c2369023690eusmtrp1q;
        Tue, 23 Jul 2019 15:38:14 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-eb-5d3729e77f68
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id BF.F1.04140.6E9273D5; Tue, 23
        Jul 2019 16:38:14 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190723153814eusmtip2e135b2a37969fc61461c312583c20cae~0E2TF_Uaz0852608526eusmtip2i;
        Tue, 23 Jul 2019 15:38:14 +0000 (GMT)
Subject: Re: [PATCH 0/6] video: ssd1307fb: Support more displays
To:     Marko Kohtala <marko.kohtala@okoko.fi>
Cc:     linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <f0d8be30-4980-7e7c-dcbb-3bd7621cff08@samsung.com>
Date:   Tue, 23 Jul 2019 17:38:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618074111.9309-1-marko.kohtala@okoko.fi>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKKsWRmVeSWpSXmKPExsWy7djP87rPNc1jDX7Ml7DoPXeSyeL/tonM
        FvOPnGO1uPL1PZvFib4PrBZLr19kslh9eAGLxf/PT1gtWvceYXfg9Fgzbw2jx95vC1g8Nq3q
        ZPPY/u0Bq8f97uNMHj+XLWXx+LxJzuPl3w/MARxRXDYpqTmZZalF+nYJXBkPZrczFvRwV+x7
        1MzWwPifo4uRk0NCwETi083XzF2MXBxCAisYJU6u/MYC4XxhlJiz+y4rhPOZUWJC931WmJav
        77azgdhCAssZJbrWyEAUvWWU2HVnMSNIQljAQeLsi21MILaIgJbEixdtYJOYBVYwSZztagTr
        ZhOwkpjYvgqsgVfATmLHiiYwm0VAVWLJrh9gNaICERL3j21ghagRlDg58wkLiM0pYC3xo6OJ
        HcRmFhCXuPVkPhOELS+x/e0csIckBK6xS0x9f4kd4mwXiVU7vjFB2MISr45vgYrLSJye3MMC
        0bCOUeJvxwuo7u2MEssn/2ODqLKWOHz8ItAZHEArNCXW79KHCDtKPGtbxQ4SlhDgk7jxVhDi
        CD6JSdumM0OEeSU62oQgqtUkNizbwAaztmvnSuYJjEqzkLw2C8k7s5C8Mwth7wJGllWM4qml
        xbnpqcXGeanlesWJucWleel6yfm5mxiBiev0v+NfdzDu+5N0iFGAg1GJh7eCyTxWiDWxrLgy
        9xCjBAezkghvYINZrBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeaoYH0UIC6YklqdmpqQWpRTBZ
        Jg5OqQbGg7y7c7dIbuEP2OOTY6X/vDHb8KS/zktngxJHk42Ll38oOPPhcMpi/f3/NzbonJ1j
        U8/6a61JyKQQttfMSh8jfLwqq2uSz/RM2bZBaadHvssTN0u/rrnrdvy9djRmrdOGqv8Ty4Tj
        XA993a+QnNKz1Vl6i+kSgzW2/crL5/3h0qnM3NvCuKhCiaU4I9FQi7moOBEAYNZPulgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsVy+t/xe7rPNM1jDZ5tUrDoPXeSyeL/tonM
        FvOPnGO1uPL1PZvFib4PrBZLr19kslh9eAGLxf/PT1gtWvceYXfg9Fgzbw2jx95vC1g8Nq3q
        ZPPY/u0Bq8f97uNMHj+XLWXx+LxJzuPl3w/MARxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpG
        JpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehkPZrczFvRwV+x71MzWwPifo4uRk0NCwETi67vt
        bF2MXBxCAksZJTYcu8fYxcgBlJCROL6+DKJGWOLPtS6omteMEouXdrCCJIQFHCTOvtjGBGKL
        CGhJvHjRBhZnFljBJPFuuzCILSTQxyix5wjYMjYBK4mJ7asYQWxeATuJHSuawGwWAVWJJbt+
        sIHYogIREmfer2CBqBGUODnzCZjNKWAt8aOjiR1ivrrEn3mXmCFscYlbT+YzQdjyEtvfzmGe
        wCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZglG479nPLDsau
        d8GHGAU4GJV4eCuYzGOFWBPLiitzDzFKcDArifAGNpjFCvGmJFZWpRblxxeV5qQWH2I0BXpu
        IrOUaHI+MIHklcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgXCXN
        Xnj02CpjzXcaT3ca+n7hmyXKUCzqlt2n3pJQFNq+asZJJ+XD69027j+eJ/s8dHeSQrCmRyl/
        Yad19Q2mEyb707YZeN+Pf/lFsOe7asLdGeUl0+TW6Kh5Cy/aG3BpY+5mjqIHK/Z7WR16GlLz
        pe3ego5pH0OMCrilXNvrDdR3Tbdz+39HiaU4I9FQi7moOBEAmpnqkugCAAA=
X-CMS-MailID: 20190723153814eucas1p118ce10061c55ca4b9bf71c69b8430367
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190618074155epcas1p3fcfe7cf1058162c11e4b1780987ca394
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190618074155epcas1p3fcfe7cf1058162c11e4b1780987ca394
References: <CGME20190618074155epcas1p3fcfe7cf1058162c11e4b1780987ca394@epcas1p3.samsung.com>
        <20190618074111.9309-1-marko.kohtala@okoko.fi>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 6/18/19 9:41 AM, Marko Kohtala wrote:
> The kernel driver for ssd1307fb did not allow for all proper
> initialization for a Densitron 128x36 display. The trend in the driver
> has been to add devicetree properties for the controller initialization
> and these patches continue on that trend.
> 
> There also were some sparse and Coccinelle errors.
> 
> A small bug causing scrolling on display updates with nonzero page_offset
> was a bit surprising. It would seem the driver has only been used with
> page_offset set to zero. Bug has been there since commit
> 301bc0675b677a98475187050d56cd2b39ff0acf ("video: ssd1307fb: Make use of
> horizontal addressing mode").
> 
> Marko Kohtala (6):
>   video: ssd1307fb: Use screen_buffer instead of screen_base
>   video: ssd1307fb: Remove unneeded semicolons
>   video: ssd1307fb: Start page range at page_offset
>   video: ssd1307fb: Handle width and height that are not multiple of 8
>   dt-bindings: display: ssd1307fb: Add initialization properties
>   video: ssd1307fb: Add devicetree configuration of display setup
> 
>  .../devicetree/bindings/display/ssd1307fb.txt |  10 ++
>  drivers/video/fbdev/ssd1307fb.c               | 130 ++++++++++++------
>  2 files changed, 101 insertions(+), 39 deletions(-)
Patch series queued for v5.4, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
