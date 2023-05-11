Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF0D6FF6AA
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 May 2023 18:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238504AbjEKQAw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 11 May 2023 12:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232006AbjEKQAu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 11 May 2023 12:00:50 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0992F40E7;
        Thu, 11 May 2023 09:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1683820542; i=deller@gmx.de;
        bh=hOxitp/yaN+69Px02kO6cECAR4+bMiAqGcDDxqr5bj4=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=l6yXOKZHiIm0r5i3aB2VqyGZ6FuFRvtQYKlkazZt+BMEEiCtluT0fIJqlgCBk043R
         mWg99aCTX7wBfotON0L+6tMKq/aErO5mfCEWPLVRpiuJ71pyBflp1FCJEYlCJf9Caq
         a/6wh8GFGxE2ZO7H0SVlRGNGI17x0BLHH2syt8i8VfqCTyTReq1di9VJfniRBjVUJZ
         oa56VC14pOGYEfaciSzV48cAbYidst77uhPN4bvEE/Y1tNtcEhGPuDSKW4ia0Ac/ko
         VM57mr/EMj9/Ge45vTDbTDlw+USWhobidTnDdVQAMHB02xosXEU8EIEyPJR346pqDm
         XyUvOjkMbrjzA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.146.253]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VD8-1qHjVs0yja-0170TE; Thu, 11
 May 2023 17:55:42 +0200
Message-ID: <b7e5e4b9-a0c9-96aa-e264-a8ccfac5a768@gmx.de>
Date:   Thu, 11 May 2023 17:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drivers: fbdev: arcfb: Fix error handling in
 arcfb_probe()
To:     Zongjie Li <u202112089@hust.edu.cn>, Andrew Morton <akpm@osdl.org>
Cc:     hust-os-kernel-patches@googlegroups.com,
        Dongliang Mu <dzm91@hust.edu.cn>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230509112727.3899-1-u202112089@hust.edu.cn>
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20230509112727.3899-1-u202112089@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nvQGXvbSKhOGnAlC8Od/eLS2GcfsQZ1vvzME7KQ87ecMofiVpZX
 SyeEslrtNOhQytv9cNg74BGJvt+mH/zcrvC9JFzzVh7mbxLzXSojOwIlmrgTXkcOQPygW7t
 V1ue1iviHLZcsSe06gTBsAostoo6dPrnW9uFokywYQxo3hCn7kJBu+gxD8nHyIi/Jt/Yulj
 JY4Q6WSmmZu9R/NSs/BlA==
UI-OutboundReport: notjunk:1;M01:P0:Tq06VYnPlLk=;jg+peQKOTkC+a8UGg6dWmC1XLVD
 F9j3X8jN/rZ4cVDTjKl6Wqw1IPlIjT7uPo/1vMpBuhq24yqt3dH3q2dmJRpKWKClq+7d4+uqR
 k525TYJ5pn6EAtO90i2n9XZgqXt3F8p6S1c4yb+YM5qx4hpXUZTjyeqFzMM8DKVnonT36sf7h
 7tFNbTOffh242zi5TectolQG08lrAf4Y+8JtFCPOytM0wXHw8FTCrMUm27x8Qrlui6nsSawXx
 6/uckt4pymCNLwZhvUKrPGF+iEpe7EmRmCmMzd4NkLH7aBNyL506sKy+/pGoqznp+5XW5uS/Q
 rOUymI1TMuwSfkeo+53s2RkXMkDF/vR/TjhvzYSSmo8tUfNMjgfnE9jVthRh9/Br7ZPCPxh0U
 PpUv36NsWtytjOrF0VMOQRBGiPxAnULGfgkt0wKt5w6r/BLzjYMIyDW/iAM45lJeqhbg0mqXu
 CaBHNdisH5T15ChCFC7uoDiz6uYcNUDiwhyMPhTlmyJd8wuPSVPXGPBfGAAX2BweB9hy7dsDS
 1WNqZcPeuimehW/gdXVysqykctkayfKQlZY8rl2zdsV2Y3SNvX/qXv0jgQ60FipzP7bohjew4
 HokCHv22NAvp9A8nUTCHivb+cHbLcLMlKVqQW0G1GAW1HtG+FIh5pwp6kL8peOGDDwez4z/Um
 APGrB9sNkht5W61vABGwacZfD0ioSNeuIdeHUpuWgbfHzYKZETYmn9aXF3VyuyLZe9eN8l+TF
 O980rEcdI0JxhSocQy6tRD2fVwRQVezjqReUw76C8u/StOBXoVGClOzEudmX6JGqF/bg5m7K9
 XGAv7I51IAt4kP1l8hhikVgseHixJ5T5EnM2X7Wd3u19Mt+03e3mmrya3gWVwoOdkfuSvTW8T
 U0uzLnNmW8l03L2mV+xVc67xn/qlOQXqFs0+v+K9CdMDTNyVnadkIw35pFp2TKQEto6s85It+
 6MaG7MpiKBDi048Ah+/VTdpRu3I=
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 5/9/23 13:27, Zongjie Li wrote:
> Smatch complains that:
> arcfb_probe() warn: 'irq' from request_irq() not released on lines: 587.
>
> Fix error handling in the arcfb_probe() function. If IO addresses are
> not provided or framebuffer registration fails, the code will jump to
> the err_addr or err_register_fb label to release resources.
> If IRQ request fails, previously allocated resources will be freed.
>
> Fixes: 1154ea7dcd8e ("[PATCH] Framebuffer driver for Arc LCD board")
> Signed-off-by: Zongjie Li <u202112089@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/arcfb.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
> index 45e64016db32..024d0ee4f04f 100644
> --- a/drivers/video/fbdev/arcfb.c
> +++ b/drivers/video/fbdev/arcfb.c
> @@ -523,7 +523,7 @@ static int arcfb_probe(struct platform_device *dev)
>
>   	info =3D framebuffer_alloc(sizeof(struct arcfb_par), &dev->dev);
>   	if (!info)
> -		goto err;
> +		goto err_fb_alloc;
>
>   	info->screen_base =3D (char __iomem *)videomemory;
>   	info->fbops =3D &arcfb_ops;
> @@ -535,7 +535,7 @@ static int arcfb_probe(struct platform_device *dev)
>
>   	if (!dio_addr || !cio_addr || !c2io_addr) {
>   		printk(KERN_WARNING "no IO addresses supplied\n");
> -		goto err1;
> +		goto err_addr;
>   	}
>   	par->dio_addr =3D dio_addr;
>   	par->cio_addr =3D cio_addr;
> @@ -551,12 +551,12 @@ static int arcfb_probe(struct platform_device *dev=
)
>   			printk(KERN_INFO
>   				"arcfb: Failed req IRQ %d\n", par->irq);
>   			retval =3D -EBUSY;
> -			goto err1;
> +			goto err_addr;
>   		}
>   	}
>   	retval =3D register_framebuffer(info);
>   	if (retval < 0)
> -		goto err1;
> +		goto err_register_fb;
>   	platform_set_drvdata(dev, info);
>   	fb_info(info, "Arc frame buffer device, using %dK of video memory\n",
>   		videomemorysize >> 10);
> @@ -580,9 +580,12 @@ static int arcfb_probe(struct platform_device *dev)
>   	}
>
>   	return 0;
> -err1:
> +
> +err_register_fb:
> +	free_irq(par->irq, info);
> +err_addr:
>   	framebuffer_release(info);
> -err:
> +err_fb_alloc:
>   	vfree(videomemory);
>   	return retval;
>   }

