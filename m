Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E90600719
	for <lists+linux-fbdev@lfdr.de>; Mon, 17 Oct 2022 08:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbiJQG40 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-fbdev@lfdr.de>); Mon, 17 Oct 2022 02:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbiJQG4O (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 17 Oct 2022 02:56:14 -0400
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BFDDA2036F
        for <linux-fbdev@vger.kernel.org>; Sun, 16 Oct 2022 23:55:40 -0700 (PDT)
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 29H6i57k008119;
        Mon, 17 Oct 2022 01:44:06 -0500
Message-ID: <365fe5029716e589eaef71ababf27a459348f9ff.camel@kernel.crashing.org>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Javier Martinez Canillas <javierm@redhat.com>,
        Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
        Maxime Ripard <maxime@cerno.tech>, sam@ravnborg.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        mark.cave-ayland@ilande.co.uk, linux-fbdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Date:   Mon, 17 Oct 2022 17:44:05 +1100
In-Reply-To: <de796dba-1e75-e5a8-a908-f0aed4e01fec@redhat.com>
References: <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
         <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
         <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
         <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
         <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
         <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
         <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
         <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
         <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
         <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
         <20221012142707.GD28810@kitsune.suse.cz>
         <de796dba-1e75-e5a8-a908-f0aed4e01fec@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 2022-10-13 at 09:39 +0200, Javier Martinez Canillas wrote:
> > In absence of such test results I think the most reasonable thing is to
> > keep the logic that nobody complained about for 10+ years.
> > 
> 
> I agree with Michal and Thomas on this. I don't see a strong reason to not
> use the same heuristic that the offb fbdev driver has been doing for this.
> 
> Otherwise if this turns out to be needed, it will cause a regression for a
> user that switches to this driver instead. Specially since both fbdev and
> DRM drivers match against the same "display" OF compatible string.

I agree.

In the end, what it boils down to is, we don't know, we should guess. The
endianness of the kernel is as good a guess as anything here.

If not that, then assume BE.

That code was originally written for old macs. Those could simply not boot
anything other than a BE kernel. OF would always setup a 8bpp fb (so endianness
is irrelevant) but BootX could setup something else.

There's almost no old LE powerpc system out there, and I'm reasonably sure
actually none of any relevance to this code.

That leaves us with newer systems capable of endian switching. Those should just
get the property added.

I don't know of many cases out there. There' SLOS on powerpc which still won't
set it (which is what qemu uses). That could just be fixed. In the meantime
it makes sense for the kernel to follow its existing behaviour.

Cheers,
Ben.
