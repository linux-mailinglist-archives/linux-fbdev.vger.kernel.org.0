Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E651B250F
	for <lists+linux-fbdev@lfdr.de>; Tue, 21 Apr 2020 13:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbgDUL0w (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 21 Apr 2020 07:26:52 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33878 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgDUL0w (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 21 Apr 2020 07:26:52 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03LBQiXX104324;
        Tue, 21 Apr 2020 06:26:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587468404;
        bh=tYSeyWOgZP3F2npipjcx+5fp+xKZiO2CSLKtiPPcHxo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=HkmbkUp9/SCzdhJwk2DVVdBh5dZ2rpROq0vJyRDS+03gRGbcSPtfpigYF+haI8LIh
         R91lVY+mLuGyEBVmIqZeVqwJP/2l3xOie5Sahpvj8og0egGhgxPZg2Jwdi6uL9dpDB
         JokOhGsCc+iKRnJaYB1lloPYR5niLkhgjKYm3cv4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03LBQiJ7100811
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Apr 2020 06:26:44 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Apr 2020 06:26:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Apr 2020 06:26:43 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03LBQgdN056637;
        Tue, 21 Apr 2020 06:26:42 -0500
Subject: Re: [PATCH 5/5] backlight: led_bl: rewrite led_bl_parse_levels()
To:     Daniel Thompson <daniel.thompson@linaro.org>
CC:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-5-tomi.valkeinen@ti.com>
 <20200420160154.4xxv37fofx37ow7q@holly.lan>
 <2233a194-bc8e-99ba-d302-edd087a3adfa@ti.com>
 <20200421104812.kgsdgv2r7bu7iqhe@holly.lan>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0c7d02aa-db51-1c6f-e126-88472db4345b@ti.com>
Date:   Tue, 21 Apr 2020 14:26:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421104812.kgsdgv2r7bu7iqhe@holly.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 21/04/2020 13:48, Daniel Thompson wrote:
> On Tue, Apr 21, 2020 at 08:52:02AM +0300, Tomi Valkeinen wrote:
>> On 20/04/2020 19:01, Daniel Thompson wrote:
>>> On Fri, Apr 17, 2020 at 02:33:12PM +0300, Tomi Valkeinen wrote:
>>>> led_bl_parse_levels() is rather difficult to follow. Rewrite it with a
>>>> more obvious code flow.
>>>
>>> ... that introduces new behaviour.
>>>
>>> There's a couple of new behaviours here but the one that particular
>>> attracted my attention is the disregarding the "default-brightness-level" if
>>> there is no table. That looks like a bug to me.
>>
>> I think the previous behavior was a (minor) bug: how can there be default
>> brightness level if there are no brightness levels?
> 
> I don't think this was a bug.
> 
> If there is no brightness table then backlight will adopt a 1:1 mapping
> versus the underlying LED meaning the concept of default brightness
> applies equally well whether or not a brightness table is supplied.
> 
> 
>> The led-backlight.txt is
>> a bit lacking (another thing to improve...) but led-backlight mimics
>> pwm-backlight, and pwm-backlight.txt says
>>
>> default-brightness-level: The default brightness level (index into the array
>> defined by the "brightness-levels" property)
> 
> I think this implies we should improve the binding documentation!
> 
> The parenthetic text's main purpose is to make clear which scale should
> be used when interpreting the default brightness. Just because the scale
> is 1:1 doesn't render it meaningless.

If I read pwm_bl.c right, that's not how the code works. If pwm_bl has no 'brightness-levels', then 
'default-brightness-level' is ignored. Which matches the binding documentation.

What you suggest makes sense, though, so I can adjust this patch to make led_bl behave like that.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
