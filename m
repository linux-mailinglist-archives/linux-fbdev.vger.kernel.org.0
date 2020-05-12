Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA591CFEE1
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2020 22:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731046AbgELUDv (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 12 May 2020 16:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELUDv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 12 May 2020 16:03:51 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DB3C061A0C
        for <linux-fbdev@vger.kernel.org>; Tue, 12 May 2020 13:03:51 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id d16so12178665edq.7
        for <linux-fbdev@vger.kernel.org>; Tue, 12 May 2020 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WCdWoeDeJ1UNS0sfIbe24Pe8mpZNfa6qYa9IX9kVqpg=;
        b=lnquW373BTVPLBtkvBmdWVRu3ZzdVRVPgPIfVPfQGdYwz45vCTJP/TzavrpKkc/QAb
         I7f0ANEzh4wC4/kvbjfBw6YXXGlH4XXimvxsjm10LkCClqU5Nz2qFPEnWpctO+c+g5tm
         qYLxbLm4NSdzAvrwloovbHlm0WvhD5G/SHV1TAJHKEuHcnbLYw0Euef5U1AeqbaU8L2d
         FpLfrrvTDBT/XnewvbhDkw/Va3T9v9I18M+DtgM6KOeGpo708XuWSsAfigbw5nm7YPmR
         jirrxfVy9SeQxHPM8dEUpR5+fCcE3JyYLMiUsT+v2cdKlLfhHHqc0iSzunpyrgfC0ER3
         5vUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WCdWoeDeJ1UNS0sfIbe24Pe8mpZNfa6qYa9IX9kVqpg=;
        b=qidywcMU93droSGMNjlcj8gDO+dkvcnHeLRD9wBLe/iuT1d0WD+4Xg7tiLK+KcuEM9
         SqLVRCl+PLlGwrXocBQ8qS6oybZnb2J9a0Jel26kJDlM0SHI5CTFHy/dN0j9RjHuUfFc
         xFQM6Kd29vH7cycTgHFIWswiBemuiSsIbZS0VhV1MciH0pv+egcWXRZgCrDuHo1qvW+/
         4ZFkMhXMgpijFdiMCw3ntAfsQFWqXx49MHcWUx6e9u+h9nJC2sBxIuBn0LXpKfERnOKt
         08rsyC6Ale6EXoaabIpQUld+Pc2d7Sb5Yw2tvshUDfGsv7ADBJUdtP0Bvwwta2FyGgE0
         miLg==
X-Gm-Message-State: AGi0PuYQhGwc+mcXfbRMwrdVc0mCjHzFqxznQngavzBbyDZ/8VhJ2A0Z
        8zFSOVui1sez6dYkw67mQGxlU0PFnN0B/tb7P1g=
X-Google-Smtp-Source: APiQypKvTz7RjEbRC7fqmB26xIGKoN3aec5LDrU4tg3ySurD6MSrpLo6KpZgXe/1BYaE09wWsbhh2IjcSq6ZkksTLaw=
X-Received: by 2002:aa7:dac4:: with SMTP id x4mr18800074eds.127.1589313829827;
 Tue, 12 May 2020 13:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <45B8BCE9-2156-4248-8102-58736D02752D@gmail.com>
In-Reply-To: <45B8BCE9-2156-4248-8102-58736D02752D@gmail.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Wed, 13 May 2020 06:03:38 +1000
Message-ID: <CAPM=9tx1ASp3ubnyRWk-zM0ppyW-pWE=o4jHAxOkT9oGU+Yx-g@mail.gmail.com>
Subject: Re: bug: kernel bug when unbinding EFI framebuffer
To:     Fabian Mastenbroek <mail.fabian.m@gmail.com>
Cc:     Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sat, 2 May 2020 at 22:36, Fabian Mastenbroek <mail.fabian.m@gmail.com> wrote:
>
> Hi,
>
> When I try to unbind the EFI framebuffer via:
>
>         echo -n efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

Can I ask why?

nouveau kicks the efifb off the hw, and unregisters it, but when you
unbind it it tries to unregister again.

It might be possible to block this, but not sure of the point, efifb
is a built-in, you can't unload the module to save memory.

Dave.
