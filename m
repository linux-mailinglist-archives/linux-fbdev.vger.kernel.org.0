Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A8F1AAA30
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Apr 2020 16:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636638AbgDOOhj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 15 Apr 2020 10:37:39 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50638 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2636602AbgDOOgo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 15 Apr 2020 10:36:44 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200415143639euoutp02c59c1ba70dcde4382b778bd134f8b5aa~GBPwVcWUY0652206522euoutp02R
        for <linux-fbdev@vger.kernel.org>; Wed, 15 Apr 2020 14:36:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200415143639euoutp02c59c1ba70dcde4382b778bd134f8b5aa~GBPwVcWUY0652206522euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1586961399;
        bh=mhVRtpTv1+Rha0ywve760KTm268UKvpvEKCKzEy6wuE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=e4i+YlHrnsKsH82ExM19jFnX0dcJr56NFmlZhC2UlN3Ym+gPUwwMofplAJYynE0Gi
         yKdfjwr1eKBRxr3oasjprDyLc6B+SsfFuolSJ0fW0iRDwXX6ytOoSj1OrkJI67ylVh
         C+4UkBmMDbjq5nuScXWTjkXNjG3yLyz2FFk3DLXE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200415143639eucas1p28d1de8c3f7a18c789164666830370cc2~GBPwGnNtz0681906819eucas1p2O;
        Wed, 15 Apr 2020 14:36:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id ED.69.60679.7FB179E5; Wed, 15
        Apr 2020 15:36:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200415143638eucas1p2139b7a00566464a3a2fa42811569db9c~GBPvq5ao00659306593eucas1p2i;
        Wed, 15 Apr 2020 14:36:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200415143638eusmtrp14bcd3a063a22c8293964cc9567304808~GBPvqUDyH3250832508eusmtrp1X;
        Wed, 15 Apr 2020 14:36:38 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-75-5e971bf71553
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id DF.65.07950.6FB179E5; Wed, 15
        Apr 2020 15:36:38 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200415143638eusmtip269a8ac7662a0f87fed8d4c478c136ada~GBPvYFPnw3120031200eusmtip27;
        Wed, 15 Apr 2020 14:36:38 +0000 (GMT)
Subject: Re: [PATCH v1 1/5] video: ssd1307fb: Convert driver to use
 ->probe_new()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-fbdev@vger.kernel.org, xllacyx@gmail.com,
        dri-devel@lists.freedesktop.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <3f4e53db-e933-b5ba-82fe-2a839ed11a87@samsung.com>
Date:   Wed, 15 Apr 2020 16:36:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200415142018.GH185537@smile.fi.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7rfpafHGfxdyWnR2zSdyeLK1/ds
        Fif6PrBaLFu2ltWBxWPnrLvsHvNOBnrc7z7O5PF5k1wASxSXTUpqTmZZapG+XQJXxsuf/1gL
        PglVbLnYwdzAuJa/i5GTQ0LAROJUzxW2LkYuDiGBFYwS11rnsIMkhAS+MErsni4KkfjMKPGu
        fS0bTMeX029YIIqWAxV9cIMoessocb3nGVA3B4ewQLDEr1NeIDUiAuYS6yYtAutlFgiVWH7q
        G9gCNgEriYntqxhBbF4BO4nJa86BxVkEVCVmvloBVi8qECHx6cFhVogaQYmTM5+A7eUUsJT4
        NH0JC8RMcYlbT+YzQdjyEs1bZzOD3CMhMJld4sz7vSwQR7tIdL5bwgxhC0u8Or6FHcKWkTg9
        uYcFomEdo8TfjhdQ3dsZJZZP/gf1srXEnXO/2EA+YxbQlFi/Sx8i7Cix/XgrI0hYQoBP4sZb
        QYgj+CQmbZvODBHmlehoE4KoVpPYsGwDG8zarp0rmScwKs1C8tosJO/MQvLOLIS9CxhZVjGK
        p5YW56anFhvlpZbrFSfmFpfmpesl5+duYgSmldP/jn/ZwbjrT9IhRgEORiUeXoOX0+KEWBPL
        iitzDzFKcDArifCuz50aJ8SbklhZlVqUH19UmpNafIhRmoNFSZzXeNHLWCGB9MSS1OzU1ILU
        IpgsEwenVAPjjC/z/vtmpOd8fbZgzqbDUo5FIcW1SpvjLF7peDlLfj3A5X5pzp5r6psO+m1+
        s6E4O89iru/caeue/uvK4md9+jXo3oPVm60WV4slHnhzyp/ZZ2Pe3XPsP26ysWx6to0l/dLx
        cpe76T9ONB7yr1mdofcgSdHprPXjJRuZf1ho/d0676rFk0XnGJVYijMSDbWYi4oTAcfaOLIn
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xe7rfpKfHGTxq07DobZrOZHHl63s2
        ixN9H1gtli1by+rA4rFz1l12j3knAz3udx9n8vi8SS6AJUrPpii/tCRVISO/uMRWKdrQwkjP
        0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4+XPf6wFn4QqtlzsYG5gXMvfxcjJISFg
        IvHl9BuWLkYuDiGBpYwSDUeWM3UxcgAlZCSOry+DqBGW+HOtiw2i5jWjRM/G44wgNcICwRK/
        TnmB1IgImEusm7SIDcRmFgiVePKvlRmi/iejRN/0t0wgCTYBK4mJ7asYQWxeATuJyWvOsYPY
        LAKqEjNfrQBrFhWIkDi8YxZUjaDEyZlPWEBsTgFLiU/Tl7BALFCX+DPvEjOELS5x68l8Jghb
        XqJ562zmCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIERtK2
        Yz+37GDsehd8iFGAg1GJh7fj9bQ4IdbEsuLK3EOMEhzMSiK863OnxgnxpiRWVqUW5ccXleak
        Fh9iNAV6biKzlGhyPjDK80riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFx
        cEo1MGo/fzr1ctWFJ0eP3OQwCs7pcpeU1k6vfGI8xYmRJ8PbOeHxiviKR/6TxEyeXDS5/WEd
        n+ol175jSzqVdyr/PX9Pxt7IyGSPY1iWv6H70v+X0sU5JSOOr9Uw/TDxge5FjV3qkq4Xdx/8
        vaHTnnPFv5nfnOQTG1STnrG1KDu6Ocbdz/k1WUH5kxJLcUaioRZzUXEiAP3sEWq6AgAA
