Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6E1D6F59F
	for <lists+linux-fbdev@lfdr.de>; Sun, 21 Jul 2019 22:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbfGUUjA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 21 Jul 2019 16:39:00 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39500 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfGUUi7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 21 Jul 2019 16:38:59 -0400
Received: by mail-lj1-f194.google.com with SMTP id v18so35443606ljh.6
        for <linux-fbdev@vger.kernel.org>; Sun, 21 Jul 2019 13:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VFhbBpOoZTNy9EMhjzpqd/YuAOOhoH6s3ZbDQhN/5VM=;
        b=EYyAu5FNL7gKp0HuaHxd3VFhuw6OMNQ1ynqqj6BKsVxhnlAOQzaSgoqA2/t5l63YVC
         UK7L9wQH/n7peWeSk05TUKDMFY6v8Jwp73ku2LrkRQvdJHt7ULoCbcRQ5wDFhLLVzafi
         fWcVH07bkb/MP62sTSMXJXpR9LaasGZFbWyfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VFhbBpOoZTNy9EMhjzpqd/YuAOOhoH6s3ZbDQhN/5VM=;
        b=Lrn+ElVw/A4/bH1LyptLuvZY3BKEg0kRJAftDWA+aiJdzwE6EgQH1hDrjOzb+TLGTx
         WflJ32Cm757ZdnUqfUiun8tBm6AKf10cRv8PS3NOLQCxw7cywgGoVfo+SWWcTOfNh2qC
         wCibSfFzKK6wsbQoGdQAiWxb4ZHMn3UVgT47AYkNfKMJEPAN2Etcdfp2jD5IuEFTgoaY
         1lc8FGh6bOhHqjY7x9wFuRNGf3V0QJkBTkuX3zc3OT3Ep0tfktTTjgezWTODjcywfNna
         MMUYcoTd7aygLqXyeixufkc1S99EF/GfhfzCE5rVg5uzJnnyETx/UUxvCP+BDxAKAm06
         plmg==
X-Gm-Message-State: APjAAAWCaK3+6/18PW7CjYzbaHDKCLwADu2/02005D124lsqU42E0nZ7
        g0/arci93CdyjgNv12RZQY4l2onpeUY=
X-Google-Smtp-Source: APXvYqxzugf52kyuOSwfj5jDNVSJuDFyOpzh3Xw7GXrvioaXyvOgdYFEcYezuEICQ8eMsuptHEW2/w==
X-Received: by 2002:a2e:730d:: with SMTP id o13mr16350587ljc.81.1563741536876;
        Sun, 21 Jul 2019 13:38:56 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id j3sm5750523lfp.34.2019.07.21.13.38.55
        for <linux-fbdev@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 13:38:56 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id s19so25109648lfb.9
        for <linux-fbdev@vger.kernel.org>; Sun, 21 Jul 2019 13:38:55 -0700 (PDT)
X-Received: by 2002:ac2:5601:: with SMTP id v1mr30384046lfd.106.1563741535585;
 Sun, 21 Jul 2019 13:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190721201956.941-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190721201956.941-1-daniel.vetter@ffwll.ch>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 21 Jul 2019 13:38:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiaHB_0bS_x=p-xeyp7bW7bGgkZ9QkXe6SS9axu7OP95w@mail.gmail.com>
Message-ID: <CAHk-=wiaHB_0bS_x=p-xeyp7bW7bGgkZ9QkXe6SS9axu7OP95w@mail.gmail.com>
Subject: Re: [PATCH] fbdev: Ditch fb_edid_add_monspecs
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Tavis Ormandy <taviso@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sun, Jul 21, 2019 at 1:20 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> It's dead code ever since

Lovely. Ack.

               Linus
