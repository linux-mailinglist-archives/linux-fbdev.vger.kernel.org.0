Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B59C7E49F9
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Nov 2023 21:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234488AbjKGUiC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Nov 2023 15:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234225AbjKGUiB (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Nov 2023 15:38:01 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B0B10D2
        for <linux-fbdev@vger.kernel.org>; Tue,  7 Nov 2023 12:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1699389463; x=1699994263; i=deller@gmx.de;
        bh=G1oAVJxX4WKMy67CYMBY2TfnQ02yPR7nX11ekTI515U=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=ZC9fERY6yoz6N13mCouHVlVQKLv2fWGUeyYWvyyIN5n0wpxwv5iNunFbdpCK6Tz/
         /BhC+VfiT91mfRHVxqfRxs4EmP3UYg5qt5rgwyxaiGm+GbbrIFovCRqrWcgckPG4r
         GLJH6mPyBfKV8DOKz/5OtWNNhwFXv2e5SFKiO9VlhPvh9V+6FY8ye0Bs9GOSfnTBf
         P6GolyKzOH6vXULgaf25Yw7/JxnK+jnvrzm7m5JKJw3VVtgMiqLBIuJ+1iYLNTVVd
         +uPNVBFBlPN0gJW1x9yPOsFtyngLD5zOwJQgwk2DFx5KZMZh9K/4YKGwoe4lMGHDT
         EKKBvX8uarvWFsPFMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.202]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnaof-1rjfcI2bCv-00jZhD; Tue, 07
 Nov 2023 21:37:43 +0100
Message-ID: <ab15a344-905c-45b6-ab4f-110dcd6e313b@gmx.de>
Date:   Tue, 7 Nov 2023 21:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de, Nicolas Ferre <nicolas.ferre@microchip.com>,
        dri-devel@lists.freedesktop.org,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
 <20231107200134.jsowrcruisrtnspw@pengutronix.de>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <20231107200134.jsowrcruisrtnspw@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LSCRwtkm4U+LjStKzbPNPHK5WYsaSW7qnanB+59NPL37cp1Z9nB
 ejteWqjXs/YAvUSXEtRYMc+3zeKH3BmdvBYkN0oJO8DotPHJADsWCAFHclJqmHu5wX3PwaG
 pYQT6z1zoijZ26fahr0TIMUI4Y7Vc0yUFQHS/AsKrX/RCymPn9FuGGTowgzVRPe0nikyLj7
 Wi2phg0Vo1mJTpi6N5sBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qdVYwckcP8g=;wJu4ILOWfI5prrUJWkKWg+zoAdW
 t5N5NMBBnVtC/vGoyiyONsLClV8YhBVJmrK4paH/WvIEH5PIMXH1Oc7qoLCiOJ2mo47lz0tbo
 knj8k8tHLVjGVkN8YiBpdaZVK4S+vuheimGybLMivRzzihmILVVyK4NfV36EvsX+izHq+L7ll
 IXtJKgJMxUVKVbuqIlRuh7AKQYGkiOA21EtHOtiVLRWSRursfPvAvijQotYIMS+GSRQSMxicA
 M5N/kODepSzFLRrL2tKX8NTujJmfRTtKhv40Cr3HbQV0Re+576NYHbKtf/PjA75vVn5xrOlRj
 /Gt92uoPZIu6dGtglTJQZz4lfS0hWn7SPc0cfWDZc9g/EzhnsJWfIp4q5VuteyY8VJTE1vic4
 6kyVErObqRi0+lLD07ukAMM+nXA4iYEFYdJVH21DnQJdn9DEX8uvOdKCz+fUVcEq38mJNJmb7
 Gt6LoP1EEAJIJ4KL2eXV8L2uhQgoU4mBI94IHHhNhDKBVKC+z6m99+m3O3oCeYf5CVZCVn0o2
 sXIutcuPAAMhUZE2USllYYf8n9PirBhYa4FIfm1FnG2ak8FCZ1lVqkurjzgkCSbYRtBKfqSZ2
 4R8mVT8WSbazul5RkSFNbONG4GS8ZhpkYfGI4JG67lhsi34CIlDA8g5XLMGQo/yeLor0D36Ur
 CLGm+P/zgFTioZ/jZdq2iLamd9UaRV1yhiVynwsfMXQ6NsmOWRf2BoLbirMx4WAp63VIGqS7B
 rVNbIZHSKe3Z5fINFoO6APzEs76X94agpu4C2eSzJr4g4nUYWnMcYoV9FeRaMtQjJEA2iRwYr
 N3z7aczSUlO0agDCJPBRcg3dAgcva4KenUm49+zG7Lpa7TTDjLWMmPncta/unRDmv9xK9TFAa
 U/VdA+3pcs1lBe8PuqIZ3YNbLjdJIZWnN7skAIKK1ktDsxEtTC5qpBFuaBfjo9q8TuBFBAxEu
 Kjv0O4oziwok//TRS8h87sN2O/8=
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 11/7/23 21:01, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Nov 07, 2023 at 10:17:43AM +0100, Uwe Kleine-K=C3=B6nig wrote:
>> On today's platforms the benefit of platform_driver_probe() isn't that
>> relevant any more. It allows to drop some code after booting (or module
>> loading) for .probe() and discard the .remove() function completely if
>> the driver is built-in. This typically saves a few 100k.
>>
>> The downside of platform_driver_probe() is that the driver cannot be
>> bound and unbound at runtime which is ancient and also slightly
>> complicates testing. There are also thoughts to deprecate
>> platform_driver_probe() because it adds some complexity in the driver
>> core for little gain. Also many drivers don't use it correctly. This
>> driver for example misses to mark the driver struct with __refdata whic=
h
>> is needed to suppress a (W=3D1) modpost warning:
>>
>> 	WARNING: modpost: drivers/video/fbdev/atmel_lcdfb: section mismatch in=
 reference: atmel_lcdfb_driver+0x4 (section: .data) -> atmel_lcdfb_remove =
