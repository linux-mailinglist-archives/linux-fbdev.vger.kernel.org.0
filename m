Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D07403CDE6
	for <lists+linux-fbdev@lfdr.de>; Tue, 11 Jun 2019 16:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389807AbfFKOEx (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 11 Jun 2019 10:04:53 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38513 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387778AbfFKOEx (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 11 Jun 2019 10:04:53 -0400
Received: by mail-io1-f65.google.com with SMTP id k13so9969848iop.5
        for <linux-fbdev@vger.kernel.org>; Tue, 11 Jun 2019 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lqiV0H/q9eXS4pPY8ifFtwx91fWhcQXdqFfEPZLTdQo=;
        b=eUtJcz7kMzQNsi51loJSdWD05S0bHEOKf0PxE6aQVntLz281nYy3TJ4EMAOxtpDVL3
         ndf7w5pBzShfAa7NyLIFwXXxOZWNlu8Gyin4oHHZVQsyvb1NnMZxn7CpdITj22zG/IfO
         DCjEqgWRNJMD8DTcAz+GhzuIg+AM8obANPmWyQcSpGUCv+zEroQph640p+cLh/JhS+T1
         Mn4qb9KYmNG8bCplBuq3our6DHBmM9pgKINJ26OzUgcKsg2RPI/mEd5dpqGcxj8ujyIb
         Sn5Ycs32hcDG9W1cK/EjKfa2ql+YFQa+tjjH6Emyt2/nrrDsekbpe3/c5LedxtR9eI84
         ANQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lqiV0H/q9eXS4pPY8ifFtwx91fWhcQXdqFfEPZLTdQo=;
        b=HjmnhQIJxpVHwvw1tK7t+xKnm3dvxE6itsA8Vdcv/epp/V3RQBJDufMEaQK3bUHz57
         wl0utFwv7fN2HPLonoSnA3QNvf+6PkhIlEuMr1TBCTedCNvII+FWKCFqxXSHINu6mxAn
         mGnWx9IAXW/VsAj2yHPDDlSe64jBAyaModbHFnaVCqRHZ3fZ5tNnpv+8lG/2AZ4o0IIV
         J9ooXk/ewuoiU4Y2rDCZIglLnP05EvPa/7MzVoIJ1hhQx448VPkSgwmS4G+zF2UIuL24
         FrJLRTP+EOZrncPHqAeLiC9B98mov5+mVx+cv7vqLDVv7CXnqPM//gUPPPr4gXBITtyz
         0Mlw==
X-Gm-Message-State: APjAAAV7Y8Y0lAoIO44iGRaJIQ7bqKQOrZD+Oqdiws9H9NlG7qTp6N05
        u+0x8tIX+DVpM+OmJnXS0yF2PI/3tjj2gPdAgg2BCg==
X-Google-Smtp-Source: APXvYqw3LRmAkOB3ftFk4yMEDVpReE2Imm5Cqt58r31GxBysK1n5qJ/Bi+jXKdTRBFe/XTjFGtBUaC60P2Pgde1TZs4=
X-Received: by 2002:a5d:9d83:: with SMTP id 3mr41608629ion.65.1560261888654;
 Tue, 11 Jun 2019 07:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190529154635.2659-1-hdegoede@redhat.com> <CAKv+Gu8bLcDROFNFfqHaN1Z+EK5bnXMNDSJbBK-pCmq5XP_kBw@mail.gmail.com>
In-Reply-To: <CAKv+Gu8bLcDROFNFfqHaN1Z+EK5bnXMNDSJbBK-pCmq5XP_kBw@mail.gmail.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Tue, 11 Jun 2019 16:04:35 +0200
Message-ID: <CAKv+Gu8w2Vj-AS-cfaB8cms+ZJ7qppS-Du_334_xm51rz0CYsA@mail.gmail.com>
Subject: Re: [PATCH] efifb: BGRT: Add check for new BGRT status field rotation bits
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Peter Jones <pjones@redhat.com>,
        linux-efi <linux-efi@vger.kernel.org>,
        "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 10 Jun 2019 at 17:12, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Wed, 29 May 2019 at 17:46, Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Starting with ACPI 6.2 bits 1 and 2 of the BGRT status field are no longer
> > reserved. These bits are now used to indicate if the image needs to be
> > rotated before being displayed.
> >
> > The efifb code does not support rotating the image before copying it to
> > the screen.
> >
> > This commit adds a check for these new bits and if they are set leaves the
> > fb contents as is instead of trying to use the un-rotated BGRT image.
> >
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>
> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>

BTW should we make sure that this patch and the efi-bgrt patch get
merged at the same time? I guess the net result is just that we get
rid of some error in the log, but a rotated BMP will be ignored
otherwise. Or is it relevant for userland in some other way?
