Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 169E524AF34
	for <lists+linux-fbdev@lfdr.de>; Thu, 20 Aug 2020 08:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgHTGXI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 20 Aug 2020 02:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725952AbgHTGXH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 20 Aug 2020 02:23:07 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183A2C061384
        for <linux-fbdev@vger.kernel.org>; Wed, 19 Aug 2020 23:23:06 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r4so891138wrx.9
        for <linux-fbdev@vger.kernel.org>; Wed, 19 Aug 2020 23:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Rfe5cf8ONeOtyLL1u7/RmPWIu+jJLpGbwRQ//wGFeDM=;
        b=HiW1tz0Re0iY3P915VZVsLzjSN7j7y5asxapsRDp7fVIOb5J7C5nLkBOeRcy6/JJWO
         xarF8bqLYq3w6ERx3p2kDYIik/29V6DZuGZFbqbD5Lg+FXbhz2mHa1YMfX0w+jR8rkWO
         iY0pyjp8BQL06RTpY8f2toCrB39wuV/Km9oeZE6fA14hiKCo/jtH4a/0KPCO7r1qhWRU
         FNAOnALWdwnBpDjDXJ0Be/jxzmHL7udncEIr+KW82c4+7cIdVG/nvqcHm4Io6Wnqmi6X
         s9pknqLptsmCuiGKZ+/gnKAYSR5v+OYRENLKCsp47kxlDJ8MR5JGEw5rgYU26AzZeeiJ
         glnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Rfe5cf8ONeOtyLL1u7/RmPWIu+jJLpGbwRQ//wGFeDM=;
        b=oGxJ6On1mzOzpAAyJMzXbavjVg34BvVJiCZfT31G42xIuZoq1d2LhLm81g8mRcShJ1
         unMdFqAGLQwHE+43EMozqDaqkUaqk11olb5SxnPvzF25jcv71AKiCGAJ4h0oShkn1NFf
         /Qv8TfwiEL6Ne+TaIdKjqhcdljgM56oQ8gZfNbKuf4m22FXzKY5nvxV/IYpo0qoAymwk
         Tcj11CkRj8kYtaqhROG7c1/kh/oBZRL+Ha0nO/WXn7zjhUIcg3sVfJaxbJ3cmOyOpwZ0
         wo3hTpsa3ovAgUkq9ArUnhPkjk74MzANh21XXzqV9naWR9CBLWw2aV6Ym0HZQ6L1HWsY
         hjVA==
X-Gm-Message-State: AOAM530CHv3dV0Ok/m+tVgrevVxbyBdFXHb/1H9tzy3P3GilDaAHCDtd
        o6g1jQlFna2J6cUwdl8T+7RM9w==
X-Google-Smtp-Source: ABdhPJzrNMIAs3RWwn1qW6NmluXvS0ZXgMLj8VZFmRCLMLi1HODyj9WHOhedRDqWOEublp+0scrmyQ==
X-Received: by 2002:adf:e506:: with SMTP id j6mr1495836wrm.287.1597904585322;
        Wed, 19 Aug 2020 23:23:05 -0700 (PDT)
Received: from dell ([95.149.164.62])
        by smtp.gmail.com with ESMTPSA id t189sm2308285wmf.47.2020.08.19.23.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 23:23:04 -0700 (PDT)
Date:   Thu, 20 Aug 2020 07:23:01 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     dinghao.liu@zju.edu.cn
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Bryan Wu <cooloney@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Gyungoh Yoo <jack.yoo@skyworksinc.com>,
        Jingoo Han <jingoohan1@gmail.com>, Kangjie Lu <kjlu@umn.edu>
Subject: Re: Re: [PATCH] video: backlight: sky81452-backlight: Fix reference
 count imbalance on error
Message-ID: <20200820062301.GD3248864@dell>
References: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
 <20200819165702.GC3248864@dell>
 <217e3c0c.b58c.17409fd7496.Coremail.dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <217e3c0c.b58c.17409fd7496.Coremail.dinghao.liu@zju.edu.cn>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 20 Aug 2020, dinghao.liu@zju.edu.cn wrote:

> > On Wed, 19 Aug 2020, Markus Elfring wrote:
> > 
> > > > When of_property_read_u32_array() returns an error code,
> > > > a pairing refcount decrement is needed to keep np's refcount balanced.
> > > 
> > > Can another imperative wording be helpful for the change description?
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=18445bf405cb331117bc98427b1ba6f12418ad17#n151
> > > 
> > > Would an other commit message be a bit nicer?
> > > 
> > > 
> > > …
> > > > +++ b/drivers/video/backlight/sky81452-backlight.c
> > > > @@ -217,6 +217,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
> > > >  					num_entry);
> > > >  		if (ret < 0) {
> > > >  			dev_err(dev, "led-sources node is invalid.\n");
> > > > +			of_node_put(np);
> > > >  			return ERR_PTR(-EINVAL);
> > > >  		}
> > > 
> > > I propose to add the jump target “put_node” so that a bit of common exception
> > > handling code can be better reused at the end of this function implementation.
> > > 
> > > Regards,
> > > Markus
> > 
> > You can safely ignore any review comments from Markus!
> > 
> > However, this patch doesn't appear to be in my inbox.
> > 
> > Any ideas as to why?
> > 
> 
> Thank you for your advice. My outbox shows that this patch
> has reached your email server successfully. Maybe this
> ended up in your junk mail file?

This has happened recently, so I was sure to check.

Not there either unfortunately.

Would you be kind enough to bounce/resend please?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