(section: .exit.text)
>>
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> ---
>>   drivers/video/fbdev/atmel_lcdfb.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/at=
mel_lcdfb.c
>> index a908db233409..b218731ef732 100644
>> --- a/drivers/video/fbdev/atmel_lcdfb.c
>> +++ b/drivers/video/fbdev/atmel_lcdfb.c
>> @@ -1017,7 +1017,7 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb=
_info *sinfo)
>>   	return ret;
>>   }
>>
>> -static int __init atmel_lcdfb_probe(struct platform_device *pdev)
>> +static int atmel_lcdfb_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev =3D &pdev->dev;
>>   	struct fb_info *info;
>> @@ -1223,7 +1223,7 @@ static int __init atmel_lcdfb_probe(struct platfo=
rm_device *pdev)
>>   	return ret;
>>   }
>>
>> -static int __exit atmel_lcdfb_remove(struct platform_device *pdev)
>> +static int atmel_lcdfb_remove(struct platform_device *pdev)
>>   {
>>   	struct device *dev =3D &pdev->dev;
>>   	struct fb_info *info =3D dev_get_drvdata(dev);
>> @@ -1301,7 +1301,8 @@ static int atmel_lcdfb_resume(struct platform_dev=
ice *pdev)
>>   #endif
>>
>>   static struct platform_driver atmel_lcdfb_driver =3D {
>> -	.remove		=3D __exit_p(atmel_lcdfb_remove),
>> +	.probe		=3D atmel_lcdfb_probe,
>> +	.remove		=3D atmel_lcdfb_remove,
>>   	.suspend	=3D atmel_lcdfb_suspend,
>>   	.resume		=3D atmel_lcdfb_resume,
>>   	.driver		=3D {
>> @@ -1310,7 +1311,7 @@ static struct platform_driver atmel_lcdfb_driver =
=3D {
>>   	},
>>   };
>>
>> -module_platform_driver_probe(atmel_lcdfb_driver, atmel_lcdfb_probe);
>> +module_platform_driver(atmel_lcdfb_driver, );
>
> Argh, the , must be removed. I had this in my working copy but forgot to
> squash it into this commit. Sorry!
>
> Can you squash in the following please?:

Sure.
I fixed it up in the git tree.

Thanks!
Helge

> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atm=
el_lcdfb.c
> index 0531d6f6dcc5..88c75ae7d315 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -1308,8 +1308,7 @@ static struct platform_driver atmel_lcdfb_driver =
=3D {
>   		.of_match_table	=3D atmel_lcdfb_dt_ids,
>   	},
>   };
> -
> -module_platform_driver(atmel_lcdfb_driver, );
> +module_platform_driver(atmel_lcdfb_driver);
>
>   MODULE_DESCRIPTION("AT91 LCD Controller framebuffer driver");
>   MODULE_AUTHOR("Nicolas Ferre <nicolas.ferre@atmel.com>");
>
> Best regards
> Uwe
>

