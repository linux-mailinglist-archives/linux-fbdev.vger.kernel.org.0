Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365F2495C47
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Jan 2022 09:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378863AbiAUIqx (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 21 Jan 2022 03:46:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50747 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349514AbiAUIqx (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 21 Jan 2022 03:46:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642754812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8BhdL+2/fM2j9f1ZwOZXyG90SLRXQYh6XlmojCCWoc8=;
        b=LrLjOjkTXirS1WZ0isIMj/drweHEvxTxUn0qSpKhUcH5yScpzczW25XS2/YZOvELpDyFla
        1rJSwVKKNjtftWe0ontPpBVYDn04w9fyYSChIegpmtJkWzcEpfAMwFUV4qaDwKLQVBpXcC
        vgZkW7jpZny9AHr1Tjvu1qiNxqUwsPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-qmuLorQsOVOAKtDCsyaYRw-1; Fri, 21 Jan 2022 03:46:47 -0500
X-MC-Unique: qmuLorQsOVOAKtDCsyaYRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93A681083F6A;
        Fri, 21 Jan 2022 08:46:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 2556F1059112;
        Fri, 21 Jan 2022 08:46:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id A72A61800617; Thu, 20 Jan 2022 13:50:15 +0100 (CET)
Date:   Thu, 20 Jan 2022 13:50:15 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <20220120125015.sx5n7ziq3765rwyo@sirius.home.kraxel.org>
References: <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
 <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
 <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>
 <3f96f393-e59d-34ac-c98b-46180e2225cd@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f96f393-e59d-34ac-c98b-46180e2225cd@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

  Hi,

> What I still don't understand: why are you so keen on maintaining an
> interface that only serves the console? Nothing else uses fbdev these days.
> Why not improve DRM/userspace to the point where it fits your requirements?
> Long-term, the latter would make a lot more sense.

And note that it is *much* easier to write drm drivers these days.
We got alot of helpers, we got generic fbdev emulation and more.

If you are curious just compare the initial commit of the bochs drm
driver with the current code.  Initially the driver had to manage ttm
and fbdev and whatnot else.  These days writing a (non-accelerated) drm
driver is basically some boilerplate picking the helpers which work best
for your hardware, the code to actually program the hardware and that's
it.

The "new drivers should be drm" policy exists for years already btw,
exactly because of the unfixable fbdev API limitations.  The bochs drm
was a fbdev driver initially.  Never merged.  Got rewritten as drm
driver and that was merged instead.  In 2013, almost a decade ago.

And, yes, it very well might be that drm misses some piece here and
there for specific hardware, such as fbdev emulation not supporting
rgb332.  But I fully agree with Thomas here:  Improving drm is probably
a much better way to spend your time.  drm is where the development
happens.  fbdev is only kept alive.

take care,
  Gerd

