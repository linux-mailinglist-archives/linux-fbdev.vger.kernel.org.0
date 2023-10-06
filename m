Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB8847BB2D4
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Oct 2023 10:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjJFIKV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 6 Oct 2023 04:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbjJFIKU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 6 Oct 2023 04:10:20 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74ACCE4;
        Fri,  6 Oct 2023 01:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1696579798; x=1697184598; i=deller@gmx.de;
 bh=iT66/fIkXuxQl5Ykf5c3jyidte+AmXlznZ9k12kkl6w=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=QIpwp84tI0++h9feuiZU4gexg5u5HHfrWsC62NVr1aV7r4t6+r+geNhj+Or6Yp27V4Q/Z5+2FvA
 UY2x/XNTbT+6XJw+qB4S96CdJxBIJJXfct899Dv6HBJIAMA83Izxw3EcEBK9MIDjrMH6Xf2NesThW
 j71PPPUmaZ5AHMCMTjBsa4RF7vKCmJfBr6nLrYAG/nIPLYRbw6fis2GdxIA+B4JOnONTYMi3SUzx3
 G5mt1ZlKtByruXXjZr9wPTfr2qb7rCVvPpuTOQ1n1Gdqzdw0Fe1eC+Kh0HocjNmElTNznOY4Ywgrt
 LMH6W6pqBcHc5B0BLEfnc3vPG0lt6h8CKsBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.151.133]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JmN-1qoOvP0Bmr-000KlD; Fri, 06
 Oct 2023 10:09:58 +0200
Message-ID: <b9e51034-bc6c-81d8-39ef-9fc74fa09c62@gmx.de>
Date:   Fri, 6 Oct 2023 10:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] video: fbdev: arkfb: fix possible object reference leak
To:     Zhang Shurong <zhang_shurong@foxmail.com>
Cc:     tzimmermann@suse.de, jiapeng.chong@linux.alibaba.com,
        javierm@redhat.com, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <tencent_55C1A344A101B55762ECA6A6366D0B0F8C05@qq.com>
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <tencent_55C1A344A101B55762ECA6A6366D0B0F8C05@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xW8ZYfmIVsHIeEXUlDFd07NCLKqg4hpq9PkyCY9xKtX5hx9CRaB
 EePJCyFfn15sI01Yv7JR1IYH9f5yGyOFls0Sun1WAepTf++rnkXMSJoXip+cthx11IW/q15
 FegU/U2T3UJMhGCo6cjWa1a+Uw0Pg6nYcBlonVaFWRqQAEAzGbr5gahcRBSgDjZ4qz1WI1p
 YlHJfFiP71XKjQKmkfKog==
UI-OutboundReport: notjunk:1;M01:P0:PIxdzX21cmo=;/awmiudSoLpgbXtofgLVGPGRkqp
 hPWL6OueJ+V7Rqzz94gLtp6pJC7p0iqiJPgNCcI/rQGrNVP3iDfxrtGGuD4RYD8l5FB33IPax
 ZzYF5psxCJEYsNAxybcNYeU+LVP37FfLA1bRhdX0jHj5y8Q7JVA6NaKIA+COGPNWX0eJ9AG5K
 dGsXZ89bavsxPoacOw7QpNLuDxcCdfrAOzp/3zY2KFhvR2rajVuEjFgIPYEC0h4Uk11cI515j
 0o/ubT2LZp4hw6iTWK3pnt2zsI3hR0h5IJhSmm5e6gw3gERaHne2W9mZcCudMQfd0EtvHE/5V
 UFkuoY5oaTA60tZ0sK+wlkr8U7Vvs9uNrGDGZcomPF+dHKYBz/pPM/2lRUam6svtXoHQ4BwBs
 kZcgCmSeynOlpSCiXF57syZRcAgFisezEbT7RBoy/vKHFhfo/EJCMt24GAWtmLMCMrbkb1BB1
 mXTi2MmhiKjpiWDFTAXOsTKkIqE4kZ/tb5jGVcQuvhuQj8EXmbk+F/04rWHmCfrl5NTGVFqfE
 wbbE6AA1jVeKFocC0QJ2U/GJVasumMFJRRp0Dw8a96+qSlTQ2FZyh10WGrLAiNCqJ7FU6H/jg
 /aFb6QSi3TuFqJuI+WWc2CP0fTS0XSgr5p9BJRDB4S+9CXlYeB7+tYJlOMjSrxtXVKSGPcK3d
 zabtNJ2feeS1P1g6l4VGsGEP6L2SgWf2c/vOZkKeD2t12TznFmEcH9O+af2nrsSUO3D0s/+HJ
 cxfUTQ3bWLPm1FFfvnLiMhi1LJJK+O7Rofwtzwv+4YSDPsvFyrLJfygIhM9XEZp+rkTfSgSts
 REBEC+FGPZbiY7UuGf0dIq8OQu1rJsKqdJ3VwQKtrwrAdPeVP7AF5Dy5HDRR2jf/rY4QkBpXM
 7Cj1TkGKEo5xTaDaZH/FWhg5sK2sSiPW2rVgqAbvn4sJXXly7DsQTfxXyE6hy6F+byT2SjyXR
 +4AZPg==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 10/5/23 09:01, Zhang Shurong wrote:
> Add missing pci_disable_device() in error path in ark_pci_probe().

Do you have this hardware and tested your patch?
I'm sure there is a reason, why "pci_disable_device()" was commented
out in the original submission in commit 681e14730c73c...

Additionally I'm wondering why your patch doesn't show up in
the fbdev patchwork, although you added linux-fbdev mailing list.
Probably a vger issue.

Helge


> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> ---
>   drivers/video/fbdev/arkfb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
> index 60a96fdb5dd8..6c4e5065646f 100644
> --- a/drivers/video/fbdev/arkfb.c
> +++ b/drivers/video/fbdev/arkfb.c
> @@ -1064,7 +1064,7 @@ static int ark_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
>   err_dac:
>   	pci_release_regions(dev);
>   err_request_regions:
> -/*	pci_disable_device(dev); */
> +	pci_disable_device(dev);
>   err_enable_device:
>   	framebuffer_release(info);
>   	return rc;
> @@ -1085,7 +1085,7 @@ static void ark_pci_remove(struct pci_dev *dev)
>
>   		pci_iounmap(dev, info->screen_base);
>   		pci_release_regions(dev);
> -/*		pci_disable_device(dev); */
> +		pci_disable_device(dev);
>
>   		framebuffer_release(info);
>   	}

