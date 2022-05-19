Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2112252CF1B
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 May 2022 11:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235891AbiESJO1 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 19 May 2022 05:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235900AbiESJOZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 19 May 2022 05:14:25 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D38A76FD;
        Thu, 19 May 2022 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652951653;
        bh=vHKw+rNk4PT4DFmwJiIcNVVwqOfo5+7Vy/wOUy3KKrk=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=RcB7qkgMXlUofd83X33cmLaor+kHJ4nwDzTvXxjfbuhNeDLaHdWB9HtcjpfBZ41yP
         1X/o4SfRZpFIGuzoNuFoOce1Q12uIWsoCFahqTPJmJf1RoYLKnkQdwOuvLpGaD/Uap
         3B/ZWvTZFznNEVIrB+j4+5srmQA5//FQrs7fnLu8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.152.7]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgvrL-1nOLQe376b-00hNYk; Thu, 19
 May 2022 11:14:13 +0200
Message-ID: <3976cf6a-0b40-4763-a233-eacf93925d53@gmx.de>
Date:   Thu, 19 May 2022 11:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] video: fbdev: Fix refcount leak in clcdfb_of_vram_setup
Content-Language: en-US
To:     Miaoqian Lin <linmq006@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Pawel Moll <pawel.moll@arm.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20220512115913.48685-1-linmq006@gmail.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220512115913.48685-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eSWg360NWdcrUA/fH7V7T9HE5h1fnVkRKaDvilzgt7TNnko8Egk
 XlT5t0GUmFyJEH9cPREdc214vINJZC0DFKVSiVTdJBVUaP4BE613ytqfmd0Djcu+Q7nGkGC
 ZJM0QToPIxtDal2B53SwVRk3nylfVXxqAnruvnw3W2/qfRCvdHLWdwAsKL+uXYQvRzGTho7
 W2QJ+jXKfAkhPBZ7HNRAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KQEVyUAnvU8=:Ubfs4GWvjk9jhIzN4c6pLH
 fJy5OFciCIS6/B/O6PV1aEEn24aca0n7bUvA4dH/OuWQkbp9MvGFX2YWZgmOKrvCCi+6uHJcB
 zkcp5IDZp4LVlqbBQ11YslCKM+E91um4KQo1EsTLjSwJ/xJsfYQp+GHmNbnsCv2w1l5KpDaIr
 RRBz0v3lwOc+LraX7C1/lONonhc7a+CGIfKDYQbQzlgPVPNeuHPCRtq11O8f2rDuTPto3d7RN
 LqnG6vFOpemAn6qLli3/kKsGmWDiOmJ16Ky4PQqQsUn4N37p5wRwSS39EljVy07bG0oyuJ1wn
 7lRin3nat/Nu2Yxb+uO+PomNdSRN3coiLmdVNn9haFuo6Ljxj44j3gXmvKdk2/IIZMyDdSMKq
 tTve9r8LhlzL7kJiEIhqgk0sKAH7dCVnV+5GE0gYQQeRe/SDhmjAgPoeSjUVCHlDfADSZgkff
 DkRdc5EJhIDYc2tFvj/lm+AIkp6ZPeIpVnbmro/Cscq/1CNeQyKTcB5f8V0KGDlE2bCdVWt3P
 THjKz0H4Tj53ugXdnhtIH9jqYcPd/lgHlvv70MX0UfSaQknFCUhtbFbdBsdLTCMosEwlL5v53
 12sUiKRJcLHKlFW1qC+5h3bsxOtp52LREC4rJ5TdXd9O0ls58HyrOMWa6r5yjlI1a51ol2QET
 2Wyr7bgthrEdpI/BqxR76+4JQENPHKHU9pzU3r1zaLJRmOGJoVpllPacecfK7uGd3o3UC4b5w
 14IqdLOt2YUxEN+HandTJHmur55m2R5Ccfhp3l1v1hW1l5uKFv7wIAoKXVN92J/5JAEwkvFFx
 QgKwh0Ez0PHLBvtxr4+w3y1pNkktFvTHuvbus3SJoL3QRPsruWorATRAsfYgd1C2vI5CCZA3W
 +Zi/g6S5TyYgIDx2c7zwVVOWIr9fy/k/QZFYJOQ5+Aav9Fqi3LDQ/jOhzWdlKMb8uPuRsx2yA
 Odmmk/5ZGiXi375GKzm0t0j7JoKbi8pxAbnVVHiD//8kKW0M6GqVzSA6UCloaFN3eDb60AAzy
 +6Hnr0WRN2msdX79V1SZISD/7rCPZl/ss00qw0B2g1bKyrzewL0LKP4lCCqo7c2c9B/nGbb97
 +sbby4TyKm2hEXbJg5u8e/dpa/dlzw2O5FXIoy2jp9XGcq1LgT2lpQtvg==
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 5/12/22 13:59, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: d10715be03bd ("video: ARM CLCD: Add DT support")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

applied to the fbdev tree.
Thanks!
Helge

> ---
>  drivers/video/fbdev/amba-clcd.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-=
clcd.c
> index 9ec969e136bf..8080116aea84 100644
> --- a/drivers/video/fbdev/amba-clcd.c
> +++ b/drivers/video/fbdev/amba-clcd.c
> @@ -758,12 +758,15 @@ static int clcdfb_of_vram_setup(struct clcd_fb *fb=
)
>  		return -ENODEV;
>
>  	fb->fb.screen_base =3D of_iomap(memory, 0);
> -	if (!fb->fb.screen_base)
> +	if (!fb->fb.screen_base) {
> +		of_node_put(memory);
>  		return -ENOMEM;
> +	}
>
>  	fb->fb.fix.smem_start =3D of_translate_address(memory,
>  			of_get_address(memory, 0, &size, NULL));
>  	fb->fb.fix.smem_len =3D size;
> +	of_node_put(memory);
>
>  	return 0;
>  }

