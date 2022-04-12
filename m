Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190684FCF2E
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Apr 2022 07:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237700AbiDLGAW (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 12 Apr 2022 02:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235747AbiDLGAV (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 12 Apr 2022 02:00:21 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E8F22B19;
        Mon, 11 Apr 2022 22:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1649743077;
        bh=rr0cTwDe1vq8z9C294X+ZlMMl95EgN8jvthj5DoY4H4=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=CEWKapWzZz2/XVAiysEQ5YfaLui69WUpAkSquQoNEmmJaZ+JR3FMdKxD83blLMplf
         7zrN1rRholDLVBrPQOR+8bqth0P+m9cgq7lJLEMqrhcHbIZV7xZQQawz+wxqVfmR68
         Jp8u//TcOG3j8d9nxHtjA7F22oNMeOVBJ/ywVAQY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.135.215]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkHMP-1oOFv340eP-00ke0g; Tue, 12
 Apr 2022 07:57:57 +0200
Message-ID: <28bf52e7-e0b3-19b2-a617-5783aa352db0@gmx.de>
Date:   Tue, 12 Apr 2022 07:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] video: fbdev: sh_mobile_lcdcfb: Remove
 sh_mobile_lcdc_check_var() declaration
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
References: <632d1ef6be69c93cd37b9336a133f8c5ec779c8a.1649681814.git.geert+renesas@glider.be>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <632d1ef6be69c93cd37b9336a133f8c5ec779c8a.1649681814.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MCxYGl9zg2NsAk9i/emy/b74fdIkDL4xhiCcEoQMixeAEZe/3GC
 Ou6mn2tqXQJAz5Hp1gBg2I0NyYD1SqZCXYcYXGh5QTVoZQM2eVWuQe6UIQdAkVNlzaelXdj
 ezlaKNVFUJRT6Je+4HLmp1coExdk/c2o4z150K4zh3M6jiGepr/Mwp9jZw9govU5PpXdRJL
 A5ggvRHXQ9wK+A2G4+GTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WpNuwGH0NWs=:G/VFxMIk222Z5dbaI5KNkM
 KklJYcokwElTBfNuvo+6NOsCYzW3lvOpk9M8WufDdpx1uxsU1CiloFPo3WjWU5PDz/DykbDeg
 23mhPxftaF4Xr3a2cZIkBP9y5wPw7gagvp6asbhG/8C0342eghgjz5fyEX/SaMxRQOtbJRotT
 +lV+oOkWVcLixiJd0ef+04NJJ3l4LoFfWcvRmZOyZpLSZpxFdFN4YGqZC84EHInzpgkOihsOm
 flDOs4rIyn5y/eU3lP80aTc0D6NBsOhQhMQVrtYwmhV/YZMxt+0OAuaNDfLQiosKd5e5ccDpM
 v0ZN5JBYllMDJAfOtvV6Ip/VDsJae0F7UkY6mAFXRgia2dqdjatGpsc77ZkaidvbqrFMtP9WI
 cinU5Ee8dzExpsuruesHGVW7ENX03adi4/75YbIzjZC8i5Wj169eQuRILIcQLNKITPDaHa1e3
 XtCqOPBN47AFzUP59CLPU/+Mc8ypwX2nu8ldqQQ/mrsXPBKWHcAXB9feaiugKFe0PCcbyz8ZT
 H3JadqftZBfiCzzC+AMsLmeJjdEFNmk1TBMh9frE5YxeY1UqJ6jMIGhV9AKOhlcZoCFK/FKJC
 BZNa78xg8Q9beEM7/9h7hQXdj/MXjzAPexlkDZN4LNTkv7/vUbopfi2i+MqtfYty/CWhQGI8N
 rp0la2nAu5EbGj15MB+Xv1UuKaLqOFFsUnTrIU8X5FTV4HU4htMNbjGLYflLklemnR6l6zfl1
 lT5zrqVRfc9SnOVCk6htt1Rww88DbBrQqoZ3VwKQMLZYZYieI8jwNzL+fupBtwMghGi7epCha
 y2q9BKYbj2g4/1WJl3FEm5hVlU4uO214Mvzxic7bou2G1Iu4l/UWVZlOUZjv6Y68H5oCcTt6p
 tzYMCrnrtmaPWj7+SQXzBwNFGZc2gURg16xcPWzUalH6fjlWKx5Lm9X10ruCVXAkUsSuYy0a5
 Aam9OKgEIV9qd1qQ5lb5EZlj4eDbIw3Noxfq2LcI3VfK0wb0PFQOeN66uo4ND3V+8Qpc0Qro2
 Syfyo3cKcBRvCs18ikGeKjSV8bLywgZHhC/lI9k8UvUf5rfpPJobppkdVw8uBhchvWxvkdZJO
 ZNUmqViX04HGmQ=
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 4/11/22 14:58, Geert Uytterhoeven wrote:
> As of commit 0fe66f327c464943 ("fbdev/sh_mobile: remove
> sh_mobile_lcdc_display_notify"), there is no longer a need for a foward
> declaration of sh_mobile_lcdc_check_var().
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

applied.

Thanks!
Helge

> ---
>  drivers/video/fbdev/sh_mobile_lcdcfb.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbde=
v/sh_mobile_lcdcfb.c
> index aa4ebe3192ec9735..9a4417430b4e948f 100644
> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> @@ -531,9 +531,6 @@ static void sh_mobile_lcdc_display_off(struct sh_mob=
ile_lcdc_chan *ch)
>  		ch->tx_dev->ops->display_off(ch->tx_dev);
>  }
>
> -static int sh_mobile_lcdc_check_var(struct fb_var_screeninfo *var,
> -				    struct fb_info *info);
> -
>  /* --------------------------------------------------------------------=
---------
>   * Format helpers
>   */

