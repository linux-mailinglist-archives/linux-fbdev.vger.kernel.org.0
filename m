Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A5E49CAAF
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Jan 2022 14:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238908AbiAZNXF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 26 Jan 2022 08:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238944AbiAZNXF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 26 Jan 2022 08:23:05 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BD9C06173B
        for <linux-fbdev@vger.kernel.org>; Wed, 26 Jan 2022 05:23:04 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id c6so71304824ybk.3
        for <linux-fbdev@vger.kernel.org>; Wed, 26 Jan 2022 05:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jPuiYEcG4FnWkIuFPqkRcRVpvVkaLhzeqgzV7xKH14Q=;
        b=ewLZjb/kz8m2HtjYdnAVs0d6LZQx+WTZt+orOV0l8nTnUgSVQ0eUfPjPKOuGXOprqH
         q+nkNGxOfOEWLG/1cFI1B3cNzRFe08HtHDclQ92/sVafT+mn5HrRKJ214D/lJNSExvNy
         TYDj8iR0Buo4hq3h/SksMeQeDptCb1a8BBpGIQqqYeWdCCQKSGP4sWEZlNzwcqj9Rvyw
         /LahDA5l0TYjKmCykL/i86UddMiaPtnHjEUtQpSI9ONIGFC3a0yBAmWCkgTc9AR7WIfe
         SOjSbumt1c9aEDI92MdG5iUhzjYt0LSSBXSmWbhfsBnJLgJfBKou1pKtJBiAZcyJtBOm
         D7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jPuiYEcG4FnWkIuFPqkRcRVpvVkaLhzeqgzV7xKH14Q=;
        b=PcefonfqV8wTrBQ3JQ31fhhMuxKeTeJDaAij5ELYOBjcxCS0Y7yZlCgPLnNOuactLa
         qc+7lWfMgFG7wYJKKW3ERuFHfRbifSE9gUjZx+tqtQ9BWb4tMta7RbQ4323GdBw1q6cj
         ILMYzpMklaMs0zYQJMeSnQdoFrP1fT2TlYuBZvVjQfbnoWSK05ntLAEqpCFIo3touKu0
         +lTcbyd2wOB/M7AMvf5GH6Qby8+W9PID7eCUNpWNHNDbl5KN/7q4PZfkA15o63tUWWUx
         JV9HoF+faSjUwdNMSN0MCEhLlLCBZgumTeiEARkEQwQxvXon2bRus+mTlOZkzjhm+Nfa
         qsQQ==
X-Gm-Message-State: AOAM533gyua2NSEsHuyU4nmJSjKFLGQ359WTd3oM3D6Sdtc0eQZzBgQY
        6rfLPWkZwOOVHknXrmxvsndqpoWzG5s08DIcuh5kBw==
X-Google-Smtp-Source: ABdhPJxxCbMVJG9gHaE8ZKo4BsT/wUzC0M9V+d+2hU/nFLU0sy/IPS0viii6yaS4V+oGBlN/XPYsea0s2HkXU8/+GU8=
X-Received: by 2002:a05:6902:b:: with SMTP id l11mr33020891ybh.376.1643203384097;
 Wed, 26 Jan 2022 05:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com> <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <YfFHa3ayE9wtil9Q@smile.fi.intel.com>
In-Reply-To: <YfFHa3ayE9wtil9Q@smile.fi.intel.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Wed, 26 Jan 2022 13:22:52 +0000
Message-ID: <CAPj87rPMOP6W0u5y3FNfpGXHqPbMyLn4JThMY_6+AZLiy0UD5g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Phillip Potter <phil@philpotter.co.uk>,
        Carlis <zhangxuezhi1@yulong.com>,
        Lee Jones <lee.jones@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

On Wed, 26 Jan 2022 at 13:08, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> It's not useful to bury the /dev/fbX out for the devices that
> the use of are black-and-white output on small embedded systems.

It's not useful to decide that such systems should only be supported
by a subsystem which has been deprecated for a long time and which has
little userspace support. It's also not useful to spend time working
on that subsystem, rather than the one everyone has agreed on for the
last 15 years, is supported by userspace, is expressive, and has a
kernel subsystem which isn't a forest of CVEs and broken locking.

Cheers,
Daniel
