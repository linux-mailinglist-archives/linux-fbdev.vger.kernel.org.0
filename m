Return-Path: <linux-fbdev+bounces-3112-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE39847DE
	for <lists+linux-fbdev@lfdr.de>; Tue, 24 Sep 2024 16:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01455285E6F
	for <lists+linux-fbdev@lfdr.de>; Tue, 24 Sep 2024 14:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8201AAE24;
	Tue, 24 Sep 2024 14:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="U7rY0Xzx"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847371AAE1C
	for <linux-fbdev@vger.kernel.org>; Tue, 24 Sep 2024 14:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727188917; cv=none; b=S2cJHM+9xrkQ7VD1lhc45O9nHu7luBb5lYT0TiBEMfIZTlHnC8hR8zdOANxxEgyThmw8y/9uDhd8CnJF0X4pFCzVmdYW/I9ZN8caNM28Mw2yOpI2Tzhgm49HP1oX7bALMJ8MrvJ1Zy3cn82ZzdCCKhmnoaq4RK+af/u/d9shXWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727188917; c=relaxed/simple;
	bh=bYB6sGjl6OVpPbQmVT28nlrtD0q2IZNJFbiVeu2P4QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVWJSe6VdHYIDvZdYbWTtqSSQWCD5Bxjc3NWnCCytRPC3aV038v/e07xn4ITQxJ7U0lxQ/qedBYwcSHPP4TR1EZyIWXYRLoAeR7nvtnEDbymsD9O3SSVgXoKyQ0+TA7SXzCpG1dQUBe++w9ASDsqCpE1M+EKO6CjW9L/UTCBDDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=U7rY0Xzx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374bfc395a5so3639514f8f.0
        for <linux-fbdev@vger.kernel.org>; Tue, 24 Sep 2024 07:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727188913; x=1727793713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZI5U1pschJSs8BzcO25TabRksZf6E5sGIBvFGZUMG4=;
        b=U7rY0Xzxp5qUIBOHjB/KdjSy3pXBs3ONP+ht5a10bxfEKmXJil3IUiDN2rFkI7/Sn3
         7qOo7+xJQW+7MAx0V+JN5pxhuIfGpWtJ50Lqi8DZ7MkIBImuuGBJ8xPnIBxctUlcLHUa
         RCtgPr0ffBa0Lht9k7IEHLhkEiEcWArJYtZ3ksZlo10WtVczlnVb9U6xMtsOCyClpH7L
         iFBKsbjAcjg3znnby1b913MDatxzoOUqK6BYt/bxI2MOXCccowlIBwLK5zDuHzn3MPMW
         4ANueQs0HtrxXcz3Ojy2wBdmkVIGdmRpSyDF0YjTupzyYuyFHASj9csHlx5lsPu+QkSk
         Z5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727188913; x=1727793713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZI5U1pschJSs8BzcO25TabRksZf6E5sGIBvFGZUMG4=;
        b=wrmeoMk69bjn0MeuKZQJGZTH8vVOLr4zXOwbf//B4M5E8Q1sgj9FNiTqiIZOMMrhLA
         1Vqdvu/o0m/iFKi+gWsIrLmV1eByf+Rzs3lfI8ee+MayOHaVSqSDii1tTupyO0vS2wVz
         5foshSCD4YQIOk5e/rMmJbh0wMK5vb092qJRR4PARTYmJEVjhnGc4+jKT9SPIE8ZfW+4
         5ME+XJSh7Kkj6JBKH4eZU7a1H68tIl+b2Qc6Yy+noJ/4POTGYjx/zizvHrhE2i3otiAD
         HFymENT44+kNzDYT+7CZXnAmRH/CvoDd1T/IMlxsW1wTfuzoJ+2vXhAMc0Aqt244FEay
         CuZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK+1V4WK5XqWeFBpCaCGRDFQXHag9n9ThCOX+JKR6kKzeTAusbJKLjLfJtrZVSx1nA/WbxNgoN26IMCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqmnXjisQqRFbAc08soOJR0ehsX9BHynwrEkQ9tMQG5mzpo3Ah
	eGU/gD/t1b9Itqwo35awsNfniZz0KYcstZxWxve68i89b95HJz7hVNPjJGXHvNI=
