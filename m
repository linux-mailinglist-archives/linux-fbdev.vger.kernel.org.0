Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28380132A60
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jan 2020 16:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgAGPsA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Jan 2020 10:48:00 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36956 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728236AbgAGPsA (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Jan 2020 10:48:00 -0500
Received: by mail-wr1-f67.google.com with SMTP id w15so41905452wru.4
        for <linux-fbdev@vger.kernel.org>; Tue, 07 Jan 2020 07:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=AKH9iM1/iG8zWx2xNV+zLPV8iovcpOyyXJoSIxqdbRk=;
        b=VcnYI9AkDcSpvZxqfakPF0VUIvVs6cdZjxpLiY4QgG7rkRNj1VtVjcVLvPw+ALUCoo
         gzKrXcOFdzaWRY7NS4FOUS6Sk3iQfoxdSNFA/KyV+fKOHLMQUaEIUttgA/eyGEqPGN4E
         ONMSnAN3TjRTrvBXa+e9K9twu69SAs/P43wss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=AKH9iM1/iG8zWx2xNV+zLPV8iovcpOyyXJoSIxqdbRk=;
        b=dOJfj57fMxDylFK6xroeUMvC7Zkru/R22wJaLZQ+RzrYBXq6Mwc6Xr9AozXDrhuDSb
         CeMyKjVnI++gYW6KAqslosdj150GxRjF1FDcjjvh/bMKfzUhRcNE4GjVv9yT05tuDwQP
         E3jiujYETiibBXvXlTJdH/NWRmbQODwCWjaiYjhd6942IkqLoZIjAMD2XRqZq+1f0p+w
         8DHQb/7JFJaZVRJRI7uxdESuPADk72Z5dETfMYhcdMdQEUlYAprxdke0W4TkAUGlkO9q
         j+UUiJ9BMFhMwPgh8KVjeR6kIo2dAqyGWXyx58B++YL9zPjBpHlRUf0W5Qh/7vG0/kLi
         n1oA==
X-Gm-Message-State: APjAAAW3N7+KT45gTkboWvRI1iFpXzbOLPJZdFUE8167+cQrZWvGPshY
        9eFd1/uwMlzqNRvVSS2sRB2yHA==
X-Google-Smtp-Source: APXvYqzD68uooO7ZcoDZN1tshuC4uGYDnvSgRZJxqX3p24va63g3pm/AWE8wq12cU/IU5J8Nos3Kbw==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr109349448wro.202.1578412078158;
        Tue, 07 Jan 2020 07:47:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
        by smtp.gmail.com with ESMTPSA id z187sm39236wme.16.2020.01.07.07.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 07:47:57 -0800 (PST)
Date:   Tue, 7 Jan 2020 16:47:55 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     syzbot <syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com>
Cc:     Rex.Zhu@amd.com, airlied@linux.ie, alexander.deucher@amd.com,
        amd-gfx@lists.freedesktop.org, b.zolnierkie@samsung.com,
        christian.koenig@amd.com, daniel.vetter@ffwll.ch,
        david1.zhou@amd.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, sam@ravnborg.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: INFO: task hung in fb_release
Message-ID: <20200107154755.GB43062@phenom.ffwll.local>
Mail-Followup-To: syzbot <syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com>,
        Rex.Zhu@amd.com, airlied@linux.ie, alexander.deucher@amd.com,
        amd-gfx@lists.freedesktop.org, b.zolnierkie@samsung.com,
        christian.koenig@amd.com, david1.zhou@amd.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        sam@ravnborg.org, syzkaller-bugs@googlegroups.com
References: <00000000000082b80f059a56da1f@google.com>
 <0000000000002074ef059a5c86e2@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000002074ef059a5c86e2@google.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Dec 23, 2019 at 02:31:01AM -0800, syzbot wrote:
> syzbot has bisected this bug to:
> 
> commit e3933f26b657c341055443103bad331f4537b113
> Author: Rex Zhu <Rex.Zhu@amd.com>
> Date:   Tue Jan 16 10:35:15 2018 +0000
> 
>     drm/amd/pp: Add edit/commit/show OD clock/voltage support in sysfs

Pretty sure you don't even have that driver loaded ... from the config:

# CONFIG_DRM_AMDGPU is not set

:-)

Cheers, Daniel
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12b5a799e00000
> start commit:   c6017471 Merge tag 'xfs-5.5-fixes-2' of git://git.kernel.o..
> git tree:       upstream
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=11b5a799e00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=16b5a799e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7f6119e2e3675a73
> dashboard link: https://syzkaller.appspot.com/bug?extid=d130c4a0890561cfac5b
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169b1925e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b9623ee00000
> 
> Reported-by: syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com
> Fixes: e3933f26b657 ("drm/amd/pp: Add edit/commit/show OD clock/voltage
> support in sysfs")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
