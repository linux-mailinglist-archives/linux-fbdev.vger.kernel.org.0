Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3759C89889
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Aug 2019 10:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbfHLIQp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 12 Aug 2019 04:16:45 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45059 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbfHLIQp (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 12 Aug 2019 04:16:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id q12so13508373wrj.12
        for <linux-fbdev@vger.kernel.org>; Mon, 12 Aug 2019 01:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=MJHxBxh/Q5vo+W76uNGRUJUeN3hwDfWxfMg6P/gBOg0=;
        b=u4QlkRbMDiHfGrjdu436aHZusopdsD94AaT6zXTM3eaZ4y6BosUM0tlaA56X51nN9c
         umI3PH27REA1YdEm/bDm3OE2UI9MGULdMLuGUTvnDBKUBlM+u5BgwEJXKd1SByIuWkrY
         2kv99VeKU+V5QXG9oieP77x7yQgoExIDYXx4vPH8vlEru6HzZ6/p32cpzzObsHy5W3az
         O2VbXSjzdwyFpNJYin4w9mGvGx4NIQqGMocgiLaaq7HHG8qkJjXvIxiD9mAgo53+VJlh
         LCcGJbAa2s5qZg9/JZfFsSRo/t/+spxSIJYxDJW7Gfq3OorZb4uOTIjODwyWsHDkDNXd
         LmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=MJHxBxh/Q5vo+W76uNGRUJUeN3hwDfWxfMg6P/gBOg0=;
        b=TcgNQyttsRn7sX1FD/2F6lleazC9f53vnzhm70RDn2Y/1AHeXEm0YI0zsDNXD/GbSX
         PKNjmESCuH3nwwoxQFiewhUcab37Bz/ch2V3yxVodcXvAttwf5mauOR3KIW2xwscK9/u
         CU7MJLI6pluWmAS8zNixc7bIeFs5mgxUu76QB7I9fRVZBNWOmTu+MaCUXR7FdGTfLs9v
         DnQWJnhIP10o0Umb+gumnJ5GEuf83Jp3oQcyrSncZxIfBcOvyyJdZqgyMWvc4KPsgS7k
         qgBHRln5aQFivwttuJEe//rK5jjYLE7pttovUJkZxUH1UNcFHDBYa3ztbqgmVKXPATkL
         ceAg==
X-Gm-Message-State: APjAAAX/vA6+FM6XQwUTRn782oNtvHyFyYfoWPgGqSh45KwG51FD7lxB
        qrkzkEDZSgJMgG/smfw9YFjvqQ==
X-Google-Smtp-Source: APXvYqyD6fPKryZQTpN9zsdwGV7yS5BKNQZ8tOEeMIPGi0uW8Qmgi+HgiANiv0VmQSgyzgbueGKdzg==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr40515082wrn.240.1565597802765;
        Mon, 12 Aug 2019 01:16:42 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id g15sm16420028wrp.29.2019.08.12.01.16.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 01:16:42 -0700 (PDT)
Date:   Mon, 12 Aug 2019 09:16:40 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Sebastian Reichel <sre@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
        Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH 10/11] mfd: Drop obsolete JZ4740 driver
Message-ID: <20190812081640.GA26727@dell>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-11-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190725220215.460-11-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 25 Jul 2019, Paul Cercueil wrote:

> It has been replaced with the ingenic-iio driver for the ADC.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> ---
>  drivers/mfd/Kconfig      |   9 --
>  drivers/mfd/Makefile     |   1 -
>  drivers/mfd/jz4740-adc.c | 324 ---------------------------------------
>  3 files changed, 334 deletions(-)
>  delete mode 100644 drivers/mfd/jz4740-adc.c

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