X-Google-Smtp-Source: AGHT+IE54V4mWS0E1fGBaRhuYszEux79BQYQMRS6jlkq3ZgzaXmmKTdVDlYlx0Pt83jGSNgZCcuilQ==
X-Received: by 2002:adf:a193:0:b0:374:cb84:13d3 with SMTP id ffacd0b85a97d-37c7ebab09bmr2110323f8f.12.1727188912452;
        Tue, 24 Sep 2024 07:41:52 -0700 (PDT)
Received: from [10.2.5.161] (amontpellier-556-1-151-252.w109-210.abo.wanadoo.fr. [109.210.7.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e90291ebbsm24907615e9.10.2024.09.24.07.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 07:41:52 -0700 (PDT)
Message-ID: <56090167-15a0-4386-89a6-c379d70faae6@baylibre.com>
Date: Tue, 24 Sep 2024 16:41:50 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] dt-bindings: iio: adc: ad7606: Make corrections
 on spi conditions
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 aardelean@baylibre.com, dlechner@baylibre.com, jstephan@baylibre.com
References: <20240920-ad7606_add_iio_backend_support-v2-0-0e78782ae7d0@baylibre.com>
 <20240920-ad7606_add_iio_backend_support-v2-2-0e78782ae7d0@baylibre.com>
 <20240921-playgroup-regally-f26c17be26dc@spud>
Content-Language: en-US
From: Guillaume Stols <gstols@baylibre.com>
In-Reply-To: <20240921-playgroup-regally-f26c17be26dc@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/21/24 23:55, Conor Dooley wrote:
> On Fri, Sep 20, 2024 at 05:33:22PM +0000, Guillaume Stols wrote:
>> The SPI conditions are not always required, because there is also a
>> parallel interface. The way used to detect that the SPI interface is
>> used is to check if the reg value is between 0 and 256.
> And, yaknow, not that the bus you're on is a spi bus? I don't think this
> comment is relevant to the binding, especially given you have a property
> for it.

Apologies, I missed to change the commit message, it will be fixed in 
the next series.

Since Jonathan did not like very much inferring the interface with the 
reg's value that I used i the previous verison, I introduced this flag.

However this is only intended to be use in bindings, to determine 
whether or not spi properties should be added.

In the driver side of things, the bus interface is inferred by the 
parent's node (SPI driver is an module_spi_driver while parallel driver 
is module_platform_driver).

>
>> There is also a correction on the spi-cpha that is not required when SPI
>> interface is selected, while spi-cpol is.
> I don't see this change in your patch, there's no cpha in the before.
>
Again a problem with the commit message, this belongs now to another commit.
>> Signed-off-by: Guillaume Stols <gstols@baylibre.com>
>> ---
>>   .../devicetree/bindings/iio/adc/adi,ad7606.yaml      | 20 +++++++++++++++++---
>>   1 file changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
>> index 75334a033539..12995ebcddc2 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
>> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
>> @@ -112,18 +112,32 @@ properties:
>>         assumed that the pins are hardwired to VDD.
>>       type: boolean
>>   
>> +  parallel-interface:
>> +    description:
>> +      If the parallel interface is used, be it directly or through a backend,
>> +      this property must be defined.
>> +    type: boolean
> The type you would want here is actually "flag", but I'm not sure why a
> property is needed. If you're using the parallel interface, why would
> you still be on a spi bus? I think I'm a bit confused here as to how
> this interface is supposed to be used.
>
> Thanks,
> Conor.
>
>> +
>>   required:
>>     - compatible
>>     - reg
>> -  - spi-cpol
>>     - avcc-supply
>>     - vdrive-supply
>>     - interrupts
>>     - adi,conversion-start-gpios
>>   
>> -allOf:
>> -  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>> +oneOf:
>> +  - required:
>> +      - parallel-interface
>> +  - allOf:
>> +      - properties:
>> +          parallel-interface: false
>> +          spi-cpol: true
>> +      - $ref: /schemas/spi/spi-peripheral-props.yaml#
>> +      - required:
>> +          - spi-cpol
>>   
>> +allOf:
>>     - if:
>>         properties:
>>           compatible:
>>
>> -- 
>> 2.34.1
>>

