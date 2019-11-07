Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF65AF292A
	for <lists+linux-fbdev@lfdr.de>; Thu,  7 Nov 2019 09:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfKGId7 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 7 Nov 2019 03:33:59 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38878 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfKGId7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 7 Nov 2019 03:33:59 -0500
Received: by mail-wm1-f66.google.com with SMTP id z19so1378595wmk.3
        for <linux-fbdev@vger.kernel.org>; Thu, 07 Nov 2019 00:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=s8siO8c5nG2oA4yleva52f8UrXXloSdu8Edj03PJpK0=;
        b=JRkRa/R1N2W5Q9fECuduw7TIszePzpuIf+wxSx2MpS7SVRD2xH3wNupZLXTrfgmaJh
         mGoLnytxEdFYu1k8s1FTzVDv/O0IW/WSVdoccxvdGjvYKtdyrKLfx+CzEHFryhCO3JAw
         KYb8NmrLgGyx511ItajYvxS7EXqMNegvbQbqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=s8siO8c5nG2oA4yleva52f8UrXXloSdu8Edj03PJpK0=;
        b=eN07pGm7Z9XU6sZE5hqEgzqEN6YbZvgIDp/AKU2eKplYTiRDHvCv3oH9aTFemtgzMt
         cGKuljWsoCs/837ctBO41PXUokpoto3dn8cOGzedBPpV5R31LXOfeiaCumroVb3R0mcw
         u3eM5ZVGp3xqy1e6toSV9Cbv5e5RAiVD2Y+jHLpH91OfUaO7RRErV/4bsFSFA311MMH5
         ijs9N8JR2cMvbj2TxOegrqKt4mhbZ6SlfEA4YDMZDYyut73l9UjkTc1kGni+yvdIOmtm
         tz2qSiYZXK4ntbbe8FkPSCHTmDeHzFWQ+lAkfhWcjZT6EQstxVMwWOU8GT6jMgKuUC+Y
         PGaQ==
X-Gm-Message-State: APjAAAWBeAE+QuzxyrYh85DBMypPzFSjS6rHO57ffe0NeMvWcYYjrF0M
        j2ZDYjW3Z2rRGNBbFNcpp2mTCg==
X-Google-Smtp-Source: APXvYqxKMCfhiclD4wFqY8ApTHpX3Q1Ro0gZKnJrP51xrd4JOijhRLOYoIdKgYqifQ0PrRuhN8PtPg==
X-Received: by 2002:a1c:4946:: with SMTP id w67mr1729615wma.16.1573115636920;
        Thu, 07 Nov 2019 00:33:56 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id v128sm2249296wmb.14.2019.11.07.00.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 00:33:56 -0800 (PST)
Date:   Thu, 7 Nov 2019 09:33:54 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RFC PATCH 05/12] video: fbdev: matrox: convert to
 i2c_new_scanned_device
Message-ID: <20191107083354.GK23790@phenom.ffwll.local>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106095033.25182-6-wsa+renesas@sang-engineering.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Nov 06, 2019 at 10:50:23AM +0100, Wolfram Sang wrote:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Ack for merging through whatever tree you think this should best land
through.
-Daniel

> ---
> 
> Build tested only. RFC, please comment and/or ack, but don't apply yet.
> 
>  drivers/video/fbdev/matrox/i2c-matroxfb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/matrox/i2c-matroxfb.c b/drivers/video/fbdev/matrox/i2c-matroxfb.c
> index 34e2659c3189..e2e4705e3fe0 100644
> --- a/drivers/video/fbdev/matrox/i2c-matroxfb.c
> +++ b/drivers/video/fbdev/matrox/i2c-matroxfb.c
> @@ -191,8 +191,8 @@ static void* i2c_matroxfb_probe(struct matrox_fb_info* minfo) {
>  				0x1b, I2C_CLIENT_END
>  			};
>  
> -			i2c_new_probed_device(&m2info->maven.adapter,
> -					      &maven_info, addr_list, NULL);
> +			i2c_new_scanned_device(&m2info->maven.adapter,
> +					       &maven_info, addr_list, NULL);
>  		}
>  	}
>  	return m2info;
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
