Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFF4D103DE4
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 Nov 2019 16:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbfKTPEV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 20 Nov 2019 10:04:21 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:57579 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbfKTPEV (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 20 Nov 2019 10:04:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:To:From:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1OVuAFWz7RQebHm+a+UrYAis22Cptt6u8aV1ZyfKVxE=; b=rQ2zotLhwLql8hnyr97jrbwvHH
        i6vSNykoscOUVtBgYvK9WLIEzaw4WcfZQzvDWwbhLJZ6Uv6IXKwq6Nl45U/9Z6JM5QyLsTo+9EzIo
        ad4OKx2zF8bzW+V2y+BjW4YsoxcXMgR2xL6+lCLKiplrSG7a3U9dhkStdHfl4C/5tcWvBMhdUJi1y
        LmgI5W8+30krKhEj3+6PKzSJVcfPkRtFrZhb36fe7kTR8Larcy9BVnc/G33jg6JXCDvqcBUUxTASy
        KvR4AgWXazFqdTpbC4YIGQ0bPgHDNSoCfv6jsdEvwXdWg5qGW+q9/vKbccNXZjbDqr3ed9kxzMof5
        qb/2GrHw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53521 helo=[192.168.10.173])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iXRWl-0003I3-P0; Wed, 20 Nov 2019 16:04:19 +0100
Subject: Re: [PATCH v1 3/5] fbtft: Drop useless #ifdef CONFIG_OF and dead code
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        devel@driverdev.osuosl.org
References: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
 <20191120095716.26628-3-andriy.shevchenko@linux.intel.com>
 <37435de0-873d-d20c-ac66-420ba91356fd@tronnes.org>
Message-ID: <676c3f0e-81b7-d9be-8b37-a38eb3d762fb@tronnes.org>
Date:   Wed, 20 Nov 2019 16:04:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <37435de0-873d-d20c-ac66-420ba91356fd@tronnes.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Den 20.11.2019 15.43, skrev Noralf Trønnes:
> 
> 
> Den 20.11.2019 10.57, skrev Andy Shevchenko:
>> First of all there is no need to guard GPIO request by CONFIG_OF.
>> It works for everybody independently on resource provider. While here,
>> rename the function to reflect the above.
>>
>> Moreover, since we have a global dependency to OF, the rest of
>> conditional compilation is no-op, i.e. it's always be true.
>>
>> Due to above drop useless #ifdef CONFIG_OF and therefore dead code.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>  drivers/staging/fbtft/fbtft-core.c | 19 ++-----------------
>>  1 file changed, 2 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> 
> <snip>
> 
>> @@ -1184,17 +1176,10 @@ static struct fbtft_platform_data *fbtft_probe_dt(struct device *dev)
>>  		pdata->display.backlight = 1;
>>  	if (of_find_property(node, "init", NULL))
>>  		pdata->display.fbtftops.init_display = fbtft_init_display_dt;
>> -	pdata->display.fbtftops.request_gpios = fbtft_request_gpios_dt;
>> +	pdata->display.fbtftops.request_gpios = fbtft_request_gpios;
> 
> You can ditch the .request_gpios callback and call fbtft_request_gpios()
> directly in fbtft_register_framebuffer(). That will make it safe to drop
> the OF dependency, otherwise .request_gpios will be NULL in the non-DT
> case. This is one of the bugs that follwed the gpio refactoring.

Really difficult to read this fbtft code (that I wrote...).
The NULL deref can only happen when dev->platform_data is set. That
can't happen, in mainline at least, now that fbtft_device is gone.

> 
> You can also ditch the .request_gpios_match callback if you want, it
> isn't called anymore (it is set in fb_agm1264k-fl).
> 
> Noralf.
> 
>>  
>>  	return pdata;
>>  }
>> -#else
>> -static struct fbtft_platform_data *fbtft_probe_dt(struct device *dev)
>> -{
>> -	dev_err(dev, "Missing platform data\n");
>> -	return ERR_PTR(-EINVAL);
>> -}
>> -#endif
>>  
>>  /**
>>   * fbtft_probe_common() - Generic device probe() helper function
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
