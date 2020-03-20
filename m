Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C42B918CF35
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Mar 2020 14:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgCTNnA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 20 Mar 2020 09:43:00 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35691 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbgCTNnA (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 20 Mar 2020 09:43:00 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200320134258euoutp0174b0373062ca71e20add9f77468484a1~_BvdIfTN43095230952euoutp012
        for <linux-fbdev@vger.kernel.org>; Fri, 20 Mar 2020 13:42:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200320134258euoutp0174b0373062ca71e20add9f77468484a1~_BvdIfTN43095230952euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1584711778;
        bh=1E8KASmUM//Nd8NqHvwK4FOzSMpoFO+xYAaKbjX49mw=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=WCZJHSHqWHn594XC71KgMVPCqV6EJKivjNB/BhdCI5yHL+f+tUZ3xqLfUOBDgTp6D
         gWFgcC+qjSfDZI0p6JjfE3oc7ylnINlLqrhQNg99vNjb3CKYyvNS/VSgu9vCC5MWZJ
         AaKya7oNazqtpdgYAH5XyDdTUWXxj0tpbgZL6wNQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200320134257eucas1p1fc54702e4d0e5410f63a5fce1b1bc52d~_Bvc8ukTp3232132321eucas1p1H;
        Fri, 20 Mar 2020 13:42:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id CE.53.61286.168C47E5; Fri, 20
        Mar 2020 13:42:57 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200320134257eucas1p2fd97b3f52ceb23a87fc599c8880bf686~_BvcnYO5k0171701717eucas1p2k;
        Fri, 20 Mar 2020 13:42:57 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200320134257eusmtrp1be4c8d286d344892ab0244c2cbb206d8~_Bvcmz2Ea2315923159eusmtrp1M;
        Fri, 20 Mar 2020 13:42:57 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-f9-5e74c861afda
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id DE.E7.07950.168C47E5; Fri, 20
        Mar 2020 13:42:57 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200320134257eusmtip2daf37f8111c4a49c9fcb137e3efb541f~_BvcPomta1365913659eusmtip2S;
        Fri, 20 Mar 2020 13:42:57 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: fbdev: fix -Wextra build warnings
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Message-ID: <27499b12-9e21-a799-ca9b-0852d1c0de0e@samsung.com>
Date:   Fri, 20 Mar 2020 14:42:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200315041002.24473-1-rdunlap@infradead.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsWy7djP87qJJ0riDC7s1rb42f2FzeLK1/ds
        Fp0zrzFanOj7wGpxedccNou3d6azOLB57Jx1l93jw8c4j80rtDzudx9n8vi8SS6ANYrLJiU1
        J7MstUjfLoErY+/+2YwFHzkrJs9awdrAeIi9i5GTQ0LARKJl9iHmLkYuDiGBFYwSC+9dZoJw
        vjBK3H26mx3C+cwo0dnUxwzT8vrmGrB2IYHljBJN36shit4ySmzpmsICkmATsJKY2L6KsYuR
        g0NYQE/i4Ep7kLCIgIbE7ytXWEHqmQX2MkrM2L2EDSTBK2An8e7lSbAFLAKqEjd3rGUCsUUF
        IiQ+PTjMClEjKHFy5hOw+ZwC1hILbi4F62UWEJe49WQ+E4QtL7H97RywfyQENrFLrN+5iQ3i
        aheJSyeuM0HYwhKvjm+BBoCMxOnJPSwQDesYJf52vIDq3s4osXzyP6hua4k7536xgbzDLKAp
        sX6XPkTYUWLyhgssIGEJAT6JG28FIY7gk5i0bTozRJhXoqNNCKJaTWLDsg1sMGu7dq5knsCo
        NAvJa7OQvDMLyTuzEPYuYGRZxSieWlqcm55abJiXWq5XnJhbXJqXrpecn7uJEZh2Tv87/mkH
        49dLSYcYBTgYlXh4LVaWxAmxJpYVV+YeYpTgYFYS4dVNL44T4k1JrKxKLcqPLyrNSS0+xCjN
        waIkzmu86GWskEB6YklqdmpqQWoRTJaJg1OqgXFq/CzBs/8kmqWK5aoSmZeeb7RNfrr4jXOb
        7zuOxt8/pkW/zUpq/FVuZPjJR3Rz/rkXmaxP7jyRnFMUU5yk4zpjPmvlnDca1VlmQc7Rs1Q/
        spUFm/e7Me0LmsN6auqv30enthvcmbqT/6EHZ7z5JFUOhq3OsR35j8JCXh3/bnzhxF6Oxj1H
        nyixFGckGmoxFxUnAgDj1jmuNwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsVy+t/xe7qJJ0riDCbMl7D42f2FzeLK1/ds
        Fp0zrzFanOj7wGpxedccNou3d6azOLB57Jx1l93jw8c4j80rtDzudx9n8vi8SS6ANUrPpii/
        tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY+/+2YwFHzkr
        Js9awdrAeIi9i5GTQ0LAROL1zTVANheHkMBSRom7J3aydjFyACVkJI6vL4OoEZb4c62LDaLm
        NaNE89kvTCAJNgEriYntqxhB6oUF9CQOrrQHCYsIaEj8vnKFFaSeWWAvo0T3pFlsIAkhgT5G
        ibd9MSA2r4CdxLuXJ5lBbBYBVYmbO9aCzRQViJA4vGMWI0SNoMTJmU9YQGxOAWuJBTeXgs1h
        FlCX+DPvEjOELS5x68l8JghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy02
        0itOzC0uzUvXS87P3cQIjLJtx35u2cHY9S74EKMAB6MSD6/FypI4IdbEsuLK3EOMEhzMSiK8
        uunFcUK8KYmVValF+fFFpTmpxYcYTYGem8gsJZqcD0wAeSXxhqaG5haWhubG5sZmFkrivB0C
        B2OEBNITS1KzU1MLUotg+pg4OKUaGBW23rlzdMdrPZ4zmzIu6kt3btvxMCVot+9aV/dFt1Zp
        sik7LV6xMp9Nj6sn/ax+cQsDH+vic8yK31c99W+oe7b4A/ecEK6Z/1Qkf7tOcrCveC74kMfv
        csTk6aqvfCsCGSsM9kp83r1v5eVr6Q4XNitZXt2ptXPOvI9Vu4rkj8dMujXzp4nCsnNKLMUZ
        iYZazEXFiQBuNSB+yAIAAA==
X-CMS-MailID: 20200320134257eucas1p2fd97b3f52ceb23a87fc599c8880bf686
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200315041009eucas1p14e087e86c18ceafe1644589a67de9499
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200315041009eucas1p14e087e86c18ceafe1644589a67de9499
References: <CGME20200315041009eucas1p14e087e86c18ceafe1644589a67de9499@eucas1p1.samsung.com>
        <20200315041002.24473-1-rdunlap@infradead.org>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 3/15/20 5:09 AM, Randy Dunlap wrote:
> This patch series fixes warnings in fbdev that are found when
> -Wextra is used. In fixing these, there were a few other build
> errors discovered (mostly caused by bitrot) and fixed.
> 
> [PATCH 1/6] fbdev: fbmon: fix -Wextra build warnings
> [PATCH 2/6] fbdev: aty: fix -Wextra build warning
> [PATCH 3/6] fbdev: matrox: fix -Wextra build warnings
> [PATCH 4/6] fbdev: savage: fix -Wextra build warning
> [PATCH 5/6] fbdev: pm[23]fb.c: fix -Wextra build warnings and errors
> [PATCH 6/6] fbdev: via: fix -Wextra build warning and format warning
> 
>  drivers/video/fbdev/aty/atyfb_base.c       |    2 +-
>  drivers/video/fbdev/core/fbmon.c           |    2 +-
>  drivers/video/fbdev/matrox/matroxfb_base.h |    2 +-
>  drivers/video/fbdev/pm2fb.c                |    2 +-
>  drivers/video/fbdev/pm3fb.c                |    8 ++++----
>  drivers/video/fbdev/savage/savagefb.h      |    2 +-
>  drivers/video/fbdev/via/debug.h            |    6 ++++--
>  drivers/video/fbdev/via/viafbdev.c         |    2 +-
>  8 files changed, 14 insertions(+), 12 deletions(-)

Patches #1-6 queued for v5.7, thanks!

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
