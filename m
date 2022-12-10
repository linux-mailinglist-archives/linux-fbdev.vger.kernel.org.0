Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66B0648FD2
	for <lists+linux-fbdev@lfdr.de>; Sat, 10 Dec 2022 17:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiLJQfe (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 10 Dec 2022 11:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLJQfd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 10 Dec 2022 11:35:33 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66DD15A09;
        Sat, 10 Dec 2022 08:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1670690108; bh=hULunELhZdtE1GkCID2SUUW9EZF1DKJ0BvrmvOkyd/U=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=VX1bnl5U1jf13nWLdnNpuh9QmBQXFG9Rz4rVXr6BgCjuSx+R1MrVUyfgH1IZGIpV2
         QZ0LWlxofK0NlVDMby3E6Z690cIjgsR1GEVQs18NCb9YYwYI4JkHT8sWTY1DcZsbum
         peZtMMBx8b96MDIGAR84eyDLf0M/MdNiGazENxbGkmL0Iq2iAoHKOPDfnNlwa3xrgL
         M1436TQaAvpUvh7JjoMOZmHjTNvuIsYVSSVM5vQoRp7eygO/zETPDfIrTgWlCwXCv2
         JgQDtyFXCgvb62+bxrUcCxh4vxQ9CTDYfq+EjanGMR+FWUbC4huO01I23+mxz0jfWo
         kirS5+pOqdGuw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.157.120]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBDj4-1pESvq0s9e-00CjAD; Sat, 10
 Dec 2022 17:35:08 +0100
Message-ID: <f8c6eb94-10ee-07a8-ea48-d4fae60fc9ae@gmx.de>
Date:   Sat, 10 Dec 2022 17:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] fbdev: make offb driver tristate
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        linuxppc-dev@lists.ozlabs.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20221126000401.25302-1-rdunlap@infradead.org>
 <46e8cf0d-ab47-59b1-6c87-53d2d63a5bf6@suse.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <46e8cf0d-ab47-59b1-6c87-53d2d63a5bf6@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3Q0WJF64Q10zFZW6VO/GCqoYxns0l0hOMM9nr71J/mwrFHaUIW0
 hHaa21eYA8KaBbR8FgN6lOCWFk6XJsBMqiz2o0hSJFz8baJzpzOmfJhel4aAbnw3E07zDZ4
 g/3b042iW+L+MvTBCSUknRi3WUJRyWFHZzydh/p3Wg/R/adLxtJIIcWYI1tvdQinLd8MtjU
 H+4y4GF/teZ1STuzK0M7A==
UI-OutboundReport: notjunk:1;M01:P0:m/0dMCGSrkU=;l0P/Rf3YleDLfkrX5OOk7Wq/wFp
 tVqoL2SQrGkJtqHu9UCslKyVqe0ukrrs4wpzI7+5OPWS+RLdXZZ1JEmvJrn/Uku8G0naw6Jdn
 /lIJB+vFmPtu4mmhorMUP4Q683Y5LyhPAGYjtVQqITAMF3c7Zdaz9D+DC+jzgY/5DUEks63xD
 ET06nL6V1IpYZt8w0McCH6Zx/PI0/ybsRO7rVuAM8nqWXhe2avw8WMCKoFKCdUhKqOrxVAN7e
 AtXsss4sRNZapiQb3fEtV9m0o/Zx/R5R+0gC0bzEUEdpZ3kJ8Bk/V5s8W+T1ehM6QX2Yg+80s
 P+MKlpLj0++iXRwbfPqAqyKxPHV2X3OEonKkSvzrSrrCBoNerkS/KWHHpcpxGYMXQEyv09qYO
 JoaIwNgoh5I92/rMZJme4imkHxVbtkcZw5dul82QnOPFatOYglXGxoA82QJFN48ZoCm5570fy
 9dfIvCTqCKpfOXf4Pw9jJW/bIPLaBhWeoxTyVFmV2c6ub80BxeLi7XzoNqUwEEliIyWOj7h6i
 zp2Cd115of3/v+4Mht3LoDOkLfFCE7DaoUZWYud6CUbWjr7UsxonX4LiE6ziHfGNh5l+i18rV
 FM3JViTpi4Qer5zgP+nCdbCPPUEu1i7tpymK3xVpoLD/56GFtEXnITpsXFoKrQOaUQoJz8pn/
 LVNs8MeOEuhpyv3W07AFIj2SXHMWcZ3ipLYyKHZCS6ScKCcG/m1sag7gc7kgQOBoEnuA6cCk1
 OEMRnvxCxKiM9kZkS8YsUaXXKHEEayO14uo9ctlLf1L8IT/nnq+8+F3n7A/5t0a7Kle1WjN17
 iIA+mrK26YuFLQeZyzMGpC8bqgOiMKD0Vu+2lc1JDdHbTPWxb005pFuxLWqRprvItLeMvS15n
 R12WpKKYbW4kMQEqlIjCjI6ghT3Ip5kgrMvoPbk/j7Hd/+p+HCPBh86D8dKZPON37CwhbUURZ
 GDW35A==
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 11/26/22 14:40, Thomas Zimmermann wrote:
> Am 26.11.22 um 01:04 schrieb Randy Dunlap:
>> Make the offb (Open Firmware frame buffer) driver tristate,
>> i.e., so that it can be built as a loadable module.
>>
>> However, it still depends on the setting of DRM_OFDRM
>> so that both of these drivers cannot be builtin at the same time
>> nor can one be builtin and the other one a loadable module.
>>
>> Build-tested successfully with all combination of DRM_OFDRM and FB_OF.
>>
>> This fixes a build issue that Michal reported when FB_OF=3Dy and
>> DRM_OFDRM=3Dm:
>>
>> powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): und=
efined reference to `cfb_fillrect'
>> powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): und=
efined reference to `cfb_copyarea'
>> powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): und=
efined reference to `cfb_imageblit'
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Michal Such=C3=A1nek <msuchanek@suse.de>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

applied.

Thanks!
Helge



>>
>> ---
>> =C2=A0 drivers/video/fbdev/Kconfig |=C2=A0=C2=A0=C2=A0 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
>> --- a/drivers/video/fbdev/Kconfig
>> +++ b/drivers/video/fbdev/Kconfig
>> @@ -456,8 +456,8 @@ config FB_ATARI
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chipset found in Ataris.
>> =C2=A0 config FB_OF
>> -=C2=A0=C2=A0=C2=A0 bool "Open Firmware frame buffer device support"
>> -=C2=A0=C2=A0=C2=A0 depends on (FB =3D y) && PPC && (!PPC_PSERIES || PC=
I)
>> +=C2=A0=C2=A0=C2=A0 tristate "Open Firmware frame buffer device support=
"
>> +=C2=A0=C2=A0=C2=A0 depends on FB && PPC && (!PPC_PSERIES || PCI)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on !DRM_OFDRM
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select APERTURE_HELPERS
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select FB_CFB_FILLRECT
>

