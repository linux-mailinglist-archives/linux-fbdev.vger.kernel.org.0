Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 119D676C24
	for <lists+linux-fbdev@lfdr.de>; Fri, 26 Jul 2019 16:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbfGZO4F (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 26 Jul 2019 10:56:05 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38067 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727172AbfGZO4F (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 26 Jul 2019 10:56:05 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190726145603euoutp016e4e72569f2b7357dec1878baf97c826~0-NVD49XX2678926789euoutp01O
        for <linux-fbdev@vger.kernel.org>; Fri, 26 Jul 2019 14:56:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190726145603euoutp016e4e72569f2b7357dec1878baf97c826~0-NVD49XX2678926789euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1564152963;
        bh=LxoHOsIrXQtmvQEc4eZgBrguRkQWrR1UdLrpqRZbzfE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Q2uVzJtDk09xLxeXDdeEOWM9KA40bEsEucG1m0tGwedqYu5galt6V90bcjXJO8bBx
         S9QV5U2ZaYz7Wb7nvV1IDv1kaThT+owmCrCsW/Z6cVzOsaY5l+ae/vM6s0UPjJnziV
         rp1adUhiLl2QWjM0tEOnKeJOPg53f/J3kPMnxIXo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190726145603eucas1p2927ed7fc5abdc7e91a7bedf4b524cf54~0-NUty3DO0069700697eucas1p2P;
        Fri, 26 Jul 2019 14:56:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 60.75.04298.2841B3D5; Fri, 26
        Jul 2019 15:56:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190726145602eucas1p10c5b58e0cc5bdf499eaea4ada620eefc~0-NT7PIdx1003510035eucas1p1l;
        Fri, 26 Jul 2019 14:56:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190726145602eusmtrp29b7fed674c90597e17bd41b412f703a8~0-NTtHzq42451324513eusmtrp23;
        Fri, 26 Jul 2019 14:56:02 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-8a-5d3b14820158
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id A9.7B.04146.1841B3D5; Fri, 26
        Jul 2019 15:56:02 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190726145601eusmtip1c9f008916d65059ed21aa5cd7301e6bb~0-NTe8qWR2629526295eusmtip1B;
        Fri, 26 Jul 2019 14:56:01 +0000 (GMT)
Subject: Re: [PATCH] video: Demote panel timing not found error message
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <e9bf4cf5-f4de-0a3b-52f4-67f1ae7af5b9@samsung.com>
Date:   Fri, 26 Jul 2019 16:56:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190726113625.GC20065@ravnborg.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djP87pNItaxBqe2G1tc+fqezeJE3wdW
        ixU/tzJa/Nw1j8WBxWPnrLvsHve7jzN5LJl2lc3j8ya5AJYoLpuU1JzMstQifbsEroy2W+uZ
        CqZJVvxc+IapgXG7SBcjJ4eEgInE3e2/GLsYuTiEBFYwSlw79JQZwvnCKPF9ZSsbhPOZUWLC
        ji6mLkYOsJY9hwwg4ssZJZrnHoLqeMso8fPoKyaQucIC7hKLmt4ygtgiAsoSx89fYwWxmQVy
        JVZPXggWZxOwkpjYvgrM5hWwk2iffZMNxGYRUJXYtuovC4gtKhAhcf/YBlaIGkGJkzOfgMU5
        BYwkFt7cywwxU1zi1pP5TBC2vMT2t3PADpIQmMwu8fLnEmaIR10ktt4/wwRhC0u8Or6FHcKW
        kfi/E6QZpGEdo8TfjhdQ3dsZJZZP/scGUWUtcfj4RVaQ/5kFNCXW79KHCDtKHLs8kxkSLHwS
        N94KQhzBJzFp23SoMK9ER5sQRLWaxIZlG9hg1nbtXMk8gVFpFpLXZiF5ZxaSd2Yh7F3AyLKK
        UTy1tDg3PbXYMC+1XK84Mbe4NC9dLzk/dxMjMLmc/nf80w7Gr5eSDjEKcDAq8fAG/LSKFWJN
        LCuuzD3EKMHBrCTCu3WHZawQb0piZVVqUX58UWlOavEhRmkOFiVx3mqGB9FCAumJJanZqakF
        qUUwWSYOTqkGRodNDr8CL5xjt5jYy7ilIelfQ80ftjebbF7mGPr5Oa+NmHTty+0p53QmTrzD
        361W4VDIdensbGFbnvxVPH+l3l02C204PK3kVbTzl2lvfvRtXnArQado+olb1num9GY5/727
        Tc8rjSFJ2ttlUuaOoqqe7ZkJDFIvbetn7mw/JHvuKIuLXeEuESWW4oxEQy3mouJEAIJ6FdMq
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7pNItaxBnfeMlpc+fqezeJE3wdW
        ixU/tzJa/Nw1j8WBxWPnrLvsHve7jzN5LJl2lc3j8ya5AJYoPZui/NKSVIWM/OISW6VoQwsj
        PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYy2W+uZCqZJVvxc+IapgXG7SBcjB4eE
        gInEnkMGXYxcHEICSxklNh57yQwRl5E4vr6si5ETyBSW+HOtiw2i5jWjxPnTB5lAEsIC7hKL
        mt4ygtgiAsoSx89fYwWxmQVyJXo2b2eFaNjJKPHqwxywBJuAlcTE9lVgDbwCdhLts2+ygdgs
        AqoS21b9ZQGxRQUiJM68X8ECUSMocXLmEzCbU8BIYuHNvcwQC9Ql/sy7BGWLS9x6Mp8JwpaX
        2P52DvMERqFZSNpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQJjadux
        n5t3MF7aGHyIUYCDUYmHN+CnVawQa2JZcWXuIUYJDmYlEd6tOyxjhXhTEiurUovy44tKc1KL
        DzGaAj03kVlKNDkfGOd5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4
        pRoYberDJleUPGY4fJtjtnzStrtnFpj9+7tgUmpM1ZM5DK07sv22KRTzLXz8XODSxMp4k/CL
        JXf57+29caN2ypPtr1163tYrhHEsOH5G48szoYq36zXYHk64LlFdo7rux4Rlv5nvv5dcxrur
        Ki98huiFtJ4upbTFD/odO+Wkcj+cebCgkV9Hm2ubqhJLcUaioRZzUXEiAAzYWsq7AgAA
X-CMS-MailID: 20190726145602eucas1p10c5b58e0cc5bdf499eaea4ada620eefc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190726113631epcas1p4159fcc746f1409b6b16c7912968b65d2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190726113631epcas1p4159fcc746f1409b6b16c7912968b65d2
References: <20190726101849.27322-1-thierry.reding@gmail.com>
        <CGME20190726113631epcas1p4159fcc746f1409b6b16c7912968b65d2@epcas1p4.samsung.com>
        <20190726113625.GC20065@ravnborg.org>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


Hi Sam,

On 7/26/19 1:36 PM, Sam Ravnborg wrote:
> Hi Thierry.
> 
> On Fri, Jul 26, 2019 at 12:18:49PM +0200, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Failing to find a panel-timing node is not an error in all cases, so do
>> not output an error message in that case. Instead turn it into a debug
>> message and make the drivers that care about it output an error message
>> of their own.
> 
> This is more or less the same as already implmented by Douglas here:
> https://patchwork.kernel.org/cover/11053243/
> 
> Doug's has an extra bug-fix that we shall not miss.
> 
> I am waiting for feedback from Bartlomiej before proceeding.

The patchset is in drm-misc-next tree now.

> I guess he is on holiday somewhere and will return soon.

I wish it was the case. ;-)

I've just been busy with other things (the patchset has been posted
just few days ago and the issue addressed is not critical).

