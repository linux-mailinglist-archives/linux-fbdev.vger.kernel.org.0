Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1D50175E8D
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Mar 2020 16:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbgCBPmx (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Mar 2020 10:42:53 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55866 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbgCBPmw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Mar 2020 10:42:52 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200302154251euoutp013766f3573234f9da6313fc518ccd1e1a~4hw-YxWPT1322613226euoutp01O
        for <linux-fbdev@vger.kernel.org>; Mon,  2 Mar 2020 15:42:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200302154251euoutp013766f3573234f9da6313fc518ccd1e1a~4hw-YxWPT1322613226euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583163771;
        bh=ISfEjGRG2c1GOVPbDJd569fNeku4V1R7x7naKZRvJeQ=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=PMH7NFo4auVJXfSq4TUhlFiKc6SjX01pHPIwaJhmEHT7LQJvzc7HVJO8FjTNDV4oe
         DqQRkdh+i/Ou7ZFB4NX3LIggx87mwzQFU7LidAD4fVrmWTRpJHZYwKtlO+dm6D0yAM
         kREOsCoXSlYMcLbSb5mOOVutCigZklzIFOuPB0uc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200302154250eucas1p1d322bfe9c478a61b623dfd1ae6a19170~4hw-Om7Tc0815708157eucas1p1u;
        Mon,  2 Mar 2020 15:42:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 06.D3.60698.A792D5E5; Mon,  2
        Mar 2020 15:42:50 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200302154250eucas1p15969e795b6fbd7bce5beec220b4767b4~4hw_qWMC01686416864eucas1p1n;
        Mon,  2 Mar 2020 15:42:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200302154250eusmtrp1e3d8e38d911c034622f108b8387e8a53~4hw_p0z0H2922329223eusmtrp18;
        Mon,  2 Mar 2020 15:42:50 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-b3-5e5d297abb79
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 6C.20.08375.A792D5E5; Mon,  2
        Mar 2020 15:42:50 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200302154249eusmtip11df1a8f1c0867bbf9832f57365c9ab99~4hw_P5IZn2417824178eusmtip17;
        Mon,  2 Mar 2020 15:42:49 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v1] fbdev: simplefb: Platform data shan't include
 kernel.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-fbdev@vger.kernel.org
