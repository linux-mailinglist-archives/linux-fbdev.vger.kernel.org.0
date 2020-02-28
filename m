Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D14F173D5E
	for <lists+linux-fbdev@lfdr.de>; Fri, 28 Feb 2020 17:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgB1Qp5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 28 Feb 2020 11:45:57 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36957 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgB1Qp5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 28 Feb 2020 11:45:57 -0500
Received: by mail-wr1-f66.google.com with SMTP id l5so3708016wrx.4
        for <linux-fbdev@vger.kernel.org>; Fri, 28 Feb 2020 08:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dnB3YbRslroktKcVWBmtkOUB1kEjE4Aqzh9tCjoW9sA=;
        b=iJrIjG+IiWYGIuv4aS0pjFrtNOSHON/kkOz+fiN9gPNqV/5tmaqI5quNYhYtXpecqj
         h0lPxpt0G2l3YPQbieYSSvsK9K1gO4106/0u8OWo7DnozluA3vQdUjQ7TMiPNXIbXNBF
         iTpUnf84x/8gy3ffZuQouprp9+Aa16QxOw013HNiv2Zr2ZTU0WKzVuFvxSZsDw9qO1y8
         xDkWfOJbsUAe51FkbTGW4vTOwIubvGsJlqATWH9CkYAyBK55vv7ZwHj5hwgWdd2WGvwG
         Ubm3hqu/llx165YndZ4ECuFC8ejjAW0G3p9AbLSNA4r51+wOvxBKRkmnrwIUTYAyqbAY
         gGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dnB3YbRslroktKcVWBmtkOUB1kEjE4Aqzh9tCjoW9sA=;
        b=nl36SVeFBusydgQp81r4Q5lKztQ+C1HyVJh3sTcHYdQFaLUquzRL49S8xx2pOh8Zk8
         eZj0hLJSc7P2/s6jh+3nS/x/13qH1otyaE97vDjq6UZH4QoyQ9oBhVOsM9Va++ZGAOVl
         V6nnCi5q/NxLZV8QcFn8qmdXuYPUIyHkxN2z4DgnHO8dsC8oPLAOKwVIx2oIa8oAlyST
         U3bIO2ZJnUw4VMY+V5sB7ouOjdYvNmBdCEBI3QY9/YEMuHOoNOTtfCHNuMq4l7t+a5FG
         AtpQsRT6Zk9LD8+dpQr2SZaaw5FMIlYXuFDpc66GsQr73BptLUg7AtpFFLgG0Kt7/Z1R
         eaEQ==
X-Gm-Message-State: APjAAAWbNEMrMiQAvXKKRz/4EHYvV7CeMn4B8Ukh3HpCY2uO/ZNwnjjt
        qcj4BuguVkM3rVJCVPb840SfiA==
X-Google-Smtp-Source: APXvYqxeVMWKAvVvcMF6nm972He/fdlmMo/3+VBeCasLPa2AoHRCa64fawVhVSsW5qeL9ISZwA3mwQ==
X-Received: by 2002:adf:cd88:: with SMTP id q8mr5442082wrj.286.1582908355553;
        Fri, 28 Feb 2020 08:45:55 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id j5sm13406763wrw.24.2020.02.28.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 08:45:54 -0800 (PST)
Date:   Fri, 28 Feb 2020 16:45:53 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Gyungoh Yoo <jack.yoo@skyworksinc.com>,
        Bryan Wu <cooloney@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][V2] backlight: sky81452: insure while loop does not
 allow negative array indexing
Message-ID: <20200228164553.eojh3hbrymq3tw2d@holly.lan>
References: <20200226195826.6567-1-colin.king@canonical.com>
 <20200227114623.vaevrdwiduxa2mqs@holly.lan>
 <b0e21719-3a7c-099a-292d-c3fa65a84fe8@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0e21719-3a7c-099a-292d-c3fa65a84fe8@canonical.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Feb 27, 2020 at 03:10:43PM +0000, Colin Ian King wrote:
> On 27/02/2020 11:46, Daniel Thompson wrote:
> > On Wed, Feb 26, 2020 at 07:58:26PM +0000, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> In the unlikely event that num_entry is zero, the while loop
> >> pre-decrements num_entry to cause negative array indexing into the
> >> array sources. Fix this by iterating only if num_entry >= 0.
> >>
> >> Addresses-Coverity: ("Out-of-bounds read")
> >> Fixes: f705806c9f35 ("backlight: Add support Skyworks SKY81452 backlight driver")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >> ---
> >>
> >> V2: fix typo in commit subject line
> > 
> > Isn't the correct spelling "ensure"?
> 
> It is. V1 is correct after all. Doh.

It wasn't spelt "ensure" in v1... 


Daniel.
