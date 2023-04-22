Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77E1E6EB83D
	for <lists+linux-fbdev@lfdr.de>; Sat, 22 Apr 2023 11:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjDVJg5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 22 Apr 2023 05:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDVJg4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 22 Apr 2023 05:36:56 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149A41BE7;
        Sat, 22 Apr 2023 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1682156196; i=deller@gmx.de;
        bh=fg0ZEjex4H2D8tP0T1o6F4tcqUIYJkG8rIY9JlAfJO4=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=PurGGp/bhUR0Ffq1IUnK32/YyFWcGm3VwGHN0NOoJcZnkI3AH/QJooit5L/xhQSkR
         ti/ULkiSwQfC+IvshsRlrRbIsfebfHPuvycJauktKugtkOvpU9KZlMTvXe+5R07YK9
         KmfvEkT+L3p0pBSxHlNtBhEDDj9RAXwxZn1gCi3hQR5NKVLUbvK030x/ls+HclLdCH
         nKrlFqFtzcHDUYMpHbehmH05nO8IsorQz/WwO6C845iOstaBkbD3hYh+v0r7DeX6fz
         3JKI6Zq8VfkKxSnz/1ApW8yD9YhVXMrQC8UFgLV+G/q6N/asb1Ln8JWwFMzkfP9GgS
         p2dob7rh4ugXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.94]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQMyZ-1pclgg3wZ7-00MOvq; Sat, 22
 Apr 2023 11:36:36 +0200
Message-ID: <7ca1b3e1-39ff-50b8-caa5-12ae40357f22@gmx.de>
Date:   Sat, 22 Apr 2023 11:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] linux/vt_buffer.h: allow either builtin or modular for
 macros
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20230329021529.16188-1-rdunlap@infradead.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20230329021529.16188-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kACqSYb2ocVMT0+PuD3A8eMsgxQodmwWm0D3xIsVGMdtHLMduUX
 PiJ0IkeoiJq9X0+Ld5moAHLWTqQyTY/u98SujJdXfSraLV36QdJsGOn7BAlbhZu/kR/BnkY
 sPWaqe7dZUzKgsPz91u4vMQ/r48DxvyrmzoBk+hnj3mArWILfI70t/7IEsRWtyCsZaHUowt
 FgNupPBYaHCnZKLjhrXKQ==
UI-OutboundReport: notjunk:1;M01:P0:BjMGXMskIbc=;48sfyGCYKplrps9BlQP4l1qcS1z
 N78ZAW3/uHwFYkFLoj4Vcjxcq2qD/mW0JZC/soPL/txyWxL6b892qCCklrj3DeTuQiAsHjEXr
 Cc3JKO35QoPcgsJHCyNtryDNsK3gu117eym9brjxUbxSieqZzefsDqzkguOqj2/yJBkPoOz5N
 5PAJBHxn+QjmgTgLSK39CpxDVpSDULbyZDtZ4pNX7I0ugfLCNRV0bWhX8CkeCDVZze5uvhQsN
 qhBxQamU/MnOiCcl/Kicwwb0TaYdullFVCmlZQYzeovGNpkyCjH1Rtqv+8tb7P1DMDkaF9sRI
 YhCJvdPw48Yfw0nRc8Ova2v55d4TpZ3u4Y13Fq0EnNUjUlDo/BEX7NhcAr8KUhxH2yrY393UD
 0fw8xVZfnQyV7h8j5tDltnpueuhOPj2wvQVWquV5Rgh8SwVE36olSw84JDiSqJTPWENe0diIV
 Iho1cqRJ/AyYN+u5omHXOs5vGdJaKFSYad5lWFqfqPRw1plPJ9s1+G9FUIc6RSHooudK+6ta7
 IlbJTdzxbXoLW5o3tioveHUWy4LtOwwaSOM50N9CA3Bh7OXS21SbcnEkAH9xKGm3Cb6FscQ4J
 bxeOON7KJ05XGdCczC579DoY7pj3qvsrCofC0M7PJFwXF6sZRoQMzIIRWCmlX0ekHMfMPrZJL
 ral0iLU7+JfRfCmHiS8guKr/+vlx6BuSeVEznokFOiMKXw2iKiv9l3t2127MyHKTPjMHEBxQ7
 TLOT955Q7UxXIlM9l5ANP0z3QjSB+yL4XZdSUhPCTGmMk/EBQR3dL4/ESXZ2BSH8oczYZlP9d
 sM7kRZ6CZXze10HKs2n+KoiZ7ZjmoCY/Tlk5CFTVXH57IJX4Wp3qFQrbXoTk/8gk1aizEcGmP
 AlKJqoAKGh8dXSvyF4+crtAvLkkQdoZNTWnaZRPgE+ZRFufxKcpzFd9EECZB40LvL5BX9ma9H
 ACe2vA==
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 3/29/23 04:15, Randy Dunlap wrote:
> Fix build errors on ARCH=3Dalpha when CONFIG_MDA_CONSOLE=3Dm.
> This allows the ARCH macros to be the only ones defined.
>
> In file included from ../drivers/video/console/mdacon.c:37:
> ../arch/alpha/include/asm/vga.h:17:40: error: expected identifier or '('=
 before 'volatile'
>     17 | static inline void scr_writew(u16 val, volatile u16 *addr)
>        |                                        ^~~~~~~~
> ../include/linux/vt_buffer.h:24:34: note: in definition of macro 'scr_wr=
itew'
>     24 | #define scr_writew(val, addr) (*(addr) =3D (val))
>        |                                  ^~~~
> ../include/linux/vt_buffer.h:24:40: error: expected ')' before '=3D' tok=
en
>     24 | #define scr_writew(val, addr) (*(addr) =3D (val))
>        |                                        ^
> ../arch/alpha/include/asm/vga.h:17:20: note: in expansion of macro 'scr_=
writew'
>     17 | static inline void scr_writew(u16 val, volatile u16 *addr)
>        |                    ^~~~~~~~~~
> ../arch/alpha/include/asm/vga.h:25:29: error: expected identifier or '('=
 before 'volatile'
>     25 | static inline u16 scr_readw(volatile const u16 *addr)
>        |                             ^~~~~~~~
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org

applied to fbdev git tree.

Thanks!
Helge

> ---
>   include/linux/vt_buffer.h |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -- a/include/linux/vt_buffer.h b/include/linux/vt_buffer.h
> --- a/include/linux/vt_buffer.h
> +++ b/include/linux/vt_buffer.h
> @@ -16,7 +16,7 @@
>
>   #include <linux/string.h>
>
> -#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_MDA_CONSOLE)
> +#if IS_ENABLED(CONFIG_VGA_CONSOLE) || IS_ENABLED(CONFIG_MDA_CONSOLE)
>   #include <asm/vga.h>
>   #endif
>

