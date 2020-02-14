Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52C1D15DAB4
	for <lists+linux-fbdev@lfdr.de>; Fri, 14 Feb 2020 16:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387622AbgBNPWF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 14 Feb 2020 10:22:05 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53377 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387533AbgBNPWF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 14 Feb 2020 10:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581693723;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ViIYXYbx4L1XBFneJrIYnhcCLgHD03pQaTDVMByFkSU=;
        b=BIpvdOWTBHhLX2HhG3azrhXsEeA166UIATn5iRztqvCYM4bwY7+XU/T0IZQ9RMfA341bNi
        IxNrkd0TcqDtgHHperbvSPK7lVEuegxhi9HnLJxiT4JSR+TSB/miPzg4Z1uVXaxzQS7/FT
        Z+9Wa1EukMh3N+Uwv0JFJxSG7r/an80=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-2RBtl4uONKC51IE6td5wAA-1; Fri, 14 Feb 2020 10:22:01 -0500
X-MC-Unique: 2RBtl4uONKC51IE6td5wAA-1
Received: by mail-wm1-f70.google.com with SMTP id y24so4038465wmj.8
        for <linux-fbdev@vger.kernel.org>; Fri, 14 Feb 2020 07:22:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ViIYXYbx4L1XBFneJrIYnhcCLgHD03pQaTDVMByFkSU=;
        b=EqIhxP/MMvJHOLP37ivxwT7OBEfOAhyNXWvN6Pc2JAFmKloMbrRl5tswp3KnoZhRGM
         4pdqgFsg/BmMxn9DfCmTPhfDoRoGCGN0Gcjh8u7I41+cI9NLE4O4RK+MEPhERgPcMF0a
         of8jssWL+3HtVVT13gfE2LUphu/DkaqPFt52czM+8QvK923Pozu7xyStQjl+sgMnLTb8
         fc76layB1+iU2D02FwexiSfNxN4mg09rIl7kzzieuRjZhVEGM4nhiPuFlhq/2uUfMZRp
         RICkkUjQcEJVRcSlnvFacskby17oShiFLIC/w8bItjzNKTmAmKUd7K0z/Cxzp/mGwNVf
         LLjA==
X-Gm-Message-State: APjAAAWUjngGINKekb/6uNvcBQSXewIam0nfBFtIXDEn2OZu6woU1EBb
        TRhDCnMnJKqy3x3B7ocbXxZ/N+bbz4jtfHwgpE8XBp97enkfZr0ommjmBtBVwFjd77wwx14Ytsw
        HVmlNWWF5Y5EKxlMnn5p3YwA=
X-Received: by 2002:a5d:640d:: with SMTP id z13mr4372731wru.181.1581693720220;
        Fri, 14 Feb 2020 07:22:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJhnOqsakup/oRM69XOoggfdoo+dBtiGPAHCNQF4+OJNV0ybr/9h7kzmW/TDPxQ1DLLcBnsA==
X-Received: by 2002:a5d:640d:: with SMTP id z13mr4372719wru.181.1581693720021;
        Fri, 14 Feb 2020 07:22:00 -0800 (PST)
Received: from x1.localdomain ([62.140.137.72])
        by smtp.gmail.com with ESMTPSA id c4sm7669109wml.7.2020.02.14.07.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 07:21:59 -0800 (PST)
Subject: Re: [PATCH v1] fbdev: simplefb: Platform data shan't include kernel.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-fbdev@vger.kernel.org
References: <20200204162114.28937-1-andriy.shevchenko@linux.intel.com>
 <20200214142550.GL10400@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f33a4921-2b73-66c1-3165-b2e23c9fb2a8@redhat.com>
Date:   Fri, 14 Feb 2020 16:21:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214142550.GL10400@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

On 2/14/20 3:25 PM, Andy Shevchenko wrote:
> On Tue, Feb 04, 2020 at 06:21:14PM +0200, Andy Shevchenko wrote:
>> Replace with appropriate types.h.
> 
> Hans, any comment on this?

Not really, I've not touched that code in a while.

But I see I'm still listed as the maintainer, the change looks sensible
to me, so:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>   include/linux/platform_data/simplefb.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platform_data/simplefb.h
>> index 4f733a411d18..ca8337695c2a 100644
>> --- a/include/linux/platform_data/simplefb.h
>> +++ b/include/linux/platform_data/simplefb.h
>> @@ -10,7 +10,7 @@
>>   
>>   #include <drm/drm_fourcc.h>
>>   #include <linux/fb.h>
>> -#include <linux/kernel.h>
>> +#include <linux/types.h>
>>   
>>   /* format array, use it to initialize a "struct simplefb_format" array */
>>   #define SIMPLEFB_FORMATS \
>> -- 
>> 2.24.1
>>
> 

