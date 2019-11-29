Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A767510DA8C
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 21:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfK2UXG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 15:23:06 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35884 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbfK2UXG (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 15:23:06 -0500
Received: by mail-lj1-f196.google.com with SMTP id k15so33197845lja.3
        for <linux-fbdev@vger.kernel.org>; Fri, 29 Nov 2019 12:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w/o9QO+OTkUrAkPVwBsYCrg637ZIGXxFSYV4h1auTC4=;
        b=ExFhuhuO77tprALZnWnoxuAuMwoBli1hlmu5MRh3UhlYOp7PzdT5rt43NAzdkr8GHE
         daSYq+gk8bGho/setUK82bknPqsvmiTPakI0KfK7nMC7eky6auHGNpIZR0TH+LA6Gywq
         FZnMX437qmDREPNg8LqK/dTEvWXYSSCC/Ttgp/DW0fdHIJG/Hegj7D5wsnmPWqqhkwLt
         39IjuCWzEgoqQitIE5KH+ETpxcRNQUr9ZePoAnuJwLWDKgTDWVdySb3Rl4hwQiK0vcEf
         +vDD6afQZ6WSqLEHunKNed6Eg7WrSgIrptUK4Sp9rts3Rmy2/8CpB3AiI+nTodTuvkRQ
         y7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w/o9QO+OTkUrAkPVwBsYCrg637ZIGXxFSYV4h1auTC4=;
        b=ciOEJOFuDnwb9Mk/ZeyCiY4eXcBg1NpEagHIMRQrqgTvCCPr7CmQeX6QU8KCPGpc/B
         xvP0zuH4tngunqd1nfZCoG6naoQ05EE0DU/dducZpHsmNunMUhLLTUFKuKRfDH3PQyKp
         GOTzQFtqBFMu5wkaGrTQwiK5XRCOFi55736uCgTIBvcmnzCIHE59BO8OQolpgqnLcNu/
         ODz/3QlpIlDdxEvtQ4iGngfUkiuLD/a6BKfewVXTTYEYQdn2dxP5Meu4QZAhlg3Z9H4P
         GhWXUUSaQxut0FL/rvKgG/gpGxMUnkjsyLU1H9sSL6riLmJAe47eSfM2eU2GPnJbUj4j
         I9aA==
X-Gm-Message-State: APjAAAVRK1lGEcKDYtBCDRlquFNbigPN/2ALeW4Qk5seQUd8GnQz4uHw
        JrAkEuN8Wyw+1R/BeWe3QWfq+ubvMNfNQKO2bNY=
X-Google-Smtp-Source: APXvYqyRZ1DbVGmEx2KN+XiIKlg0OpG3Nc9KVZrQtWxEa5MzDbC8oykauTyr6y696hArjznX5aIEaeF8QZMFbtpQbCE=
X-Received: by 2002:a2e:8601:: with SMTP id a1mr9634352lji.179.1575058613233;
 Fri, 29 Nov 2019 12:16:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575022735.git.jani.nikula@intel.com> <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
 <20191129152424.GG624164@phenom.ffwll.local>
In-Reply-To: <20191129152424.GG624164@phenom.ffwll.local>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 29 Nov 2019 21:16:42 +0100
Message-ID: <CANiq72kRGg1AZHC-pR_uKykMxmcMPM2+qbXVPVQhHrZRzu723Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] auxdisplay: constify fb ops
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Robin van der Gracht <robin@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Nov 29, 2019 at 4:24 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Oh, another display subsystem? Intriguing ...
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

It is intended for displays that are not intended as the usual/main
display, e.g. very small LCDs :)

Reviewed-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel
