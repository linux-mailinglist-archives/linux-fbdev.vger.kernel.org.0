Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A849D55EFF9
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Jun 2022 22:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbiF1Uwq (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 Jun 2022 16:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbiF1Uwp (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 Jun 2022 16:52:45 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF43D33897
        for <linux-fbdev@vger.kernel.org>; Tue, 28 Jun 2022 13:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656449558;
        bh=XazMmv0sZuZYFOGQjgLrbL0sqkc1ZYNkTxQdScLvQx0=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Yp4yiW+IInbLOdBIFKwyQBw8u22Ilihc6TkI0neYI6HthBhyOac2MfDi0lovKrQqk
         CgXQelJGtbNy/KuM0OQ7dDAMnuH5FWXUVWJUpFJq4pQjnTEGMAHjV+OABrKwuRb/xX
         3RmwtuiNCmHR1cKudd6/D/pgsdjKhVOpYhZXxDwQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.161.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhU9j-1nS1Yr0JLn-00ehAj; Tue, 28
 Jun 2022 22:52:38 +0200
Message-ID: <f3b01426-1cd4-40b9-7dd7-0965c4c0611c@gmx.de>
Date:   Tue, 28 Jun 2022 22:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 3/4] fbcon: Prevent that screen size is smaller than
 font size
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220626102853.124108-1-deller@gmx.de>
 <20220626102853.124108-4-deller@gmx.de>
 <CAMuHMdV5zLoQWi2qd9HpP65WEvCw_q3VTsZ0MnBV1t8xM7KFUw@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdV5zLoQWi2qd9HpP65WEvCw_q3VTsZ0MnBV1t8xM7KFUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G1IGzPWmlSOzWu8OL/lk16TqA2P6zW0p5Y7XeMFLpdJF5WlT7gh
 a13xtQbT9Ezyok7RwAjOBkAFWV2bw0Q6S8EWL+mFhOrBYOp8tUs11OUbgWMYkq5HOqx1TLm
 ieONWyiETFMZP8Abynqh/TxiWqsKWeovARBdmz4jsCeV6CHwfIJh/pPHfdS34bODCvi23M5
 5o8xGab+kcTx6MvuXhWuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bApuQhifFEU=:XSoeIRreqI5pKq4Ig815UX
 3//tZGqpbhX1u+7uhZQRyhd8BTTiRJhAst2Vg33SPY9ehtovNQ8pE2mMbrxy3RwHz3LS0JbKE
 Fmc0BqHUyjP5Reb3/TSKUQyVKZox3uvD4e+oheF/bBpB8mQoFXdJjYywbE2/WdYptjht4U/ar
 B7SytAz9P/c6NKqUtLIB6e+gU1n+1l2QmSRJEYRKCqs1pJb8CQ1emE0s4gew3kKGtjgUpCiPZ
 DkfG+rJeWhkWz5hwPSuCSD+7Jrcmu/jDres3PgAl9MOrObYDFyX63SG3HfKDldkhMQDntK/uW
 sKaOpyM4B9RtgpqGNk/k12PoSftypRpuHzG5ba+KYOTXaFl/eg/7juN5F5FGbB5tefLRNnarp
 auNqCqfJhTK6eZZeTq1OTP8+xyVaexT/7+jlFUXeSikEO21fBAC1j+IxxHvZ7lotdpKcQMwve
 fic2ahVHDczLH1nUqt7IE0djg1UPRwPFQi2qCuR/qy45MfQ0ebaJDzKyzhXLDU7c2phl0+Scd
 yU1ytlOzhqyQgKi3MeHYWNa2WCz38wzBhi8z2NQwXyi9fFiIVV0O8Jn6CjMApxIqdPMAMsqPe
 j7obVTCAYTDz+bkTxBjljbAeJqmQVwsNruQWQ2NeXSd9ls9IYz/zTmtLa4DPq3PcF8mhSg23U
 C3ba5pNhb1gfeYh6uMcWGckpTHC3Hlw+bo4KZOj4uL9/HjHorlfZSpc65byMan7jaL055v7ID
 q/wGsxDAY5k1/434Xkdd+kTDMF7qZjrStgNw94hQpvpnVpLprzvRuo4/ULaLMsy+WGqN9jBYl
 BKYIgQSuZ+7lRSNW1Yrfeo9Dp99Pwu3NP1g5q6WqJGQjt/J5nV6XvS6N5cNtMT6Ntm/NypHvw
 QFwXQpSIAnONbszdgcgPMbmapwRDQQPe4OZFRxX90PWXsuvkC9O6TEf+4+UTrJwbCTrK/ahd9
 qgWBfSo11kxn5PkHQURaktS6DnkmsrJFq24BWO/iuqHMlxevDaDnb+zNdbC1R1u5/bgjAoHkB
 M80Q3bze2WH5vBP1aqVRN8AKDRg0u+cGFajjZ+Mqv8rkqg8NkeXgTGVsYxGiLivQejmBXAJQL
 MgkxIkhI7F7gs/mm7xFjQHTefGdrYvsT/PR2CizrZ89WiosuPhqhALfdA==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 6/28/22 10:39, Geert Uytterhoeven wrote:
> Hi Helge,
>
> On Sun, Jun 26, 2022 at 12:33 PM Helge Deller <deller@gmx.de> wrote:
>> We need to prevent that users configure a screen size which is smaller =
than the
>> currently selected font size. Otherwise rendering chars on the screen w=
ill
>> access memory outside the graphics memory region.
>>
>> This patch adds a new function fbcon_modechange_possible() which
>> implements this check and which later may be extended with other checks
>> if necessary.  The new function is called from the FBIOPUT_VSCREENINFO
>> ioctl handler in fbmem.c, which will return -EINVAL if userspace asked
>> for a too small screen size.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: stable@vger.kernel.org # v5.4+
>
> Thanks for your patch, which is now commit f0b6a66d33ca6e7e ("fbcon:
> Prevent that screen size is smaller than font size") in fbdev/for-next
>
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -1112,7 +1112,9 @@ static long do_fb_ioctl(struct fb_info *info, uns=
igned int cmd,
>>                         return -EFAULT;
>>                 console_lock();
>>                 lock_fb_info(info);
>> -               ret =3D fb_set_var(info, &var);
>> +               ret =3D fbcon_modechange_possible(info, &var);
>
> Again, this should be done (if done at all) after the call to
> fb_ops.check_var(), as it breaks the FBIOPUT_VSCREENINFO rounding rule.
>
> What if the user just wants to display graphics, not text?

Yes, I need to go back to an older version here too and check that
the test is only run on text consoles.
That check was dropped, due feedback that you could switch
back from graphics (e.g. X11) to text console at any time....so the
check for text-only is not correct.

> Can't the text console be disabled instead?

I think the solution is to return failure if switching back to text mode i=
sn't possible if
fonts are bigger than the screen resolution. That will be another patch.

Thanks!

Helge


>
>> +               if (!ret)
>> +                       ret =3D fb_set_var(info, &var);
>>                 if (!ret)
>>                         fbcon_update_vcs(info, var.activate & FB_ACTIVA=
TE_ALL);
>>                 unlock_fb_info(info);
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m=
68k.org
>
> In personal conversations with technical people, I call myself a hacker.=
 But
> when I'm talking to journalists I just say "programmer" or something lik=
e that.
>                                 -- Linus Torvalds

