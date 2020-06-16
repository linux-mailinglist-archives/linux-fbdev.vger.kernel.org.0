Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610FF1FAAB1
	for <lists+linux-fbdev@lfdr.de>; Tue, 16 Jun 2020 10:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgFPIFd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 16 Jun 2020 04:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgFPIFd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 16 Jun 2020 04:05:33 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D8AC05BD43
        for <linux-fbdev@vger.kernel.org>; Tue, 16 Jun 2020 01:05:32 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id l10so19687001wrr.10
        for <linux-fbdev@vger.kernel.org>; Tue, 16 Jun 2020 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nSbbk12sklznSzURmDgyRvyV4JyDaN7OpY0qUFnGrF0=;
        b=T6FxFVn1hxbyVOJ1IyLfuqYj92YRLnRIsyx3/oowDA+x3BzDhwFFmEeKEnPEP9MPEA
         Q4cmnsQT8k+IMgfrS+3spLNWSL06RqN5ebkLysnP6qXhcUQk9AGZtEgX1tRfPkNPU28/
         4jJVm8GVo0U9VldN1mn1ClAGq/x7SH0XL66fJeIzZRX/G6Q1xsok0Y2PUuquOkR1aBlj
         tApAtsDp/nIGk0fmm6PqW/vfj/Q4Rw28Yj9ozigY3qyY7ZyVtXEVHsL7xsk+ercb4Sqv
         UZEfOeVoDSU05JYPGHHufWHF007CvNHJQzCssmMv5YBp5l3UD2RZwRoXhJzjSl2+bRq7
         xLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nSbbk12sklznSzURmDgyRvyV4JyDaN7OpY0qUFnGrF0=;
        b=Ff+2xcaxM52EjOU63+L0HCQONoPwK8VtlI2cbJOY88ifL6AZTeiV8MuIjDSwoJnswQ
         Kxsg8l6setSPf/ryyMYBr2g4V7rN4IZ7SRU/9XbAc8OseA8RKQZjyOEt1fJhLflncBTU
         hS3GQl5LWW2cmitP3lh12Vnbw6bib1/bSO/4lIWtOwGvieLkWmXdZ4IKfXK3BOYjhtGF
         uQibv5MRSkXN1+8UK/TjQpHuG5vhXLxG19jt8KBFl1uW8asfuCyHWVWppo9pDW3gwVf/
         YhaN7bbmNF8bEBw4TGbrCPKOTU6TwFzRogD0i/4baAyTp47ZLzNnVqoCIPgar1RwYAMs
         xsSw==
X-Gm-Message-State: AOAM533Vkqv0RzW52vrYDnRg2rWlZwVJbkUwi9obekFBU0rJ5osIo8GH
        yq2LB8yz7SsVtkUrGQNk43n4ig==
X-Google-Smtp-Source: ABdhPJxU65V0UN6yumv2HUuV4IN5upvbVb+ibQ9xncnrMwZn2lX2xkgru9+/gYpAYeYXxU41grhpcA==
X-Received: by 2002:adf:ec0a:: with SMTP id x10mr1682760wrn.130.1592294731087;
        Tue, 16 Jun 2020 01:05:31 -0700 (PDT)
Received: from dell ([109.180.115.156])
        by smtp.gmail.com with ESMTPSA id f2sm2679917wmj.39.2020.06.16.01.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 01:05:30 -0700 (PDT)
Date:   Tue, 16 Jun 2020 09:05:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wang Qing <wangqing@vivo.com>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/video/backlight: Use kobj_to_dev() instead
Message-ID: <20200616080529.GK2608702@dell>
References: <1592211242-31683-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1592211242-31683-1-git-send-email-wangqing@vivo.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 15 Jun 2020, Wang Qing wrote:

> Use kobj_to_dev() instead of container_of()
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/video/backlight/lm3533_bl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  mode change 100644 => 100755 drivers/video/backlight/lm3533_bl.c

I've fixed the broken subject line.

For future submissions, please use `git log --oneline -- <SUBSUSTEM>`
to view the expected formatting for any given <SUBSYSTEM>.

Applied, thanks.

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
> index ee09d1b..0c7830f
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
> @@ -235,7 +235,7 @@ static struct attribute *lm3533_bl_attributes[] = {
>  static umode_t lm3533_bl_attr_is_visible(struct kobject *kobj,
>  					     struct attribute *attr, int n)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct lm3533_bl *bl = dev_get_drvdata(dev);
>  	umode_t mode = attr->mode;
>  

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
