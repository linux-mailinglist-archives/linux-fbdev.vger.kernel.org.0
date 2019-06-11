Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EABD3CE23
	for <lists+linux-fbdev@lfdr.de>; Tue, 11 Jun 2019 16:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387767AbfFKOL3 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 11 Jun 2019 10:11:29 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53131 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387486AbfFKOL3 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 11 Jun 2019 10:11:29 -0400
Received: by mail-wm1-f67.google.com with SMTP id s3so3149252wms.2
        for <linux-fbdev@vger.kernel.org>; Tue, 11 Jun 2019 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Qc5EFkVTKGr6dYAxoaP7PbGa9RFFb0Yu3NvNTqCuC7g=;
        b=PG0OjEu1w3GysO55d1AWF1JxGrKq//m5h/+lqkdUO4kaTlmGHYQkTZfi5j2mYvLMxF
         voKWf4tqIhrTsY9L4GnOTVRdkcQTdMek5MfrPc3nxSNFAMB3Up8vAf2wnBjiv6jDA/f1
         PXrO1HfQn7++uNe2BSjhTwc05BzyqrvgZYUJZrcxBZ4teyFkmmgaBSL5H4Q69nG+PSxm
         z4Fi1g0EI5qm6iG+Yf7J1mEU0kEWIIWJ1YP4tBPqfVzEDWxR65a+AT9PBvZtJLCYK14b
         1bvjtCf/Nug5Zf8GiWEBE8FXdY5lS1vOSZv05gmHphpBN6t40O6TpdSG1ZF0jiWNOJh8
         7NKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Qc5EFkVTKGr6dYAxoaP7PbGa9RFFb0Yu3NvNTqCuC7g=;
        b=tXDsaO/hmhPmhVO/sVksynrknxoLu7aBDQHmPZB274VQF4qcySGGEE6jlWCq1qjDU1
         GEajTTUEAJrphZyMZPU8NZ9n/D+fD9hHgxFxOnRs3FH9oxX2nvyxIA83j4XhTS8UJV+f
         u2Hn5CJY23m4pxgj/tTr85iZs1IpfdfhMOHWMP9AGvNnn7EUo91djOnjVLUx0anc9PE/
         7ePytB6B+yl8fXLNzgpWnSXwpY2tpKzMF6o6cLAEl6/OTzZYV4to5//ZxQY6naMluiAf
         ioQSiod4DltdPyZYNoN9WKVqXo07rLoIi5f0qYWyOtziIBJgHgJqOtyNo10psTMKne/O
         /cFQ==
X-Gm-Message-State: APjAAAUnG7T9t6nrQjeTHfJlZ6AHmAHJrzsN0GM7ul7OELV0y0iatuH/
        +zkdlxfvqiVmfSWHNihJtX7arA==
X-Google-Smtp-Source: APXvYqxCrGFZDkB6E92/L2zQkhPrLCT80Z0/I9uddbexDlRQYg1pdUdK2tzvVwqbMxgtCW6DRYNgYQ==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr4133085wmh.76.1560262287645;
        Tue, 11 Jun 2019 07:11:27 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id u23sm2501379wmj.33.2019.06.11.07.11.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 07:11:27 -0700 (PDT)
Date:   Tue, 11 Jun 2019 15:11:25 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH 33/33] backlight: simplify lcd notifier
Message-ID: <20190611141125.w6vhytsue7toif3g@holly.lan>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
 <20190528090304.9388-34-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528090304.9388-34-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, May 28, 2019 at 11:03:04AM +0200, Daniel Vetter wrote:
> With all the work I've done on replacing fb notifier calls with direct
> calls into fbcon the backlight/lcd notifier is the only user left.
> 
> It will only receive events now that it cares about, hence we can
> remove this check.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/lcd.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
> index ecdda06989d0..d6b653aa4ee9 100644
> --- a/drivers/video/backlight/lcd.c
> +++ b/drivers/video/backlight/lcd.c
> @@ -30,17 +30,6 @@ static int fb_notifier_callback(struct notifier_block *self,
>  	struct lcd_device *ld;
>  	struct fb_event *evdata = data;
>  
> -	/* If we aren't interested in this event, skip it immediately ... */
> -	switch (event) {
> -	case FB_EVENT_BLANK:
> -	case FB_EVENT_MODE_CHANGE:
> -	case FB_EARLY_EVENT_BLANK:
> -	case FB_R_EARLY_EVENT_BLANK:
> -		break;
> -	default:
> -		return 0;
> -	}
> -
>  	ld = container_of(self, struct lcd_device, fb_notif);
>  	if (!ld->ops)
>  		return 0;
> -- 
> 2.20.1
> 
