Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867F21D0A64
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 May 2020 10:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730120AbgEMIBG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 13 May 2020 04:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730105AbgEMIBF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 13 May 2020 04:01:05 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F77C061A0C
        for <linux-fbdev@vger.kernel.org>; Wed, 13 May 2020 01:01:03 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l11so13713050wru.0
        for <linux-fbdev@vger.kernel.org>; Wed, 13 May 2020 01:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qOmmunlWx5TbxpEYsCi6LXm1KoaU+vaRN5iuBeMyAvA=;
        b=wwGGIzfhjfM9NgXhcpJu8mIl16HfUpZxpzVQ0jfZyEuuJGGHo6S3WyOm4VQNJqtNJ/
         Zz93RR+VCNEoT+QCqEzG2uAUgNhcaMiybCUp+DobkeU64t8Za/EyWgGHc9O6Lx3oOsNM
         TPIQ/1bNv/yAs6qveLsyOUaJqV9S+l0LnS4N4ndUR6IBwgVktAZUDeGPg7lDs/1TbkiZ
         pizBletTSn7fUiS6rRNQXESiQuNFvoYgScCVqHaNRqRbl4ZwuzRVNOOOxtYuf6WvO1Ty
         thsS1053p4825+Sh7yU70apSzy1Va35O3gTFABx8YTEocfHcEsW9hfxnvgtZ1lcPFeY9
         umjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qOmmunlWx5TbxpEYsCi6LXm1KoaU+vaRN5iuBeMyAvA=;
        b=EFLed1HbBTLIPr0hPV38OIQyTQhsQM9VQVloEr5CxFsLnCJgk2s4iYR0OnDaG4FQYx
         rZF3xR+qvN9noHcWw6nY56jIfrej2+OO7/Uh3v2FLGLfFKDe3csQN3ovvzAmbP3x420F
         itt2UaaCon0U8e64bJkTV9+vcX1RYfR6lbcBA5nqLdm0le6YGgltdPpvB9iLu2unJSP4
         LmTgDYR99CGHTwKH7+7a82+Kao/3LBHoSuayjVCz1Vgt8elSQHRU0ASpa0jz7fR5Gi93
         1tiRt8boJumWXCS4kgu/h8PQd18xSaqphrkVxCl6xAQONJeEwXQRRhGn4QZW7ujrFNWS
         j2Sg==
X-Gm-Message-State: AGi0Puaoqk7Ev2s6UviDGLFfXF2OXgk+CvomiN2wpHlhMlz4jqA79BFk
        n41Isenbl3fr4323W+hA3CHeng==
X-Google-Smtp-Source: APiQypLqRksq0eSlol4tSTwedgyaTVM2PgFckTaG8ma5JptZgQpiUumnGNrPnWn12cdi9hLSZsxIVQ==
X-Received: by 2002:adf:80d0:: with SMTP id 74mr15451539wrl.338.1589356862397;
        Wed, 13 May 2020 01:01:02 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id c25sm33770259wmb.44.2020.05.13.01.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 01:01:01 -0700 (PDT)
Date:   Wed, 13 May 2020 09:00:59 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] video: backlight: tosa_lcd: convert to use
 i2c_new_client_device()
Message-ID: <20200513080059.GD3548@dell>
References: <20200326210959.13111-1-wsa+renesas@sang-engineering.com>
 <20200326210959.13111-2-wsa+renesas@sang-engineering.com>
 <20200417101446.GB3737@dell>
 <20200512162546.GG13516@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200512162546.GG13516@ninjato>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 12 May 2020, Wolfram Sang wrote:

> On Fri, Apr 17, 2020 at 11:14:46AM +0100, Lee Jones wrote:
> > On Thu, 26 Mar 2020, Wolfram Sang wrote:
> > 
> > > Move away from the deprecated API and return the shiny new ERRPTR where
> > > useful.
> > > 
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > >  drivers/video/backlight/tosa_lcd.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > Applied, thanks.
> 
> Thanks! I don't see it in -next, though?

Just pushed.  Should be there soon.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
