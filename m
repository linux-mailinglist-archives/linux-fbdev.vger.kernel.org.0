Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4E25814F
	for <lists+linux-fbdev@lfdr.de>; Thu, 27 Jun 2019 13:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbfF0LSf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 27 Jun 2019 07:18:35 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45068 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfF0LSf (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 27 Jun 2019 07:18:35 -0400
Received: by mail-lj1-f193.google.com with SMTP id m23so1896131lje.12
        for <linux-fbdev@vger.kernel.org>; Thu, 27 Jun 2019 04:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8n9+wAZmn5Fd4Bzu+75sf62mEboo0TEMxpHy4S/JDDc=;
        b=cEL9oCZ+zomWJ2LmSGc4fuxflwhDPejxyVo6c+Rrs/G5ajtyDASQo492gEPQbHBHeC
         kq2jja8VgsqeyP+QTo5k9C1iud716f33VVhYiaF0S1ifrCTPqGBA3agxt3h4qp8PogBb
         HAjqSFBfrIo3Brf1SoGU3Lrycq3Z/djnv+/ohRmtMo8JSvOptyWZ4wR2DbecRgcyamsL
         sAkedb2FQ4o9w3DtYSfbMDvQNMVvQ36osCybYA/9i+32Df7OcVRSOfvO1IubOE+6SGOy
         pCkSz7JgrJFkWpR8mCBCB7y10iOSH5pbaz+CXHodmK0K3BaNNWlRFQbn954OwIf5nzV0
         hYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8n9+wAZmn5Fd4Bzu+75sf62mEboo0TEMxpHy4S/JDDc=;
        b=qMtiQwCfdLn2jAW7+J559s/9n2jzVBXHXAOqeK1BW70iAVKOWkX0rS3zHTAxTfo8Te
         PYQu9jUo8bGb5wrkZKwTlwREKIsOzNAQPLvzDvTkHL13XwOKaQM4LFC6thKaKr6XVyNx
         Zzm6EjfjuCrohh4+SSaEylESX5L5mXfB9GABMeLzr4qOL4ZgDDxut/nWXycs3vYQZRB0
         Ao/NFnvtP4qwraPvidF2RtcJ9WA+WQIsdiMNTpLPjOaeohVA7rtgSImXJ2d775NWpTY5
         KbCM7HezKrK4jdfOLDUX3PzIBIcamPBzCEycdftbat98UGRWTLoQXA1qs0vCQbTHUhFa
         H0qA==
X-Gm-Message-State: APjAAAUc9LSXt9QR9Hb0VsNnU6cnzxMcQdkzGCLZitugLWmHt55Hk7Dz
        uasMhEhHT5etU/Zok1ZvRqEUsTAVGKk+mwRXPngMRA==
X-Google-Smtp-Source: APXvYqyJgd2+Ftd/iJyvgwExAYZa4Qg2yTKy4cVImG+ErCp4ffuDePBsvOgPaNQqma8bvu1LdZ28/ackt3s9WUPQPiw=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr2275133ljs.54.1561634312954;
 Thu, 27 Jun 2019 04:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190625163434.13620-1-brgl@bgdev.pl> <20190625163434.13620-9-brgl@bgdev.pl>
In-Reply-To: <20190625163434.13620-9-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Jun 2019 12:18:21 +0100
Message-ID: <CACRpkdanZPmKrRwY9nvEGx=BzoVFxzU7ENgvoOzH+0u=-YTC0A@mail.gmail.com>
Subject: Re: [PATCH 08/12] ARM: davinci: da850-evm: switch to using a fixed
 regulator for lcdc
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Jun 25, 2019 at 5:35 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Now that the da8xx fbdev driver supports power control with an actual
> regulator, switch to using a fixed power supply for da850-evm.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
