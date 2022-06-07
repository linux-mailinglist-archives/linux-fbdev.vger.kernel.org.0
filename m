Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 953835335B0
	for <lists+linux-fbdev@lfdr.de>; Wed, 25 May 2022 05:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbiEYDYN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 24 May 2022 23:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbiEYDYM (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 24 May 2022 23:24:12 -0400
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D1839644C4
        for <linux-fbdev@vger.kernel.org>; Tue, 24 May 2022 20:24:11 -0700 (PDT)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24P3FVYw012347;
        Tue, 24 May 2022 22:15:32 -0500
Message-ID: <ede15a37b9e854a50c9d67b890bdebb25642a003.camel@kernel.crashing.org>
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
        maxime@cerno.tech, sam@ravnborg.org, msuchanek@suse.de,
        mpe@ellerman.id.au, paulus@samba.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Date:   Wed, 25 May 2022 13:15:31 +1000
In-Reply-To: <8cd53439-46f1-117c-7aae-7630a6466ab8@suse.de>
References: <20220518183006.14548-1-tzimmermann@suse.de>
         <20220518183006.14548-3-tzimmermann@suse.de>
         <84a550c3-dcef-17ac-0ae5-666cdf0fb67e@redhat.com>
         <8cd53439-46f1-117c-7aae-7630a6466ab8@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sun, 2022-05-22 at 21:35 +0200, Thomas Zimmermann wrote:
> > Interesting. Did you find some formats that were not supported ?
> 
> We still don't support XRGB1555. If the native buffer uses this format, 
> we'd have no conversion helper. In this case, we rely on userspace/fbcon 
> to use the native format exclusively.  (BTW, I asked one of my coworkers 
> to implement XRGB1555 to make her familiar with DRM. That's why I 
> haven't sent a patch yet.)
> 

Various old macs do 1555 ...

Cheers,
Ben.

