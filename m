Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95126700330
	for <lists+linux-fbdev@lfdr.de>; Fri, 12 May 2023 11:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240072AbjELJBd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 12 May 2023 05:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240262AbjELJBc (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 12 May 2023 05:01:32 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD168E43
        for <linux-fbdev@vger.kernel.org>; Fri, 12 May 2023 02:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1683882078; i=deller@gmx.de;
        bh=4D3XUSWnCSSAWlF6+7uZxsWEXBLcmrqEjFR7ovNJzz0=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=p4o7z/lHuR4e5+N2TnvWcvMexpVyywYzIRxPyTBjbaHI3VSgvAQ6tDVTI9pQwUJsF
         ah05MDTwysUro9rEgJwFZggpP547H8D9vJQWuUmf+bAYslKgUTjHBAVhXFXtfvTEZs
         EzLEogogvO1+xLQQBC4fe96Gh4qUhC/pPnnodyA6cUlOUzedhrG9SRUcZiOzusymYO
         b8vsLy8T4Twve/08dulqQKsrKmX6pzJUNPZ1DQoe+0M5RQBzP9vrc6vxceZYDn1nWb
         UOucdM3xf07YIxC1LacRTbT21I8bc9vyqN/Rfvl/bIziLomqd/sZfLk9CJSAiscy1+
         dx3BcXhMaM/yg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.185]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3UZG-1pwqgW3Xpy-000aqJ; Fri, 12
 May 2023 11:01:18 +0200
Message-ID: <eae112c1-4bb7-bdbe-9382-e8fbb6f1df2e@gmx.de>
Date:   Fri, 12 May 2023 11:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] fbdev: modedb: Add a 1920x1080 at 60 Hz video mode
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <ZERQiub7tuTxHCUy@p100>
 <CAMuHMdXZuqj=vwTmHmnBHgZ975dD_m_Gk6Q1=CsGCqzcfcMbsA@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdXZuqj=vwTmHmnBHgZ975dD_m_Gk6Q1=CsGCqzcfcMbsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/FSbBnpOCtQci8GgTe0RrJpYbl9jib6+W0hicI8ggItdZsaHn73
 q11zd6P/10dltWj4vdkx1G8fAfJgibSc1TKOnp65dCuXEJzp551hCO8zBsyKW1gg+hWMWY1
 nnxYztWNu7saVCqqKFNax5gdWXERblaek2zv8NlvzJABMlUo+mmjVGAcFT/Dd65PpWso6c5
 U4oMOGN4xRgz4pfKM9zlA==
UI-OutboundReport: notjunk:1;M01:P0:Hckivzs+PdU=;Uqh4VQb5JJy6GheIxR4SNyg1ioD
 5O3/QOWZ6lR8n2FlkxVz3+3Am8dbgvcJoRVlb6taldNX1azbmNR7YSr9DOKqF0VBClbT6G/sD
 sl7JCy68w9mE+s5BvyZlh6x097shyUZNthQ2p06urtM4dYBkG7TDeAyskJmSPiHg1CXkS0Pbw
 B17CgEs/uyEBa1TxFln2ze/1nmh+NC/CdYAz9Er8wjDWVShpBUSoGUey3TR//+jRBRs8TERGW
 hxMvGhm2/Ao+5vr+84KFpErdh2SbU2VLJ1BXbGvBlji93Flq+F0YyiJnW0GqKnu33I6KAQW1L
 if6gFpwpbE1Rbj8i7UKm4MiIfk1qm+fJN//iBIP+V6bZ0oSXs8HuYaiQWv3Y2BK2UEsDKrQe6
 R7aVN4m14wt8p6DX202hv5A+OFTcJHG20ZddDtgxur6ofbXH0W2u0Q+ebieUdCLB968wJYa+j
 5OmsxHzaEbm4Vkl/x4h5r2nqlu/iRKfIzbOoXdZCOjTEIdrTTtpJo4sZ/QSd5EFjQq4+Napv9
 YLVKigrFYEZUmar9WRNx8xb6GcngGcgLjnKp0lzzL9Ct2IrCUR/jBzrU292bby7ooqsW8iQCC
 f7/9tMkA4pm/m9gUX0KTs7uYoDm0uds4fK4AkFdqZOFqXZ59ajNpCTKswAKMq8vsu9voAb3cM
 LRKYMtKmopXeBYgWzAIb3OO87x7YL4a6C9ukGykglVRW3k6lunw5Grouwttd+hz4nmpfAtAoQ
 foIPCgALeM4TLSAX4mfXJMo25mUh4YBKn6HExfDLQeTIpexas5DU+HT5vrfOUv6pK15buMb1Q
 1+pIEsaVbysvQb150DzslrWTA/ydmDz50oEU2UmnKSbGF5zLXDokNOsVUZYhYLS8ES9CvhjUS
 P0q8zA+GMO2lC9DJaXizB1UFCtr0n9wBclKFZfk8cmd9qSEM9+Ax0v6woGLdFsHubmxNedGsP
 DW64G7vMLQQR/AecHnNIGs0gHU4=
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 5/12/23 09:44, Geert Uytterhoeven wrote:
> Hi Helge,
>
> On Sat, Apr 22, 2023 at 11:27=E2=80=AFPM Helge Deller <deller@gmx.de> wr=
ote:
>> Add typical resolution for Full-HD monitors.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>
>> --- a/drivers/video/fbdev/core/modedb.c
>> +++ b/drivers/video/fbdev/core/modedb.c
>> @@ -257,6 +257,10 @@ static const struct fb_videomode modedb[] =3D {
>>          { NULL, 72, 480, 300, 33386, 40, 24, 11, 19, 80, 3, 0,
>>                  FB_VMODE_DOUBLE },
>>
>> +       /* 1920x1080 @ 60 Hz, 67.3 kHz hsync */
>> +       { NULL, 60, 1920, 1080, 6734, 148, 88, 63, 4, 44, 5, 0,
>> +               FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT },
>
> This matches [1], except for the "63", which looks like a typo for "36"
> (total number of lines should be 1125, not 1152).

Thanks Geert!

I fixed it in the git tree.

Helge

>
>> +
>>          /* 1920x1200 @ 60 Hz, 74.5 Khz hsync */
>>          { NULL, 60, 1920, 1200, 5177, 128, 336, 1, 38, 208, 3,
>>                  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
>
> [1] https://projectf.io/posts/video-timings-vga-720p-1080p/#hd-1920x1080=
-60-hz
>
> Gr{oetje,eeting}s,
>
>                          Geert
>

