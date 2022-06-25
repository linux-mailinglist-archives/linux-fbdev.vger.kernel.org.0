Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 615EE55ADA8
	for <lists+linux-fbdev@lfdr.de>; Sun, 26 Jun 2022 01:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233433AbiFYX4w (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 25 Jun 2022 19:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbiFYX4v (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 25 Jun 2022 19:56:51 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA2C10543
        for <linux-fbdev@vger.kernel.org>; Sat, 25 Jun 2022 16:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656201404;
        bh=VTxppKwqJfr3ONtRcRtl1XWTSJMhzCmk1TNtgjM7VCU=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=O9cN2OLwzGIjWzQzg+E2cBvgdPxMK/5jrsQe5TfIFSsHY72/1uzSMjy1OFAj3LFEZ
         M6668Rj1Z0Y1ynJHw1j027557FJ+RcuzlIkvJvKYlCva1PHaUIO3v3SOZVuwfctTAf
         xQ9dYSspf3yfDy5lHAOSoHcFoxA1WzfTcpSgt/5M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.162.44]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mz9Ux-1niNZ91Ucl-00wETt; Sun, 26
 Jun 2022 01:56:44 +0200
Message-ID: <92f2ca1e-20f7-c456-0cd2-609202e337a2@gmx.de>
Date:   Sun, 26 Jun 2022 01:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/4] fbmem: Check screen resolution change against font
 size
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
        linux-fbdev@vger.kernel.org
References: <20220625220630.333705-1-deller@gmx.de>
 <20220625220630.333705-4-deller@gmx.de> <YreNUfv8d9QeJT8C@phenom.ffwll.local>
 <YreODaSXhAhipJKa@phenom.ffwll.local>
 <5e03d6c5-e254-f5f6-9e02-bc996d41718d@gmx.de>
In-Reply-To: <5e03d6c5-e254-f5f6-9e02-bc996d41718d@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sEwV10plS3Y+ryF+rxH5of9Hmnq5/YAiWB2CE5Rd9H+e2i3qMuy
 /jUNYcX/JKavmLxdJO7NN5GUTECW7YnWU+BuMyqEWn9zz7JJ2C50xVU0tc82Zqyxq1OLavU
 XSPowdfCOyrK41vltDfv6d5rzlpe6z314BsjQyyiX97E3TTZNBZykazWnvxaRlJxx45bDXY
 kYPnHxsDY1KkIKtolIfxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/Snn3i7vWJ8=:TSxAQZkKY87d7phi/uX089
 A3licZu+919I5aFvHKg0JIZ+aWqXFVYwOlFobyGOV/xzACnm5MU30iaAASWBtTJLiyMaN/QtJ
 Fk9+MaFaSypdKfap0OtBHH3ZMqSX3pLcrcpTXULwKIWl5tvfU0qQnw2T6O95BHpijnpu/kU1w
 U7duUaeaWV6sSdnXiM0cZdwmi+8dxGca+mx+JUCSWV4M1Rwe7LfgNfCzY98A03PVt86IMkE/p
 ZweviSmd+ZisFO46CSbf1Gl3bAFeZ9wlq1rK+TjlLtT8+8ZrTm5g0bo4Xf7q4b6ES8kKNEVQX
 kDAopR9x0+bdT0VnofSJpQABIGgxhnl4LAcyvGqZF0j4J6YDPz7J8UfoLej7pwalmXNBCCoHE
 IATmxjSQn5051EHTkg34Zeuw1hi5NAqUbN1grras64m0CeVW30WdvYUp5j4fWzOLfwe+wNn8z
 uvztE91EV6Yohe4ROdSjw+mJ2BcftoAduGBvy0uQrak/+Ix9qb6faGULF0rDWhtDV2NKY5L9Y
 D9+idTu1oxlPatyVLg+r/TMhRbzEsPmw05BuCn+K+EoqYh8BN1qs8S4nDTvTvLvLJn3q229ho
 yuy6NQvPUQu6VJwzpnDSKPhJOjAqjen3Lxo0RXbE3rlyNGtrYcYjEOuW9RICpLVeNfFGfEIJY
 pOfoK2cSwEFXHK+jkF8n4Iak1ID2Nf8XJb5XTz2/Ae9Kr9I43bA0V4mTuVWaXINdyBSFbG7mz
 QlO9N+m7gTgUhg6mu541nI/YNZUpBdq0g5ocAGDinOKmtpz7/enI9dVSs9GT3LLj/WMK+eSSs
 IY/tKvHnWUZGtDxej2j/O6lpZXzHwKc+9I2lRGNEMt56pAQ6F+6lHXAGRYEXyMv7wOfB35Tfq
 EQLLj5C3TA8bAm5SQ8iESb/heJR7NVRnrFcfEfbcFwxZIkxH5NkT/NHwD4UW975xrQ4ETlU8K
 8yFZp3sGbMZZfinSBVF0OGLf1t2zUc8wAKOAoP9wjjpBt5KPCtJjCHDUJgh0LUuLvWU+R+Lld
 ZDzYbtb6YlL5syZRw1FdNGyBCV20Xa2vsOUvJXYqaveZ/beWYsbvXfmcgLH2MoX0VYJGyKURk
 csrjAwx9pUoF17GdVSdrkVs3FmfHpIO2uN1emRaKTIjNGw+kedD99CZ7g==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 6/26/22 01:12, Helge Deller wrote:
