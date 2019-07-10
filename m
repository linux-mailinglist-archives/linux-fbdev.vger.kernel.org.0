Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 098646445B
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Jul 2019 11:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfGJJ1p (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 10 Jul 2019 05:27:45 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:35954 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfGJJ1p (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 10 Jul 2019 05:27:45 -0400
Received: (qmail 14591 invoked by uid 5089); 10 Jul 2019 09:27:43 -0000
Received: by simscan 1.2.0 ppid: 14516, pid: 14517, t: 0.0683s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 10 Jul 2019 09:27:42 -0000
Subject: Re: BUG: Staging: fbtft: Switch to the gpio descriptor interface
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        thomas.petazzoni@free-electrons.com, devel@driverdev.osuosl.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <3ca02376-631b-d159-7070-7c50403126de@electromag.com.au>
 <907baecff15308988f44220fcb13b28cba742df2.camel@suse.de>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <34678cc1-7d65-813a-c037-cfae4d2728f6@electromag.com.au>
Date:   Wed, 10 Jul 2019 17:27:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <907baecff15308988f44220fcb13b28cba742df2.camel@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 10/07/2019 17:05, Nicolas Saenz Julienne wrote:
> On Wed, 2019-07-10 at 16:31 +0800, Phil Reid wrote:
>> G'day Nishad,
>>
>> I'm just wondering if the commit
>> c440eee1a7a1d0f "Staging: fbtft: Switch to the gpio descriptor interface"
>> was tested on anything.
>>
>> I've had to apply the following patch to get my display functioning again.
>>
>> in particular the devm_gpiod_get_index using dev->driver->name for the gpio
>> lookup seems
>> wrong.
> 
> FYI We've seen the same issue this week in opensuse's bugzilla and was testing
> something very similar to the patch below. Phil do you plan on submitting your
> fix?
> 

Yes I can submit a patch tomorrow.

I just wasn't sure if it was working for anyone.



> 
>> Also I've had to invert the polarity of the reset-gpios in the DT file for the
>> display to function.
>>
>> this code:
>> 	gpiod_set_value_cansleep(par->gpio.reset, 0);
>> 	usleep_range(20, 40);
>> 	gpiod_set_value_cansleep(par->gpio.reset, 1);
>>
>> could be read as deasserting the reset line and then asserting it.
>> So I've had to specify and active high reset line in the DT.
>>
>> Regards
>> Phil
>>
>>
>>
>>
>>
>> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-
>> core.c
>> index 9b07bad..6fe7cb5 100644
>> --- a/drivers/staging/fbtft/fbtft-core.c
>> +++ b/drivers/staging/fbtft/fbtft-core.c
>> @@ -79,18 +79,16 @@ static int fbtft_request_one_gpio(struct fbtft_par *par,
>>    	struct device_node *node = dev->of_node;
>>    	int ret = 0;
>>
>> -	if (of_find_property(node, name, NULL)) {
>> -		*gpiop = devm_gpiod_get_index(dev, dev->driver->name, index,
>> -					      GPIOD_OUT_HIGH);
>> -		if (IS_ERR(*gpiop)) {
>> -			ret = PTR_ERR(*gpiop);
>> -			dev_err(dev,
>> -				"Failed to request %s GPIO:%d\n", name, ret);
>> -			return ret;
>> -		}
>> -		fbtft_par_dbg(DEBUG_REQUEST_GPIOS, par, "%s: '%s' GPIO\n",
>> -			      __func__, name);
>> +	*gpiop = devm_gpiod_get_index_optional(dev, name, index,
>> +				      GPIOD_OUT_HIGH);
>> +	if (IS_ERR(*gpiop)) {
>> +		ret = PTR_ERR(*gpiop);
>> +		dev_err(dev,
>> +			"Failed to request %s GPIO: (%d)\n", name, ret);
>> +		return ret;
>>    	}
>> +	fbtft_par_dbg(DEBUG_REQUEST_GPIOS, par, "%s: '%s' GPIO\n",
>> +		      __func__, name);
>>
>>    	return ret;
>>    }
>> @@ -103,34 +101,34 @@ static int fbtft_request_gpios_dt(struct fbtft_par *par)
>>    	if (!par->info->device->of_node)
>>    		return -EINVAL;
>>
>> -	ret = fbtft_request_one_gpio(par, "reset-gpios", 0, &par->gpio.reset);
>> +	ret = fbtft_request_one_gpio(par, "reset", 0, &par->gpio.reset);
>>    	if (ret)
>>    		return ret;
>> -	ret = fbtft_request_one_gpio(par, "dc-gpios", 0, &par->gpio.dc);
>> +	ret = fbtft_request_one_gpio(par, "dc", 0, &par->gpio.dc);
>>    	if (ret)
>>    		return ret;
>> -	ret = fbtft_request_one_gpio(par, "rd-gpios", 0, &par->gpio.rd);
>> +	ret = fbtft_request_one_gpio(par, "rd", 0, &par->gpio.rd);
>>    	if (ret)
>>    		return ret;
>> -	ret = fbtft_request_one_gpio(par, "wr-gpios", 0, &par->gpio.wr);
>> +	ret = fbtft_request_one_gpio(par, "wr", 0, &par->gpio.wr);
>>    	if (ret)
>>    		return ret;
>> -	ret = fbtft_request_one_gpio(par, "cs-gpios", 0, &par->gpio.cs);
>> +	ret = fbtft_request_one_gpio(par, "cs", 0, &par->gpio.cs);
>>    	if (ret)
>>    		return ret;
>> -	ret = fbtft_request_one_gpio(par, "latch-gpios", 0, &par->gpio.latch);
>> +	ret = fbtft_request_one_gpio(par, "latch", 0, &par->gpio.latch);
>>    	if (ret)
>>    		return ret;
>>    	for (i = 0; i < 16; i++) {
>> -		ret = fbtft_request_one_gpio(par, "db-gpios", i,
>> +		ret = fbtft_request_one_gpio(par, "db", i,
>>    					     &par->gpio.db[i]);
>>    		if (ret)
>>    			return ret;
>> -		ret = fbtft_request_one_gpio(par, "led-gpios", i,
>> +		ret = fbtft_request_one_gpio(par, "led", i,
>>    					     &par->gpio.led[i]);
>>    		if (ret)
>>    			return ret;
>> -		ret = fbtft_request_one_gpio(par, "aux-gpios", i,
>> +		ret = fbtft_request_one_gpio(par, "aux", i,
>>    					     &par->gpio.aux[i]);
>>    		if (ret)
>>    			return ret;
>>
>>
>>


-- 
Regards
Phil Reid
