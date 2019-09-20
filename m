Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F70CB8E92
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Sep 2019 12:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408666AbfITKg4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 20 Sep 2019 06:36:56 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41652 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408667AbfITKgz (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 20 Sep 2019 06:36:55 -0400
Received: by mail-lj1-f193.google.com with SMTP id f5so6573999ljg.8
        for <linux-fbdev@vger.kernel.org>; Fri, 20 Sep 2019 03:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WxAeg0E408eZYRG3jaSU6/idFxhNoNTLxowg0akgOcw=;
        b=jToWQaO4D6xEhMK9/TNQMuFGKbY+7smm/ghe2egGrXdgjp9a7IGN72Xca35sidyhok
         kpaz5ralL1igV0259f/lzjwYwXol6ELi4hsyuVxNEYVOpGaHccZb94sqyxfKUys9yHdc
         D8Z0qlL7ecKdViFW2QPE7WhExVxQVCD6UVTCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WxAeg0E408eZYRG3jaSU6/idFxhNoNTLxowg0akgOcw=;
        b=QK9kpdr0lofGqRuw0LMn97Ip6MgUmWLg/8SKsfYIEx38DNhgP1VrB5e+p+MsDIbuij
         QTiS2rnIPlFVNdc8ud+ASHDWL/6jnSiHa28RQ2rPkKNtx8kCWt18J2RyqQnUyoWQ6jKI
         7WB3XIYHOhTs8VuVuV7unV+ieM7EpodMHmFI4Bc4Wn8IHBgtyAn+TAz7nnonSaufYi6/
         mYeAZpe82pzn/Kmvw24LMSHciw+AfDqTe2II/Rp/4nRD6faioWZrZRmT/msE1pjyfmX0
         d6JFmECTqiCMCTR/yPTlpZk7hEXsvb1Jftd1mrTbmMlin+GrDsjk95K6BSYv56ruDsAc
         z0Ig==
X-Gm-Message-State: APjAAAWCXifrFN4+mDHiedZAnj4Gq1nlKVAh+WkNcz7O7zyhZf8az1gR
        JUsvYbwhXHKY7v2YbcbNJohAoA==
X-Google-Smtp-Source: APXvYqxKkShwoINlCHvbgRna0mCpBj60DPtHn9mUmlUHjnbq1INmrrmDP4/wXchRCyQvKEe49i4U8Q==
X-Received: by 2002:a2e:934f:: with SMTP id m15mr8826326ljh.101.1568975811966;
        Fri, 20 Sep 2019 03:36:51 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id y22sm400931lfb.75.2019.09.20.03.36.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 03:36:51 -0700 (PDT)
Subject: Re: [PATCH 1/5] backlight: pwm_bl: fix cie1913 comments and constant
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
 <20190920101405.yuu4bymublj45kd4@holly.lan>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <fe846ffb-857e-fda2-1277-3ca49ffc0d7a@rasmusvillemoes.dk>
Date:   Fri, 20 Sep 2019 12:36:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920101405.yuu4bymublj45kd4@holly.lan>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 20/09/2019 12.14, Daniel Thompson wrote:
> Hi Rasmus
> 
> Has something gone wrong with the mail out for this patch set. I didn't
> get a covering letter or patch 5/5?

Sorry about that. I should have included a cover letter so you'd know
that patch 5 wasn't directly related to the other patches.

https://lore.kernel.org/lkml/20190919140620.32407-5-linux@rasmusvillemoes.dk/

I was removing the now unused int_pow() function, but Andy has told me
there are new users in -next, so it's moot. Only the first four patches
are relevant.

Thanks,
Rasmus
