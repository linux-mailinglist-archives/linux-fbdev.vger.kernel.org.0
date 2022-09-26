Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8381A5EAB15
	for <lists+linux-fbdev@lfdr.de>; Mon, 26 Sep 2022 17:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236539AbiIZPbI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 26 Sep 2022 11:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237365AbiIZPah (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 26 Sep 2022 11:30:37 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B1D2AF9
        for <linux-fbdev@vger.kernel.org>; Mon, 26 Sep 2022 07:16:16 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mbl8w0mzwzpVGb;
        Mon, 26 Sep 2022 22:13:20 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 22:16:14 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 22:16:13 +0800
Subject: Re: [PATCH -next] backlight: gpio_backlight: Switch to use
 dev_err_probe() helper
To:     Daniel Thompson <daniel.thompson@linaro.org>
CC:     <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <lee@kernel.org>, <jingoohan1@gmail.com>,
        <yangyingliang@huawei.com>
References: <20220926133819.1298856-1-yangyingliang@huawei.com>
 <YzGtSPDMQNUf41Z9@maple.lan>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <f98b2e35-0f86-ffd0-db11-ca91930e153f@huawei.com>
Date:   Mon, 26 Sep 2022 22:16:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <YzGtSPDMQNUf41Z9@maple.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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


On 2022/9/26 21:46, Daniel Thompson wrote:
> On Mon, Sep 26, 2022 at 09:38:19PM +0800, Yang Yingliang wrote:
>> In the probe path, dev_err() can be replaced with dev_err_probe()
>> which will check if error code is -EPROBE_DEFER and prints the
>> error name. It also sets the defer probe reason which can be
>> checked later through debugfs. It's more simple in error path.
> Needs an SoB.
>
>
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
>> +				     "Error: The gpios parameter is missing or invalid.\n");
> Remove the "Error: The " from the beginning of the string:
> dev_err_probe() adds an error tag and the resulting line will read
> better with a "The " at the beginning.
OK.

Thanks,
Yang
>
>
> Daniel.
> .
