Return-Path: <linux-fbdev+bounces-3229-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AECD995139
	for <lists+linux-fbdev@lfdr.de>; Tue,  8 Oct 2024 16:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4A741C230B3
	for <lists+linux-fbdev@lfdr.de>; Tue,  8 Oct 2024 14:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07861DF995;
	Tue,  8 Oct 2024 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gR3/uvqX"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F041DF978
	for <linux-fbdev@vger.kernel.org>; Tue,  8 Oct 2024 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396925; cv=none; b=uLFGp8yJcbJiWQyBSeqIG2Kxvzpo4ockJQkwYVMbulzaO0noIa1491ydCpirVvULo1plcBOSncztORVFLhxD9mt6yWoXQgpGRgADvc7OXRiPhGVSg91WnrO8cBa/gHgCbaMdnIGr3ds69cSssQ9qTqFRXKzESXxohb1h71YoY8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396925; c=relaxed/simple;
	bh=CqreoEFhCQFdVZYvfxwSzFz7kcPrc8UoGAIbyX317wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3YiAs6UAwbMt09iCGOfJoJEKFDjKXnmghl5DasUReeMm634gggYfIKe4t77/KFqfOn4w2GU2BV5zj6S327rI9zjVYrGA9efOdvXbKizn3jbj4nGIg2LoMB95Z7T3PmKKlUlOQRMvSpWF81iVR2sahfHojaMB+fjyuNY6rQEsXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gR3/uvqX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so58867145e9.1
        for <linux-fbdev@vger.kernel.org>; Tue, 08 Oct 2024 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728396922; x=1729001722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbHZZTOAhsp8JBOuMrZ0YxXm19FoPjC7YvWjJGqNBfs=;
        b=gR3/uvqXZie4pTVIqfxySbbtK6FOWWc/p3GNkJFD+4nmiCDD1VU2NH5wr/TMr8ZfHE
         fsR/dAbLrnURXQejXr1k2BNzP409L7y84mWLLoaBZlgatNcgN0X1PKdE03uHruaFKg7P
         341ODkzxhSqd+BDUOLgUxoS1risk8dWRWXLPbGCsdIwWXuQwoGswrjhlrI81+iVT5EG0
         F3BLYjdsGz/J40YM2kAI1boHeD2GY8ZHO5ukioRvRYI6ZrxVcHqT9fhN7PDWNugvyYxm
         KSSUubHJ3Su7I8mz2SnXNd27zGlzDXR2yDbnWJCx7pNOJEHMtIhXLtxyh2cB8nrroGot
         w9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396922; x=1729001722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YbHZZTOAhsp8JBOuMrZ0YxXm19FoPjC7YvWjJGqNBfs=;
        b=EaoTNVxgZwxvzkcwCcd0WHE5zVcRTRLuPKnr1nXpmvJgC5St2I6v/1BkubKXjWosTn
         +gewHuQnnuhiw5Lazs4ukS1Ihc8MxIDA2Vf+yH164gPxgPJrvIcGfPK9LCTJyoTOMxN6
         CzpdgR5UkmKqGFrZuabN2fHMGTY/XvNRN9BIybXODSRRHcN/IMHMm7nmZHI11xz5cxYw
         WO7n8o/c6oNc5aKtdbB/fTAhDbqCE2KtGoMz5Y5svjvwjcYxYwWlrrFHW0JSpmGJZLnU
         9wwsAnqyEFCte6288vLOc9E+JP2if6aHOLd+DXJE0ZHUPcxuXYrWS5H54Gp2U7O07q9h
         jeDw==
X-Forwarded-Encrypted: i=1; AJvYcCU4cX/eOLZD1Zeansl3P6n75fd1A6H4P6tZDSW2XyA+UzH5lDVinR3yCzHV/n6d7lhsL5PY40le8NdajQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfFiFawHgZW4e/7Xp6HG1rHq11d3bbfepWrxdQot0iglFTDCV0
	gozMx7gYolHGsjQklf1DCwSECyOOkclcDogy1ko7YyXt3/FHiRD5iaqsCF8sTs8=
