Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52DA910DAB4
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 22:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfK2VAC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 16:00:02 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37560 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfK2VAC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 16:00:02 -0500
Received: by mail-lf1-f65.google.com with SMTP id b20so23507673lfp.4
        for <linux-fbdev@vger.kernel.org>; Fri, 29 Nov 2019 13:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=73lCoPy2waKrGKmGeeI8t0QLjdkKSb0CKohb7acKBM8=;
        b=S58ovFgFsWdSAL50dRla4S0sz3zQZVQMxZxqxpGlJzlOif+iyCfdHvjcc+Awy6qaiG
         iHXOx7QJfgHGMPBIHKryEMakgNWg/8K3iMkelofPg7XJi10vwwD+RtI3fvpDKC+FuEjI
         09okw9bM12OJV0UxJEHDQslOz7AV+7qhcVdEw6DOG8PldJfshb9+Nq/rdVzen+W+/n75
         4fPqzL9D5UPzSVwwT7MxC9/S+3AAnW8EurYMUml98yUdnX7IfMIjCXFa2gKehIoDwzjo
         fw5Z4RsTCp9227rqnj5IrdmTctpny9Fg70/gl6/Ygcq6/2KMnPe+motlf6OIuNrkPI1J
         8+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=73lCoPy2waKrGKmGeeI8t0QLjdkKSb0CKohb7acKBM8=;
        b=rNqV+1+zLR6gJmqLtUeyxXKo80cPVH12fnFqvW1qtTCk5Jgg11hMn+qYCRGy5p5NqY
         yyOJkGZsdih+PRa1A+uFKO6ZGN16HwzaBButL5zTXqyCUEjSyLFOhxj8q1jSaYMbq1Wj
         cbooSi0NgHAiidDJrJqdwcCJJZLV/xAN2KHENG1unbuUht9wuX7X8ya8S0kkpbmf2VVd
         6uZmU5IUYi4bA96EsUwGAKxKo0LZxTidPSLiOT1WeUraGo8pCNnfvD/78szX58DvE9qo
         WU0KyBS0BLpv3RywGznw72ksPwL0utE7/DRmPIcO1ZQ13I+kXKijF63ayTywdZrQFEAd
         Ev7Q==
X-Gm-Message-State: APjAAAUTqHCRoYzUBYiNTIFoR8vZcsHXnUAjqL0y4e6co/h20UG0oOD6
        83qaj+aLfonLR6sg1caUfEaWAy3UzMYy3M78c/w=
X-Google-Smtp-Source: APXvYqwo59Ax0LxrlcCnL8gVkxVWG8m5joqaeUL4vjb5tPre3qFXF3Ap1ytwvo+z0YkgdiaYHGMF2ih91kj8iJBpxJc=
X-Received: by 2002:a19:8a41:: with SMTP id m62mr3506171lfd.66.1575061200278;
 Fri, 29 Nov 2019 13:00:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575022735.git.jani.nikula@intel.com> <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
 <20191129152424.GG624164@phenom.ffwll.local> <CANiq72kRGg1AZHC-pR_uKykMxmcMPM2+qbXVPVQhHrZRzu723Q@mail.gmail.com>
 <20191129203007.GV624164@phenom.ffwll.local>
In-Reply-To: <20191129203007.GV624164@phenom.ffwll.local>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 29 Nov 2019 21:59:49 +0100
Message-ID: <CANiq72mEseWduUkJ069E8m8XKuyctsxOsTEZAfGm9d81WzpGEQ@mail.gmail.com>
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

On Fri, Nov 29, 2019 at 9:30 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Well we do have very small lcd display drivers in drm, and before that in
> fbdev. And you have a fbdev framebuffer driver in there, which looks a bit
> misplaced ...
>
> Afaiui you also have some even tinier lcd drivers where you don't address
> pixels, but just directly upload text, and those obviously don't fit into
> drm/fbdev world. But anything where you can address pixels very much does.
> -Daniel

The first driver in the category used fb.h. At the time (~13 years
ago) it was decided that the drivers should go into a different
category/folder instead and then the other were added.

In any case, I am removing the original ones since I cannot test them
anymore and there are likely no user. The only other fb user could be
relocated if Robin agrees.

Cheers,
Miguel
