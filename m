Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD0629969
	for <lists+linux-fbdev@lfdr.de>; Fri, 24 May 2019 15:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403843AbfEXNwn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 24 May 2019 09:52:43 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:42580 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403911AbfEXNwn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 24 May 2019 09:52:43 -0400
Received: by mail-vs1-f65.google.com with SMTP id z11so5794798vsq.9
        for <linux-fbdev@vger.kernel.org>; Fri, 24 May 2019 06:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9wkXuNyY+BPK06cBRjiKGUSp8g87URqk4aYlZC7CDaI=;
        b=lBk9405FfSBENqL0d+lWThIqR4p8kn47ZtCYp+lp5n7ndq0ILZtaiwJLZM+FFxMIuu
         KUq9tSofChDPG7A/uePhSaXs3zxv6OFQ5kHbsZXBvnpBOvm3CbXWu8cOIf71vrgi3vFb
         0vsl+UcPlXtNehn4bb9x93uXmFdPn0/xcYfkKXCOrlG+nJD1zE0SjpSULayAR4lPtCqU
         CK5iNt4bB+eSoSPs8hx5nlsISZR5Cd5ftuBh8IKueKxAd4QHSHq9kIJMgUIOm9FmwoP4
         ybF/cVRJlaqcBbTSPGDtI6BWnBmGV+QPw44G6VFTBXVnJ8eCiInRt9yaWCVHyQVnUeZW
         o+Xw==
X-Gm-Message-State: APjAAAXHWEQCJ16WrCKIMYRy6u+mj4UJFab/Vg+VTNhxxv0MFU1ozDet
        t5enghqE4thXlGnd8nAqtFf2oAKU6W7JwOXS38a18w==
X-Google-Smtp-Source: APXvYqx1BviKXWBNCPF7WMrnr2OOPxRTRziJl0o1SV5/wIzq8V4kIAVRBFQjsqx2jPhgYz332/R9XIBBbBq9E8AWYS8=
X-Received: by 2002:a67:f309:: with SMTP id p9mr50802170vsf.216.1558705962670;
 Fri, 24 May 2019 06:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190426145946.26537-1-ghalat@redhat.com> <CAKbGCscqbvOaXPTdmxatNLBygdu=WC0hVUKx0_WnqUR4+dj_zQ@mail.gmail.com>
 <20190524080602.GA19514@kroah.com>
In-Reply-To: <20190524080602.GA19514@kroah.com>
From:   Grzegorz Halat <ghalat@redhat.com>
Date:   Fri, 24 May 2019 15:52:31 +0200
Message-ID: <CAKbGCscp6gLFEuu+xn24KM6Gy=x=pW9bnJGF_2CY3jzbnyV5_g@mail.gmail.com>
Subject: Re: [PATCH] vt/fbcon: deinitialize resources in visual_init() after
 failed memory allocation
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jiri Slaby <jslaby@suse.com>,
        Oleksandr Natalenko <oleksandr@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 24 May 2019 at 10:06, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> How?  How are you triggering a memory allocation failure in a "normal"
> system?
> Anyway, I'll queue this up, but it really does not seem like anything
> anyone would see "in the wild"

I've seen this crash twice in ours customer environment under low
memory conditions.
There is a report in Debian bug tracker:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=804443
and LKML bug report:
https://lkml.org/lkml/2017/12/18/591

--
Grzegorz