X-Google-Smtp-Source: AGHT+IEoQhbVmmbQMTTmc9qQqvTZ3+3Kk0Hi9yFcuaSu4B+QxOUVAbfHqw2zbJ89+CJkgxBFZGPM1A==
X-Received: by 2002:a05:600c:450f:b0:42f:7ed4:4c26 with SMTP id 5b1f17b1804b1-42f8818577amr96674785e9.12.1728396921317;
        Tue, 08 Oct 2024 07:15:21 -0700 (PDT)
Received: from ?IPV6:2a04:cec2:a:a540:2f11:ef35:cca2:1960? ([2a04:cec2:a:a540:2f11:ef35:cca2:1960])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f8d133b73sm97911835e9.9.2024.10.08.07.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 07:15:20 -0700 (PDT)
Message-ID: <ac765343-7804-4bd5-8057-d67fec2f17b1@baylibre.com>
Date: Tue, 8 Oct 2024 16:15:19 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] iio: adc: ad7606: Add iio-backend support
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 aardelean@baylibre.com, dlechner@baylibre.com,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20241004-ad7606_add_iio_backend_support-v3-0-38757012ce82@baylibre.com>
 <20241004-ad7606_add_iio_backend_support-v3-9-38757012ce82@baylibre.com>
 <20241005125318.0c4a7bc8@jic23-huawei>
