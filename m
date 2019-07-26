Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E84D076EA7
	for <lists+linux-fbdev@lfdr.de>; Fri, 26 Jul 2019 18:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfGZQKu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 26 Jul 2019 12:10:50 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55258 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfGZQKt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 26 Jul 2019 12:10:49 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190726161048euoutp016130d168b0f186c59092ce512331efb9~1AOmAUIjn1373513735euoutp01D
        for <linux-fbdev@vger.kernel.org>; Fri, 26 Jul 2019 16:10:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190726161048euoutp016130d168b0f186c59092ce512331efb9~1AOmAUIjn1373513735euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1564157448;
        bh=Y24P96MbpYrWVUxRlfpD7EKr/iM4xLJEvN3lQ7SJ16M=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ec3d4JRk4Ci45KoO5wM1ydKvMcjCVkGc7TiDj3l+UtBrjGZXoDWLRfjkgVePYEnPE
         E3iSUGEFoetScF6gS3O9oZ1x1YwcGxPO8gfXXdaAEMiRY+X2o5JXCpOLiyK7r980pn
         /JfCLlcChl5g4b80/UxDucGx/3NM5NXK1KjywlcM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190726161048eucas1p1301f01a79e19a12c9101d921d5d00817~1AOlrk4Ss0591705917eucas1p1u;
        Fri, 26 Jul 2019 16:10:48 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 34.E4.04325.7062B3D5; Fri, 26
        Jul 2019 17:10:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190726161047eucas1p268dca96f2a7a377e6e27b13ff4351a14~1AOk3vpuv1734717347eucas1p2X;
        Fri, 26 Jul 2019 16:10:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190726161047eusmtrp18cb334737570859c9849bc142f075b50~1AOkpw5gK2960729607eusmtrp17;
        Fri, 26 Jul 2019 16:10:47 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-b6-5d3b2607ae8e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1C.99.04140.6062B3D5; Fri, 26
        Jul 2019 17:10:46 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190726161046eusmtip2bac5c2d2f112c4b010fa7346e42c5934~1AOkZXzJa0183801838eusmtip2X;
        Fri, 26 Jul 2019 16:10:46 +0000 (GMT)
