Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9AE7A5A72
	for <lists+linux-fbdev@lfdr.de>; Tue, 19 Sep 2023 09:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjISHGH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 19 Sep 2023 03:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjISHGG (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 19 Sep 2023 03:06:06 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1A5115;
        Tue, 19 Sep 2023 00:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1695107154; x=1695711954; i=deller@gmx.de;
 bh=Zb8UbBJCHEgdL43lsa3Niz8Ev8QPFiNTo7x+pbv3iGI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=HkV7kl3a0VMXqvZ2IhZUQFFjznapvW4AvwJk+Lazzh90Xvy/23rLHi4KLLLXhQCWG6VI+m/o/tm
 cTiKNIraQIj/pzBkZNAoih0F1eAyDlay1XIYocusinqqc1zSYbXbpe8SSO1OMfy+h/xa1IyLlk4bF
 Q38I0SNHn8OITKjBs4Duc9dfCwRgDiZji8UiUC9boshLTJO8b6wvwXP4TFi+7KPf3xgLkE/xay9gO
 OF5kii2DwZxLIyupLbv8ja6X5zV78aNnO+l/c4YzguyFmQlSQaDLrjtlCQDohqO3u0sFXJsD/rSI0
 3S1d3zk1xgcYAMhLuk5EvxPF8A/leR3ba5kA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.149.158]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2aD-1rS32T1ljD-00kBbM; Tue, 19
 Sep 2023 09:05:54 +0200
Message-ID: <d436d191-9580-c3ca-1583-02c9cff58494@gmx.de>
Date:   Tue, 19 Sep 2023 09:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] video: fbdev: core: cfbcopyarea: fix sloppy typing
Content-Language: en-US
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     stable@vger.kernel.org
References: <20230918205209.11709-1-s.shtylyov@omp.ru>
 <20230918205209.11709-2-s.shtylyov@omp.ru>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20230918205209.11709-2-s.shtylyov@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lVjQ7lcRchmjcsTxUJBEj88dbvm3qtopU+G1P9tSGeXbqJ/KIvz
 MVvqf/DcicD5urzpRkJOppGcNEg8lGSgui0/h1/w6IZSylX/KgJSS8Us+6qAi002JlpIq+l
 t2oTERmW9LplOuy6e3dtzJcSaOv8dCpstwGJHbGc0YLsWzm22s9vSX0uSAumYsLOAoXjSPr
 x0h16h1sMj0zOslXymwNg==
UI-OutboundReport: notjunk:1;M01:P0:U70Dlbn1t0A=;5o6mtjsjRDBjB0nNRSGG474TNsF
 yC7U4RblR+FYUpFFIiFojFpIJ0wsEzRy1PlTzjyUSL62gtJN1MRpo4Y4HMB5WuAZuSzwQiSjd
 vJxr5lX/N+JkZtVYaJIa64GWh1wNZuWI7ys/xVYCOk5eZS69vQtPyyRnqv1vtiwp8cf8z0N/z
 iPT/8wm0VQvzoNEahwRyyUZsolmJXsAYV4rUBsjk5PuQX3xGHMIQ8T07MKby518CKbCAKjHe1
 GjyRUQCKkfDEVim/OkNZDKDQCaVJlGK706tO9v5wysctwxI8tBHuDeDUOPAYvi1UJi7OBFAgg
 Twj6TyX9bHS/FKKGQNyuAHwPVPhBG6DsZOxiXdojNrplqgu8HhXVOLoIoFEYUJo/t4IxMQIMg
 JknpVTs79u5cLpj4R1oSBQG2aeEpGsqQS15fgKFWFctnr5v1OrcB+saNXUA/fQq87SunAqxry
 Q963E9vCz7SuN0zvEGlyG7nszX56YikUxI/D1uHizVDd3iM1Pf8pe5IeUH3qyqjcMFbdpwoLe
 4r3rG5IX2aGV+DkkEbF1Qq5Fb11GGEWAw1DP8cApByctK2iYF/gtBnMjDEGA16wvXoj5bFC+R
 N1T7dNYBkZuYpV3QDU/BxknOz+VrlWXqMnxyb7P11ldOtQaAvClpEq/8SvjQeuxvQq/sZWE4S
 HbUsJ6DGz0uh6M8I+FIP0dkl1spQBNZeAapc84CUnqwIm27CiPrJApZ/7vtYKNmPRVukVf7Ag
 +TfMVtcFtzFcbhdP3DpFKOuhDPkaE9toHKWQv5eBm0VCNk3QQ+J1ctDE4NbruUltvNOJPdS04
 es0pxSlS95biVOZlgzYxxTpZDJtWKt2moIIH05/eFEtbrKdLTYfg84JMsOLML2HApbu+5QRnR
 1b69zbn8QyyeogOEb6kdJ12MwFhCtSPJtOkK8JuMP9Ynm4vYYo9qVimdF+A2waLDwPhPzPO2l
 8gui9HZyZDFeSz8QSpyl+eh6tn0=
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 9/18/23 22:52, Sergey Shtylyov wrote:
> In cfb_copyarea(), when initializing *unsigned long const* bits_per_line
> __u32 typed fb_fix_screeninfo::line_length gets multiplied by 8u -- whic=
h
> might overflow __u32; multiplying by 8UL instead should fix that...
> Also, that bits_per_line constant is used to advance *unsigned* src_idx
> and dst_idx variables -- which might be overflowed as well; declaring
> them as *unsigned long* should fix that too...
>
> Found by Linux Verification Center (linuxtesting.org) with the Svace sta=
tic
> analysis tool.
>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Cc: stable@vger.kernel.org
> ---
>   drivers/video/fbdev/core/cfbcopyarea.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/cfbcopyarea.c b/drivers/video/fbde=
v/core/cfbcopyarea.c
> index 6d4bfeecee35..b67ba69ea2fb 100644
> --- a/drivers/video/fbdev/core/cfbcopyarea.c
> +++ b/drivers/video/fbdev/core/cfbcopyarea.c
> @@ -382,10 +382,11 @@ void cfb_copyarea(struct fb_info *p, const struct =
fb_copyarea *area)
>   {
>   	u32 dx =3D area->dx, dy =3D area->dy, sx =3D area->sx, sy =3D area->s=
y;
>   	u32 height =3D area->height, width =3D area->width;
> -	unsigned long const bits_per_line =3D p->fix.line_length*8u;
> +	unsigned long const bits_per_line =3D p->fix.line_length * 8UL;

you wrote:
> __u32 typed fb_fix_screeninfo::line_length gets multiplied by 8u -- whic=
h
> might overflow __u32; multiplying by 8UL instead should fix that...

This would only be true on 64-bit CPUs, where unsigned long is 64 bits,
while on 32-bit CPUs, it's still 32 bits (same as _u32).

Instead we could make bits_per_line __u32 (or unsigned int) too.

>   	unsigned long __iomem *base =3D NULL;
>   	int bits =3D BITS_PER_LONG, bytes =3D bits >> 3;
> -	unsigned dst_idx =3D 0, src_idx =3D 0, rev_copy =3D 0;
> +	unsigned long dst_idx =3D 0, src_idx =3D 0;

An "unsigned int" can address at least up to 4GB, which is fully sufficent=
 here.

So, both patches don't have any real effect.
NAK.

Helge

