Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C69126E296
	for <lists+linux-fbdev@lfdr.de>; Thu, 17 Sep 2020 19:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgIQRi1 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 17 Sep 2020 13:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgIQRhr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 17 Sep 2020 13:37:47 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C94BC061788
        for <linux-fbdev@vger.kernel.org>; Thu, 17 Sep 2020 10:36:55 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g29so1784939pgl.2
        for <linux-fbdev@vger.kernel.org>; Thu, 17 Sep 2020 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8xZMHi4HwDhGZXftClnq46LW61QUYpAjALMHSAmeHFo=;
        b=HrJY2l/+l6LLt+Iw+bTAHyVBsfRpf7NXHisw3NF+BRrcx97XLJ1enSWvPFYFay6mlq
         nIPRsnaEYtIDGPEQOSnNcHEug3cCEXVWXaRveLYt/Wj5rweFLiorsoUedzM/kkVQg7DE
         pt87URxYnqvl+qYdQDAmzB9SmZKlpSN3tCDu56s/pq5y6sFOY7GsDnat4M0Um5xN2acp
         nkOscukJPH2POn4AO+doyLqmX3oi3cc1Iv3NGHvSq9y3yaeaAeqxyiCh0jrUDluzlSy5
         TcAgjwkcWg/DUbcbv3GSssYHuZhxPrsQ3+lRtQaikvqx2J19Gsnj9n6rMCNCCu4UfCCn
         ejxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8xZMHi4HwDhGZXftClnq46LW61QUYpAjALMHSAmeHFo=;
        b=o/hSG6j7iDPrnJs/UsniXIDTjC63Ii4ouFPM1J9RIKuUgpoNKK6RoMNmpbBHvurDis
         x0X5ylm+VHV+i7t7Dz2hIcqFlWlqIB76jZlrNSF7NDxyD2DWtMqp9ExMMkEGPRo7DO8X
         8xPrqArAAZw/BztRHOp40xYy5pUVmmoS+LcczANLJwADnzobvKrHyFHpqpUxwxRKq/HZ
         R5ihckgd9mn/IKhzHkMTqFALOahDyo41BIec50mCf7g7WKMduXMOyD2VdGlUj75Bzle0
         Sm4d5Op/wLtxg7tl5UAMqgdpKhuIkVD3hiHL5Qn8f/TW1D069HI+Hef4IOQAT9cwhgpN
         UuLQ==
X-Gm-Message-State: AOAM533byd2ftg7I3bXXxcLerPRo95JOkjNuRGD4Ie4EFoB2/3iIfa4C
        zFHhPqCskfa6gKaOkCG45e7yCxuJJeoCb/A+pgvzBg==
X-Google-Smtp-Source: ABdhPJxE3ZgMjHDO8XI3+2LaZOLj4qA0/dlWB3n1yY4pXgIC9QaqYcsZlYmpVt+Ecsma4zqmTYQ9dIr0Ws0KfewjqLg=
X-Received: by 2002:a63:5d57:: with SMTP id o23mr7458172pgm.263.1600364214666;
 Thu, 17 Sep 2020 10:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200917131515.147029-1-jingxiangfeng@huawei.com>
In-Reply-To: <20200917131515.147029-1-jingxiangfeng@huawei.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 17 Sep 2020 10:36:43 -0700
Message-ID: <CAKwvOdnm-PkEt6T3HqB-NYNYADth0MJkXCvFsc-_gyqRE-nmcg@mail.gmail.com>
Subject: Re: [PATCH] fbcon: Remove the superfluous break
To:     Jing Xiangfeng <jingxiangfeng@huawei.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg KH <gregkh@linuxfoundation.org>, daniel.vetter@ffwll.ch,
        jirislaby@kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
        george.kennedy@oracle.com, peda@axentia.se,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Sep 17, 2020 at 6:15 AM Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:
>
> Remove the superfuous break, as there is a 'return' before it.

superfluous (missed "l")

>
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the patch; I audited the rest of the switch statements in
this translation unit; LGTM.

> ---
>  drivers/video/fbdev/core/fbcon.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 0b49b0f44edf..623359aadd1e 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1727,7 +1727,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>                                     vc->vc_video_erase_char,
>                                     vc->vc_size_row * count);
>                         return true;
> -                       break;
>
>                 case SCROLL_WRAP_MOVE:
>                         if (b - t - count > 3 * vc->vc_rows >> 2) {
> @@ -1818,7 +1817,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>                                     vc->vc_video_erase_char,
>                                     vc->vc_size_row * count);
>                         return true;
> -                       break;
>
>                 case SCROLL_WRAP_MOVE:
>                         if (b - t - count > 3 * vc->vc_rows >> 2) {
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
