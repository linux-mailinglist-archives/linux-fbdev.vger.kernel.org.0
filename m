Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F380C70FD8D
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 May 2023 20:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjEXSLr (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 May 2023 14:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233219AbjEXSLq (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 May 2023 14:11:46 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1873098;
        Wed, 24 May 2023 11:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684951892; i=deller@gmx.de;
        bh=vYF4rxhK78UkwtODl6bqMtSb44Y+lQ/HCY7sfkZcbS8=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=ZYn2zqPaBgoLl/eyE6v34K9o5YkJ940ZepXfCWsk3Z0S1/+IwraZb/OrUu2iv/umK
         VGYfyIzB72VsRDdjZ9fMMp7fjN5HRZk1280ehPukXbVKjXNAR+gvRyuk0RF3FbMjmO
         7gTls4OsSLi/H7VCfcP04utVQoLZDyMeot5xh/tjRXJedBlIlP2KsCsIwmGaPHXDOB
         gDxNpOZisOd1O2EMNLeBhc2RTUtGw69u0dDKLjXPCptxciwMpM1TiZWo3brF2sksoG
         UYdb9l+Zl7WzkC9E4dv9WWDx3zVI8M6yRkvKsIYgGO2cHAtR3b5rzid077QdL40NyH
         +9ZglOt9TgW3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.145.4]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlw3N-1qSB6N1o7n-00j3Km; Wed, 24
 May 2023 20:11:32 +0200
Message-ID: <a4b406f1-5395-1187-a27a-26fc4a5a00c5@gmx.de>
Date:   Wed, 24 May 2023 20:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/4] fbdev: imsttfb: Move a variable assignment for an
 error code in imsttfb_probe()
Content-Language: en-US
To:     Markus Elfring <Markus.Elfring@web.de>,
        kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Javier Martinez Canillas <javierm@redhat.com>,
        =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Zheng Wang <zyytlz.wz@163.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr,
        1395428693sheep@gmail.com, alex000young@gmail.com,
        hackerzheng666@gmail.com
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
 <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
 <38cd2e4b-3df4-6c69-b790-5762d24e2c29@web.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <38cd2e4b-3df4-6c69-b790-5762d24e2c29@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kwyZx7UVkFvtxjWPnX2J8lIg0jAOScX6U8y+gyILOdLeImC40ps
 TzDm8sPK06FrP28YUAkhqhEo5hszE0JgnmP4BdDPeMs+rLIVD11rvp7zO4SDa6UlPDQExXv
 uh9og1moIlqbrFWyDp1WKn9vKNdAsNuSsl/Ypk/z83bxy9TWJg1G0rcXur2WF0wZGvCsuna
 EL/HKfFVycHCIkYVTSc6A==
UI-OutboundReport: notjunk:1;M01:P0:wlg3kCL+FKU=;ZHDw2WCNMHfZo4y5j9oFG5UkHnM
 oJj1BhnsmIZb+t2fnLt4xMxL+rbWcb9+5v4P6ptVsiXQWpUKPsKJDrXwRUo1aOomZbrEunCwV
 wVkXoxbfti/xYronrpDJgPi3rDwyxoBQSJQIgArkBXom6TNa7/XrHYxwid9Pj1Z4tXOQk4Sgz
 j52juP2nzx55hk6TSNftSMUnuEVHu6UA74u6bVGzmY5UZ29DlFdS65w94RLu0sCs/t+k4ptfx
 +kwqi/yQe+wgVOPNYGcYI1+iriIedeokdZWOnsUO53H3ap7/a9+ktRMbK8aJ1HxUkErN4RtSv
 +3qYAtrqcldSLOtucesHtXQqjdIN4bzoYFmnR6rK0PdUGEoePaqXzLbEWyBpKOPKCtVfGwrz4
 Q6APQn0La4RxJ/oJNC+OHb+bKp6oRTKUfxokVl0GjKMefeF625jUqvKwNUeeS9o1Ohqw0ykgZ
 StzY9fV/SVoieEy8Ye+OOiCbLx0UvUI1qaR2ocMOONbf1ynQEEHKrX7ufiVdLoxcCbdKNIuOd
 txMhg9IVk2alVl/IqfvTAawAwNmEHEtqJrc1vWFn6K81M2vGDvG7nCAuEvlbcGbAsh+EjnGiH
 Xn91rQ+2j3jhMavivXmt4WkfrkOYt6CIROyP5ci1x1ghvbmY3Q5iSWBHF3gqUJxfe5esdoamM
 LvIvFbzsG42fJ/jWQwZuOlh2zREnE/7rJM6zXSjgw2dfCUDo3Xq43RQrDqZ1dpfoRRx7KVER6
 NMSKR7uMaPWS5/yTYd3HYESw3rFhQky6yFkcMmPT6x8fcY8MvoKem3QnKHxyerh9Tp6XN77Nq
 R8MIrirb22ydmpruABLrYlMSFEzo/LuMDT7Xa6tS9jCdlbQv9qtyJfe/ek63r+/Y1DDVfTszA
 ZvGLFfVoWmIJE68f5Ux3Mi0U+VOQeF4qBh2tRGPdE+QvSFKqNUcLqAOHADPIGqqprcypzPphl
 ofS29g==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 5/23/23 19:42, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 23 May 2023 18:30:26 +0200
>
> The value =E2=80=9C-ENOMEM=E2=80=9D was assigned to the variable =E2=80=
=9Cret=E2=80=9D
> at the beginning.
> Move this statement directly before the first ioremap() call.

Please do not move such variables without real need.
It makes backporting (of this and maybe follow-up patches) much more
complicated and the compiler will optimize it anyway.

Thanks!
Helge

>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/video/fbdev/imsttfb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb=
.c
> index 6490f544f8eb..90c72428e8d7 100644
> --- a/drivers/video/fbdev/imsttfb.c
> +++ b/drivers/video/fbdev/imsttfb.c
> @@ -1484,7 +1484,6 @@ static int imsttfb_probe(struct pci_dev *pdev, con=
st struct pci_device_id *ent)
>   	ret =3D aperture_remove_conflicting_pci_devices(pdev, "imsttfb");
>   	if (ret)
>   		return ret;
> -	ret =3D -ENOMEM;
>
>   	dp =3D pci_device_to_OF_node(pdev);
>   	if(dp)
> @@ -1525,6 +1524,7 @@ static int imsttfb_probe(struct pci_dev *pdev, con=
st struct pci_device_id *ent)
>   	}
>
>   	info->fix.smem_start =3D addr;
> +	ret =3D -ENOMEM;
>   	info->screen_base =3D (__u8 *)ioremap(addr, par->ramdac =3D=3D IBM ?
>   					    0x400000 : 0x800000);
>   	if (!info->screen_base)
> --
> 2.40.1
>

