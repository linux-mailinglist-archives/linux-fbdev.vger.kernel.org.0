Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A90EB4E759
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Jun 2019 13:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfFULvb (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 21 Jun 2019 07:51:31 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45652 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfFULva (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 21 Jun 2019 07:51:30 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190621115128euoutp0218a129ad57172a8138bdc55080da7ec5~qNHLRhFur0852308523euoutp02-
        for <linux-fbdev@vger.kernel.org>; Fri, 21 Jun 2019 11:51:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190621115128euoutp0218a129ad57172a8138bdc55080da7ec5~qNHLRhFur0852308523euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561117888;
        bh=XJeb/E4Wo7LWp+22aVT0OLPeEV+cSszzsoV1+hK0A1w=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=M7XOrK8tswYkOsDKNa3cQU7YYZnDR0HtdlrLDN5ktAgO0JHRh15XMQ0oYQNveWYRW
         vfTc6zGgHgkS8OOh6mZad3ABrp8M8VY394quVj2AeqTyMS/OEcqMg51dieAY8OLTYk
         uE8+sbhQ2yoR7uauJb81FHgx3KKXjtDUgHi/84PY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190621115128eucas1p2a2030f671508005e9ff3f9dd1cef5cd3~qNHK7K_xj0549905499eucas1p29;
        Fri, 21 Jun 2019 11:51:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 40.90.04377.FB4CC0D5; Fri, 21
        Jun 2019 12:51:27 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190621115127eucas1p2048b000ce4cf96a452f7d2fac33a92e3~qNHKFSwKu0099500995eucas1p2e;
        Fri, 21 Jun 2019 11:51:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190621115127eusmtrp28259ffaf7983a1151e7999a603172d51~qNHJ3T6xw2782927829eusmtrp28;
        Fri, 21 Jun 2019 11:51:27 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-65-5d0cc4bf3cb8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 43.BF.04146.EB4CC0D5; Fri, 21
        Jun 2019 12:51:27 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190621115126eusmtip1671e9e7b6ab6f8f1dc7bfbbd393a78f4~qNHJncJHi2698826988eusmtip1H;
        Fri, 21 Jun 2019 11:51:26 +0000 (GMT)
Subject: Re: [PATCH v2] video: fbdev: Fix Warning comparing pointer to 0
 reported by coccicheck
To:     Mathieu Malaterre <malat@debian.org>,
        Shobhit Kukreti <shobhitkukreti@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <35abcd17-fff4-49e7-5331-00354818f9f7@samsung.com>
Date:   Fri, 21 Jun 2019 13:51:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+7wUswkGyBrnbAZrA57PcxTb1jB=dLkv9SYXT05A2fX8Mb0jw@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djPc7r7j/DEGkw6ZWlx5et7NosTfR9Y
        Lc5uestiMXvLPHYHFo9fbXOZPXbOusvucb/7OJPH501yASxRXDYpqTmZZalF+nYJXBlfD+9l
        KpivUHHj6D72BsbFkl2MnBwSAiYSD7/1MnYxcnEICaxglLh07isLhPOFUeJI4wko5zOjxI2z
        j5hhWtacWs0KkVjOKPGru4UdwnnLKNG15xQjSJWwQKLEwukbmUBsEYEwib6ny8C6mQVyJd4t
        fMACYrMJWElMbF8FVs8rYCdxfeUNNhCbRUBV4uqcGewgtqhAhMT9YxtYIWoEJU7OfALWyykQ
        KLF83hQWiJniEreezGeCsOUltr+dwwxykITAdHaJz7cnMUGc7SLxrOM5O4QtLPHq+BYoW0bi
        /06QZpCGdYwSfzteQHVvZ5RYPvkfG0SVtcTh4xeBzuAAWqEpsX6XPkTYUeLznu8sIGEJAT6J
        G28FIY7gk5i0bTozRJhXoqNNCKJaTWLDsg1sMGu7dq5knsCoNAvJa7OQvDMLyTuzEPYuYGRZ
        xSieWlqcm55abJSXWq5XnJhbXJqXrpecn7uJEZheTv87/mUH464/SYcYBTgYlXh4D8zijhVi
        TSwrrsw9xCjBwawkwsuTwxMrxJuSWFmVWpQfX1Sak1p8iFGag0VJnLea4UG0kEB6Yklqdmpq
        QWoRTJaJg1OqgbG246MlZ+P9N0KP5u9zsn9zidlAzibGJlXh8cPVgUl9B6ybNN+vYJkVtv+T
        1pkL3J47FT6cfM0Tn+Zuf1zqzXXHjAgNw0kHjyt+4U2zXKDF4CRqcaT1tNG+LJ+XfNyJUg+v
        MbUffpH67Ey4y/9Lxao2hzp+Z19WVzCb+sRg2n4vPnHjcysVRZRYijMSDbWYi4oTAY9TMI4r
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xu7r7j/DEGvRtY7S48vU9m8WJvg+s
        Fmc3vWWxmL1lHrsDi8evtrnMHjtn3WX3uN99nMnj8ya5AJYoPZui/NKSVIWM/OISW6VoQwsj
        PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYyvh/cyFcxXqLhxdB97A+NiyS5GTg4J
        AROJNadWs3YxcnEICSxllJj/ZwZTFyMHUEJG4vj6MogaYYk/17rYIGpeM0ocPziDFSQhLJAo
        sXD6RiYQW0QgTGL+8xtsIDazQK7El9+XmSEaVjFJfFvSClbEJmAlMbF9FSOIzStgJ3F9JUQD
        i4CqxNU5M9hBbFGBCIkz71ewQNQISpyc+QTM5hQIlFg+bwoLxAJ1iT/zLjFD2OISt57MZ4Kw
        5SW2v53DPIFRaBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwGja
        duzn5h2MlzYGH2IU4GBU4uE9MIs7Vog1say4MvcQowQHs5IIL08OT6wQb0piZVVqUX58UWlO
        avEhRlOg5yYyS4km5wMjPa8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8T
        B6dUA6Nu4cuEurQKy4+uq/7N0vmkcunHT4WXEerss49NfV1c/SWueoazx9ojRrwTRcXkUzzX
        PraVsGU27N/2VTXGO26NuPP78wX3A9IXLN8l8aXu4aFWu4QZD6Jr/nVYOW65t2HXveiZTJpq
        vlqXtp4q9jGLuzxd0szaR0PnZ+LV21UvYgVN+0/ECCmxFGckGmoxFxUnAgAUxImOvAIAAA==
X-CMS-MailID: 20190621115127eucas1p2048b000ce4cf96a452f7d2fac33a92e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190603115729epcas1p40bbcc113fd0813e328a6ffbc464751c4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190603115729epcas1p40bbcc113fd0813e328a6ffbc464751c4
References: <CA+7wUswLsZ7PF6Pi8Oz=9287UYZQeKCFJHP7FDtPf1Cq8PO7ag@mail.gmail.com>
        <1559560752-12314-1-git-send-email-shobhitkukreti@gmail.com>
        <CGME20190603115729epcas1p40bbcc113fd0813e328a6ffbc464751c4@epcas1p4.samsung.com>
        <CA+7wUswkGyBrnbAZrA57PcxTb1jB=dLkv9SYXT05A2fX8Mb0jw@mail.gmail.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 6/3/19 1:57 PM, Mathieu Malaterre wrote:
> On Mon, Jun 3, 2019 at 1:21 PM <shobhitkukreti@gmail.com> wrote:
>>
>> From: Shobhit Kukreti <shobhitkukreti@gmail.com>
>>
>> Fixed Warning Comparing Pointer to 0. Changed return value to -ENOMEM to
>> report kzalloc failure
>>
>> drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
>> drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
>> drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
>>
>> Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>
>> ---
>> Changes in v2:
>>  - Modified commit message to report change in return type
>>
>>  drivers/video/fbdev/controlfb.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
>> index 7af8db2..07907c5 100644
>> --- a/drivers/video/fbdev/controlfb.c
>> +++ b/drivers/video/fbdev/controlfb.c
>> @@ -182,7 +182,7 @@ int init_module(void)
>>         int ret = -ENXIO;
>>
>>         dp = of_find_node_by_name(NULL, "control");
>> -       if (dp != 0 && !control_of_init(dp))
>> +       if (dp != NULL && !control_of_init(dp))
>>                 ret = 0;
>>         of_node_put(dp);
>>
>> @@ -580,7 +580,7 @@ static int __init control_init(void)
>>         control_setup(option);
>>
>>         dp = of_find_node_by_name(NULL, "control");
>> -       if (dp != 0 && !control_of_init(dp))
>> +       if (dp != NULL && !control_of_init(dp))
>>                 ret = 0;
>>         of_node_put(dp);
>>
>> @@ -683,8 +683,8 @@ static int __init control_of_init(struct device_node *dp)
>>                 return -ENXIO;
>>         }
>>         p = kzalloc(sizeof(*p), GFP_KERNEL);
>> -       if (p == 0)
>> -               return -ENXIO;
>> +       if (p == NULL)
> 
> nit: I would have use `!p` (same for the others above). Maybe
> checkpatch with --strict would warn for those (can't remember from top
> of my head).
> 
> Anyway:
> 
> Reviewed-by: Mathieu Malaterre <malat@debian.org>
> 
>> +               return -ENOMEM;
>>         control_fb = p; /* save it for cleanups */
>>
>>         /* Map in frame buffer and registers */
Patch queued (with some fixups, please see below) for v5.3, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


From: Shobhit Kukreti <shobhitkukreti@gmail.com>
Subject: [PATCH] video: fbdev: controlfb: fix warnings about comparing pointer to 0

Fix warnings aboout comparing pointer to 0 reported by coccicheck:

drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0

Also while at it change return value to -ENOMEM on kzalloc() failure.

Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>
Reviewed-by: Mathieu Malaterre <malat@debian.org>
[b.zolnierkie: minor fixups]
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/controlfb.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

Index: b/drivers/video/fbdev/controlfb.c
===================================================================
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -182,7 +182,7 @@ int init_module(void)
 	int ret = -ENXIO;
 
 	dp = of_find_node_by_name(NULL, "control");
-	if (dp != 0 && !control_of_init(dp))
+	if (dp && !control_of_init(dp))
 		ret = 0;
 	of_node_put(dp);
 
@@ -580,7 +580,7 @@ static int __init control_init(void)
 	control_setup(option);
 
 	dp = of_find_node_by_name(NULL, "control");
-	if (dp != 0 && !control_of_init(dp))
+	if (dp && !control_of_init(dp))
 		ret = 0;
 	of_node_put(dp);
 
@@ -683,8 +683,8 @@ static int __init control_of_init(struct
 		return -ENXIO;
 	}
 	p = kzalloc(sizeof(*p), GFP_KERNEL);
-	if (p == 0)
-		return -ENXIO;
+	if (!p)
+		return -ENOMEM;
 	control_fb = p;	/* save it for cleanups */
 
 	/* Map in frame buffer and registers */
