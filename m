Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4C64F4FBD
	for <lists+linux-fbdev@lfdr.de>; Wed,  6 Apr 2022 04:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350572AbiDFA72 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 5 Apr 2022 20:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573223AbiDES0C (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 5 Apr 2022 14:26:02 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC18C25C2;
        Tue,  5 Apr 2022 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1649183036;
        bh=BbHRKnQGkXE3vRC9ZXCvePI8ASai72qNJqluS/WFTMA=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Wvz01Ii+4yMGjeYfKiJug3mt1CTSjAkEB+04WdMmMy3Emr2KCTcPZ6b1Jd3t4ZQyo
         T1+FmodmXD9ZpWRlNuMgvVMza3Z+Z8goc3X/VtURL56v+QtRxRnLLDzOQM2Evoqe24
         FMmPfoX5ybXGWl3yaNP54XJvjI01KGgFhs6M0OU4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1nzxWW3NVY-0121ua; Tue, 05
 Apr 2022 20:23:56 +0200
Message-ID: <527a8c23-609f-5f8a-e076-a8a59da59865@gmx.de>
Date:   Tue, 5 Apr 2022 20:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: =?UTF-8?Q?Re=3a_=5bBUG=5d_fbdev=3a_i740fb=3a_Divide_error_when_?=
 =?UTF-8?B?4oCYdmFyLT5waXhjbG9ja+KAmSBpcyB6ZXJv?=
Content-Language: en-US
To:     Ondrej Zary <linux@zary.sk>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Zheyu Ma <zheyuma97@gmail.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAMhUBjmFhqTLBscHHVZ1VTSqrJBT1VEevA+KkjY+y9_ZtdRkMg@mail.gmail.com>
 <CAMuHMdUiEo8q9x0C0x5zOM=ax1=S06=s0JjcJvZYD4aMGLmEaQ@mail.gmail.com>
 <a564f6af-31fa-79a2-72c3-578f2c095b23@gmx.de>
 <202204051946.43277.linux@zary.sk>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <202204051946.43277.linux@zary.sk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VQ5r3yMnxqPttL/PFNGbTOfQhswQ4Rq+Q02j2T5gBefAEJgbkBS
 4rWDE4Em1+NT4jOtLvTv/uYW6551Xv7iPfrQvTYpMyxYt/s11vf8GbzIbtWc+DfVuN6CLWf
 N49SPgodMnhuDFnCK8t5k8lN4w1lM/a7R3WgOaLldnxY0XZ9vYejrqJ6QAmZGhph/Y2pSGm
 ufuAaE4F2Qf3PLHm8gapQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vc2RVLJcNsQ=:xj5fE6nlFciRjkafFqUWcY
 JDNT4YCSHYx9G5OxKcXAiZA2UR4+66eJF9ZdDx4fMVEFCVbTkenrUHPaFo7uVGZDcgOGtaUzs
 1vO6MOfa5TI4KypJTfIHUyxwzuoesR1fpigkIEwh8h6vZ7nKybz1NxNhi4kGKCJ2NvR6J7i2H
 xlcq0asPW4jnsBDY2atd5AvqnJFVJ/8hp2Y8AnqAE8R7cLUXr2vO0EzLi46VkL789muObty5f
 OnhBPfRawxJ15SWX/EYJK4kKxRhptYMD5xkIi8o/qc56+6WfDGu7K/c1rR0b0m1c4+yJLuVDv
 JdiYeseyym6FALZtECX4iBridasBrpBMCxCVMIM+Rkadx1g88T65RfFC33OlQdwOJ41lLpP1+
 kZ9GsOSQHQJQhBitB2SgB86xnO1gXTVby0Jm7ENgXqpVwoNbJFBkEotdupKwPYk8nfwvlh0Ny
 ebZ1H1DmGXB44seOQH9Zy9m2JLKlhrGcdcx+U8ZFpgQk8nG32ApHAhTmrqHp7npB+i4VkyM/F
 h2IpUSlZPlnh0ipbmhovEixZIBd6+x/3HOjzPCzAmWcYlrfbsB8voRWkcRrNwxDA39RgUy2sF
 K2/Qu2RhSL2K8pnrutMVwnAI0KDVvjfyVbALVgZyHtFEU2gZFGSC+uebmBa3sMOvQ20XhLfhJ
 zaCbDmAQYKdcKoEHQ93BtwcF5ZRXYhSoR4ukcAIPzZNhTFRMsudhk5HezAt2cJAvF4GgbBlh/
 ZTPJs7eo4icKWEX+r2cfRB25MXXVQSeX8AaJXHqg4899Jupp7FcCdfJM3Pz8c5/omhx+KaTJJ
 AQJC6k1crHNQg9sUc7L+lbc5blKRSYNow/15cLaTLplcKtz/DJti3rDThrMjxh9BlPqUsrXly
 SllsksrROsf5YF8ppeMLDjRDGJtsl8811ihMaPdvV9Q42cw/JVTRAUejywqynsAb8fUwAfi8P
 qE3/nSiQBhUSvL3qKPbPu0Wh9H8fx2YQIuJTj8YqvXdr4FRgU2sYoiEFQUQ/EwyFkeBGlRFgL
 kHmOx2S4B2bQtrPHfmvlYC2Z+E++s2eay198hHAL0eComKwkQ3l0E0YlIwFnTcp2fC6Za+Z3i
 WFIg/1ON4hXwl0=
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 4/5/22 19:46, Ondrej Zary wrote:
> On Tuesday 05 April 2022 08:33:57 Helge Deller wrote:
>> Hello Geert,
>>
>> On 4/4/22 13:46, Geert Uytterhoeven wrote:
>>> Hi Helge,
>>>
>>> On Sun, Apr 3, 2022 at 5:41 PM Helge Deller <deller@gmx.de> wrote:
>>>> On 4/3/22 13:26, Zheyu Ma wrote:
>>>>> I found a bug in the function i740fb_set_par().
>>>>
>>>> Nice catch!
>>>>
>>>>> When the user calls the ioctl system call without setting the value =
to
>>>>> 'var->pixclock', the driver will throw a divide error.
>>>>>
>>>>> This bug occurs because the driver uses the value of 'var->pixclock'
>>>>> without checking it, as the following code snippet show:
>>>>>
>>>>> if ((1000000 / var->pixclock) > DACSPEED8) {
>>>>>      dev_err(info->device, "requested pixclock %i MHz out of range
>>>>> (max. %i MHz at 8bpp)\n",
>>>>>          1000000 / var->pixclock, DACSPEED8);
>>>>>     return -EINVAL;x
>>>>> }
>>>>>
>>>>> We can fix this by checking the value of 'var->pixclock' in the
>>>>> function i740fb_check_var() similar to commit
>>>>> b36b242d4b8ea178f7fd038965e3cac7f30c3f09, or we should set the lowes=
t
>>>>> supported value when this field is zero.
>>>>> I have no idea about which solution is better.
>>>>
>>>> Me neither.
>>>> I think a solution like commit b36b242d4b8ea178f7fd038965e3cac7f30c3f=
09
>>>> is sufficient.
>>>>
>>>> Note that i740fb_set_par() is called in i740fb_resume() as well.
>>>> Since this doesn't comes form userspace I think adding a check for
>>>> the return value there isn't necessary.
>>>>
>>>> Would you mind sending a patch like b36b242d4b8ea178f7fd038965e3cac7f=
30c3f09 ?
>>>
>>> When passed an invalid value, .check_var() is supposed to
>>> round up the invalid to a valid value, if possible.
>>
>> I don't disagree.
>> The main problem probably is: what is the next valid value?
>> This needs to be analyzed on a per-driver base and ideally tested.
>> Right now a division-by-zero is tiggered which is probably more worse.
>
> I still have an i740 card so I can test it.

Good. Someone wants to come up with a proposed patch?

Helge
