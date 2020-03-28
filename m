Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 982BF19675B
	for <lists+linux-fbdev@lfdr.de>; Sat, 28 Mar 2020 17:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgC1Qbq (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 28 Mar 2020 12:31:46 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43900 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbgC1Qbq (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 28 Mar 2020 12:31:46 -0400
Received: by mail-ot1-f68.google.com with SMTP id a6so13216108otb.10
        for <linux-fbdev@vger.kernel.org>; Sat, 28 Mar 2020 09:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tepq1jSwDCN89tryT39lGx5t8RvfKo7KJYe9WreZN8E=;
        b=Godxthakoj8WDjgl/1xUDzE5sUEkmS4LTviBbCzV6Ma0iDh5GdRhECpcZTGY2Edk7W
         +klahkVThDTocA6UalroXBd3d/s1yNbA1MoKTHR6rFBKeI3CDoSMNENbizT8hyxv+Zk7
         JFJYO5cqHODkH5KbjguHKYz6RZCBCYW+cVUwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tepq1jSwDCN89tryT39lGx5t8RvfKo7KJYe9WreZN8E=;
        b=Me+T0vxbyQhT5mtrtvxO3o1BTZDC1XoIKvbFzLyH49+MjeUaLpUEHpkibTbLSnnsz5
         JVhfWR3FJajvG+ARsyeyZVoVQ2j6WbO1WDBUdDFYkxq5wenoaNGmTa7GZchg4c350g0w
         +VWf4C/5Is+jLbLWV3kQol63Dn36RhOOK/mrSwxxlIjX0Dx9B8gvmUE9FueWuxeCxhgJ
         GrJ15/zxLxr5kmgEz/0UGWsIBFZiadqTil0uyjq85BOV1J3T6wKc7e1SZQG0/61w5zVN
         inA8soqGO2tlt0zkl2EX2Qi9wn4Dm0gRfZB8VhyWILK3Oq2s82AfCUAEAECNAR66G4me
         TSoQ==
X-Gm-Message-State: ANhLgQ3Ir0/XZwqCtkf8/ZRiN3mS2kRGon7JWEjJrhKfhAese84ZTycA
        Gyp2PrkPg/x5cjfYMcC8shGp+aqtPFl5qbg6gLBarg==
X-Google-Smtp-Source: ADFU+vv7GkRqQqz0012YOeCZDSoBlbR6P9EsoxOSUlc+Q4oxoxo4uNEE60PtSV0CuFZ8fdglQmV2e/lzTkJgpD6++Zg=
X-Received: by 2002:a9d:7696:: with SMTP id j22mr3344521otl.188.1585413105299;
 Sat, 28 Mar 2020 09:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200328151511.22932-1-hqjagain@gmail.com>
In-Reply-To: <20200328151511.22932-1-hqjagain@gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Sat, 28 Mar 2020 17:31:34 +0100
Message-ID: <CAKMK7uF2mipUSr-XRESrRJ8JdOZCekNTCVsDPW5hNp-mWwPj6Q@mail.gmail.com>
Subject: Re: [PATCH] fbcon: fix null-ptr-deref in fbcon_switch
To:     Qiujun Huang <hqjagain@gmail.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        ghalat@redhat.com, dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sat, Mar 28, 2020 at 4:15 PM Qiujun Huang <hqjagain@gmail.com> wrote:
> Add check for vc_cons[logo_shown].d, as it can be released by
> vt_ioctl(VT_DISALLOCATE).

Can you pls link to the syzbot report and distill the essence of the
crash/issue here in the commit message? As-is a bit unclear what's
going on. Patch itself looks correct.

Thanks, Daniel

> Reported-by: syzbot+732528bae351682f1f27@syzkaller.appspotmail.com
> Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> ---
>  drivers/video/fbdev/core/fbcon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index bb6ae995c2e5..7ee0f7b55829 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2254,7 +2254,7 @@ static int fbcon_switch(struct vc_data *vc)
>                 fbcon_update_softback(vc);
>         }
>
> -       if (logo_shown >= 0) {
> +       if (logo_shown >= 0 && vc_cons_allocated(logo_shown)) {
>                 struct vc_data *conp2 = vc_cons[logo_shown].d;
>
>                 if (conp2->vc_top == logo_lines
> @@ -2852,7 +2852,7 @@ static void fbcon_scrolldelta(struct vc_data *vc, int lines)
>                         return;
>                 if (vc->vc_mode != KD_TEXT || !lines)
>                         return;
> -               if (logo_shown >= 0) {
> +               if (logo_shown >= 0 && vc_cons_allocated(logo_shown)) {
>                         struct vc_data *conp2 = vc_cons[logo_shown].d;
>
>                         if (conp2->vc_top == logo_lines
> --
> 2.17.1
>


--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
