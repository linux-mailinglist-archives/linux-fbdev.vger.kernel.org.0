Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 347D45EB770
	for <lists+linux-fbdev@lfdr.de>; Tue, 27 Sep 2022 04:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiI0CRh (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 26 Sep 2022 22:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiI0CRg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 26 Sep 2022 22:17:36 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C27F578A2
        for <linux-fbdev@vger.kernel.org>; Mon, 26 Sep 2022 19:17:35 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mc39B3Dv7zpSsh;
        Tue, 27 Sep 2022 10:14:38 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 10:17:33 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 10:17:32 +0800
Subject: Re: [PATCH -next v2] backlight: gpio_backlight: Switch to use
 dev_err_probe() helper
To:     Daniel Thompson <daniel.thompson@linaro.org>
CC:     <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <lee@kernel.org>, <jingoohan1@gmail.com>,
        <yangyingliang@huawei.com>
References: <20220926142447.2296872-1-yangyingliang@huawei.com>
 <YzHGEAoodSoamUIM@maple.lan>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <7d8cfce2-ba08-afc0-de2d-972ee15b5865@huawei.com>
Date:   Tue, 27 Sep 2022 10:17:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <YzHGEAoodSoamUIM@maple.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi

On 2022/9/26 23:32, Daniel Thompson wrote:
> On Mon, Sep 26, 2022 at 10:24:47PM +0800, Yang Yingliang wrote:
>> In the probe path, dev_err() can be replaced with dev_err_probe()
>> which will check if error code is -EPROBE_DEFER and prints the
>> error name. It also sets the defer probe reason which can be
>> checked later through debugfs. It's more simple in error path.
>>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>> v2:
>>    Remove "Error: " in error meassage
>> ---
>>   drivers/video/backlight/gpio_backlight.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
>> index 6f78d928f054..4ff3939e5f7e 100644
>> --- a/drivers/video/backlight/gpio_backlight.c
>> +++ b/drivers/video/backlight/gpio_backlight.c
>> @@ -64,13 +64,9 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>>   	def_value = device_property_read_bool(dev, "default-on");
>>
>>   	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
>> -	if (IS_ERR(gbl->gpiod)) {
>> -		ret = PTR_ERR(gbl->gpiod);
>> -		if (ret != -EPROBE_DEFER)
>> -			dev_err(dev,
>> -				"Error: The gpios parameter is missing or invalid.\n");
>> -		return ret;
>> -	}
>> +	if (IS_ERR(gbl->gpiod))
>> +		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
>> +				     "The gpios parameter is missing or invalid.\n");
> Why keep the leading "The " ?
OK, I will remove it in v3.

But you says "the resulting line will read better with a "The " at 
beginning" in your last mail,
I am confused about this.

Thanks,
Yang
>
>
> Daniel.
> .
