Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F60B491F5D
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jan 2022 07:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240311AbiARG37 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jan 2022 01:29:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56090 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237146AbiARG36 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jan 2022 01:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642487397;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4voKZfkYmTkuPFikw5510IhxZ7xDtu2XpXxuxBs11nM=;
        b=gL6y9l2Mqok8tM4sUh8bqem1+8jtWgrgzSgP5JUxY6+1AVIHcE9p1vjGavUQBKTFGJW8zy
        J60aZ7C8SYPaN6z/22ZCKGHxZ6NWF6GuRQiVThexjMlWvAuGRi1c1qBHKcXdMtba7Fkwan
        8++Pj+9LLhBJrtWMmzE93dXXBtIy4Fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-4MAYQJGZNoeDM-ORoQibMQ-1; Tue, 18 Jan 2022 01:29:54 -0500
X-MC-Unique: 4MAYQJGZNoeDM-ORoQibMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AA741927803;
        Tue, 18 Jan 2022 06:29:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DCBF5DBB9;
        Tue, 18 Jan 2022 06:29:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 1206B18000A6; Tue, 18 Jan 2022 07:29:47 +0100 (CET)
Date:   Tue, 18 Jan 2022 07:29:47 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Helge Deller <deller@gmx.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

  Hi,

> Please correct me if I'm wrong, but text-console emulation/scrolling on DRM is
> currently unaccelerated and bound to Truecolour modes only,

Yes.  Adding support for formats beside argb8888 to the drm fbcon
emulation shouldn't be that much of a problem though.

Acceleration is harder.  The scroll acceleration had issues nobody
addressed for years, and on modern hardware it is simply not used, which
is probably the reason nobody stepped up fixing things and it ended up
being dropped.  Bringing it back is much more work than just reverting
the commits removing it.

Also note that using a shadow framebuffer allows to decouple fbcon
updates and scanout framebuffer updates.  Can be used to speed up
things without depending on the 2d blitter.

take care,
  Gerd

