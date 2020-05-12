Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 376BE1CFF73
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2020 22:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgELUhd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 12 May 2020 16:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725938AbgELUhd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 12 May 2020 16:37:33 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20DCC061A0C
        for <linux-fbdev@vger.kernel.org>; Tue, 12 May 2020 13:37:32 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id o10so12180429ejn.10
        for <linux-fbdev@vger.kernel.org>; Tue, 12 May 2020 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jYQEAuUQnSg+v1ttGfiZb8SDzgSY76tkwg99lKAYA1o=;
        b=puGfmWv2878U1TNuA3a5h/Ar2E6eK+6hYzj631avqu9TCjS3gLdqi8OipBpn+KGARh
         xDXx/GlaGEWNpKNA7jx5WPDQVWX1jTJP0lCPWozyU0CwhrXMfVkOpX7mqzdZmWAvGVTl
         j/rMRNSQkS5Ptx4k4TrvSgGUn+2Pth9hfGzlryMF5IvgQjTF7Z4hOUp7awyKybpZbJnk
         upltwjbjDYeb/d4zL5g1XjlpLIzUwoA/2TXXH86bli/rs1XVoX9+uiH5YYfUEyJdtViE
         HKPbFRLnENopMrDArlB76egicfrxqKT4cRobUwOe9UriHl6j5pMp5Xvm/nfiBDH6GKVn
         +FVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jYQEAuUQnSg+v1ttGfiZb8SDzgSY76tkwg99lKAYA1o=;
        b=f74pUQbjuHmYxwrnAWyP1zBMbNlCitxmKOuZ3YtaMAJcPtcfu2gfcIwU0xw1o4TFVp
         QsQuDx+fJqUHqJGtVz+85Ga/2F0f/h+kca8YlPTV8U+D7yiZ0ROnvsvnfKw9gbr/1QJv
         hfLma+LWBgOHlMT2Oqoom87HMqsYZ4qGW6JhuA5rUl27hdYUzJOh5snFNhSZdPtuI8iD
         RBQ2Dtb61Jf17T47JWfC8rNgNXwJfq9yvNqP/SEZiWMH3dcJuiY27GLy1Z96A0L5MEAI
         bUCZe8OIeJGvkZtEUlX5N7Dm4yNTqGRCdZGWp6A6MuFQQ/wQAzJ9mVVusgiCQ+quEQgR
         OOqg==
X-Gm-Message-State: AGi0PuaHfxyO33zTHmkzDX1+VBzDpBWyvQ6OW9YuNqvOpYGVs+63UWPg
        v4SmYnfDYcAcpZoUKVY3a6TDwKGm0SVD2g9if1I=
X-Google-Smtp-Source: APiQypLNXyxruaZbn3NigoMkTL9u6xSnEye0bL2EgLsLsCxFGb2EG4i9qcXm6bIXY66t7FklQKJSqspoeR3+BJa/5gA=
X-Received: by 2002:a17:906:860a:: with SMTP id o10mr11902510ejx.250.1589315851552;
 Tue, 12 May 2020 13:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <45B8BCE9-2156-4248-8102-58736D02752D@gmail.com> <CAPM=9tx1ASp3ubnyRWk-zM0ppyW-pWE=o4jHAxOkT9oGU+Yx-g@mail.gmail.com>
In-Reply-To: <CAPM=9tx1ASp3ubnyRWk-zM0ppyW-pWE=o4jHAxOkT9oGU+Yx-g@mail.gmail.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Wed, 13 May 2020 06:37:19 +1000
Message-ID: <CAPM=9tyhjUEYcsU6Ab7Cmw8KDd9NVtgMg8J3WpULS=L8o7XcRQ@mail.gmail.com>
Subject: Re: bug: kernel bug when unbinding EFI framebuffer
To:     Fabian Mastenbroek <mail.fabian.m@gmail.com>
Cc:     Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, 13 May 2020 at 06:03, Dave Airlie <airlied@gmail.com> wrote:
>
> On Sat, 2 May 2020 at 22:36, Fabian Mastenbroek <mail.fabian.m@gmail.com> wrote:
> >
> > Hi,
> >
> > When I try to unbind the EFI framebuffer via:
> >
> >         echo -n efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind
>
> Can I ask why?
>
> nouveau kicks the efifb off the hw, and unregisters it, but when you
> unbind it it tries to unregister again.
>
> It might be possible to block this, but not sure of the point, efifb
> is a built-in, you can't unload the module to save memory.


diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 65491ae74808..87405545a903 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -598,7 +598,8 @@ static int efifb_remove(struct platform_device *pdev)
 {
        struct fb_info *info = platform_get_drvdata(pdev);

-       unregister_framebuffer(info);
+       if (info->dev)
+               unregister_framebuffer(info);
        sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
        framebuffer_release(info);

something like that (applied by hand, this is just pasted out into
gmail so won't apply), might stop the oops.

Dave.
>
> Dave.