PS When I go on holidays I set automatic out of office reply and
also announce it on the mailing-list (for longer holidays).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> 	Sam
> 
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  drivers/gpu/drm/panel/panel-lvds.c | 4 +++-
>>  drivers/video/fbdev/amba-clcd.c    | 4 +++-
>>  drivers/video/of_display_timing.c  | 2 +-
>>  3 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
>> index 1ec57d0806a8..7fcb3527c788 100644
>> --- a/drivers/gpu/drm/panel/panel-lvds.c
>> +++ b/drivers/gpu/drm/panel/panel-lvds.c
>> @@ -147,8 +147,10 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
>>  	int ret;
>>  
>>  	ret = of_get_display_timing(np, "panel-timing", &timing);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>> +		dev_err(lvds->dev, "%pOF: could not find panel timing\n", np);
>>  		return ret;
>> +	}
>>  
>>  	videomode_from_timing(&timing, &lvds->video_mode);
>>  
>> diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
>> index 89324e42a033..13df898a3481 100644
>> --- a/drivers/video/fbdev/amba-clcd.c
>> +++ b/drivers/video/fbdev/amba-clcd.c
>> @@ -561,8 +561,10 @@ static int clcdfb_of_get_dpi_panel_mode(struct device_node *node,
>>  	struct videomode video;
>>  
>>  	err = of_get_display_timing(node, "panel-timing", &timing);
>> -	if (err)
>> +	if (err) {
>> +		pr_err("%pOF: could not find panel timing\n", node);
>>  		return err;
>> +	}
>>  
>>  	videomode_from_timing(&timing, &video);
>>  
>> diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
>> index f5c1c469c0af..9385b518349f 100644
>> --- a/drivers/video/of_display_timing.c
>> +++ b/drivers/video/of_display_timing.c
>> @@ -125,7 +125,7 @@ int of_get_display_timing(const struct device_node *np, const char *name,
>>  
>>  	timing_np = of_get_child_by_name(np, name);
>>  	if (!timing_np) {
>> -		pr_err("%pOF: could not find node '%s'\n", np, name);
>> +		pr_debug("%pOF: could not find node '%s'\n", np, name);
>>  		return -ENOENT;
>>  	}
>>  
>> -- 
>> 2.22.0

