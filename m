Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFCF4209D3
	for <lists+linux-fbdev@lfdr.de>; Thu, 16 May 2019 16:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbfEPOdw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 16 May 2019 10:33:52 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:45827 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfEPOdw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 16 May 2019 10:33:52 -0400
Received: by mail-vs1-f68.google.com with SMTP id o10so2432331vsp.12
        for <linux-fbdev@vger.kernel.org>; Thu, 16 May 2019 07:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Slihxl2vu/lw+Vj+9GO27pAncTe7JgO+/vPnKvGqTt8=;
        b=Ghn75J3Co0KxA2b5jTdw6yCasByag3Z39dlHvc4zpnAQW5ELWKtzYWbRx30MVgK0vY
         39SKMsNTld+SiWoOwA7PHrakGigIJLdO9DrBnTK4Ro0BveORY/iCTv/h+6b69VBU/eY0
         0ZjgsXFk4Pazkr9zrZ2GPFbyuzMBgro+tH+4t8KW9XiIqVSaZWlOoQQxM3r7xgb2QY4u
         3wItr4vDuCbamwCiitHkcqgREFXNUpIw89LXxA2UKg0tTYy5R2M7PhZgUow9tppPVRcS
         4xZlTf6hXkk2rmanupvhEx53ka2o1Q97AswdidlR6Ezw8aQQ6SN58yQsj0ocMZ5hgNtc
         /wTA==
X-Gm-Message-State: APjAAAUWsTgyRGmZ5dlKmAUiyHqnUwimhCNHVbLh+eBizanSSs9D5tb0
        mleIWLyPFWNoU/vuRdGvGA4VHY4/0Rt38ixrLVfmSA==
X-Google-Smtp-Source: APXvYqxgqHqxcis3VM15isZ2If1AqbFf6DmtSnzpBQfJ72a0QbaXliUxxUP1ClUcF+wulx/rfEPw3PiWRRatfC9Ox+g=
X-Received: by 2002:a67:f309:: with SMTP id p9mr22751634vsf.216.1558017231720;
 Thu, 16 May 2019 07:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190426145946.26537-1-ghalat@redhat.com>
In-Reply-To: <20190426145946.26537-1-ghalat@redhat.com>
From:   Grzegorz Halat <ghalat@redhat.com>
Date:   Thu, 16 May 2019 16:33:40 +0200
Message-ID: <CAKbGCscqbvOaXPTdmxatNLBygdu=WC0hVUKx0_WnqUR4+dj_zQ@mail.gmail.com>
Subject: Re: [PATCH] vt/fbcon: deinitialize resources in visual_init() after
 failed memory allocation
To:     linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Oleksandr Natalenko <oleksandr@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 26 Apr 2019 at 16:59, Grzegorz Halat <ghalat@redhat.com> wrote:
>
> After memory allocation failure vc_allocate() doesn't clean up data
> which has been initialized in visual_init(). In case of fbcon this
> leads to divide-by-0 in fbcon_init() on next open of the same tty.

Hi,
A gentle reminder. Could you please review my patch? I've seen two
crashes caused by this bug.

--
Grzegorz Halat