> On 6/26/22 00:37, Daniel Vetter wrote:
>> On Sun, Jun 26, 2022 at 12:33:53AM +0200, Daniel Vetter wrote:
>>> On Sun, Jun 26, 2022 at 12:06:29AM +0200, Helge Deller wrote:
>>>> Enhance the check in the FBIOPUT_VSCREENINFO ioctl handler to verify =
if the
>>>> user-provided new screen size is bigger than the current font size.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>> Cc: stable@vger.kernel.org # v5.4+
>>>
>>> Please squash with previous patch. You might also want to add a note t=
here
>>> that on older kernels backporters need to open-code
>>> fbcon_info_from_console instead, since it only exists since
>>> 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_info lookup")
>>
>> Maybe easier would be to include that patch in the backports instead of
>> open coding.
>
> I was afraid that WARN_CONSOLE_UNLOCKED() hadn't been backported.
> But it seems it's in v4.19+ (from patch 56e6c104e4f15), so that's ok.
>
> So, yes, it seems pushing 409d6c95f9c6 backwards is probably best.

It would be the best solution, but sadly 409d6c95f9c6 can't easily be back=
ported.
So, probably my other approach (fix up afterwards with extra patch) is
the way to go.

What's your thought on this ?

Helge



> Will try that approach now.
>
> Helge
>
>  I think that's what Greg generally prefers at least, less
>> divergence between stable kernels.
>> -Daniel
>>
>>>
>>> With these two nits: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.c=
h>
>>>
>>>> ---
>>>>  drivers/video/fbdev/core/fbmem.c | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/c=
ore/fbmem.c
>>>> index afa2863670f3..160389365a36 100644
>>>> --- a/drivers/video/fbdev/core/fbmem.c
>>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>>> @@ -1106,7 +1106,9 @@ static long do_fb_ioctl(struct fb_info *info, u=
nsigned int cmd,
>>>>  			return -EFAULT;
>>>>  		console_lock();
>>>>  		lock_fb_info(info);
>>>> -		ret =3D fb_set_var(info, &var);
>>>> +		ret =3D fbcon_modechange_possible(info, &var);
>>>> +		if (!ret)
>>>> +			ret =3D fb_set_var(info, &var);
>>>>  		if (!ret)
>>>>  			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>>>>  		unlock_fb_info(info);
>>>> --
>>>> 2.35.3
>>>>
>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch
>>
>

