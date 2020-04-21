Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7927E1B1E6A
	for <lists+linux-fbdev@lfdr.de>; Tue, 21 Apr 2020 07:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgDUF5K (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 21 Apr 2020 01:57:10 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50972 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgDUF5J (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 21 Apr 2020 01:57:09 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03L5v4Oi024178;
        Tue, 21 Apr 2020 00:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587448625;
        bh=lEPFY3sdNt+zO3O+OUJhUYR9jmgRloBcGSEbsMTsgZM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=bKJhu38sj4KLljzyigvb1UiT3Qbizn561QC5niwZdyH6LfoDkwgZvYJw18MkVhD1z
         UymbNwXYvXyshP9rWbl1LeLVA19PmFbhPvbPJgzF1RuT8i8Ljm2M6aYdfTgzMvmQwI
         MBIZrWZtbR0uj0i+zj7bWL2Uo6DNPQP2zUhE0fbU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03L5v4GM110696;
        Tue, 21 Apr 2020 00:57:04 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Apr 2020 00:57:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Apr 2020 00:57:03 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03L5v2fq040981;
        Tue, 21 Apr 2020 00:57:02 -0500
Subject: Re: [PATCH 4/5] backlight: led_bl: fix led -> backlight brightness
 mapping
To:     Daniel Thompson <daniel.thompson@linaro.org>
CC:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-4-tomi.valkeinen@ti.com>
 <20200420155514.lyb73ujf5fzgpvp4@holly.lan>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f1d217f3-96bf-d24c-43b0-cc98115eae8e@ti.com>
Date:   Tue, 21 Apr 2020 08:57:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420155514.lyb73ujf5fzgpvp4@holly.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 20/04/2020 18:55, Daniel Thompson wrote:
> On Fri, Apr 17, 2020 at 02:33:11PM +0300, Tomi Valkeinen wrote:
>> The code that maps the LED default brightness to backlight levels has
>> two issues: 1) if the default brightness is the first backlight level
>> (usually 0), the code fails to find it, and 2) when the code fails to
>> find a backlight level, it ends up using max_brightness + 1 as the
>> default brightness.
>>
>> Fix these two issues.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>   drivers/video/backlight/led_bl.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
>> index 63693c4f0883..021b5edd895c 100644
>> --- a/drivers/video/backlight/led_bl.c
>> +++ b/drivers/video/backlight/led_bl.c
>> @@ -159,10 +159,11 @@ static int led_bl_parse_levels(struct device *dev,
>>   		 */
>>   		db = priv->default_brightness;
>>   		for (i = 0 ; i < num_levels; i++) {
>> -			if ((i && db > levels[i - 1]) && db <= levels[i])
>> +			if ((i == 0 || db > levels[i - 1]) && db <= levels[i])
>>   				break;
>>   		}
>> -		priv->default_brightness = i;
>> +
>> +		priv->default_brightness = i < num_levels ? i : 0;
> 
> This seems a bit odd. If the LED is currently set to brighter than the
> maximum brightness level why would we choose a default brightness of
> zero?

Indeed, better to set it to max.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
