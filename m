Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515175FC506
	for <lists+linux-fbdev@lfdr.de>; Wed, 12 Oct 2022 14:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiJLMIk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 12 Oct 2022 08:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbiJLMIK (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 12 Oct 2022 08:08:10 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4EBC4C31
        for <linux-fbdev@vger.kernel.org>; Wed, 12 Oct 2022 05:07:54 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 6AA791F381;
        Wed, 12 Oct 2022 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1665576433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FLCPJxzJ0YYg2ZOgvIOSJ8Odau36xhYM3uJca/JYmTM=;
        b=aWK/GoG2/0N0MOrwxh+/O+NkFUqsPj6bfy5yFCLcAwu+RgOePf0jIIImImg3Y1z8Lq+jHr
        Al6xFtCJq6TsFtHU2tv2HjYcuG5ZZZCptGMC4NAnKqXEdevp5mz3Bbmt74HeMXbrunIpAx
        vIv2jeSVjZtVPFlwENubImIy2xQiStI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1665576433;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FLCPJxzJ0YYg2ZOgvIOSJ8Odau36xhYM3uJca/JYmTM=;
        b=EUwrAEdomB1XMZtAb3Yak1TjM5uFoJg8tDEwZcbhsHvzbyH78mVYjePQByhRCfQyASeXAt
        qc/d/WVFS1IFuUDw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 312582C141;
        Wed, 12 Oct 2022 12:07:11 +0000 (UTC)
Date:   Wed, 12 Oct 2022 14:07:09 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
        Maxime Ripard <maxime@cerno.tech>, sam@ravnborg.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        benh@kernel.crashing.org, Paul Mackerras <paulus@samba.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        mark.cave-ayland@ilande.co.uk, linux-fbdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Message-ID: <20221012120709.GC28810@kitsune.suse.cz>
References: <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
 <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Oct 12, 2022 at 10:38:29AM +0200, Arnd Bergmann wrote:
> On Wed, Oct 12, 2022, at 10:27 AM, Thomas Zimmermann wrote:
> > Am 12.10.22 um 09:44 schrieb Arnd Bergmann:
> >> On Wed, Oct 12, 2022, at 9:40 AM, Thomas Zimmermann wrote:
> >>> Am 12.10.22 um 09:17 schrieb Arnd Bergmann:
> >>>> On Wed, Oct 12, 2022, at 8:46 AM, Thomas Zimmermann wrote:
> >>>
> >>>> Does qemu mark the device has having a particular endianess then, or
> >>>> does it switch the layout of the framebuffer to match what the CPU
> >>>> does?
> >>>
> >>> The latter. On neither architecture does qemu expose this flag. The
> >>> default endianess corresponds to the host.
> >> 
> >> "host" as in the machine that qemu runs on, or the machine that is
> >> being emulated? I suppose it would be broken either way, but in the
> >> latter case, we could get away with detecting that the machine is
> >> running under qemu.
> >
> > Sorry, my mistake. I meant "guest": the endianess of the framebuffer 
> > corresponds to the endianess of the emulated machine.  Given that many 
> > graphics cards support LE and BE modes, I assume that this behavior 
> > mimics real-hardware systems.
> 
> Not really: While the hardware may be able to switch between
> the modes, something has to actively set some hardware registers up
> that way, but the offb/ofdrm driver has no interface for interacting
> with that register, and the bootloader or firmware code that knows
> about the register has no information about what kernel it will
> eventually run. This is a bit architecture dependent, as e.g. on
> MIPS, a bi-endian hardware platform has to run a bootloader with the
> same endianness as the kernel, but on arm and powerpc the bootloader
> is usually fixed and the kernel switches to its configured endianness
> in the first few instructions after it gets entered.

But then the firmware knows that the kernel can switch endian and the
endian information should be provided. And maybe that should be emulated
better by qemu. Unfortunately, modern Power servers rarely come with a
graphics card so it's hard to test on real hardware.

Thanks

Michal
