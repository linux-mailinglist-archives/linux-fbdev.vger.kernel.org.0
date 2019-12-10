Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 662C9119053
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Dec 2019 20:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbfLJTIO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 10 Dec 2019 14:08:14 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44094 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727638AbfLJTIO (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 10 Dec 2019 14:08:14 -0500
Received: by mail-lj1-f195.google.com with SMTP id c19so21076953lji.11
        for <linux-fbdev@vger.kernel.org>; Tue, 10 Dec 2019 11:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ulX543+9toeatXV1iMTIBBXIHYl2aF/n/HSQV4cdnE=;
        b=krMB+98HHl2ikMxCeSc8JFW1+AKXXIBqxKEUFRZdXCP1YR54Hhair5K6iNLFON53eI
         o5itHuP/xpP/CN2fL1fViuQ7rwaBkWy9TkqHT9/VbB/tqAE/MI6rLGgqzDqhRF4kKSD6
         5HszHqiAvyFUzJBYAGWF5IlNAtJaJ5DZDyQ9TBAy6MdUDUW9GQ6egnY4hozVT3cnyuii
         vWe9LQ5tBDqGquzggHj0MgMvZVY57t0Gx+myVxUW4VwgH0fQYr2g90QtCoT/ciZmoQpO
         ZirSJ4quZaQhbOCIAZZ+FoIBynxoLnBBtCLQKByczBguymQcECvGryJw8oqc1JRFPFT8
         WbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ulX543+9toeatXV1iMTIBBXIHYl2aF/n/HSQV4cdnE=;
        b=RBfJMJ79co1D/YPYIfmrAn2x+K+AFjOO3UeZvkdTIi7fmczOEAIyPPVanmxvFXN4zU
         2+DGedBglw2XUSc3r9kuzEdDcVCfpKiiH69FJAsx7pHJcI4lz+uVdVPZmXvIkhyh1EYu
         qrG/RBelVFTHGazOV3oKXmNqgHMM/HnJ9+G/OqnUKCGN2zUvr7SJApqe1w66qYa8zSTS
         msMqa7EAVb6/105TjPAXSr3rZ4BgifGYGZ/LetHPL1ryBDVqqQHfGfQIhk5nnU0Ro+Zi
         Pl3ziwyzG069OL/kV2LRBNV5+Cp+vOtbrFPbkQRpYNq/XYqfsUpCtnDw4rbwNY+/op4k
         7uLg==
X-Gm-Message-State: APjAAAXj0T7gKCL1vdADTywPxYjnPR+QWMKXpCOmZLXnpp1/xdSYpwa8
        rEVIWgS91mJPJpkIQD22WWaHHrigUagW1i2CqjgYQg==
X-Google-Smtp-Source: APXvYqwbAv2cElTyCaMQre9NPYKpWiyhQ0WKEV0u6pXHxn6mzg24fDBxfrswSCfVWucaAJwWg2+mx4KbDWo/BeBJe2k=
X-Received: by 2002:a2e:9b05:: with SMTP id u5mr21292120lji.59.1576004892742;
 Tue, 10 Dec 2019 11:08:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575390740.git.jani.nikula@intel.com> <31c18e3ce9d6962aabda4799b3051039ff591c92.1575390741.git.jani.nikula@intel.com>
 <87pngx4muv.fsf@intel.com>
In-Reply-To: <87pngx4muv.fsf@intel.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 10 Dec 2019 20:08:01 +0100
Message-ID: <CANiq72nPccKZghPM-FrNRnQ8AkN_r40cUmM3ruhyGtiTs_DdyQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] auxdisplay: constify fb ops
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Robin van der Gracht <robin@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Dec 9, 2019 at 3:04 PM Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Tue, 03 Dec 2019, Jani Nikula <jani.nikula@intel.com> wrote:
> > Now that the fbops member of struct fb_info is const, we can start
> > making the ops const as well.
> >
> > Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
> > Cc: Robin van der Gracht <robin@protonic.nl>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Reviewed-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> > Acked-by: Robin van der Gracht <robin@protonic.nl>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Miguel, Robin, just to err on the safe side, were you both okay with me
> merging this through drm-misc? Not very likely to conflict badly.

I think that is fine, go ahead! :)

Cheers,
Miguel