Subject: Re: [PATCH] video: Demote panel timing not found error message
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <8901e662-298e-9551-c209-86c5da9c3fe2@samsung.com>
Date:   Fri, 26 Jul 2019 18:10:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190726153252.GA24229@ravnborg.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djP87rsataxBuePGFpc+fqezeJE3wdW
        ixU/tzJa/Nw1j8WBxWPnrLvsHve7jzN5LJl2lc3j8ya5AJYoLpuU1JzMstQifbsErozWH2fZ
        Chq5K/ad3czSwPiMo4uRk0NCwESif/o3ti5GLg4hgRWMEj+OnmaFcL4wSmx7fp8dpEpI4DOj
        xM52VpiOddvfMUHElzNKfJ+iCdHwllFiw547LCAJYQF3iUVNbxlBbBEBZYnj56+BNTML5Eqs
        nrwQLM4mYCUxsX0VmM0rYCex4FofmM0ioCqx8fRPsAWiAhES949tYIWoEZQ4OfMJ2HxOASOJ
        a0t6oGaKS9x6Mp8JwpaX2P52DjPIQRICk9klDu1azQRxtYtEz/l/LBC2sMSr41vYIWwZidOT
        e1ggGtYxSvzteAHVvZ1RYvnkf2wQVdYSh49fBFrHAbRCU2L9Ln2IsKPEscszmUHCEgJ8Ejfe
        CkIcwScxadt0qDCvREebEES1msSGZRvYYNZ27VzJPIFRaRaS12YheWcWkndmIexdwMiyilE8
        tbQ4Nz212DgvtVyvODG3uDQvXS85P3cTIzC1nP53/OsOxn1/kg4xCnAwKvHwBvy0ihViTSwr
        rsw9xCjBwawkwrtFyTpWiDclsbIqtSg/vqg0J7X4EKM0B4uSOG81w4NoIYH0xJLU7NTUgtQi
        mCwTB6dUA6NekIR2y49H/fXhts4lWaHs9ud+TM7QW/r7T7hlx76dTVukT9zn/SNrbFP4imf7
        8831nu/LGo4sd7lxPbZlb7jSimPLDqZzJc/S6eR98LRo/6eIS7N+eSc9N70ttDXF6vSxk8Vl
        dU8Mf8ZK3I5v+hb9v/kA40bb3nNXl9Uklm4K8b91YI1w4kUlluKMREMt5qLiRABSilOgKQMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xe7psataxBqc3W1lc+fqezeJE3wdW
        ixU/tzJa/Nw1j8WBxWPnrLvsHve7jzN5LJl2lc3j8ya5AJYoPZui/NKSVIWM/OISW6VoQwsj
        PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzWH2fZChq5K/ad3czSwPiMo4uRk0NC
        wERi3fZ3TF2MXBxCAksZJeYu38vSxcgBlJCROL6+DKJGWOLPtS42iJrXjBI7/m1mBkkIC7hL
        LGp6ywhiiwgoSxw/f40VxGYWyJXo2bydFaJhGpPEgn2LwIrYBKwkJravArN5BewkFlzrA7NZ
        BFQlNp7+yQRiiwpESJx5v4IFokZQ4uTMJ2A2p4CRxLUlPVAL1CX+zLvEDGGLS9x6Mp8JwpaX
        2P52DvMERqFZSNpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQKjadux
        n1t2MHa9Cz7EKMDBqMTDG/DTKlaINbGsuDL3EKMEB7OSCO8WJetYId6UxMqq1KL8+KLSnNTi
        Q4ymQM9NZJYSTc4HRnpeSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5O
        qQZGu7P7M3barX0hO0HCwnZypP7etlSXfTHHPibsvVyhWOKft+7dJo0rf+5xX7zptz6xVKSM
        z956edm1GfKGu6awzatT5wqvuB04xy772NUA4Xb1xiRBboFn93RzdJo0lDZaKV3nOhU3waPo
        IVei/r2fa1h7tx29PmmR89wN67MO2q6JmXq4zfGdEktxRqKhFnNRcSIAyij8irwCAAA=
X-CMS-MailID: 20190726161047eucas1p268dca96f2a7a377e6e27b13ff4351a14
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190726113631epcas1p4159fcc746f1409b6b16c7912968b65d2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190726113631epcas1p4159fcc746f1409b6b16c7912968b65d2
References: <20190726101849.27322-1-thierry.reding@gmail.com>
        <CGME20190726113631epcas1p4159fcc746f1409b6b16c7912968b65d2@epcas1p4.samsung.com>
        <20190726113625.GC20065@ravnborg.org>
        <e9bf4cf5-f4de-0a3b-52f4-67f1ae7af5b9@samsung.com>
        <20190726153252.GA24229@ravnborg.org>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 7/26/19 5:32 PM, Sam Ravnborg wrote:
> Hi Bartlomiej Zolnierkiewicz
>>
>> Hi Sam,
>>
>> On 7/26/19 1:36 PM, Sam Ravnborg wrote:
>>> Hi Thierry.
>>>
>>> On Fri, Jul 26, 2019 at 12:18:49PM +0200, Thierry Reding wrote:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>
>>>> Failing to find a panel-timing node is not an error in all cases, so do
>>>> not output an error message in that case. Instead turn it into a debug
>>>> message and make the drivers that care about it output an error message
>>>> of their own.
>>>
>>> This is more or less the same as already implmented by Douglas here:
>>> https://patchwork.kernel.org/cover/11053243/
>>>
>>> Doug's has an extra bug-fix that we shall not miss.
>>>
>>> I am waiting for feedback from Bartlomiej before proceeding.
>>
>> The patchset is in drm-misc-next tree now.
>>
>>> I guess he is on holiday somewhere and will return soon.
>>
>> I wish it was the case. ;-)
> Well, too hot here for work atm. But the farmers are happy.
> 
> Can you maybe find time to respond to this patch:
> https://lists.freedesktop.org/archives/dri-devel/2019-July/228051.html
> 
> It already got ack from backligt people, but as it touches fbdev
> your feedback is required too.

LGTM. I've just posted my ACK in the reply to the patch.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
