Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3234CAAC3
	for <lists+linux-fbdev@lfdr.de>; Wed,  2 Mar 2022 17:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbiCBQun (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 2 Mar 2022 11:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbiCBQum (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 2 Mar 2022 11:50:42 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8357CB647;
        Wed,  2 Mar 2022 08:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1646239787;
        bh=gxRPdEU+QPahBjvaCt/q+5WcE48CF2vkdjeoCYbnm8k=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=DIMAUtcbBH5aqT9ZHQJ49EvcpD8/ypWqdlBWZPQQMbaBqO5jD+/8XM0cbNeG9S1ZM
         b9YaXqmGovnW/hbIQWTfqZVUN8P4BqoDlTzQMa3ucH125OJGinNUXcRZ0mEyGyC/M0
         jgA9WqEk+61Rwwl1vXZePt++Kygkx/354hdI5sNk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.242.61] ([80.187.121.99]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBlxW-1nUvo71KOK-00CCTW; Wed, 02
 Mar 2022 17:49:47 +0100
Message-ID: <666d1565-0467-bb21-916b-073392129e1a@gmx.de>
Date:   Wed, 2 Mar 2022 17:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] video: fbdev: sm712fb: Fix crash in smtcfb_write()
Content-Language: en-US
To:     Zheyu Ma <zheyuma97@gmail.com>, sudipm.mukherjee@gmail.com,
        teddy.wang@siliconmotion.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20220302143311.2109322-1-zheyuma97@gmail.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220302143311.2109322-1-zheyuma97@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jWj92EA9VN2CX3/FfWKXV7Wf4QzTMp4F0RdNd9teZOaVJaTwfM/
 z6zv8GaRMaBYDFqDoC3j4AFCCYfDyZKl1a5AefVuBN5MDm9QLcnbymtz6px/wLjOlTshd/V
 BXA4Ttg4qeQvlf/uK6XGRbWVnIgKAGSbK+tSHPGkzO329uMnxLzPrXuedGI0YPGm/RARiOl
 wetzzGtJTs7+Jifa37Hmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b4o7OKXxOvc=:3+02oL21ahFgW0JgnDjGPr
 oh3YlTwndNXo83yaKdaAhiEX9XT8LcyiP74h0zMaNA8RILtMzLB+xG/t3v8mFR6q7TyyKpfbg
 wXR3HdnjwV7Lq27CkUuVoJazqnacDXhKU3R3h60pzmiysIM6igaAHspAUG054DuUYqnFWQMeE
 Cb0FvvjAZcsUuhyiTStAcoZFXyMgzqSbJeix367DdS3/PhxldhjLP03+hJiOYi6JYmpJQTAXY
 Dl3Fi74FEvxgmbW4yPvu3sT49hIl+ZME4VG01A7qj9BMFO8+qqsaxIGXguwdwXOYgMh0Bv2pf
 WJNkfbTT6rb48kRfTm14u5AzfBAxGd2lMQuNwo7yKUpIZ5gFSX4TlKwOqYCkgwagTRj5TPuv1
 iMM/xGVafTZ1kixB87pFhLx1BD8o6BGAzHewMVLVL6scXQ3KVZ2dDPLPKrVesWqBM520Uipel
 PC6TLdJ9agW8MBOeM4LwWlepnXbQk8ai+ou0LZhKgY0QeMjpm/0cZ0/nOR/gCS1DS4w3hGiNW
 9NhNyAy2I6Lfsc5oZlpRIl7Tx3ERrZODRD+wqDeofykMm8y5qpN8V9KRKBdeDXYCVc/TiHVXV
 FHsj3fi9XTnmoD1KEK9Hd2VcRt2UoQyK3cGnqTT45ecDh0No+kKGw6kRKJNppNDvQrnrMo4sP
 vfAFXsB6C9PUwQ0WE0OL/T/b8HpvUk48qNaYLhxoIloivxSmJOm9axXnhNpfV+34q0aJClvYM
 PpZlXMK/6buNhl9eVj9D3szUINc1oO/BPX+4zgTQugrnICrMSdWPm/4BeYuAnuIAuo27sV+5r
 cVwHFYp2EuT7glZ16l/GJ5vzY5VoQagK6609qWHjUvx+YTJ1bPsk6K3Dv229BPTzhGg3GWh64
 mG85I+kchWaME2DBFaJORAvAWggUbqdtfQT0bEtsbiThItF0l8u7fRAlybWvYUUURm9CxDZE5
 QKVTQ2WoiXMcVsAC1eAtpQLz8QMZu3p6wInpRjTYvqd+wvj68AD8zisl8tpAsQ+qETcY2YCvp
 5ZxgIJCJDKJb5kAclIqrxFHa0rGcWwHCf6bhZznMZS4DidNcHEkqiYkvMyjlJgkma1pyAWqUT
 gmlFHFgC54EfFg=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 3/2/22 15:33, Zheyu Ma wrote:
> When the sm712fb driver writes three bytes to the framebuffer, the
> driver will crash:
>
>     BUG: unable to handle page fault for address: ffffc90001ffffff
>     RIP: 0010:smtcfb_write+0x454/0x5b0
>     Call Trace:
>      vfs_write+0x291/0xd60
>      ? do_sys_openat2+0x27d/0x350
>      ? __fget_light+0x54/0x340
>      ksys_write+0xce/0x190
>      do_syscall_64+0x43/0x90
>      entry_SYSCALL_64_after_hwframe+0x44/0xae
>
> Fix it by removing the open-coded endianness fixup-code.
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

Thanks... it's already in the fbdev git tree and queued up for v5.18...
https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/com=
mit/?h=3Dfor-next&id=3Dbd771cf5c4254511cc4abb88f3dab3bd58bdf8e8

Helge


> ---
>  drivers/video/fbdev/sm712fb.c | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb=
.c
> index 0dbc6bf8268a..e355089ac7d6 100644
> --- a/drivers/video/fbdev/sm712fb.c
> +++ b/drivers/video/fbdev/sm712fb.c
> @@ -1130,7 +1130,7 @@ static ssize_t smtcfb_write(struct fb_info *info, =
const char __user *buf,
>  		count =3D total_size - p;
>  	}
>
> -	buffer =3D kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL=
);
> +	buffer =3D kmalloc(PAGE_SIZE, GFP_KERNEL);
>  	if (!buffer)
>  		return -ENOMEM;
>
> @@ -1148,24 +1148,11 @@ static ssize_t smtcfb_write(struct fb_info *info=
, const char __user *buf,
>  			break;
>  		}
>
> -		for (i =3D c >> 2; i--;) {
> -			fb_writel(big_swap(*src), dst++);
> +		for (i =3D (c + 3) >> 2; i--;) {
> +			fb_writel(big_swap(*src), dst);
> +			dst++;
>  			src++;
>  		}
> -		if (c & 3) {
> -			u8 *src8 =3D (u8 *)src;
> -			u8 __iomem *dst8 =3D (u8 __iomem *)dst;
> -
> -			for (i =3D c & 3; i--;) {
> -				if (i & 1) {
> -					fb_writeb(*src8++, ++dst8);
> -				} else {
> -					fb_writeb(*src8++, --dst8);
> -					dst8 +=3D 2;
> -				}
> -			}
> -			dst =3D (u32 __iomem *)dst8;
> -		}
>
>  		*ppos +=3D c;
>  		buf +=3D c;

