Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C347A1F95C9
	for <lists+linux-fbdev@lfdr.de>; Mon, 15 Jun 2020 13:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729723AbgFOL7n (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 15 Jun 2020 07:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728510AbgFOL7m (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 15 Jun 2020 07:59:42 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB59C05BD43
        for <linux-fbdev@vger.kernel.org>; Mon, 15 Jun 2020 04:59:41 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f185so14533363wmf.3
        for <linux-fbdev@vger.kernel.org>; Mon, 15 Jun 2020 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=719ofHTBd/I2peVm9y0TOXJ46xOp3IsPklsZWOMX6Ng=;
        b=iQBqKtaoUb41/1QY2TLxDwAHEYBfZFCmUjMJQZNtmyGtBWUuVy3F9B3Cb53/As2kCn
         w8LdlOL2O7nmWriJ5O52ZkFQWhXTih9egKBCn/xHrpYHpcMwRXAmY1rb0h0q8qkkLVy8
         l1hJI4uEkDi5fbiDRHv7GwLQoSuyV2VfrEKB5ECTpgKJ1vJkmNlS/3VhLzU8MxubHF4F
         BQTOkJUde9IQlvtRqmh20dLAoV7EggqCEgH6ZkKCUXk0eg7wCnG7EY3a45NjaenaikM4
         iZIp57nDyyGIKuzpt7FgqqJFZD+WUhJQVW3RyKUErLV5ev8TLcZuj1knLd+sP5bVIDIV
         8TVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=719ofHTBd/I2peVm9y0TOXJ46xOp3IsPklsZWOMX6Ng=;
        b=Z2RBsN/Ehk+b5sU9UUOeogGbvg0nyJVfcvggCShjHGRunQSdV13NEo8TuFNihVU/U3
         FAAzerqffsh3qYSZ9QI3mmYVrT1OEHcmMLRouO8kbi1e5wRwOmmyzAPBkYcQJ2souFB/
         7XRxGxnxagWoxlboOzro/7PzqDHRSZn10sRjq6l6bpQ5MwgZ1PjAoodzEftHBW3grUQV
         kg214rLsBkTLlp1mKaV4s1s1nkgOjiMCZogvqWjL2qjCk/+lJUKMcmaNSrCrd7gdyBVN
         UbgPJ3v3Wcvj+02/jtJOXNXwoGyQiESN88hPHlpCi1/dQQnAe9jNlqEpXRCfT/3aEnai
         tPQQ==
X-Gm-Message-State: AOAM532la+OhB9g4zSkkQ0+nriHnM5DC3BzGNaLIAA4G1ljdLTGAhyM8
        ZLWuyJdmOv2z/HXtmrcz+bT/+A==
X-Google-Smtp-Source: ABdhPJyMY/n1roSv+cYCo9nXkUw2jY0Aaoq25AgVCDcB5q2EJWWPzPzjrsggEnRh23lqIWvByW/4gA==
X-Received: by 2002:a7b:c212:: with SMTP id x18mr12617874wmi.119.1592222379015;
        Mon, 15 Jun 2020 04:59:39 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id q5sm24022703wrm.62.2020.06.15.04.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 04:59:38 -0700 (PDT)
Date:   Mon, 15 Jun 2020 12:59:36 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Wang Qing <wangqing@vivo.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/video/backlight: Use kobj_to_dev() instead
Message-ID: <20200615115936.37pwp7cgmhznnyo4@holly.lan>
References: <1592211242-31683-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592211242-31683-1-git-send-email-wangqing@vivo.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jun 15, 2020 at 04:54:02PM +0800, Wang Qing wrote:
> Use kobj_to_dev() instead of container_of()
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/lm3533_bl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  mode change 100644 => 100755 drivers/video/backlight/lm3533_bl.c
> 
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
> -- 
> 2.7.4
> 
