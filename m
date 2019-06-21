Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8F74E828
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Jun 2019 14:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfFUMkl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 21 Jun 2019 08:40:41 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32941 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbfFUMkl (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 21 Jun 2019 08:40:41 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190621124039euoutp0262a0d600fd211b1c706307c486575d7b~qNyHr72bO0157301573euoutp02S
        for <linux-fbdev@vger.kernel.org>; Fri, 21 Jun 2019 12:40:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190621124039euoutp0262a0d600fd211b1c706307c486575d7b~qNyHr72bO0157301573euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561120839;
        bh=8kS2pxnsEaPOj1BInin3UbKyqgpFMf6kwywPiLXgiEY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Jjv7wREegHklLHKYBIuFWVCfcTYv9+lymrykXUEmpy4s+iVib4Wlaf0OYrsi7dTSa
         ZPQGws0YHK/beFoQWifbSFvjMumpY55YxyUA/tOLCt/Hf598o/uf4zEscwUXrKGwuI
         BdpYGOR1CVFl4NQ7ND3PaoAuzCnLcIiIAB3JgkRk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190621124039eucas1p2ad34629456ceb682b2727edf5024410f~qNyHZvgzK2811828118eucas1p2t;
        Fri, 21 Jun 2019 12:40:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id B6.35.04325.740DC0D5; Fri, 21
        Jun 2019 13:40:39 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190621124038eucas1p2bcb63eb4c575c499b1450eab5356430e~qNyGx32th0061200612eucas1p2N;
        Fri, 21 Jun 2019 12:40:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190621124038eusmtrp230219c1d2b12ddb35a018d51c869173f~qNyGj5myT2599325993eusmtrp2f;
        Fri, 21 Jun 2019 12:40:38 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-10-5d0cd0479f61
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id CF.DD.04140.640DC0D5; Fri, 21
        Jun 2019 13:40:38 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190621124038eusmtip12ce56187f0d5cc33aae9dbc2b3d2e4b6~qNyGR2mAa2222122221eusmtip1S;
        Fri, 21 Jun 2019 12:40:38 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev-MMP: Use struct_size() in devm_kzalloc()
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <f789452f-5b4e-543e-67e2-16157af8e49e@samsung.com>
Date:   Fri, 21 Jun 2019 14:40:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190604233205.GA5377@embeddedor>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduznOV33CzyxBp+OsVlc+fqezWLrHlWL
        E30fWC0u75rD5sDise6gqsf97uNMHp83yQUwR3HZpKTmZJalFunbJXBlXN9wgK3gHXvF9hcG
        DYyz2LoYOTkkBEwkeq6cB7K5OIQEVjBK7Dh+iAXC+cIo8XTmBiaQKiGBz4wSTzY4w3R8+DUP
        qmM5o0TL5O3sEM5bRomtr5awgFQJC3hJdO06AGaLCBhJzJ7RzQpiMwskSJxedA8sziZgJTGx
        fRUjiM0rYCexc/9EZhCbRUBVYt+Xm2A1ogIREvePbWCFqBGUODnzCVicU0BfYumTk0wQM8Ul
        bj2ZD2XLS2x/O4cZ5CAJgXZ2iccfZjNDnO0i8WDFG0YIW1ji1fEt7BC2jMT/nSDNIA3rGCX+
        dryA6t7OKLF88j9oMFlLHD5+EegMDqAVmhLrd+lDhB0l3r1tZQMJSwjwSdx4KwhxBJ/EpG3T
        mSHCvBIdbUIQ1WoSG5ZtYINZ27VzJfMERqVZSF6bheSdWUjemYWwdwEjyypG8dTS4tz01GLj
        vNRyveLE3OLSvHS95PzcTYzAZHL63/GvOxj3/Uk6xCjAwajEw3tgFnesEGtiWXFl7iFGCQ5m
        JRFenhyeWCHelMTKqtSi/Pii0pzU4kOM0hwsSuK81QwPooUE0hNLUrNTUwtSi2CyTBycUg2M
        lnt4F89bZ/Hi8/vbmRtSVzQ9vCGoEW749aqjrO7EZSeOnjEpe93zuVf9RN9iRYtV5XPfetp4
        /fugb/Dud8cc3j1FfdtqdOY/bpVZcp+/Otd97xXmm98em1tcY+uLm9mteq1fZjUjY98JB49p
        zZKzVlz9ZGCYPDnxhu1yuT0hO0zlp+x++OHGUiWW4oxEQy3mouJEACD9VDsiAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xu7puF3hiDebvl7S48vU9m8XWPaoW
        J/o+sFpc3jWHzYHFY91BVY/73ceZPD5vkgtgjtKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx
        1DM0No+1MjJV0rezSUnNySxLLdK3S9DLuL7hAFvBO/aK7S8MGhhnsXUxcnJICJhIfPg1D8jm
        4hASWMoo8f7LW5YuRg6ghIzE8fVlEDXCEn+udUHVvGaU2L64FaxZWMBLomvXARYQW0TASGL2
        jG5WkF5mgQSJZ/NSQMJCAk2MEkdfSYPYbAJWEhPbVzGC2LwCdhI7909kBrFZBFQl9n25CTZG
        VCBC4sz7FSwQNYISJ2c+AbM5BfQllj45yQRiMwuoS/yZd4kZwhaXuPVkPlRcXmL72znMExiF
        ZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjJxtx35u2cHY9S74
        EKMAB6MSD++BWdyxQqyJZcWVuYcYJTiYlUR4eXJ4YoV4UxIrq1KL8uOLSnNSiw8xmgI9N5FZ
        SjQ5HxjVeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGNPTfOJj
        fZ8Enp5zpurY/t33fh09qOlVuvmS8aJFxrYV7CHMJyM+N/cm5K2O6WVi61q/7E7vRdttOy4K
        5z8RkWh89n5eT4tM8tWNy+av1Awz4+V4+zcs4nTdYjtb4SW8n84Un9DLuJoxa4aWnU2L0toZ
        +ZezUta7sTtcvqd9fpay1wTPhRqxAkosxRmJhlrMRcWJAMi3q0CyAgAA
X-CMS-MailID: 20190621124038eucas1p2bcb63eb4c575c499b1450eab5356430e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190604233211epcas1p1473ce5a9bb5e1113a91b37ec9a43f320
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190604233211epcas1p1473ce5a9bb5e1113a91b37ec9a43f320
References: <CGME20190604233211epcas1p1473ce5a9bb5e1113a91b37ec9a43f320@epcas1p1.samsung.com>
        <20190604233205.GA5377@embeddedor>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 6/5/19 1:32 AM, Gustavo A. R. Silva wrote:
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
> 
> struct foo {
>     int stuff;
>     struct boo entry[];
> };
> 
> size = sizeof(struct foo) + count * sizeof(struct boo);
> instance = devm_kzalloc(dev, size, GFP_KERNEL);
> 
> Instead of leaving these open-coded and prone to type mistakes, we can
> now use the new struct_size() helper:
> 
> instance = devm_kzalloc(dev, struct_size(instance, entry, count), GFP_KERNEL);
> 
> Notice that, in this case, variable size is not necessary, hence it
> is removed.
> 
> This code was detected with the help of Coccinelle.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch queued for v5.3, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
