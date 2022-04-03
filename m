Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146F84F0A7C
	for <lists+linux-fbdev@lfdr.de>; Sun,  3 Apr 2022 17:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359100AbiDCPEr (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 3 Apr 2022 11:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353718AbiDCPEq (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sun, 3 Apr 2022 11:04:46 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A410F31372;
        Sun,  3 Apr 2022 08:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648998166;
        bh=s2lkJV8WXAYqWmTFWBasf7fC1P0GpzV1yzhgieOmpbM=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=O9dy7d62jI2IvHEo9Nx9j6I0rMjy/fCkAlzQd8kILIXoCETG39tne74SFTj2o2w1X
         HAHdKahOSU+9nKCEJKGbPB5VgrMrOOXNBgWCKVcUqmqk763DuE8M2W0D1ASM59FPqE
         b3oX1emUAO15YlieK//1rRzqN3TRznTxEw35/At4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.160.29]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MORAa-1nNKeG22gw-00Py2A; Sun, 03
 Apr 2022 17:02:46 +0200
Message-ID: <631f03bd-0fdf-9cc8-bf37-89235fb84162@gmx.de>
Date:   Sun, 3 Apr 2022 17:02:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: =?UTF-8?Q?Re=3a_=5bBUG=5d_fbdev=3a_i740fb=3a_Divide_error_when_?=
 =?UTF-8?B?4oCYdmFyLT5waXhjbG9ja+KAmSBpcyB6ZXJv?=
Content-Language: en-US
To:     Zheyu Ma <zheyuma97@gmail.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAMhUBjmFhqTLBscHHVZ1VTSqrJBT1VEevA+KkjY+y9_ZtdRkMg@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <CAMhUBjmFhqTLBscHHVZ1VTSqrJBT1VEevA+KkjY+y9_ZtdRkMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qIbpfxfG/C0O1El0nor0IfxhzuMt4NOT1DCsIVjKXPWTNEXPFU5
 7UoWCkjcFpqBy5QdJEpXcOnp4o23vRUwMtp0DLwXqvc4ybLjSNkJoMPOdBT19+o7RPZ3w+y
 QhMU3SqDp1z4A5seJqyM/JqXSjvLrkxGCaUHg4IOnEDdNOoRi642eLQzc26rs24JxANi+Ju
 zzBSHQIjfrGy72Hj+Fukw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O87AKjWL0ng=:hE+Jm2qY6s7eJkx5fO0+y1
 8eC2HtbWiuZJPJ4ijFLUeKLdHH788QI0ETO/dLshaKtX87HCz/0mns7j2ldgI324h/X4Y7FZG
 CJS8hpLq3XuEK32QH/GFv/Dx3OFG3WB2wNBrsXajbxiHiEwCXduz0kLL+548+JvGaP1VUO1GP
 tWUsauT7SnsbH7NObCLIZ+G2fPI2zY+Y5gVHbZMI4QD2f+ERC+g3kJppsERw+9q8kdD8jFpkw
 GwNwFSe+9Jx/lmMdbYfqvnE0kzRWGV16ts09cklN+sG0Y0sxGLamMcVRfD1j4YRDuQ0Tiw5C4
 JjPenLfEWVQpCnqfhVJnVccyvNqFfLtQm60pKsZmfY0De0+YIay9yuCIMQrOA2P6J+NErb+Iu
 ZzlreO0YqDT7f3ORPf3JZZOnzOoy+CvZ+Ie6V1SQLyDtaX1Vqi5lkjswn0Jef/quA9ETspEBC
 46SfG1Zh+JxBncImP7p45X+8KxVJyEacLdGXHuIlxdVF3H35XosYY/yHRBb5P94rLwXIm8iWO
 Y+186lf1aG5e/u6g16kET7tquqlHezL6SL+gFdMB/I2BgZo8jyMGDxE4QdR3Uafs5PZzl1Q34
 LJVcnkc7QS96WvKP3JJVVT7+5M8oUyaoOXA3dpwlS4U3Lce7mbXfc87IyLqtNEk3iEeShmEEF
 WO6yy1qV8746wSVboCvvKq8SzLDMicr2xn2EuXEKXWsTCFu09abfO30CXc1xWTfnJSlIUlQTF
 ON3+/HhlOOD7bbKsMwBUHYzQ01NxLLxpNfNOG90sq4LBKS0KrhPlNJo8yasntSLI7LlU2d06r
 brHgmB9lGb8V1kPPoXWYNgAmsnlOL3JgXBi1KJCc7qWPau6zbRZ610gSTphGO0uMaUE7bdM37
 GtJLiunWYCMJdzE1XMFODSVb/yXtlRaYPL5bEgjk8i0FsgDVZoy10qcUQUgL6lOmjygYCx/lE
 YwFLoTIcaTAuuCzseSouWmmYAFpd8ZjX7VckMK9D8PoAjl3/qiSvHIJXmAQlugiRiD4dhyEW4
 3mxJt0KyerXH4dUUNqZ1+e1KC84audpXQq1vSMOuOlY/5cCmekDN5XtGTZ8oNf8stUhP7VysK
 Ju0yC5U8SIPym0=
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 4/3/22 13:26, Zheyu Ma wrote:
> Hi,
>
> I found a bug in the function i740fb_set_par().

Nice catch!

> When the user calls the ioctl system call without setting the value to
> 'var->pixclock', the driver will throw a divide error.
>
> This bug occurs because the driver uses the value of 'var->pixclock'
> without checking it, as the following code snippet show:
>
> if ((1000000 / var->pixclock) > DACSPEED8) {
>      dev_err(info->device, "requested pixclock %i MHz out of range
> (max. %i MHz at 8bpp)\n",
>          1000000 / var->pixclock, DACSPEED8);
>     return -EINVAL;x
> }
>
> We can fix this by checking the value of 'var->pixclock' in the
> function i740fb_check_var() similar to commit
> b36b242d4b8ea178f7fd038965e3cac7f30c3f09, or we should set the lowest
> supported value when this field is zero.
> I have no idea about which solution is better.

Me neither.
I think a solution like commit b36b242d4b8ea178f7fd038965e3cac7f30c3f09
is sufficient.

Note that i740fb_set_par() is called in i740fb_resume() as well.
Since this doesn't comes form userspace I think adding a check for
the return value there isn't necessary.

Would you mind sending a patch like b36b242d4b8ea178f7fd038965e3cac7f30c3f=
09 ?

Helge


> The following log reveals it:
>
> divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> RIP: 0010:i740fb_decode_var drivers/video/fbdev/i740fb.c:444 [inline]
> RIP: 0010:i740fb_set_par+0x272f/0x3bb0 drivers/video/fbdev/i740fb.c:739
> Call Trace:
>  <TASK>
>  fb_set_var+0x604/0xeb0 drivers/video/fbdev/core/fbmem.c:1036
>  do_fb_ioctl+0x234/0x670 drivers/video/fbdev/core/fbmem.c:1112
>  fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1191
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:874 [inline]
>
> Regards,
> Zheyu Ma

