Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41F914D2D39
	for <lists+linux-fbdev@lfdr.de>; Wed,  9 Mar 2022 11:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbiCIKlK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 9 Mar 2022 05:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbiCIKlK (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 9 Mar 2022 05:41:10 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83C05FE3
        for <linux-fbdev@vger.kernel.org>; Wed,  9 Mar 2022 02:40:10 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id s15so1466311qtk.10
        for <linux-fbdev@vger.kernel.org>; Wed, 09 Mar 2022 02:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6DrAJtOqN7GdwM4Pk9v4ngdziJV9PvRnIvi0h8uX290=;
        b=AdgjnWxr6BqOJgQgQPAKdxhD9NPzms0PWSixfeChVypgL2JY8sXhFBLsIfNyU6iWUZ
         tvt8qCkzXx4wK0cD7149gUGF4fHI5AgX32G7ohIbxwVFdEJU8UzMNEUD/Sn1H5JKBUT6
         PY61+jYQa+cIQN+r56YYyBHNSp/ItBtUdzN5hI+IL+67dpCLbrBowmgmVSce1xyqBUxX
         z7QwsbeOOxLXAUM7RrpJ5T1K0tXfETkeamdVRqsIzna8FAYvQR9fDzPmeSURK9D1ZpHo
         LNx8VQINd0qoXqNDdt+sFDfl5KaGb1a0I4I2xF8qgcyAELxXwsj+v/MK64bSaddFJ9c+
         4ZNw==
X-Gm-Message-State: AOAM533ycSgkadakZIzztOeOpR2FF/Dux/v3ryP/bTegq2hYtpYVNJya
        TfOJp1vm/0gB28oezCsIh989m+/xZ+qeQg==
X-Google-Smtp-Source: ABdhPJyw21eUByviZ5dkYcBz1WGwFnSYL8xuBCyjE+ztryefMmQk+mIm1tHYeTRuhvUIZXBHwEjxdQ==
X-Received: by 2002:ac8:5911:0:b0:2e0:5a1f:9ac7 with SMTP id 17-20020ac85911000000b002e05a1f9ac7mr16542407qty.170.1646822409550;
        Wed, 09 Mar 2022 02:40:09 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id c16-20020a05622a059000b002dc93dc92d1sm1060098qtb.48.2022.03.09.02.40.08
        for <linux-fbdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 02:40:08 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2db2add4516so17999987b3.1
        for <linux-fbdev@vger.kernel.org>; Wed, 09 Mar 2022 02:40:08 -0800 (PST)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr16062763ywi.449.1646822408061; Wed, 09
 Mar 2022 02:40:08 -0800 (PST)
MIME-Version: 1.0
References: <20220223193804.18636-5-tzimmermann@suse.de> <CGME20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141@eucas1p1.samsung.com>
 <21110de8-d52a-e55e-8853-1f073c4ab969@samsung.com> <a7c8ee6c-185e-916c-c92a-d3b3f4fd9135@suse.de>
 <f318d57d-ef9e-295a-6865-eb0377a9bd07@samsung.com>
In-Reply-To: <f318d57d-ef9e-295a-6865-eb0377a9bd07@samsung.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Mar 2022 11:39:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU4w-68-V2QXqbJqorL3iQFyBSRkGTrz5ePFRRUC8mRzw@mail.gmail.com>
Message-ID: <CAMuHMdU4w-68-V2QXqbJqorL3iQFyBSRkGTrz5ePFRRUC8mRzw@mail.gmail.com>
Subject: Re: [v3,4/5] fbdev: Improve performance of cfb_imageblit()
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Marek,

On Wed, Mar 9, 2022 at 10:22 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> On 09.03.2022 09:22, Thomas Zimmermann wrote:
> > Am 08.03.22 um 23:52 schrieb Marek Szyprowski:
> >> On 23.02.2022 20:38, Thomas Zimmermann wrote:
> >>> Improve the performance of cfb_imageblit() by manually unrolling
> >>> the inner blitting loop and moving some invariants out. The compiler
> >>> failed to do this automatically. This change keeps cfb_imageblit()
> >>> in sync with sys_imagebit().
> >>>
> >>> A microbenchmark measures the average number of CPU cycles
> >>> for cfb_imageblit() after a stabilizing period of a few minutes
> >>> (i7-4790, FullHD, simpledrm, kernel with debugging).
> >>>
> >>> cfb_imageblit(), new: 15724 cycles
> >>> cfb_imageblit(): old: 30566 cycles
> >>>
> >>> In the optimized case, cfb_imageblit() is now ~2x faster than before.
> >>>
> >>> v3:
> >>>     * fix commit description (Pekka)
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> >>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> >> This patch landed recently in linux next-20220308 as commit 0d03011894d2
> >> ("fbdev: Improve performance of cfb_imageblit()"). Sadly it causes a
> >> freeze after DRM and emulated fbdev initialization on various Samsung
> >> Exynos ARM 32bit based boards. This happens when kernel is compiled from
> >> exynos_defconfig. Surprisingly when kernel is compiled from
> >> multi_v7_defconfig all those boards boot fine, so this is a matter of
> >> one of the debugging options enabled in the exynos_defconfig. I will try
> >> to analyze this further and share the results. Reverting $subject on top
> >> of next-20220308 fixes the boot issue.
> >
> > Thanks for reporting. I don't have the hardware to reproduce it and
> > there's no obvious difference to the original version. It's supposed
> > to be the same algorithm with a different implementation. Unless you
> > can figure out the issue, we can also revert the patch easily.
>
> I've played a bit with .config options and found that the issue is
> caused by the compiled-in fonts used for the framebuffer. For some
> reasons (so far unknown to me), exynos_defconfig has the following odd
> setup:
>
> CONFIG_FONT_SUPPORT=y
> CONFIG_FONTS=y
> # CONFIG_FONT_8x8 is not set
> # CONFIG_FONT_8x16 is not set
> # CONFIG_FONT_6x11 is not set
> CONFIG_FONT_7x14=y
> # CONFIG_FONT_PEARL_8x8 is not set
> # CONFIG_FONT_ACORN_8x8 is not set
> # CONFIG_FONT_MINI_4x6 is not set
> # CONFIG_FONT_6x10 is not set
> # CONFIG_FONT_10x18 is not set
> # CONFIG_FONT_SUN8x16 is not set
> # CONFIG_FONT_SUN12x22 is not set
> # CONFIG_FONT_TER16x32 is not set
> # CONFIG_FONT_6x8 is not set
>
> Such setup causes a freeze during framebuffer initialization (or just
> after it got registered). I've reproduced this even on Raspberry Pi 3B
> with multi_v7_defconfig and changed fonts configuration (this also
> required to disable vivid driver, which forces 8x16 font), where I got
> the following panic:
>
> simple-framebuffer 3eace000.framebuffer: framebuffer at 0x3eace000,
> 0x12c000 bytes
> simple-framebuffer 3eace000.framebuffer: format=a8r8g8b8,
> mode=640x480x32, linelength=2560
> 8<--- cut here ---
> Unable to handle kernel paging request at virtual address f0aac000

So support for images with offsets or widths that are not a multiple
of 8 got broken in cfb_imageblit(). Oops...

BTW, the various drawing routines used to set a bitmask indicating
which alignments were supported (see blit_x), but most of them no
longer do, presumably because all alignments are now supported
(since ca. 20 years?).
So you can (temporarily) work around this by filling in blit_x,
preventing the use of the 7x14 font.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