Content-Language: en-US
From: Guillaume Stols <gstols@baylibre.com>
In-Reply-To: <20241005125318.0c4a7bc8@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/5/24 13:53, Jonathan Cameron wrote:
> On Fri, 04 Oct 2024 21:48:43 +0000
> Guillaume Stols <gstols@baylibre.com> wrote:
>
>> - Basic support for iio backend.
>> - Supports IIO_CHAN_INFO_SAMP_FREQ R/W.
>> - Only hardware mode is available, and that IIO_CHAN_INFO_RAW is not
>>    supported if iio-backend mode is selected.
> I don't much like the trivial window between this patch and the next
> where the emulated mode is still there but the sleeps aren't adapting with sampling frequency.
>
> Maybe it's worth a dance of leaving the write_raw support
> until after this one so the frequency remains fixed until after
> the fsleep(2) calls are gone?
>
> There is another bit that I'm unsure is technically correct until after
> the next patch.  Maybe I'm reading the diff wrong though!
>
> Thanks,
>
> J
>
>> Signed-off-by: Guillaume Stols <gstols@baylibre.com>
>> ---
>>   drivers/iio/adc/Kconfig      |   2 +
>>   drivers/iio/adc/ad7606.c     | 124 +++++++++++++++++++++++++++++++++++++------
>>   drivers/iio/adc/ad7606.h     |  15 ++++++
>>   drivers/iio/adc/ad7606_par.c |  94 +++++++++++++++++++++++++++++++-
>>   4 files changed, 219 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
>> index 4ab1a3092d88..9b52d5b2c592 100644
>> --- a/drivers/iio/adc/Kconfig
>> +++ b/drivers/iio/adc/Kconfig
>> @@ -224,9 +224,11 @@ config AD7606_IFACE_PARALLEL
>>   	tristate "Analog Devices AD7606 ADC driver with parallel interface support"
>>   	depends on HAS_IOPORT
>>   	select AD7606
>> +	select IIO_BACKEND
>>   	help
>>   	  Say yes here to build parallel interface support for Analog Devices:
>>   	  ad7605-4, ad7606, ad7606-6, ad7606-4 analog to digital converters (ADC).
>> +	  It also support iio_backended devices for AD7606B.
>>   
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called ad7606_par.
>> diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
>> index 3666a58f8a6f..d86eb7c3e4f7 100644
>> --- a/drivers/iio/adc/ad7606.c
>> +++ b/drivers/iio/adc/ad7606.c
>> @@ -21,6 +21,7 @@
>> @@ -737,6 +773,10 @@ static int ad7606_write_raw(struct iio_dev *indio_dev,
>>   			return ret;
>>   
>>   		return 0;
>> +	case IIO_CHAN_INFO_SAMP_FREQ:
>> +		if (val < 0 && val2 != 0)
>> +			return -EINVAL;
>> +		return ad7606_set_sampling_freq(st, val);
> Currently I think  for the !backend + pwm case this can go out of
> range for which that code works (fsleep removed in next patch).
> Perhaps delay adding this until after that patch.

Hi Jonathan,

The sampling frequency can be adjusted only for the backend version, 
otherwise (including pwm+interrupt), there is no sysfs access to the 
sampling frequency (only available for AD7606_BI_CHANNEL).

>>   	default:
>>   		return -EINVAL;
>>   	}
>> @@ -1108,7 +1186,24 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
>>   					       st->cnvst_pwm);
>>   		if (ret)
>>   			return ret;
>> +	}
>> +
>> +	if (st->bops->iio_backend_config) {
>> +		/*
>> +		 * If there is a backend, the PWM should not overpass the maximum sampling
>> +		 * frequency the chip supports.
>> +		 */
>> +		ret = ad7606_set_sampling_freq(st,
>> +					       chip_info->max_samplerate ? : 2 * KILO);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = st->bops->iio_backend_config(dev, indio_dev);
>> +		if (ret)
>> +			return ret;
>> +		indio_dev->setup_ops = &ad7606_pwm_buffer_ops;
>>   	} else {
>> +		init_completion(&st->completion);
>>   		st->trig = devm_iio_trigger_alloc(dev, "%s-dev%d",
>>   						  indio_dev->name,
>>   						  iio_device_id(indio_dev));
> It's a little hard to unwind the patches, but this was previously in the !pwm case.
> At this point in the series we still allow the pwm case to work with ! backend.
> So is this now running in that case?   Do we need a temporary additional check
> on !pwm

mmm actually this should not be in a condition in the PWM  patch. Will 
fix this directly there.

>
>
>> @@ -1126,15 +1221,14 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
>>   						      &ad7606_buffer_ops);
>>   		if (ret)
>>   			return ret;
>> +		ret = devm_request_threaded_irq(dev, irq,
>> +						NULL,
>> +						&ad7606_interrupt,
>> +						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>> +						chip_info->name, indio_dev);
>> +		if (ret)
>> +			return ret;
>>   	}
>> -	ret = devm_request_threaded_irq(dev, irq,
>> -					NULL,
>> -					&ad7606_interrupt,
>> -					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>> -					chip_info->name, indio_dev);
>> -	if (ret)
>> -		return ret;
>> -
>>   	return devm_iio_device_register(dev, indio_dev);
>>   }
>>   EXPORT_SYMBOL_NS_GPL(ad7606_probe, IIO_AD7606);
>> diff --git a/drivers/iio/adc/ad7606_par.c b/drivers/iio/adc/ad7606_par.c
>> index b87be2f1ca04..6042f6799272 100644
>> --- a/drivers/iio/adc/ad7606_par.c
>> +++ b/drivers/iio/adc/ad7606_par.c
>> @@ -2,7 +2,8 @@
>> +
>> +static int ad7606_bi_setup_iio_backend(struct device *dev, struct iio_dev *indio_dev)
>> +{
>> +	struct ad7606_state *st = iio_priv(indio_dev);
>> +	unsigned int ret, c;
>> +	struct iio_backend_data_fmt data = {
>> +		.sign_extend = true,
>> +		.enable = true,
>> +	};
>> +
>> +	st->back = devm_iio_backend_get(dev, NULL);
>> +	if (IS_ERR(st->back))
>> +		return PTR_ERR(st->back);
>> +
>> +	/* If the device is iio_backend powered the PWM is mandatory */
>> +	if (!st->cnvst_pwm)
>> +		return dev_err_probe(st->dev, -EINVAL,
>> +				     "A PWM is mandatory when using backend.\n");
>> +
>> +	ret = devm_iio_backend_request_buffer(dev, st->back, indio_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_iio_backend_enable(dev, st->back);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (c = 0; c < indio_dev->num_channels; c++) {
>> +		ret = iio_backend_data_format_set(st->back, c, &data);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	indio_dev->channels = ad7606b_bi_channels;
> Ultimately this may want to move into the chip_info structures as more devices are added
> but this is fine for now I suppose.
Will do this in a next series where support is added for the other chips.
>
>> +	indio_dev->num_channels = 8;
>> +
>> +	return 0;
>> +}

