Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE80D66B3EC
	for <lists+linux-fbdev@lfdr.de>; Sun, 15 Jan 2023 21:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbjAOUql (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 15 Jan 2023 15:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbjAOUqk (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 15 Jan 2023 15:46:40 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA63413511;
        Sun, 15 Jan 2023 12:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1673815583; bh=DP/1nuJOTE9gH1Zhyg7I2is4AeYaxDt/PxArbptl+Xs=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=atG7FCQFYgQtTtBmJq9FYBNKK94PVv/fHkFie+e5rI5f3pYu00aMxSM4vsQZvbcy9
         ZPd+/YlBVZBW34z9pjgFripPUNnCm/x4PzeiyVecMNhk2ywWYgY8zmzeWa5wv4CyZa
         sjo4BLB4ccW85OYueS2yF4AsdWgmkQFJpvZOFBipDkWJ1W1F7sfTEnafCyT9jD5fKp
         KYzbAVmti3Vb1xksmqlCRh71I8V3az8SPFNgxTnmsuFJzq4xks5x+rNRT5A+3UpUi5
         GEMcxfTZKr9PNdLLYZLgOOzCP78/4+z6Jli/GRR44wrTa0lqMNtNmVrbRlJSaqKUED
         22hI5MfmXl1Dg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.161.25]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mj8qj-1olggk2lj3-00f7nS; Sun, 15
 Jan 2023 21:46:23 +0100
Message-ID: <a3e368c5-3b4c-fe05-394b-50d1a1c01389@gmx.de>
Date:   Sun, 15 Jan 2023 21:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] fbdev/g364fb: Fix a compilation issue
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>, xurui <xurui@kylinos.cn>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, trivial@kernel.org,
        linux-mips@vger.kernel.org
References: <20230105094039.1474255-1-xurui@kylinos.cn>
 <CAMuHMdX174erGgrCUBv2WdX67H=mig-hi=SOdeMJ=0__thC_fw@mail.gmail.com>
 <CAMuHMdVdCBxZ39BbtLDPeiMK9BK4M0W5hynrYLFx6+ibunyxGw@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdVdCBxZ39BbtLDPeiMK9BK4M0W5hynrYLFx6+ibunyxGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Dv6Nk/b9mmPf1W7hYeG8O+pCiMM+daiwzKYotwx+ScqZyXtQjgX
 Z6GUo9bnwKFF5agwFfckUMINAbt8mJElX1DtdKYo+rc99J+x894aI/lWCcrUQ/Hr9q2A9nL
 FoqQmH2y8dFAuOyu1HyPQEtxecuThxtp37QTs4J4v4eeNaiBHuf0fHyTT2/g/hHUtt9XSMr
 6QrvXdSxxWdOilXI8g/ZA==
UI-OutboundReport: notjunk:1;M01:P0:JhfJtG26gX8=;CebJ7tLwaEfjeNX0T75Z3Ga6S7z
 tyuFPNI9Vk8Syp0h7QAeESs9MvMGs9gYgvkMms01AJ9ypOrBBwajeH4S2cJ939euZZYdj5Xuj
 Y1qzfOOZg7sRVogS7/xPMm4/Lgx7Q4/VW2UWZKBYLqYotMS7aVY8ZVJ4DuZIH0jB9otzyqCRT
 DhpdF3O2SjMAKW70WqmcxbpWe7cnJEY6evYFhaThc8R6sklfylJAQTVECv+qJ26/+2hbCINAm
 UeasWkmiQ/pVEPHWeLJ9Jw7GmiY8IRxhh7L0+FiKmlSZFHYd09j+Ca5CZg2Z7uOAxciCGIDDl
 TIuwUeqI+aO78ubqBdLWLjjpYh1xsJ0QolLFcKJeSMfWTuehM/zU+n11SAflN7Taa8wxcHmqX
 bjA1o5znJEmk2uEMp8Nqm3no6ZyJUXsl5yoOUS7/efLoLgp8tP9Sfn3j+7aJQ9YeHNW3AM/ZE
 H5tEFWEmZp/pFWLDbJ6l609e2HLzg3J6kZgNTy3MsuQG3XpqjlUu1NG/BpUnaSHmnQzeKQj2r
 jJnSY85hMri2TlPyTJEkAp7VjLbx+EhUseJVBc9FVigObR/Lk8dIofUzgNFmyYN2MvqewWgkk
 HATHaCI/efFCmThr0MrMnEJ6dYgrR0I6s35RbTVu6KIBw96HUHgZo4Yvah5H76BWXtnNNl8ug
 /j+xjm8FE5HiD8kekeLUA5tswzzdOryMKLSuvc/LC3XzUCB1KBn5ugsJ3QwDiMUJiFcpZafLT
 uZno9JP7pHzJvvo72j0FYNA5ngC7Dy0o2wGWHxdzDDLgt9kQjT6T1lmhESTe6X1jwDPTS9Y7H
 WRmMOj7EB6rmTMjDHnfdqW/8eMT+w8SvQdi9qP+858zF7Sx4T8ho6H9UxJARe/gNaQD3dsUTc
 qih88DeJdUuehmtmpjwsKlfsirdwe55NoYjius88o3c3pvUlpDt0l0XJGE968+/d0tP7Zg73L
 iCOQHg==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Xurui,

On 1/9/23 11:04, Geert Uytterhoeven wrote:
> This time with the new linux-mips mailing list address...
>
> On Mon, Jan 9, 2023 at 11:01 AM Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>>
>> Hi Xurui,
>>
>> On Thu, Jan 5, 2023 at 10:45 AM xurui <xurui@kylinos.cn> wrote:
>>> drivers/video/fbdev/g364fb.c:202:4: error: cast to pointer from intege=
r of different size [-Werror=3Dint-to-pointer-cast]
>>>
>>> Signed-off-by: xurui <xurui@kylinos.cn>
>>
>> Thanks for your patch!
>>
>>> --- a/drivers/video/fbdev/g364fb.c
>>> +++ b/drivers/video/fbdev/g364fb.c
>>> @@ -175,7 +175,8 @@ int __init g364fb_init(void)
>>>   {
>>>          volatile unsigned int *curs_pal_ptr =3D
>>>              (volatile unsigned int *) CURS_PAL_REG;
>>> -       int mem, i;
>>> +       int mem;
>>> +       uintptr_t i;
>>
>> This doesn't look like the right fix to me.
>>
>> The line the compiler[1] complains about is:
>>
>>                  *(unsigned short *) (CURS_PAT_REG + i * 8) =3D 0;
>>
>> Interestingly, it doesn't complain about:
>>
>>          *(unsigned short *) (CURS_PAT_REG + 14 * 64) =3D 0xffff;
>>
>> This driver uses raw memory writes to write to hardware registers.
>> Probably it should use writel() instead.

Xurui, I'll drop this patch from fbdev git tree for now.

Please check if the driver can be converted to writel() or similiar.

Thanks,
Helge

>> [1] mips64-linux-gnuabi64-gcc version 10.3.0 (Ubuntu 10.3.0-1ubuntu1)
>>      jazz_defconfig + CONFIG_64BIT=3Dy