Message-ID: <8fe254ee-9dcc-d9d2-dbf5-703edd9da23b@samsung.com>
Date:   Mon, 2 Mar 2020 16:42:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200214180821.GO10400@smile.fi.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduzned0qzdg4g+5ea4vepulMFm+OA4kT
        fR9YHZg95p0M9Hi/7yqbx+dNcgHMUVw2Kak5mWWpRfp2CVwZv9/MYy/Yx10x+c8DxgbGXZxd
        jJwcEgImEqu/vmPuYuTiEBJYwSgx7/5zdgjnC6PEtI33oTKfGSUObX3JBNPy7OF5NojEcqCW
        G++hWt4ySnR1f2UHqWITsJKY2L6KEcQWFgiQOP7sBAuILSIQJ3G8Yx2YzSwgL/H47DugSRwc
        vAJ2Eod+RYCEWQRUJDZsb2IDsUUFIiQ+PTjMCmLzCghKnJz5BKyVU8BCYmZfCxPEGHGJW0/m
        M8GM3P52DtjVEgL/2SQ6nxxmgbjaRWLl7B/MELawxKvjW9ghbBmJ05N7WCAa1jFK/O14AdW9
        nVFi+eR/bBBV1hJ3zv0Cu5RZQFNi/S59iLCjRNucA+wgYQkBPokbbwUhjuCTmLRtOjNEmFei
        o00IolpNYsOyDWwwa7t2rmSewKg0C8lrs5C8MwvJO7MQ9i5gZFnFKJ5aWpybnlpsnJdarlec
        mFtcmpeul5yfu4kRmEZO/zv+dQfjvj9JhxgFOBiVeHgDmGPjhFgTy4orcw8xSnAwK4nw+nJG
        xwnxpiRWVqUW5ccXleakFh9ilOZgURLnNV70MlZIID2xJDU7NbUgtQgmy8TBKdXAmPBA8bHY
        VibuMo3fiRXs2any86+xulmtWPV4/euPW12vLSx+ySBRdG662xuDp5qlSxbwHD522MPYUVJK
        I3FTxpTJq2bvn5q0wje2dY9dMCuPQM36KS5u//bEif9zstkV3K+VuP+lil3JsqMchiHy27fG
        8j2vdXt15U7JSs/UxDUn90nM3W3+QImlOCPRUIu5qDgRAMxH3eEfAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsVy+t/xu7pVmrFxBs+XCln0Nk1nsnhzHEic
        6PvA6sDsMe9koMf7fVfZPD5vkgtgjtKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1
        MjJV0rezSUnNySxLLdK3S9DL+P1mHnvBPu6KyX8eMDYw7uLsYuTkkBAwkXj28DxbFyMXh5DA
        UkaJn9d3ATkcQAkZiePryyBqhCX+XOuCqnnNKHFl0TpmkASbgJXExPZVjCC2sICfRF//DrC4
        iECcROvUFWwgNrOAvMTjs++gmlcxSdxdu4wJZAGvgJ3EoV8RIDUsAioSG7Y3gdWLCkRIHN4x
        C2wmr4CgxMmZT1hAbE4BC4mZfS1MEDPVJf7Mu8QMYYtL3Hoynwlm1/a3c5gnMArNQtI+C0nL
        LCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYNduO/dy8g/HSxuBDjAIcjEo8
        vAHMsXFCrIllxZW5hxglOJiVRHh9OaPjhHhTEiurUovy44tKc1KLDzGaAj03kVlKNDkfGNF5
        JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYbb91vE5cy57y7EaW
        2b20zgs9TFIHVn/RuWl7aqaGg5TaVccPTD4sRzhe6DCHlTZGB0kk7NX/qnbMK4Lz2NvcE/P3
        KXptF8s3irHuqpXcJe83teaAclyRQ4fgQeGHdlJl0lsiL9fM/a/ivuXY1NrXCQ47zy7b19Yu
        zObI9Z7TNYHT7ukKzalKLMUZiYZazEXFiQAtcGfGsAIAAA==
X-CMS-MailID: 20200302154250eucas1p15969e795b6fbd7bce5beec220b4767b4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200214180824eucas1p10d73f1efb026852af25b010f21fcd5ab
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200214180824eucas1p10d73f1efb026852af25b010f21fcd5ab
References: <20200204162114.28937-1-andriy.shevchenko@linux.intel.com>
        <20200214142550.GL10400@smile.fi.intel.com>
        <f33a4921-2b73-66c1-3165-b2e23c9fb2a8@redhat.com>
        <CGME20200214180824eucas1p10d73f1efb026852af25b010f21fcd5ab@eucas1p1.samsung.com>
        <20200214180821.GO10400@smile.fi.intel.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 2/14/20 7:08 PM, Andy Shevchenko wrote:
> On Fri, Feb 14, 2020 at 04:21:57PM +0100, Hans de Goede wrote:
>> On 2/14/20 3:25 PM, Andy Shevchenko wrote:
>>> On Tue, Feb 04, 2020 at 06:21:14PM +0200, Andy Shevchenko wrote:
>>>> Replace with appropriate types.h.
>>>
>>> Hans, any comment on this?
>>
>> Not really, I've not touched that code in a while.
>>
>> But I see I'm still listed as the maintainer, the change looks sensible
>> to me, so:
>>
>> Acked-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks!
> Seems get_maintainer does not list Bart, so, Cc him here.
> 
>>
>>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch queued for v5.7, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

>>>> ---
>>>>   include/linux/platform_data/simplefb.h | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platform_data/simplefb.h
>>>> index 4f733a411d18..ca8337695c2a 100644
>>>> --- a/include/linux/platform_data/simplefb.h
>>>> +++ b/include/linux/platform_data/simplefb.h
>>>> @@ -10,7 +10,7 @@
>>>>   #include <drm/drm_fourcc.h>
>>>>   #include <linux/fb.h>
>>>> -#include <linux/kernel.h>
>>>> +#include <linux/types.h>
>>>>   /* format array, use it to initialize a "struct simplefb_format" array */
>>>>   #define SIMPLEFB_FORMATS \
>>>> -- 
>>>> 2.24.1
