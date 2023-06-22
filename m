Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389C373A761
	for <lists+linux-fbdev@lfdr.de>; Thu, 22 Jun 2023 19:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbjFVRjJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 22 Jun 2023 13:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbjFVRjI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 22 Jun 2023 13:39:08 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB921BD6;
        Thu, 22 Jun 2023 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1687455536; x=1688060336; i=deller@gmx.de;
 bh=roHB+JreyqbCyh46TX0VgJAq4m6SfZv4rdjO3VvVBp4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=t2W/Wyhb4VhIczxIoOKN9JE4rhU6dpuOTmsZdFbVGM+3njVQO0Qzt48hpU1uWU6z6tlxEyk
 BJpTyDsehdRBny1NbTtS3bDV2qy8jzqaajwsPuhPMkIXwVqz9DN3iVQNSR/+uRCCiSInJuxKI
 Pz7O/WueZfo3+8Aa7cAAbEJYnypTP9yr5tOG06WUQ/nbqB1fCinJHDJWn7c9Jocl7aGluumF4
 fBuMhinEAPPdFQA/DoKtujFr58vBTA9eF5bSdB5o6XJwGkIGRuSe7/foyj1FKcr7e7hsQpsZK
 4uRFvD+4Xxb0xO4zIKONQmjLHlmav5KYUyZFkawPNo0un4YvO4GA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.155.210]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1pvXsJ3J6R-00rtA3; Thu, 22
 Jun 2023 19:38:56 +0200
Message-ID: <ed5784a9-b707-dcd5-5898-cb76e8d169c1@gmx.de>
Date:   Thu, 22 Jun 2023 19:38:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH][next] fbdev: sh7760fb: Fix -Wimplicit-fallthrough
 warnings
Content-Language: en-US
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <ZJR66f3UY0UFZJ01@work>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <ZJR66f3UY0UFZJ01@work>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0AMsLm4CGRzP+9jo/SLOyPBSOwhb9hi+YyvAI//2GPCYSgGDhjw
 WRULZVkxM4/xxLE1oa0lJb6lq+b2r2VgJNdwN2G0d378sKPwXO1pr8dY60fqiZWuWLOkf2u
 20Mar4LMzlZKqIPGUYxAp7A+Wg0eJcmmobzVnKOS9mrBLct4zI38Jf/t2vJQ2Dfz58HTY2K
 KZLwRQr4Wh3pWSBvWj6/w==
UI-OutboundReport: notjunk:1;M01:P0:v3wRNOQ3lDM=;KzA0nqjrywUt2MTT7Y/c7H59eyt
 F3OGcuyVoFdzNHAKczE6V1n7iEMqnpZLUed/Of1vvxhdw3sd/W42nXs92730SlZp98sozxz1b
 0mWbwq8olHadQERt7yF4SuLjP4xMj1ZOHXGCS+RSRpTvkGR6T0VhGu4ju0c9KUS0lujWEr7ZR
 OtEpsHq0qXKDotgxxbiNwIxafQi1oT1/K+hY5FWSONJjZvnD2uB90pTjaB7WsDgopzYELwvL5
 SBOzeDTQYQ3RuYwS8ri4gf9HW9btRftxqZYPlLU2P/PbDd6Fs73DiEAakBKd1RoZFhhGr7Ikp
 f65ZliX59WV2kt4g3NZQfhxQC3Gb3k2sxxL53gH8ElGRt9DOT+QxvFNohR/WiUkd7pvSX9gB8
 cR36NuF6xoB3R8bGXI/vGKfFm8hVaypE90YOYSu8FU64n3+OSMpjjD8ed3ndS49eA0vWlM9ha
 0GKl74aht4EqeJan8Yd7ttWFVxw3JpCrD/oxi7GHzCE5Oib0BUTThOGRNRHCyA0yBpxskvt0g
 /hh8EPpZwxni+wGWuSVpJ8UlOvSZB9SWRuQjVar9DUshdikCCxhWooUs9f2115+5HsR3+MhfZ
 j4ie5CpWdQ48GRYJpsz3IW8pv35chqyULjI2bTdAnAIP1knCySIwH+nWW5LxmemTHEWrDQBuU
 rCFb6blF0UbPpobYBUzOvDFI1xE8wO/Kz5qDW5NCcY9eh7TdHMN3KpPu6ZK5Da5R2vMRvEGxI
 aHasosJxMoq9TjbmoGXDBkwOa5SZBhQ5e5viUzJuhwlJN6ESDmPL50PxcSVCxoKr3lDCXmkOj
 r9ezznURd1jcofZT4VPgehaFQ5m7uyMS08E2CeB8KqVsRORsGBzIqNiQmhmWfCSQNf98CqMvu
 lU5seedc5HXj6BYFoRXFK01ZcugyT3BbLbVWW0NtHbcKWYdbIj3cK/D2zCm6lzXKABwzOtIQA
 4vyvnw==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 6/22/23 18:46, Gustavo A. R. Silva wrote:
> Fix the following fallthrough warnings seen after building sh
> architecture with sh7763rdp_defconfig configuration:
>
> drivers/video/fbdev/sh7760fb.c: In function 'sh7760fb_get_color_info':
> drivers/video/fbdev/sh7760fb.c:138:23: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
>    138 |                 lgray =3D 1;
>        |                 ~~~~~~^~~
> drivers/video/fbdev/sh7760fb.c:139:9: note: here
>    139 |         case LDDFR_4BPP:
>        |         ^~~~
> drivers/video/fbdev/sh7760fb.c:143:23: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
>    143 |                 lgray =3D 1;
>        |                 ~~~~~~^~~
> drivers/video/fbdev/sh7760fb.c:144:9: note: here
>    144 |         case LDDFR_8BPP:
>        |         ^~~~
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/sh7760fb.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/video/fbdev/sh7760fb.c b/drivers/video/fbdev/sh7760=
fb.c
> index 768011bdb430..98c5227098a8 100644
> --- a/drivers/video/fbdev/sh7760fb.c
> +++ b/drivers/video/fbdev/sh7760fb.c
> @@ -136,11 +136,13 @@ static int sh7760fb_get_color_info(struct device *=
dev,
>   		break;
>   	case LDDFR_4BPP_MONO:
>   		lgray =3D 1;
> +		fallthrough;
>   	case LDDFR_4BPP:
>   		lbpp =3D 4;
>   		break;
>   	case LDDFR_6BPP_MONO:
>   		lgray =3D 1;
> +		fallthrough;
>   	case LDDFR_8BPP:
>   		lbpp =3D 8;
>   		break;

