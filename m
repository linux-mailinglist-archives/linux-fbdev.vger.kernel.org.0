Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C42BFE247F
	for <lists+linux-fbdev@lfdr.de>; Wed, 23 Oct 2019 22:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733302AbfJWUVq (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 23 Oct 2019 16:21:46 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:54440 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389316AbfJWUVp (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 23 Oct 2019 16:21:45 -0400
Received: by mail-wm1-f42.google.com with SMTP id g7so303428wmk.4
        for <linux-fbdev@vger.kernel.org>; Wed, 23 Oct 2019 13:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JvlbyXuPyFTwAied7QnteSmnSAks0nnDSQo1KMTiaVE=;
        b=Xj42kaG68KB2VqgfIb5WaldkwjZPYh7u9UuIqn13LK273eVvgXA00Y6Cswp8d1l7qz
         T4/UEKKv7M1R1vyNyt7A7scnybyl1yjgaLmKbryMQECyRBLKXIo5TbE8jP6iPxa6Lsp1
         erAhoFjfmB25XdzGmrcYkhnwlrc9jd7YJADBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JvlbyXuPyFTwAied7QnteSmnSAks0nnDSQo1KMTiaVE=;
        b=U5zDvZp15DIoQqDUvSRSkCXyvc2oXC9S/B1ir5+BQeerA5s5DSqRtPhcDlmfLHagCk
         mFeYZxe3GIAzuKVcRJn/lPMOw+pGY2Q1YYsGDjg7Iw+c15QFxpc4KusYYBfPR6qGNoM1
         8LWjLBePl7nQGGD5bVxw0lDcsc0bhEJLScTEcyKuCCGcZNjNp4/MfMNdDK4Vp4aW3akH
         33Pu3c53vMbdMC8lhadfXuE4xxrj/ifqiLXCYmuNzvN6fSSU8sA+r1swHKRBDzym/iQK
         D3/edNIlUT5lzJOf+iU5ZdeeefiG1fyNCMvBZNoD1rpXq4ytILisR/5Piz+VqeX8MiWC
         vyKA==
X-Gm-Message-State: APjAAAVVToxO7QbLyCEawMl7U95mzJ3LXS+bZB8uPt8anjaNlqAs+63V
        WAOqUGVJTjTF9OHNQCOV4F8uXg==
X-Google-Smtp-Source: APXvYqx/TQ4n7MgqmhhUNyCHVlVoWUDwk6UPKxs7AhubFXQlhlXDfD+59nnAXt9e3Fhnux5l8ALyIw==
X-Received: by 2002:a7b:c011:: with SMTP id c17mr1570137wmb.95.1571862102054;
        Wed, 23 Oct 2019 13:21:42 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-115-54.cgn.fibianet.dk. [5.186.115.54])
        by smtp.gmail.com with ESMTPSA id v128sm365873wmb.14.2019.10.23.13.21.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2019 13:21:41 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] backlight: pwm_bl: fix cie1913 comments and
 constant
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
 <20191008120327.24208-2-linux@rasmusvillemoes.dk>
 <20191014072710.GE4545@dell>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <d716cb92-4d72-f661-2ef9-2771846569e8@rasmusvillemoes.dk>
Date:   Wed, 23 Oct 2019 22:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014072710.GE4545@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 14/10/2019 09.27, Lee Jones wrote:

> Applied, thanks.

I'm not seeing the series in next-20191023, should it be there?

Rasmus
