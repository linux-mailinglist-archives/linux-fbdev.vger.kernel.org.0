Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEAE4B76B4
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Feb 2022 21:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244115AbiBOUgu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 15 Feb 2022 15:36:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244104AbiBOUgu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 15 Feb 2022 15:36:50 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3755AD7637
        for <linux-fbdev@vger.kernel.org>; Tue, 15 Feb 2022 12:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644957393;
        bh=JFXCWCKql48UNlTh7Yst5igG5l8PdTcvllupvHIlkNA=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=j9lrOoPnHZXVsdTdCi9OVS5FbdwKCtwVruTCv8Alqiy5wqaK18XGmIvbK6n/BocvI
         oAwYofjeK9RyiRakWr68RudAwa0XJmu6PxylS1s8Q5nv6byMmW6sQvKq7NOO06amWR
         y5peN6jpnuRY0qgYX9/5/U42q//O5f0fi1I44nF4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.185.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1nuVm11o7g-00h94m; Tue, 15
 Feb 2022 21:36:33 +0100
Message-ID: <e29f650b-0362-3210-0cff-3d60289268c3@gmx.de>
Date:   Tue, 15 Feb 2022 21:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3] video: fbdev: atari: Miscellaneous fixes
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-m68k@vger.kernel.org
References: <20220215112126.2633383-1-geert@linux-m68k.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220215112126.2633383-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5i5oc5VahLUo0RFxymkaRjsyilZSwth5e50lwxXduUyW3UQjhFa
 3ZEpcayUb7tQe7k4Yh9AgWly6Q3aZZfYYiaoapOmO0lTlOp5BiLWOGOL0UwtFclaBSpOvc2
 odmGs/+JvT6vDHk8tNOAF5en4d9U0eXKW5jkeZrRG60/a7V2gAtdcNLRvzZ2DYAg7c69KvM
 cA8aNWgm2j6IcI4G85dbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CXeNC8zAOnA=:1B2E38jQGiVxnF5HYzG4vS
 SVk31Kpj9x4nyR6MqQzvhvZqR782uJseyGL/EbTh6di6uerl2N83isFF7GvgPwkGuGveB9Upj
 ltTWsGUjebl84jMSHEhf1j+/jnUz4JWBGLkCfqOy3SE+erlmavcvp0NAVvgFF5bf6F91S+fxw
 nC2O7e6xw7g397+8euGHpsVDEkwNIriaTGKC2jbVOCw4YAUgtMEnbj4zqHz0ijt6HRgZ9J+Tw
 NMaRg42+X4ZlH5Pj2v75NiBEQKJXbZSKP7b4mfg4KumiqIE9Eo9ZYNj+QmBtu53U69lOPJnz6
 pgZFgqsI5fDe7DFsZgE/XFQtd/0lhs/xJZ9mnyhizDYgEvzhqzSfLApu32BUZNKjFVejarBPZ
 z7rLbYU5ZCcBZdtFDWvcgpsYv1ktORIalv6F2ZfrcyqOIP7vevJT17n30weUX+4OsHMljaU6l
 1HRKjBKnb9FdioPQGSmKqaVziHWRBU+mFsmvVVEGhfNCGpJ1ctHnarq308yEJoZZH9G8ivyaF
 tw9CyvaPzYdCKcVWzU0zAO3CbZUKBYT0GmKUmL5ARD2fNcTEIeLS/X0S9+WJBabS2GVXXGhkB
 wDFT5Q1vmpcYIq0dC2f/y2iYR1J7JD2EUGc2e0Vr4jL5NIc5FAfakBhVH8TvYy3oez30j14Dz
 jpfOAaoJ9oA39n2bK6IRSMfoER0QxsjwdcuDFZhRslrOBGkJRCDQp3H0b3qKfkM1b/i+stKhk
 eibMgFshQfFc012hEYDHgKzUvbI76rEvXjGCORJziTMggGkLIVjdWJsqubu8MUwKLV3HKTfID
 NCtCIS6+vgQxrw3vo/HYNaBO6cnau+PA/opJhY8wMqr7bk4EKLdyVcVgb1Hew6ekyUIkR6c3+
 sTKOsoP8t/Zz4gokxxdZBwHZOSwxMkDHuBthojJj1gOYFtNPBGilqEFYlRhlHyKBss18Fz64x
 OeXVkEpX4/f1XyMtFZwwfUTI6UHMmDiyMQws09szDDXUGRUBBC/9vtunPHau6nwgJ4cXlOUwn
 L6PQLI+GaL57s9yjMT6YH0KCKKv0zOarMsxi2dQF3hal20e1v7xxWcHI2nSAGw5PfNfIGLR4F
 9i2vsC1ehm3n4w=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Geert,

On 2/15/22 12:21, Geert Uytterhoeven wrote:
> This is a small series of miscellaneous fixes for the Atari frame buffer
> device driver.
>
> The first patch has been sent before, and is untested, as I have no
> access to the hardware.
> The other patches have been tested on ARAnyM.
>
> Thanks!
>
> Geert Uytterhoeven (3):
>   video: fbdev: atari: Fix TT High video mode
>   video: fbdev: atari: Convert to standard round_up() helper
>   video: fbdev: atari: Remove unused atafb_setcolreg()
>
>  drivers/video/fbdev/atafb.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)

I've applied all 3 patches to the fbdev for-next tree.

Thank you!

Helge