X-CMS-MailID: 20200415143638eucas1p2139b7a00566464a3a2fa42811569db9c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200415142020eucas1p2b9c75eee5c24918c3c657386345f0732
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200415142020eucas1p2b9c75eee5c24918c3c657386345f0732
References: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
        <20200330095144.GL1922688@smile.fi.intel.com>
        <CGME20200415142020eucas1p2b9c75eee5c24918c3c657386345f0732@eucas1p2.samsung.com>
        <20200415142018.GH185537@smile.fi.intel.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


[ added dri-devel to Cc: ]

Hi,

On 4/15/20 4:20 PM, Andy Shevchenko wrote:
> On Mon, Mar 30, 2020 at 12:51:44PM +0300, Andy Shevchenko wrote:
>> On Tue, Mar 24, 2020 at 07:05:28PM +0200, Andy Shevchenko wrote:
>>> Use the ->probe_new() callback.
>>>
>>> The driver does not use const struct i2c_device_id * argument,
>>> so convert it to utilise the simplified I²C driver registration.
>>>
>>
>> Bartlomiej, any comments on the series?
> 
> Do I need to do something with the series?

It hasn't been lost :), just handling of fbdev patches posted too
late for v5.7 has been postponed after v5.7-rc1 release.

LGTM after quick look.

I'll review it properly / apply later this week (hopefully tomorrow).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> ---
>>>  drivers/video/fbdev/ssd1307fb.c | 10 ++--------
>>>  1 file changed, 2 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
>>> index 142535267fec..397eae246c2c 100644
>>> --- a/drivers/video/fbdev/ssd1307fb.c
>>> +++ b/drivers/video/fbdev/ssd1307fb.c
>>> @@ -586,8 +586,7 @@ static const struct of_device_id ssd1307fb_of_match[] = {
>>>  };
>>>  MODULE_DEVICE_TABLE(of, ssd1307fb_of_match);
>>>  
>>> -static int ssd1307fb_probe(struct i2c_client *client,
>>> -			   const struct i2c_device_id *id)
>>> +static int ssd1307fb_probe(struct i2c_client *client)
>>>  {
>>>  	struct backlight_device *bl;
>>>  	char bl_name[12];
>>> @@ -599,11 +598,6 @@ static int ssd1307fb_probe(struct i2c_client *client,
>>>  	void *vmem;
>>>  	int ret;
>>>  
>>> -	if (!node) {
>>> -		dev_err(&client->dev, "No device tree data found!\n");
>>> -		return -EINVAL;
>>> -	}
>>> -
>>>  	info = framebuffer_alloc(sizeof(struct ssd1307fb_par), &client->dev);
>>>  	if (!info)
>>>  		return -ENOMEM;
>>> @@ -808,7 +802,7 @@ static const struct i2c_device_id ssd1307fb_i2c_id[] = {
>>>  MODULE_DEVICE_TABLE(i2c, ssd1307fb_i2c_id);
>>>  
>>>  static struct i2c_driver ssd1307fb_driver = {
>>> -	.probe = ssd1307fb_probe,
>>> +	.probe_new = ssd1307fb_probe,
>>>  	.remove = ssd1307fb_remove,
>>>  	.id_table = ssd1307fb_i2c_id,
>>>  	.driver = {
>>> -- 
>>> 2.25.1
>>>
>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko
