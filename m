Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92B9938965
	for <lists+linux-fbdev@lfdr.de>; Fri,  7 Jun 2019 13:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbfFGLwC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 7 Jun 2019 07:52:02 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46708 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfFGLwC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 7 Jun 2019 07:52:02 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190607115201euoutp02b3f7b3b3224284f7ee157352e2006ee1~l6Fpuardp1264212642euoutp02V
        for <linux-fbdev@vger.kernel.org>; Fri,  7 Jun 2019 11:52:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190607115201euoutp02b3f7b3b3224284f7ee157352e2006ee1~l6Fpuardp1264212642euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559908321;
        bh=tpMJfYD01vcrrcWGI7V9BDF6/fR/cy2YAVkzfTMTeTI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=bWVg/rDFuvCIb6hrq/y2cjTulP77AuZCEQGI1lD8SyUi4EIGu1NFBKGpolJ+qbNUN
         XWGvxZ+ts7TNZc6aAdAok67HD5nqpvm9RQdCHIWbygFYiMjxSqToWVidbJ6XNjwJ/F
         rN91a11kMjF7kTJaIqzjJsEh2SpDlPrxQffVJgAg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190607115200eucas1p2b690face61aa9fc3bb41f808fc8b8419~l6Fo75Blj2169021690eucas1p2v;
        Fri,  7 Jun 2019 11:52:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 5E.60.04298.FDF4AFC5; Fri,  7
        Jun 2019 12:51:59 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190607115159eucas1p21a8cbb985c5322246172723f4e65bc91~l6FoBGtJ20920209202eucas1p2E;
        Fri,  7 Jun 2019 11:51:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190607115158eusmtrp19eb7afe29815599c347742fa6b566e18~l6FnxloQ21211812118eusmtrp1S;
        Fri,  7 Jun 2019 11:51:58 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-9f-5cfa4fdf35a2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id CC.0E.04140.EDF4AFC5; Fri,  7
        Jun 2019 12:51:58 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190607115158eusmtip14072518519d75751a2e98b92896e2eaa~l6FnYxFW12952829528eusmtip1M;
        Fri,  7 Jun 2019 11:51:58 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: mxsfb: Remove driver
To:     Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>
Cc:     shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <80891dd1-370b-6070-011b-b7ac822e17de@samsung.com>
Date:   Fri, 7 Jun 2019 13:52:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1bb6a117-dcf4-8842-0c3a-c3e015b2f0a9@denx.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djPc7r3/X/FGBx9Y2Fx5et7NouHV/0t
        Vk3dyWJxou8Dq0XXr5XMFm/aGhktXmwRd2D3mDfrBIvHzll32T02repk87jffZzJY+O7HUwe
        /X8NPD5vkgtgj+KySUnNySxLLdK3S+DK2LB/E0vBBpaKd0s3MTcwHmbuYuTkkBAwkbi55C9L
        FyMXh5DACkaJmVs3QTlfGCUO3PvIBuF8ZpSYt+kXXMvuf9ehqpYzSiyZOZsVwnnLKLFj4hom
        kCphAXOJ9RsesoLYIgLOEj0XdrOA2MwCjYwSm764gdhsAlYSE9tXMYLYvAJ2Eqt+vQSrZxFQ
        kdj4Yh9YXFQgQuL+sQ2sEDWCEidnPgGbwylgLfFg/X5GiJniEreezGeCsOUltr+dwwxykITA
        IXaJh51TmSDOdpFYeGcpO4QtLPHq+BYoW0bi9OQeFoiGdYwSfzteQHVvZ5RYPvkfG0SVtcTh
        4xeBzuAAWqEpsX6XPkTYUeJJ/wl2kLCEAJ/EjbeCEEfwSUzaNp0ZIswr0dEmBFGtJrFh2QY2
        mLVdO1cyT2BUmoXktVlI3pmF5J1ZCHsXMLKsYhRPLS3OTU8tNsxLLdcrTswtLs1L10vOz93E
        CExKp/8d/7SD8eulpEOMAhyMSjy8Huw/Y4RYE8uKK3MPMUpwMCuJ8JZd+BEjxJuSWFmVWpQf
        X1Sak1p8iFGag0VJnLea4UG0kEB6YklqdmpqQWoRTJaJg1OqgVFYWvDYC/WbK18eOKHzL+pF
        wRyW+OrSs7OOfn3Een3yWeslzbbTFPb9+11T++1D/5HqVVPmqx47vqxj3bK5crNXci9pLVmp
        uEPjw9QXYvwTVayvN7ny2v/qPmucHBX+9eRDVZX57puqObKmTvAK4y3nKjxc8ly+ym6+2S2D
        PRNNWGetl1vqsU5eiaU4I9FQi7moOBEABLyps0YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xu7r3/H/FGBy8YGJx5et7NouHV/0t
        Vk3dyWJxou8Dq0XXr5XMFm/aGhktXmwRd2D3mDfrBIvHzll32T02repk87jffZzJY+O7HUwe
        /X8NPD5vkgtgj9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxL
        LdK3S9DL2LB/E0vBBpaKd0s3MTcwHmbuYuTkkBAwkdj97zpLFyMXh5DAUkaJWZN+sXYxcgAl
        ZCSOry+DqBGW+HOtiw2i5jWjxKKm7UwgCWEBc4n1Gx6ygtgiAs4SPRd2gw1iFmhklLj26wMj
        RMduRonOt//YQKrYBKwkJravYgSxeQXsJFb9egnWzSKgIrHxxT6wuKhAhMSZ9ytYIGoEJU7O
        fAJmcwpYSzxYvx+shllAXeLPvEvMELa4xK0n85kgbHmJ7W/nME9gFJqFpH0WkpZZSFpmIWlZ
        wMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzAKtx37uWUHY9e74EOMAhyMSjy8M5h+xgix
        JpYVV+YeYpTgYFYS4S278CNGiDclsbIqtSg/vqg0J7X4EKMp0HMTmaVEk/OBCSKvJN7Q1NDc
        wtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAPj5cNPyiwWHsucZfQt77jdDhlP
        +fumHE2MrZl/JCPfsKxlWeW/78OFdp6uij2KWc8v3Or6fK73+NX39/me7/uu98Vzx7XP19Pn
        Pk9b4GHjXN/0qfqXv1erkWbnxrr7IfyOhzL9XLPEnmyPm/lfyaODU+ZuiNb0HdwXVL9FPnFc
        /GfKQdPjBybPUWIpzkg01GIuKk4EAAr0bk/YAgAA
X-CMS-MailID: 20190607115159eucas1p21a8cbb985c5322246172723f4e65bc91
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190520134337epcas3p369f0aaf00906512fa716324896822679
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190520134337epcas3p369f0aaf00906512fa716324896822679
References: <20190520130612.2214-1-festevam@gmail.com>
        <CGME20190520134337epcas3p369f0aaf00906512fa716324896822679@epcas3p3.samsung.com>
        <1bb6a117-dcf4-8842-0c3a-c3e015b2f0a9@denx.de>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 5/20/19 3:43 PM, Marek Vasut wrote:
> On 5/20/19 3:06 PM, Fabio Estevam wrote:
>> There is a DRM version of the mxsfb driver for quite some time
>> at drivers/gpu/drm/mxsfb/, so there is no need to keep maintaining
>> the fbdev version any longer.
>>
>> Remove the fbdev mxsfb driver in favour of the DRM version.
>>
>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> 
> Acked-by: Marek Vasut <marex@denx.de>

Patch queued for v5.3, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
