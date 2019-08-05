Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDDC815EC
	for <lists+linux-fbdev@lfdr.de>; Mon,  5 Aug 2019 11:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfHEJxT (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 5 Aug 2019 05:53:19 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34185 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbfHEJxS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 5 Aug 2019 05:53:18 -0400
Received: by mail-lf1-f68.google.com with SMTP id b29so50188549lfq.1
        for <linux-fbdev@vger.kernel.org>; Mon, 05 Aug 2019 02:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yhFhmYD1XCmoTjeTnvzGsODetc1XqqaQE8oBpm4W4vQ=;
        b=K0B7/O1SMz4RHGXSXodAVa9L8sFoa6UoXKns2dJR1JyKOU2c6furolEA7Q5allCkl0
         hz3utRt5xZzsleYc5j96GSG5SHJEN9qRmcnlBwZ5Hbwn+fft/iuWyPYdhkJXD/m3jjk7
         jrqz4dcI6wnABAMB/2cejuK/mx5zUZuzGuS867Iji3hw8OpOMM0EX1haB0kh4NotBmOv
         TnrXt+nPzDsghutAkYvsNt/760Kmcu8ed+WXy1lumUgqOtf+HKx+P7IjgQ1X5X3F7qkT
         B41DImoEkIRtZUYYGgcCoKd1jS/rYluUTw2JPsGDWnr8wMsUgYyBHWgFNW3+ViFzuyiM
         iwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yhFhmYD1XCmoTjeTnvzGsODetc1XqqaQE8oBpm4W4vQ=;
        b=rXKbhV0vwy63OIstFidb1ERrEhQt7ZizBQbT3fH9NS6nhkz0rRIlbkKAwf6j4Oz+De
         AOUXFrUy35lm55KCHscjuueqRM/H8Kmns5rEwzIGdudxbFimVPIBC4aILDiYEQwlxw/i
         ICqAqO8Rd6l2bMEyAlZ78JvJeelQo8JuSac8iLo4outMWBvhmKwNrraVOBMVDkxGPHPG
         d76mKi8urtCdMYBJ/QfEjIoI5wTAD+NvcuqsH1qfT3WAodZufYXw+ecWdd8EV19rO665
         DkNTTHqhqjHEf+sbBxw8H++6F+b08pQO0EKR2nZQ+rSy+2eljF/c/RykfjMk3aoA8rr5
         RgGA==
X-Gm-Message-State: APjAAAXDbSjEPRm8PVhcURP0rvScCi3USZatZwrJxgUo4QNUg0UKHgPw
        3w/NrSqP1BnVf0C9CKJU4QvDsFh18MPIUxbaOdfX8w==
X-Google-Smtp-Source: APXvYqznj+OyBQxOK0qX1ZGixNtwr50nmLElXsC7qnFS3oH2+cAja/iMhd5ozIzmb9vouUkDfKjemRMc1Gv/14GZ9L0=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr1288145lfq.152.1564998796491;
 Mon, 05 Aug 2019 02:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150302.29526-1-brgl@bgdev.pl> <20190722150302.29526-2-brgl@bgdev.pl>
In-Reply-To: <20190722150302.29526-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:53:04 +0200
Message-ID: <CACRpkdYexsXR=n+t1iVb1QMZc9U1FeKdyHy3w4VnfPy4B=xeiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] sh: ecovec24: add additional properties to the
 backlight device
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-sh@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jul 22, 2019 at 5:03 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Add a GPIO lookup entry and a device property for GPIO backlight to the
> board file. Tie them to the platform device which is now registered using
> platform_device_register_full() because of the properties. These changes
> are inactive now but will be used once the gpio backlight driver is
> modified.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Clever! I must also use these dynamic properties now.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
